---
type: source
code: m9n0p
description: "SSI Ch.8 kiến trúc detail: tổng quan giải pháp, multi-tier SOA, modular, Docker/K8s, DC-DR, SSO Azure AD, tích hợp real-time, ECM"
tags:
  - ssi
  - kien-truc
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]"
---

# Source: SSI Ch.8 — Kiến trúc Giải pháp (Chi tiết đầy đủ)

## Tóm tắt

Chương 8 mô tả toàn bộ kiến trúc giải pháp VnResource HRM đề xuất cho SSI, bao gồm: tổng thể công nghệ và ưu việt (§8.1), thiết kế kiến trúc đa tầng / SOA / modular / Docker-K8s / DC-DR (§8.2), và tích hợp SSO Azure AD, hệ thống bên ngoài, real-time, ECM (§8.3).

---

## 8.1 — Tổng thể Giải pháp

### 8.1.1 — Mô tả tổng thể

**Yêu cầu:**
> Nhà thầu mô tả tổng thể về giải pháp đề xuất và những ưu việt về mặt công nghệ so với các giải pháp khác trên thị trường, bao gồm: Kiến trúc giải pháp và nền tảng công nghệ; Tính thân thiện với người sử dụng; Sẵn sàng tích hợp với các hệ thống khác; Hỗ trợ kiến trúc hướng dịch vụ SOA; Dễ dàng trong công tác vận hành và quản trị hệ thống; Đảm bảo an toàn, bảo mật hệ thống; Tính ổn định; Tính linh hoạt; Khả năng mở rộng; Đáp ứng hiệu năng; Khả năng làm chủ công nghệ; Lộ trình phát triển sản phẩm; Khả năng ghi log lỗi rõ ràng.

**Đáp ứng:**

> Giải pháp VnResource HRM được xây dựng trên nền tảng kiến trúc mở, hiện đại và hướng dịch vụ (SOA/Microservice-ready), đáp ứng khả năng mở rộng, tích hợp linh hoạt và vận hành ổn định cho các doanh nghiệp quy mô lớn.

**1. Kiến trúc giải pháp và nền tảng công nghệ**

> Hệ thống được thiết kế theo mô hình multi-tier architecture gồm: Presentation Layer, Application Layer, Data Layer.
>
> Nền tảng công nghệ sử dụng: .NET Framework và .NET 7/.NET Core; RESTful API / JSON; SQL Server 2019; Redis Cache; Kubernetes / Docker-ready; Load Balancer và High Availability.
>
> Kiến trúc modular và stateless giúp hệ thống dễ mở rộng, nâng cấp và triển khai độc lập từng phân hệ mà không ảnh hưởng toàn hệ thống.

**Bảng công nghệ sử dụng:**

| Thành phần | Công nghệ | Mô tả |
|---|---|---|
| Frontend | Angular 19 | Framework web hiện đại, hiệu suất cao, tương thích đa trình duyệt |
| Backend | .NET 8 | Nền tảng backend Microsoft, RESTful API, đa nền tảng, tốc độ cao |
| Database | SQL Server | Lưu trữ dữ liệu nhân sự, lương, chấm công, tuyển dụng; hỗ trợ HA, phân quyền |
| File Server | Network File System | Lưu trữ file đính kèm: hợp đồng lao động, hồ sơ, biểu mẫu |
| API Gateway | Ocelot | Quản lý luồng API, routing, load balancing, xác thực token, logging |
| Authentication | OAuth2 / OpenID Connect | SSO, phân quyền chi tiết, MFA, thích hợp tích hợp nhiều hệ thống |

**2. Tính thân thiện với người sử dụng**

> Hệ thống cung cấp giao diện Web responsive và Mobile App, hỗ trợ: truy cập trên nhiều thiết bị; giao diện trực quan, dễ sử dụng; cá nhân hóa giao diện; workflow phê duyệt linh hoạt; dashboard và báo cáo trực quan.

**3. Khả năng tích hợp**

> Hệ thống hỗ trợ tích hợp mở với: ERP; MISA; BHXH / AmisBHXH; Mobile App; Data Platform. Thông qua: REST API; SOAP/Web Service; File Exchange; CDC (Change Data Capture). API được chuẩn hóa theo OpenAPI/Swagger.

**4. Hỗ trợ kiến trúc SOA**

> Hệ thống được thiết kế theo nguyên tắc: Service độc lập; Loose coupling; Reusability; Stateless API; API Gateway; Integration Service Layer. Cho phép triển khai, nâng cấp và mở rộng từng service riêng biệt.

