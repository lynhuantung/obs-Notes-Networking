---
type: source
code: t3u4v
description: "SSI Ch.10 hạ tầng detail: hardware specs 5 server, OS, network 1Gbps fiber, storage/backup, SQL Server HA/DR, client Windows 7+, third-party license"
tags:
  - ssi
  - ha-tang
  - infrastructure
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/sources/f8c4n-ssi-infrastructure-requirements]]"
---

# Source: SSI Ch.10 — Hạ tầng Phần cứng (Chi tiết đầy đủ)

## Tóm tắt

Chương 10 mô tả toàn bộ hạ tầng kỹ thuật mà VnResource HRM đề xuất để triển khai giải pháp cho SSI. Gồm 8 mục chính: tổng quan hạ tầng (5 server), cấu hình máy chủ theo từng môi trường, hệ điều hành, mạng (1Gbps + 10Gbps quang), lưu trữ & sao lưu, database HA/DR (SQL Server AlwaysOn), máy trạm client (Windows 7+), và phần mềm bên thứ 3.

---

## 10.1 — Tổng quan Hạ tầng

### 10.1.1 — Mô tả cơ sở hạ tầng

**Yêu cầu:**
> Nhà thầu đề xuất và mô tả về cơ sở hạ tầng phần cứng cần thiết để triển khai giải pháp đề xuất bao gồm hệ thống máy chủ, các thiết bị sao lưu & lưu trữ, thiết bị mạng, thiết bị cân bằng tải, thiết bị an ninh và thiết bị liên quan khác đáp ứng được yêu cầu về hiệu năng hệ thống.

**Đáp ứng — Bảng Server Topology:**

| # | Server | Description |
|---|--------|-------------|
| 1 | Server Proxy | Loadbalancer · Linux · Nginx · **Processor: 4 Cores · RAM: 8 GB or more · SDD: 50 GB** |
| 2 | Server Application 1 | Web application · Windows Server 2019 · Cài ứng dụng VnResource HRM · **Processor: 16 Cores · RAM: 64 GB or more · SDD: 240 GB** |
| 3 | Server Application 2 | Web application · Windows Server 2019 · Cài ứng dụng VnResource HRM · **Processor: 16 Cores · RAM: 64 GB or more · SDD: 240 GB** |
| 4 | Server Database 1 | SQL Server 2019 Standard or upwards · Windows Server 2019 · **Active** · **Processor: 16 Cores (at least) · RAM: 128 GB · SDD: 512 GB** |
| 5 | Server Database 2 | SQL Server 2019 Standard or upwards · Windows Server 2019 · **Passive** · **Processor: 16 Cores (at least) · RAM: 128 GB · SDD: 512 GB** |

**Mô tả kiến trúc:**

- **Client Layer:** Người dùng truy cập qua Internet (web/mobile), tất cả request đi qua HTTPS (TLS)
- **DMZ Zone:** WAF lọc OWASP (XSS, SQL Injection, CSRF...) + Reverse Proxy/Load Balancer (Nginx/HAProxy/Ocelot), SSL termination, health check
- **Application Layer:** 2 node App Server chạy song song (stateless), horizontal scaling, session lưu Redis/JWT, failover tự động
- **Data Layer:** SQL Server Active/Passive (AlwaysOn/Log Shipping), Redis Cache (session/config/lookup), File Server (NFS)
- **DR Site:** Backup full + log, replication (future), đáp ứng RPO/RTO

---

### 10.1.2 — Mô hình logic và vật lý

**Đáp ứng:**
> Giải pháp VnResource HRM được thiết kế theo kiến trúc multi-tier, hỗ trợ triển khai linh hoạt trên môi trường On-Premise, Private Cloud hoặc Hybrid Cloud.

**Mô hình logic (Logical Architecture):**
- Presentation Layer: Web Browser, Mobile App, API Client
- Application Layer: Web Application, REST API, Workflow Engine, Integration Service
- Integration Layer: ESB/API Gateway kết nối ERP, CRM, eKYC, Core System
- Data Layer: SQL Server, Redis Cache, File Storage/S3

