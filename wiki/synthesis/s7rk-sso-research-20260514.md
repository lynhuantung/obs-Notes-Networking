---
type: synthesis
code: s7rk
tags:
  - sso
  - oidc
  - identity-server
  - azure-ad
  - ldap
  - jwt
  - research
research-topic: SSO toàn diện — Microsoft, Nội bộ, OIDC, Identity Server
sources-wiki:
  - "wiki/architecture/HRM-Auth-Architecture"
  - "wiki/sources/SSO-HRM-Protocols"
  - "wiki/sources/Daily-2024-SSO-Auth"
  - "wiki/sources/HongNgoc-DanhGia-SSO"
  - "wiki/sources/VnPay-System-Architecture"
  - "wiki/architecture/2FA-IDS4-Architecture"
  - "wiki/flows/Flow-LDAP-Login"
  - "wiki/sources/2fa-ids4-solution"
  - "wiki/sources/Daily-2024-Vietcap-SSO-Security"
  - "wiki/concepts/HRM-Security-Config"
sources-raw:
  - "raw/archive/Area/SSO/OKTA.md"
  - "raw/archive/Area/SSO/Giao thức SSO.md"
  - "raw/archive/Area/SSO-NetCore/Hướng dẫn sử dụng đăng nhập identity.md"
  - "raw/archive/Area/Tổng Hợp tri thức thô 2025/3-5 Bao mat API OIDC.md"
  - "raw/archive/1.Projects/Dự án 2026/VnPay-Project/Documents/Identity - Multi Node.md"
  - "raw/archive/0.Daily/2024-Jun-23/SSO Okta OIDC.md"
created: 2026-05-14
updated: 2026-05-14
related:
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/sources/SSO-HRM-Protocols]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
  - "[[wiki/sources/HongNgoc-DanhGia-SSO]]"
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/architecture/2FA-IDS4-Architecture]]"
  - "[[wiki/flows/Flow-LDAP-Login]]"
---

