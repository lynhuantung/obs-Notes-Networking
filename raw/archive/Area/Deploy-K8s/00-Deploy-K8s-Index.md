---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - devops
  - moc
created: 2026-05-07
updated: 2026-05-07
description: MOC tổng thể tài liệu triển khai HRM lên Kubernetes — dùng chung cho mọi dự án
source-file: 
related:
  - "[[01-Deploy-QnA]]"
  - "[[02-Deploy-Scenario]]"
  - "[[03-Deploy-Checklist-App]]"
  - "[[04-Deploy-VM-UAT]]"
  - "[[05-Deploy-Sizing-PROD]]"
  - "[[06-Deploy-Sizing-Loadtest]]"
  - "[[07-Deploy-VM-PROD]]"
  - "[[08-Deploy-ServiceInfo]]"
  - "[[09-Deploy-Network]]"
---

# Deploy K8s — Index

> Tài liệu tổng thể triển khai hệ thống HRM lên Kubernetes / OCP.  
> Áp dụng chung cho mọi dự án (VnPay, CircleK, ...).  
> Tham chiếu thực tế từ dự án VnPay 2026 (JIRA: 7425).

---

## Mục lục

| File | Nội dung | Trạng thái |
|------|----------|------------|
| [[01-Deploy-QnA]] | Q&A — Môi trường, CICD, Secret/Config, phân công VNR/KH | ✅ |
| [[02-Deploy-Scenario]] | Kịch bản triển khai — task từng phase, người thực hiện | ✅ |
| [[03-Deploy-Checklist-App]] | Checklist tiêu chuẩn ứng dụng K8s (log, metrics, security) | ⚠️ Chưa đủ |
| [[04-Deploy-VM-UAT]] | Tài nguyên VM UAT — DB + Redis (VNR cung cấp) | ✅ |
| [[05-Deploy-Sizing-PROD]] | Sizing K8s PROD — CPU/RAM/Replicas từng service | ✅ |
| [[06-Deploy-Sizing-Loadtest]] | Sizing K8s Loadtest — resource cao hơn để test giới hạn | ✅ |
| [[07-Deploy-VM-PROD]] | Tài nguyên VM PROD — DB + Redis (KH cung cấp) | ✅ |
| [[08-Deploy-ServiceInfo]] | Danh sách service — port, language, instance, mô tả | ✅ |
| [[09-Deploy-Network]] | Ma trận kết nối — internal và external traffic flow | ✅ |

---

## Kiến trúc triển khai tổng thể

```
Developer (VNR)
    ↓  commit code
Git Repository
    ↓
VNR CI Pipeline
    ↓  build Docker Image
Push Image → KH S3 Storage / Image Registry
    ↓
KH Security Scan (vulnerability, malware, compliance)
    ↓
KH CD Pipeline
    ↓  Helm chart deploy
Kubernetes Cluster (KH vận hành)
    ↓
Application Running
    ↓
Prometheus (internal) → Grafana Dashboard
Nagios → Alert
```

---

## Môi trường

| Môi trường | Quản lý | Mục đích |
|-----------|---------|---------|
| DEV | VNR | Phát triển, debug nội bộ |
| TEST | VNR | Kiểm thử nội bộ trước UAT |
| UAT | KH | Khách hàng nghiệm thu |
| PRODUCTION | KH | Vận hành thực tế |

> **Nguyên tắc:** Bản build UAT = bản build lên PROD (promote image, không build lại).

---

## Phân công trách nhiệm

| Hạng mục | VNR | KH |
|----------|:---:|:--:|
| DEV / TEST server | ✅ | |
| UAT / PROD server | | ✅ |
| CI Build Image | ✅ | |
| CD Deploy | | ✅ |
| Source code update (ConfigMap/Vault) | ✅ | |
| HashiCorp Vault service | | ✅ |
| K8s ConfigMap / Secret | | ✅ |
| Network Policy | | ✅ |
| Security Scan image | | ✅ |
| Prometheus + Grafana | | ✅ |
| Nagios monitoring | | ✅ |

---

## Stack công nghệ

| Thành phần | Công nghệ | Ghi chú |
|-----------|----------|---------|
| Runtime | .NET 8 | Tất cả services |
| Container | Docker (Multi Stage + Alpine) | Tối ưu image size |
| Orchestration | Kubernetes / OCP | KH vận hành |
| DB | MS SQL Server 2019 | /data-200G, /backup-100G |
| Cache | Redis Sentinel 7.4 | HA mode |
| Storage | S3 Cloud | Upload file |
| Secret | HashiCorp Vault | KH cung cấp |
| Config | K8s ConfigMap | |
| Metrics | Prometheus (port 9090) | Internal network only |
| Dashboard | Grafana + Loki + Promtail | |
| Alerting | Nagios | |
| Email | smtp.gmail.com | windows-servicecore |

---

## Luồng go-live (PROD)

```
DEV chuẩn bị thay đổi
    ↓
PO/PM phê duyệt
    ↓
QTUD kiểm tra request (version, script DB, rollback plan)
    ↓
QTUD deploy (phối hợp DBA / hạ tầng nếu cần)
    ↓
Tester smoke test trên PROD
    ↓
Review → OK → Done
         NOK → Rollback → Hotfix
```

> Chi tiết luồng UAT xem: `flow/Flow-UAT` | Chi tiết luồng Golive: `flow/Flow-Golive`
