---
type: source
code: j7k8l
description: "SSI Ch.7 DevOps detail: containerization, CI/CD pipeline, backup/DR RTO/RPO, SLO, incident response, monitoring P95/P99, centralized logging, distributed tracing"
tags:
  - ssi
  - devops
  - cicd
  - monitoring
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/sources/v7m2p-ssi-devops-requirements]]"
---

# Source: SSI Ch.7 — DevOps & Vận hành (Chi tiết đầy đủ)

## Tóm tắt

Chương 7 mô tả toàn bộ yêu cầu DevOps & vận hành cho hệ thống HRM SSI, bao gồm 5 nhóm chính:
- **7.1** — Deployment Infrastructure (containerization, IaC, logical/physical architecture, sizing, request flow)
- **7.2** — CI/CD Pipeline (sơ đồ pipeline, các stage, môi trường, approval gate, chiến lược triển khai, zero-downtime, rollback)
- **7.3** — Backup & DR (RTO/RPO, full/incremental backup, mã hóa, DR drill)
- **7.4** — Reliability & Incident Response (RTO/RPO, backup, mã hóa, DR drill, SLO/error budget, incident response, postmortem/RCA)
- **7.5** — Monitoring & Observability (metrics P95/P99, công cụ Prometheus/Grafana, centralized logging, log retention, log explorer, distributed tracing)

---

## 7.1 — Deployment Infrastructure

### 7.1.1 — Containerization Docker/Kubernetes

**Yêu cầu:**
> Hệ thống phải hỗ trợ containerization (Docker/Kubernetes hoặc tương đương)

**Đáp ứng:**

Giải pháp hỗ trợ triển khai theo mô hình containerization nhằm tăng khả năng mở rộng, tự động hóa và tối ưu vận hành hệ thống.

Hệ thống hỗ trợ:
- Docker
- Kubernetes
- Container orchestration platform tương đương
- Container-based deployment
- Container image management

Giải thích: Containerization cho phép đóng gói application cùng toàn bộ dependency thành một môi trường chạy độc lập và nhất quán. Kubernetes hỗ trợ quản lý, scaling và tự động phục hồi container trong môi trường production.

Khả năng hỗ trợ: Auto-scaling, Self-healing, Rolling deployment, Resource isolation, Multi-environment deployment

Lợi ích: Tăng khả năng mở rộng hệ thống; Giảm phụ thuộc môi trường triển khai; Tăng tính ổn định và khả năng tự động hóa vận hành; Hỗ trợ triển khai nhanh và nhất quán giữa DEV/UAT/PROD

---

### 7.1.2 — Nếu không dùng container, việc triển khai phải được tự động

**Yêu cầu:**
> Nếu không dùng container, việc triển khai phải được tự động

**Đáp ứng:**

Trong trường hợp hệ thống không triển khai theo mô hình container, giải pháp hỗ trợ tự động hóa deployment và cấu hình hệ thống thông qua công cụ Infrastructure Automation.

Hệ thống hỗ trợ: Ansible, PowerShell automation, CI/CD deployment automation, Configuration management, Server provisioning automation

Giải thích: Các công cụ automation giúp giảm thao tác thủ công trong quá trình triển khai và cấu hình hệ thống. Hỗ trợ triển khai đồng nhất trên nhiều môi trường và giảm rủi ro do lỗi vận hành thủ công.

Khả năng hỗ trợ: Automated deployment, Configuration consistency, Version-controlled deployment scripts, Multi-server deployment, Rollback support

Lợi ích: Giảm thời gian triển khai hệ thống; Tăng tính nhất quán giữa các môi trường; Giảm lỗi cấu hình và thao tác thủ công; Tăng khả năng kiểm soát thay đổi hệ thống

---

### 7.1.3 — Nếu triển khai trên cloud, cấp phát hạ tầng phải bằng Terraform/IaC

**Yêu cầu:**
> Nếu triển khai trên cloud, việc cấp phát hạ tầng phải được thực hiện bằng Terraform hoặc công cụ IaC tương đương

**Đáp ứng:**

Giải pháp hỗ trợ Infrastructure as Code (IaC) nhằm tự động hóa việc cấp phát và quản lý hạ tầng cloud.

Hệ thống hỗ trợ: Terraform, CloudFormation, Bicep hoặc công cụ IaC tương đương, Automated infrastructure provisioning, Infrastructure version control

Giải thích: Infrastructure as Code (IaC) cho phép quản lý hạ tầng bằng code thay vì thao tác thủ công. Hạ tầng có thể được triển khai, cập nhật hoặc tái tạo tự động và nhất quán giữa các môi trường.

Khả năng hỗ trợ: Automated provisioning, Repeatable infrastructure deployment, Infrastructure change tracking, Multi-environment infrastructure management, Disaster recovery infrastructure provisioning

Lợi ích: Giảm lỗi cấu hình hạ tầng; Tăng tốc độ triển khai môi trường; Tăng khả năng kiểm soát thay đổi hạ tầng; Hỗ trợ mở rộng và phục hồi hệ thống nhanh hơn

---

### 7.1.4 — Cung cấp sơ đồ Logical Architecture cho Production và HA/DR

**Yêu cầu:**
> Cung cấp sơ đồ Logical Architecture cho Production và HA/DR

**Đáp ứng:**

Giải pháp cung cấp mô hình Logical Architecture nhằm mô tả cấu trúc tổng thể của hệ thống và mối quan hệ giữa các thành phần chính trong môi trường Production và HA/DR.