# Nghiên cứu: SSO Toàn Diện — Microsoft, Nội Bộ, OIDC & Identity Server

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings — Những gì tìm thấy](#2-findings--những-gì-tìm-thấy)
  - [2.1 Ba giao thức SSO và vị trí của từng giao thức trong HRM](#21-ba-giao-thức-sso-và-vị-trí-của-từng-giao-thức-trong-hrm)
  - [2.2 Mô hình JWT SSO nội bộ — kiến trúc nhẹ nhất](#22-mô-hình-jwt-sso-nội-bộ--kiến-trúc-nhẹ-nhất)
  - [2.3 Mô hình Identity Server 4 — OAuth2 Authorization Code Flow đầy đủ](#23-mô-hình-identity-server-4--oauth2-authorization-code-flow-đầy-đủ)
  - [2.4 SSO Microsoft — Azure AD OIDC và ADFS](#24-sso-microsoft--azure-ad-oidc-và-adfs)
  - [2.5 Cơ chế OIDC — Token, Endpoint, Scope chi tiết](#25-cơ-chế-oidc--token-endpoint-scope-chi-tiết)
  - [2.6 Cấu hình thực tế HRM — auth.config, webSettings, Startup.cs](#26-cấu-hình-thực-tế-hrm--authconfig-websettings-startupcs)
  - [2.7 IDS4 Multi-Node — vấn đề thực chiến trên Kubernetes](#27-ids4-multi-node--vấn-đề-thực-chiến-trên-kubernetes)
  - [2.8 Bảo mật sau SSO — 2FA, RBAC, Token Lifecycle](#28-bảo-mật-sau-sso--2fa-rbac-token-lifecycle)
- [3. Biểu đồ so sánh](#3-biểu-đồ-so-sánh)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành

HRM VnResource hỗ trợ **4 mô hình SSO** song tồn, không phải một — và việc lựa chọn sai mô hình cho khách hàng là rủi ro kỹ thuật lớn nhất thường gặp.[^1] Mô hình JWT SSO nội bộ (HongNgoc) cực kỳ đơn giản nhưng bảo mật yếu: shared secret key lưu trong `web.config` dạng plaintext — nếu lộ key, toàn bộ phiên SSO có thể bị giả mạo.[^2] Identity Server 4 (VnPay) là mô hình đầy đủ nhất nhưng chứa **single point of failure nghiêm trọng**: IDS4 pod chưa hỗ trợ horizontal scaling mà không cấu hình shared components (Signing Key, DataProtection, Redis Session) — thiếu bất kỳ thành phần nào trong 5 shared components sẽ khiến user bị đá login liên tục.[^3] SSO Microsoft (Azure AD / ADFS) là path được dùng thực tế ở Colgate và FIT, cấu hình qua `auth.config` với `ProviderConfiguration = AzureOpenIdConnect/ADFS` — nhưng file hướng dẫn `Microsoft.md` trong vault vẫn là stub rỗng, không có nội dung.[^4] Điểm nguy hiểm bị bỏ qua nhất: token sau logout không được hủy đúng cách (CVE-pattern từ VnPay pentest), tức là SSO đăng xuất nhưng access token vẫn còn hiệu lực đến hết TTL.[^5]

---

## 1. Bối cảnh & Phạm vi

HRM VnResource được triển khai cho nhiều khách hàng đa dạng — từ SME (HongNgoc chạy song song 2 phiên bản) đến enterprise trên Kubernetes (VnPay, 13 service).[^1] Nhu cầu SSO xuất hiện khi khách hàng đã có hệ thống identity riêng (Microsoft Azure AD, ADFS, Okta) hoặc có nhiều ứng dụng nội bộ cần đăng nhập một lần.[^6]

Phạm vi báo cáo này bao gồm:
- 4 mô hình auth HRM (Local, JWT SSO, IDS4, LDAP/AD)
- Cơ chế OIDC từ lý thuyết đến config thực tế
- SSO Microsoft: Azure AD và ADFS
- Multi-node IDS4 deployment
- Bảo mật sau SSO: 2FA, RBAC, token lifecycle

---

## 2. Findings — Những gì tìm thấy

### 2.1 Ba giao thức SSO và vị trí của từng giao thức trong HRM

**Mô tả chi tiết**: HRM dùng 3 giao thức SSO hoàn toàn khác nhau về cơ chế và mục đích: SAML 2.0 dùng cho doanh nghiệp lớn với IdP enterprise (Colgate/Okta SAML, FIT/ADFS), OpenID Connect/OAuth2 dùng cho web/mobile hiện đại (VnPay IDS4, HongNgoc JWT), và LDAP dùng cho mạng nội bộ Active Directory (AVN, các dự án on-premise).[^6]

**Tại sao quan trọng**: Mỗi giao thức yêu cầu cấu hình và hạ tầng hoàn toàn khác nhau. Chọn nhầm giao thức = triển khai lại từ đầu. OIDC đang là hướng HRM đang ưu tiên (`HRM đang dùng giao thức OpenID`).[^6]

**Rủi ro / Tác động**: Khách hàng có AD nội bộ nhưng không có cloud → chọn LDAP thay vì OIDC là đúng. Khách hàng Microsoft 365 → Azure AD OIDC. Nhầm lẫn hai path này gây kéo dài triển khai hàng tuần.

**Nguồn**: [[wiki/sources/SSO-HRM-Protocols]][^6] | **Độ tin cậy**: Dữ kiện

---

**Bảng định vị 3 giao thức:**

| Giao thức | Dùng khi | Case HRM | Đặc điểm kỹ thuật |
|-----------|----------|----------|-------------------|
| SAML 2.0 | Doanh nghiệp lớn, IdP enterprise | Colgate (Okta SAML), FIT (ADFS) | XML-based assertion, redirect/POST binding |
| OpenID Connect / OAuth2 | Web/mobile hiện đại | VnPay (IDS4), HongNgoc (JWT) | JSON token (JWT), REST endpoints |
| LDAP | Mạng nội bộ Active Directory | AVN, dự án on-premise | Directory bind, không tạo token |

---

### 2.2 Mô hình JWT SSO nội bộ — kiến trúc nhẹ nhất

**Mô tả chi tiết**: Pattern JWT SSO nội bộ (HongNgoc) dùng để bridge 2 hệ thống HRM của cùng một khách hàng: hệ thống cũ tạo JWT token ký bằng `SSO_SecretKey` → redirect sang hệ thống mới → hệ thống mới verify chữ ký → auto-login. Không cần OAuth server, không cần IdP bên ngoài. Config chỉ cần 2 key trong `web.config`: `Hrm_Main_Web_SSO` (URL đích) và `SSO_SecretKey` (shared secret giống hệt cả 2 source).[^2]

**Tại sao quan trọng**: Đây là giải pháp "migration SSO" — cho phép khách hàng chuyển đổi phiên bản dần dần mà user không cảm nhận. Tuy nhiên, shared secret trong `web.config` là điểm yếu nghiêm trọng: nếu file config lộ (qua git, backup không mã hóa), kẻ tấn công có thể forge JWT và đăng nhập vào bất kỳ account nào.[^2]

**Rủi ro / Tác động**: Secret key lộ → toàn bộ SSO bridge bị compromise. Pattern này chỉ an toàn nếu cả hai source chạy trong cùng môi trường kiểm soát (không expose config ra ngoài).

**Nguồn**: [[wiki/sources/HongNgoc-DanhGia-SSO]][^2] | **Độ tin cậy**: Dữ kiện

```
Luồng JWT SSO nội bộ:

[HRM Cũ] → User nhấn "Đánh giá mới"
         → Tạo JWT: {sub: userCode, exp: now+5m} sign(SSO_SecretKey)
         → Redirect: https://hrm-moi.com/Home/Login?token=<JWT>

[HRM Mới] → Nhận token từ query string
          → Verify JWT: check signature + exp
          → Nếu valid → auto-login không cần nhập password
          → Set session cookie → vào trang chủ
```

---

### 2.3 Mô hình Identity Server 4 — OAuth2 Authorization Code Flow đầy đủ

**Mô tả chi tiết**: IDS4 là mô hình SSO hoàn chỉnh nhất, triển khai tại VnPay với 13 service trên Kubernetes. IDS4 đóng vai trò IdP trung tâm: tất cả service (Portal, Main, News, Survey...) đều redirect về IDS4 để xác thực, sau đó nhận Access Token + ID Token để call API.[^1][^3]

**Tại sao quan trọng**: IDS4 là **single point of failure** của toàn hệ thống. Khi IDS4 down → toàn bộ 13 service không đăng nhập được. Vấn đề scale IDS4 trên Kubernetes đã xuất hiện thực tế (tháng 11/2025): không thể mở nhiều pod nếu chưa cấu hình shared components đúng.[^3][^7]

**Rủi ro / Tác động**: IDS4 không HA → production outage toàn bộ. Thiếu Redis shared session → user bị đá login khi request hit pod khác. Token TTL 2 tháng (lỗi VnPay pentest) → session tồn tại quá lâu sau khi user bị terminate.[^5]

**Nguồn**: [[wiki/sources/VnPay-System-Architecture]][^3], `raw/archive/1.Projects/Dự án 2026/VnPay-Project/Documents/Identity - Multi Node.md`[^7] | **Độ tin cậy**: Dữ kiện

```
OAuth2 Authorization Code Flow (IDS4):

Browser → Portal: "GET /portal"
Portal  → Browser: "302 Redirect → /ids4/authorize?client_id=portal&response_type=code&scope=openid profile hrm_api"
Browser → IDS4:   "GET /authorize" → hiển thị trang login
Browser → IDS4:   "POST /login {username, password}"
IDS4    → DB:     validate credentials (VnrDecrypt / LDAP)
IDS4    → Browser: "302 Redirect → /portal/callback?code=AUTH_CODE"
Browser → Portal:  "GET /callback?code=AUTH_CODE"
Portal  → IDS4:    "POST /token {code, client_secret, grant_type=authorization_code}"
IDS4    → Portal:  "{access_token, id_token, refresh_token}"
Portal  →  API:    "Authorization: Bearer <access_token>"
API     → IDS4:    validate token (/.well-known/openid-configuration → jwks_uri)
```

---

### 2.4 SSO Microsoft — Azure AD OIDC và ADFS

**Mô tả chi tiết**: HRM hỗ trợ 2 phương thức SSO Microsoft: Azure AD OIDC (cloud — dùng cho Colgate) và ADFS on-premise (dùng cho FIT). Cả 2 đều dùng `UsingADFS_Azure: true` trong `webSettings.json` để ẩn form username/password và redirect thẳng sang Microsoft IdP. Sự khác biệt nằm ở `ProviderConfiguration` trong `auth.config`: `AzureOpenIdConnect` vs `ADFS`.[^8]

**Tại sao quan trọng**: Khách hàng Azure AD cần đăng ký app trên Azure Portal và cung cấp TenantId + ClientId + SecretId trước khi VnR có thể cấu hình. Đây là dependency nằm ở phía khách hàng — thường gây trễ tiến độ nếu không confirm sớm.[^8]

**Rủi ro / Tác động**: Sai Redirect URI → callback fail → login loop không dứt. Azure AD token có expire ngắn hơn ADFS — cần handle refresh token đúng cách. ADFS yêu cầu network reach tới ADFS server — thường bị firewall block trong môi trường cẩn thận.

**Nguồn**: [[wiki/sources/Daily-2024-SSO-Auth]][^8] | **Độ tin cậy**: Dữ kiện

```
Cấu hình Azure AD OIDC (auth.config):
<add key="UseExternalLogin" value="true"/>
<add key="ProviderConfiguration" value='[
  {
    "Id": "Provider-01",
    "Enabled": true,
    "ProviderName": "AzureOpenIdConnect",
    "DisplayName": "Login with Microsoft",
    "Tenant": "<tenant-id>",
    "ClientId": "<client-id>"
  }
]'/>

webSettings.json:
{ "UsingADFS_Azure": true }
→ Khi true: Portal ẩn form username/password, redirect thẳng sang Azure
```

---

### 2.5 Cơ chế OIDC — Token, Endpoint, Scope chi tiết

**Mô tả chi tiết**: OpenID Connect (OIDC) là lớp identity xây trên OAuth2. Khi HRM dùng OIDC, IdP (IDS4, Azure AD, Okta) cấp 3 loại token: **ID Token** (JWT chứa user claims — ai đang đăng nhập), **Access Token** (JWT dùng để call API — làm gì được), **Refresh Token** (opaque token để lấy Access Token mới khi hết hạn).[^9]

**Tại sao quan trọng**: Hiểu nhầm Access Token vs ID Token là lỗi implementation phổ biến. ID Token chỉ dùng để xác định danh tính — không dùng làm Bearer token. Access Token mới là Bearer token cho API. Dùng nhầm → API reject 401.[^9]

**Rủi ro / Tác động**: TTL Access Token quá dài (VnPay pentest phát hiện TTL 2 tháng) → nếu user bị terminate hoặc quyền bị thu hồi, token vẫn còn hiệu lực.[^5] Scope không kiểm soát đúng → ứng dụng bên thứ ba truy cập quá nhiều resource.

**Nguồn**: [[wiki/architecture/HRM-Auth-Architecture]][^1], `raw/archive/Area/Tổng Hợp tri thức thô 2025/3-5 Bao mat API OIDC.md`[^9] | **Độ tin cậy**: Dữ kiện + Suy luận

```
OIDC Endpoints chuẩn (IDS4 / Azure AD):
  Discovery:   /.well-known/openid-configuration
  JWKS:        /oauth2/keys  (public key verify JWT)
  Auth:        /oauth2/authorize
  Token:       /oauth2/token
  UserInfo:    /oauth2/userinfo
  End Session: /oauth2/logout

3 loại token:
  ID Token     → JWT, chứa: sub, name, email, iat, exp, iss, aud
  Access Token → JWT (IDS4) hoặc opaque (Azure AD), dùng Bearer
  Refresh Token → opaque, TTL dài hơn, lưu server-side

Scope quan trọng:
  openid   → bắt buộc cho OIDC (cấp ID Token)
  profile  → name, preferred_username
  email    → email address
  hrm_api  → custom scope HRM (cấp quyền call HR API, SYS API)
```

---

### 2.6 Cấu hình thực tế HRM — auth.config, webSettings, Startup.cs

**Mô tả chi tiết**: HRM cũ (OWIN/.NET Framework) cấu hình SSO qua `auth.config` (XML) + `webSettings.json`. HRM mới (NetCore/.NET 8) cấu hình qua `Startup.cs` hoặc `Program.cs` với `AddOpenIdConnect` middleware. Mỗi khách hàng có `auth.config` riêng — không dùng chung.[^8][^10]

**Tại sao quan trọng**: Sự tồn tại song song 2 codebase (.NET Framework + .NET 8) tạo ra 2 cách cấu hình SSO hoàn toàn khác nhau — cùng một khái niệm nhưng code hoàn toàn khác. Dev mới dễ nhầm lẫn giữa `UseOpenIdConnectAuthentication` (OWIN) và `AddOpenIdConnect` (NetCore).[^10]

**Rủi ro / Tác động**: Apply OWIN config vào NetCore project → silent fail (không báo lỗi rõ ràng, chỉ redirect loop). Cấu hình sai Issuer URL → token validation fail.

**Nguồn**: [[wiki/sources/Daily-2024-SSO-Auth]][^8], `raw/archive/Area/SSO-NetCore/Hướng dẫn sử dụng đăng nhập identity.md`[^10] | **Độ tin cậy**: Dữ kiện

```csharp
// OWIN (.NET Framework) — Okta OIDC:
app.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions {
    ClientId = ConfigurationManager.AppSettings["okta:ClientId"],
    Authority = "https://<okta_domain>/oauth2/default",
    RedirectUri = ConfigurationManager.AppSettings["okta:RedirectUri"],
    Scope = "openid profile email",
    ResponseType = "code"
});

// NetCore (.NET 8) — IDS4 / Azure AD:
services.AddAuthentication(options => {
    options.DefaultScheme = "Cookies";
    options.DefaultChallengeScheme = "oidc";
})
.AddCookie("Cookies")
.AddOpenIdConnect("oidc", options => {
    options.Authority = "https://vnpay-ids4.vnresource.net";
    options.ClientId = "portal_client";
    options.ClientSecret = "<secret>";
    options.ResponseType = "code";
    options.Scope.Add("openid");
    options.Scope.Add("profile");
    options.Scope.Add("hrm_api");
    options.SaveTokens = true;
});
```

---

### 2.7 IDS4 Multi-Node — vấn đề thực chiến trên Kubernetes

**Mô tả chi tiết**: Khi scale IDS4 lên nhiều pod trong Kubernetes, **5 shared components bắt buộc** phải được chia sẻ giữa tất cả pod: (1) Signing Key PFX, (2) DataProtection Keys (Redis), (3) Session Ticket Store (Redis), (4) Distributed Cache (Redis), (5) Persisted Grants (SQL). Thiếu bất kỳ component nào → pod B không thể verify session do pod A tạo → user bị redirect về trang login liên tục.[^7]

**Tại sao quan trọng**: Đây là vấn đề thực tế đã xảy ra ở VnPay tháng 11/2025. Lỗi này rất khó debug vì không có error message rõ ràng — user chỉ thấy "bị đá login" mà không hiểu tại sao. Root cause: Load Balancer round-robin, request lần sau hit pod khác, pod khác không có DataProtection Key → decrypt cookie fail → session invalid.[^7]

**Rủi ro / Tác động**: Production outage partial (một số user bị ảnh hưởng tuỳ vào pod nào nhận request). Rất khó reproduce trong môi trường dev (chỉ có 1 pod).

**Nguồn**: `raw/archive/1.Projects/Dự án 2026/VnPay-Project/Documents/Identity - Multi Node.md`[^7] | **Độ tin cậy**: Dữ kiện

```
IDS4 Multi-Node — 5 shared components BẮT BUỘC:

┌─────────────────────────────────────────────────────┐
│             LOAD BALANCER (Ingress/Nginx)           │
└──────────────────┬──────────────────────────────────┘
                   │ round-robin
        ┌──────────┴──────────┐
        │                     │
   IDS4 POD A           IDS4 POD B
        │                     │
        └──────────┬──────────┘
                   │ PHẢI DÙNG CHUNG
        ┌──────────▼──────────────────────┐
        │  1. Signing Key (PFX)           │ → JWT token valid cross-pod
        │  2. DataProtection (Redis)      │ → Cookie decrypt cross-pod
        │  3. Session Store (Redis)       │ → Session lookup cross-pod
        │  4. Distributed Cache (Redis)   │ → Token cache cross-pod
        │  5. Persisted Grants (SQL)      │ → Authorization codes/grants
        └─────────────────────────────────┘
```

---

### 2.8 Bảo mật sau SSO — 2FA, RBAC, Token Lifecycle

**Mô tả chi tiết**: SSO chỉ giải quyết xác thực (authentication) — phân quyền (authorization) là tầng riêng. HRM dùng RBAC: user thuộc nhóm quyền → nhóm có permissions (menu, function, data level). Permissions được cache Redis/Memory sau login và clear khi đổi quyền (cần key `Hrm_APICenter_Web`).[^11] 2FA (TOTP, HMAC-SHA1, 30s, 6 chữ số) chỉ áp dụng cho Mô hình IDS4 — Admin bắt buộc, user thường optional.[^12]

**Tại sao quan trọng**: Token lifecycle là lỗ hổng đã bị pentest phát hiện: Access Token TTL 2 tháng (phải giảm xuống 1 ngày), token sau logout không vào blacklist (phải implement token revocation). Hai lỗi này đều là **CWE-613** đã bị VnPay pentest raise.[^5]

**Rủi ro / Tác động**: User bị terminate nhưng token còn hiệu lực 2 tháng → có thể tiếp tục call API. Token không bị revoke sau logout → session hijacking nếu token bị intercept.

**Nguồn**: [[wiki/architecture/HRM-Auth-Architecture]][^1], [[wiki/architecture/2FA-IDS4-Architecture]][^12], [[wiki/concepts/HRM-Security-Config]][^11] | **Độ tin cậy**: Dữ kiện

---

## 3. Biểu đồ so sánh

### 📊 So sánh mức độ phức tạp triển khai 4 mô hình SSO

> 💡 **Phân tích:**
>
> JWT SSO nội bộ có điểm phức tạp thấp nhất nhưng đây là đánh đổi bảo mật — không phải tính năng. Không có IdP trung tâm đồng nghĩa không có token revocation, không có audit trail chuẩn. Khoảng cách giữa JWT SSO (2 điểm) và IDS4 (5 điểm) phản ánh chi phí infrastructure thực sự — IDS4 cần Redis, SQL Grants, PFX Certificate, Kubernetes config. Azure AD và ADFS đứng giữa: phức tạp phía khách hàng (setup Azure Portal, ADFS server) nhưng đơn giản phía VnR (chỉ cấu hình auth.config). Pattern đáng lo: khi khách hàng chọn IDS4 nhưng không chuẩn bị Redis HA, multi-node sẽ gây outage mà không có cảnh báo rõ ràng. LDAP trông đơn giản (3 điểm) nhưng ẩn chi phí debugging cao khi LDAP server bind fail — lỗi không có error message mô tả tốt.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "JWT SSO\n(HongNgoc)"
    value: 2
  - label: "LDAP/AD\n(on-premise)"
    value: 3
  - label: "Azure AD\nOIDC"
    value: 4
  - label: "ADFS\n(on-premise)"
    value: 4
  - label: "IDS4\n(VnPay)"
    value: 5

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "value"
  label:
    position: "middle"
  color: "#5B8FF9"
  meta:
    value:
      alias: "Độ phức tạp triển khai (1-5)"
```

**📋 Số liệu biểu đồ**

| Mô hình | Điểm phức tạp | Ghi chú |
|---------|:---:|---------|
| JWT SSO (HongNgoc) | 2 | Chỉ cần shared secret trong web.config |
| LDAP/AD | 3 | Cần LDAP server, BaseDN, authorized user |
| Azure AD OIDC | 4 | Khách hàng cần setup Azure Portal + cấp TenantId/ClientId |
| ADFS on-premise | 4 | Cần ADFS server nội bộ, metadata endpoint, network reach |
| IDS4 (VnPay) | 5 | Redis HA, PFX cert, SQL Grants, Kubernetes shared config |

> 🎯 **Nên làm**: Khi tư vấn khách hàng, xác định ngay họ đang dùng Microsoft 365 / AD nội bộ / không có IdP → chọn đúng path, tránh migration giữa chừng.

---

### 📊 Token Security Score — So sánh mức độ bảo mật token

> 💡 **Phân tích:**
>
> IDS4 có điểm bảo mật cao nhất trên paper nhưng thực tế VnPay pentest phát hiện 2 lỗi nghiêm trọng (TTL 2 tháng, không blacklist sau logout) — điểm thực tế thấp hơn lý thuyết đáng kể. Azure AD có điểm cao nhờ Microsoft tự quản lý token lifecycle và revocation. JWT SSO nội bộ đứng cuối không phải vì thiết kế tệ mà vì thiếu các control layer: không có token revocation, không có audit trail chuẩn, secret key quản lý thủ công. LDAP không tạo token (điểm N/A) — xác thực xong là tạo session HRM thông thường, bảo mật phụ thuộc vào session management của HRM chứ không phải IdP.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "Azure AD OIDC"
    value: 5
  - label: "IDS4 (lý thuyết)"
    value: 5
  - label: "IDS4 (thực tế VnPay)"
    value: 3
  - label: "ADFS"
    value: 4
  - label: "LDAP/AD"
    value: 3
  - label: "JWT SSO nội bộ"
    value: 2

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "value"
  label:
    position: "middle"
  color: "#61DDAA"
  meta:
    value:
      alias: "Security Score (1-5)"
```

**📋 Số liệu biểu đồ**

| Mô hình | Score | Lý do |
|---------|:---:|-------|
| Azure AD OIDC | 5 | Microsoft quản lý token lifecycle, revocation chuẩn, Conditional Access |
| IDS4 (lý thuyết) | 5 | Full OIDC, token introspection, revocation endpoint có sẵn |
| IDS4 (thực tế VnPay) | 3 | TTL 2 tháng, không blacklist logout → CWE-613 ×2 |
| ADFS | 4 | Mature product, federation chuẩn, nhưng on-premise → ít update hơn |
| LDAP/AD | 3 | Không tạo token — session HRM thông thường sau auth |
| JWT SSO nội bộ | 2 | Shared secret plaintext, không có revocation, không audit trail |

> 🎯 **Nên làm**: IDS4 cần implement token blacklist sau logout và giảm TTL về 1–8 giờ để từ điểm 3 lên điểm 4+.

---

## 4. Phân tích & Nhận định

### 4.1 Quy luật rút ra

**IDS4 là đúng về kiến trúc nhưng sai về vận hành nếu thiếu Redis HA.** Mô hình IDS4 đầy đủ tính năng nhưng tạo ra dependency chain dài: IDS4 → Redis → SQL. Mỗi node trong chain này down → toàn bộ SSO down.[^7]

**JWT SSO nội bộ là giải pháp migration, không phải production SSO.** Pattern HongNgoc chỉ phù hợp khi cả 2 hệ thống cùng một môi trường kiểm soát, thời gian tồn tại ngắn (migration period). Dùng lâu dài là nợ kỹ thuật.[^2]

**OIDC scope là cơ chế phân quyền API — không phải chỉ là formality.** Custom scope `hrm_api` trong IDS4 quyết định Access Token có được phép call HR API hay không. Nếu không define scope đúng → API reject 403 dù đã login thành công.[^9]

**Redirect URI mismatch là lỗi #1 khi triển khai SSO mới.** Cả Azure AD, Okta, IDS4 đều fail với `redirect_uri_mismatch` nếu URI trong `auth.config` không khớp chính xác (kể cả trailing slash) với URI đã đăng ký trên IdP.[^8]

### 4.2 Mâu thuẫn phát hiện

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | IDS4 được design là production SSO nhưng VnPay pentest phát hiện TTL 2 tháng + không blacklist logout — 2 lỗi cơ bản nhất của token security | Token bị lộ có thể dùng 2 tháng sau khi user đã logout hoặc bị terminate |
| 2 | HRM hỗ trợ LDAPS (`ConnectionType = LDAP+SSL`) nhưng "chưa xác nhận hoạt động thực tế" — tức là feature tồn tại trong UI nhưng chưa được test đủ | Khách hàng yêu cầu LDAPS (AVN đã yêu cầu) nhưng không hoạt động được — mất uy tín |
| 3 | File `Microsoft.md` và `SSO web main/portal/mobile.md` trong vault là stub rỗng — tồn tại trong Atlas nhưng không có nội dung | Developer tìm đến nhưng không có hướng dẫn → phải tìm từ nguồn raw hoặc hỏi lại |

---

## 5. Gaps & Hạn chế

- **Microsoft.md stub rỗng**: Node tồn tại trong Atlas nhưng không có nội dung kỹ thuật về Azure AD setup phía Microsoft Portal (các bước tạo app registration, cấu hình permissions, cấp admin consent). Người mới cần hướng dẫn sẽ không tìm được.[^4]

- **SSO web main/portal/mobile stub rỗng**: 3 file planned nodes về cách triển khai SSO trên từng surface HRM không có nội dung — không biết có sự khác biệt nào giữa config SSO trên Main vs Portal vs Mobile hay không.

- **LDAPS chưa xác nhận**: `ConnectionType = LDAP+SSL` có trong UI nhưng chưa test thực tế. Nếu AVN (hoặc khách hàng khác) yêu cầu LDAPS → risk cao.

- **Không có hướng dẫn Okta SAML**: Wiki có Okta OIDC nhưng không có Okta SAML2 setup guide — Colgate dùng Okta SAML theo ghi chú nhưng không có tài liệu config tương ứng.

- **IDS4 token revocation chưa implement**: Pentest đã raise nhưng không có wiki document về fix plan hoặc implementation guide cho token blacklist.

---

## 6. Gợi ý hành động

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | Implement token blacklist sau logout cho IDS4 (VnPay) | CWE-613 đã được pentest raise — token sau logout vẫn valid là lỗ hổng nghiêm trọng |
| 🔴 Cao | Giảm IDS4 Access Token TTL từ 2 tháng xuống 1–8 giờ | CWE-613: user terminated nhưng token còn hiệu lực 2 tháng |
| 🔴 Cao | Xác nhận LDAPS hoạt động thực tế với AVN | AVN đã yêu cầu — nếu feature không hoạt động cần raise fix ngay |
| 🟡 Trung bình | Điền nội dung file Microsoft.md trong vault | Dev tìm đến file này nhưng không có thông tin — tốn thời gian tìm raw |
| 🟡 Trung bình | Viết hướng dẫn SSO web main/portal/mobile riêng biệt | Clarify xem 3 surface có cấu hình khác nhau không |
| 🟡 Trung bình | Document Okta SAML2 setup guide | Colgate dùng Okta SAML nhưng không có wiki guide |
| 🟢 Thấp | Migrate JWT SSO HongNgoc về IDS4 nếu tồn tại lâu dài | Shared secret plaintext là nợ kỹ thuật — không phải khủng hoảng ngay nhưng cần roadmap |
| 🟢 Thấp | Thêm 2FA scope vào custom scope HRM IDS4 | Hiện 2FA chỉ optional cho user thường — nên thêm policy bắt buộc theo nhóm nhạy cảm |

---

## Tài liệu tham khảo

### Nguồn Wiki

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^1] | [[wiki/architecture/HRM-Auth-Architecture]] | architecture | Kiến trúc 4 mô hình auth HRM — Local, JWT SSO, IDS4, LDAP |
| [^2] | [[wiki/sources/HongNgoc-DanhGia-SSO]] | source | JWT SSO bridge HongNgoc — config, flow, shared secret |
| [^3] | [[wiki/sources/VnPay-System-Architecture]] | source | 13 service VnPay Kubernetes — IDS4 là single point of failure |
| [^5] | [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] | source | VnPay pentest 10/2025 — 24 lỗ hổng, CWE-613 token TTL + logout |
| [^6] | [[wiki/sources/SSO-HRM-Protocols]] | source | 3 giao thức SSO: SAML/OIDC/LDAP — bảng định vị, case thực tế |
| [^8] | [[wiki/sources/Daily-2024-SSO-Auth]] | source | Azure AD, ADFS, Okta OIDC — config mẫu C#, auth.config JSON |
| [^9] | [[wiki/architecture/HRM-Auth-Architecture]] | architecture | OIDC endpoints, token types, scope definition |
| [^11] | [[wiki/concepts/HRM-Security-Config]] | concept | RBAC, permission cache, webconfig keys bảo mật |
| [^12] | [[wiki/architecture/2FA-IDS4-Architecture]] | architecture | TOTP 2FA trên IDS4 — component, flow, recovery code |

### Nguồn Thô (raw/)

| # | Đường dẫn | Ngày tạo | Mô tả ngắn |
|---|-----------|----------|------------|
| [^4] | `raw/archive/Area/SSO/Microsoft.md` | 2024-12-02 | Stub rỗng — node tồn tại nhưng không có nội dung |
| [^7] | `raw/archive/1.Projects/Dự án 2026/VnPay-Project/Documents/Identity - Multi Node.md` | 2025-12-13 | IDS4 multi-node: 5 shared components, flow login cross-pod |
| [^10] | `raw/archive/Area/SSO-NetCore/Hướng dẫn sử dụng đăng nhập identity.md` | 2025-02-04 | Hướng dẫn login flow NetCore .NET 8 qua Identity |

### Suy luận AI

| # | Loại | Giải thích |
|---|------|-----------|
| [^9] | [inference] | OIDC endpoint list và scope behavior suy luận từ tổng hợp nhiều nguồn — không có 1 file nào liệt kê đầy đủ |

---

[^1]: [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc 4 mô hình auth HRM tổng quan
[^2]: [[wiki/sources/HongNgoc-DanhGia-SSO]] — JWT SSO HongNgoc: config, flow, shared secret
[^3]: [[wiki/sources/VnPay-System-Architecture]] — 13 service Kubernetes, IDS4 single point of failure
[^4]: `raw/archive/Area/SSO/Microsoft.md` — Stub rỗng (date: 2024-12-02)
[^5]: [[wiki/concepts/HRM-Security-Config]] — VnPay pentest CWE-613: TTL 2 tháng, không blacklist logout
[^6]: [[wiki/sources/SSO-HRM-Protocols]] — 3 giao thức SSO SAML/OIDC/LDAP, case thực tế
[^7]: `raw/archive/1.Projects/Dự án 2026/VnPay-Project/Documents/Identity - Multi Node.md` — IDS4 multi-node 5 shared components
[^8]: [[wiki/sources/Daily-2024-SSO-Auth]] — Azure AD, ADFS, Okta config mẫu C# OWIN
[^9]: [inference] — Tổng hợp OIDC endpoints từ nhiều nguồn (auth.config, IDS4 doc, Okta guide)
[^10]: `raw/archive/Area/SSO-NetCore/Hướng dẫn sử dụng đăng nhập identity.md` — NetCore login flow qua Identity
[^11]: [[wiki/concepts/HRM-Security-Config]] — RBAC, permission cache, webconfig security keys
[^12]: [[wiki/architecture/2FA-IDS4-Architecture]] — TOTP 2FA trên IDS4, component diagram

---

## Hành trình nghiên cứu

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | Atlas: `wiki_search_links("SSO")` | 🔍 Tìm | 20 node — xác định 5 node wiki core cần đọc |
| 2 | Atlas: `wiki_search_links("identity")` | 🔍 Tìm | 4 node — phát hiện `Identity - Multi Node.md` (raw) |
| 3 | Atlas: `wiki_search_links("oidc")` | 🔍 Tìm | 2 node — `SSO Okta OIDC.md` (raw), `3-5 Bao mat API OIDC.md` |
| 4 | `wiki/architecture/HRM-Auth-Architecture.md` | ✅ Đọc | Nguồn chính — 4 mô hình auth, diagram mermaid đầy đủ |
| 5 | `wiki/sources/SSO-HRM-Protocols.md` | ✅ Đọc | 3 giao thức, case thực tế, ghi chú stub rỗng Microsoft.md |
| 6 | `wiki/sources/Daily-2024-SSO-Auth.md` | ✅ Đọc | Config Azure AD, ADFS, Okta OIDC C# code mẫu |
| 7 | `wiki/sources/HongNgoc-DanhGia-SSO.md` | ✅ Đọc | JWT SSO bridge — pattern, config, flow |
| 8 | `wiki/sources/VnPay-System-Architecture.md` | ✅ Đọc | 13 service Kubernetes — IDS4 là single point of failure |
| 9 | `wiki/architecture/2FA-IDS4-Architecture.md` | ✅ Đọc | TOTP 2FA component, flow, backend security |
| 10 | `wiki/flows/Flow-LDAP-Login.md` | ✅ Đọc | LDAP flow setup + runtime, LDAPS pending |
| 11 | `wiki/concepts/HRM-Security-Config.md` | ✅ Đọc | RBAC, VnPay pentest findings, webconfig keys |

**Tổng vòng 1:** 11 file đọc · 0 bỏ qua · 6 leads mới

### Vòng 2 — Mở rộng theo leads

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 12 | `raw/Area/SSO/Giao thức SSO.md` | ✅ Đọc | Xác nhận 3 giao thức — trùng SSO-HRM-Protocols |
| 13 | `raw/Area/SSO/SSO web main.md` | ⏭ Bỏ qua | Stub rỗng — chỉ có frontmatter |
| 14 | `raw/Area/SSO/SSO web portal.md` | ⏭ Bỏ qua | Stub rỗng — chỉ có frontmatter |
| 15 | `raw/Area/SSO/SSO mobile app.md` | ⏭ Bỏ qua | Stub rỗng — chỉ có frontmatter |
| 16 | `raw/Area/SSO/OKTA.md` | ✅ Đọc | Hướng dẫn Okta: setup, flow, API login, bảo mật |
| 17 | `raw/Area/SSO-NetCore/Hướng dẫn identity.md` | ✅ Đọc | NetCore login flow — xác nhận 2 codebase khác cách config |
| 18 | `raw/Tổng Hợp/3-5 Bao mat API OIDC.md` | ✅ Đọc | Scope phân quyền OIDC — metadata + link tới chủ đề rộng hơn |
| 19 | `raw/VnPay/Identity - Multi Node.md` | ✅ Đọc | 💡 **Phát hiện quan trọng**: 5 shared components IDS4 multi-node |

**Tổng vòng 2:** 5 file đọc · 3 bỏ qua (stub rỗng) · 2 leads mới

### Vòng 3 — Đọc nguồn bổ sung

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 20 | `wiki/sources/2fa-ids4-solution.md` | ✅ Đọc | Xác nhận TOTP detail — trùng với 2FA-IDS4-Architecture |
| 21 | `wiki/sources/Daily-2024-Vietcap-SSO-Security.md` | ✅ Đọc | LTG SSO email login, API GetIntegratedUserList, bug IsDelete |
| 22 | `raw/0.Daily/2024-Jun-23/SSO Okta OIDC.md` | ✅ Đọc | 💡 **Tìm được auth.config JSON mẫu Azure AD thực tế từ Colgate** |

**Tổng vòng 3:** 3 file đọc · 0 bỏ qua · 0 leads mới

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng 3: không còn lead mới phát sinh.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng vòng tìm kiếm | 3 vòng |
| File đã đọc chi tiết | 16 file |
| Bỏ qua (stub rỗng) | 3 file |
| Leads theo đuổi | 8 leads |
| Mâu thuẫn phát hiện | 3 điểm |
| Bất thường | IDS4 multi-node issue chưa được wiki chính thức |

### Phát hiện bất thường & mâu thuẫn

- **IDS4 multi-node issue**: Tài liệu `Identity - Multi Node.md` chỉ tồn tại trong `raw/Projects` — chưa được ingest vào wiki chính. Đây là thông tin kỹ thuật quan trọng (đã xảy ra tháng 11/2025) nhưng chưa được promote lên wiki architecture.
- **Mâu thuẫn IDS4 security**: `wiki/architecture/HRM-Auth-Architecture` mô tả IDS4 là mô hình bảo mật cao nhất, nhưng `wiki/concepts/HRM-Security-Config` ghi nhận VnPay pentest phát hiện 2 lỗi token management nghiêm trọng — **dùng HRM-Auth-Architecture cho overview, dùng HRM-Security-Config + pentest report cho thực tế**.
- **LDAPS unconfirmed**: `Flow-LDAP-Login.md` ghi rõ "chưa xác nhận hoạt động thực tế" — mâu thuẫn với việc UI có option `LDAP+SSL`.

### Câu hỏi suy ngẫm

**🔬 Tư duy nguyên bản — FPT**
> Chúng ta mặc định SSO "an toàn hơn" local auth — nhưng nếu bỏ giả định đó đi: với JWT SSO nội bộ (shared secret plaintext, không có revocation), local auth SHA2-512 với VnrDecrypt có thực sự kém bảo mật hơn không? Nền tảng thực sự của "SSO an toàn hơn" là gì — giao thức hay implementation?

**🧠 Câu hỏi Socrate**
> Nếu IDS4 là "mô hình tốt nhất" nhưng thực tế có TTL 2 tháng và không blacklist logout — điều gì sẽ phải thay đổi trước tiên để làm cho kết luận đó đúng? Và tại sao 2 lỗi cơ bản này lại tồn tại trong production đủ lâu để pentest phát hiện?

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức**
> Nếu khách hàng mới hỏi "chúng tôi muốn SSO với Microsoft Azure AD" vào ngày mai — với thông tin từ báo cáo này, bước đầu tiên cụ thể là gì? (Gợi ý: không phải "cấu hình auth.config" — đó là bước thứ 4.)