**Mô hình vật lý (Physical Architecture):**
- Firewall/WAF và Reverse Proxy
- Load Balancer (Nginx/HAProxy/F5)
- Application Server Cluster (Active/Active)
- SQL Server Cluster (AlwaysOn Active/Passive)
- Redis Cache Cluster
- File Server hoặc S3 Object Storage
- DR Site

Toàn bộ hỗ trợ: HA, DR, Horizontal Scaling, Zero-downtime deployment, Kubernetes/Docker, Monitoring & Centralized Logging.

---

### 10.1.3 — Clustering & Load Balancing

**Đáp ứng:**

**1. Application Layer — Active/Active Clustering:**
- Nhiều App Server chạy song song, stateless
- Load Balancer (Nginx/HAProxy/Ocelot): Round Robin / Least Connection, health check, SSL termination, retry routing
- Session/token lưu Redis tập trung → không mất session khi failover
- Hỗ trợ: Horizontal scaling, Zero-downtime deployment, Rolling update

**2. Database Layer — Active/Passive Clustering:**
- SQL Server AlwaysOn Availability Group hoặc Log Shipping/Mirroring
- Primary xử lý read/write, Secondary đồng bộ liên tục
- Failover tự động/bán tự động khi Primary sự cố

**3. Redis Cache Cluster:**
- Redis Sentinel / Redis HA
- Session cache, token cache, distributed cache
- Đồng bộ session giữa các App Server

**4. File Storage Cluster:**
- NFS Shared Storage (On-Premise) hoặc AWS S3/Object Storage (Cloud)

**5. Mô hình triển khai tổng thể:**
WAF/Firewall → Load Balancer Cluster → App Server Cluster (Active/Active) → Redis Cluster → SQL Server Cluster (Active/Passive) → Shared Storage/S3 → DR Site

---

### 10.1.4 — Độ tin cậy & tính sẵn sàng cao

**Đáp ứng:**
> VnResource HRM cam kết hạ tầng có độ tin cậy, khả năng chịu lỗi và tính sẵn sàng cao thông qua kiến trúc dự phòng đa lớp (multi-layer High Availability Architecture).

- **High Availability:** 24/7/365, loại bỏ SPOF, Load Balancer health check liên tục
- **Fault Tolerance:** App Active/Active stateless, session/file trên Redis/NFS, SQL Server AlwaysOn với synchronous replication
- **Redundancy:** Mạng (Redundant NIC, VLAN), Máy chủ (Cluster + Auto Failover), Storage (SQL AlwaysOn, NFS/S3)
- Monitoring: Prometheus/Grafana, cảnh báo tự động
- Rolling update/live patching trên Kubernetes

---

### 10.1.5 — Tương thích nền tảng

**Đáp ứng:**
- OS & Runtime: Windows Server 2019/2022 + .NET Framework/.NET 7+, Load Balancer Linux/Nginx, client chỉ cần Chrome/Edge
- Database: SQL Server 2019 Standard+, AlwaysOn, connection pooling, backup/restore
- Ảo hóa & Cloud: VMware, Hyper-V, AWS, Azure, GCP, Docker/Kubernetes
- Mạng: DMZ/Public Zone, Application Zone, Database Zone; Firewall/WAF, VLAN, VPN/MPLS
- Giao tiếp: REST API, HTTPS/TLS 1.2+, OAuth2/OpenID Connect, JWT

---

### 10.1.6 — Tương thích phiên bản bên thứ 3

**Đáp ứng:**
- SQL Server: 2019 Standard trở lên (2019 or upwards)
- Windows Server: 2019 trở lên
- Android Mobile App: Android 8.0+
- iOS Mobile App: iOS 13+
- Web Browser: Chrome, Edge phiên bản mới nhất
- Middleware: Nginx, Redis, Docker, Kubernetes — nâng cấp version độc lập
- Security: TLS 1.2/1.3, OAuth2, OpenID Connect, SAML2, REST/OpenAPI

---

### 10.1.7 — SLA Cloud tham chiếu

**Đáp ứng:**

**Cam kết hiệu năng:**
- Tối thiểu 5.000 user đồng thời
- Mở rộng đến 10.000 user đồng thời
- Response time ≤ 3 giây với 99% thao tác nghiệp vụ thông thường
- Kiểm thử bằng JMeter

