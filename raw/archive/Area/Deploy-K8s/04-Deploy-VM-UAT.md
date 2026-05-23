---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - uat
  - vm
  - sizing
  - mssql
  - redis
created: 2026-05-07
updated: 2026-05-07
description: Tài nguyên VM môi trường UAT — DB Server và Redis, do VNR cung cấp
source-file: 
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[07-Deploy-VM-PROD]]"
  - "[[05-Deploy-Sizing-PROD]]"
---

# Deploy VM UAT — Tài nguyên Máy chủ UAT

> Thông tin tài nguyên server cần chuẩn bị cho môi trường UAT.  
> **VNR** cung cấp và quản lý toàn bộ.  
> UAT là môi trường nghiệm thu — KH test trước khi go-live PROD.

---

## Danh sách máy chủ

| STT | Loại | Tên máy chủ | Địa chỉ IP | Hệ điều hành | Username | Số server | CPU (Core) | RAM (GB) | SSD (GB) | Mô tả |
|-----|------|-------------|------------|--------------|----------|-----------|-----------|----------|----------|-------|
| 1 | Database Server | *(VNR cấp)* | *(điền)* | *(VNR chuẩn)* | *(điền)* | 1 | 8 | 64 | 300 | MS SQL Server 2019 |
| 2 | Middleware (Redis) | *(VNR cấp)* | *(điền)* | *(VNR chuẩn)* | *(điền)* | 1 | 2 | 4 | 128 | Redis version 7.4 |

---

## Chi tiết cấu hình

### DB Server — MS SQL Server 2019

| Thông số | Giá trị |
|---------|---------|
| Phần mềm | MS SQL Server 2019 |
| CPU | 8 Core |
| RAM | 64 GB |
| Storage layout | /data — 200 GB (SSD), /backup — 100 GB |
| Tổng SSD | 300 GB |
| HA | Standalone (UAT không cần HA) |

**Lưu ý:**
- DB UAT restore từ backup PROD hoặc dữ liệu test riêng
- Tham chiếu backup file: `HRMPRO12_VNPAY_20250423.rar` (dự án VnPay)
- Connection string inject qua K8s Secret

### Redis Sentinel — v7.4

| Thông số | Giá trị |
|---------|---------|
| Phần mềm | Redis 7.4 |
| CPU | 2 Core |
| RAM | 4 GB |
| Storage | 128 GB |
| Mode | Sentinel (có thể standalone cho UAT) |
| Port mặc định | 6379 |

**Lưu ý:**
- Password inject qua K8s Secret
- UAT có thể dùng single node Redis thay Sentinel để đơn giản hóa

---

## So sánh UAT vs PROD

| Thông số | UAT (VNR) | PROD (KH) |
|---------|-----------|-----------|
| DB số server | 1 | 2 |
| DB CPU | 8 Core | 8 Core × 2 |
| DB RAM | 64 GB | 16 GB × 2 |
| DB SSD | 300 GB | 100 GB × 2 |
| Redis số server | 1 | 3 |
| Redis CPU | 2 Core | 8 Core × 3 |
| Redis RAM | 4 GB | 32 GB × 3 |
| Redis mode | Standalone / Sentinel | Sentinel HA |
| OS DB | VNR chuẩn | redhat 8.10 |
| OS Redis | VNR chuẩn | Ubuntu 24 |

> UAT nhỏ hơn PROD — dùng để test chức năng, không test performance PROD thực tế.  
> Test tải dùng sizing riêng: [[06-Deploy-Sizing-Loadtest]]

---

## Ghi chú

- IP, Username: điền sau khi server được cấp phát
- Firewall: mở port 1433 (MSSQL), 6379 (Redis) trong internal K8s namespace
- Xem yêu cầu mở kết nối: [[02-Deploy-Scenario]] Phase II