**5. Vận hành và quản trị hệ thống**

> Hệ thống hỗ trợ: Health check endpoint (theo dõi trạng thái service real-time); Admin UI (cấu hình tham số, quy trình, phân quyền không cần code); SSMS (quản lý SQL Server); Multi-environment (DEV → TEST → UAT → PROD với pipeline kiểm soát); Alerting (cảnh báo email khi lỗi vượt ngưỡng).

**6. An toàn và bảo mật**

> Hệ thống áp dụng nhiều lớp bảo mật: JWT / OAuth2; HTTPS/TLS; Redis session management; Mã hóa dữ liệu nhạy cảm; Audit Log và TraceId; API Key & Scope. Toàn bộ truy cập Database đều thông qua Application Layer.

**7. Tính ổn định và hiệu năng**

> HA Active/Passive: DB Failover tự động (AlwaysOn/Log Shipping); 2 App Server song song, failover tự động khi 1 node down; Redis: in-memory, latency thấp; Kiểm thử JMeter: 10.000 user đồng thời, ≤ 3 giây (99% thao tác); Hỗ trợ horizontal scaling.

**8. Tính linh hoạt và khả năng mở rộng**

> Các module nghiệp vụ được thiết kế độc lập: triển khai riêng lẻ; tùy chỉnh workflow mà không sửa code lõi; bổ sung module mới không ảnh hưởng hệ thống hiện tại.

**9. Khả năng làm chủ công nghệ**

> Giải pháp sử dụng các công nghệ phổ biến và tiêu chuẩn mở: .NET; SQL Server; REST API; Kubernetes; Redis. SSI có thể tiếp nhận vận hành, đào tạo đội ngũ kỹ thuật, quản trị và mở rộng.

**10. Lộ trình phát triển sản phẩm**

> VnResource HRM đang phát triển theo lộ trình: Tăng cường microservices; Cloud Native & Kubernetes; Mobile-first; API-first Integration; AI/Analytics integration. Hỗ trợ nâng cấp phiên bản định kỳ và triển khai không gián đoạn dịch vụ.

**11. Logging, Trace và giám sát lỗi**

> Hệ thống hỗ trợ: Structured logging (JSON format, gắn traceId/correlationId per request); Log levels (Info / Warning / Error / Trace — cấu hình per module/service); Centralized log (Graylog/ELK — tìm kiếm nhanh theo traceId); Exception handling Middleware global; API History Log; Metrics Prometheus (CPU, memory, request rate, error rate); Alert tự động khi error rate vượt ngưỡng.

---

## 8.2 — Thiết kế & Kiến trúc

### 8.2.1 — Kiến trúc tổng thể (Application + System + Integration + Database)

**Yêu cầu:**
> Nhà thầu đề xuất và mô tả chi tiết kiến trúc tổng thể của hệ thống đề xuất bao gồm: kiến trúc về ứng dụng, kiến trúc hệ thống, kiến trúc tích hợp và kiến trúc cơ sở dữ liệu.

**Kiến trúc ứng dụng (Application Architecture)**

> Hệ thống HRM được thiết kế theo mô hình phân tầng (Layered Architecture), bao gồm:
>
> **Presentation Layer:** Các ứng dụng Web MVC, Employee Portal, Mobile API, Web Services phục vụ người dùng và tích hợp hệ thống.
>
> **Business Layer:** Xử lý nghiệp vụ theo từng phân hệ như Nhân sự, Chấm công, Tiền lương, Bảo hiểm, Tuyển dụng, Đào tạo, KPI, Ký số điện tử...
>
> **Data Layer:** Sử dụng Repository Pattern và Entity Framework để truy xuất và quản lý dữ liệu.
>
> **Infrastructure Layer:** Cung cấp các dịch vụ nền tảng như bảo mật, logging, middleware, cache Redis, lưu trữ file và tiện ích hệ thống.

**Kiến trúc hệ thống**

