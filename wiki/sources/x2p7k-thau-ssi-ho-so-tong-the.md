---
type: source
code: x2p7k
description: "Hồ sơ thầu SSI HRM 2025: yêu cầu kỹ thuật toàn diện gồm cấu hình, API, DevOps, bảo mật, hạ tầng cho VnResource HRM Pro"
tags:
  - ssi
  - dau-thau
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
source-file: "raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/ho_so_thau_SSI.md"
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/q3r6t-ssi-api-spec]]"
  - "[[wiki/sources/j5k9w-ssi-security-requirements]]"
  - "[[wiki/sources/v7m2p-ssi-devops-requirements]]"
  - "[[wiki/sources/f8c4n-ssi-infrastructure-requirements]]"
  - "[[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]"
---

# Source: Hồ sơ thầu SSI — VnResource HRM Pro (Tổng thể)

## Tóm tắt

Tài liệu giải pháp kỹ thuật hệ thống phần mềm quản trị nhân sự **VnResource HRM Pro** được lập để đáp ứng yêu cầu đấu thầu của **SSI (Công ty Chứng khoán SSI)**. Tài liệu gồm 10 chương bao phủ toàn bộ yêu cầu kỹ thuật: từ cấu hình hệ thống, vận hành, tích hợp API, DevOps/hạ tầng, bảo mật đến kiến trúc giải pháp. VnResource đề xuất stack **.NET 8 / Angular 19 / SQL Server / Redis / Docker-K8s** với kiến trúc multi-tier SOA, hỗ trợ HA 99.99% và 10.000 user đồng thời.

## Key Takeaways

- **Giải pháp**: VnResource HRM Pro — multi-tier (Presentation / Business / Data / Infrastructure), kiến trúc SOA/Microservice-ready
- **Tech stack**: Angular 19 (frontend), .NET 8 (backend), SQL Server 2019, Redis Sentinel, Ocelot API Gateway, OAuth2/OpenID Connect
- **API tích hợp**: 14 GET endpoints + 10 POST/PUT endpoints phục vụ SSI lấy/đẩy dữ liệu HRM (org, nhân viên, lương, công, phép, KPI, tuyển dụng)
- **Bảo mật**: Input validation server-side, MFA bắt buộc, OAuth2, TLS 1.2+, bcrypt/Argon2, audit log, data masking CMND/lương
- **DevOps**: Docker/K8s, CI/CD pipeline (Build → SAST → Test → Deploy), Blue-Green/Canary, RTO/RPO định nghĩa, DR drill định kỳ
- **Hạ tầng**: 2 App Server (16 core/64GB) + 2 DB Server Active/Passive (16 core/128GB) + Nginx LB + WAF; fiber kết nối 1Gbps
- **HA**: AlwaysOn/Log Shipping SQL Server, Redis Sentinel, LB health check tự động failover; 24/7 uptime
- **Monitoring**: Prometheus + Grafana, ELK/Graylog centralized log, OpenTelemetry distributed tracing, correlationId trên mọi request
- **Pháp lý bảo mật**: Tuân thủ Nghị định 13/2023/NĐ-CP (BVDLCN), ISO 27001, Luật ANM 2025
- **SLA bảo mật**: Critical patch ≤ 72h, High ≤ 7 ngày, Medium ≤ 30 ngày

## Trích dẫn quan trọng

> Giải pháp VnResource HRM được xây dựng trên nền tảng kiến trúc mở, hiện đại và hướng dịch vụ (SOA/Microservice-ready), đáp ứng khả năng mở rộng, tích hợp linh hoạt và vận hành ổn định cho các doanh nghiệp quy mô lớn.

> Kiểm thử JMeter: 10.000 user đồng thời, ≤ 3 giây (99% thao tác). Hỗ trợ mở rộng theo chiều ngang (horizontal scaling) để đáp ứng tăng trưởng người dùng và dữ liệu trong tương lai.

> Hệ thống được thiết kế theo nguyên tắc "Server-side Validation First", đảm bảo toàn bộ dữ liệu đầu vào do người dùng cung cấp đều được chuẩn hóa, kiểm tra và xác thực tại phía máy chủ trước khi được xử lý hoặc ghi nhận vào hệ thống.

> Xác thực đa yếu tố (MFA) bắt buộc cho tất cả tài khoản truy cập hệ thống HRM.

## Cấu trúc tài liệu (183 file)

| Chương | File | Nội dung |
|--------|------|----------|
| Ch.1 (000–012) | Cấu hình hệ thống | Ngôn ngữ, file, tham số, metadata, phân quyền, master data, báo cáo |
| Ch.3 (013–022) | Vận hành | Thiết bị đầu cuối, phần mềm máy trạm, SLA, tài liệu bàn giao (On-cloud & On-premise) |
| Ch.6 (023–050) | API tích hợp | 14 GET + 10 POST/PUT APIs; xem chi tiết: [[wiki/sources/q3r6t-ssi-api-spec]] |
| Ch.7 (051–083) | DevOps & Ops | CI/CD, Backup/DR, Monitoring/Logging; xem: [[wiki/sources/v7m2p-ssi-devops-requirements]] |
| Ch.8 (084–098) | Kiến trúc giải pháp | Multi-tier, SOA, Docker/K8s, SSO, ECM; xem: [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] |
| Ch.9 (099–145) | Bảo mật | Input validation, Auth/Session, File, DB, TLS, Integration security; xem: [[wiki/sources/j5k9w-ssi-security-requirements]] |
| Ch.10 (146–182) | Hạ tầng | Hardware, OS, Network, DB, Storage; xem: [[wiki/sources/f8c4n-ssi-infrastructure-requirements]] |

## Liên kết

- [[wiki/projects/SSI-Project]] — Project page SSI
- [[wiki/sources/q3r6t-ssi-api-spec]] — Chi tiết 24 API endpoints
- [[wiki/sources/j5k9w-ssi-security-requirements]] — Yêu cầu bảo mật Ch.9
- [[wiki/sources/v7m2p-ssi-devops-requirements]] — DevOps/CI/CD/Monitoring Ch.7
- [[wiki/sources/f8c4n-ssi-infrastructure-requirements]] — Hạ tầng phần cứng Ch.10
- [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] — Kiến trúc tổng thể Ch.8
- [[wiki/projects/PTSC-Project]] — Dự án thầu tương tự đã có trong wiki