**Cam kết tính sẵn sàng:**
- Vận hành 24/7/365
- Application Cluster Active/Active
- SQL Server Active/Passive
- Auto Failover và Load Balancing đa lớp
- Redis HA/Sentinel và DR Site

---

## 10.2 — Cấu hình Máy chủ

### 10.2.1 — Cấu hình theo môi trường

**Đáp ứng — Đề xuất không cung cấp phần cứng, chỉ tư vấn:**

**1. Production Environment:**
- 01 Load Balancer (Nginx/HAProxy) + 02 App Server Active/Active + 01 DB Server Active
- App Server: **16 Cores, RAM 64 GB+, SSD 240 GB+**, Windows Server 2019/2022
- Database Server: **16 Cores+, RAM 128 GB, SSD 512 GB+**, SQL Server 2019 Standard+
- Đáp ứng 5.000–10.000 user đồng thời, response ≤ 3s

**2. High Availability (HA):**
- 02 App Server Active/Active + 01 DB Server Passive (AlwaysOn/Failover)
- App Server: 16 Cores, RAM 64 GB+ | DB Passive: 16 Cores+, RAM 128 GB
- Auto failover, load balancing, zero-downtime

**3. Disaster Recovery (DR):**
- 01 LB + 01 App Server + 01 DB Server Passive
- App Server: 16 Cores, RAM 64 GB+ | DB Server: 16 Cores, RAM 128 GB
- Backup + Log Shipping từ Production sang DR

**4. Development / UAT:**
- 01 App Server + 01 DB Server
- App Server: **8 Cores, RAM 32 GB** | DB Server: **8 Cores, RAM 64 GB**

---

### 10.2.2 — Tương thích phần cứng

**Application Layer:** Windows Server 2019/2022, .NET, IIS, Redis, JWT — CPU 16 Cores, RAM 64 GB+, SSD 240 GB+

**Database Layer:** Windows Server 2019, SQL Server 2019 Standard+, AlwaysOn — CPU 16 Cores+, RAM 128 GB, SSD 512 GB+

---

### 10.2.3 — Cơ sở tính toán sizing

**Tham số sizing chính:**
- 5.000 user đồng thời (baseline), mở rộng 10.000
- Response time ≤ 3s với 99% thao tác
- Kiểm thử JMeter theo kịch bản thực tế

**App Server (16 Cores / 64 GB / 240 GB SSD):**
- .NET stateless hỗ trợ scale-out
- Session/token lưu Redis tập trung
- Tối ưu concurrent session và thread pool processing
- 02 App Server Active/Active phía sau Load Balancer

**DB Server (16 Cores+ / 128 GB / 512 GB SSD):**
- SQL Server buffer pool cho OLTP lớn
- Cache hot data, giảm disk I/O
- Dự phòng cho replication, backup, transaction log
- AlwaysOn Active/Passive

---

### 10.2.4 — Khả năng nâng cấp & mở rộng

**Đáp ứng:**
- Scale-up và Scale-out đồng thời
- App Server: từ 16 Cores/64 GB → 32 Cores/128 GB
- DB Server: từ 16 Cores/128 GB → 32 Cores/256 GB
- Cloud: elastic storage (AWS EBS/Azure Disk) không ảnh hưởng vận hành
- App Layer stateless: bổ sung App Server bất kỳ lúc, Load Balancer tự cân bằng, không mất session
- Hỗ trợ Active/Active cluster, Kubernetes auto-scaling

---

## 10.3 — Hệ điều hành

### 10.3.1 — Đề xuất OS

**Đáp ứng:**

| Role | OS đề xuất |
|------|-----------|
| Proxy / Load Balancer | **Red Hat Enterprise Linux (RHEL) 9.x** trên x86-64, chạy Nginx/HAProxy/WAF |
| Application Server | **Windows Server 2022** Standard/Datacenter trên x86-64, chạy IIS, .NET Framework, .NET 7/.NET Core |
| Database Server | **Windows Server 2022** + SQL Server 2019 Standard+, AlwaysOn, HA Cluster |
| DR/UAT/DEV | Đồng nhất Windows Server 2022 + RHEL 9.x |

Phương án thay thế: Windows Server 2019.