> Hệ thống HRM được triển khai trên nền tảng IIS (On-Premise) và hỗ trợ Kubernetes (K8s) cho nhu cầu mở rộng trong tương lai. Ứng dụng hiện tại vận hành trên .NET Framework 4.6.2 với ASP.NET MVC, đồng thời các dịch vụ mới được phát triển theo kiến trúc microservices sử dụng .NET 8 / ASP.NET Core Web API.
>
> Hệ thống sử dụng Redis Sentinel nhằm đảm bảo High Availability và tăng hiệu năng. Các tác vụ nền được xử lý thông qua Windows Service và TaskSchedule tự động.
>
> **Phân vùng URL theo tenant:**
> - HRM Main Web: `https://{tenant}-main.vnrlocal.com/`
> - Employee Portal: `https://{tenant}-portal.vnrlocal.com/`
> - HR Service: `https://{tenant}-hr.vnrlocal.com/`
> - System Service: `https://{tenant}-sys.vnrlocal.com/`
>
> **Bảo mật:** Xác thực bằng token kết hợp Redis Cache quản lý session. Mật khẩu mã hóa MD5 hash kết hợp custom encryption. Connection string được mã hóa thông qua cấu hình `IsEncryptData = true`.

**Kiến trúc tích hợp (Integration Architecture)**

> Hệ thống HRM hỗ trợ tích hợp 2 chiều với các hệ thống bên ngoài thông qua lớp Integration Service Layer, tách biệt với Core HRM.
>
> **Chuẩn tích hợp hỗ trợ:** REST API (JSON); SOAP/Web Service; File Exchange (CSV/JSON); CDC (Change Data Capture).
>
> **Hệ thống có thể tích hợp:** ERP; BHXH / TS24; MISA; Mobile App; Data Platform / MDM.
>
> **Dữ liệu hỗ trợ đồng bộ:** Hồ sơ nhân viên; Chấm công; Tiền lương; Bảo hiểm; KPI; Master Data.
>
> **Cơ chế:** OAuth2 / JWT / API Key; Retry xử lý lỗi; CorrelationId / TraceId; Audit Log; Upsert & Idempotent API.
>
> **Monitoring:** Prometheus; Grafana; Alerting & Transaction Tracing.
>
> Kiến trúc hỗ trợ: Real-time Integration; Batch Processing; Multi-tenant; Replay/Reprocess dữ liệu; Scale-out.

**Kiến trúc cơ sở dữ liệu (Database Architecture)**

> Hệ thống HRM sử dụng Microsoft SQL Server 2019 Standard trở lên, triển khai trên Windows Server 2019 theo mô hình High Availability gồm 2 node Active/Passive, hỗ trợ AlwaysOn Availability Group hoặc Log Shipping/Mirroring.
>
> **Kiến trúc dữ liệu tập trung:**
> - SQL Server: xử lý dữ liệu nghiệp vụ chính
> - Redis Cache: session, token, lookup và config (giảm tải truy vấn)
> - File Server (NFS): lưu trữ file dùng chung giữa các ứng dụng
> - S3/Object Storage: lưu trữ tài liệu và backup dài hạn (Cloud)
>
> **Bảo mật dữ liệu:** Không truy cập trực tiếp Database từ bên ngoài; Toàn bộ truy cập qua Application Layer; Mã hóa AES-256 cho dữ liệu nhạy cảm; Mật khẩu SHA-256 + salt; Audit log toàn bộ; Data masking cho môi trường test/dev. Database hỗ trợ UTF-8/Unicode.

### 8.2.1 — Kiến trúc đa tầng (Multi-Tier)

**Yêu cầu:**
> Hệ thống phải hỗ trợ mô hình kiến trúc đa tầng (multi-tier), bao gồm ít nhất 3 tầng: Tầng Giao diện; Tầng Ứng dụng; Tầng Cơ sở dữ liệu.

**Đáp ứng:**

> Hệ thống VnResource HRM được thiết kế theo mô hình kiến trúc 3 tầng (3-Tier Architecture), tách biệt rõ ràng giữa tầng giao diện, tầng ứng dụng và tầng cơ sở dữ liệu.

**Tầng 1 — Presentation Layer (Tầng Giao diện)**

> Truy cập thông qua trình duyệt Web và Mobile App trên Windows, Linux, macOS, iOS và Android. Giao diện responsive, không yêu cầu cài đặt phần mềm tại máy người dùng.
>
> Tầng này chỉ thực hiện hiển thị dữ liệu, gửi request và nhận response từ Application Layer qua HTTPS/TLS 1.2/1.3 và RESTful API (JSON), không chứa business logic.

**Tầng 2 — Application Layer (Tầng Ứng dụng)**

> Xây dựng trên .NET Web API theo kiến trúc stateless, xử lý toàn bộ business logic: tuyển dụng, nhân sự, chấm công, tiền lương, đào tạo và đánh giá.
>
> Hỗ trợ: JWT, OAuth2 và RBAC; Redis Cache tối ưu hiệu năng; API Gateway và Integration Service; Retry, Audit Log, CorrelationId.
>
> Triển khai nhiều App Server song song phía sau Load Balancer (Nginx/HAProxy), failover tự động khi xảy ra sự cố.