Architecture bao gồm: Load Balancer, WAF, Application/API Layer, Database Layer, Monitoring & Logging, Backup & DR Components, External/Internal Integration Components

Giải thích: Logical Architecture tập trung mô tả vai trò và luồng hoạt động của các thành phần hệ thống thay vì chi tiết hạ tầng vật lý. Hỗ trợ khách hàng hiểu được cách hệ thống được tổ chức và cách các thành phần tương tác với nhau.

Lợi ích: Tăng khả năng đánh giá kiến trúc hệ thống; Hỗ trợ review security và HA/DR design; Hỗ trợ planning cho scaling và vận hành

---

### 7.1.5 — Cung cấp sơ đồ Physical Deployment cho Production và HA/DR

**Yêu cầu:**
> Cung cấp sơ đồ Physical Deployment cho Production và HA/DR

**Đáp ứng:**

Giải pháp cung cấp mô hình Physical Deployment nhằm mô tả cách triển khai thực tế của hệ thống trên hạ tầng Production và DR environment.

Deployment Architecture bao gồm: Server/VM layout, Kubernetes cluster hoặc application nodes, Database servers, Load Balancer/WAF placement, Network segmentation, Monitoring & logging servers, DR site topology

Giải thích: Physical Deployment thể hiện cách các thành phần hệ thống được triển khai trên hạ tầng thực tế. Bao gồm thông tin về node, cluster, network zone và kết nối giữa các thành phần.

Lợi ích: Hỗ trợ capacity planning; Hỗ trợ vận hành và troubleshooting; Tăng khả năng đánh giá HA/DR readiness; Hỗ trợ security review và network review

---

### 7.1.6 — Định nghĩa giả định về sizing tài nguyên hệ thống

**Yêu cầu:**
> Định nghĩa giả định về sizing tài nguyên hệ thống (số lượng user dự kiến, TPS, dung lượng dữ liệu)

**Đáp ứng:**

Giải pháp hỗ trợ xác định sizing giả định nhằm phục vụ việc thiết kế hạ tầng và đảm bảo hệ thống đáp ứng nhu cầu vận hành dự kiến.

Sizing assumptions bao gồm: Số lượng concurrent users, Tổng số user dự kiến, TPS (Transactions Per Second), Dung lượng dữ liệu dự kiến, Data growth rate, Peak usage estimation, Network bandwidth estimation

Giải thích: Sizing là quá trình ước lượng tài nguyên cần thiết cho hệ thống, bao gồm CPU, RAM, Storage, Network và khả năng xử lý transaction.

Mục tiêu: Đảm bảo hệ thống đáp ứng tải vận hành thực tế; Hỗ trợ planning cho HA/DR và scaling; Tối ưu chi phí hạ tầng

Lợi ích: Giảm nguy cơ thiếu tài nguyên khi vận hành; Tăng khả năng mở rộng hệ thống; Hỗ trợ capacity planning dài hạn

---

### 7.1.7 — Architecture phải bao gồm LB, WAF, App/API, DB, Monitoring, Logging

**Yêu cầu:**
> Architecture phải bao gồm LB, WAF, App/API, DB, Monitoring, Logging

**Đáp ứng:**

Giải pháp kiến trúc được thiết kế theo mô hình nhiều lớp nhằm đảm bảo tính bảo mật, khả năng mở rộng và khả năng vận hành của hệ thống.

Architecture Components:
- Load Balancer (LB)
- Web Application Firewall (WAF)
- Application/API Services
- Database Services
- Monitoring Platform
- Centralized Logging Platform

Giải thích:
- LB (Load Balancer): phân phối traffic nhằm tăng khả năng chịu tải và HA.
- WAF (Web Application Firewall): bảo vệ hệ thống trước các tấn công web phổ biến.
- App/API Layer: xử lý logic nghiệp vụ và API services.
- Database Layer: lưu trữ và quản lý dữ liệu hệ thống.
- Monitoring & Logging: phục vụ giám sát và troubleshooting hệ thống.

Lợi ích: Tăng tính bảo mật và khả năng mở rộng; Giảm single point of failure; Tăng khả năng giám sát và vận hành Production

---

### 7.1.8 — Cung cấp luồng request end-to-end (User → LB → App → DB → Observability)

**Yêu cầu:**
> Cung cấp luồng request end-to-end (User → LB → App → DB → Observability)

**Đáp ứng:**

Giải pháp hỗ trợ mô tả luồng xử lý request xuyên suốt từ người dùng tới các thành phần backend và hệ thống observability.

Luồng xử lý bao gồm: User Request → Load Balancer → WAF/Security Layer → Application/API Services → Database Services → Monitoring/Logging/Tracing Platform

Giải thích: Luồng request end-to-end giúp mô tả cách request của người dùng được xử lý trong hệ thống. Hỗ trợ đánh giá Security flow, Application flow, Data processing flow, Monitoring & observability flow.

Khả năng hỗ trợ: Request tracing, Correlation ID tracking, Monitoring integration, Distributed tracing, End-to-end observability

Lợi ích: Tăng khả năng troubleshooting; Hỗ trợ phân tích hiệu năng hệ thống; Tăng khả năng kiểm soát vận hành và security review

---

## 7.2 — CI/CD Pipeline

### 7.2.1 — Cung cấp sơ đồ CI/CD pipeline

