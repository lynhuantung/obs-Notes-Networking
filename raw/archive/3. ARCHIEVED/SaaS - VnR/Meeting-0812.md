---
type: meeting
title: "Họp SaaS #06 — 12/08/2023"
date: 2023-08-12
tags: [saas, meeting, tenant-management, identity, storage, docker]
prev: "[[Meeting-0810]]"
next: "[[Meeting-0819]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 12/08/2023

## Mục tiêu
- Review: Docker Win, xử lý storage, switch nhiều database, kịch bản vận hành, cài môi trường SaveMoney
- Xử lý storage

## Các ý chính

### Quản lý User trong Tenant Management
- **Kiến trúc:** Dạng data warehouse
- **Cơ chế:** Viết store lấy tất cả database đồng bộ vào bảng users tập trung
- ⚠️ **Không đồng bộ** từ màn hình user trong HRM đến APP tenant (1 chiều)

### Identity
- Xử lý identity trong quản lý tenant
- Trang login HRM: thêm textbox `tenantCode`

### K8s tài liệu
- Phúc + Tú tổ chức lại tài liệu K8s

### Storage (MinIO)
- Làm tài liệu storage → nhờ a.Hiền điều phối module tiến hành làm

### Biến static (vấn đề tồn đọng)
- **Chủ đề tuần tiếp theo:** Xử lý biến static

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Đăng | 14/08 | Thiết kế giao diện |
| Hoàng | 19/08 | Hoàn thành giao diện từ thiết kế của Đăng |
| Phúc | 17/08 | Làm tài liệu K8s |
| Sáng | 16/08 | Làm tài liệu storage |
| a.Hiền | 17/08 | Điều phối module chỉnh sửa dựa theo tài liệu của Sáng |
| Tùng | 16/08 | Show a.Hiền về chức năng kết nối nhiều database |

## Chủ đề tuần tiếp theo
- Xử lý biến static
