---
type: source
code: d3e4f
description: "SSI Ch.3: yêu cầu vận hành — thiết bị đầu cuối, phần mềm máy trạm, quản trị on-cloud và on-premise, giám sát, logging, SLA, tài liệu bàn giao; kèm đáp ứng VnResource"
tags:
  - ssi
  - van-hanh
  - sla
  - monitoring
domain: system
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
---

# Source: SSI Ch.3 — Vận hành & SLA (Chi tiết)

## Tóm tắt
Chương 3 của hồ sơ thầu SSI quy định các yêu cầu vận hành chi tiết cho cả mô hình On-Cloud và On-Premise, bao gồm: cấu hình phần cứng/phần mềm thiết bị đầu cuối, quản trị dịch vụ tập trung, giám sát realtime (tính sẵn sàng, hiệu năng, capacity), centralized logging với Trace ID, cảnh báo đa kênh (email/SMS), công cụ theo dõi SLA và yêu cầu bàn giao tài liệu. VnResource HRM đáp ứng thông qua stack giám sát Prometheus/Grafana, ELK/Graylog, cơ chế Maker-Checker, và quy trình xử lý sự cố chuẩn ITIL.

## Items chi tiết

---
### 3.1.1 — Thiết bị đầu cuối (On-Cloud)

**3.1.1.1 — Mức độ sử dụng performance dự kiến (CPU, RAM) trên máy trạm**

**Yêu cầu:**
> Nhà thầu đưa ra mức độ sử dụng performance dự kiến (CPU, RAM,..) đối với các phần mềm/ứng dụng/add-on cần có trên máy trạm người dùng cuối của Dự Án.

**Đáp ứng VnResource:**
> Dưới đây là yêu cầu cho máy client:
>
> § Yêu cầu cấu hình phần cứng
> - Core 2 Duo hoặc cao hơn.
> - RAM: 4GB hoặc cao hơn.
>
> § Yêu cầu cấu hình Software
> - Browser: Chrome từ 60 trở lên hoặc Firefox từ 55 trở lên
> - Mobile: IOS 11 hoặc cao hơn và Android 6 hoặc cao hơn

---

**3.1.1.2 — Hỗ trợ máy trạm Windows 11 64-bit**

**Yêu cầu:**
> Hệ thống đề xuất phải hỗ trợ các máy trạm chạy hệ điều hành từ phiên bản MS Windows 11 trở lên. Phải hỗ trợ kiến trúc OS 64bit.

**Đáp ứng VnResource:**
> Hệ thống đáp ứng hoàn toàn yêu cầu về khả năng tương thích với môi trường máy trạm. Hệ thống được thiết kế và tối ưu hóa để hoạt động ổn định trên các máy trạm chạy hệ điều hành Microsoft Windows phiên bản 11 trở lên và hỗ trợ đầy đủ kiến trúc hệ điều hành 64-bit.
>
> Đối với mô hình triển khai web-based, người dùng có thể truy cập hệ thống thông qua các trình duyệt phổ biến trên nền tảng Windows 11 64-bit như Google Chrome, Microsoft Edge hoặc Mozilla Firefox, Safari phiên bản được nhà sản xuất hỗ trợ.

---

**3.1.1.3 — Hỗ trợ đa trình duyệt 64-bit (Chrome, Edge, Firefox, Safari)**

**Yêu cầu:**
> Hệ thống đề xuất phải hỗ trợ các máy trạm truy cập từ nhiều trình duyệt Internet phổ biến với kiến trúc 64bit như: Chrome, Edge, Firefox, Safari.

**Đáp ứng VnResource:**
> Đáp ứng. Hệ thống đáp ứng hoàn toàn yêu cầu về khả năng tương thích đa trình duyệt. Hệ thống được thiết kế theo các tiêu chuẩn web hiện đại, đảm bảo khả năng truy cập mượt mà, hiển thị chính xác và vận hành ổn định trên các trình duyệt Internet phổ biến chạy trên kiến trúc 64-bit, bao gồm: Google Chrome, Microsoft Edge, Mozilla Firefox và Apple Safari.

---

**3.1.1.4 — Băng thông dự kiến mỗi máy trạm kết nối On-Cloud**

**Yêu cầu:**
> Nhà thầu đưa ra mức độ sử dụng băng thông dự kiến đảm bảo sự hoạt động ổn định khi kết nối đến các thành phần On-Cloud của mỗi máy trạm người dùng cuối.

**Đáp ứng VnResource:**
> Giải pháp được thiết kế nhằm tối ưu lưu lượng truyền tải giữa máy trạm người dùng cuối và các thành phần hệ thống triển khai trên Cloud.
>
> Băng thông sử dụng trung bình: khoảng 200 Kbps -- 500 Kbps/user trong điều kiện sử dụng thông thường
>
> Băng thông khuyến nghị: tối thiểu 2 Mbps/user để đảm bảo khả năng truy cập ổn định trong giờ cao điểm hoặc khi thực hiện đồng thời nhiều thao tác nghiệp vụ
>
> Thành phần sử dụng băng thông: Truy cập Web/Application Portal; API communication; Realtime transaction processing; Đồng bộ dữ liệu và tải báo cáo.
>
> Điều kiện giả định: Kết nối Internet ổn định; Độ trễ mạng (latency) phù hợp cho môi trường truy cập Cloud; Không bao gồm lưu lượng phát sinh từ các ứng dụng ngoài phạm vi hệ thống.
>
> Giải pháp tối ưu hiệu năng: HTTPS compression; Connection optimization; Caching mechanism; Load balancing; Monitoring và performance tuning.

---

**3.1.1.5 — MFA và SSO trên ứng dụng mobile**