**Yêu cầu:**
> Cung cấp sơ đồ CI/CD pipeline

**Đáp ứng:**

Giải pháp hỗ trợ quy trình CI/CD nhằm tự động hóa việc build, kiểm thử, kiểm soát chất lượng và triển khai hệ thống, giúp tăng tốc độ phát hành phần mềm và giảm thiểu rủi ro vận hành.

CI/CD pipeline được thiết kế hỗ trợ đầy đủ cho cả môi trường Cloud và On-Premise, áp dụng cho nền tảng Docker/Kubernetes và Windows Server.

---

### 7.2.2 — Pipeline phải bao gồm Build, Security Scan (SAST/Dependency), Test, Deploy

**Yêu cầu:**
> Pipeline phải bao gồm Build, Security Scan (SAST/Dependency), Test, Deploy

**Đáp ứng:**

Pipeline triển khai với đầy đủ các bước kiểm tra kỹ thuật và kiểm soát bảo mật trước khi phát hành hệ thống.

Pipeline hỗ trợ các giai đoạn:
- Source Code Management
- Automated Build
- Security Scan
- Dependency Vulnerability Scan
- Automated Testing
- Artifact Management
- Deployment Automation
- Post-deployment Validation

Security & Quality Controls:
- SAST (Static Application Security Testing) nhằm phát hiện lỗ hổng bảo mật trong source code
- Dependency vulnerability scanning nhằm kiểm tra các thư viện hoặc package có nguy cơ bảo mật
- Automated testing nhằm kiểm tra tính ổn định của ứng dụng trước khi triển khai
- Build verification và release validation trước khi đưa lên Production

Lợi ích: Giảm lỗi phát sinh trong quá trình triển khai; Tăng tính ổn định và bảo mật của hệ thống; Tự động hóa quy trình release nhằm giảm phụ thuộc thao tác thủ công; Hỗ trợ kiểm soát chất lượng phần mềm theo quy trình DevSecOps

---

### 7.2.3 — Pipeline phải hỗ trợ các môi trường DEV, UAT, PROD

**Yêu cầu:**
> Pipeline phải hỗ trợ các môi trường DEV, UAT, PROD

**Đáp ứng:**

Giải pháp hỗ trợ quản lý và triển khai riêng biệt cho từng môi trường nhằm đảm bảo quy trình kiểm thử và phát hành được kiểm soát chặt chẽ trước khi đưa vào vận hành chính thức.

Các môi trường hỗ trợ: DEV Environment, UAT Environment, PROD Environment

Hệ thống hỗ trợ:
- Environment isolation giữa các môi trường
- Configuration management riêng cho từng môi trường
- Secret management và credential protection
- Deployment validation theo từng môi trường
- Controlled promotion workflow từ DEV → UAT → PROD

Lợi ích: Hạn chế ảnh hưởng giữa các môi trường vận hành; Giảm rủi ro khi triển khai Production; Tăng khả năng kiểm thử và xác nhận nghiệp vụ trước khi phát hành chính thức; Hỗ trợ quản lý release theo quy trình chuẩn enterprise

---

### 7.2.4 — Yêu cầu approval gate trước khi triển khai lên Production

**Yêu cầu:**
> Yêu cầu approval gate trước khi triển khai lên Production

**Đáp ứng:**

Giải pháp hỗ trợ approval gate trước khi triển khai Production nhằm kiểm soát thay đổi và đảm bảo việc phát hành hệ thống được thực hiện theo đúng quy trình vận hành.

Hệ thống hỗ trợ:
- Manual approval trước Production deployment
- Role-based approval workflow
- Release validation trước khi phát hành
- Change management process
- Audit log cho approval activities

Mục tiêu: Đảm bảo chỉ các phiên bản đã được kiểm thử và phê duyệt mới được triển khai Production; Giảm thiểu rủi ro phát sinh do release lỗi hoặc chưa được xác nhận đầy đủ; Hỗ trợ tuân thủ quy trình quản trị thay đổi và kiểm soát vận hành CNTT

Lợi ích: Tăng khả năng kiểm soát release process; Đảm bảo tính minh bạch và khả năng audit; Giảm nguy cơ gián đoạn dịch vụ do lỗi triển khai

---

### 7.2.5 — Cung cấp chiến lược triển khai (Rolling / Blue-Green / Canary)

**Yêu cầu:**
> Cung cấp chiến lược triển khai (Rolling / Blue-Green / Canary)

**Đáp ứng:**

Chiến lược triển khai ứng dụng nhằm đáp ứng yêu cầu về tính sẵn sàng của hệ thống, giảm thiểu downtime và kiểm soát rủi ro khi phát hành phiên bản mới. Tùy theo đặc thù nghiệp vụ, quy mô hệ thống và yêu cầu vận hành, các mô hình triển khai phù hợp có thể được áp dụng.

#### 7.2.5.1) Rolling Deployment

Triển khai nâng cấp theo từng phần hoặc từng cụm dịch vụ thay vì dừng toàn bộ hệ thống cùng lúc.

Đặc điểm: Hệ thống vẫn duy trì hoạt động trong quá trình triển khai; Giảm downtime khi cập nhật phiên bản mới; Phù hợp với hệ thống có nhiều instance hoặc container

Lợi ích: Giảm ảnh hưởng tới người dùng cuối; Hỗ trợ nâng cấp hệ thống liên tục; Tối ưu tài nguyên hạ tầng