**Tầng 3 — Data Layer (Tầng Cơ sở dữ liệu)**

> SQL Server 2019 Standard, Active/Passive HA bằng AlwaysOn hoặc Log Shipping.
>
> Tối ưu hiệu năng: Index theo nghiệp vụ; Query optimization; Paging và lazy-load; Redis Cache giảm tải SQL; File Server NFS tách lưu trữ file.
>
> Dữ liệu nhạy cảm (lương, CCCD, tài khoản ngân hàng) mã hóa AES-256. Audit Log và quyền tối thiểu.

### 8.2.3 — Kiến trúc SOA

**Yêu cầu:**
> Kiến trúc cho hệ thống đề xuất phải hỗ trợ tiêu chuẩn kiến trúc tích hợp SOA, đã được thiết kế và xây dựng cho SOA.

**Đáp ứng:**

> Hệ thống VnResource HRM được thiết kế theo định hướng kiến trúc dịch vụ SOA (Service-Oriented Architecture), bảo đảm các nguyên tắc: Service độc lập; Loose coupling; Reusability; Interoperability; Khả năng mở rộng và tích hợp linh hoạt.
>
> Các dịch vụ giao tiếp thông qua RESTful API và JSON theo chuẩn mở OpenAPI/Swagger.
>
> **Kiến trúc hệ thống bao gồm:**
> - API Gateway làm điểm truy cập tập trung
> - HRM Core Services xử lý nghiệp vụ
> - Integration Service Layer phục vụ tích hợp Inbound/Outbound
> - SQL Server và Redis Cache cho lưu trữ và tối ưu hiệu năng
>
> **Các service chính:** HRM Core Service; Workflow Engine Service; Reporting Service; Import/Export Service; Mobile Service; Integration Service; Notification Service.
>
> **Hệ thống hỗ trợ:** Stateless API; JWT/OAuth2 Security; Retry & Audit Log; CorrelationId Tracking; Scale-out và High Availability; Zero-downtime deployment; On-Premise hoặc SaaS deployment.

### 8.2.4 — Kiến trúc mô-đun (Modular Architecture)

**Yêu cầu:**
> Hệ thống phải được xây dựng trên kiến trúc mô-đun, cho phép triển khai các mô-đun mới hoặc phát triển các chức năng mới của một module cụ thể đồng thời vẫn đảm bảo hệ thống nhất quán và ổn định.

**Đáp ứng:**

> Hệ thống VnResource HRM được thiết kế theo kiến trúc mô-đun (Modular Architecture), cho phép các phân hệ hoạt động độc lập, dễ dàng mở rộng và nâng cấp mà không ảnh hưởng đến hệ thống lõi.
>
> **Các module chính:** Tuyển dụng; Nhân sự; Chấm công; Tiền lương; Thuế & Bảo hiểm; Đào tạo; Đánh giá hiệu suất; Workflow Engine; Reporting; Mobile Service; Integration Service.
>
> Mỗi module có thể: triển khai độc lập; nâng cấp riêng lẻ; cấu hình nghiệp vụ riêng; tích hợp qua REST API chuẩn hóa.
>
> Hệ thống áp dụng: Stateless Application Layer; Redis Cache dùng chung; RBAC centralized security; Centralized Logging & TraceId; Database tập trung, dữ liệu đồng nhất real-time.
>
> Kiến trúc hỗ trợ: Zero-downtime deployment; Scale-out mở rộng ngang; Kubernetes rolling update; Versioning & rollback; Multi-environment pipeline (DEV/TEST/UAT/PROD).

### 8.2.5 — Docker / Kubernetes

**Yêu cầu:**
> Hệ thống hỗ trợ cài đặt trên các nền tảng ảo hóa như Docker, Kubernetes.

**Đáp ứng:**

> Hệ thống VnResource HRM hỗ trợ triển khai trên nền tảng Kubernetes, cho phép vận hành linh hoạt trên hạ tầng Cloud hoặc On-Premise như AWS EC2, Kubernetes Cluster và Virtual Machine.
>
> Kiến trúc hệ thống được thiết kế theo hướng stateless, hỗ trợ scale-out bằng cách bổ sung App Node phía sau Load Balancer (Nginx/HAProxy) mà không ảnh hưởng đến người dùng đang hoạt động.
>
> **Hệ thống hỗ trợ:**
> - Kubernetes deployment
> - Zero-downtime upgrade (live patching)
> - Rolling update
> - Multi-environment deployment (DEV/TEST/UAT/PROD)
> - Horizontal scaling
> - High Availability
>
> Các service có thể được đóng gói và triển khai độc lập theo từng module, giúp nâng cấp hoặc mở rộng hệ thống mà không ảnh hưởng đến toàn bộ nền tảng. Kiến trúc này giúp hệ thống dễ mở rộng theo tăng trưởng người dùng, giảm downtime khi nâng cấp, tăng khả năng chịu tải và linh hoạt triển khai Cloud hoặc On-Premise.