**Yêu cầu:**
> Ứng dụng cài đặt trên Phone/Table (nếu có) khi xác thực user đăng nhập phải hỗ trợ MFA và có khả năng tích hợp SSO với hệ thống AD/LDAP của công ty khách hàng.

**Đáp ứng VnResource:**
> Hệ thống đáp ứng đầy đủ yêu cầu về bảo mật xác thực trên ứng dụng di động (Phone/Tablet). Ứng dụng được thiết kế với cơ chế xác thực hiện đại, hỗ trợ Xác thực đa yếu tố (MFA - Multi-Factor Authentication) và có khả năng tích hợp Single Sign-On (SSO) với hệ thống AD/LDAP của tổ chức khách hàng.
>
> Tích hợp với hệ thống xác thực LDAP/AD: Thiết lập các chính sách bảo mật chung — Lựa chọn xác thực trên chương trình hay thông qua Active Directory, bật tắt nhật ký hệ thống...
>
> Menu: Quản trị > Chính sách bảo mật > Check chọn "Xác thực người dùng bằng Active Directory" hay không.
>
> Cơ chế đăng nhập một hoặc hai lớp và đăng nhập 1 lần (SSO): Hệ thống VnResource HRM hỗ trợ SSO VnResourceAD, SSO – ADFS, SSO – AzureAD, SSO-Google, ...bất kỳ hệ thống nào...

---
### 3.1.2 — Phần mềm/công cụ cần cài đặt trên máy trạm (On-Cloud)

**3.1.2.1 — Liệt kê đề xuất phần mềm máy trạm**

**Đáp ứng VnResource:**
> Đối với người dùng cuối truy cập hệ thống triển khai trên Cloud, nhà thầu đề xuất các phần mềm và công cụ cần thiết trên máy trạm:
>
> - **Web Browser** (Google Chrome / Microsoft Edge): Truy cập Web/Application Portal; Hỗ trợ HTTPS/TLS và các cơ chế bảo mật của hệ thống; Hỗ trợ realtime dashboard, transaction processing và web-based services.
> - **VPN Client** (nếu áp dụng): Kết nối an toàn tới môi trường hệ thống On-Cloud; Hỗ trợ secure remote access; Đảm bảo lưu lượng truy cập tuân thủ chính sách bảo mật của khách hàng.
> - **Microsoft Office / PDF Reader**: Xem và xử lý tài liệu nghiệp vụ; Xuất báo cáo và dữ liệu từ hệ thống; Hỗ trợ import/export dữ liệu (nếu áp dụng).
> - **Endpoint Security / Antivirus**: Đảm bảo an toàn bảo mật cho máy trạm; Giảm thiểu nguy cơ malware, ransomware hoặc unauthorized access.
>
> Yêu cầu chung: Hỗ trợ hệ điều hành Windows 10/11; Máy trạm phải có kết nối Internet ổn định; Các phần mềm cài đặt phải có bản quyền hợp lệ; Hỗ trợ cơ chế cập nhật security patch và software update.

---

**3.1.2.2 đến 3.1.2.6 — Bản quyền, tài liệu, bảo mật, Silent Install, Automatic Update**

**Đáp ứng VnResource (tổng hợp):**
> - **Bản quyền**: Cam kết các phần mềm và công cụ cài đặt trên máy trạm đều có bản quyền hợp lệ hoặc sử dụng theo mô hình Open Source hợp pháp. Phần mềm thương mại (Windows, Office) do SSI quản lý và cấp license; công cụ Open Source (Chrome, Edge, VSCode, Authenticator) sử dụng đúng điều khoản giấy phép.
>
> - **Tài liệu hướng dẫn**: Nhà thầu cam kết cung cấp bộ tài liệu hướng dẫn vận hành (bản mềm PDF) cho toàn bộ phần mềm/công cụ trên máy trạm, bao gồm: hướng dẫn cài đặt, hướng dẫn sử dụng, hướng dẫn xử lý sự cố cơ bản. Tài liệu bàn giao cùng thời điểm bàn giao máy trạm và được cập nhật khi có thay đổi trong suốt thời gian bảo hành.
>
> - **An toàn bảo mật**: Không sử dụng các công cụ remote công cộng như TeamViewer, UltraViewer, AnyDesk. Hỗ trợ thực hiện qua: hỗ trợ trực tiếp (on-site) tại văn phòng SSI; Hotline và email hỗ trợ chính thức; VPN hoặc máy trạm trung gian nếu SSI cho phép.
>
> - **Silent Install**: Hỗ trợ cơ chế Silent Install thông qua tham số dòng lệnh tiêu chuẩn (/qn, /S, /VERYSILENT), tương thích với SCCM, Intune, Group Policy (GPO).
>
> - **Automatic Update**: Hỗ trợ cập nhật qua server nội bộ do SSI quản lý (khuyến nghị); cập nhật qua kênh chính hãng; cập nhật theo lịch (scheduled update) để không ảnh hưởng giờ làm việc.

---

**3.1.2.7 đến 3.1.2.11 — Phần mềm bên thứ 3**

**Đáp ứng VnResource:**
> Danh sách phần mềm bên thứ 3 đề xuất: Google Chrome / Microsoft Edge; VPN Client (nếu áp dụng); Endpoint Security / Antivirus; Microsoft Office; PDF Reader; RemoteDesktop (đi kèm theo hệ điều hành).
>
> Tất cả tương thích với Windows 10/11, với cơ chế bảo mật trình duyệt (HTTPS/TLS), không xung đột với Endpoint Security. Đều có bản quyền hợp lệ. Nhà thầu cung cấp đầy đủ tài liệu hướng dẫn cài đặt, vận hành, quản trị, troubleshooting cho từng công cụ bên thứ 3 theo yêu cầu từ SSI (nếu có sử dụng).

---
### 3.1.3 — Quản trị vận hành hệ thống On-Cloud