#### 7.2.5.2) Blue-Green Deployment

Duy trì song song hai môi trường độc lập gồm phiên bản hiện tại và phiên bản mới.

Đặc điểm: Cho phép chuyển đổi nhanh giữa hai môi trường; Hỗ trợ rollback gần như tức thời khi phát sinh sự cố; Hạn chế ảnh hưởng tới hệ thống Production đang hoạt động

Lợi ích: Giảm rủi ro release failure; Tăng tính ổn định cho hệ thống nghiệp vụ quan trọng; Giảm downtime khi phát hành phiên bản mới

#### 7.2.5.3) Canary Deployment

Triển khai phiên bản mới cho một nhóm người dùng hoặc một phần hệ thống trước khi triển khai toàn bộ.

Đặc điểm: Theo dõi và đánh giá tính ổn định của phiên bản mới trước khi mở rộng rollout; Kiểm soát rủi ro theo từng giai đoạn; Hỗ trợ monitoring và rollback nhanh khi phát hiện lỗi

Lợi ích: Giảm thiểu tác động diện rộng khi xảy ra lỗi; Tăng khả năng kiểm soát chất lượng release; Phù hợp với hệ thống có yêu cầu uptime cao

---

### 7.2.6 — Hỗ trợ triển khai zero-downtime

**Yêu cầu:**
> Hỗ trợ triển khai zero-downtime

**Đáp ứng:**

Giải pháp hỗ trợ cơ chế triển khai zero-downtime nhằm đảm bảo dịch vụ vẫn hoạt động liên tục trong quá trình nâng cấp hoặc triển khai phiên bản mới.

Hệ thống hỗ trợ: Rolling update, Multi-instance deployment, Load balancer traffic switching, Health check validation, Failover handling

Lợi ích: Hạn chế gián đoạn dịch vụ; Đảm bảo tính sẵn sàng của hệ thống; Giảm ảnh hưởng tới người dùng cuối trong quá trình deployment

---

### 7.2.7 — Định nghĩa điều kiện và quy trình rollback

**Yêu cầu:**
> Định nghĩa điều kiện và quy trình rollback

**Đáp ứng:**

Giải pháp hỗ trợ quy trình rollback nhằm phục hồi nhanh hệ thống về trạng thái ổn định khi phát hiện lỗi sau triển khai.

Điều kiện rollback:
- Deployment validation failed
- Health check failed
- Service instability detected
- Critical functional issue detected
- Performance degradation vượt ngưỡng cho phép

Quy trình rollback:
- Dừng rollout phiên bản mới
- Chuyển traffic về phiên bản ổn định trước đó
- Restore deployment configuration
- Restore application package/container image trước đó
- Xác nhận trạng thái hệ thống sau rollback

Hệ thống hỗ trợ: Automated rollback, Manual rollback execution, Rollback validation, Rollback audit logging

---

### 7.2.8 — Hỗ trợ rollback cho cả application và database schema

**Yêu cầu:**
> Hỗ trợ rollback cho cả application và database schema

**Đáp ứng:**

Giải pháp hỗ trợ rollback cho cả application layer và database schema nhằm đảm bảo tính nhất quán của hệ thống khi xảy ra sự cố deployment.

Application Rollback:
- Restore previous application version
- Restore deployment package/container image trước đó
- Rollback configuration changes
- Service validation sau rollback

Database Rollback:
- Schema version rollback
- Database migration rollback
- Backup restore trước deployment
- Point-in-time recovery cho database systems

Mục tiêu: Đảm bảo tính toàn vẹn dữ liệu; Giảm downtime khi xử lý deployment failure; Tăng khả năng phục hồi hệ thống sau release issue

---

## 7.3 — Backup & Recovery

### 7.3.1 — Định nghĩa RTO/RPO cho Application, Database, và File storage

**Yêu cầu:**
> Định nghĩa RTO/RPO cho Application, Database, và File storage

**Đáp ứng:**

Hệ thống được thiết kế với cơ chế backup và disaster recovery nhằm đảm bảo khả năng phục hồi dịch vụ và dữ liệu khi xảy ra sự cố hạ tầng, lỗi hệ thống hoặc mất dữ liệu ngoài ý muốn.

| Thành phần | RTO | RPO |
|---|---|---|
| Application Servers | Tối đa 2 giờ | Tối đa 30 phút dữ liệu |
| Database Servers | Tối đa 1 giờ | Tối đa 15 phút dữ liệu |
| File Storage / Document Storage | Tối đa 4 giờ | Tối đa 1 giờ dữ liệu |

Giải thích: RTO là thời gian tối đa để hệ thống phục hồi sau sự cố. RPO là lượng dữ liệu tối đa có thể mất khi xảy ra sự cố. Các chỉ số có thể điều chỉnh theo SLA và yêu cầu vận hành của khách hàng.

---

### 7.3.2 — Hỗ trợ full backup và incremental backup với lịch trình xác định

**Yêu cầu:**
> Hỗ trợ full backup và incremental backup với lịch trình xác định

**Đáp ứng:**

Giải pháp hỗ trợ đầy đủ cơ chế backup nhằm đảm bảo an toàn dữ liệu, hỗ trợ khôi phục hệ thống và giảm thiểu rủi ro mất dữ liệu trong các tình huống sự cố hoặc gián đoạn dịch vụ.

