---
description: "Kiến trúc SaaS Multi-Tenant HRM VnResource 2023: DB-per-tenant, K8s, IdentityServer4, Redis cache theo tenantCode và các vấn đề tồn đợng khi archive."
type: source
code: s7kv
tags:
  - "saas"
  - "multi-tenant"
  - "k8s"
  - "system"
  - "architecture"
domain: system
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/architecture/SaaS-MultiTenant-Architecture]]"
  - "[[wiki/sources/SaaS-VnR-Meetings-2023-2024]]"
  - "[[wiki/sources/SaaS-VnR-Meetings-Detail-2023]]"
  - "[[wiki/concepts/Net8-Migration]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
---

# Source: SaaS VnR — Kiến Trúc, Stack & Quyết Định Kỹ Thuật (2023)

## Tóm tắt

Tài liệu tổng hợp R&D nền tảng **HRM SaaS Multi-Tenant** của VnResource, thực hiện từ tháng 07 đến tháng 10/2023 rồi archived. Đội 10 người (Tung.Ly lead backend) xây dựng mô hình **DB-per-tenant** trên nền K8s + Docker, với IdentityServer4 mới, Redis cache theo tenantCode, MinIO/S3 storage per tenant. Dự án dừng do 3 vấn đề chưa giải quyết: Window Service không có tenant context, biến static data leak, và chưa chốt model licence.

## Key Takeaways

- **DB-per-tenant**: mỗi khách hàng = 1 SQL Server database riêng; tạo tự động khi đăng ký qua MISA Marketplace
- **Redis key namespace**: `{tenantCode}:{module}:{identifier}` — flush 1 tenant không ảnh hưởng tenant khác
- **Storage**: MinIO on-prem (dev) → AWS S3 (prod); file dùng chung (lang, field_info) không copy per-tenant
- **IdentityServer4 mới**: thay Identity cũ; có UI quản lý; claim `tenantCode` trong JWT; DONE tháng 10/2023
- **Biến static là rủi ro #1**: `PermissionHelper.Permissions` static không scope tenant → data leak chắc chắn nếu không refactor
- **Window Service chưa giải quyết**: background job (tính lương, BH) không có tenant context → nguy cơ xử lý sai dữ liệu giữa tenant
- **Helm Chart thay Docker Compose**: AWS EKS không hỗ trợ Compose trực tiếp
- **Partner K8s**: SaveMoney (on-prem, thất bại tháng 9) → CMC (AWS, đang plan tháng 10)
- **Licence model chưa chốt**: per-tenant / per-user / subscription — chưa có quyết định khi archived
- **Log per-tenant**: tạo folder `logs/{tenantCode}/` trong BaseService; kế hoạch dài hạn dùng Loki + Grafana
- **4 phase tiến độ**: Phase 1 Nghiên cứu (07/2023) → Phase 2 Core MT (08/2023) → Phase 3 Kỹ thuật (09/2023) → Phase 4 Identity+K8s (10/2023)

## Trích dẫn quan trọng

> Mỗi biến static không scope theo tenant là 1 điểm data leak tiềm năng. Nếu bỏ qua → **data leak giữa tenant là chắc chắn**.

> Window Service của HRM xử lý lương, bảo hiểm, schedule. Không có context tenant → tất cả job chạy với DB mặc định. Khi multi-tenant: **tenant B có thể bị tính lương của tenant A** nếu Window Service không được cô lập.

> AWS **không hỗ trợ Docker Compose** → phải dùng Helm Chart cho production.

> SaveMoney chưa hỗ trợ đủ để cài K8s lên VnR đến tháng 09/2023.

## Luồng đăng ký tenant (Happy Path)

```
1. KH đăng ký HRM qua MISA Marketplace
2. API Misa gọi HRM API → tạo tenant mới
3. Tenant Management tự động:
   - Tạo database (restore từ template)
   - Tạo user superadmin / gán tenantCode
   - Lưu connection string vào DB quản lý tenant
4. Gửi email kích hoạt → KH đổi mật khẩu lần đầu
5. KH login với tenantCode + credentials → JWT có claim tenantCode
6. HRM resolve tenantCode → kết nối đúng DB tenant
```

## Vấn đề tồn đọng khi archived (10/2023)

| # | Vấn đề | Rủi ro |
|---|--------|--------|
| 1 | Biến static / httpContext.Cache chưa audit | 🔴 Data leak giữa tenant |
| 2 | Window Service không có tenant context | 🔴 Tính sai dữ liệu giữa tenant |
| 3 | Licence model chưa chốt | 🟡 Không thể demo KH thật |
| 4 | MinIO SSL chưa cài được | 🟡 Không an toàn production |
| 5 | K8s production với CMC/AWS đang plan | 🟡 Chưa có go-live date |

## Priority nếu resume dự án

1. Audit biến static → phân loại an toàn / cần per-tenant
2. Chốt licence model (per-user là phổ biến nhất với HRM SaaS)
3. MinIO SSL
4. Window Service architecture (sub-process vs API-driven)
5. K8s production plan với CMC

## Liên kết

- [[wiki/architecture/SaaS-MultiTenant-Architecture]] — sơ đồ kiến trúc đầy đủ
- [[wiki/sources/SaaS-VnR-Meetings-2023-2024]] — tóm tắt biên bản họp
- [[wiki/sources/SaaS-VnR-Meetings-Detail-2023]] — biên bản họp chi tiết 16 buổi
- [[wiki/architecture/HRM-System-Architecture]] — so sánh với kiến trúc HRM on-premise hiện tại