### 8.2.6 — Kiến trúc mở (Open Architecture)

**Yêu cầu:**
> Các cấu phần của hệ thống phải được xây dựng trên kiến trúc hệ thống mở và cho phép: nâng cấp toàn bộ hoặc từng cấu phần; thay đổi phát triển tính năng mới mà không ảnh hưởng tính ổn định; mô tả chi tiết khả năng tùy chỉnh; dễ triển khai và tích hợp phân hệ mới.

**Đáp ứng:**

> Hệ thống VnResource HRM được thiết kế theo kiến trúc mở (Modular/Microservice-ready), cho phép nâng cấp toàn bộ hoặc từng cấu phần độc lập mà không ảnh hưởng đến hoạt động của toàn hệ thống.
>
> **Hệ thống hỗ trợ:**
> - Triển khai và nâng cấp từng module riêng biệt
> - Zero-downtime deployment thông qua Kubernetes rolling update
> - Versioning và rollback an toàn giữa các môi trường DEV/TEST/UAT/PROD
> - Mở rộng theo mô hình scale-out và load balancing
>
> **Phạm vi tùy chỉnh (không cần build lại code lõi):**
> - Cấu hình qua database/file config/admin UI
> - Thêm màn hình mới (nhập liệu, tra cứu) bằng .NET/C# — tách biệt code gốc
> - Xây dựng báo cáo mới (Excel/PDF) theo yêu cầu đặc thù
> - Import/Export dữ liệu; Giao diện người dùng; Mobile App
>
> Toàn bộ tùy biến được tách biệt khỏi chương trình chuẩn nhằm đảm bảo khả năng nâng cấp lâu dài.
>
> **Hệ thống hỗ trợ tích hợp và mở rộng thông qua:** REST API / JSON theo chuẩn OpenAPI; API Gateway và Integration Service; Secret Key & Scope riêng cho từng hệ thống; CorrelationId và Audit Log.

### 8.2.7 — Mở rộng theo chiều ngang (Horizontal Scaling)

**Yêu cầu:**
> Hệ thống cho phép mở rộng theo chiều ngang: cho phép nâng cao tải của hệ thống bằng cách bổ sung thêm phần cứng.

**Đáp ứng:**

> Hệ thống VnResource HRM được thiết kế theo mô hình stateless Application Layer, cho phép mở rộng tải theo chiều ngang (horizontal scaling) bằng cách bổ sung thêm Application Server mà không cần thay đổi kiến trúc hệ thống hay gián đoạn dịch vụ.
>
> Các App Server hoạt động song song phía sau Load Balancer (Nginx/HAProxy), hỗ trợ: tự động phân phối tải; Health check và failover; Tự động nhận diện node mới; Mở rộng linh hoạt theo nhu cầu.
>
> Session và token người dùng được lưu tập trung trên Redis Cache dùng chung, đảm bảo không mất session khi thêm hoặc thay đổi App Server.
>
> **Hệ thống hỗ trợ:** Scale-out bằng cách bổ sung phần cứng hoặc App Node mới; High Availability; Zero-downtime expansion; Load balancing theo Round Robin hoặc Least Connection.
>
> Database triển khai theo mô hình Active/Passive HA nhằm đảm bảo khả năng failover và tăng tính sẵn sàng của hệ thống.

### 8.2.8 — Danh mục ứng dụng (Application Catalog)

**Yêu cầu:**
> Nhà thầu cung cấp các tài liệu: Danh mục ứng dụng (liệt kê và mô tả tất cả các chức năng có sẵn); Ma trận ứng dụng/chức năng/dữ liệu (xác định mối quan hệ giữa chức năng ứng dụng, chức năng nghiệp vụ và đối tượng dữ liệu).

**Đáp ứng — Danh mục 11 phân hệ VnResource HRM:**

