---
type: meeting
title: "Họp SaaS #03 — 29/07/2023"
date: 2023-07-29
tags: [saas, meeting, k8s, minio, storage, server]
prev: "[[Meeting-0722]]"
next: "[[Meeting-0805]]"
related: ["[[SaaS-Tong-Quan-Kien-Truc]]", "[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 29/07/2023

## Mục tiêu
- Review nội dung tuần trước: dựng Docker MVC + SQL, tìm hiểu volume Kubernetes, MinIO
- Thuê máy ảo và SaveMoney hướng dẫn cài đặt Kubernetes

## Các ý chính

### Đề xuất cấu hình thuê máy ảo
- Xem resource (RAM, CPU...) của web HRM theo quy mô: 500 NV, 2000 NV...
- Thuê 3 server

### Test 1 source dùng nhiều database
- Kiểm tra tính khả thi của multi-DB từ 1 codebase

### MinIO — Storage
- Xử lý upload MinIO
- Check file riêng dùng chung như `lang`, `field_info` → cần xử lý không copy trùng lặp

### Kubernetes
- Tìm hiểu thêm về volume trong Kubernetes
- Demo migrate data từ source sang DB container trong Docker

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Tung.Ly | 05/08 | Check 1 source dùng nhiều DB |
| Tung.Ly | 05/08 | Kiểm tra RAM, CPU để đề xuất thuê server ảo |
| Phúc | 01/08 | Đề xuất thuê server ảo |
| Phúc | 03/08 | SaveMoney hỗ trợ hướng dẫn cài đặt Kubernetes |
| Minh | 05/08 | Demo migrate data từ source sang DB container Docker |
| Tú | 05/08 | Tìm hiểu thêm về volume trong Kubernetes |
| Sáng | 05/08 | Xử lý upload MinIO, check file riêng dùng chung |
