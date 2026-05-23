---
type: source
code: p9k2w
description: "Tài liệu lập kế hoạch triển khai HRM lên K8s: Q&A, kịch bản, checklist, sizing VM/K8s, service info, network matrix"
domain: infrastructure
tags:
  - k8s
  - deploy
  - devops
  - infrastructure
  - sizing
  - network
  - checklist
created: 2026-05-07
updated: 2026-05-07
source-file: raw/archive/Area/Deploy-K8s/
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/architecture/p9k2w-k8s-hrm-service-architecture]]"
  - "[[wiki/flows/m3t7x-flow-cicd-deploy-k8s]]"
  - "[[wiki/flows/r5n8q-flow-integration-thirdparty]]"
  - "[[wiki/flows/v2k9m-flow-golive-k8s]]"
  - "[[wiki/flows/k8d2p-flow-deploy-k8s-hrm]]"
---

# Source: Deploy K8s HRM — Tài liệu Lập kế hoạch Triển khai

## Tóm tắt

> Bộ tài liệu 10 file lập kế hoạch triển khai hệ thống HRM lên Kubernetes / OCP, áp dụng chung cho mọi dự án (VnPay, CircleK, ...).  
> Tài liệu bao gồm đầy đủ: Q&A phân công VNR/KH, kịch bản 7 phase, checklist tiêu chuẩn ứng dụng, sizing VM UAT/PROD, sizing K8s, danh sách service, và ma trận network.  
> Được xây dựng dựa trên kinh nghiệm thực tế từ dự án VnPay 2026.  
> Trạng thái: phần lớn checklist **Chưa sẵn sàng** — cần hoàn thiện trước go-live PROD.

## Key Takeaways

- **CI/CD phân tách rõ**: VNR build image → push KH S3 → KH scan security → KH deploy lên K8s
- **Bản build UAT = bản build PROD** — promote image, không build lại
- **Config bắt buộc dùng K8s ConfigMap / HashiCorp Vault** — không hardcode trong image
- **8 services .NET 8**, tất cả stateless Deployment, port 8080 (service) / 9090 (metrics internal)
- **PROD cluster**: 220 Gi RAM limited, 98 CPU Core limited, tổng 29 pods (max)
- **Loadtest cluster**: 236 Gi RAM, 106 Core — cao hơn PROD ~10% để tìm điểm giới hạn
- **Identity service** không gọi sang service khác — isolated, chỉ dùng MSSQL + Redis
- **windows-servicecore**: service duy nhất gọi outbound smtp.gmail.com:587
- Phần lớn checklist ứng dụng (**log stdout, TraceID, Prometheus, Non-root image**) chưa sẵn sàng

## Trích dẫn quan trọng

> CI: VNR / CD: KH — ranh giới rõ ràng. VNR chịu trách nhiệm code và build, KH chịu trách nhiệm hạ tầng chạy hệ thống.

> Không đóng config trong Image/Artifact — phải dùng ConfigMap/Vault để promote giữa môi trường. Bản build UAT là bản build PROD.

> Port 9090 (metrics) KHÔNG được expose ra Internet — chỉ Prometheus internal mới access được. Tách biệt Public Zone (8080) và Internal Network (9090).

> hrm.sc.service.identity: không gọi các service khác — chỉ nhận request từ tất cả services, truy vấn MSSQL + Redis để validate token.

> presentation-windows-servicecore là service duy nhất gọi ra smtp.gmail.com:587. Cần whitelist outbound SMTP riêng.

## Chi tiết bộ tài liệu

| File nguồn | Nội dung |
|-----------|---------|
| `00-Deploy-K8s-Index.md` | MOC tổng thể, kiến trúc deploy, phân công VNR/KH |
| `01-Deploy-QnA.md` | Q&A môi trường, CI/CD, outbound traffic, config management |
| `02-Deploy-Scenario.md` | 7 phase, 21 tasks, owner, phụ thuộc |
| `03-Deploy-Checklist-App.md` | Checklist log/metrics/image/K8s, action items VNR |
| `04-Deploy-VM-UAT.md` | VM UAT: DB 8C/64GB/300GB, Redis 2C/4GB/128GB (VNR) |
| `05-Deploy-Sizing-PROD.md` | K8s PROD: 220 Gi / 98 Core, 29 pods |
| `06-Deploy-Sizing-Loadtest.md` | K8s Loadtest: 236 Gi / 106 Core |
| `07-Deploy-VM-PROD.md` | VM PROD: DB 2×(8C/16GB/100GB) RHEL8, Redis 3×(8C/32GB/150GB) Ubuntu24 (KH) |
| `08-Deploy-ServiceInfo.md` | 8 services: mô tả, traffic pattern, K8s YAML mẫu |
| `09-Deploy-Network.md` | Ma trận kết nối, external dependencies, network policy rules |

## Liên kết

- [[wiki/architecture/p9k2w-k8s-hrm-service-architecture]] — Kiến trúc 8 service + network zones
- [[wiki/flows/m3t7x-flow-cicd-deploy-k8s]] — Luồng CI/CD (VNR build → KH deploy)
- [[wiki/flows/r5n8q-flow-integration-thirdparty]] — Luồng third-party gọi vào integration API
- [[wiki/flows/v2k9m-flow-golive-k8s]] — Quy trình go-live PROD K8s
- [[wiki/flows/k8d2p-flow-deploy-k8s-hrm]] — Flow deploy HRM K8s tổng quan
- [[wiki/projects/VnPay-Project]] — Dự án tham chiếu chính
- [[wiki/architecture/HRM-Deployment-Architecture]] — Kiến trúc deploy IIS + K8s tổng quan