| Phân hệ | Chức năng chính | Dữ liệu chính | Tích hợp |
|---|---|---|---|
| 1. Tuyển dụng (Recruitment) | Quản lý vị trí tuyển dụng; hồ sơ ứng viên; lịch phỏng vấn; onboarding | Ứng viên, Vị trí tuyển dụng, Đợt tuyển dụng, Kết quả phỏng vấn | — |
| 2. Nhân sự (HR Management) | Hồ sơ nhân viên; hợp đồng lao động; quản lý tổ chức; biến động; master data | Nhân viên, Hợp đồng, Đơn vị tổ chức, Chức danh | ERP; SSO/RBAC; Data Platform |
| 3. Chấm công & Nghỉ phép (Attendance) | Ca làm việc; chấm công; nghỉ phép; tăng ca (OT) | Ca làm việc, Bảng chấm công, Đơn nghỉ phép, Đơn tăng ca | Thiết bị chấm công |
| 4. Tiền lương (Payroll) | Tính lương; phụ cấp/khấu trừ; phiếu lương điện tử; file ngân hàng; phân bổ chi phí | Bảng lương, Phụ cấp, Khấu trừ, Phiếu lương | ERP; Ngân hàng |
| 5. Thuế & Bảo hiểm | Kê khai BHXH/BHYT/BHTN; sổ bảo hiểm; thuế TNCN; giảm trừ gia cảnh | Hồ sơ BHXH, Hồ sơ thuế, Thông tin giảm trừ | Cơ quan BHXH; Cơ quan thuế |
| 6. Đào tạo (Training) | Kế hoạch đào tạo; khóa học; kết quả học tập; đồng bộ E-learning | Khóa học, Chứng chỉ, Kết quả đào tạo | E-learning Platform |
| 7. Đánh giá Hiệu suất (Performance) | Thiết lập KPI; đánh giá định kỳ; đánh giá 360°; lộ trình phát triển | KPI, Kết quả đánh giá, Chu kỳ đánh giá | BI/AI Platform |
| 8. Phê duyệt | Workflow phê duyệt điện tử; ký số; push notification | Yêu cầu phê duyệt, Lịch sử xử lý | ERP |
| 9. Báo cáo & Phân tích | Báo cáo nhân sự/lương/chấm công; tùy chỉnh Excel/PDF/DOCX; dashboard KPI realtime | KPI, Dataset, Dashboard | BI/Data Platform |
| 10. Mobile App | Chấm công GPS/QR Code; xin nghỉ/OT; phê duyệt workflow; tra cứu nhân sự | Check-in/out, Đơn từ mobile, Notification | — |
| 11. Quản trị hệ thống | Quản lý user/role/permission; cấu hình tham số; audit log; monitoring tích hợp | User, Role, Permission, Audit Log, API Log | IAM/SSO; LDAP/AD; Monitoring System |

### 8.2.9 — DC-DR (Disaster Recovery)

**Yêu cầu:**
> Kiến trúc hệ thống phải đảm bảo khả năng chuyển đổi DC-DR linh hoạt khi có thảm họa và lên kịch bản triển khai.

**Đáp ứng:**

> Hệ thống VnResource HRM được thiết kế theo mô hình High Availability (HA) kết hợp Disaster Recovery (DR), đảm bảo khả năng vận hành liên tục và phục hồi nhanh khi xảy ra sự cố hoặc thảm họa tại Data Center (DC).
>
> **Kiến trúc triển khai gồm:**
> - Primary Site (DC) vận hành chính
> - Secondary Site (DR Site) dự phòng
> - Load Balancer phân phối tải và tự động failover
> - Application Server chạy stateless
> - SQL Server Active/Passive (AlwaysOn hoặc Log Shipping)
> - Redis Cache và File Server dùng chung
>
> **Hệ thống hỗ trợ:**
> - Failover tự động giữa các App Server
> - Chuyển đổi SQL Server Active/Passive
> - Backup và replication dữ liệu định kỳ
> - Khởi động nhanh App Server tại DR Site
> - DNS/Load Balancer redirect sang DR khi DC gặp sự cố
>
> **Kịch bản DR hỗ trợ:** Sự cố App Server; Sự cố Database Server; Mất toàn bộ Data Center; Failback từ DR về DC sau khi khôi phục.
>
> **Chiến lược backup:** Full backup định kỳ; Transaction log backup; Backup cấu hình và release package; Backup File Server và cloud backup.
>
> Hệ thống sẵn sàng mở rộng sang mô hình DR automation và replication real-time.

---

## 8.3 — Tích hợp

### 8.3.1 — SSO Azure AD / LDAP