**3.1.3.1.1 — Dashboard quản lý tập trung, start/stop/config services**

**Đáp ứng VnResource:**
> Quản trị và vận hành là tập hợp các hoạt động kỹ thuật nhằm duy trì, giám sát, bảo trì và tối ưu toàn bộ hệ thống triển khai trên môi trường On-Cloud.
>
> Phạm vi quản trị:
> - Hạ tầng Cloud: Compute (VM/Container), Storage, Network, Database, Security Group
> - Nền tảng (Platform): Operating System, Web Server, Middleware, Runtime Environment
> - Ứng dụng: Application Services, API Gateway, Microservices, Batch/Scheduler Jobs
> - Giám sát: Monitoring, Centralized Logging, Alerting, APM
> - Bảo mật: IAM, Firewall, WAF, Encryption, Audit Log
>
> Giám sát hệ thống: Giám sát CPU, Memory, Disk I/O, Network throughput; Theo dõi trạng thái dịch vụ và uptime; Thu thập log tập trung; Thiết lập ngưỡng cảnh báo.
>
> Quản trị cấu hình: Quản lý phiên bản cấu hình theo version control; Triển khai theo Infrastructure as Code (IaC); Đồng bộ cấu hình giữa các môi trường Dev/Test/Staging/Production.
>
> Bảo trì và cập nhật: Cập nhật bản vá bảo mật OS và phần mềm; Nâng cấp phiên bản theo release management; Tối ưu performance database: index, query, partitioning; Dọn dẹp log, dữ liệu tạm theo chính sách retention.
>
> Sao lưu và phục hồi: Full backup + incremental backup; Lưu trữ bản sao lưu phân tán đa vùng (multi-region); Kiểm thử restore định kỳ; Đảm bảo RPO/RTO.
>
> Quản lý sự cố: Tiếp nhận và phân loại sự cố theo mức độ ưu tiên (P1 đến P4); Xử lý theo quy trình chuẩn ITIL; Root Cause Analysis (RCA); Cập nhật knowledge base.
>
> Bảo mật vận hành: RBAC, vulnerability scanning định kỳ, kiểm soát truy cập từ xa qua VPN/Bastion Host, audit log đầy đủ.
>
> Phân tầng hỗ trợ kỹ thuật: L1 (Service Desk) → L2 (Operation Support) → L3 (Engineering Support).

---

**3.1.3.1.2 — Phân quyền theo Role (Admin, Operator, Auditor, Viewer)**

**Đáp ứng VnResource:**
> Hệ thống On-Cloud hỗ trợ cơ chế phân quyền theo vai trò (Role-Based Access Control – RBAC) nhằm đảm bảo việc quản trị và vận hành các thành phần hệ thống được kiểm soát chặt chẽ.
>
> Yêu cầu phân quyền: Hỗ trợ Role (Admin, Operator, Auditor, Viewer hoặc tương đương); Kiểm soát quyền truy cập theo nguyên tắc "least privilege".
>
> Phạm vi áp dụng: Quản lý và vận hành tài nguyên Cloud; Khởi động/dừng/cấu hình dịch vụ; Truy cập dữ liệu, log và monitoring; Xem báo cáo và audit log.
>
> Yêu cầu kiểm soát và bảo mật: Xác thực người dùng trước khi truy cập; Ghi nhận audit log cho toàn bộ thao tác theo từng Role; Hỗ trợ phân tách môi trường (DEV/UAT/PROD).

---

**3.1.3.1.3 — Cấu hình tham số, job, process trên Cloud**

**Đáp ứng VnResource:**
> Hệ thống hỗ trợ quản trị viên thực hiện cấu hình và thay đổi các tham số vận hành, job và tiến trình thông qua các cơ chế quản trị trên nền tảng Cloud.
>
> Phạm vi quản lý trên Cloud: Tham số cấu hình hệ thống (configuration parameters); Job/Batch processing (scheduled jobs, background jobs); Tiến trình xử lý hệ thống; Workflow hoặc automation jobs (nếu áp dụng).
>
> Khả năng vận hành trên Cloud: Quản lý và thay đổi cấu hình thông qua Cloud Management Console; Kích hoạt/dừng/lập lịch thực thi job; Quản lý trạng thái các service/process chạy trên Cloud.
>
> Kiểm soát và an toàn: Phân quyền theo IAM/RBAC; Ghi nhận audit log; Kiểm soát thay đổi theo cơ chế approval; Đảm bảo an toàn khi thay đổi cấu hình trong môi trường Production.

---

**3.1.3.1.4 — Bulk start/stop services, thay đổi config hàng loạt**

**Đáp ứng VnResource:**
> Hệ thống hỗ trợ khả năng thực hiện các thao tác vận hành hàng loạt (bulk operations) đối với services và cấu hình hệ thống trên nền tảng Cloud.
>
> Khả năng vận hành hàng loạt: stop/start/restart services đồng thời trên nhiều server/instance; Thay đổi cấu hình/tham số hệ thống cho toàn bộ hệ thống, từng cụm server, từng nhóm services có cấu hình tương đồng.
>
> Phạm vi áp dụng: Application services; Background services/jobs; API services; Containerized workloads (Docker/Kubernetes).
>
> Yêu cầu vận hành: Thao tác theo nhóm (group-based management); Kiểm soát trạng thái trước và sau thao tác; Cơ chế rollback khi thay đổi cấu hình gây ảnh hưởng hệ thống; Ghi nhận audit log cho toàn bộ bulk operation.

---

**3.1.3.1.5 — Tự động hóa vận hành**

