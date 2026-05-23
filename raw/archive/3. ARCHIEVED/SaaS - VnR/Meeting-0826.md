---
type: meeting
title: "Họp SaaS #08 — 26/08/2023"
date: 2023-08-26
tags: [saas, meeting, demo, storage, k8s, static-variable]
prev: "[[Meeting-0819]]"
next: "[[Meeting-0909]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 26/08/2023

## Mục tiêu
- Review: tạo database tự động khi tạo tenant; vẽ Overview architect K8s
- Xử lý biến static; demo tạo tenant và login multi-tenant

## Các ý chính

### Demo target tuần này
```
Tạo tenant → login vào HRM với tenantCode tương ứng → upload file lên storage
```

### SQL User khi tạo DB mới
- Tạo user SQL như `sa` hoặc user HRM để tenant có thể kết nối

### Upload file lớn
- ⚠️ Không dùng tính năng xuất file lớn (quá nặng tài nguyên)

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Minh + Thịnh + Phúc + Tú | 09/09 | Dựng HRM11 vào Kubernetes và Docker |
| Sáng + Hiếu | 09/09 | Cấu hình App mobile lên storage |
| Vũ + Tùng | 09/09 | Tìm giải pháp biến static |
| Phúc | 09/09 | Liên hệ SaveMoney dựng server thành công → xóa → dựng lại → làm tài liệu |