**Yêu cầu:**
> Giải pháp phải hỗ trợ tích hợp Single Sign-On (SSO) với Identity Provider là Microsoft Azure Active Directory (Azure AD) và LDAP, bao gồm các giao thức OAuth 2.0, OpenID Connect, và SAML 2.0. Nhà thầu cần cung cấp tài liệu hướng dẫn chi tiết về quy trình tích hợp.

**Đáp ứng:**

> Giải pháp VnResource HRM hỗ trợ đầy đủ cơ chế xác thực Single Sign-On (SSO) thông qua các giao thức chuẩn: OAuth 2.0; OpenID Connect (OIDC); SAML 2.0; LDAP.
>
> **Identity Provider hỗ trợ:** Microsoft Azure Active Directory (Azure AD / Entra ID); Microsoft Active Directory (LDAP); ADFS; Keycloak; Okta; Google Identity.
>
> Kiến trúc xác thực sử dụng **IdentityServer4** làm Authorization Server trung tâm, đóng vai trò cầu nối giữa hệ thống HRM và Identity Provider của khách hàng.
>
> **Luồng xác thực SSO:**
> 1. Người dùng truy cập hệ thống HRM
> 2. Hệ thống redirect đến Azure AD hoặc LDAP/ADFS
> 3. Người dùng xác thực bằng tài khoản doanh nghiệp
> 4. Identity Provider trả về Authorization Code/Token
> 5. IdentityServer4 cấp JWT Access Token và Refresh Token
> 6. Người dùng truy cập toàn bộ hệ thống mà không cần đăng nhập lại
>
> **Hệ thống hỗ trợ:** JWT Token Authentication; Refresh Token; Token Revocation; RBAC phân quyền theo Role/Scope; Scope riêng cho từng client/service; Redis Token Blacklist; HTTPS/TLS bảo mật kết nối.
>
> **Đối với LDAP/Active Directory:** Đồng bộ user từ AD về HRM; Mapping tự động thông tin user, email, đơn vị; Đồng bộ phân quyền và organizational structure.
>
> **Tài liệu cam kết cung cấp:**
> - Integration Blueprint; API Catalog; OAuth/OIDC Endpoint
> - Azure AD App Registration Guide; Claim & Attribute Mapping
> - JWT/Refresh Token Flow; Hướng dẫn cấu hình LDAP/AD
> - Quy trình xử lý token và revoke token
> - Tài liệu troubleshooting và trace lỗi xác thực

### 8.3.2 — Tích hợp toàn diện hệ sinh thái SSI

**Yêu cầu:**
> Nhà thầu đề xuất và mô tả giải pháp tích hợp toàn diện để tích hợp với các hệ thống hiện tại của SSI (Email, Office 365, ERP, CRM, eKYC, Core, ...).

**Đáp ứng:**

> Giải pháp VnResource HRM được thiết kế theo kiến trúc tích hợp mở và tập trung, hỗ trợ tích hợp với: Email / SMTP / Exchange; Microsoft Office 365; ERP; CRM; Core System; Data Platform; SSO/IAM.
>
> **Mô hình tích hợp:** HRM ↔ ESB/API Gateway ↔ Hệ thống đích (không kết nối point-to-point trực tiếp); Event-driven & loosely coupled architecture. HRM đóng vai trò **HR Master Data Hub (System of Record)**.
>
> **Kiến trúc tích hợp bao gồm:** HRM Core System; Integration Service Layer; ESB / API Gateway; Monitoring & Logging Layer; Security & IAM Layer.

**1. Tích hợp Email / Office 365**
> SMTP/SMTPS; Microsoft Exchange; Microsoft 365 / Azure AD. Chức năng: gửi email workflow/phê duyệt; OTP/reset password; Notification tự động; Calendar/meeting integration; SSO bằng Azure AD. Kỹ thuật: OAuth2 / OpenID Connect; Microsoft Graph API; SMTP TLS; Exchange Online Modern Authentication.

**2. Tích hợp ERP**
> Dữ liệu tích hợp: Payroll; Organization structure; Employee master data. Cơ chế kỹ thuật: REST API hoặc SFTP/File-based.

**3. Tích hợp CRM**
> Đồng bộ: thông tin nhân sự kinh doanh; Team assignment; Organization mapping; Employee status. Cơ chế: REST API / JSON; OAuth2 Authentication; Outbound event synchronization.

**4. Bảo mật tích hợp**
> OAuth2 / OpenID Connect; Secret Key + Scope per system; Mutual TLS (mTLS); JWT Token; TLS 1.2+; RBAC theo từng interface. Toàn bộ giao dịch tích hợp có: Correlation ID; Audit Log; Trace end-to-end.