---

### 10.3.2 — Tương thích OS

**Đáp ứng:**
- RHEL 9.x (x86-64): tương thích Nginx, WAF, Docker/Kubernetes, Grafana/Prometheus
- Windows Server 2022: tương thích .NET, IIS, Redis, JWT, HRM Application
- Windows Server 2022 + SQL Server 2019+: AlwaysOn, SSMS, backup/restore, HA
- Toàn bộ stack x86-64, hỗ trợ VMware, Hyper-V, AWS, Azure, Docker, Kubernetes

---

### 10.3.3 — Hỗ trợ cập nhật OS

**Đáp ứng:**
- Theo dõi định kỳ bản vá từ Microsoft và Red Hat
- Kiểm thử tương thích trên DEV/TEST trước khi triển khai
- Regression test: đăng nhập, API, workflow, báo cáo, tích hợp
- Cung cấp hướng dẫn triển khai, rollback, release note
- Nền tảng hỗ trợ: Windows Server 2022/2019, RHEL 9.x/8.x, SQL Server 2019+, Docker/Kubernetes
- Kiến trúc stateless + rolling update → cập nhật từng node không gây gián đoạn

---

## 10.4 — Mạng

### 10.4.1 — Mô hình mạng

**Đáp ứng — 3 vùng mạng:**

- **Public Zone:** WAF/Firewall + Reverse Proxy/Load Balancer (Nginx/HAProxy), tiếp nhận HTTPS từ Internet/nội bộ SSI
- **Application Zone:** HRM App Server Active/Active, API Services, Redis Cache — không expose Internet
- **Database Zone:** SQL Server Active/Passive, File Server/NFS — cô lập hoàn toàn khỏi Internet

Hỗ trợ: On-Premise tại DC SSI, Cloud/Hybrid Cloud, VPN/MPLS hội sở–chi nhánh, AD/LDAP/SSO, ESB/API Gateway/ERP.

Giao tiếp: HTTPS/TLS 1.2+, REST API, VPN nội bộ, Firewall và IP whitelist giữa các vùng.

---

### 10.4.2 — Tương thích hệ thống hiện tại SSI

**Đáp ứng:**
- Tương thích On-Premise, Cloud, Hybrid Cloud
- AD/LDAP/SSO, ESB/API Gateway/Data Platform/ERP
- Docker, Kubernetes, VMware, Hyper-V
- Windows Server 2022, RHEL 9.x, SQL Server 2019+
- REST API/HTTPS/JSON, OAuth2, OpenID Connect, mTLS, JWT
- Web-based, không cài client, hỗ trợ LAN/WAN/VPN
- Hỗ trợ internal-only (không Internet-facing nếu SSI yêu cầu)
- VnResource phối hợp rà soát topology, firewall policy, IAM/SSO trong giai đoạn triển khai

---

### 10.4.3 — Băng thông và giao diện mạng

**Đáp ứng:**

**Cấu hình giao diện mạng đề xuất:**
- 01 cổng quản trị (Management Interface): **tối thiểu 1 Gbps RJ45**
- 02 cổng dữ liệu (Data Interface): **tối thiểu 10 Gbps giao diện quang SFP+**

Áp dụng cho: Load Balancer, Application Server, Database Server, DR Server.

**Cấu hình 10 Gbps:**
- Bonding/LACP, Active/Passive hoặc Active/Active
- Chuẩn kết nối: **10GBASE-SR (SFP+)**, cáp quang OM3/OM4 Multimode Fiber
- Switch hỗ trợ 10GbE SFP+

Đáp ứng: 10.000 user đồng thời, database replication, backup/restore tốc độ cao, scale-out App Server, kết nối DR Site.

---

## 10.5 — Storage & Backup

### 10.5.1 — Hệ thống lưu trữ & sao lưu

**Đáp ứng — Tiered Storage Architecture:**