Hệ thống hỗ trợ:
- Full Backup (backup toàn bộ dữ liệu hệ thống)
- Incremental Backup (backup phần dữ liệu thay đổi kể từ lần backup gần nhất)
- Scheduled Backup theo lịch trình cấu hình sẵn
- Backup retention policy theo yêu cầu vận hành và chính sách lưu trữ dữ liệu
- Backup cho Application, Database, VM, File Storage và Container Volume
- Hỗ trợ backup cho cả môi trường Cloud và On-Premise
- Hỗ trợ backup cho nền tảng Docker/Kubernetes và Windows Server

Lịch backup đề xuất:
- Full backup thực hiện hàng tuần
- Incremental backup thực hiện theo giờ hoặc hàng ngày
- Database transaction log backup có thể thực hiện theo chu kỳ ngắn để giảm RPO
- Backup retention từ 7 đến 30 ngày tùy loại dữ liệu và yêu cầu vận hành
- Có thể mở rộng thời gian lưu trữ backup theo chính sách compliance của khách hàng

Khả năng phục hồi:
- Restore toàn bộ hệ thống hoặc từng thành phần riêng lẻ
- Restore theo từng thời điểm (point-in-time recovery)
- Hỗ trợ khôi phục nhanh khi xảy ra sự cố hệ thống hoặc mất dữ liệu
- Hỗ trợ replication backup sang DR site hoặc secondary storage

---

### 7.3.3 — Backup phải được mã hóa at rest

**Yêu cầu:**
> Backup phải được mã hóa at rest

**Đáp ứng:**

Giải pháp hỗ trợ mã hóa dữ liệu backup khi lưu trữ nhằm đảm bảo tính bảo mật và ngăn chặn truy cập trái phép vào dữ liệu backup.

Hệ thống hỗ trợ:
- Mã hóa dữ liệu backup tại storage layer (encryption at rest)
- Hỗ trợ AES-256 encryption
- Hỗ trợ encrypted backup transfer trong quá trình truyền dữ liệu
- Hỗ trợ access control và phân quyền truy cập backup repository
- Hỗ trợ tích hợp Key Management Service (KMS) hoặc cơ chế quản lý khóa mã hóa

Phạm vi áp dụng: Backup file, Database backup, VM snapshot, Object storage backup, File storage backup, Container volume backup

Mục tiêu bảo mật: Ngăn chặn truy cập trái phép vào dữ liệu backup; Đảm bảo an toàn dữ liệu khi lưu trữ trên Cloud hoặc On-Premise storage; Đáp ứng yêu cầu bảo mật và compliance của doanh nghiệp

---

### 7.3.4 — Thực hiện DR drill định kỳ và cung cấp bằng chứng

**Yêu cầu:**
> Thực hiện DR drill định kỳ và cung cấp bằng chứng

**Đáp ứng:**

Giải pháp hỗ trợ thực hiện Disaster Recovery (DR) Drill định kỳ nhằm xác minh khả năng phục hồi thực tế của hệ thống và đảm bảo quy trình DR luôn sẵn sàng vận hành khi xảy ra sự cố.

Hệ thống hỗ trợ:
- Định kỳ thực hiện DR Drill theo kế hoạch vận hành
- Kiểm tra khả năng restore backup
- Kiểm tra khả năng failover và failback
- Kiểm tra khả năng phục hồi Application, Database và File Storage
- Kiểm tra tính sẵn sàng của DR site hoặc standby environment

Nội dung DR Drill: Restore backup verification, Database recovery testing, VM/container recovery testing, Application service validation, Network connectivity validation, Service availability verification

Tần suất thực hiện: Quarterly (hàng quý) hoặc theo chính sách vận hành của khách hàng; Có thể thực hiện additional DR test theo yêu cầu audit hoặc compliance

Evidence / Reporting: DR test report, Recovery log, Audit trail, Restore validation result, Operational evidence / screenshot, Báo cáo kết quả kiểm tra và thời gian phục hồi thực tế

Mục tiêu: Đảm bảo backup có thể sử dụng thực tế khi xảy ra sự cố; Đảm bảo hệ thống đáp ứng yêu cầu RTO/RPO; Giảm thiểu downtime và rủi ro gián đoạn dịch vụ nghiệp vụ

---

## 7.4 — Reliability & Incident Response

### 7.4.1 — Định nghĩa RTO/RPO cho Application, Database, và File storage

**Yêu cầu:**
> Định nghĩa RTO/RPO cho Application, Database, và File storage

**Đáp ứng:**

Hệ thống được thiết kế với cơ chế backup và disaster recovery nhằm đảm bảo khả năng phục hồi dịch vụ và dữ liệu khi xảy ra sự cố hạ tầng, lỗi hệ thống hoặc mất dữ liệu ngoài ý muốn.

| Thành phần | RTO | RPO |
|---|---|---|
| Application Servers | Tối đa 2 giờ | Tối đa 30 phút dữ liệu |
| Database Servers | Tối đa 1 giờ | Tối đa 15 phút dữ liệu |
| File Storage / Document Storage | Tối đa 4 giờ | Tối đa 1 giờ dữ liệu |

Giải thích: RTO là thời gian tối đa để hệ thống phục hồi sau sự cố. RPO là lượng dữ liệu tối đa có thể mất khi xảy ra sự cố. Các chỉ số có thể điều chỉnh theo SLA và yêu cầu vận hành của khách hàng.

---

### 7.4.2 — Hỗ trợ full backup và incremental backup với lịch trình xác định

