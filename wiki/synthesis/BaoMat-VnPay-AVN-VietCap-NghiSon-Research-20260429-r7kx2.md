---
description: "Nghiên cứu bảo mật 4 dự án VnPay/AVN/VietCap/NghiSon: so sánh lỗ hổng, pattern lặp lại CSP/Redis CVE, bài học chung và kiến nghị hệ thống."
type: synthesis
domain: security
tags:
  - security
  - vulnerability
  - pentest
  - sonar
  - vnpay
  - avn
  - vietcap
  - nghison
  - redis
  - sql-injection
  - hardcoded-secret
  - csp
  - broken-access-control
  - cve-2025-49844
  - owasp
created: 2026-04-29
research-code: r7kx2
related:
  - "[[wiki/sources/VnPay-Security-Vulnerability-Oct2025]]"
  - "[[wiki/sources/VietCap-Security-Vulnerability-Q42025]]"
  - "[[wiki/sources/AVN-Security-Vulnerability-2025]]"
  - "[[wiki/sources/NghiSon-Security-Vulnerability-2025]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
---

# Nghiên cứu: Bảo mật HRM — VnPay, AVN, VietCap, NghiSon (2025)

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings — Lỗ hổng theo từng khách hàng](#2-findings--lỗ-hổng-theo-từng-khách-hàng)
  - [2.1 VnPay — Pentest 13/10/2025](#21-vnpay--pentest-13102025)
  - [2.2 VietCap — Q4/2025](#22-vietcap--q42025)
  - [2.3 AVN — SonarQube 2025](#23-avn--sonarqube-2025)
  - [2.4 NghiSon — CVE-2025-49844](#24-nghison--cve-2025-49844)
- [3. Biểu đồ số liệu](#3-biểu-đồ-số-liệu)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành

Trong Q4/2025, HRM VnResource ghi nhận **45 lỗ hổng bảo mật** trải rộng trên 4 khách hàng lớn.[^1] VnPay có mức độ phức tạp cao nhất với 24 lỗ hổng qua pentest toàn diện — bao gồm 4 Critical nghiêm trọng về phân quyền, SQL Injection và chiếm tài khoản.[^2] CVE-2025-49844 (Redis RCE) là lỗ hổng infrastructure nguy hiểm nhất — xuất hiện đồng thời tại VietCap và NghiSon trong vòng 3 ngày, đều do khách hàng phát hiện thay vì nội bộ.[^3] AVN là dự án duy nhất dùng SonarQube phát hiện chủ động — tuy nhiên phát hiện 3 Critical Hardcoded Secrets trong code, là lỗi quy trình nghiêm trọng.[^4] Điểm chung xuyên suốt 4 khách hàng: **thiếu quy trình CVE tracking chủ động, phân quyền server-side chưa đầy đủ, và CSP chưa được cấu hình baseline ngay từ lúc deploy**.[^5]

---

## 1. Bối cảnh & Phạm vi

Phạm vi báo cáo gồm **4 dự án khách hàng** với các đợt kiểm tra bảo mật diễn ra trong Q4/2025.[^6] Nguồn dữ liệu bao gồm: báo cáo pentest nội bộ (VnPay), quét OWASP ZAP tự động (VietCap), phân tích SonarQube tĩnh (AVN), và báo cáo khách hàng (NghiSon).[^7]

| Khách hàng | Phương thức phát hiện | Ngày báo cáo | Tổng lỗ hổng |
|---|---|---|---|
| VnPay | Pentest nội bộ | 13/10/2025 | 24 |
| VietCap | OWASP ZAP + Khách hàng | 14–17/10/2025 | 11 |
| AVN | SonarQube (2 đợt) | 17/09 & 29/10/2025 | 9 |
| NghiSon | Khách hàng báo cáo | 20/10/2025 | 1 |
| **Tổng** | | | **45** |

Lưu ý: 44/45 lỗ hổng đã đóng hoặc chấp nhận rủi ro có chủ đích.[^8] Còn 1 lỗ hổng đang xử lý: CWE-598 trên Identity Server của VnPay (GET với access_token trên URL).[^9]

---

## 2. Findings — Lỗ hổng theo từng khách hàng

### 2.1 VnPay — Pentest 13/10/2025

VnPay thực hiện pentest toàn hệ thống HRM vào 13/10/2025 và phát hiện **24 lỗ hổng** (4 Critical, 6 High, 10 Medium, 4 Low).[^2] Đây là đợt kiểm tra bảo mật toàn diện nhất từ trước đến nay đối với hệ thống HRM VnPay, bao quát Mobile App, Employee Portal, Identity Server và HR Main Back Office.[^10]

**4 Critical đáng chú ý nhất:**

**CWE-269 — Privilege Escalation (Phân quyền client-side):**
Hệ thống tin tưởng hoàn toàn vào response của `GET /api/TestShared/TestPermission` để kiểm soát quyền người dùng phía client.[^11] Hacker chỉ cần intercept Burp Suite và sửa response để leo thang đặc quyền bất kỳ. Fix: thêm chữ ký (signature/HMAC) vào từng key quyền trả về — buộc server xác thực lại trước khi thực thi.

**CWE-284 — Account Takeover (Chiếm tài khoản):**
Toàn bộ API xác thực bằng `.SSO.Cookies.Main` đều bị ảnh hưởng — attacker có thể update thông tin user bất kỳ bao gồm super admin.[^11] Fix: thêm kiểm tra key quyền màn hình `Sys_User` tại API update user.

**CWE-89 — SQL Injection (PivotTable API):**
`POST /api/Sys_PivotTable/` cho phép truyền query SQL tùy ý, attacker có thể truy vấn toàn bộ database.[^11] Fix: chỉ cho phép tên stored procedure, chỉ super-admin gọi được, blacklist keyword nguy hiểm (`update, create, delete, drop, select...`).

**CWE-284 — Broken Access Control (28 API Portal):**
28 endpoint trên Employee Portal — toàn bộ luồng OT, nghỉ phép, chấm công, hợp đồng, nghỉ việc — không xác thực đúng quyền người dùng.[^12] Fix: xác thực token + validate ProfileID + check userapprove.

**Lỗ hổng còn tồn đọng:**
CWE-598 — Identity Server dùng `GET /identityHub?access_token=*` — truyền token nhạy cảm qua URL parameter, dễ bị lưu vào server log.[^9] Đây là lỗ hổng duy nhất trong 24 mục chưa được đóng hoàn toàn.

---

### 2.2 VietCap — Q4/2025

VietCap phát hiện **11 lỗ hổng** qua 2 đợt kiểm tra tháng 10/2025: đợt 1 dùng OWASP ZAP tự động (10 lỗ hổng nhóm CSP/CORS/CSRF/JS library), đợt 2 do khách hàng báo cáo CVE Critical trên Redis.[^13]

**1 Critical — CVE-2025-49844 (Redis RCE):**
Redis Lua scripting use-after-free — kẻ tấn công thoát sandbox Lua, mở reverse shell, kiểm soát host hoàn toàn.[^3] Khai thác thành công cho phép: đọc `/etc/passwd`, SSH keys, token môi trường; ghi malware/coin miner/ransomware. Fix: nâng Redis lên ≥ v8.2.2.

**2 High — JS Libraries lỗi thời:**
- Lodash 4.17.15 chứa 3 CVE (CVE-2021-23337, CVE-2020-28500, CVE-2020-8203) — Prototype Pollution + Command Injection.[^13] Fix: nâng lên 4.17.21.
- Highcharts v8.2.2 chứa CVE-2021-29489 — XSS qua `chart.setTitle()`.[^13] Fix: nâng lên v12.4.0.

**8 Medium — Nhóm CSP/CORS/CSRF:**
5/11 lỗ hổng liên quan Content Security Policy: header không được set, wildcard directive, script-src unsafe-inline, style-src unsafe-inline, không có fallback directive.[^14] Đây là bằng chứng rõ ràng CSP chưa được cấu hình baseline khi deploy VietCap.

**Nhận xét phương thức phát hiện:**
CVE-2025-49844 được phát hiện do khách hàng báo, không phải ZAP hay nội bộ.[^15] ZAP chỉ phát hiện các lỗ hổng tầng ứng dụng web — không quét được lỗ hổng infrastructure (Redis version).

---

### 2.3 AVN — SonarQube 2025

AVN là dự án duy nhất trong 4 khách hàng sử dụng **SonarQube** để phân tích tĩnh mã nguồn, phát hiện **9 lỗ hổng** qua 2 đợt quét (17/09 và 29/10/2025).[^16]

**3 Critical — Hardcoded Secrets (CWE-798):**
Mật khẩu cơ sở dữ liệu, Azure Storage Account Key, và service account key được lưu cứng trực tiếp trong mã nguồn — kể cả trong comment code.[^4] Đây là lỗi quy trình nghiêm trọng nhất: nếu code repo bị leak, toàn bộ credentials bị lộ. Fix: xóa khỏi code/comment, dùng Secret Manager hoặc biến môi trường.

**1 Critical — CSP không đủ chặt (CWE-1021):**
Content Security Policy chưa đủ restrictive → XSS risk từ nguồn thư viện JS không được kiểm soát.[^16] Fix: thêm nonce/strict-dynamic, whitelist nguồn JS tin cậy.

**5 High — Nhóm TLS/SSL và Crypto:**
- CWE-327: Giao thức mã hóa yếu (cần nâng lên TLS 1.2+).[^16]
- CWE-295: SSL/TLS Certificate Validation bị tắt — xuất hiện **2 lần** trên 2 module khác nhau (Hệ thống chính và UHelp SSF).[^17] Đây là lỗi mang tính hệ thống.
- CWE-916: KDF iteration count thấp — chấp nhận ngoại lệ do ràng buộc tương thích dữ liệu cũ.[^18]
- CWE-329: AES padding scheme không an toàn — dùng `AesManaged()` thay vì `Aes.Create()`.[^16]

**Bối cảnh bảo mật dự án AVN:**
Song song với lỗ hổng Sonar, AVN cũng đang yêu cầu chuyển từ LDAP (port 389, plaintext) sang LDAPS (port 636, SSL) vì lý do bảo mật.[^19] Đây là yêu cầu hợp lý — LDAP không mã hóa credentials khi truyền trên mạng.

---

### 2.4 NghiSon — CVE-2025-49844

NghiSon phát hiện **1 lỗ hổng Critical** vào 20/10/2025 — do khách hàng báo cáo, không phải nội bộ phát hiện.[^20] Đây là cùng CVE-2025-49844 đã xuất hiện tại VietCap 3 ngày trước (17/10/2025).

**CVE-2025-49844 — Redis Lua Scripting Use-After-Free (RCE):**
Lỗi use-after-free trong subsystem Lua scripting của Redis cho phép attacker thoát khỏi sandbox Lua và thực thi mã tùy ý trên host.[^3] Nếu khai thác thành công: mở shell/reverse shell, kiểm soát host, đọc toàn bộ file nhạy cảm (`/etc/passwd`, SSH keys, token môi trường), cài đặt malware/miner. Fix: nâng Redis ≥ v8.2.2.

**Điểm quan trọng:**
Cùng CVE, cùng thời điểm tháng 10/2025, trên 2 dự án khác nhau — cả 2 đều do khách hàng phát hiện.[^15] Điều này cho thấy không có quy trình theo dõi CVE infrastructure chủ động trong toàn bộ danh mục dự án.

---

## 3. Biểu đồ số liệu

### 📊 Biểu đồ 1: So sánh tổng số lỗ hổng theo mức độ — 4 khách hàng

> 💡 VnPay chiếm 53% tổng lỗ hổng (24/45) với 4 Critical từ pentest toàn diện; AVN có tỷ lệ Critical cao nhất trong tổng lỗ hổng (4/9 = 44%) do hardcoded secrets và CSP; VietCap và NghiSon đều gặp cùng CVE-2025-49844 Redis RCE Critical dù chỉ cách nhau 3 ngày.

```chart
type: bar
labels: [VnPay, VietCap, AVN, NghiSon]
series:
  - title: Critical
    data: [4, 1, 4, 1]
    backgroundColor: "#d62728"
  - title: High
    data: [6, 2, 5, 0]
    backgroundColor: "#ff7f0e"
  - title: Medium
    data: [10, 8, 0, 0]
    backgroundColor: "#f7b731"
  - title: Low
    data: [4, 0, 0, 0]
    backgroundColor: "#2ca02c"
xTitle: Khách hàng
yTitle: Số lỗ hổng
options:
  scales:
    x:
      grid:
        display: false
      stacked: true
    y:
      grid:
        display: false
      stacked: true
  plugins:
    datalabels:
      display: true
      anchor: center
      align: center
```

**📋 Số liệu biểu đồ 1**

| Khách hàng | Critical | High | Medium | Low | Tổng |
|---|---|---|---|---|---|
| VnPay | 4 | 6 | 10 | 4 | **24** |
| VietCap | 1 | 2 | 8 | 0 | **11** |
| AVN | 4 | 5 | 0 | 0 | **9** |
| NghiSon | 1 | 0 | 0 | 0 | **1** |
| **Tổng** | **10** | **13** | **18** | **4** | **45** |

> 🎯 **Nên làm**: Ưu tiên xử lý 10 Critical trước — đặc biệt 4 Critical VnPay (đã xong) và 4 Critical AVN (hardcoded secrets cần kiểm tra lại toàn bộ repo).

---

### 📊 Biểu đồ 2: Phân bố lỗ hổng theo loại/nhóm kỹ thuật (toàn bộ 4 KH)

> 💡 Access Control & Phân quyền chiếm nhóm lớn nhất (11 lỗ hổng — 24%), bao gồm 28 API Portal VnPay, Account Takeover và IDOR. CSP/CORS/Headers là nhóm lớn thứ hai (10 lỗ hổng — 22%) tập trung hoàn toàn ở VietCap và AVN, cho thấy đây là điểm yếu cấu hình infrastructure phổ biến.

```chart
type: bar
labels: [Access Control, CSP/CORS/Headers, Session/Token, XSS, Crypto/TLS, Hardcoded Secrets, Redis RCE, SQL Injection, Khác]
series:
  - title: Số lỗ hổng
    data: [11, 10, 4, 4, 4, 3, 2, 1, 6]
    backgroundColor: "#4e79a7"
xTitle: Nhóm lỗ hổng
yTitle: Số lỗ hổng
options:
  scales:
    x:
      grid:
        display: false
    y:
      grid:
        display: false
  plugins:
    datalabels:
      display: true
      anchor: end
      align: top
```

**📋 Số liệu biểu đồ 2**

| Nhóm lỗ hổng | Số lỗ hổng | Khách hàng |
|---|---|---|
| Access Control & Phân quyền | 11 | VnPay (CWE-284 ×2, CWE-269, CWE-639, CWE-306) |
| CSP / CORS / Security Headers | 10 | VietCap (5 CSP, 1 CORS, 1 clickjacking), AVN (1 CSP), VnPay (1 anonymous) |
| Session & Token Management | 4 | VnPay (CWE-613 ×2, CWE-598, CWE-521) |
| XSS | 4 | VnPay (CWE-79 ×3), VietCap (1 qua Highcharts) |
| Crypto & TLS/SSL | 4 | AVN (CWE-327, CWE-295 ×2, CWE-329) |
| Hardcoded Secrets | 3 | AVN (CWE-798 ×3) |
| Redis RCE | 2 | VietCap + NghiSon (CVE-2025-49844) |
| SQL Injection | 1 | VnPay (CWE-89) |
| Khác (Mobile, DoS, Logic, Info Disclosure, KDF) | 6 | VnPay (CWE-926, CWE-770, CWE-840, CWE-200, CWE-212, CWE-20), AVN (CWE-916) |

> 🎯 **Nên làm**: Xây dựng security checklist riêng cho 3 nhóm top: (1) Server-side authorization review, (2) CSP/CORS baseline template, (3) Secret scanning pre-commit hook.

---

### 📊 Biểu đồ 3: Phương thức phát hiện lỗ hổng — 4 khách hàng

> 💡 42/45 lỗ hổng (93%) được phát hiện bởi nội bộ hoặc công cụ tự động (pentest, ZAP, Sonar). Tuy nhiên, **3 lỗ hổng Critical nguy hiểm nhất** — cả 3 đều là Redis RCE CVE-2025-49844 (VietCap 1 + NghiSon 1) và thực tế 2/2 trường hợp Redis đều do **khách hàng phát hiện**, không phải nội bộ. Điều này phơi bày khoảng trống lớn trong giám sát CVE infrastructure.

```chart
type: pie
labels: [Pentest nội bộ (VnPay), OWASP ZAP tự động (VietCap), SonarQube tĩnh (AVN), Khách hàng báo cáo (VietCap+NghiSon)]
series:
  - title: Phân bố phương thức
    data: [24, 10, 9, 2]
    backgroundColor: ["#4e79a7", "#f28e2b", "#59a14f", "#e15759"]
options:
  plugins:
    datalabels:
      display: true
      anchor: center
      align: center
```

**📋 Số liệu biểu đồ 3**

| Phương thức phát hiện | Số lỗ hổng | Ghi chú |
|---|---|---|
| Pentest nội bộ | 24 | VnPay — toàn diện nhất |
| OWASP ZAP tự động | 10 | VietCap đợt 1 (14/10) |
| SonarQube phân tích tĩnh | 9 | AVN — 2 đợt |
| Khách hàng báo cáo | 2 | VietCap + NghiSon — đều là Redis CVE-2025-49844 |

> 🎯 **Nên làm**: Triển khai CVE monitoring tự động (Trivy/Grype) cho tất cả môi trường production — mục tiêu zero "khách hàng phát hiện trước" với lỗ hổng Critical infrastructure.

---

## 4. Phân tích & Nhận định

### 4.1 Pattern xuyên suốt 4 khách hàng

**Phân quyền phía server là điểm yếu số 1:**
VnPay (CWE-269 Privilege Escalation) phơi bày vấn đề kiến trúc nghiêm trọng — toàn bộ phân quyền được thực hiện phía client dựa vào response API.[^21] Đây không phải lỗi code đơn lẻ mà là lỗi thiết kế hệ thống. Pattern tương tự xuất hiện ở Broken Access Control 28 API Portal — cho thấy đây là vấn đề hệ thống, không phải cá biệt.

**CVE-2025-49844 Redis RCE — lỗ hổng đa dự án:**
Cùng một CVE xuất hiện tại VietCap (17/10) và NghiSon (20/10) — cách nhau 3 ngày.[^3] Cả 2 đều do khách hàng phát hiện.[^15] Điều này chứng minh không có quy trình CVE feed chủ động cho infrastructure components (Redis, OS, framework). Khi VietCap báo CVE Critical, phải có trigger tự động để kiểm tra tất cả dự án đang dùng Redis — không để NghiSon phát hiện sau 3 ngày.

**Hardcoded Secrets là lỗi quy trình, không phải lỗi kỹ thuật:**
3 Critical CWE-798 tại AVN (DB password, Azure Key, service account key trong comment) không phải do thiếu kiến thức bảo mật, mà do thiếu quy trình kiểm soát.[^4] Pre-commit hook với secret scanning (git-secrets, TruffleHog, Gitleaks) sẽ ngăn chặn hoàn toàn nhóm lỗi này.

**CSP là điểm yếu cấu hình deploy:**
VietCap có 5/11 lỗ hổng liên quan CSP, AVN có 1 Critical CSP.[^14] Pattern này cho thấy CSP không được đưa vào checklist deploy tiêu chuẩn. Khi khởi tạo môi trường mới, team deploy không cấu hình CSP baseline → lỗ hổng tích lũy đến khi bị quét.

### 4.2 So sánh mức độ nghiêm trọng

VnPay có số lỗ hổng nhiều nhất (24) nhưng cũng có quy trình pentest bài bản nhất — toàn bộ 23/24 đã đóng.[^2] AVN dù chỉ có 9 lỗ hổng nhưng chứa nhóm nguy hiểm về quy trình (hardcoded secrets, SSL validation tắt) — là dấu hiệu của vấn đề văn hóa bảo mật trong quá trình phát triển.[^16] NghiSon chỉ có 1 lỗ hổng nhưng là RCE Critical — nếu không được patch kịp, toàn bộ host bị kiểm soát.[^20]

### 4.3 Bối cảnh lịch sử

Nền tảng bảo mật HRM đã được xây dựng từ 2024: XSS filter HasXSSConfig cho VietCap, fix SQL injection store, Broken Access Control GetEnum/GetUserList.[^22] Các lỗ hổng Q4/2025 cho thấy mặc dù đã có foundation tốt, nhưng các lỗ hổng mới vẫn tiếp tục xuất hiện ở tầng kiến trúc (phân quyền client-side) và quy trình (hardcoded secrets, CVE tracking).

---

## 5. Gaps & Hạn chế

- **Không có timeline patch chi tiết**: Báo cáo ghi nhận trạng thái "Đã đóng" nhưng không có thông tin ngày patch, ai xử lý, thời gian từ phát hiện đến fix — không đánh giá được SLA bảo mật.[^23]
- **"Bỏ qua" chưa phân loại rõ**: Nhiều lỗ hổng ghi "Đã đóng / Bỏ qua" — không rõ bao nhiêu mục thực sự được fix, bao nhiêu được chấp nhận rủi ro có chủ đích (như CWE-916 AVN).[^23]
- **Thiếu dữ liệu về môi trường bị ảnh hưởng**: VnPay dùng K8s 13 services — không rõ lỗ hổng nào ảnh hưởng service cụ thể nào, risk blast radius thực sự là bao nhiêu.[^23]
- **Chưa có dữ liệu về các khách hàng khác**: Báo cáo chỉ bao gồm 4 khách hàng — không rõ LTG, Bitex, QuickPack, TrungDong có lỗ hổng tương tự không (đặc biệt Redis CVE-2025-49844).[^23]
- **Chưa verify patch CVE-2025-49844 toàn bộ danh mục**: CVE Redis ảnh hưởng tất cả nơi dùng Redis — không có danh sách đầy đủ dự án đang dùng Redis và trạng thái patch.[^23]

---

## 6. Gợi ý hành động

**Ưu tiên 1 — Ngay lập tức (trong tuần):**
1. **Audit Redis version toàn bộ dự án**: Liệt kê tất cả môi trường production đang dùng Redis, xác nhận đã nâng lên ≥ v8.2.2 — không chỉ VietCap và NghiSon.
2. **Kiểm tra CWE-598 VnPay còn tồn đọng**: Identity Server `GET /identityHub?access_token=*` — lên kế hoạch chuyển sang POST với token trong Authorization header.

**Ưu tiên 2 — Trong tháng:**
3. **Thêm secret scanning vào git pre-commit hook**: Dùng Gitleaks hoặc git-secrets để phát hiện hardcoded credentials (DB password, Azure key, API key) trước khi commit. Audit lại toàn bộ repo AVN và các repo khác.
4. **Chuẩn hóa CSP baseline template**: Tạo template `web.config` / `IIS config` chuẩn với CSP header đầy đủ — áp dụng cho tất cả dự án mới triển khai. Tham khảo VietCap fix Q4/2025.
5. **Kiến trúc lại phân quyền server-side**: Review toàn bộ luồng `TestPermission` — phân quyền phải validate phía server, không tin tưởng client response. Áp dụng pattern từ fix VnPay CWE-269.

**Ưu tiên 3 — Trong quý:**
6. **Triển khai CVE monitoring tự động**: Subscribe CVE feed cho Redis, .NET, IIS, OS. Dùng Trivy/Grype quét container/package định kỳ. Khi có CVE Critical mới → trigger audit toàn danh mục dự án trong 24h.
7. **Chuẩn hóa security review gate**: Trước go-live mỗi dự án, bắt buộc: (a) Sonar scan không có Critical, (b) OWASP ZAP scan baseline, (c) checklist 10 điểm bảo mật (CSP, CORS, token blacklist, secret scan, SSL validation).
8. **Token blacklist sau logout**: Pattern từ VnPay CWE-613 — áp dụng cho tất cả dự án dùng JWT/Bearer token. Token sau logout phải được thêm vào Redis blacklist ngay lập tức.

---

## Tài liệu tham khảo

### Nguồn Wiki — Bảo mật 4 khách hàng

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^2] | [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] | source | Pentest 13/10/2025: 24 lỗ hổng, 4 Critical (SQLi, Account Takeover, Privilege Escalation, BAC) |
| [^13] | [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] | source | Q4/2025: 11 lỗ hổng, 1 Critical Redis RCE, 2 High JS libs, 8 Medium CSP/CORS |
| [^16] | [[wiki/sources/AVN-Security-Vulnerability-2025]] | source | SonarQube 2025: 9 lỗ hổng, 3 Critical Hardcoded Secrets, 1 Critical CSP, 5 High TLS/AES/KDF |
| [^20] | [[wiki/sources/NghiSon-Security-Vulnerability-2025]] | source | 20/10/2025: CVE-2025-49844 Redis RCE Critical — khách hàng phát hiện |

### Nguồn Wiki — Nền & Context

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^22] | [[wiki/sources/Daily-2024-Security-Fixes]] | source | Bảo mật HRM 2024: XSS grid, SQL injection store, BAC GetEnum/GetUserList |
| [^22] | [[wiki/sources/Daily-2024-Vietcap-SSO-Security]] | source | VietCap 2024: XSS filter HasXSSConfig, bug IsDelete login |
| [^5] | [[wiki/concepts/HRM-Security-Config]] | concept | Tổng hợp bảo mật HRM: VnrDecrypt, CORS, password policy, tóm tắt cross-4-KH |
| [^19] | [[wiki/projects/AVN-Project]] | project | Dự án AVN active: yêu cầu LDAPS, 9 lỗ hổng Sonar |

### Suy luận AI

| # | Loại | Giải thích |
|---|------|-----------|
| [^21] | [inference] | Nhận định "lỗi thiết kế hệ thống" từ phân tích CWE-269 — không có nguồn gốc rễ kiến trúc rõ ràng, suy luận từ mô tả lỗ hổng |
| [^23] | [inference] | Gaps về timeline patch, phân loại "bỏ qua", môi trường bị ảnh hưởng — suy luận từ thiếu thông tin trong nguồn |

---

[^1]: [[wiki/concepts/HRM-Security-Config]] — Tổng hợp cross-reference 4 khách hàng: 45 lỗ hổng Q4/2025
[^2]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — Pentest 13/10/2025: 24 lỗ hổng, 4 Critical
[^3]: [[wiki/sources/NghiSon-Security-Vulnerability-2025]] — CVE-2025-49844 Redis RCE; [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] — cùng CVE 17/10/2025
[^4]: [[wiki/sources/AVN-Security-Vulnerability-2025]] — CWE-798: DB password, Azure Key, service account key trong code/comment
[^5]: [inference] — Pattern chung từ phân tích so sánh 4 nguồn bảo mật
[^6]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] + [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] + [[wiki/sources/AVN-Security-Vulnerability-2025]] + [[wiki/sources/NghiSon-Security-Vulnerability-2025]] — metadata thời gian
[^7]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] + [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] + [[wiki/sources/AVN-Security-Vulnerability-2025]] + [[wiki/sources/NghiSon-Security-Vulnerability-2025]] — metadata phương thức phát hiện
[^8]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — 23/24 đóng, 1 đang xử lý; các nguồn còn lại — tất cả đóng/bỏ qua
[^9]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — CWE-598: Identity Server GET /identityHub?access_token=* — "Đang xử lý"
[^10]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — mô tả scope: Mobile App, Employee Portal, Identity Server, HR Main BO
[^11]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — Key Takeaways và Trích dẫn quan trọng phần CWE-269, CWE-284, CWE-89
[^12]: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — #11 CWE-284 Broken Access Control 28 API Portal
[^13]: [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] — danh sách lỗ hổng đầy đủ
[^14]: [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] — Key Takeaways: "5/11 lỗ hổng liên quan trực tiếp đến Content Security Policy"
[^15]: [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] + [[wiki/sources/NghiSon-Security-Vulnerability-2025]] — "do khách hàng phát hiện"
[^16]: [[wiki/sources/AVN-Security-Vulnerability-2025]] — danh sách lỗ hổng đầy đủ, Key Takeaways
[^17]: [[wiki/sources/AVN-Security-Vulnerability-2025]] — "CWE-295 tái xuất hiện: lỗi xác thực SSL/TLS xuất hiện 2 lần trên 2 module khác nhau"
[^18]: [[wiki/sources/AVN-Security-Vulnerability-2025]] — CWE-916 Notes: "Chấp nhận ngoại lệ do ràng buộc tương thích giải mã"
[^19]: [[wiki/projects/AVN-Project]] — "Khách hàng yêu cầu dùng LDAPS thay LDAP vì lý do bảo mật (port 636, SSL)"
[^20]: [[wiki/sources/NghiSon-Security-Vulnerability-2025]] — "Phát hiện bởi: Khách hàng", ngày 20/10/2025
[^21]: [inference] — Phân tích CWE-269 mô tả "hoàn toàn dựa vào response trả về ở api testpermission để thực hiện phân quyền" → suy luận đây là vấn đề thiết kế kiến trúc
[^22]: [[wiki/sources/Daily-2024-Security-Fixes]] + [[wiki/sources/Daily-2024-Vietcap-SSO-Security]] — bảo mật nền 2024
[^23]: [inference] — Gaps xác định từ thiếu thông tin trong các nguồn: không có ngày patch cụ thể, không phân biệt "fix" vs "accept risk", không có danh sách Redis toàn dự án

---

## Hành trình nghiên cứu

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | `wiki/index.md` | ✅ Đọc | Xác định 4 nguồn bảo mật chính + 4 nguồn nền liên quan |
| 2 | `wiki/synthesis/` (list) | ✅ Scan | Không có báo cáo bảo mật 4-KH trước đó — không trùng |
| 3 | `wiki/sources/VnPay-Security-Vulnerability-Oct2025.md` | ✅ Đọc | 24 lỗ hổng đầy đủ, 4 Critical, danh sách chi tiết |
| 4 | `wiki/sources/VietCap-Security-Vulnerability-Q42025.md` | ✅ Đọc | 11 lỗ hổng, 1 Critical Redis RCE CVE-2025-49844 |
| 5 | `wiki/sources/AVN-Security-Vulnerability-2025.md` | ✅ Đọc | 9 lỗ hổng Sonar, 3 Critical hardcoded secrets |
| 6 | `wiki/sources/NghiSon-Security-Vulnerability-2025.md` | ✅ Đọc | 1 Critical CVE-2025-49844 — cùng VietCap, 3 ngày sau |

**Tổng vòng 1:** 6 file đọc · 0 bỏ qua · 4 lead mới (Daily-2024-Security-Fixes, Daily-2024-Vietcap-SSO-Security, HRM-Security-Config, AVN-Project)

### Vòng 2 — Mở rộng theo lead

> 🔄 Lý do mở rộng: cần bối cảnh lịch sử bảo mật 2024 và context dự án AVN để làm rõ pattern và điểm yếu tích lũy

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 7 | `wiki/sources/Daily-2024-Security-Fixes.md` | ✅ Đọc | Bảo mật HRM 2024: XSS grid, SQLi store, BAC GetEnum — nền tảng trước Q4/2025 |
| 8 | `wiki/sources/Daily-2024-Vietcap-SSO-Security.md` | ✅ Đọc | HasXSSConfig filter, bug IsDelete — VietCap 2024 đã có vấn đề bảo mật trước |
| 9 | `wiki/concepts/HRM-Security-Config.md` | ✅ Đọc | Tổng hợp đã có sẵn cross-4-KH — rất hữu ích, tiết kiệm phân tích |
| 10 | `wiki/projects/AVN-Project.md` | ✅ Đọc | Context LDAPS + xác nhận 9 lỗ hổng Sonar |

**Tổng vòng 2:** 4 file đọc · 0 bỏ qua · 0 lead mới phát sinh

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng 2: HRM-Security-Config đã có sẵn tổng hợp cross-reference đầy đủ — không còn lead mới.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng file đã đọc | 10 file |
| Bỏ qua | 0 file |
| Leads theo đuổi | 4 leads |
| Bất thường phát hiện | 1 điểm |
| Mâu thuẫn dữ liệu | 0 điểm |

### Phát hiện bất thường

- **Trùng CVE**: `VietCap-Security-Vulnerability-Q42025` và `NghiSon-Security-Vulnerability-2025` cùng ghi nhận CVE-2025-49844, cách nhau 3 ngày (17/10 và 20/10/2025) — đều do khách hàng phát hiện, không phải nội bộ. Đây không phải bất thường dữ liệu mà là **bất thường quy trình** — ghi nhận vào phần phân tích.
- **synthesis/GiaoBan-2026-Research-20260429** tồn tại trong index nhưng file thực tế không có trong `list_directory` — có thể index chưa đồng bộ. Không ảnh hưởng đến chủ đề nghiên cứu này.

### Câu hỏi suy ngẫm

**🔬 Tư duy nguyên bản — FPT** *(First Principles Thinking)*
> Chúng ta mặc định "security review" là việc làm **sau** khi code xong — nhưng nếu bỏ giả định đó đi: tại sao 3 Critical Hardcoded Secrets của AVN không bị chặn ngay từ lúc developer gõ password vào file? Nền tảng thực sự không phải là "review code" mà là **không để bí mật tiếp xúc với plain text trong developer workflow** — secret manager, vault, biến môi trường inject lúc deploy. Liệu quy trình phát triển HRM hiện tại có coi secret management là first-class concern, hay vẫn đang dùng `appsettings.json` như một nơi "tạm" rồi quên remove?

**🧠 Câu hỏi Socrate** *(Socratic Questioning)*
> CVE-2025-49844 Redis RCE xuất hiện tại VietCap (17/10) và NghiSon (20/10) — cả hai đều do khách hàng phát hiện. Nếu **không có khách hàng nào báo**, bao lâu nữa team nội bộ sẽ biết? Và nếu câu trả lời là "không rõ" hoặc "không bao giờ" — điều đó nói lên gì về giả định "chúng ta đang kiểm soát bảo mật infrastructure của mình"?

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức**
> Với 10 Critical lỗ hổng đã được xác định trên 4 khách hàng — nếu phải hành động ngay hôm nay để giảm thiểu rủi ro tương tự cho **các dự án chưa bị pentest** (LTG, Bitex, QuickPack, TrungDong...), bước đầu tiên cụ thể là gì? Gợi ý: không phải "viết thêm security policy" — mà là chạy `redis-cli INFO server | grep redis_version` trên từng production server trong 30 phút tới, rồi ghi kết quả vào bảng theo dõi patch.
