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

## Sơ đồ mối quan hệ Metric → Dashboard

Sơ đồ thể hiện **mối quan hệ giữa các metric gốc (raw metrics)** do hệ thống thu thập và **các chỉ số vận hành** được hiển thị trên Grafana.
![[Pasted image 20260119100234.png]]

---

### 1. `http_server_requests_total`

Đây là **Counter metric**, đếm tổng số HTTP request mà hệ thống đã xử lý.

Từ metric này, Grafana tính được:

- **Request / Second (RPS)**  
    → Phản ánh lưu lượng truy cập theo thời gian thực.
    
- **Error Rate**  
    → Tỷ lệ request lỗi (4xx, 5xx) so với tổng số request.
    

👉 Dùng để:

- Theo dõi tải hệ thống
    
- Phát hiện lỗi tăng đột biến
    

---

### 2. `http_server_request_duration_seconds`

Đây là **Histogram metric**, ghi nhận thời gian xử lý request.

Từ metric này, Grafana tính được:

- **p95 Latency**  
    → 95% request có thời gian xử lý **nhỏ hơn hoặc bằng** giá trị này.
```
Với 200 request, p95 được xác định tại vị trí ceil(200 × 0.95) = 190, nghĩa là 95% request hoàn thành nhanh hơn hoặc bằng giá trị p95 (190), chỉ 5% chậm hơn.
```

    
- **p99 Latency**  
    → Phản ánh các request chậm nhất (worst-case phổ biến).
    

👉 Dùng để:

- Đánh giá trải nghiệm người dùng
    
- Phát hiện API có độ trễ cao
    

---

### 3. `http_server_active_requests`

Đây là **Gauge metric**, thể hiện số request đang được xử lý tại một thời điểm.

Từ metric này, Grafana hiển thị:

- **System Load**  
    → Mức độ bận của hệ thống tại thời điểm hiện tại.
    

👉 Dùng để:

- Phát hiện nghẽn, treo hệ thống
    
- Phân biệt chậm do tải hay do logic xử lý
    

---

### 4. Grafana

Grafana đóng vai trò:

- Truy vấn dữ liệu từ Prometheus
    
- Tổng hợp các metric gốc thành chỉ số dễ hiểu
    
- Trực quan hóa hiệu năng hệ thống theo thời gian
    

👉 Grafana **không lưu metric**, chỉ hiển thị dữ liệu.

---

## Kết luận ngắn gọn (đặt dưới hình)

> Các metric gốc được thu thập từ hệ thống được Prometheus lưu trữ dưới dạng time-series. Grafana sử dụng các metric này để tính toán và hiển thị các chỉ số vận hành như lưu lượng, độ trễ và mức tải hệ thống, phục vụ giám sát và phân tích hiệu năng.
