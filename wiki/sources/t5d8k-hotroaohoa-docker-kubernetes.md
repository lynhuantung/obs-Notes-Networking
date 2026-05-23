---
type: source
code: t5d8k
tailieugiaiphap-code: "tailieugiaiphap_1.2.5"
description: "Hệ thống đóng gói microservices thành Docker image, VNR cung cấp qua Registry hoặc S3, khách hàng tự triển khai trên Kubernetes cluster của mình."
domain: system
tags:
  - tailieu-giaiphap
  - ky-thuat-trien-khai
  - docker
  - kubernetes
  - container
created: 2026-05-08
updated: 2026-05-08
source-file: "raw/0. Daily/TaiLieuGiaiPhap/Thau_01/HoTroAoHoa-Docker-Kubernetes.md"
section: "§1.2.5 Hỗ trợ cài đặt trên nền tảng ảo hóa Docker, Kubernetes"
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/architecture/p9k2w-k8s-hrm-service-architecture]]"
  - "[[wiki/flows/k8d2p-flow-deploy-k8s-hrm]]"
---

# Source: §1.2.5 Hỗ trợ cài đặt trên nền tảng ảo hóa Docker, Kubernetes

## Tóm tắt

Đây là nội dung hồ sơ thầu mục 1.2.5, mô tả năng lực triển khai hệ thống HRM trên nền tảng container hóa. Tài liệu được soạn ngày 2026-05-08 phục vụ hồ sơ đấu thầu. VNR đóng vai trò build và cung cấp Docker image; khách hàng tự triển khai lên Kubernetes cluster theo hạ tầng và chính sách nội bộ của họ.

## Key Takeaways

- Toàn bộ service HRM được đóng gói thành Docker image độc lập (MainCore, EmpPortalCore, HrmSystem, Hr.Service, WindowsService, ApiCore, Identity, Chat, Survey, News)
- VNR **không** quản lý K8s cluster — chỉ build image và cung cấp qua **private Docker Registry** hoặc **AWS S3**
- Khách hàng tự deploy, vận hành K8s theo hạ tầng của mình
- Hỗ trợ cả môi trường **cloud** lẫn **on-premise**
- Kiến trúc microservices đảm bảo: scaling linh hoạt, nâng cấp từng service độc lập, không downtime toàn hệ thống

## Trích dẫn quan trọng

> VNR thực hiện build Docker image và cung cấp image cho khách hàng thông qua private Docker Registry hoặc AWS S3. Khách hàng chủ động kéo image về và triển khai, vận hành trên Kubernetes cluster của mình theo đúng hạ tầng và chính sách nội bộ.

> VNR duy trì hệ thống lưu trữ và phân phối image tập trung, đảm bảo khách hàng luôn nhận được phiên bản image mới nhất, đúng phiên bản theo hợp đồng triển khai.

## Liên kết

- [[wiki/projects/VnPay-Project]] — dự án thực tế áp dụng K8s deployment
- [[wiki/architecture/HRM-Deployment-Architecture]] — kiến trúc deploy tổng quan
- [[wiki/architecture/p9k2w-k8s-hrm-service-architecture]] — kiến trúc 8 service HRM trên K8s
- [[wiki/flows/k8d2p-flow-deploy-k8s-hrm]] — quy trình CI/CD phân chia VNR vs khách hàng
