---
type: meeting
title: "Họp SaaS #15 — 21/10/2023"
date: 2023-10-21
tags: [saas, meeting, identity, monitor, log, docker, sqlite, json]
prev: "[[Meeting-1014]]"
next: "[[Meeting-1028]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 21/10/2023

## Mục tiêu
- Monitor & Log (Hiếu + Phúc đang trao đổi xử lý log SQLite)

## Review tuần trước

| Hạng mục | Trạng thái |
|----------|-----------|
| K8s CMC (Hiếu.Lê 16/10) | ✅ Họp kiến trúc với CMC; đưa kế hoạch cụ thể |
| Identity mới giao diện kích hoạt step-by-step (Hoàng) | 🔄 90% — chờ Linh hoàn thiện; tuần sau 100% |
| Move tenant cũ → identity mới (Hoàng) | ✅ **DONE** |
| Chạy identity mới cho main/portal/apiv3 (Hoàng) | ✅ **DONE** |
| Giải pháp licence (Sáng+Hoàng+Tung.Ly) | ❌ Chưa làm |
| Dockerfile dòng lệnh (Minh.NguyễnĐạt) | 🔄 Tạm thời chạy được source HRM |

## Link demo (local environment)

| Ứng dụng | URL |
|----------|-----|
| Main HRM | `https://hn-site.dev.local:2000` |
| Portal | `https://hn-site.dev.local:2001` |
| Identity Server mới | `https://hn-site.dev.local:1801` |
| Login main/portal | `tung.ly@vnresource.vn / Asd@1234` |
| Login Identity admin | `admin / Pa$$word123` |

## Các ý chính

### Identity (Hoàng.Nguyễn) — Tiếp tục
Các việc còn lại:
- Xử lý ngôn ngữ (i18n)
- Lấy thông tin user
- Login quản lý tenant
- Refactor/fix phần auth của Tenant UI chạy với identity mới

### Monitor & Log
| Hạng mục | Trạng thái |
|----------|-----------|
| Đọc log JSON | ✅ Done |
| Đọc log request (SQLite) | ❌ Chưa được |
| Chuyển SQLite sang log JSON | 🔄 Phúc.Dương xử lý |

### Docker
- Tạm thời chạy được source HRM
- Đang tiếp tục hoàn thiện

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Hoàng.Nguyễn | 28/10 | Tiếp tục identity mới: ngôn ngữ, lấy user info, login quản lý tenant, refactor auth Tenant UI |
| Minh.NguyễnĐạt | 28/10 | Xử lý dockerfile bằng dòng lệnh |
| Hiếu.Lê + Phúc.Dương | 28/10 | Monitor và Log: đọc log request (SQLite); Phúc chuyển SQLite → log JSON |