- **Primary Storage (Hot Data):** SSD/NVMe tốc độ cao cho SQL Server, transaction log và app — DB: tối thiểu **512 GB SSD**, App: tối thiểu **240 GB SSD** — SQL Server AlwaysOn/Log Shipping
- **Shared File Storage:** NFS/SAN/NAS dùng chung cho file hồ sơ, hợp đồng — scale-out nhiều App Server, tích hợp SAN/NAS hiện có SSI
- **Backup Storage:** Backup Full + Transaction Log định kỳ, lưu tại DR Site/Backup Server riêng, khuyến nghị dung lượng **≥ 3 lần dung lượng DB production**
- **Archive Storage:** Object Storage/S3/Tape cho lưu trữ dài hạn, backup archive 1–5 năm

Tích hợp với: Veeam, Commvault, Veritas, SAN/NAS enterprise.

---

### 10.5.2 — Backup khối lượng lớn không ảnh hưởng hiệu năng

**Đáp ứng:**
- Backup từ Database **Passive/Replica** thay vì Active
- Backup ngoài giờ cao điểm (backup window)
- Transaction Log Backup định kỳ **15–30 phút**
- Differential/Incremental Backup thay Full Backup hàng ngày
- Backup Compression — giảm I/O và dung lượng

Hỗ trợ: Full, Differential, Incremental, Point-in-time Recovery, DR Replication, Cloud Backup (S3).

Trong quá trình backup: response time vẫn theo NFR, không ảnh hưởng App Server, không lock DB Active, hỗ trợ 10.000 user đồng thời.

---

### 10.5.3 — Nâng cấp & mở rộng lưu trữ

**Đáp ứng:**
- Mở rộng DB: thêm SSD/NVMe, extend LUN, bổ sung SQL Data File, chuyển sang SAN/NAS
- Mở rộng backup: thêm NAS/Backup Storage node, Object Storage/S3 (gần không giới hạn), thêm DR/Archive Site
- Nâng hiệu năng backup: tăng CPU/RAM Backup Server, parallel backup streams, băng thông 10GbE → 25/40/100GbE, NIC Bonding/LACP
- Kiến trúc: Hot/Warm/Archive tiered, S3 elastic scaling, DR replication multi-site
- Không cần thay đổi kiến trúc ứng dụng

---

### 10.5.4 — Tích hợp với hệ thống backup của SSI

**Đáp ứng:**
- SQL Server Agent Backup từ Passive/Replica với SQL Plugin/Agent của SSI
- Native SQL Backup: backup ra file → đồng bộ vào NAS/SAN/Backup Repository SSI
- File Server Backup: SMB/NFS mount, backup agent
- Cloud/Object Storage: đồng bộ sang S3, long-term archive

Đảm bảo: không backup trùng lặp, không ảnh hưởng production, compression/deduplication, tích hợp retention policy SSI, đồng bộ backup schedule.

---

### 10.5.5 — Kết nối storage bằng cáp quang

**Yêu cầu:**
> Kết nối các máy chủ, các thiết bị lưu trữ và sao lưu dữ liệu phải là cáp quang và tốc độ tối thiểu là **16 Gbps**.

---

### 10.5.6 — Tương thích thiết bị lưu trữ

**Yêu cầu:**
> Các thiết bị lưu trữ và sao lưu dữ liệu đề xuất phải hoàn toàn tương thích với phần cứng máy chủ đề xuất.

---

## 10.6 — Database

### 10.6.1 — Loại CSDL đề xuất

**Đáp ứng:**
> Hệ thống phần mềm hỗ trợ chạy với **Oracle hoặc SQL Server**. Thông thường khách hàng chọn SQL Server. Đối với các mô hình lớn > 10.000 nhân viên thì có thể dùng Oracle (như khách hàng Honda của VnResource...).

Database vận hành trên Linux và Windows Server:
- SQL Server cài trên Windows Server 2012+
- SQL Server cài trên Linux (được hỗ trợ)
- Oracle trên Linux (thông dụng)

---

### 10.6.2 — Tài liệu hướng dẫn vận hành DB

**Đáp ứng — Bộ tài liệu cung cấp:**

**A. Installation Guide:** Prerequisites, quy trình cài đặt HA Cluster (Oracle/SQL Server/PostgreSQL), cấu hình kết nối App–DB.

**B. Operations & Administration Guide:** Quản trị user/phân quyền, quản lý Tablespace/Filegroup, Maintenance Scheduling (Rebuild Index, Update Statistics, Integrity Check), Backup Management (Full/Incremental/Log).