**Đáp ứng VnResource:**
> Hệ thống hỗ trợ các cơ chế tự động hóa vận hành trên nền tảng Cloud nhằm tối ưu hóa việc quản lý tài nguyên, giảm thiểu thao tác thủ công và đảm bảo khả năng vận hành ổn định.
>
> Phạm vi tự động hóa: Tự động scale tài nguyên Cloud (auto scaling); Tự động khởi động/dừng/khởi động lại tài nguyên Cloud; Tự động thực thi job/batch qua Cloud scheduler; Tự động xử lý tác vụ vận hành định kỳ; Tự động kích hoạt hành động dựa trên cảnh báo.
>
> Cơ chế tự động hóa: Event-driven automation; Schedule-based automation; Policy-based automation (theo ngưỡng CPU, RAM, latency); Sử dụng các dịch vụ tự động hóa của Cloud provider (AWS/Azure).

---

**3.1.3.1.6 — Phương án dự phòng khi On-Cloud không truy cập được**

**Đáp ứng VnResource:**
> Hệ thống được thiết kế với khả năng chịu lỗi (resilient architecture) và phương án dự phòng (Disaster Recovery – DR) trên nền tảng Cloud.
>
> Kiến trúc chịu lỗi: Mô hình High Availability (HA); Phân tán thành phần trên nhiều Availability Zone (AZ); Hỗ trợ tự động failover.
>
> Phương án Disaster Recovery: Hỗ trợ Backup & Restore; Pilot Light; Warm Standby; Multi-Site Active-Active (nếu áp dụng).
>
> Multi-Region (nếu áp dụng): Triển khai trên nhiều Region; Cho phép chuyển đổi vùng (region failover); Đồng bộ dữ liệu giữa các region (active-passive hoặc active-active).
>
> Khả năng phục hồi vận hành: Tự phục hồi khi kết nối hoặc dịch vụ Cloud được khôi phục; Cơ chế retry, reconnect và resync dữ liệu sau sự cố; Dịch vụ quan trọng được ưu tiên khôi phục theo mức độ criticality.

---

**3.1.3.1.7 đến 3.1.3.1.12 — Giám sát và cảnh báo tập trung**

**Đáp ứng VnResource:**
> Hệ thống phải hỗ trợ cơ chế giám sát và cảnh báo tập trung trên nền tảng Cloud (AWS/Azure hoặc tương đương), đồng thời có khả năng tích hợp với hệ thống giám sát bên ngoài như Prometheus và Grafana.
>
> Hệ thống cho phép: Giám sát trạng thái hoạt động và hiệu năng của toàn bộ tài nguyên và dịch vụ; Thiết lập cảnh báo khi hệ thống vượt ngưỡng hoặc phát sinh lỗi; Truy xuất và phân tích log tập trung; Trực quan hóa dữ liệu giám sát thông qua dashboard.
>
> Hệ thống giám sát thời gian thực bao gồm các chỉ số:
> - Tầng Hạ tầng: CPU, RAM, Disk I/O, Network I/O; Uptime, resource saturation, container restarts; Auto-scaling events, số lượng pod/instance.
> - Tầng Ứng dụng/API: Response time theo P50/P95/P99; Throughput (RPS/TPS); Error rate theo mã lỗi (4xx/5xx), tỷ lệ timeout; Distributed Tracing (end-to-end bottleneck).
> - Tầng Database & Middleware: DB connections, query latency, slow queries, replication lag; Cache hit/miss, memory usage; Queue depth, consumer lag.
> - Tầng Kết nối On-Cloud: Latency, packet loss, trạng thái kết nối UP/DOWN; Giám sát endpoint tích hợp internal/external; SSL/TLS certificate expiry (tùy chọn).
>
> Giám sát Capacity/Utilization theo thời gian thực: CPU/RAM utilization %; Disk utilization, IOPS, tốc độ tăng trưởng dung lượng; Network In/Out, saturation/quota; DB connections utilization, cache utilization, queue depth.
>
> Cảnh báo theo ngưỡng: ví dụ CPU > 80% trong 10 phút, RAM > 85%, disk free < 15%, connection pool > 90%; Phân cấp mức độ Critical/Warning/Info.
>
> Dashboard quản lý tập trung duy nhất (Single Pane of Glass) cho toàn bộ thành phần On-Cloud.
>
> Tích hợp với hệ giám sát tập trung của SSI qua: API (RESTful API/Webhook); Syslog (RFC3164/5424); SNMP (v2/v3); Export metrics theo Prometheus/OpenMetrics; Agent-based forwarding (Linux/Windows).
>
> Công cụ giám sát cho phép người quản trị tùy biến (customize) từ các nguồn metrics, logs, traces và publish ra Dashboard giám sát tập trung.

---

**3.1.3.1.13 đến 3.1.3.1.16 — Kiểm tra từ xa, cảnh báo đa kênh, thông báo lỗi**

**Đáp ứng VnResource:**
> Hệ thống hỗ trợ đầy đủ khả năng giám sát và kiểm tra từ xa (Remote Monitoring) tình trạng hoạt động của các Workloads, Processes và Services đang chạy.
>
> Giám sát tiến trình và dịch vụ: Kiểm tra trạng thái (Running, Stopped, Paused) dịch vụ; Giám sát danh sách tiến trình đang chạy, phát hiện tiến trình lạ/bị treo; Giám sát Cronjobs, Windows Task Scheduler, Background jobs.
>
> Cơ chế kiểm tra từ xa: Thu thập dữ liệu qua Agent/Agentless (SNMP, WMI, SSH); Health Check (TCP, HTTP, ICMP) trạng thái thực; Truy vấn chi tiết (PID, Owner, Command line, Thread count) trên giao diện quản lý tập trung.
>
> Cảnh báo đa kênh (Phone Apps/SMS/Email) cho cá nhân và nhóm vận hành đối với: Vi phạm chính sách truy cập, vi phạm quyền hạn, vi phạm quy tắc khai báo; Vượt ngưỡng hiệu năng, tài nguyên bất thường; Service unavailable, sự kiện bảo mật.
>
> Thông báo lỗi: Hệ thống hỗ trợ chuyển đổi thông báo lỗi thành nội dung dễ hiểu, bao gồm nguyên nhân, tình trạng lỗi và hướng xử lý cơ bản. Không hiển thị thông tin nhạy cảm (tên tài khoản, mật khẩu); áp dụng masking và phân quyền hiển thị.

