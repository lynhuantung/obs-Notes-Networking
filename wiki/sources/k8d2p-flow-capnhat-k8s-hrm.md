---
type: source
code: k8d2p
domain: devops
tags:
  - k8s
  - deploy
  - cicd
  - kubernetes
created: 2026-05-07
updated: 2026-05-07
description: "Quy trình cập nhật HRM lên Kubernetes: phân chia CI (VNR) vs CD (khách hàng), luồng UAT và Production, Config/Secret K8s."
source-file: "raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/flow/Flow-CapNhat-K8s-CircleK 1.md"
related:
  - "[[wiki/flows/k8d2p-flow-deploy-k8s-hrm]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/flows/Flow-Deploy-HRM]]"
  - "[[wiki/concepts/HRM-Deploy-Checklist]]"
---

# Source: Quy Trình Cập Nhật HRM Lên Kubernetes

## Tóm tắt

Tài liệu mô tả quy trình CI/CD khi triển khai HRM lên môi trường Kubernetes do khách hàng quản lý. Trách nhiệm được chia rõ: VNR chỉ thực hiện phần Build & Push image, còn Deploy lên cluster hoàn toàn do khách hàng (QTUD) thực hiện vì VNR không có quyền truy cập trực tiếp vào hạ tầng K8s. Tài liệu bao gồm 2 luồng riêng biệt: cập nhật UAT (phê duyệt Leader Dev) và cập nhật Production (phê duyệt PO/PM), kèm checklist chi tiết cho từng bước. Config và Secret trên K8s do khách hàng quản lý, VNR cần đảm bảo source code đọc config từ ConfigMap/Secret thay vì hardcode.

## Key Takeaways

- **Ranh giới trách nhiệm cứng**: VNR = CI (build + push), Khách hàng = CD (deploy lên K8s)
- **2 luồng deploy**: UAT (Leader Dev duyệt) vs Production (PO/PM duyệt + review bắt buộc sau deploy)
- **Security Scan**: khách hàng scan image trước khi deploy — VNR cần tuân thủ security baseline
- **K8s Config/Secret**: ConfigMap + HashiCorp Vault do khách hàng quản lý; VNR không hardcode trong `appsettings.json`
- **Rollback**: Production bắt buộc có rollback plan và hotfix plan trước khi deploy
- **Smoke test Production**: 5 điểm kiểm tra bắt buộc (login main, login portal, version, chức năng chính)
- **Rủi ro cao nhất**: image bị reject security scan → delay; DB migration lỗi → phải rollback toàn bộ

## Trích dẫn quan trọng

> VNR **không có quyền** trực tiếp thao tác trên K8s cluster của khách hàng.

> **VNR cần**: Cập nhật source code để đọc config từ ConfigMap/Secret thay vì hardcode trong `appsettings.json`

> | Giai đoạn | Đơn vị thực hiện |
> |-----------|-----------------|
> | CI — Build & Push image | VNR |
> | CD — Deploy lên K8s | Khách hàng |

> Smoke test Production bắt buộc:
> - Đăng nhập Main site
> - Đăng nhập Employee Portal
> - Version hiển thị đúng
> - Kiểm tra chức năng chính của bản release

## Liên kết

- [[wiki/flows/k8d2p-flow-deploy-k8s-hrm]] — Flow chi tiết UAT + Production
- [[wiki/architecture/HRM-Deployment-Architecture]] — Kiến trúc deploy tổng thể IIS/K8s
- [[wiki/flows/Flow-Deploy-HRM]] — Quy trình deploy HRM (bao gồm cả IIS)
- [[wiki/concepts/HRM-Deploy-Checklist]] — Checklist deploy server mới