**C. Disaster Recovery & Troubleshooting Guide:** Recovery Procedures (Point-in-Time Recovery), Failover procedures, DR Plan.

**Troubleshooting Matrix:**

| Nhóm lỗi | Triệu chứng | Nguyên nhân | Giải pháp |
|----------|-------------|-------------|-----------|
| Hiệu năng | Query chậm, treo ứng dụng | Thiếu Index, Locking/Blocking, CPU/RAM quá tải | Tối ưu query, tạo Index, Slow Query analysis, mở rộng tài nguyên |
| Kết nối | Connection Timeout, không truy cập được DB | Firewall, Max Connections, DB đang failover | Kiểm tra mạng, tăng connection pool, kiểm tra trạng thái Cluster |
| Lưu trữ | Disk Full, không ghi được | Dữ liệu tăng vượt kế hoạch, Log file lớn, thiếu cleanup | Mở rộng disk, Shrink/Truncate log, tối ưu storage policy |
| Data Integrity | Dữ liệu không nhất quán, corrupt | Sự cố HW, mất điện, lỗi ghi/đồng bộ HA | DBCC check, khôi phục từ backup, kiểm tra error log |

---

### 10.6.3 — Mô hình HA cho Database

**Đáp ứng:**
> Nhà thầu đáp ứng hoàn toàn. Hệ thống triển khai trên nền tảng HA tiêu chuẩn công nghiệp, No SPOF, Automatic Failover, 24/7.

**Database Zone:**
- **Database Server 1 (Active):** Máy chủ chính, lưu toàn bộ dữ liệu HRM, kết nối trực tiếp App Servers
- **Database Server 2 (Passive):** Nhận đồng bộ từ Server 1, tự động Failover khi Active sự cố
- **Backup Server:** Backup định kỳ, lưu bản sao an toàn để khôi phục

---

### 10.6.4 — Disaster Recovery cho Database

**Đáp ứng:**
Công nghệ áp dụng:
- **SQL Server Failover Cluster Instance (FCI)** cho High Availability
- **SQL Server Always On Availability Groups** cho DR và replication Primary Site → DR Site

Hỗ trợ:
- Automatic Failover / Manual Failover
- Đồng bộ dữ liệu realtime hoặc near-realtime
- Readable Secondary Replica
- Backup và restore định kỳ
- Đáp ứng RTO/RPO theo chính sách vận hành
- Hoạt động ổn định khi lỗi phần cứng, lỗi máy chủ, sự cố tại DC chính

---

## 10.7 — Máy trạm Client

### 10.7.1 — Yêu cầu hiệu năng máy trạm

**Đáp ứng:**

**Yêu cầu phần cứng máy trạm:**
- CPU: Core 4 Duo hoặc cao hơn
- RAM: 8 GB hoặc cao hơn

**Yêu cầu phần mềm:**
- Browser: Chrome 60+ hoặc Firefox 55+
- Mobile: iOS 11+ hoặc Android 6+

---

### 10.7.2 — Hỗ trợ Windows 7+ và 64-bit

**Đáp ứng:**
- Hỗ trợ: Windows 7, Windows 8/8.1, Windows 10, Windows 11
- Hỗ trợ đầy đủ kiến trúc 64-bit
- Tối ưu hóa cho 64-bit: tận dụng RAM, xử lý báo cáo/file lớn
- Compatibility testing trên nhiều phiên bản Windows và cấu hình HW
- Backward compatibility cho Windows 7/8 (dùng chuẩn web hiện đại)

---

### 10.7.3 — Đa trình duyệt

**Đáp ứng:**

| Trình duyệt | Phiên bản tối thiểu | Trạng thái |
|-------------|---------------------|------------|
| Microsoft Edge | Phiên bản mới nhất (Chromium-based) | Đáp ứng |
| Google Chrome | 45.0 hoặc cao hơn | Đáp ứng |
| Mozilla Firefox | 40.0 hoặc cao hơn | Đáp ứng |
| Internet Explorer | 10 hoặc cao hơn | Đáp ứng |

---

### 10.7.4 — Phần mềm cần cài đặt trên máy trạm

**Đáp ứng:**