---

**3.1.3.1.17 — Báo cáo vận hành**

**Đáp ứng VnResource:**
> Hệ thống cung cấp đầy đủ các báo cáo bao gồm:
> - Báo cáo lỗi hệ thống với thông tin mã lỗi, mô tả, nguyên nhân và hướng xử lý
> - Báo cáo sử dụng tài nguyên (CPU, RAM, Disk)
> - Báo cáo sử dụng ứng dụng
> - Báo cáo response time của dịch vụ/API
>
> Các báo cáo hỗ trợ trực quan hóa, phân tích theo thời gian, drill-down chi tiết và xuất báo cáo linh hoạt.

---

**3.1.3.1.18 đến 3.1.3.1.21 — Logging, Logs Explorer, truy vấn log**

**Đáp ứng VnResource:**
> Hệ thống hỗ trợ ghi log toàn bộ request/response giữa các thành phần nội bộ và với hệ thống bên ngoài; sử dụng Trace ID/Correlation ID để truy vết end-to-end luồng giao dịch.
>
> Thông tin log bao gồm: Chức năng thực hiện; Thời gian request/response; Duration xử lý; Request payload; Response payload; User thao tác; Trạng thái xử lý; Thông tin lỗi (nếu có).
>
> Hệ thống hỗ trợ lưu trữ, tìm kiếm và truy vết log theo chính sách quản lý nhật ký sự kiện của khách hàng.
>
> Logs Explorer tập trung cho phép tìm kiếm, phân tích và truy vết log theo thời gian thực; đồng thời hỗ trợ tích hợp với Splunk thông qua Syslog, HTTP Event Collector (HEC), API/Webhook hoặc agent forwarding.
>
> Hệ thống cho phép truy vấn/trích xuất logs theo thời gian thực dựa trên tham số điều kiện linh hoạt: thời gian, ngày tháng, account, thành phần hệ thống, mức độ log, Trace ID; hỗ trợ query nâng cao (AND/OR, filter, full-text search); đảm bảo phân quyền, masking dữ liệu nhạy cảm.

---
### 3.1.4 — SLA Cam kết (Bắt buộc nếu Vendor vận hành On-Cloud)

**Yêu cầu:**
> SLA Cam kết về Service Requests và Incident Requests: Bắt buộc trong trường hợp Vendor vận hành trực tiếp Dự Án/Hệ thống On-Cloud (IT SSI không tham gia vận hành).

**3.1.4.1:** Tất cả SLA cam kết chất lượng dịch vụ phải được sự đồng ý và thống nhất của các nhóm/đại diện nhóm thuộc bộ phận IT SSI có liên quan đến Dự Án trước khi đưa vào Hợp Đồng.

**3.1.4.2:** Đối với các SLA của Dự Án đã có sẵn định nghĩa trong Danh mục ITSM nội bộ của SSI: SLA cam kết của Nhà thầu phải thống nhất thoả thuận với IT QA và các nhóm thuộc IT SSI để đảm bảo phù hợp với SLA mà IT SSI đã ban hành. Đối với các SLA của Dự Án chưa có định nghĩa: Nhà thầu đưa ra gợi ý về thời gian SLA cụ thể, kết hợp cùng với các nhóm IT SSI để thống nhất và đưa ra thời gian SLA phù hợp.

**3.1.4.3 — Công cụ theo dõi Request:**
> Nhà thầu phải cung cấp công cụ để IT SSI có thể theo dõi được tất cả các requests (bao gồm: Services và Incidents) mà SSI đã gửi sang Nhà thầu. SSI có thể theo dõi được các thông tin chi tiết:
> - Phân loại Request thuộc Service Requests/Incident Requests
> - Thời gian gửi
> - Thời gian tiếp nhận
> - Người gửi
> - Trạng thái xử lý
> - Thời gian quá hạn xử lý yêu cầu (theo SLA đã thống nhất)
> - Người tiếp nhận xử lý
> - Ghi chú (nếu có)
> - Nguyên nhân lỗi sau khi chẩn đoán và xử lý xong
>
> Công cụ cho phép SSI có thể xuất Báo Cáo định kỳ tất cả hoặc chọn lọc về các Requests.

**3.1.4.4:** Nhà thầu cung cấp đầu mối tiếp nhận Requests từ SSI.

---
### 3.1.5 — Tài liệu bàn giao (Không bắt buộc nếu Vendor vận hành trực tiếp On-Cloud)

**3.1.5.1:** Tài liệu bàn giao vận hành ban đầu phải đảm bảo có đầy đủ các nội dung theo file đính kèm.

**3.1.5.2:** Tài liệu đào tạo phải đảm bảo có đầy đủ hướng dẫn về tất cả các bước sử dụng công cụ Giám Sát Hệ Thống.

---
### 3.2.1 — Máy trạm (On-Premise)

**3.2.1.1 — Performance dự kiến trên máy trạm**

**Đáp ứng VnResource:**
> Đáp ứng. Nhà thầu đáp ứng hoàn toàn yêu cầu về việc đưa ra mức độ sử dụng tài nguyên dự kiến (CPU, RAM, Disk, Network).
>
> § Yêu cầu cấu hình phần cứng: Core 4 Duo hoặc cao hơn; RAM: 8GB hoặc cao hơn.
>
> § Yêu cầu cấu hình Software: Browser: Chrome từ 60 trở lên hoặc Firefox từ 55 trở lên; Mobile: IOS 11 hoặc cao hơn và Android 6 hoặc cao hơn.

