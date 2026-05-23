---
type: meeting
title: "Họp SaaS #11 — 23/09/2023"
date: 2023-09-23
tags: [saas, meeting, k8s, windowservice, log, claim-tenant, loki]
prev: "[[Meeting-0918]]"
next: "[[Meeting-0930]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 23/09/2023

## Mục tiêu
- Review tuần trước
- Xử lý Window Service theo tenant

## Review tuần trước

| Hạng mục | Trạng thái |
|----------|-----------|
| Filter tất cả màn hình quản lý tenant (Linh+Minh+Bảo) | ✅ Done |
| MinIO chữ hoa/thường (Sáng) | ❌ Chưa chạy được do chữ hoa/thường |
| Superadmin sau tạo DB mới (Tùng+Sáng) | ❌ Chưa xử lý được |
| Login user sai (Hoàng+Tùng) | ❌ Chưa xử lý được |
| Log — chia thư mục theo tenantCode | ❌ Chưa biết xử lý |
| Window service — sub-process theo tenantCode | ✅ Xử lý được |

## Các ý chính

### K8s — Tổ chức lại nhóm
- Phúc + Hiếu.Lê làm trực tiếp với nhau
- Phúc điều phối task với Minh và Tú
- **Phúc + Hiếu đưa mô hình đề xuất K8s → a.Hiền quyết định**
- Cần chốt thời gian làm việc với Hiếu.Lê

### Window Service
- Sửa thông tin multi-tenant để chạy multi-tenant

### Claim Tenant
- Nếu null → dùng **cookie** làm fallback

### Log
- Sửa file global → xử lý set theo tenant code
- **Kế hoạch dài hạn: dùng Loki** (log theo console + web dashboard để view)

### Hỗ trợ code từ Vũ.Lê
- Tối thứ 4 hoặc thứ 6

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Sáng + Tung.Ly | 30/09 | Claim tenant null → xử lý lúc authen (Sáng hỗ trợ) |
| Phúc + Hiếu.Lê | 30/09 | Chốt thời gian làm việc với Hiếu; Phúc + Hiếu lead K8s; đề xuất mô hình |
| Tùng + Sáng + Vũ.Lê | 30/09 | Window service: sửa thông tin multi-tenant để chạy |
| Tùng + Sáng + Vũ.Lê | 30/09 | Log: sửa file global, set theo `tenantCode` (tạo thư mục tenantCode trong log) |
