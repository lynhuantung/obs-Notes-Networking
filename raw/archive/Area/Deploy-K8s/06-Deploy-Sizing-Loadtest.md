---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - loadtest
  - sizing
  - performance
created: 2026-05-07
updated: 2026-05-07
description: Sizing K8s PROD Loadtest — resource cao hơn PROD để test giới hạn hiệu năng hệ thống
source-file: kết quả loadtest-29-12-2025.md
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[05-Deploy-Sizing-PROD]]"
  - "[[07-Deploy-VM-PROD]]"
---

# Deploy Sizing Loadtest — Tài nguyên K8s PROD Loadtest

> Sizing tài nguyên Kubernetes khi chạy test tải (Loadtest).  
> Resource **cao hơn PROD thường** — mục đích tìm điểm giới hạn hiệu năng, không phải vận hành.  
> Tham chiếu thực tế: kết quả loadtest VnPay 29-12-2025.

---

## Bảng sizing Loadtest

| TT | Service Name | Mô tả | CPU Req | CPU Limit | RAM Req (Gi) | RAM Limit (Gi) | Replicas | Tổng RAM (Gi) | Tổng CPU |
|----|-------------|-------|---------|-----------|-------------|----------------|---------|--------------|---------|
| 1 | hrm-presentation-empportal | Giao diện nhân viên | 4 | 6 | 5 | 8 | 2 | 28 | 30 |
| 2 | hrm-presentation-hr-service | Service xử lý dữ liệu HR | 5 | 5 | 5 | 10 | 6 | 60 | 12 |
| 3 | hrm-presentation-system-service | Service phân quyền | 2 | 2 | 2 | 4 | 6 | 24 | 12 |
| 4 | hrm-presentation-main | Giao diện quản trị HR | 1 | 2 | 2 | 1 | 8 | 48 | 24 |
| 5 | hrm-sc-service-apicore | API core nghiệp vụ | 3 | 3 | 3 | 6 | 8 | 48 | 4 |
| 6 | integration-service-apicore | Service tích hợp | 1 | 2 | 2 | 2 | 2 | 8 | 8 |
| 7 | sc-service-identity | Xác thực & SSO | 1 | 4 | 4 | 8 | 2 | 16 | 4 |
| 8 | presentation-windows-servicecore | Background job | 1 | 4 | 4 | 4 | 1 | 4 | — |
| | | | | | | **TỔNG** | | **236 Gi** | **106 Core** |

---

## So sánh PROD vs Loadtest

| Metric | PROD | Loadtest | Delta | Ghi chú |
|--------|------|---------|-------|---------|
| Tổng RAM Limited | 220 Gi | 236 Gi | **+16 Gi (+7%)** | Loadtest cần headroom |
| Tổng CPU Limited | 98 Core | 106 Core | **+8 Core (+8%)** | |
| empportal CPU Request | 1 | 4 | **+4x** | Loadtest cho phép burst mạnh hơn |
| hr-service CPU Request | 1 | 5 | **+5x** | Service bottleneck chính |
| main replicas | 6 | 8 | **+2 replicas** | Scale out để chịu tải |
| sc-service-apicore replicas | 6 | 8 | **+2 replicas** | API core là hotspot |
| system-service replicas | 4 | 6 | **+2 replicas** | Phân quyền bị hit nhiều |

---

## Phân tích thay đổi đáng chú ý

### hrm-presentation-hr-service
- CPU Request tăng 1 → 5 (5x)
- Đây là service xử lý data HR — bottleneck khi concurrent users cao
- Loadtest cần đủ CPU để không bị throttle, mới đo được throughput thực

### hrm-presentation-main + hrm-sc-service-apicore
- Replicas tăng từ 6 → 8
- Mục đích: test horizontal scaling — kiểm tra load balancing hoạt động đúng

### presentation-windows-servicecore
- CPU Limit tăng 2 → 4 (2x)
- Background job chạy nhiều hơn khi load cao (queue processing, Hangfire jobs)

---

## Kết quả loadtest tham chiếu

> Loadtest VnPay 29-12-2025 (xem: `Report/kết quả loadtest-29-12-2025`)  
> Kết quả chứa screenshots Grafana — cần đọc file gốc để xem số liệu cụ thể.

**Các chỉ số cần đánh giá sau loadtest:**
- [ ] TPS (Transactions per second) đỉnh
- [ ] Response time P95, P99
- [ ] Error rate dưới tải
- [ ] CPU/RAM utilization khi tải cao nhất
- [ ] Pod scale-out behavior (HPA hoạt động đúng không)
- [ ] DB connection pool exhaustion
- [ ] Redis hit rate

---

## Ghi chú

- Loadtest sizing chỉ dùng trong môi trường test — không apply lên PROD thông thường
- Sau loadtest: điều chỉnh lại [[05-Deploy-Sizing-PROD]] nếu thấy PROD sizing chưa đủ
- Tham khảo báo cáo K8s resource: `Report/BÁO CÁO PHÂN TÍCH TÀI NGUYÊN KUBERNETES CLUSTER`