---

**3.2.1.2 — Hỗ trợ Windows 11 64-bit**

**Đáp ứng VnResource:**
> Hệ thống đáp ứng hoàn toàn yêu cầu về khả năng tương thích với môi trường máy trạm. Hệ thống được thiết kế và tối ưu hóa để hoạt động ổn định trên các máy trạm chạy hệ điều hành Microsoft Windows phiên bản 11 trở lên và hỗ trợ đầy đủ kiến trúc hệ điều hành 64-bit.
>
> Đối với mô hình triển khai web-based, người dùng có thể truy cập hệ thống thông qua các trình duyệt phổ biến trên nền tảng Windows 11 64-bit như Google Chrome, Microsoft Edge hoặc Mozilla Firefox, Safari phiên bản được nhà sản xuất hỗ trợ.

---

**3.2.1.3 — Hỗ trợ đa trình duyệt 64-bit**

**Đáp ứng VnResource:**
> Đáp ứng. Hệ thống đáp ứng hoàn toàn yêu cầu về khả năng tương thích đa trình duyệt. Hệ thống được thiết kế theo các tiêu chuẩn web hiện đại, đảm bảo khả năng truy cập mượt mà, hiển thị chính xác và vận hành ổn định trên các trình duyệt Internet phổ biến chạy trên kiến trúc 64-bit, bao gồm: Google Chrome, Microsoft Edge, Mozilla Firefox và Apple Safari.

---
### 3.2.2 — Phần mềm/công cụ cần cài đặt trên máy trạm (On-Premise)

**3.2.2.1 — Liệt kê đề xuất phần mềm máy trạm**

**Đáp ứng VnResource:**
> Giải pháp VnResource HRM được thiết kế theo mô hình web-based, người dùng truy cập qua trình duyệt nên hầu như không cần cài đặt phần mềm chuyên biệt trên máy trạm.
>
> Các phần mềm/công cụ đề xuất trên máy trạm gồm:
> - Google Chrome / Microsoft Edge (phiên bản mới nhất): Truy cập và sử dụng hệ thống HRM; Hỗ trợ đầy đủ UI, dashboard, upload file, workflow.
> - Microsoft Office: Mở file Excel/PDF/DOCX xuất từ HRM; Phục vụ import/export dữ liệu.
> - PDF Reader: Xem báo cáo và chứng từ PDF.
> - Microsoft Authenticator / Google Authenticator (nếu dùng MFA/2FA): Xác thực OTP khi đăng nhập SSO.
> - VPN Client (nếu SSI yêu cầu truy cập nội bộ): Kết nối an toàn vào mạng SSI.
>
> Giải pháp KHÔNG yêu cầu: Cài Java Runtime; Cài client desktop riêng; Cài ActiveX hoặc plugin trình duyệt đặc biệt.
>
> Toàn bộ truy cập được thực hiện qua HTTPS/TLS bảo mật và tương thích với môi trường CNTT hiện tại của SSI.

---

**3.2.2.2 — Bản quyền phần mềm máy trạm**

**Đáp ứng VnResource:**
> Nhà thầu cam kết các phần mềm và công cụ được cài đặt trên máy trạm phục vụ triển khai và vận hành hệ thống đều có bản quyền hợp lệ hoặc sử dụng theo mô hình Open Source hợp pháp.
>
> Các phần mềm thương mại như Microsoft Windows, Microsoft Office, PDF Reader thương mại (nếu có) sẽ do SSI quản lý và cấp license theo chính sách CNTT nội bộ.
>
> Các công cụ Open Source như Google Chrome, Microsoft Edge, Visual Studio Code, Microsoft Authenticator / Google Authenticator được sử dụng theo đúng điều khoản giấy phép của nhà cung cấp.

---

**3.2.2.3 — Tài liệu hướng dẫn vận hành máy trạm**

**Đáp ứng VnResource:**
> Nhà thầu cam kết đáp ứng đầy đủ yêu cầu của SSI. Nhà thầu sẽ cung cấp bộ tài liệu hướng dẫn vận hành (bản mềm PDF) cho toàn bộ phần mềm/công cụ được cài đặt trên máy trạm, bao gồm: hướng dẫn cài đặt, hướng dẫn sử dụng, hướng dẫn xử lý sự cố cơ bản. Tài liệu sẽ được bàn giao cùng thời điểm bàn giao máy trạm và được cập nhật khi có thay đổi trong suốt thời gian bảo hành.

---

**3.2.2.4 — Bảo mật và kênh hỗ trợ trực tiếp (không remote công cộng)**

**Đáp ứng VnResource:**
> Nhà thầu cam kết tuân thủ nghiêm ngặt quy trình và chính sách bảo mật của SSI.
>
> Về An toàn bảo mật: Toàn bộ phần mềm và công cụ được Nhà thầu cài đặt trên máy trạm đều là sản phẩm có nguồn gốc rõ ràng, tuân thủ các tiêu chuẩn bảo mật quốc tế và chính sách An toàn bảo mật của SSI.
>
> Về kênh hỗ trợ kỹ thuật: Nhà thầu không sử dụng các công cụ remote công cộng như TeamViewer, UltraViewer, AnyDesk. Việc hỗ trợ sẽ được thực hiện qua các kênh chính thức: Hỗ trợ trực tiếp (on-site) tại văn phòng SSI; Hotline và email hỗ trợ chính thức; VPN hoặc máy trạm trung gian nếu SSI cho phép.

---

**3.2.2.5 — Silent Install và Automatic Update**

