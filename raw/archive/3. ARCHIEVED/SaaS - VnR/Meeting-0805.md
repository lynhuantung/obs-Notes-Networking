---
type: meeting
title: "Họp SaaS #04 — 05/08/2023"
date: 2023-08-05
tags: [saas, meeting, multi-tenant, minio, storage, kichban]
prev: "[[Meeting-2907]]"
next: "[[Meeting-0810]]"
related: ["[[SaaS-Tong-Quan-Kien-Truc]]", "[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 05/08/2023

## Mục tiêu
- Review tuần trước: thuê máy ảo, SaveMoney hướng dẫn cài K8s; Docker tạo images .NET Framework và .NET Core; K8s demo node Windows, cấu hình volume
- Tung.Ly trao đổi về multi-tenant và link kế hoạch

## Các ý chính

### Kế hoạch SaaS
- Trao đổi về Multi-Tenant
- Timeline các mốc thời gian chính demo cho a.Hiền

### Multi-Tenant — Thiết kế
- **Tenant Management** — module quản lý toàn bộ tenant
- Mỗi tenant = 1 storage riêng trên MinIO
- Bảo mật: phân tách dữ liệu file giữa các tenant

### MinIO — Import/Upload/Download
- Mỗi tenant 1 storage riêng
- Bảo mật file theo tenant
- Không dùng tính năng xuất file lớn (để tránh resource hog)

### K8s
- Docker: tạo images .NET Framework (vì HRM còn dùng .NET Framework)
- Phúc tìm cách dựng node Windows; Tú xử lý volume

### Kịch bản vận hành SaaS
- Tung.Ly viết kịch bản đầy đủ: từ đăng ký → tạo tenant → login → sử dụng

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Tung.Ly | 12/08 | Book họp với Đăng về quản lý tenant |
| Tung.Ly | 12/08 | Xử lý switch nhiều database |
| Tung.Ly | 12/08 | Viết kịch bản vận hành SaaS |
| Tung.Ly | 12/08 | Timeline các mốc chính demo cho a.Hiền |
| Hoàng | 05/08 | Tích hợp gọi API Misa-HRM |
| Hoàng | — | Quản lý tenant |
| Sáng | 30/08 | Xử lý storage |

## Chủ đề tuần tiếp theo
- Xử lý storage, xử lý biến static
