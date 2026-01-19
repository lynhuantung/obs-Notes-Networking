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
## Diễn giải sơ đồ phân vùng Public / Internal cho Metric
![[Pasted image 20260119113321.png]]

### Public Zone

Khu vực công khai cho người dùng truy cập hệ thống.  
Luồng truy cập: **End User → API Gateway → API Port 7005**.  
Chỉ chứa **API nghiệp vụ**, không expose metric.

---

### API Port 7005

Cổng public của HRM Application Service.  
Xử lý toàn bộ request nghiệp vụ từ người dùng.  
Không cho phép truy cập endpoint `/metrics`.

---

### Internal Network

Mạng nội bộ dành cho các thành phần giám sát.  
Không cho truy cập trực tiếp từ Internet.  
Tách biệt hoàn toàn với Public Zone để đảm bảo bảo mật.

---

### Metrics Endpoint `/metrics :9100`

Endpoint công bố metric của ứng dụng.  
Chạy trên **cổng riêng (9100)** và **chỉ mở trong Internal Network**.  
Internet bị chặn truy cập trực tiếp (ký hiệu dấu X trong sơ đồ).

---

### Prometheus

Đặt trong Internal Network.  
Định kỳ **pull metric** từ `/metrics:9100`.  
Lưu trữ metric dưới dạng time-series.

---

### Grafana

Truy vấn dữ liệu từ Prometheus.  
Hiển thị dashboard và cảnh báo hiệu năng.  
Không truy cập trực tiếp Metrics Endpoint.

---

## Ý nghĩa bảo mật của kiến trúc

- Metric **không public Internet**
    
- Không đi qua API Gateway
    
- Chỉ Prometheus trong mạng nội bộ được phép truy cập
    
- Tránh lộ thông tin vận hành hệ thống
    

---

## Kết luận

> Kiến trúc tách biệt Public Zone và Internal Network nhằm đảm bảo endpoint metric chỉ phục vụ cho hệ thống giám sát nội bộ. Prometheus thu thập metric qua cổng riêng trong mạng nội bộ và Grafana sử dụng dữ liệu này để trực quan hóa, đảm bảo an toàn và đáp ứng yêu cầu vận hành, kiểm toán.
