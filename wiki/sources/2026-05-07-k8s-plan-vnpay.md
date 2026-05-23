---
type: source
domain: infrastructure / k8s
tags:
  - k8s
  - kubernetes
  - aws
  - devops
  - terraform
  - helm
created: 2026-05-07
updated: 2026-05-07
description: Kế hoạch triển khai K8s trên AWS cho HRM — WBS 4 epic, 80 man-days, 16 tuần
source-file: raw/archive/3.ARCHIEVED/SaaS-VnR/Documents/k8s/Plan_K8s.xlsx
related:
  - wiki/projects/VnPay-Project
  - wiki/sources/2026-05-07-docker-hrm-vnpay
---

# Source: K8s Deployment Plan — AWS (VnR SaaS)

## Tóm tắt

> Tài liệu WBS cho dự án triển khai HRM lên AWS sử dụng Kubernetes. Gồm 4 epic chính, tổng 80 man-days, timeline 16 tuần (~3–4 tháng). Bao gồm POC, hạ tầng Terraform, deploy microservices bằng HelmChart, và monitoring stack (Prometheus + Grafana + AlertManager).

## Key Takeaways

- **Terraform** dùng để provision K8s cluster, network, load balancer, storage, IAM trên AWS
- **HelmChart** dùng để deploy microservices HRM lên K8s
- **Monitoring stack**: Prometheus + Grafana + AlertManager + Blackbox + NodeExporter — chạy qua Docker/docker-compose
- Tổng effort: **80 man-days / 16 tuần**
- Chiến lược migration: **rehost / replatform** (cần define rõ ở Phase 1)

## WBS Overview

| Epic | Nội dung | Effort |
|------|---------|--------|
| 1.0 | POC với AWS Cloud (kick-off + CI/CD templates) | 20 md |
| 2.0 | Infrastructure (Terraform: K8s cluster, LB, Storage, IAM) | 20 md |
| 3.0 | Refinement (Containerize, HelmChart, Domain routing) | 20 md |
| 4.0 | Monitoring/Logging + Handover | 20 md |

## Trích dẫn quan trọng

> "Develop Terraform essential module: Network, K8s cluster" — Epic 2.0
> "HelmChart deployment / Test container deployment and scaling" — Epic 3.0
> "Monitoring: Prometheus / Dashboard: Grafana / Alert: Alert Manager" — Epic 4.0

## Liên kết

- [[wiki/projects/VnPay-Project]]
- [[wiki/sources/2026-05-07-docker-hrm-vnpay]]
- Raw: `raw/archive/3.ARCHIEVED/SaaS-VnR/Documents/k8s/Plan_K8s.md`
- Raw: `raw/archive/3.ARCHIEVED/SaaS-VnR/Documents/k8s/K8s_DevOps_Plan.md`
