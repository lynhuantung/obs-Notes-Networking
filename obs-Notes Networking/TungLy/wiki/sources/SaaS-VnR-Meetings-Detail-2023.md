---
type: source
tags: [saas, kubernetes, multi-tenant, minio, identity-server, vnresource]
created: 2026-04-27
updated: 2026-04-27
domain: system
related: [[wiki/sources/SaaS-VnR-Meetings-2023-2024]], [[wiki/concepts/Net8-Migration]], [[wiki/architecture/HRM-System-Architecture]]
---

# SaaS VnR — Biên Bản Họp Chi Tiết 2023 (16 buổi)

## Tóm tắt

16 biên bản họp sprint weekly của nhóm SaaS VnR từ **07/2023 đến 10/2023**, ghi lại quá trình R&D chuyển HRM sang kiến trúc multi-tenant trên Kubernetes. Tham gia: Tùng.Lý, Đăng.Vũ, Hoàng.Nguyễn, Phúc.Dương, Sáng.Mai, Minh.NguyễnĐạt, Hiếu.Lê (K8s consultant từ SaveMoney/CMC).

## Key Takeaways

- **Meeting 07/07 (15/07/2023)**: Kick-off K8s + flow đăng ký HRM từ chợ Misa — Tùng.Lý vẽ flow kiến trúc Kubernetes
- **Meeting 07/07 (22/07/2023)**: Họp daily scrum 15 phút — Docker MVC + SQL; Minh đưa image lên Docker Hub
- **Meeting 08/07 (05/08/2023)**: Multi-tenant strategy: **MinIO per tenant** (mỗi tenant có storage riêng), kế hoạch SaaS, tích hợp API Misa-HRM; Tùng.Lý xử lý switch nhiều database
- **Meeting 08/10 (10/08/2023)**: Thiết kế UI quản lý tenant (Đăng.Vũ), danh sách company + copy domain/login
- **Meeting 08/12 (12/08/2023)**: Identity Server cho multi-tenant, tenantCode ở trang login, data warehouse sync users từ nhiều DB vào bảng users chung
- **Meeting 08/19 (19/08/2023)**: Tạo DB tự động khi tạo tenant (Tùng.Lý), login multi-tenant demo
- **Meeting 08/26 (26/08/2023)**: Demo full flow: tạo tenant → login → upload storage MinIO
- **Meeting 09/09 (09/09/2023)**: Template (rỗng — placeholder)
- **Meeting 09/18 (18/09/2023)**: Redis cache cho biến static theo tenantCode; Identity Server mới (Hoàng); Window Service cần tenantCode; Log chia thư mục theo tenantCode; MinIO SSL chưa xử lý được
- **Meeting 09/23 (23/09/2023)**: K8s lead: Phúc.Dương + Hiếu.Lê; Claim tenant từ cookie nếu null; Log global → set theo tenant (sau này dùng Loki)
- **Meeting 09/30 (30/09/2023)**: AWS S3 thay MinIO; Docker Helm chart (AWS không dùng docker compose); Window Service multi-tenant chưa xử lý sub process; Identity Hoàng.Nguyễn chạy trên Docker
- **Meeting 10/07 (07/10/2023)**: Monitor & Log HRM (Hiếu.Lê plan); Docker file bằng dòng lệnh (Minh)
- **Meeting 10/14 (14/10/2023)**: DevOps plan từ Hiếu.Lê; họp kiến trúc CMC 16/10; Identity move tenant cũ → mới (Hoàng 60% done)
- **Meeting 10/21 (21/10/2023)**: Identity mới chạy được main/portal/apiv3; Monitor log JSON đọc được, SQLite chưa; Docker file chạy được source HRM tạm
- **Meeting 10/28 (28/10/2023)**: Placeholder — thông tin hạn chế
- **Meeting 07/29 (29/07/2023)**: Thuê 3 server ảo (SaveMoney hỗ trợ K8s); Tùng.Lý check 1 source dùng nhiều DB; MinIO upload/check file chung (lang, field_info)

## Trích dẫn quan trọng

> Import/Upload/Download dùng storage MinIO — Bảo mật: Mỗi tenant là một storage riêng (Meeting 05/08/2023)

> Viết store lấy tất cả database và đồng bộ vào bảng users — Không đồng bộ từ màn hình user trong HRM đến APP tenant (Meeting 12/08/2023)

> Redis cache: đã xử lý lưu rediscache khi lưu memory cache theo tenantCode (Meeting 18/09/2023)

> Window service chưa tạo được sub process theo multi tenant — Biến static, httpContext.cache chưa xử lý theo multi tenant được (Meeting 30/09/2023)

> AWS có cơ chế tự tạo 1 database đọc, 1 database ghi → tính phí. Scale database → nếu dung lượng lớn thì tự scale để tăng performance → tính phí (Meeting 30/09/2023)

## Timeline kỹ thuật

```
07/2023: Kick-off K8s + MinIO + multi-tenant strategy
08/2023: UI quản lý tenant, Identity Server, tạo DB tự động
09/2023: Redis cache tenantCode, Window Service, Log per tenant, K8s lead = Hiếu.Lê
10/2023: DevOps plan (CMC), Docker file, Identity mới, Monitor & Log
```

## Kỹ thuật cốt lõi

| Vấn đề | Giải pháp chốt |
|--------|---------------|
| Biến static | Redis cache theo tenantCode |
| Storage | MinIO per tenant (sau đổi sang AWS S3) |
| Log | Chia thư mục theo tenantCode → sau dùng Loki |
| Window Service | Sub-process theo tenantCode (chưa xong ở cuối Q3/2023) |
| User sync | Data warehouse: store lấy tất cả DB → đồng bộ bảng users |
| Identity | Identity Server 4 UI mới (Hoàng.Nguyễn), move từ tenant cũ |
| K8s infra | Helm chart (AWS), Hiếu.Lê + Phúc.Dương lead |

## Liên kết

- [[wiki/sources/SaaS-VnR-Meetings-2023-2024]] — Tổng quan SaaS VnR (đã ingest)
- [[wiki/architecture/HRM-System-Architecture]] — Kiến trúc K8s 13 services (VnPay)
- [[wiki/architecture/HRM-Deployment-Architecture]] — IIS + K8s deployment
- [[wiki/architecture/HRM-Auth-Architecture]] — Identity Server 4 pattern
