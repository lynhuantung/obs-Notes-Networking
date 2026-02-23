---
Mã: 26010419-02
aliases:
date: "20260119"
tags:
  - daily
Project: "[[Dự án VnPay]]"
Liên kết:
  - "[[Metric prometheus]]"
  - https://app.diagrams.net/#G1exxshAh8chDj54AMWR9skxvbPr3ROUuJ#%7B%22pageId%22%3A%22i4jZ3c52FqBNQ2P4fCFT%22%7D
---
## Diễn giải sơ đồ kiến trúc Metric
![[Pasted image 20260119112942.png]]

### End User

Người dùng cuối gửi request đến hệ thống HRM.  
Chỉ tương tác với API nghiệp vụ, không truy cập metric.

---

### API Gateway / WAF

Lớp bảo vệ và định tuyến request vào hệ thống.  
Kiểm soát truy cập, lọc request bất thường trước khi vào service.

---

### HRM Application Service (ASP.NET Core)

Ứng dụng xử lý toàn bộ nghiệp vụ HRM.  
Bao gồm API Controllers, Metrics Middleware và Metrics Endpoint.

---

### API Controllers / Business Logic

Thực thi các nghiệp vụ như hồ sơ, công, lương, báo cáo.  
Là nơi phát sinh thời gian xử lý thực tế của request.

---

### Metrics Middleware

Theo dõi vòng đời request trong pipeline.  
Ghi nhận số lượng request, thời gian xử lý và trạng thái tải hệ thống.

---

### Metrics Endpoint

Công bố metric của service dưới dạng Prometheus format.  
Chạy trên cổng riêng, chỉ cho phép hệ thống giám sát truy cập.

---

### Prometheus Server

Định kỳ thu thập metric từ Metrics Endpoint theo cơ chế pull.  
Lưu trữ dữ liệu metric dưới dạng time-series.

---

### Grafana Dashboard

Truy vấn dữ liệu từ Prometheus.  
Trực quan hóa lưu lượng, độ trễ và mức tải hệ thống theo thời gian.

---

## Kết luận

Metric được thu thập tại tầng middleware của ứng dụng,  
được Prometheus lưu trữ và Grafana trực quan hóa,  
giúp giám sát hiệu năng hệ thống một cách tập trung và an toàn.