**Yêu cầu:**
> Hỗ trợ full backup và incremental backup với lịch trình xác định

**Đáp ứng:**

Giải pháp hỗ trợ đầy đủ cơ chế backup nhằm đảm bảo an toàn dữ liệu và hỗ trợ khôi phục hệ thống khi xảy ra sự cố hoặc mất dữ liệu.

Hệ thống hỗ trợ: Full Backup (backup toàn bộ dữ liệu), Incremental Backup (backup phần dữ liệu thay đổi), Scheduled Backup theo lịch trình cấu hình sẵn, Backup retention policy theo yêu cầu vận hành, Backup cho Application, Database, VM và File Storage

Giải thích: Full Backup: backup toàn bộ dữ liệu hệ thống. Incremental Backup: chỉ backup phần dữ liệu thay đổi kể từ lần backup trước đó nhằm giảm thời gian backup và tối ưu storage.

Lịch backup đề xuất: Full backup thực hiện hàng tuần; Incremental backup thực hiện theo giờ hoặc hàng ngày; Backup retention từ 7–30 ngày tùy loại dữ liệu

Lợi ích: Tăng khả năng phục hồi dữ liệu; Giảm rủi ro mất dữ liệu nghiệp vụ; Tối ưu thời gian backup và chi phí lưu trữ

---

### 7.4.3 — Backup phải được mã hóa at rest

**Yêu cầu:**
> Backup phải được mã hóa at rest

**Đáp ứng:**

Giải pháp hỗ trợ mã hóa dữ liệu backup khi lưu trữ nhằm đảm bảo an toàn dữ liệu và ngăn chặn truy cập trái phép.

Hệ thống hỗ trợ: Encryption at rest cho backup storage, AES-256 encryption, Secure backup repository, Access control cho backup data, Key management integration

Giải thích: Encryption at rest nghĩa là dữ liệu backup được mã hóa khi lưu trên disk, storage hoặc cloud repository. Trong trường hợp storage hoặc backup file bị truy cập trái phép, dữ liệu vẫn không thể đọc được nếu không có khóa giải mã phù hợp.

Phạm vi áp dụng: Database backup, VM snapshot, File storage backup, Object storage backup, Container volume backup

Lợi ích: Tăng mức độ bảo mật dữ liệu; Đáp ứng yêu cầu compliance và security policy; Giảm rủi ro lộ lọt dữ liệu backup

---

### 7.4.4 — Thực hiện DR drill định kỳ và cung cấp bằng chứng

**Yêu cầu:**
> Thực hiện DR drill định kỳ và cung cấp bằng chứng

**Đáp ứng:**

Giải pháp hỗ trợ thực hiện Disaster Recovery (DR) Drill định kỳ nhằm xác minh khả năng phục hồi thực tế của hệ thống và đảm bảo quy trình DR luôn sẵn sàng vận hành khi xảy ra sự cố.

Hệ thống hỗ trợ: Định kỳ thực hiện DR Drill theo kế hoạch vận hành; Kiểm tra khả năng restore backup; Kiểm tra khả năng failover và failback; Kiểm tra khả năng phục hồi Application, Database và File Storage; Kiểm tra tính sẵn sàng của DR site hoặc standby environment

Nội dung DR Drill: Restore backup verification, Database recovery testing, VM/container recovery testing, Application service validation, Network connectivity validation, Service availability verification

Tần suất thực hiện: Quarterly (hàng quý) hoặc theo chính sách vận hành của khách hàng; Additional DR test theo yêu cầu audit hoặc compliance

Evidence / Reporting: DR test report, Recovery log, Audit trail, Restore validation result, Operational evidence / screenshot, Báo cáo kết quả kiểm tra và thời gian phục hồi thực tế

Mục tiêu: Đảm bảo backup có thể sử dụng thực tế khi xảy ra sự cố; Đảm bảo hệ thống đáp ứng yêu cầu RTO/RPO; Giảm thiểu downtime và rủi ro gián đoạn dịch vụ nghiệp vụ

---

### 7.4.5 — Định nghĩa SLO và error budget

**Yêu cầu:**
> Định nghĩa SLO và error budget

**Đáp ứng:**

Giải pháp hỗ trợ định nghĩa SLO (Service Level Objective) nhằm thiết lập mục tiêu chất lượng dịch vụ và theo dõi mức độ ổn định của hệ thống.

Hệ thống hỗ trợ: Availability SLO, Latency SLO, Error rate monitoring, Service reliability tracking, Error budget monitoring

Giải thích:
- SLO là chỉ tiêu mục tiêu cho chất lượng dịch vụ, ví dụ: Availability 99.9%; API response time dưới 2 giây
- Error Budget là mức lỗi hoặc downtime cho phép trong một khoảng thời gian nhất định.
- Ví dụ: SLA availability 99.9% tương đương khoảng 43 phút downtime/tháng. Nếu downtime vượt quá giới hạn này thì hệ thống được xem là vượt error budget.

Lợi ích: Hỗ trợ theo dõi độ ổn định hệ thống; Cân bằng giữa tốc độ release và độ ổn định Production; Hỗ trợ quản trị chất lượng dịch vụ theo tiêu chuẩn SRE/DevOps

---

### 7.4.6 — Cung cấp quy trình incident response và escalation

**Yêu cầu:**
> Cung cấp quy trình incident response và escalation

**Đáp ứng:**

