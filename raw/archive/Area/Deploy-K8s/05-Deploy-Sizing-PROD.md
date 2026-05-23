---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - prod
  - sizing
  - resource
created: 2026-05-07
updated: 2026-05-07
description: Sizing tài nguyên K8s PROD — CPU/RAM request/limit và số replicas từng service HRM
source-file: 
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[06-Deploy-Sizing-Loadtest]]"
  - "[[07-Deploy-VM-PROD]]"
  - "[[08-Deploy-ServiceInfo]]"
---

# Deploy Sizing PROD — Tài nguyên K8s / OCP

> Bảng sizing tài nguyên Kubernetes cho môi trường PROD thông thường.  
> Đây là sizing **vận hành thực tế** — không phải loadtest.  
> Đơn vị: CPU — Core | RAM — Gi (1 Gi = 1024 Mi)

---

## Bảng sizing PROD

| TT | Service Name | Mô tả | CPU Req | CPU Limit | RAM Req (Gi) | RAM Limit (Gi) | Replicas | Tổng RAM (Gi) | Tổng CPU |
|----|-------------|-------|---------|-----------|-------------|----------------|---------|--------------|---------|
| 1 | hrm-presentation-empportal | Giao diện nhân viên | 1 | 4 | 2 | 8 | 2 | 32 | 16 |
| 2 | hrm-presentation-hr-service | Service xử lý dữ liệu HR | 1 | 4 | 2 | 8 | 6 | 48 | 24 |
| 3 | hrm-presentation-system-service | Service phân quyền hệ thống | 1 | 2 | 1 | 4 | 4 | 16 | 8 |
| 4 | hrm-presentation-main | Giao diện quản trị HR | 1 | 2 | 1 | 8 | 6 | 48 | 12 |
| 5 | hrm-sc-service-apicore | API core nghiệp vụ | 1 | 4 | 2 | 8 | 6 | 48 | 24 |
| 6 | integration-service-apicore | Service tích hợp bên ngoài | 1 | 2 | 1 | 4 | 2 | 8 | 4 |
| 7 | sc-service-identity | Xác thực & phân quyền (SSO) | 1 | 4 | 2 | 8 | 2 | 16 | 8 |
| 8 | presentation-windows-servicecore | Background job, email, Hangfire | 1 | 2 | 1 | 4 | 1 | 4 | 2 |
| | | | | | | **TỔNG** | | **220 Gi** | **98 Core** |

---

## Phân tích

### Service nặng nhất (replicas cao)
| Service | Replicas | Lý do |
|---------|---------|-------|
| hrm-presentation-hr-service | 6 | Service core xử lý data HR, traffic cao nhất |
| hrm-presentation-main | 6 | Giao diện quản trị — nhiều user đồng thời |
| hrm-sc-service-apicore | 6 | API gateway nghiệp vụ — bottleneck tiềm năng |
| hrm-presentation-system-service | 4 | Phân quyền — hit mỗi request |

### Service đơn lẻ (1 replica)
| Service | Lý do |
|---------|-------|
| presentation-windows-servicecore | Background job, Hangfire scheduler — chỉ cần 1 instance |

---

## Resource Requests & Limits — Ý nghĩa

| Thông số | Ý nghĩa | Tác động |
|---------|---------|---------|
| CPU Request | Guaranteed CPU — K8s schedule pod lên node có đủ | Pod không bị evict |
| CPU Limit | Tối đa CPU được dùng — throttle nếu vượt | Tránh 1 pod chiếm hết CPU |
| RAM Request | Guaranteed Memory | Pod không bị evict khi node đủ memory |
| RAM Limit | Tối đa RAM — OOM Kill nếu vượt | Cần set đủ lớn tránh OOM |

> ⚠️ **Lưu ý:** RAM Limit quan trọng với .NET — GC có thể dùng nhiều RAM khi load cao.

---

## Yêu cầu cluster tối thiểu (PROD)

| Thông số | Tối thiểu |
|---------|----------|
| Tổng CPU cần (requests) | 8 Core (sum requests) |
| Tổng CPU allocated (limits) | 98 Core |
| Tổng RAM cần (requests) | 13 Gi (sum requests) |
| Tổng RAM allocated (limits) | **220 Gi** |
| Số pods tối đa | 29 pods |

> K8s cluster cần headroom ~20% → cần cluster **≥ 264 Gi RAM** và **≥ 120 Core CPU** total.

---

## So sánh PROD vs Loadtest

| Metric | PROD | Loadtest | Delta |
|--------|------|---------|-------|
| Tổng RAM Limited | 220 Gi | 236 Gi | +7% |
| Tổng CPU Limited | 98 Core | 106 Core | +8% |
| Replicas lớn nhất | 6 | 8 | +33% |

> Loadtest dùng resource cao hơn PROD ~10% để tìm điểm giới hạn. Xem: [[06-Deploy-Sizing-Loadtest]]

---

## Ghi chú

- Autoscale (HPA): scale theo CPU 70% hoặc MEM 80%
- Xem tiêu chuẩn K8s: [[03-Deploy-Checklist-App]] mục Resource Requests & Limits
- Sizing này là estimate — cần điều chỉnh sau loadtest thực tế
