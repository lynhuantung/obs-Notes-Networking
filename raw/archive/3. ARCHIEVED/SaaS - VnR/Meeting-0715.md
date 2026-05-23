---
type: meeting
title: "Họp SaaS #01 — 15/07/2023"
date: 2023-07-15
tags: [saas, meeting, k8s, architecture]
next: "[[Meeting-0722]]"
related: ["[[SaaS-Tong-Quan-Kien-Truc]]", "[[SaaS-Tien-Trinh-Phat-Trien]]"]
---

# Biên Bản Họp — 15/07/2023

## Mục tiêu
- Hiểu về Kubernetes
- Vẽ flow đăng ký HRM từ chợ phần mềm MISA

## Các ý chính

### Flow đăng ký HRM từ MISA Marketplace
- Tung.Ly vẽ flow về kiến trúc Kubernetes cho HRM

### Tìm hiểu kiến trúc Kubernetes & Docker
- **Pod** — đơn vị nhỏ nhất trong K8s
- **Docker** — container runtime
- **Node** — máy chủ chạy pod

### HRM cần điều chỉnh để chạy multi-tenant
| Điểm cần sửa | Chi tiết |
|--------------|---------|
| Chỉnh file config | Không hardcode, lưu nơi khác (có thể override per-tenant) |
| Hàm get config | Cần abstract để inject theo tenant |
| Biến static, memory cache | Phải scope theo tenant, không dùng chung |
| Cách ghi log | Cần phân tách log theo tenant |

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Tung.Ly | 16/07 | Vẽ Flow đăng ký HRM từ chợ phần mềm MISA |