**Đáp ứng VnResource:**
> Về Silent Install: Hỗ trợ cơ chế Silent Install thông qua tham số dòng lệnh tiêu chuẩn (/qn, /S, /VERYSILENT). Nhà thầu sẽ cung cấp kịch bản (script) cài đặt tự động và gói cài đặt chuẩn (MSI/EXE) tương thích với Microsoft SCCM, Intune, Group Policy (GPO).
>
> Về Automatic Update: Các phần mềm/công cụ đều hỗ trợ cơ chế cập nhật tự động khi có phiên bản mới, có thể cấu hình theo: Cập nhật qua server nội bộ do SSI quản lý (khuyến nghị); Cập nhật qua kênh chính hãng (nếu được SSI cho phép); Cập nhật theo lịch (scheduled update) để không ảnh hưởng giờ làm việc.

---

**3.2.2.7 đến 3.2.2.10 — Phần mềm bên thứ 3 (On-Premise)**

**Đáp ứng VnResource:**
> Danh sách phần mềm bên thứ 3 đề xuất: Google Chrome / Microsoft Edge; VPN Client (nếu áp dụng); Endpoint Security / Antivirus; Microsoft Office; PDF Reader; RemoteDesktop (đi kèm theo hệ điều hành).
>
> Tất cả tương thích với phần cứng, hệ điều hành, cơ sở dữ liệu và giải pháp ứng dụng được đề xuất. Đều có bản quyền đầy đủ, hợp lệ theo quy định của nhà cung cấp và yêu cầu từ SSI.
>
> VnResource cam kết cung cấp đầy đủ tài liệu hướng dẫn vận hành và quản trị cho toàn bộ phần mềm và công cụ bên thứ ba, bao gồm: hướng dẫn cài đặt/cấu hình; vận hành Application Server, Database, Redis, Nginx; monitoring với Prometheus/Grafana; backup/restore và DR; quản trị tài khoản, phân quyền và bảo mật; Docker/Kubernetes (nếu triển khai container); xử lý sự cố, kiểm tra log và troubleshooting; cập nhật phiên bản và patch hệ thống.
>
> Tài liệu được bàn giao dưới dạng điện tử (PDF/Word) và đồng bộ với môi trường triển khai thực tế của SSI.

---
### 3.2.3 — Quản trị vận hành hệ thống (On-Premise)

**3.2.3.1.1 — Công cụ start/stop services, config tập trung**

**Đáp ứng VnResource:**
> Hệ thống đáp ứng hoàn toàn yêu cầu về việc cung cấp công cụ quản trị tập trung để Stop/Start/Restart services và thay đổi config/tham số hệ thống cho toàn bộ hệ thống hoặc theo từng cụm Server.
>
> **1. Công cụ quản trị tập trung dịch vụ (Centralized Service Control)**
>
> Hệ thống cung cấp giao diện/quy trình điều khiển tập trung với các khả năng:
> - Quản lý theo cụm (Cluster/Group-based Management): Cho phép định nghĩa và quản lý các nhóm server theo vai trò (APP-CLUSTER, API-CLUSTER, BATCH-CLUSTER, INTEGRATION-CLUSTER).
> - Thao tác đồng loạt hoặc theo chiến lược: Parallel Execution (song song); Rolling Restart/Start/Stop (cuốn chiếu).
> - Lệnh vận hành chuẩn hóa: Hỗ trợ Start, Stop, Restart, Reload, Health-check theo service hoặc theo nhóm service.
> - Hiển thị trạng thái tức thời: Dashboard cho biết service đang UP/DOWN/DEGRADED, số node bị ảnh hưởng, kết quả thực thi theo từng node.
>
> **2. Quản lý cấu hình/tham số tập trung (Centralized Configuration Management)**
>
> - Cấu hình theo mẫu (Template/Profile): Các tham số được quản trị theo template áp dụng cho các cụm server có cấu hình tương đồng.
> - Đẩy cấu hình hàng loạt (Bulk Configuration Push): Cập nhật tại điểm quản trị trung tâm, hệ thống tự động đồng bộ xuống toàn hệ thống, một cụm server cụ thể, hoặc một tập node được chọn.
> - Kiểm soát sai lệch cấu hình (Configuration Drift Detection): Tự động phát hiện node nào lệch cấu hình so với template chuẩn và cảnh báo.
> - Phiên bản hóa cấu hình (Config Versioning): Mỗi thay đổi được ghi nhận theo phiên bản để dễ truy vết và quay lui.
>
> **3. Đảm bảo khắc phục sự cố nhanh nhất (Rapid Incident Remediation)**
>
> - One-click Remediation: kịch bản xử lý nhanh như Restart Service Group, Reload Config, Clear Cache.
> - Rollback cấu hình nhanh: cho phép quay về phiên bản cấu hình ổn định gần nhất.
> - Tự động hóa khôi phục (Auto-healing): tích hợp giám sát để tự kích hoạt restart service khi phát hiện down.
> - Ghi log và bằng chứng vận hành: lưu lại ai thao tác, thời điểm, node nào, kết quả thành công/thất bại.

---

**3.2.3.1.2 — Tự động hóa vận hành (Batch Jobs, End Of Day)**

**Đáp ứng VnResource:**
> Đáp ứng. Hệ thống cho phép người dùng có thể thiết lập các tác vụ như xuất báo cáo, chạy tổng hợp công, tính lương...

**3.2.3.1.2 (duplicate) — Cảnh báo qua SMS/Email trong quá trình vận hành**