**5. Giám sát & xử lý lỗi**
> Centralized logging; Prometheus monitoring; Structured JSON log; Retry policy; Dead Letter Queue (DLQ); Reprocess interface lỗi. Cho phép: Trace lỗi theo CorrelationId; Theo dõi latency/error rate; Retry có kiểm soát; Cảnh báo bất thường theo thời gian thực.

### 8.3.3 — Khai thác thông tin real-time / batch

**Yêu cầu:**
> Hệ thống được đề xuất phải có khả năng hỗ trợ khai thác thông tin theo thời gian thực hoặc theo lô thông qua: RESTful API; Webhook; ETL; Streaming (socket).

**Đáp ứng:**

> **RESTful API:** Bộ API chuẩn REST/HTTPS với định dạng JSON đầy đủ. Hỗ trợ phân trang (cursor/offset), lọc dữ liệu theo thời gian (updated_since, from/to), xác thực OAuth2/JWT, versioning API và cơ chế trả lỗi HTTP chuẩn hóa.
>
> **Webhook / Event Callback:** Cơ chế event-driven callback, tự động gửi HTTP POST/JSON đến endpoint được cấu hình khi phát sinh sự kiện nghiệp vụ (nhân sự mới, thay đổi tổ chức, cập nhật lương, trạng thái workflow). Hỗ trợ retry policy, correlation ID và audit log đầy đủ thông qua ESB/API Gateway.
>
> **ETL / Batch Integration:** Cơ chế ETL và đồng bộ dữ liệu gia tăng thông qua CDC (Watermark Timestamp, Version-based), bulk export dữ liệu theo lịch với các định dạng CSV/JSON/Parquet, hỗ trợ backfill/replay theo Time Window. Batch job chạy nền, tối ưu ngoài giờ cao điểm.
>
> **Streaming / Near-Realtime Integration:** Hỗ trợ near-realtime và realtime integration thông qua Kafka/Message Broker, cho phép publish các sự kiện nghiệp vụ và subscribe xử lý dữ liệu theo thời gian thực với độ trễ thấp. Ngoài ra hỗ trợ REST API polling tần suất cao cho các nhu cầu near-realtime synchronization.

### 8.3.4 — Tích hợp file với ECM

**Yêu cầu:**
> Hệ thống cho phép tích hợp file với hệ thống quản lý file tập trung (ECM).

**Đáp ứng:**

> VnResource HRM hỗ trợ tích hợp file toàn diện với hệ thống quản lý tài liệu tập trung (ECM) của SSI thông qua kiến trúc **HRM ↔ ESB ↔ ECM**, không kết nối point-to-point.
>
> **Lưu trữ file nội bộ:** HRM sử dụng AWS S3 / Object Storage (môi trường Cloud) hoặc File Server NFS (On-Premise) làm backend lưu trữ document nhân sự (hợp đồng lao động, chứng chỉ, ảnh...) với tính nhất quán cao khi scale đa node.
>
> **Tích hợp với ECM hỗ trợ cả hai chiều:**
> - Chiều ra (HRM → ECM): HRM tự động đẩy tài liệu lên ECM kèm metadata qua REST API / Multipart HTTPS hoặc SFTP/FTPS; ECM trả về document reference để HRM hiển thị mà không cần lưu file vật lý trong database HRM.
> - Chiều vào (ECM → HRM): ECM có thể đẩy tài liệu vào HRM qua Inbound API chuẩn với cơ chế idempotent, audit log và xử lý lỗi đầy đủ.
>
> **Bảo mật file:** Toàn bộ file được mã hóa AES-256 lưu trữ, truyền qua TLS 1.2+, kiểm soát truy cập theo RBAC và ghi audit log đầy đủ theo yêu cầu bảo mật của SSI.

---

## Hệ thống hỗ trợ (Distributed Tracing — §084)

> **Distributed tracing** — Request flow tracking; Service dependency mapping; End-to-end transaction visibility; Trace correlation với centralized logging.
>
> Trong hệ thống microservices, một request thường đi qua nhiều service. Distributed tracing giúp: theo dõi request đã đi qua những service nào; xác định service nào xử lý chậm hoặc phát sinh lỗi; phân tích nguyên nhân gây bottleneck.
>
> **Công nghệ hỗ trợ:** OpenTelemetry; Jaeger; Zipkin hoặc tương đương; Cloud-native tracing services.

---

## Liên kết

- [[wiki/projects/SSI-Project]]
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]
- [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]
