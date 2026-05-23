---
type: source
code: f8c4n
description: "Yêu cầu hạ tầng hồ sơ thầu SSI Chương 10: hardware specs, OS, network model, storage/backup, database HA, client requirements, third-party software"
tags:
  - ssi
  - ha-tang
  - infrastructure
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
source-file: "raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/146_10.1.1 ... 182_10.8.6"
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
---

# Source: SSI — Yêu cầu Hạ tầng (Chương 10)

## Tóm tắt

Chương 10 hồ sơ thầu SSI định nghĩa toàn bộ yêu cầu về cơ sở hạ tầng phần cứng và phần mềm. Gồm 8 nhóm: tổng quan hạ tầng (10.1), cấu hình máy chủ (10.2), hệ điều hành (10.3), mạng (10.4), lưu trữ/backup (10.5), cơ sở dữ liệu (10.6), máy trạm (10.7), và phần mềm third-party (10.8). Nhà thầu đề xuất topology 5-server (1 Proxy + 2 App + 2 DB) với Active/Passive HA.

## Key Takeaways

- **Topology Production**: 1 Nginx Proxy/LB + 2 App Server + 2 DB Server (Active/Passive) + DR Site
- **App Server**: Windows Server 2019, 16 cores, 64GB RAM, 240GB SSD
- **DB Server**: SQL Server 2019 Standard+, Windows Server 2019, 16 cores, 128GB RAM, 512GB SSD
- **HA DB**: AlwaysOn AG hoặc Log Shipping/Mirroring; Passive node tự động failover
- **Kết nối**: Cáp quang, tốc độ tối thiểu 1Gbps giữa các server/storage
- **Backup**: Full + Incremental, hỗ trợ khối lượng dữ liệu lớn, mã hóa at-rest
- **OS**: Windows Server 2019+ (App+DB), Linux (Proxy); hỗ trợ update/patch định kỳ
- **Database**: SQL Server phổ biến, hỗ trợ HA/DR đầy đủ, có tài liệu vận hành
- **Client**: Windows 7+, đa trình duyệt (Chrome, Firefox, Edge, Safari)
- **Third-party**: full license, tương thích, tuân thủ security policy SSI

## Chi tiết theo nhóm

### 10.1 — Tổng quan hạ tầng (7 items)

```
Server Topology đề xuất:
┌─────────────────────────────────────────────────┐
│  Internet / SSI Internal Network                │
└────────────────────┬────────────────────────────┘
                     │ HTTPS
          ┌──────────▼──────────┐
          │  Server Proxy (LB)  │  Linux, Nginx
          │  4 cores / 8GB RAM  │  50GB SSD
          └────────┬────────────┘
          ┌────────▼─────────────────────────────┐
          │     Application Layer (Internal)     │
          │  ┌─────────────┐  ┌─────────────┐   │
          │  │  App Srv 1  │  │  App Srv 2  │   │
          │  │  Win 2019   │  │  Win 2019   │   │
          │  │  16c/64GB   │  │  16c/64GB   │   │
          │  │  240GB SSD  │  │  240GB SSD  │   │
          │  └──────┬──────┘  └──────┬──────┘   │
          └─────────┼────────────────┼───────────┘
          ┌─────────▼────────────────▼───────────┐
          │       Data Layer                     │
          │  ┌─────────────┐  ┌─────────────┐   │
          │  │   DB Srv 1  │  │   DB Srv 2  │   │
          │  │  SQL 2019   │  │  SQL 2019   │   │
          │  │  ACTIVE     │←→│  PASSIVE    │   │
          │  │  16c/128GB  │  │  16c/128GB  │   │
          │  │  512GB SSD  │  │  512GB SSD  │   │
          │  └─────────────┘  └─────────────┘   │
          └──────────────────────────────────────┘
```

- Hỗ trợ Active/Passive hoặc Active/Active clustering + Load Balancing
- Độ tin cậy cao, khả năng nâng cấp mở rộng (scale-up/out)
- Tương thích phiên bản mới nhất của hardware/software
- Cloud: phải công bố SLA tham chiếu