Giải pháp hỗ trợ quy trình xử lý sự cố nhằm đảm bảo sự cố được phát hiện, phân loại và xử lý nhanh chóng theo đúng mức độ ảnh hưởng.

Hệ thống hỗ trợ: Incident detection, Alerting và notification, Incident classification, Escalation workflow, Incident tracking và reporting

Giải thích:
- Incident response là quy trình xử lý khi hệ thống phát sinh lỗi hoặc gián đoạn dịch vụ.
- Escalation là cơ chế chuyển tiếp sự cố tới đội ngũ phù hợp khi vượt quá khả năng xử lý ban đầu.
- Ví dụ: Lỗi mức thấp xử lý bởi team vận hành; Lỗi nghiêm trọng ảnh hưởng Production sẽ được escalated tới technical lead hoặc management team.

Quy trình hỗ trợ:
1. Phát hiện sự cố
2. Đánh giá mức độ ảnh hưởng
3. Escalation tới nhóm xử lý phù hợp
4. Khắc phục và phục hồi dịch vụ
5. Theo dõi trạng thái incident tới khi đóng sự cố

Lợi ích: Giảm thời gian xử lý sự cố; Hạn chế ảnh hưởng tới người dùng cuối; Tăng tính chủ động trong vận hành hệ thống

---

### 7.4.7 — Cung cấp quy trình postmortem (RCA)

**Yêu cầu:**
> Cung cấp quy trình postmortem (RCA)

**Đáp ứng:**

Giải pháp hỗ trợ quy trình postmortem và Root Cause Analysis (RCA) sau sự cố nhằm xác định nguyên nhân gốc và cải thiện chất lượng vận hành hệ thống.

Hệ thống hỗ trợ: Incident review, Root Cause Analysis (RCA), Timeline analysis, Corrective action tracking, Preventive action planning

Giải thích:
- Postmortem là hoạt động đánh giá sau sự cố nhằm xác định: sự cố xảy ra như thế nào; nguyên nhân gốc là gì; cách phòng tránh tái diễn
- RCA (Root Cause Analysis) là quá trình phân tích nguyên nhân gốc gây ra sự cố thay vì chỉ xử lý triệu chứng bên ngoài.

Nội dung postmortem: Timeline sự cố, Phạm vi ảnh hưởng, Root cause, Hành động khắc phục, Preventive actions, Improvement recommendations

Lợi ích: Giảm khả năng tái diễn sự cố; Tăng độ ổn định hệ thống; Cải thiện quy trình vận hành và release management

---

## 7.5 — Monitoring & Observability

### 7.5.1 — Giám sát availability, latency (P95/P99), error rate, resource usage

**Yêu cầu:**
> Giám sát availability, latency (P95/P99), error rate, resource usage

**Đáp ứng:**

Giải pháp hỗ trợ giám sát toàn bộ trạng thái hoạt động của hệ thống theo thời gian thực nhằm đảm bảo hệ thống luôn vận hành ổn định, phát hiện sớm sự cố và hỗ trợ tối ưu hiệu năng.

Hệ thống hỗ trợ giám sát:
- Availability của application và service
- Response time và latency
- P95/P99 latency monitoring
- Error rate monitoring
- CPU usage, Memory usage, Disk usage, Network utilization
- Container/VM resource consumption
- Database performance monitoring

Giải thích:
- Availability: theo dõi hệ thống có đang hoạt động bình thường hay không.
- Latency: thời gian phản hồi của hệ thống đối với request từ người dùng.
- P95/P99 latency: dùng để đo hiệu năng thực tế của hệ thống trong các trường hợp tải cao. Ví dụ P95 = 2 giây nghĩa là 95% request phản hồi dưới 2 giây.
- Error rate: tỷ lệ request bị lỗi trong quá trình sử dụng.
- Resource usage: mức sử dụng CPU, RAM, Disk và Network của hệ thống.

Khả năng hỗ trợ: Real-time monitoring, Dashboard visualization, Alerting khi vượt ngưỡng cấu hình, Historical metrics tracking, Capacity monitoring và trend analysis

Lợi ích: Phát hiện sớm nguy cơ downtime hoặc suy giảm hiệu năng; Chủ động xử lý sự cố trước khi ảnh hưởng người dùng; Hỗ trợ tối ưu tài nguyên hạ tầng và năng lực hệ thống

---

### 7.5.2 — Cung cấp công cụ monitoring và khả năng tích hợp (Prometheus/Grafana/...)

**Yêu cầu:**
> Cung cấp công cụ monitoring và khả năng tích hợp (Prometheus/Grafana/...)

**Đáp ứng:**

Giải pháp hỗ trợ tích hợp với các nền tảng monitoring phổ biến nhằm phục vụ việc giám sát tập trung và quản trị vận hành hệ thống.

Hệ thống hỗ trợ tích hợp:
- Prometheus
- Grafana
- ELK/OpenSearch stack
- Cloud-native monitoring services
- Kubernetes monitoring tools
- Windows Server monitoring tools

Giải thích:
- Prometheus: công cụ thu thập metrics và monitoring phổ biến cho hệ thống server/container.
- Grafana: nền tảng hiển thị dashboard trực quan cho monitoring và alerting.
- ELK/OpenSearch: nền tảng quản lý log tập trung phục vụ monitoring và troubleshooting.

Khả năng hỗ trợ: Metrics collection, Dashboard visualization, Alert management, Custom monitoring dashboard, API-based integration, Multi-environment monitoring