**Đáp ứng VnResource:**
> Đáp ứng. Hệ thống đáp ứng hoàn toàn yêu cầu về cơ chế thông báo và cảnh báo tự động. Hệ thống cung cấp một hệ thống quản lý cảnh báo đa kênh (Multi-channel Alerting System), cho phép theo dõi và thông báo theo thời gian thực về mọi diễn biến trong quá trình vận hành, từ các lỗi nghiêm trọng (Critical Errors) đến các trạng thái hoàn tất (Success/Completion) của từng tác vụ (Jobs), các bước thực hiện (Steps).
>
> Thông báo qua Email: Gửi báo cáo chi tiết về nội dung lỗi, log đính kèm, thời điểm xảy ra và đối tượng bị ảnh hưởng. Phù hợp cho các cảnh báo mức độ thấp, báo cáo định kỳ hoặc thông báo hoàn tất công việc (Job Completion) để lưu trữ và tra cứu.

---

**3.2.3.2.1 đến 3.2.3.2.9 — Giám sát và cảnh báo (On-Premise)**

**Đáp ứng VnResource:**
> VnResource HRM hỗ trợ hệ thống giám sát tập trung theo thời gian thực nhằm theo dõi tính sẵn sàng và trạng thái hoạt động của toàn bộ hạ tầng, ứng dụng và dịch vụ.
>
> Giải pháp đề xuất sử dụng: **Prometheus** (thu thập metrics hệ thống); **Grafana** (dashboard giám sát realtime tập trung); **ELK/Graylog** (tùy chọn: centralized logging và trace lỗi).
>
> Phạm vi giám sát: Application Server, Database Server, Load Balancer; HRM Web/API, Windows Service, Background Job; SQL Server, Redis Cache, File Storage; CPU, RAM, Disk, Network; Container/Kubernetes services; API nội bộ và kết nối external (LDAP/SSO, SMTP, ERP, ESB, CRM, eKYC); Backup job, replication, DR connectivity.
>
> Hệ thống hỗ trợ: Realtime monitoring; Health check tự động; Dashboard trực quan theo thời gian thực; Alert qua Email/Webhook; Theo dõi uptime, response time, error rate; TraceId/CorrelationId để truy vết lỗi xuyên suốt hệ thống.
>
> Giám sát hiệu năng thời gian thực bao gồm: Response time; Throughput; Error rate; Concurrent users; API latency; Database query performance; CPU/RAM/Disk/Network utilization.
>
> Hệ thống hỗ trợ theo dõi và phân tích: Capacity utilization; Tăng trưởng dữ liệu; Dung lượng lưu trữ; Mức sử dụng tài nguyên hệ thống; Xu hướng tải hệ thống (trend analysis).
>
> Tích hợp với các nền tảng monitoring/SIEM/APM tập trung qua: API; Syslog; SNMP; OpenTelemetry; Exporter/Agent tiêu chuẩn. Tương thích với Prometheus, Grafana, ELK Stack, Splunk, Zabbix, Dynatrace.
>
> Cảnh báo cho user/nhóm user vận hành (SMS/Email) đối với: Vượt ngưỡng hiệu năng; Tài nguyên hệ thống bất thường; Service unavailable; Vi phạm chính sách truy cập; Vi phạm phân quyền; Vi phạm quy tắc nghiệp vụ; Sự kiện bảo mật và truy cập bất thường. Hỗ trợ cấu hình threshold, escalation policy và phân nhóm cảnh báo.
>
> Báo cáo: Báo cáo sử dụng tài nguyên và hiệu năng hệ thống; Báo cáo utilization và capacity; Báo cáo sử dụng ứng dụng; Báo cáo response time của dịch vụ/API.
>
> Centralized logging: Ghi log request/response giữa các component nội bộ; Ghi log kết nối và tích hợp ra ngoài; Hỗ trợ Correlation ID/Trace ID để theo dõi end-to-end request flow. Thông tin log bao gồm: Chức năng thực hiện, Thời gian request/response, Duration xử lý, Request payload, Response payload, User thao tác, Trạng thái xử lý, Thông tin lỗi.
>
> Audit trail và lịch sử thay đổi đầy đủ cho: Cấu hình hệ thống; Tham số vận hành; Chính sách hệ thống; Quyền và nhóm quyền.
>
> **Cơ chế Maker-Checker**: Hệ thống hỗ trợ cơ chế Maker-Checker đối với thay đổi cấu hình, tham số hệ thống, phân quyền/nhóm quyền, chính sách truy cập, và các thao tác quản trị quan trọng. Các thay đổi chỉ có hiệu lực sau khi được user có thẩm quyền kiểm tra và phê duyệt, đảm bảo tuân thủ nguyên tắc kiểm soát nội bộ và Segregation of Duties (SoD).

---
### 3.2.4 — Quản trị vận hành hệ thống (On-Premise, tài liệu bàn giao)

**3.2.4.1:**
> Tài liệu bàn giao vận hành ban đầu phải đảm bảo có đầy đủ các nội dung như file đính kèm.

---
### 3.2.5 — Services/Incidents Request and SLA (On-Premise)

**3.2.5.1 — Công cụ theo dõi Request**

**Yêu cầu:**
> Cung cấp công cụ để có thể theo dõi được: Tất cả các requests (bao gồm: Services và Incidents) mà SSI đã gửi sang Nhà thầu. Đảm bảo SSI có thể theo dõi được các thông tin chi tiết của từng Requests như: Phân loại Request thuộc Service Requests / Incident Requests. Thời gian gửi. Thời gian tiếp nhận. Người gửi. Trạng thái xử lý. Thời gian quá hạn xử lý yêu cầu (theo SLA đã thống nhất). Người tiếp nhận xử lý. Ghi chú (nếu có). Nguyên nhân lỗi sau khi chẩn đoán và xử lý xong. Công cụ cho phép SSI có thể xuất Báo Cáo định kỳ tất cả hoặc chọn lọc về các Requests với các thông tin như trên.

*(Phần 4, 5, 6 về Hiệu năng hệ thống, UI/UX và API nằm trong cùng file 022 — tham khảo thêm nếu cần tổng hợp chi tiết)*

## Liên kết
- [[wiki/projects/SSI-Project]]
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]
