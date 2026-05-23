---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - prod
  - vm
  - mssql
  - redis
  - sizing
created: 2026-05-07
updated: 2026-05-07
description: Tài nguyên VM môi trường PROD — MSSQL HA và Redis Sentinel 3-node do KH cung cấp
source-file: 
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[04-Deploy-VM-UAT]]"
  - "[[05-Deploy-Sizing-PROD]]"
---

# Deploy VM PROD — Tài nguyên Máy chủ PROD

> Thông tin tài nguyên server cho môi trường PROD.  
> **KH (Khách hàng)** cung cấp, cài đặt và vận hành toàn bộ.  
> VNR chỉ cung cấp yêu cầu kỹ thuật — không có quyền truy cập vật lý.

---

## Danh sách máy chủ

| STT | Loại | Tên máy chủ | Địa chỉ IP | Hệ điều hành | Username | Số server | CPU (Core) | RAM (GB) | SSD (GB) | Mô tả |
|-----|------|-------------|------------|--------------|----------|-----------|-----------|----------|----------|-------|
| 1 | MSSQL Database Server | *(KH cấp)* | *(điền)* | redhat 8.10 | *(KH)* | **2** | 8 | 16 | 100 | MS SQL Server 2019 |
| 2 | Middleware (Redis) | *(KH cấp)* | *(điền)* | Ubuntu 24 (or Latest) | *(KH)* | **3** | 8 | 32 | 150 | Redis Sentinel 7.4 |

---

## Chi tiết cấu hình

### DB Server — MS SQL Server 2019 (2 nodes)

| Thông số | Node 1 | Node 2 |
|---------|--------|--------|
| OS | redhat 8.10 | redhat 8.10 |
| CPU | 8 Core | 8 Core |
| RAM | 16 GB | 16 GB |
| SSD | 100 GB | 100 GB |
| Storage layout | /data-200G, /backup-100G | /data-200G, /backup-100G |
| Role | Primary | Secondary / Always On |

> ❓ UNKNOWN: Cấu hình HA cụ thể (Always On AG / Failover Cluster) — cần xác nhận với KH.

**Yêu cầu VNR gửi KH:**
- Connection string format: `Server=<ip>;Database=HRM;User Id=<user>;Password=<pass>;`
- Cần tạo DB user riêng cho HRM (không dùng sa)
- Grant quyền: `db_datareader`, `db_datawriter`, `db_ddladmin` (cho migration)
- Port: 1433 (default)

### Redis Sentinel — v7.4 (3 nodes)

| Thông số | Node 1 (Master) | Node 2 (Replica) | Node 3 (Replica) |
|---------|----------------|-----------------|-----------------|
| OS | Ubuntu 24 | Ubuntu 24 | Ubuntu 24 |
| CPU | 8 Core | 8 Core | 8 Core |
| RAM | 32 GB | 32 GB | 32 GB |
| SSD | 150 GB | 150 GB | 150 GB |
| Role | Master | Replica | Replica + Sentinel |

**Cấu hình Sentinel:**
- Port Redis: 6379
- Port Sentinel: 26379
- Min sentinels for failover: 2
- Quorum: 2

**Yêu cầu VNR gửi KH:**
- Connection string format Sentinel: `<sentinel-host>:26379,serviceName=mymaster,password=<pass>`
- Cần password auth cho cả Redis và Sentinel
- Inject qua K8s Secret

---

## So sánh UAT vs PROD

| Thông số | UAT (VNR) | PROD (KH) | Lý do khác biệt |
|---------|-----------|-----------|-----------------|
| DB số server | 1 | 2 | HA cho PROD |
| DB RAM | 64 GB | 16 GB × 2 | UAT cần nhiều RAM để chứa data test |
| DB SSD | 300 GB | 100 GB × 2 | UAT gộp /data + /backup |
| Redis số server | 1 | 3 | Sentinel HA 3-node |
| Redis CPU | 2 Core | 8 Core × 3 | PROD chịu tải thực tế |
| Redis RAM | 4 GB | 32 GB × 3 | PROD cache nhiều hơn |
| OS DB | VNR chuẩn | **redhat 8.10** | KH chuẩn hóa enterprise |
| OS Redis | VNR chuẩn | **Ubuntu 24** | KH chuẩn hóa |

---

## Checklist bàn giao (KH → VNR)

- [ ] IP address của DB server 1 và 2
- [ ] IP address của 3 Redis nodes + Sentinel endpoints
- [ ] DB username / password (inject vào Vault / K8s Secret)
- [ ] Redis password (inject vào Vault / K8s Secret)
- [ ] Xác nhận port 1433 và 6379/26379 đã mở trong internal namespace
- [ ] Xác nhận storage /data và /backup đã mount đúng

---

## Ghi chú

- Tất cả credentials inject qua HashiCorp Vault hoặc K8s Secret — **không hardcode**
- VNR không có access trực tiếp vào server PROD — mọi thay đổi qua KH
- Xem yêu cầu mở kết nối: [[02-Deploy-Scenario]] Phase II
- So sánh sizing K8s: [[05-Deploy-Sizing-PROD]]
