---
type: meeting
title: "Họp SaaS #07 — 19/08/2023"
date: 2023-08-19
tags: [saas, meeting, tenant-create, login, k8s, savemoney]
prev: "[[Meeting-0812]]"
next: "[[Meeting-0826]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]", "[[SaaS-Tong-Quan-Kien-Truc]]"]
---

# Biên Bản Họp — 19/08/2023

## Mục tiêu
- Review: làm tài liệu storage, làm tài liệu K8s
- Xử lý biến static

## Các ý chính

### Luồng tạo tenant → login (target demo)
```
Tạo tenant
  → Click xác nhận
  → Tự tạo DB mới (chạy script restore DB)
  → Login HRM với tenantCode tương ứng
  → Upload file lên storage riêng của tenant
```

### Quản lý tenant — chức năng mới
- Tạo mới tenant
- Xử lý nút xác nhận → tạo mới DB (chạy script restore DB)

### App HRM
- Đổi mật khẩu lần đầu khi mới tạo tenant
- Đăng nhập vào HRM

### K8s — Vấn đề với SaveMoney
> ⚠️ SaveMoney hỗ trợ chưa cụ thể và chưa cài đặt được môi trường lên VnR.
> SaveMoney hướng dẫn và đã thực hiện theo nhưng không chạy được.
> Đã nhờ SaveMoney hỗ trợ sửa nhưng vẫn chưa chạy được.

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Tung.Ly | 26/08 | Tạo mới database tự động; demo login multi-tenant (kết nối trực tiếp vào DB quản lý tenant để lấy chuỗi kết nối) |
| Hoàng | 26/08 | Hoàn thành giao diện từ thiết kế của Đăng; xử lý lưu thông tin DB của khách hàng vào DB quản lý tenant |
| Phúc + Tú | 26/08 | Vẽ overview architect |
| Phúc | 26/08 | SaveMoney hỗ trợ không đủ → nhờ a.Hiền trao đổi với SaveMoney để tìm người nắm rõ hỗ trợ Phúc |