| Nhóm | Phần mềm | Mục đích |
|------|----------|----------|
| Truy cập hệ thống | Google Chrome, Microsoft Edge | Truy cập Web/App Portal, HTTPS/TLS |
| Kết nối bảo mật | VPN Client (nếu áp dụng) | Secure remote access, tuân thủ policy SSI |
| Xử lý tài liệu | Microsoft Office, PDF Reader | Xem tài liệu, xuất báo cáo, import/export |
| Bảo mật máy trạm | Endpoint Security / Antivirus | Chống malware/ransomware, endpoint control |
| Hỗ trợ vận hành | Monitoring/Support Access Tools | Troubleshooting, remote support kênh SSI phê duyệt |

Yêu cầu chung: Windows 10/11, kết nối Internet ổn định, phần mềm có bản quyền hợp lệ, tuân thủ security policy SSI.

---

## 10.8 — Phần mềm Third-party

### 10.8.1 — Danh sách phần mềm bên thứ 3

**Đáp ứng:**
- Truy cập hệ thống: **Google Chrome**, **Microsoft Edge**
- Kết nối bảo mật: **VPN Client** (nếu áp dụng)
- Bảo mật máy trạm: **Endpoint Security / Antivirus**
- Hỗ trợ tài liệu: **Microsoft Office**, **PDF Reader**
- Kết nối máy chủ: **Remote Desktop** (đi kèm Windows OS)

---

### 10.8.2 — Tương thích phần mềm third-party

**Đáp ứng:**
> Các phần mềm và công cụ bên thứ 3 phải đảm bảo hoàn toàn tương thích với máy trạm người dùng cuối nhằm phục vụ truy cập và sử dụng hệ thống triển khai trên Cloud.

---

### 10.8.3 — Bản quyền phần mềm

**Đáp ứng:**
> Tất cả phần mềm và công cụ hỗ trợ của bên thứ 3 được cài đặt trên máy trạm phải có **bản quyền đầy đủ, hợp lệ** theo quy định của nhà cung cấp và yêu cầu từ SSI.

---

### 10.8.4 — Tài liệu hướng dẫn vận hành third-party

**Đáp ứng — Bộ tài liệu bàn giao (PDF/Word):**
- Hướng dẫn cài đặt và cấu hình hệ thống
- Hướng dẫn vận hành Application Server, Database, Redis, Nginx
- Hướng dẫn monitoring với Prometheus/Grafana
- Hướng dẫn backup/restore và DR
- Hướng dẫn quản trị tài khoản, phân quyền và bảo mật
- Hướng dẫn Docker/Kubernetes (nếu triển khai container)
- Hướng dẫn xử lý sự cố, kiểm tra log và troubleshooting
- Hướng dẫn cập nhật phiên bản và patch hệ thống

---

### 10.8.5 — Java Runtime

**Đáp ứng:**
> Giải pháp VnResource HRM **không sử dụng nền tảng Java** cho ứng dụng chính. Hệ thống phát triển trên **.NET/C#**, web-based, chỉ cần Chrome/Edge — không cần Java Runtime trên máy trạm.

Trường hợp công cụ kỹ thuật hỗ trợ sử dụng Java (ví dụ Apache JMeter): sử dụng phiên bản Java phù hợp với tiêu chuẩn CNTT của SSI.

---

### 10.8.6 — Tuân thủ chính sách bảo mật SSI

**Đáp ứng:**

Giải pháp tuân thủ:
- Phân quyền RBAC
- HTTPS/TLS 1.2+
- Audit Log và giám sát truy cập
- Cập nhật bản vá bảo mật định kỳ
- Kiểm soát truy cập qua VPN/IP whitelist/MFA

VnResource cam kết:
- **Không sử dụng TeamViewer, UltraViewer** hoặc các công cụ remote desktop công cộng
- Hỗ trợ trực tiếp hoặc qua kênh được SSI phê duyệt
- Mọi hoạt động hỗ trợ kỹ thuật được kiểm soát, ghi nhận và tuân thủ quy trình bảo mật SSI

---

## Liên kết

- [[wiki/projects/SSI-Project]]
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]
- [[wiki/sources/f8c4n-ssi-infrastructure-requirements]]