Lợi ích: Hỗ trợ đội ngũ vận hành theo dõi hệ thống tập trung; Dễ dàng mở rộng và tích hợp với hạ tầng hiện có; Hỗ trợ phân tích hiệu năng và xử lý sự cố nhanh hơn

---

### 7.5.3 — Centralized logging với log levels chuẩn và correlation ID

**Yêu cầu:**
> Centralized logging với log levels chuẩn và correlation ID

**Đáp ứng:**

Giải pháp hỗ trợ centralized logging nhằm tập trung log từ nhiều thành phần hệ thống vào một nền tảng quản lý thống nhất.

Hệ thống hỗ trợ: Centralized log collection, Structured logging, Standard log levels, Correlation ID tracking, Search và filtering log, Multi-service log aggregation

Giải thích:
- Centralized logging: tất cả log từ application, database, container hoặc server được tập trung về một nơi để dễ theo dõi.
- Log level: phân loại mức độ log nhằm hỗ trợ vận hành và troubleshooting: INFO (thông tin hoạt động bình thường), WARN (cảnh báo), ERROR (lỗi xử lý), DEBUG (log phục vụ debug kỹ thuật)
- Correlation ID: mã định danh giúp theo dõi một request xuyên suốt nhiều service khác nhau trong hệ thống. Ví dụ: Một giao dịch người dùng đi qua API Gateway → Authentication Service → Payment Service → Database thì correlation ID giúp truy vết toàn bộ luồng xử lý này.

Lợi ích: Tăng khả năng troubleshooting; Giảm thời gian điều tra sự cố; Theo dõi transaction end-to-end; Hỗ trợ audit và phân tích hệ thống

---

### 7.5.4 — Định nghĩa chính sách lưu trữ log (online và archive)

**Yêu cầu:**
> Định nghĩa chính sách lưu trữ log (online và archive)

**Đáp ứng:**

Giải pháp hỗ trợ chính sách lưu trữ log nhằm đảm bảo khả năng truy xuất dữ liệu phục vụ vận hành, audit và compliance.

Log storage policy hỗ trợ: Online log retention, Archive log retention, Log rotation, Log compression, Secure log storage, Backup log repository

Giải thích:
- Online logs: log đang được lưu trên hệ thống để phục vụ monitoring và troubleshooting hằng ngày.
- Archive logs: log được lưu trữ dài hạn để phục vụ audit, compliance hoặc điều tra sự cố về sau.
- Log rotation: cơ chế tự động xoay vòng và dọn dẹp log cũ nhằm tránh đầy storage.

Chính sách đề xuất:
- Online logs: lưu trữ từ 30–90 ngày
- Archive logs: lưu trữ dài hạn theo yêu cầu vận hành hoặc compliance
- Tự động archive và cleanup theo policy cấu hình

Lợi ích: Tối ưu chi phí lưu trữ; Đảm bảo khả năng truy xuất log khi cần; Giảm ảnh hưởng tới hiệu năng hệ thống

---

### 7.5.5 — Cung cấp quyền truy cập log (read-only) và giao diện log explorer cho SSI IT

**Yêu cầu:**
> Cung cấp quyền truy cập log (read-only) và giao diện log explorer cho SSI IT

**Đáp ứng:**

Hỗ trợ cung cấp quyền truy cập log theo mô hình phân quyền nhằm hỗ trợ đội ngũ IT của khách hàng trong quá trình giám sát và xử lý sự cố hệ thống.

Hệ thống hỗ trợ: Read-only access cho SSI IT, Web-based log explorer, Log search và filtering, Time-based query, Export log data, Dashboard và visualization

Giải thích:
- Read-only access: đội ngũ IT có thể xem và tìm kiếm log nhưng không thể chỉnh sửa hoặc xóa dữ liệu log.
- Log explorer: giao diện web hỗ trợ tìm kiếm log theo thời gian, keyword, service hoặc transaction.

Security Controls: Role-based access control (RBAC), Audit log cho hoạt động truy cập, Secure authentication, Permission isolation

Lợi ích: Hỗ trợ đội vận hành chủ động kiểm tra hệ thống; Giảm phụ thuộc vào vendor trong troubleshooting; Tăng tính minh bạch và khả năng giám sát vận hành

---

### 7.5.6 — Hỗ trợ distributed tracing (OpenTelemetry/Jaeger hoặc tương đương)

**Yêu cầu:**
> Hỗ trợ distributed tracing (OpenTelemetry/Jaeger hoặc tương đương)

**Đáp ứng:**

Giải pháp hỗ trợ distributed tracing nhằm theo dõi luồng xử lý request xuyên suốt nhiều service và thành phần hệ thống.

Hệ thống hỗ trợ tích hợp với: OpenTelemetry, Jaeger, hoặc các công cụ distributed tracing tương đương

Khả năng hỗ trợ: End-to-end request tracing, Span và trace tracking xuyên service, Correlation ID integration, Latency analysis per service, Root cause identification cho performance issues

Lợi ích: Tăng khả năng phân tích và troubleshooting hệ thống microservices; Xác định bottleneck hiệu năng giữa các service; Hỗ trợ SRE và DevOps team trong vận hành hệ thống phân tán

---

## Liên kết

- [[wiki/projects/SSI-Project]]
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]
- [[wiki/sources/v7m2p-ssi-devops-requirements]]
