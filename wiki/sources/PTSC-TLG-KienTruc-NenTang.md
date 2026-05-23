---
description: "Kiến trúc nền tảng PTSC: 3-Tier, 5 server đề xuất, multi-environment DEV→PROD, IaaS Cloud, observability, Active/Passive DB, RBAC và audit log."
type: source
code: j6k1
tags:
  - "ptsc"
  - "kien-truc"
  - "3-tier"
  - "iaas"
  - "multi-environment"
domain: system
created: 2026-04-30
updated: 2026-04-30
source-file: raw/0. Daily/TaiLieuGiaiPhap/s4.1-*, s4.2-*, s4.3-*, s4.4-*, s4.5-*, s4.6-*
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/sources/PTSC-TLG-BaoMat-HA-DR]]"
---

# Source: PTSC TaiLieuGiaiPhap — §4.1–4.6 Kiến Trúc Nền Tảng & Yêu Cầu Phi Chức Năng

## Tóm tắt

Phần §4.1–4.6 của tài liệu giải pháp PTSC quy định yêu cầu phi chức năng về: kiến trúc hệ thống (3-Tier, HA, IaaS), hiệu năng và khả năng mở rộng, xác thực/đăng nhập, phân quyền RBAC, lập trình phát triển, và tích hợp hệ thống. VnResource đề xuất kiến trúc 5 server (Nginx LB + 2 App Server + 2 DB Server Active/Passive), Redis cache, NFS, DR site.

## Key Takeaways

- **Kiến trúc 3-Tier:** Presentation (Web/Mobile) → Application (.NET, stateless, JWT) → Database (SQL Server Active/Passive + Redis + NFS)
- **5 servers đề xuất:** Nginx LB (4C/8GB), 2× App Server (16C/64GB/240GB SSD), 2× DB Server (16C/128GB/512GB SSD)
- **Multi-environment:** DEV (VnR Server 1) → TEST (VnR Server 2) → UAT (KH Server) → PROD (KH Server) — tách biệt hoàn toàn
- **IaaS Cloud:** hỗ trợ AWS (EC2/RDS/S3/Kubernetes) — tách Code/Config/Data
- **Observability:** structured logging JSON + TraceId, centralized log (Graylog/ELK), Prometheus+Grafana, email alerting
- **Active/Passive DB:** SQL Server AlwaysOn AG hoặc Log Shipping — passive sẵn sàng takeover
- **RBAC §4.4:** phân quyền theo user/role, data permission, tích hợp SSO — consistent với HRM-SysDB-Schema
- **UTF-8 toàn bộ:** DB dùng NVARCHAR, collation phù hợp — hỗ trợ đa ngôn ngữ
- **Audit Log §4.1.16:** ghi toàn bộ thao tác user + API call + xuất dữ liệu — 3 loại log

## Trích dẫn quan trọng

> Hệ thống được thiết kế theo mô hình **3-Tier Architecture**, tách biệt rõ ràng các lớp: Presentation, Application và Database, đảm bảo **tính mở rộng, bảo mật và dễ bảo trì**.

> Thiết kế **stateless** để hỗ trợ scale-out. Có thể triển khai nhiều instance sau Load Balancer.

> Mô hình **multi-environment**: DEV → TEST → UAT → PRODUCTION. Mỗi môi trường tách biệt hoàn toàn về hạ tầng, cấu hình và dữ liệu.

> Hiện tại hệ thống **chưa triển khai cơ chế Active–Standby** tự động, nhưng kiến trúc **không phụ thuộc cứng**, sẵn sàng mở rộng.

## Liên kết

- [[wiki/architecture/HRM-System-Architecture]] — kiến trúc IIS vs K8s thực tế
- [[wiki/architecture/HRM-Deployment-Architecture]] — deploy IIS, K8s, multi-tenant
- [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] — §4.7–4.15 bảo mật và HA
- [[wiki/sources/PTSC-TLG-Idempotent-Operations]] — §3 kỹ thuật tích hợp
