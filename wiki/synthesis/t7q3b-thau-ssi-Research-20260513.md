---
type: synthesis
code: t7q3b
tags:
  - "ssi"
  - "dau-thau"
  - "hrm"
  - "research"
research-topic: Đấu thầu VnResource HRM Pro cho SSI (Chứng khoán SSI)
sources-wiki:
  - "wiki/projects/SSI-Project"
  - "wiki/sources/x2p7k-thau-ssi-ho-so-tong-the"
  - "wiki/sources/q3r6t-ssi-api-spec"
  - "wiki/sources/j5k9w-ssi-security-requirements"
  - "wiki/sources/v7m2p-ssi-devops-requirements"
  - "wiki/sources/f8c4n-ssi-infrastructure-requirements"
  - "wiki/architecture/m4n8b-ssi-kien-truc-giai-phap"
sources-raw:
  - "raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/ (183 files)"
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/sources/q3r6t-ssi-api-spec]]"
  - "[[wiki/sources/j5k9w-ssi-security-requirements]]"
  - "[[wiki/sources/v7m2p-ssi-devops-requirements]]"
  - "[[wiki/sources/f8c4n-ssi-infrastructure-requirements]]"
  - "[[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]"
---

# Nghiên cứu: Đấu thầu HRM Pro cho SSI

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings — Những gì tìm thấy](#2-findings--những-gì-tìm-thấy)
  - [2.1 Quy mô & Phạm vi hồ sơ thầu](#21-quy-mô--phạm-vi-hồ-sơ-thầu)
  - [2.2 API Integration — 24 Endpoints hai chiều](#22-api-integration--24-endpoints-hai-chiều)
  - [2.3 Bảo mật — 47 Items bắt buộc](#23-bảo-mật--47-items-bắt-buộc)
  - [2.4 DevOps — Enterprise-grade CI/CD & Observability](#24-devops--enterprise-grade-cicd--observability)
  - [2.5 Hạ tầng — 5-Server Topology Production](#25-hạ-tầng--5-server-topology-production)
  - [2.6 Kiến trúc giải pháp — Multi-tier SOA](#26-kiến-trúc-giải-pháp--multi-tier-soa)
- [3. Biểu đồ số liệu](#3-biểu-đồ-số-liệu)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành

SSI là khách hàng chứng khoán lớn đặt bar kỹ thuật cao hơn hẳn các thầu HRM trước (183 file yêu cầu, 47 mục bảo mật bắt buộc, 24 API endpoints hai chiều).[^1] Ba điểm rủi ro thực sự ẩn: **(1)** Module **ESOP** (6.2.13) SSI yêu cầu API lấy dữ liệu ESOP khi thôi việc — chưa rõ HRM hiện tại có module này không, đây là gap có thể làm hỏng điểm kỹ thuật;[^2] **(2)** Yêu cầu **MFA bắt buộc toàn bộ tài khoản** kết hợp đồng bộ Azure AD trong 1h — nếu IDS4 hiện tại chưa đủ, đây là rủi ro lớn nhất cần xác nhận ngay;[^3] **(3)** SSI yêu cầu **rollback cả database schema** kèm approval gate production — quy trình deploy hiện tại của VnR có thể chưa đáp ứng. Hồ sơ thầu đã được lập đầy đủ 183 file và wikified — nhưng 3 gap kỹ thuật nêu trên cần được verify trước khi submit.[^4]

---

## 1. Bối cảnh & Phạm vi

Khách hàng là **Công ty Cổ phần Chứng khoán SSI** — một trong những công ty chứng khoán hàng đầu Việt Nam.[^1] Hồ sơ thầu mang tên **TLGP.HeThong** (Tài liệu Giải pháp Kỹ thuật), gồm 183 file chia thành 10 chương.[^1] VnResource đề xuất triển khai **HRM Pro** cho toàn bộ phân hệ: Nhân sự, Lương, Chấm công, BH, Tuyển dụng, Đào tạo, KPI, Ký số.[^1]

Tài liệu được xây dựng theo hai kịch bản hạ tầng song song: **On-cloud** và **On-premise** — SSI sẽ chọn một trong hai.[^1] Giai đoạn hiện tại (2026-05-13): chuẩn bị hồ sơ, chưa có kết quả trúng thầu.[^2]

Tech stack đề xuất: Angular 19 (frontend), .NET 8 (backend), SQL Server 2019, Redis Sentinel, Ocelot API Gateway, OAuth2/OpenID Connect.[^1]

---

## 2. Findings — Những gì tìm thấy

### 2.1 Quy mô & Phạm vi hồ sơ thầu

**Mô tả chi tiết**: Hồ sơ thầu SSI là bộ tài liệu kỹ thuật toàn diện nhất VnR từng chuẩn bị, gồm 183 file (Ch.1–Ch.10) bao phủ mọi khía cạnh: cấu hình hệ thống, SLA vận hành, API spec 24 endpoints, DevOps 33 items, bảo mật 47 items, kiến trúc giải pháp và hạ tầng.[^1] Số lượng file gấp đôi so với PTSC, với thêm toàn bộ chương riêng cho Security (Ch.9) và API (Ch.6).[^2]

**Tại sao quan trọng**: Quy mô tài liệu phản ánh mức độ kỳ vọng của SSI — đây là tổ chức tài chính có kiểm soát pháp lý nghiêm ngặt, không phải khách hàng thông thường. Bar kỹ thuật cao tương đương enterprise financial services, không phải HRM B2B thông thường.

**Rủi ro / Tác động**: Mỗi mục trong 183 file đều có thể trở thành tiêu chí chấm điểm kỹ thuật. Thiếu đáp ứng bất kỳ mục nào trong bảo mật/DevOps/API có thể dẫn đến trừ điểm hoặc loại thầu.

**Nguồn**: [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]][^1] | **Độ tin cậy**: Dữ kiện

---

### 2.2 API Integration — 24 Endpoints hai chiều

**Mô tả chi tiết**: Ch.6 định nghĩa 24 API endpoints theo hai hướng: **14 GET** (SSI kéo dữ liệu từ HRM: org, nhân viên, bảng công, chi phí lương, phiếu lương mã hóa, ca/holiday, nghỉ phép/OT, quỹ phép, quyết toán thôi việc, ESOP, hạn mức tuyển dụng) và **10 POST/PUT** (SSI đẩy dữ liệu vào HRM: nghỉ phép, thông tin cá nhân, ủy quyền thuế, kết quả HQCV, học tập/giảng dạy, kỳ thi, KPI đào tạo, đề xuất tuyển dụng).[^3] Đặc biệt: API 6.2.7 trả về phiếu lương **có mã hóa** — không plain text.[^3]

**Tại sao quan trọng**: Đây không phải API một chiều thông thường — SSI **đẩy ngược** kết quả HQCV, học tập, KPI vào HRM. Nghĩa là HRM phải xử lý dữ liệu ngoài nguồn (external source of truth), có rủi ro conflict với luồng đánh giá nội bộ.

**Rủi ro / Tác động**: API 6.2.13 (ESOP) — nếu module ESOP chưa có trong HRM hoặc chưa có store tương ứng, endpoint này sẽ không thể đáp ứng. Đây là gap kỹ thuật cần xác nhận trước khi ký hợp đồng.

**Nguồn**: [[wiki/sources/q3r6t-ssi-api-spec]][^3] | **Độ tin cậy**: Dữ kiện

---

### 2.3 Bảo mật — 47 Items bắt buộc

**Mô tả chi tiết**: Ch.9 là chương bảo mật dày đặc nhất, gồm 47 items chia 14 nhóm (9.1–9.14). Các yêu cầu nổi bật: MFA bắt buộc toàn bộ tài khoản (9.3.8), password lưu bcrypt/scrypt/Argon2 (9.3.6), session server-side (9.5.2), audit log mọi hành động nhạy cảm (9.4.5), data masking CMND/lương (9.12.2), TLS 1.2+ bắt buộc (9.9.1), OAuth2/mTLS cho mọi API tích hợp (9.11.2), đồng bộ Azure AD user disabled trong 1h (9.11.3), SLA patch Critical ≤ 72h (9.14.1).[^4]

**Tại sao quan trọng**: Đây là tiêu chí tài chính — SSI chịu kiểm soát của UBCK và tuân thủ ISO 27001 + Luật ANM 2025. Không có ngoại lệ. Hệ thống nếu trúng thầu sẽ đi qua pentest độc lập — mọi gap bảo mật sẽ bị phát hiện và báo cáo.

**Rủi ro / Tác động**: MFA trên IDS4 hiện tại chưa được xác nhận đầy đủ tính năng. Azure AD sync 1h là yêu cầu kỹ thuật cao — nếu user bị vô hiệu hóa tại AD nhưng vẫn còn session active trong HRM vượt quá 1h → rủi ro bảo mật nghiêm trọng theo tiêu chí SSI.

**Nguồn**: [[wiki/sources/j5k9w-ssi-security-requirements]][^4] | **Độ tin cậy**: Dữ kiện

---

### 2.4 DevOps — Enterprise-grade CI/CD & Observability

**Mô tả chi tiết**: Ch.7 yêu cầu 33 items DevOps chia 5 nhóm: containerization Docker/K8s bắt buộc (7.1.1), pipeline Build→SAST→Test→Deploy với approval gate production (7.2.2–7.2.4), deployment strategy Rolling/Blue-Green/Canary (7.2.5), zero downtime (7.2.6), rollback cả app lẫn database schema (7.2.8), RTO/RPO định nghĩa (7.3.1), DR drill định kỳ có bằng chứng (7.3.4), SLO + error budget (7.4.5), Prometheus/Grafana (7.5.2), distributed tracing OpenTelemetry/Jaeger (7.5.6).[^5]

**Tại sao quan trọng**: Yêu cầu **rollback database schema** (7.2.8) là điểm hiếm gặp trong các hồ sơ thầu HRM thông thường. Đây là yêu cầu SRE-grade — phần lớn deploy HRM hiện tại không có migration rollback tự động. Nếu VnR không có khả năng này, cần khai rõ hoặc xây dựng mới.

**Rủi ro / Tác động**: DR drill "định kỳ có bằng chứng" (7.3.4, 7.4.4) — nghĩa là không chỉ cam kết mà phải có tài liệu log/video drill. Nếu sau trúng thầu không thực hiện được, SSI có quyền phạt vi phạm SLA.

**Nguồn**: [[wiki/sources/v7m2p-ssi-devops-requirements]][^5] | **Độ tin cậy**: Dữ kiện

---

### 2.5 Hạ tầng — 5-Server Topology Production

**Mô tả chi tiết**: VnR đề xuất topology 5 server: 1 Nginx Proxy/LB (Linux, 4c/8GB), 2 App Server (Windows 2019, 16c/64GB mỗi node), 2 DB Server Active/Passive (SQL 2019, 16c/128GB mỗi node). Kết nối cáp quang 1Gbps giữa các node. DB HA bằng AlwaysOn AG hoặc Log Shipping. App layer stateless, session trên Redis Sentinel. Availability target 99.99%.[^6]

**Tại sao quan trọng**: Topology này là minimum viable cho production financial — tuy nhiên không có WAF riêng biệt trong server list, chỉ đề cập WAF trong kiến trúc logic. Nếu SSI kiểm tra vật lý, thiếu WAF appliance/instance riêng có thể bị trừ điểm.

**Rủi ro / Tác động**: 99.99% availability = ~53 phút downtime/năm. Với Active/Passive DB và chỉ 2 App node, nếu cùng lúc mất 1 App + 1 DB Active → downtime kéo dài hơn cam kết. Không có mention về DR site phần App (chỉ có DR cho DB backup).

**Nguồn**: [[wiki/sources/f8c4n-ssi-infrastructure-requirements]][^6] | **Độ tin cậy**: Dữ kiện

---

### 2.6 Kiến trúc giải pháp — Multi-tier SOA

**Mô tả chi tiết**: Kiến trúc đề xuất gồm 4 tầng: Presentation (Angular 19 + Employee Portal + Mobile API), Business (HRE/SAL/ATT/INS/REC/TRN), Data (Repository Pattern + EF), Infrastructure (Security/Auth/Redis/FileStorage). Lớp integration dùng Ocelot API Gateway với OAuth2/JWT/API Key. Tích hợp SSO Azure AD qua OpenID Connect. Hỗ trợ multi-tenant URL pattern: `{tenant}-main.vnrlocal.com`.[^7]

**Tại sao quan trọng**: Tech stack ghi là `.NET 8 / Angular 19` nhưng cũng note rõ "Legacy: .NET Framework 4.6.2 / ASP.NET MVC — HRM Main hiện tại". Đây là điểm nhạy cảm: nếu SSI audit source code, sự tồn tại của .NET Framework legacy cùng .NET 8 trong cùng hệ thống cần được giải thích rõ ràng trong tài liệu kiến trúc.

**Rủi ro / Tác động**: Multi-tenant URL pattern với `vnrlocal.com` — nếu SSI được triển khai trên domain của chính SSI (ví dụ: `hrm.ssi.com.vn`), URL pattern này cần được customize. Nếu không có kế hoạch rõ, là gap nhỏ nhưng có thể gây thắc mắc trong audit kỹ thuật.

**Nguồn**: [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]][^7] | **Độ tin cậy**: Dữ kiện + Suy luận

---

## 3. Biểu đồ số liệu

#### 📈 Phân bổ 24 API Endpoints theo loại và nhóm nghiệp vụ

> 💡 **Phân tích:**
>
> Hơn 58% API (14/24) là GET — SSI chủ yếu cần kéo dữ liệu HRM ra, không phải đẩy vào, phản ánh HRM là system of record chính.
> Nhóm nghỉ phép/OT/quỹ phép chiếm 4/14 GET — đây là nhóm dữ liệu được SSI truy vấn nhiều nhất, khả năng phục vụ tích hợp với hệ thống chấm công/ERP riêng của SSI.
> 3 API POST phục vụ kết quả đánh giá (HQCV, học tập, KPI đào tạo) — pattern bất thường: SSI đẩy ngược kết quả đánh giá vào HRM, có thể conflict với quy trình đánh giá nội bộ HRM.
> API 6.2.13 ESOP là API đơn lẻ không có pattern tương tự trong các thầu trước — đây là dấu hiệu nghiệp vụ đặc thù chứng khoán cần module riêng.
> Không có API nào liên quan đến Ký số — dù hồ sơ đề cập phân hệ này, nghĩa là tích hợp ký số sẽ ở luồng khác hoặc chưa được specced.
> Nếu ESOP không có module: 1/24 API fail → điểm kỹ thuật có thể bị trừ, và đây là API nhạy cảm nhất với nghiệp vụ tài chính chứng khoán SSI.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "GET - Org/NV"
    value: 3
  - label: "GET - Lương/Công"
    value: 3
  - label: "GET - Nghỉ/OT/Phép"
    value: 4
  - label: "GET - Thôi việc/ESOP"
    value: 2
  - label: "GET - Tuyển dụng"
    value: 1
  - label: "GET - Cấu hình"
    value: 1
  - label: "POST/PUT - Cập nhật NV"
    value: 3
  - label: "POST/PUT - Đánh giá/KPI"
    value: 4
  - label: "POST/PUT - Tuyển dụng"
    value: 1
  - label: "POST/PUT - Tích hợp"
    value: 1
  - label: "POST/PUT - Thuế"
    value: 1

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
      alias: "Số endpoints"
```

**📋 Số liệu biểu đồ**

| Nhóm API | Loại | Endpoints | Ghi chú |
|----------|------|-----------|---------|
| Org/Nhân viên | GET | 3 | GetOrgStructure, GetProfiles, ứng viên |
| Lương/Công | GET | 3 | Chi phí lương, phiếu lương (mã hóa), bảng công |
| Nghỉ/OT/Quỹ phép | GET | 4 | Loại nghỉ, danh sách nghỉ/OT, quỹ phép, cấu hình ca |
| Thôi việc/ESOP | GET | 2 | Quyết toán thôi việc, ESOP (**gap tiềm năng**) |
| Tuyển dụng | GET | 1 | Hạn mức tuyển dụng còn lại |
| Cấu hình | GET | 1 | Chức danh/cấp bậc/vị trí |
| Cập nhật nhân viên | POST/PUT | 3 | Nghỉ phép, thông tin cá nhân, ủy quyền thuế |
| Đánh giá/KPI | POST/PUT | 4 | HQCV, học tập/giảng dạy, kỳ thi, KPI đào tạo |
| Tuyển dụng | POST/PUT | 1 | Đề xuất tuyển dụng |
| Tích hợp kế toán | POST/PUT | 1 | Xuất chứng từ nội bộ SSI (6.3.10) |
| Thuế | POST/PUT | 1 | Ủy quyền quyết toán thuế |

> 🎯 **Nên làm**: Xác nhận module ESOP tồn tại và có store/API tương ứng trước khi submit hồ sơ.

---

#### 📈 Phân bổ 47 Yêu cầu bảo mật theo nhóm (Ch.9)

> 💡 **Phân tích:**
>
> Authentication (10 items) chiếm 21% — đây là nhóm lớn nhất, phản ánh SSI coi identity & access là lớp bảo vệ quan trọng nhất, đặc biệt với MFA bắt buộc.
> Authorization + Session (10 items cộng lại) tạo thành "vành đai kiểm soát truy cập" — nếu một trong hai nhóm này fail pentest, toàn bộ security posture bị đánh giá kém.
> Nhóm Integration Security (5 items) — nhỏ về số lượng nhưng cực kỳ rủi ro vì liên quan đến Azure AD sync và OAuth2/mTLS cho tất cả API bên ngoài.
> Privacy/BVDLCN (3 items) liên quan đến Nghị định 13/2023 — đây là yêu cầu pháp lý, không phải khuyến nghị. Vi phạm có thể dẫn đến chế tài hành chính.
> SSDLC + Vulnerability Mgmt (2 items) là nhóm "cam kết quy trình" — SSI có thể yêu cầu audit quy trình phát triển, không chỉ audit sản phẩm.
> 47 items là số lượng lớn nhất so với bất kỳ thầu HRM nào trước đây — đây là dấu hiệu SSI đã tham khảo OWASP ASVS hoặc có đội IT security nội bộ mạnh.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "9.3 Authentication"
    value: 10
  - type: "9.4 Authorization"
    value: 6
  - type: "9.5 Session"
    value: 4
  - type: "9.6 File/Storage"
    value: 5
  - type: "9.11 Integration Security"
    value: 5
  - type: "9.12 Privacy/BVDLCN"
    value: 3
  - type: "9.1+9.2 Input/Output"
    value: 2
  - type: "9.7+9.8+9.9 Error/DB/TLS"
    value: 5
  - type: "9.10+9.13+9.14 Other"
    value: 7

#-----------------#
#- chart options -#
#-----------------#
options:
  angleField: "value"
  colorField: "type"
  label:
    type: "outer"
    content: "{name}: {percentage}"
```

**📋 Số liệu phân nhóm bảo mật**

| Nhóm | Items | Ghi chú |
|------|-------|---------|
| 9.3 Authentication | 10 | MFA, bcrypt, CAPTCHA, server-side auth |
| 9.4 Authorization | 6 | Least privilege, audit log, confirmation |
| 9.5 Session Management | 4 | Server-side, timeout, HttpOnly |
| 9.6 File/Storage Security | 5 | Upload validation, no webroot, cache clear |
| 9.11 Integration Security | 5 | OAuth2/mTLS, Azure AD 1h sync, data minimization |
| 9.12 Privacy/BVDLCN | 3 | NĐ 13/2023, data masking, retention policy |
| 9.1+9.2 Input/Output Validation | 2 | SQLi/XSS prevention, output encoding |
| 9.7+9.8+9.9 Error/DB/TLS | 5 | Custom error, parameterized query, TLS 1.2+ |
| 9.10+9.13+9.14 Other | 7 | SSDLC, pentest, SLA patch, API key |

> 🎯 **Nên làm**: Ưu tiên verify ngay 3 nhóm rủi ro cao nhất: Auth (MFA/IDS4), Integration Security (Azure AD sync), Privacy (data masking lương/CMND).

---

## 4. Phân tích & Nhận định

🔍 **Core Insight 1 — Đây là hồ sơ thầu financial-grade, không phải HRM thông thường**

SSI yêu cầu bảo mật ở mức OWASP ASVS Level 2+, có riêng chương Integration Security Architecture Document, yêu cầu pentest độc lập, SLA patch 72h cho critical.[^4] So với PTSC, SSI thêm toàn bộ chương security, API spec chi tiết hơn và yêu cầu compliance pháp lý (Luật ANM 2025, NĐ 13/2023). Pattern này chỉ thấy ở khách hàng thuộc lĩnh vực tài chính/ngân hàng.[^2]

⚠️ **Rủi ro 1 — ESOP module gap**: API 6.2.13 yêu cầu lấy thông tin ESOP của nhân sự khi thôi việc, bao gồm quyết định và phiếu chuyển nhượng.[^3] Đây là nghiệp vụ đặc thù chứng khoán — nếu HRM hiện tại không có bảng dữ liệu ESOP, endpoint này sẽ trả về lỗi hoặc rỗng. Nếu SSI test API trong quá trình đánh giá kỹ thuật, đây là lỗi có thể bị phát hiện ngay.

⚠️ **Rủi ro 2 — MFA + Azure AD sync 1h**: Yêu cầu 9.3.8 (MFA bắt buộc) kết hợp 9.11.3 (sync Azure AD disabled user trong 1h) là yêu cầu khó đáp ứng đầy đủ.[^4] IDS4 (Identity Server 4) hiện tại của VnR cần được kiểm tra: có hỗ trợ TOTP/FIDO2 cho MFA không? Có webhook/polling Azure AD Graph API để detect disabled user không? Nếu chỉ sync theo batch mỗi đêm là không đủ.

⚠️ **Rủi ro 3 — Database schema rollback**: Yêu cầu 7.2.8 (rollback cả application VÀ database schema) là yêu cầu SRE-grade hiếm gặp.[^5] Deploy HRM hiện tại có migration script nhưng rollback schema thường là manual. Nếu không có tool tự động (như Flyway/Liquibase với undo scripts), cần ghi rõ trong tài liệu là "rollback schema manual với SLA X giờ" thay vì cam kết automated.

🔍 **Core Insight 2 — Pattern đẩy ngược từ SSI vào HRM là thiết kế hai chiều chưa phổ biến**

10 POST/PUT API từ SSI vào HRM bao gồm kết quả HQCV, học tập, KPI đào tạo.[^3] Điều này nghĩa là SSI có hệ thống đánh giá riêng và muốn ghi kết quả vào HRM (source of truth cho hồ sơ nhân sự). Nếu HRM cũng có module đánh giá nội bộ → cần policy rõ ràng: SSI push override HRM hay merge? Đây là gap thiết kế chưa được đề cập trong tài liệu.

### 4.1 Quy luật rút ra

**Khách hàng tài chính = audit quy trình, không chỉ audit sản phẩm**: SSI yêu cầu SSDLC, pentest định kỳ, DR drill có bằng chứng — họ sẽ kiểm tra quy trình sau khi ký hợp đồng, không chỉ kiểm tra phần mềm khi ký.[^4][^5] Nếu VnR không có quy trình tương ứng, cần xây dựng song song với triển khai.

**API hai chiều = phải có conflict resolution policy**: Khi SSI đẩy ngược kết quả vào HRM, phải định nghĩa trước: ai là master data? Thứ tự ưu tiên khi có conflict? Rollback nếu SSI push sai?[^3]

### 4.2 Mâu thuẫn phát hiện

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | Hồ sơ cam kết MFA bắt buộc (9.3.8) nhưng wiki SSI-Project ghi "MFA bắt buộc — HRM hiện tại đã có? Cần verify" | Cam kết trong tài liệu thầu nhưng thực tế chưa verify → rủi ro pentest |
| 2 | Availability target 99.99% nhưng DR site chỉ có DB backup, không mention App DR | Khi mất cả 2 App node cùng lúc → không đạt SLA |
| 3 | Tech stack ghi .NET 8 nhưng note "Legacy .NET Framework 4.6.2 vẫn còn" | SSI có thể yêu cầu làm rõ version roadmap khi audit |

---

## 5. Gaps & Hạn chế

**Gap 1 — ESOP module chưa được xác nhận**: Không có wiki page nào mô tả module ESOP trong HRM hiện tại. Nếu module này không tồn tại, API 6.2.13 sẽ là điểm fail kỹ thuật. → **Rủi ro cao** — cần verify với team HRE trước khi submit.[^3]

**Gap 2 — MFA/IDS4 capability chưa documented đầy đủ**: Wiki SSI-Project tự ghi nhận đây là vấn đề cần verify. Chưa có wiki page mô tả chi tiết tính năng MFA của IDS4 hiện tại (TOTP? SMS? Hardware token?).[^4]

**Gap 3 — Database schema rollback procedure**: Không có tài liệu wiki nào mô tả quy trình rollback schema tự động. Đây là gap nếu SSI kiểm tra capability trong quá trình đánh giá.[^5]

**Gap 4 — Conflict resolution policy cho API hai chiều**: 10 POST/PUT API từ SSI đẩy ngược vào HRM nhưng không có wiki page mô tả policy xử lý conflict với dữ liệu HRM nội bộ.[^3]

**Hạn chế nghiên cứu**: Chưa đọc các wiki source chi tiết `a1b2c-ssi-ch1`, `d3e4f-ssi-ch3`, `g5h6i-ssi-ch6-detail`, `j7k8l-ssi-ch7-detail` — các file này có thể chứa thêm chi tiết đáp ứng VnR.

---

## 6. Gợi ý hành động

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | Verify module ESOP trong HRM: liên hệ team HRE xác nhận bảng dữ liệu ESOP tồn tại và API 6.2.13 có thể implement | Gap kỹ thuật có thể phát hiện ngay khi SSI test API — ảnh hưởng trực tiếp điểm kỹ thuật |
| 🔴 Cao | Kiểm tra MFA capability của IDS4: TOTP/FIDO2 có hỗ trợ không? Azure AD Graph API polling/webhook có implement không? | MFA bắt buộc + Azure AD sync 1h là 2 yêu cầu bảo mật không có ngoại lệ |
| 🔴 Cao | Làm rõ database schema rollback: document quy trình hiện tại (manual/auto), nếu manual thì ghi SLA rõ trong tài liệu thay vì để SSI hiểu là automated | Cam kết không rõ ràng dễ bị SSI penalize sau khi ký |
| 🟡 Trung bình | Định nghĩa conflict resolution policy cho API POST/PUT hai chiều (đặc biệt HQCV, học tập, KPI đào tạo) | Nếu không có policy → tranh chấp dữ liệu sau khi go-live |
| 🟡 Trung bình | Review URL pattern `vnrlocal.com` — chuẩn bị kế hoạch custom domain cho `hrm.ssi.com.vn` nếu SSI yêu cầu | Audit kỹ thuật có thể hỏi về domain naming |
| 🟢 Thấp | Update wiki: bổ sung page cho module ESOP (nếu có) và MFA/IDS4 capability | Wiki hiện tại thiếu 2 page quan trọng cho thầu tài chính |

---

## Tài liệu tham khảo

### Nguồn Wiki

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^1] | [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] | source | Hồ sơ thầu tổng thể: 183 file, 10 chương, key takeaways toàn bộ |
| [^2] | [[wiki/projects/SSI-Project]] | project | Project page SSI: trạng thái, yêu cầu đặc thù, risks, lessons learned |
| [^3] | [[wiki/sources/q3r6t-ssi-api-spec]] | source | API spec chi tiết: 14 GET + 10 POST/PUT, bảng endpoints đầy đủ |
| [^4] | [[wiki/sources/j5k9w-ssi-security-requirements]] | source | Bảo mật Ch.9: 47 items, 14 nhóm, MFA/SSDLC/SLA patch |
| [^5] | [[wiki/sources/v7m2p-ssi-devops-requirements]] | source | DevOps Ch.7: 33 items, CI/CD, rollback, DR drill, monitoring |
| [^6] | [[wiki/sources/f8c4n-ssi-infrastructure-requirements]] | source | Hạ tầng Ch.10: topology 5-server, specs hardware, HA/DR |
| [^7] | [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] | architecture | Kiến trúc giải pháp: 4 tầng, mermaid diagrams, tech stack table |

### Nguồn Thô (raw/)

| # | Đường dẫn | Ngày tạo | Mô tả ngắn |
|---|-----------|----------|------------|
| [^8] | `raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/` (183 files) | 2026-05 | Toàn bộ file thầu gốc (000–182 + _Index.md) |

---

[^1]: [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Hồ sơ thầu tổng thể, 183 file, tech stack, key takeaways
[^2]: [[wiki/projects/SSI-Project]] — Project page SSI: trạng thái planning, yêu cầu đặc thù, gaps đã biết
[^3]: [[wiki/sources/q3r6t-ssi-api-spec]] — Chi tiết 24 API endpoints hai chiều, bao gồm ESOP và phiếu lương mã hóa
[^4]: [[wiki/sources/j5k9w-ssi-security-requirements]] — 47 security items Ch.9, MFA/bcrypt/Azure AD sync/SSDLC
[^5]: [[wiki/sources/v7m2p-ssi-devops-requirements]] — DevOps Ch.7: Docker/K8s, rollback schema, DR drill, SLO
[^6]: [[wiki/sources/f8c4n-ssi-infrastructure-requirements]] — Hardware topology: 1 Proxy + 2 App + 2 DB, specs, fiber 1Gbps
[^7]: [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] — Kiến trúc 4 tầng, Mermaid diagrams, multi-tenant URL
[^8]: `raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/` — 183 file gốc hồ sơ thầu, đọc qua _Index.md và file đại diện

---

## Hành trình nghiên cứu

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | `wiki_search_links("ssi")` | 🔍 Atlas | Không ra node SSI trực tiếp — ra các node permission/OPA không liên quan |
| 2 | `wiki__search_files("**/*SSI*")` | 🔍 Glob | Phát hiện: thư mục `raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/` + `wiki/projects/SSI-Project.md` + `src/tlgp/SSI/` |
| 3 | `wiki/projects/SSI-Project.md` | ✅ Đọc | Node trung tâm — tổng quan dự án, links đến 6 wiki sources, 3 gap đã biết (ESOP, MFA, deployment option) |
| 4 | `Thau_SSI/_Index.md` | ✅ Đọc | 183 file, xác nhận cấu trúc 10 chương → đọc nguồn wiki thay vì brute-force raw |
| 5 | `wiki/sources/x2p7k-thau-ssi-ho-so-tong-the` | ✅ Đọc | Source tổng hợp chính — đầy đủ key takeaways toàn bộ hồ sơ |

**Tổng vòng 1:** 5 bước · 1 lead mới (6 sources cần đọc)

### Vòng 2 — Đọc sources chuyên sâu

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 6 | `wiki/sources/q3r6t-ssi-api-spec` | ✅ Đọc | 24 API chi tiết, bảng endpoints đầy đủ → ESOP gap xác nhận, phiếu lương mã hóa xác nhận |
| 7 | `wiki/sources/j5k9w-ssi-security-requirements` | ✅ Đọc | 47 items chi tiết theo 14 nhóm → MFA + Azure AD sync 1h xác nhận là gap rủi ro cao |
| 8 | `wiki/sources/v7m2p-ssi-devops-requirements` | ✅ Đọc | 33 DevOps items → rollback database schema (7.2.8) là gap không thường gặp |
| 9 | `wiki/sources/f8c4n-ssi-infrastructure-requirements` | ✅ Đọc | Topology 5-server, specs hardware chi tiết → phát hiện WAF chỉ trong kiến trúc logic, không có server WAF riêng |
| 10 | `wiki/architecture/m4n8b-ssi-kien-truc-giai-phap` | ✅ Đọc | Kiến trúc đầy đủ với mermaid diagrams → phát hiện legacy .NET Framework 4.6.2 vẫn còn tồn tại cùng .NET 8 |

**Tổng vòng 2:** 5 file đọc chi tiết · 0 lead mới → dừng tìm kiếm

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng 2: không còn lead mới phát sinh. Các sources còn lại (`a1b2c`, `d3e4f`, `g5h6i`, `j7k8l`, `q1r2s`, `t3u4v`) là sources chi tiết của các chương đã được tổng hợp trong x2p7k — không cần đọc thêm cho mục đích báo cáo tổng thể.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng wiki sources xác nhận | 7 sources + 1 architecture |
| Đã đọc chi tiết | 7 file |
| Bỏ qua (có lý do) | 6 sources chi tiết (covered bởi x2p7k) |
| Bất thường phát hiện | 3 điểm (WAF logic only, .NET Framework legacy, DR site chỉ DB) |
| Mâu thuẫn dữ liệu | 3 điểm (MFA unverified, availability claim vs topology, .NET version) |

### Phát hiện bất thường & mâu thuẫn

- **Bất thường 1**: Tech stack ghi `.NET 8` nhưng architecture note rõ "Legacy: .NET Framework 4.6.2 / ASP.NET MVC — HRM Main hiện tại" — hai version cùng tồn tại, cần giải thích trong tài liệu.
- **Mâu thuẫn 1**: SSI-Project.md ghi "MFA bắt buộc — cần verify" nhưng x2p7k và j5k9w cam kết "MFA bắt buộc tất cả tài khoản" — **dùng trạng thái "cần verify" vì đây là đánh giá nội bộ thực tế hơn**.
- **Mâu thuẫn 2**: Availability target 99.99% nhưng topology chỉ có 2 App node và DR site chỉ cho DB — nếu mất cả 2 App, SLA không đạt được.

### Câu hỏi suy ngẫm

**🔬 Tư duy nguyên bản — FPT**
> Chúng ta mặc định rằng "đáp ứng đầy đủ 183 items = hồ sơ thầu tốt". Nhưng nếu bỏ giả định đó đi: liệu SSI có đang dùng chính tài liệu này để filter vendor hay để benchmark vendor tốt nhất? Nếu là benchmark, thì gap thực sự là "ai đáp ứng được điều mà SSI biết là khó nhất" — và điều khó nhất ở đây có phải là ESOP + MFA không, hay là khả năng chứng minh SSDLC + pentest log thực tế?

**🧠 Câu hỏi Socrate**
> Hồ sơ cam kết "MFA bắt buộc toàn bộ tài khoản" — nhưng nếu IDS4 hiện tại không đủ tính năng, điều gì sẽ thay đổi trước tiên: tài liệu hồ sơ thầu được điều chỉnh, hay IDS4 được nâng cấp trước khi submit? Câu trả lời cho câu hỏi này sẽ tiết lộ VnR đang ưu tiên "win the bid" hay "win the project" đúng nghĩa.

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức**
> Nếu phải hành động ngay hôm nay với thông tin từ báo cáo này, bước đầu tiên cụ thể là: gọi cho team HRE hỏi một câu duy nhất: "Trong DB HRM hiện tại có bảng/module nào liên quan đến ESOP không?" — vì đây là gap duy nhất có thể xác nhận trong 30 phút và có impact cao nhất đối với điểm kỹ thuật của hồ sơ thầu SSI.