### 10.2 — Cấu hình máy chủ đề xuất (4 items)

| Server | OS | CPU | RAM | Storage |
|--------|-----|-----|-----|---------|
| Proxy/LB | Linux | 4 cores | 8GB | 50GB SSD |
| App Server 1 | Windows Server 2019 | 16 cores | 64GB | 240GB SSD |
| App Server 2 | Windows Server 2019 | 16 cores | 64GB | 240GB SSD |
| DB Server 1 (Active) | Windows Server 2019 | 16 cores (min) | 128GB | 512GB SSD |
| DB Server 2 (Passive) | Windows Server 2019 | 16 cores (min) | 128GB | 512GB SSD |

### 10.3 — Hệ điều hành (3 items)
- OS phổ biến, được hỗ trợ tốt
- Tương thích hoàn toàn với hardware + application đề xuất
- Nhà thầu hỗ trợ SSI update/patch phiên bản OS mới

### 10.4 — Mạng (3 items)
- Cung cấp mô hình mạng, tương thích hệ thống SSI hiện tại
- Giao diện quản lý lưu lượng: **tốc độ 1Gbps**
- Kết nối server/storage: **cáp quang, tối thiểu 1Gbps**

### 10.5 — Storage & Backup (6 items)
- Đề xuất hệ thống lưu trữ + thiết bị backup
- Hỗ trợ backup khối lượng lớn, không ảnh hưởng hoạt động
- Khả năng nâng cấp, mở rộng storage
- Tích hợp hiệu quả với hệ thống backup SSI hiện có
- Kết nối cáp quang 1Gbps+ giữa server/storage
- Tương thích hoàn toàn với hardware máy chủ đề xuất

### 10.6 — Database (4 items)
- CSDL phổ biến, sử dụng rộng rãi cho hệ thống lớn
- Tài liệu hướng dẫn cài đặt/vận hành/quản trị/khôi phục
- Mô hình triển khai DB hỗ trợ **tính sẵn sàng cao (HA)**
- Giải pháp **DR (Disaster Recovery)** cho Database

### 10.7 — Máy trạm Client (4 items)
- Hỗ trợ Windows 7+ (phiên bản mới nhất khuyến nghị)
- **Đa trình duyệt**: IE, Chrome, Firefox, Edge, Safari
- Performance dự kiến CPU/RAM đối với phần mềm cần cài
- Danh sách phần mềm/công cụ cần cài đặt trên máy trạm

### 10.8 — Phần mềm Third-party (6 items)
- Mô tả chi tiết phần mềm third-party cần thiết
- Tương thích hoàn toàn với phần cứng/ứng dụng đề xuất
- **Full license** (không dùng bản không bản quyền)
- Tài liệu hướng dẫn vận hành/quản trị third-party
- Java (nếu dùng): phải dùng Oracle JDK có bản quyền
- Tuân thủ chính sách **An Toàn Bảo Mật SSI**; được kiểm tra định kỳ

## Trích dẫn quan trọng

> Mô tả kiến trúc hệ thống: Client Layer — người dùng truy cập qua Internet (web/mobile), tất cả request đi qua HTTPS (TLS). DMZ Zone — WAF lọc các tấn công OWASP (XSS, SQL Injection, CSRF...), Reverse Proxy/Load Balancer phân phối request theo Round Robin / Least Connection, Health check loại bỏ node lỗi.

> Database (SQL Server): Mô hình Active/Passive (Failover). Có thể triển khai AlwaysOn Availability Group hoặc Log Shipping/Mirroring. Passive node sẵn sàng takeover khi Active lỗi.

> Kết nối các máy chủ, các thiết bị lưu trữ và sao lưu dữ liệu phải là cáp quang và tốc độ tối thiểu 1Gbps.

## Liên kết

- [[wiki/projects/SSI-Project]] — Project page
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Hồ sơ thầu tổng thể
- [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] — Kiến trúc giải pháp (system diagram)
- [[wiki/architecture/HRM-Deployment-Architecture]] — Deploy architecture HRM hiện tại
- [[wiki/architecture/p9k2w-k8s-hrm-service-architecture]] — K8s sizing VM
