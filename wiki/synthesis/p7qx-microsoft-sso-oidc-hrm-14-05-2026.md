---
type: tong-hop
code: p7qx
tags:
  - "sso"
  - "oidc"
  - "oauth2"
  - "identity-server"
  - "microsoft"
  - "azure-ad"
  - "system"
created: 2026-05-14
updated: 2026-05-14
description: "Tổng hợp toàn cảnh Microsoft SSO + OIDC cho HRM: luồng 17 bước Authorization Code Flow, internal SSO qua IdentityServer, và mở rộng web thứ 3 (WordPress)."
sources-wiki:
  - "wiki/sources/SSO-HRM-Protocols"
  - "wiki/sources/Daily-2024-SSO-Auth"
related:
  - "[[wiki/sources/SSO-HRM-Protocols]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/sources/HongNgoc-DanhGia-SSO]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# Microsoft SSO & OIDC — Toàn Cảnh HRM

## Document History

| Ngày | Phiên bản | Mô tả | Người tạo |
|------|-----------|-------|-----------|
| 14/05/2026 | 1.0.0 | Tạo tài liệu từ session thảo luận | Tung.Ly |

---

## Nội dung – Content

- [1. Giới thiệu tài liệu](#1-giới-thiệu-tài-liệu)
  - [1.1 Mục tiêu tài liệu](#11-mục-tiêu-tài-liệu)
  - [1.2 Từ viết tắt](#12-từ-viết-tắt)
- [2. Bức tranh toàn cảnh](#2-bức-tranh-toàn-cảnh)
- [3. Các điểm cốt lõi](#3-các-điểm-cốt-lõi)
  - [3.1 Authorization Code Flow — 5 giai đoạn](#31-authorization-code-flow--5-giai-đoạn)
  - [3.2 Internal SSO — Cookie Session là chìa khóa](#32-internal-sso--cookie-session-là-chìa-khóa)
  - [3.3 OIDC Concepts — Client, Secret, Scope, Token](#33-oidc-concepts--client-secret-scope-token)
  - [3.4 Mở rộng Web Thứ 3 — WordPress SSO](#34-mở-rộng-web-thứ-3--wordpress-sso)
  - [3.5 Redirect URI — Điểm an toàn hay điểm yếu](#35-redirect-uri--điểm-an-toàn-hay-điểm-yếu)
- [4. Biểu đồ](#4-biểu-đồ)
  - [4.1 Biểu đồ số liệu](#41-biểu-đồ-số-liệu)
- [5. Quy luật & Mâu thuẫn](#5-quy-luật--mâu-thuẫn)
- [6. Khuyến nghị](#6-khuyến-nghị)

---

# 1. Giới thiệu tài liệu

## 1.1 Mục tiêu tài liệu

Tài liệu này tổng hợp toàn bộ kiến thức về Microsoft SSO qua Azure AD / Entra ID, chuẩn OIDC, và cơ chế IdentityServer làm trung tâm xác thực cho hệ thống HRM. Dành cho developer cần hiểu luồng xác thực, tích hợp thêm ứng dụng SSO, hoặc debug vấn đề login.

## 1.2 Từ viết tắt

| STT | Thuật ngữ | Ý nghĩa |
|-----|-----------|---------|
| 1 | SSO | Single Sign-On — đăng nhập một lần, dùng nhiều app |
| 2 | OIDC | OpenID Connect — chuẩn xác thực danh tính trên nền OAuth2 |
| 3 | OAuth2 | Framework uỷ quyền truy cập tài nguyên |
| 4 | IDS4 | IdentityServer4 — thư viện .NET làm Authorization Server |
| 5 | Entra ID | Tên mới của Azure Active Directory (Azure AD) |
| 6 | IdP | Identity Provider — nhà cung cấp xác thực (Microsoft, Okta…) |
| 7 | SP | Service Provider — ứng dụng cần xác thực (HRM, WordPress…) |
| 8 | JWT | JSON Web Token — định dạng token chuẩn |
| 9 | MFA | Multi-Factor Authentication |
| 10 | OWIN | Open Web Interface for .NET — middleware pipeline ASP.NET |

---

# 2. Bức tranh toàn cảnh

HRM đang dùng **IdentityServer (IDS4)** làm Authorization Server trung tâm. Đây là mô hình đúng — một điểm kiểm soát duy nhất cho toàn bộ xác thực, các ứng dụng (HRM Main, Portal, Mobile) đều là OIDC client của IDS.

Điều đáng chú ý: **IDS đóng vai trò kép** — vừa là IdP cho HRM apps, vừa là OIDC client khi federate sang Microsoft Entra ID. Điều này tạo ra một tầng abstraction quan trọng: các app HRM không bao giờ nói chuyện trực tiếp với Microsoft — chỉ biết IDS. Khi doanh nghiệp khách hàng đổi IdP (từ Microsoft sang Okta, hay ADFS), chỉ cần cấu hình lại IDS, không đụng code app.

---

# 3. Các điểm cốt lõi

## 3.1 Authorization Code Flow — 5 giai đoạn

**Mô tả chi tiết**: Luồng Microsoft SSO qua OIDC gồm 17 bước, gộp thành 5 giai đoạn rõ ràng:

| Giai đoạn | Bước | Nội dung |
|-----------|------|----------|
| 1 — Phát hiện chưa login | 1–3 | User → HRM Main → check session → không có → redirect sang IdentityServer |
| 2 — IDS hiện trang login | 4–6 | IDS hiện Login page → user click "Sign in Microsoft" → IDS redirect sang `login.microsoftonline.com/authorize` |
| 3 — Microsoft xác thực | 7–10 | Microsoft hiện login form → user nhập account + MFA → xác thực OK → redirect về IDS kèm `authorization_code` |
| 4 — IDS xử lý & tạo session | 11–13 | IDS đổi code → `id_token + access_token` → validate → map/provision user → tạo JWT/Cookie → redirect về HRM |
| 5 — HRM gọi API | 14–17 | User vào HRM → HRM gọi API với Bearer Token → API validate → trả dữ liệu |

```
User → HRM Main → IdentityServer → Microsoft Entra ID
                       ↑                    ↓
                  (code → token)      (authorization_code)
                       ↓
                  HRM Main → HRM API
```

**Tại sao quan trọng**: Authorization Code không dùng trực tiếp để truy cập tài nguyên — chỉ là mã tạm 60 giây để đổi lấy token thật. Nếu bị intercept giữa chừng, attacker cũng không dùng được vì thiếu `client_secret`. Đây là lý do flow này an toàn hơn Implicit Flow (đã deprecated).

**Rủi ro**: Nếu Redirect URI bị cấu hình sai hoặc bị tấn công open redirect → attacker có thể nhận `code` thay vì IDS → leo thang thành token hijack.

**Nguồn**: Session thảo luận 14/05/2026 | **Độ tin cậy**: Dữ kiện (OIDC spec)

---

## 3.2 Internal SSO — Cookie Session là chìa khóa

**Mô tả chi tiết**: Khi user đã login vào HRM Main qua IDS, IDS tạo một **SSO session cookie** (thường là `.AspNetCore.Cookies` hoặc tương đương). Khi user gõ URL HRM Portal → Portal redirect sang IDS → IDS kiểm tra cookie → thấy session còn sống → **cấp token ngay, không hỏi lại**.

```
HRM Main ─── login ──► IDS tạo SSO cookie
HRM Portal ──────────► IDS kiểm tra cookie → còn sống → cấp token tức thì ✅
```

**Tại sao quan trọng**: Đây không phải "magic" — là cơ chế session bình thường của browser. Nếu user dùng **Incognito** hoặc **trình duyệt khác** → không có cookie → phải login lại. Đây là nguồn gốc phổ biến của bug "SSO không hoạt động" khi test.

**Rủi ro**: Cookie session timeout cần cấu hình hợp lý. Quá ngắn → user bị logout giữa chừng. Quá dài → rủi ro bảo mật khi để máy unattended.

**Nguồn**: [[wiki/sources/SSO-HRM-Protocols]] | **Độ tin cậy**: Dữ kiện

---

## 3.3 OIDC Concepts — Client, Secret, Scope, Token

**Mô tả chi tiết**: OIDC cung cấp 3 thứ cốt lõi: (1) Authentication — xác minh danh tính user, (2) ID Token (JWT) chứa thông tin user (`sub`, `email`, `name`), (3) Access Token để gọi API. Các khái niệm then chốt:

| Khái niệm | Ý nghĩa thực tế |
|-----------|----------------|
| **Client** | App được đăng ký với IDS — có `ClientId` riêng (hrm-main, hrm-portal, wordpress) |
| **Client Secret** | Mật khẩu của app (không phải user) — dùng khi đổi code → token, chứng minh app là thật |
| **Scope** | Danh sách quyền app xin: `openid` (bắt buộc), `profile`, `email`, custom scope như `hrm_roles` |
| **Authorization Code** | Mã tạm 60 giây, dùng 1 lần — như số thứ tự tại quầy |
| **ID Token** | JWT chứa danh tính user — app đọc được |
| **Access Token** | Thẻ ra vào API — không đọc nội dung, chỉ present |
| **Redirect URI** | URL IDS sẽ gửi code về — phải đăng ký trước, không redirect lung tung |

**Tại sao quan trọng**: `client_secret` là điểm phân biệt giữa app hợp lệ và attacker giả mạo. Nếu lộ secret → bất kỳ ai cũng có thể đổi code lấy token thay cho app thật.

**Rủi ro**: Secret hard-code trong source code → lộ qua Git history. Phải dùng environment variable hoặc secret manager. ([[wiki/sources/Daily-2024-SSO-Auth]] — pattern Okta OIDC Startup.cs dùng `ConfigurationManager.AppSettings` là an toàn hơn hard-code)

**Nguồn**: [[wiki/sources/Daily-2024-SSO-Auth]], [[wiki/sources/SSO-HRM-Protocols]] | **Độ tin cậy**: Dữ kiện

---

## 3.4 Mở rộng Web Thứ 3 — WordPress SSO

**Mô tả chi tiết**: Để thêm bất kỳ app nào (WordPress, custom tool, vendor app) vào hệ sinh thái SSO HRM, chỉ cần 2 bước: (1) Đăng ký client mới trên IDS, (2) Cài OIDC plugin/library phía app đó.

**Đăng ký trên IDS:**
```json
{
  "ClientId": "wordpress",
  "ClientSecrets": ["<secret>"],
  "AllowedGrantTypes": ["authorization_code"],
  "RedirectUris": ["https://wordpress.company.com/oidc-callback"],
  "AllowedScopes": ["openid", "profile", "email"],
  "PostLogoutRedirectUris": ["https://wordpress.company.com"]
}
```

**WordPress plugin:** `daggerhart-openid-connect-generic` — điền 4 endpoint của IDS: authorize, token, userinfo, logout.

**Tại sao quan trọng**: App thứ 3 **không cần biết** IDS đang dùng Microsoft hay local auth bên trong. IDS là black box chuẩn OIDC. Đây là sức mạnh của federation — decoupling hoàn toàn.

**Rủi ro**: Mapping user phía app thứ 3 (WordPress tạo user từ email IDS) cần handle trường hợp email chưa tồn tại, email trùng, hay email thay đổi. Bỏ qua → user bị tạo duplicate hoặc bị từ chối đăng nhập.

**Nguồn**: Session thảo luận 14/05/2026 [inference từ chuẩn OIDC + pattern Okta HRM] | **Độ tin cậy**: Suy luận có cơ sở

---

## 3.5 Redirect URI — Điểm an toàn hay điểm yếu

**Mô tả chi tiết**: Redirect URI là URL mà IDS/IdP sẽ gửi `authorization_code` về. URI này phải được đăng ký trước — nếu request chứa URI không khớp danh sách đã đăng ký → IDS từ chối. Đây là lớp bảo vệ chống **open redirect attack**.

**Tại sao quan trọng**: Lỗi phổ biến nhất trong SSO integration là sai Redirect URI — thường do trailing slash, http vs https, hay domain khác. Lỗi này gây ra error `redirect_uri_mismatch` rất khó debug nếu không biết nguyên nhân. ([[wiki/sources/SSO-HRM-Protocols]] — ghi nhận lỗi phổ biến Okta)

**Rủi ro**: Nếu đăng ký URI quá rộng (wildcard sai) → attacker có thể craft URI redirect về server của họ để đánh cắp code.

**Nguồn**: [[wiki/sources/SSO-HRM-Protocols]] | **Độ tin cậy**: Dữ kiện

---

# 4. Biểu đồ

## 4.1 Biểu đồ số liệu

#### 📊 Phân bổ giao thức SSO đang dùng trong HRM (theo số case triển khai)

> 💡 **Phân tích:**
>
> OIDC/OAuth2 chiếm ưu thế tuyệt đối — phản ánh xu hướng cloud-first của các khách hàng HRM mới sau 2023.
> SAML vẫn tồn tại nhưng chỉ ở các khách hàng enterprise lớn có infrastructure cũ (Colgate/Okta SAML) — sức ì hạ tầng, không phải lựa chọn kỹ thuật.
> LDAP giảm dần nhưng không biến mất — các dự án on-premise nội bộ vẫn cần Active Directory integration.
> Pattern rõ: khách hàng mới → OIDC; khách hàng cũ on-premise → LDAP; enterprise với IdP riêng → SAML.
> Chưa có số liệu chính xác số case — biểu đồ dựa trên ước tính từ wiki, cần xác nhận lại.
> Nếu OIDC tiếp tục tăng → cần chuẩn hoá IDS config template để onboard client mới nhanh hơn.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "OIDC/OAuth2"
    value: 6
  - type: "SAML 2.0"
    value: 2
  - type: "LDAP"
    value: 3

#-----------------#
#- chart options -#
#-----------------#
options:
  angleField: "value"
  colorField: "type"
  radius: 0.8
  label:
    type: "spider"
    content: "{percentage}\n{name}"
  legend:
    layout: "horizontal"
    position: "bottom"
```

> 🎯 **Nên làm**: SE phụ trách IDS tạo template config chuẩn cho từng loại client (web, mobile, third-party) để giảm thời gian onboard.

---

#### 📊 Số bước xử lý theo từng actor trong Authorization Code Flow

> 💡 **Phân tích:**
>
> IdentityServer xử lý nhiều bước nhất (6 bước) — là điểm trung tâm, cũng là điểm single-of-failure nếu IDS down.
> Microsoft Entra ID chỉ xử lý 4 bước nhưng là bước quan trọng nhất — xác thực thật sự xảy ra ở đây.
> HRM App và User/Browser xử lý ít bước nhưng là điểm tiếp xúc — UX tệ ở đây (chậm redirect, lỗi callback) ảnh hưởng trực tiếp user.
> Không actor nào có thể bỏ qua — flow bị gián đoạn ở bất kỳ actor nào là login thất bại hoàn toàn.
> Đây giải thích tại sao debug SSO khó: phải trace qua 5 actor, log nằm ở nhiều nơi khác nhau.
> Cần centralized logging (correlation ID xuyên suốt 17 bước) để debug hiệu quả — hiện tại chưa rõ có không.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "User/Browser"
    value: 5
  - label: "HRM Main"
    value: 3
  - label: "IdentityServer"
    value: 6
  - label: "Microsoft Entra ID"
    value: 4
  - label: "HRM API"
    value: 2

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "value"
  label:
    position: "middle"
  meta:
    value:
      alias: "Số bước xử lý"
```

> 🎯 **Nên làm**: Thêm correlation ID (request tracing) vào IDS và HRM API log để khi có lỗi SSO có thể trace đủ 17 bước từ 1 log query.

---

# 5. Quy luật & Mâu thuẫn

**Quy luật rút ra:**

**Quy luật 1 — IDS là abstraction layer, không phải passthrough**: IDS không chỉ "chuyển tiếp" xác thực sang Microsoft. IDS tạo ra session riêng, token riêng cho HRM apps. Nếu không biết điều này → sẽ nhầm khi debug: token HRM app nhận được là của IDS, không phải Microsoft token trực tiếp.

**Quy luật 2 — Cookie = SSO, không có cookie = không có SSO**: Internal SSO (Main ↔ Portal) hoạt động hoàn toàn dựa trên browser cookie. Test SSO bằng Postman/API tool sẽ không bao giờ ra đúng — phải dùng browser thật.

**Quy luật 3 — Client Secret bảo vệ app, không bảo vệ user**: Secret là credential của app, không phải user. Lộ secret → app bị impersonate, không phải user account bị hack trực tiếp. Nhưng hệ quả vẫn nghiêm trọng vì attacker có thể lấy token của bất kỳ user nào.

**Quy luật 4 — Redirect URI phải khớp tuyệt đối**: Không có "gần đúng" — `http` vs `https`, có hay không có trailing slash đều bị reject. Nếu không biết → mất hàng giờ debug vì error message không chỉ rõ URI nào sai.

**Mâu thuẫn phát hiện:**

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | Wiki ghi HRM dùng OIDC, nhưng file `SSO web main/portal/mobile` đều rỗng — không có spec cụ thể | Nếu SE mới cần tích hợp → không có tài liệu tham chiếu → phải đọc code trực tiếp |
| 2 | IDS vừa là IdP cho HRM, vừa là OIDC client của Microsoft — nhưng không có tài liệu về cấu hình dual-role này | Khi nâng cấp IDS version hoặc thay đổi Microsoft tenant → không biết thay đổi gì |
| 3 | Khuyến nghị dùng environment variable cho secret, nhưng code mẫu trong wiki dùng `ConfigurationManager.AppSettings` — có thể vẫn đang đọc từ config file | Nếu config file vào source control → secret lộ |

---

# 6. Khuyến nghị

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | Ghi đầy đủ nội dung 3 file wiki stub: `SSO web main`, `SSO web portal`, `SSO mobile app` — mô tả flow, config, edge cases | Hiện đều rỗng → knowledge gap khi có incident SSO |
| 🔴 Cao | Kiểm tra `client_secret` trong các project IDS4 — đang lưu ở đâu (config file, env var, secret manager) | Nếu lưu trong file config checked vào git → rủi ro lộ credential |
| 🟡 Trung bình | Tạo template config chuẩn cho onboard OIDC client mới (web app, third-party) vào IDS | Giảm thời gian tích hợp, tránh lỗi Redirect URI mismatch lặp lại |
| 🟡 Trung bình | Thêm correlation ID vào IDS log và HRM API log để trace xuyên suốt Authorization Code Flow | Debug SSO hiện tại phải check log ở nhiều nơi — mất thời gian |
| 🟢 Thấp | Ghi nhận cấu hình dual-role của IDS (IdP cho HRM + OIDC client của Microsoft) vào wiki/architecture | Cần thiết khi nâng cấp IDS hoặc thay đổi Microsoft tenant config |

---

## 💬 3 Câu hỏi suy ngẫm

1. 🧠 **[Giả định]** Chúng ta giả định IdentityServer luôn available — nhưng nếu IDS down, toàn bộ SSO (Main, Portal, Mobile, và mọi app thứ 3) đều không login được. Có failover plan hay graceful degradation không, và nếu không thì rủi ro SLA là bao nhiêu?

2. 🧪 **[Thí nghiệm]** Nếu một khách hàng yêu cầu vừa SSO Microsoft, vừa SSO Google cho cùng một HRM instance — IDS có thể làm được không, và cấu hình sẽ phức tạp đến mức nào so với case Microsoft-only hiện tại?

3. 🌐 **[Kết nối]** Xem thêm [[wiki/sources/HongNgoc-DanhGia-SSO]] — case JWT SSO không qua IDS, dùng token trực tiếp; và [[wiki/projects/VnPay-Project]] — case IDS4 production thực tế, có thể có bài học về cấu hình dual-role IdP.
