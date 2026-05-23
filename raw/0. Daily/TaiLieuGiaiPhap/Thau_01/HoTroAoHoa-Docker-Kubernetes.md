---
tags: [tailieu-giaiphap, ky-thuat-trien-khai, docker, kubernetes, container]
date: 2026-05-08
code: "tailieugiaiphap_1.2.5"
section: "§1.2.5 Hỗ trợ cài đặt trên nền tảng ảo hóa Docker, Kubernetes"
description: "Hệ thống đóng gói microservices thành Docker image, VNR cung cấp qua Registry hoặc S3, khách hàng tự triển khai trên Kubernetes cluster của mình."
---

# 1.2.5 Hỗ trợ cài đặt trên các nền tảng ảo hóa như Docker, Kubernetes

Hệ thống được thiết kế và xây dựng theo kiến trúc microservices, hỗ trợ triển khai đầy đủ trên các nền tảng ảo hóa và container hóa hiện đại, cụ thể:

- **Docker:** Toàn bộ các service của hệ thống được đóng gói thành Docker image độc lập, bao gồm các thành phần chính như HRM Main, Employee Portal, HRM System, HR Service, Windows Service, API Core, Identity Service, Chat Service, Survey Service, News Service. Mỗi service vận hành độc lập trong container, đảm bảo tính nhất quán giữa các môi trường phát triển, kiểm thử và production.

- **Kubernetes:** Hệ thống hỗ trợ triển khai trên nền tảng Kubernetes. VNR thực hiện build Docker image và cung cấp image cho khách hàng thông qua private Docker Registry hoặc AWS S3. Khách hàng chủ động kéo image về và triển khai, vận hành trên Kubernetes cluster của mình theo đúng hạ tầng và chính sách nội bộ.

- **Private Docker Registry & AWS S3:** VNR duy trì hệ thống lưu trữ và phân phối image tập trung, đảm bảo khách hàng luôn nhận được phiên bản image mới nhất, đúng phiên bản theo hợp đồng triển khai.

Với kiến trúc container hóa này, hệ thống đảm bảo khả năng mở rộng linh hoạt (scaling), dễ dàng nâng cấp từng service độc lập, và tương thích với hạ tầng cloud hoặc on-premise của khách hàng.
