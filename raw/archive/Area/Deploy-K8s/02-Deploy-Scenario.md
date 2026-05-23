---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - devops
  - scenario
  - checklist
created: 2026-05-07
updated: 2026-05-07
description: Kịch bản chi tiết triển khai HRM K8s — 7 phase từ hạ tầng đến bảo mật ANSP
source-file: Flow-trien-khai-he-thong.md, Flow-UAT.md, Flow-Golive.md
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[01-Deploy-QnA]]"
  - "[[03-Deploy-Checklist-App]]"
  - "[[04-Deploy-VM-UAT]]"
  - "[[07-Deploy-VM-PROD]]"
---

# Deploy Scenario — Kịch bản Chi tiết Triển khai

> Danh sách đầy đủ các bước triển khai từ hạ tầng → ứng dụng → test tải → bảo mật.  
> Phân công rõ VNR / KH cho từng task.  
> Nguồn: tài liệu Q&A + Flow-trien-khai + Flow-UAT + Flow-Golive.

---

## Bảng kịch bản tổng thể

| TT | Nội dung | Người thực hiện | Người backup | Phụ thuộc | Downtime | Trạng thái |
|----|----------|-----------------|--------------|-----------|----------|------------|
| **I** | **TRIỂN KHAI HẠ TẦNG** | | | | | |
| 1 | Xin cấp namespace K8s/OCP | KH | — | — | Không | ⬜ |
| 2 | Xin cấp database MSSQL (+ storage /data, /backup) | KH | — | Task 1 | Không | ⬜ |
| 3 | Xin cấp middleware Redis Sentinel | KH | — | Task 1 | Không | ⬜ |
| **II** | **MỞ KẾT NỐI** | | | | | |
| 4 | Mở kết nối ứng dụng → DB, Redis (internal) | KH (network) + VNR (verify) | — | Task 2, 3 | Không | ⬜ |
| 5 | Mở kết nối internal giữa các service (Network Policy) | KH | — | Task 1 | Không | ⬜ |
| 6 | Mở outbound: S3, smtp.gmail.com, SSO, chấm công | KH (network) + VNR (danh sách) | — | Task 4 | Không | ⬜ |
| **III** | **XIN CẤP DOMAIN** | | | | | |
| 7 | Xin cấp domain cho ứng dụng | KH | — | Task 1 | Không | ⬜ |
| **IV** | **TRIỂN KHAI ỨNG DỤNG** | | | | | |
| 8 | VNR viết Helm chart cho từng service | VNR | — | Task 1 | Không | ⬜ |
| 9 | KH review + approve Helm chart | KH | — | Task 8 | Không | ⬜ |
| 10 | CI build image + push lên KH S3 | VNR (CI pipeline) | — | Task 9 | Không | ⬜ |
| 11 | KH scan security image | KH | — | Task 10 | Không | ⬜ |
| 12 | KH CD deploy lên K8s | KH (CD pipeline) | — | Task 11 | Không | ⬜ |
| 13 | VNR kiểm tra ứng dụng sau deploy (smoke test) | VNR | — | Task 12 | Không | ⬜ |
| 14 | Fix bug phát sinh khi deploy | VNR | — | Task 13 | Không | ⬜ |
| **V** | **CẤU HÌNH ỨNG DỤNG** | | | | | |
| 15 | Tích hợp SSO với KH | VNR + KH | — | Task 12 | Không | ⬜ |
| 16 | Khởi tạo dữ liệu người dùng ban đầu | VNR | — | Task 15 | Không | ⬜ |
| 17 | Cấu hình email (smtp.gmail.com) | VNR | — | Task 6 | Không | ⬜ |
| **VI** | **TEST TẢI** | | | | | |
| 18 | VNR thực hiện test tải (Loadtest sizing) | VNR | — | Task 13 | Không | ⬜ |
| 19 | Đánh giá kết quả, so sánh với baseline | VNR + KH | — | Task 18 | Không | ⬜ |
| **VII** | **ĐÁNH GIÁ BẢO MẬT ANSP** | | | | | |
| 20 | KH/ANSP thực hiện penetration test | KH (ANSP) | — | Task 12 | Không | ⬜ |
| 21 | VNR xử lý các lỗ hổng bảo mật được phát hiện | VNR | — | Task 20 | Không | ⬜ |

---

## Phase chi tiết

### Phase I — Triển khai hạ tầng
**Đầu ra cần có trước khi deploy app:**
- Namespace K8s/OCP đã cấp
- MSSQL: IP, port, credentials, /data và /backup đã mount
- Redis Sentinel: IP, port, password, cấu hình HA 3 node

### Phase II — Mở kết nối
**VNR cần cung cấp cho KH danh sách:**
```
Internal:
  - hrm-presentation-* → mssql:1433
  - hrm-presentation-* → redis:6379
  - [xem ma trận đầy đủ tại [[09-Deploy-Network]]]

Outbound (external):
  - * → s3.amazonaws.com / KH S3 endpoint : 443
  - windows-servicecore → smtp.gmail.com : 587
  - * → SSO endpoint : 443
  - integration-service → 3rd party chấm công : (cần xác nhận)
```

### Phase IV — Triển khai ứng dụng
**Helm chart cần có cho 8 services:**
- `hrm-presentation-empportal`
- `hrm-presentation-hr-service`
- `hrm-presentation-system-service`
- `hrm-presentation-main`
- `hrm-sc-service-apicore`
- `integration-service-apicore`
- `sc-service-identity`
- `presentation-windows-servicecore`

**Mỗi Helm chart bao gồm:**
- Deployment (replicas, resource requests/limits)
- Service (port 8080)
- ServiceMonitor (port 9090 — metrics)
- ConfigMap reference
- Secret reference (Vault injection)
- HorizontalPodAutoscaler

### Phase VI — Test tải
> Tham khảo kết quả loadtest VnPay: `Report/kết quả loadtest-29-12-2025`  
> Sizing resource cho loadtest: [[06-Deploy-Sizing-Loadtest]]

---

## Luồng deploy UAT vs PROD

| Bước | UAT | PROD |
|------|-----|------|
| Phê duyệt | Leader Dev | PO/PM |
| Deploy | QTUD | QTUD |
| Test | Tester | Tester (smoke test) |
| Review | Không bắt buộc | Bắt buộc |
| Rollback | Ít dùng | Bắt buộc có plan |
| Hotfix | Không | Có |

---

## Ghi chú
- Task JRSM: điền link Jira khi có
- Cột TG thực hiện, TG bắt đầu/kết thúc: điền khi lên lịch chính thức
- Downtime: tất cả task trên đều **không có downtime** cho lần deploy đầu (greenfield)
