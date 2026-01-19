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
Hệ thống HRM sử dụng middleware metric dựa trên Prometheus để thu thập dữ liệu hiệu năng ở tầng HTTP cho toàn bộ service. Metric được expose qua endpoint riêng, chỉ cho phép Prometheus truy cập nội bộ. Dữ liệu được lưu trữ dạng time-series và trực quan hóa bằng Grafana, giúp theo dõi tải, độ trễ, và phát hiện sớm cổ chai trong hệ thống.
Link DrawIO : https://app.diagrams.net/#G1exxshAh8chDj54AMWR9skxvbPr3ROUuJ#%7B%22pageId%22%3A%22i4jZ3c52FqBNQ2P4fCFT%22%7D
## 1. Mục đích của sơ đồ sequence

Sơ đồ này mô tả **toàn bộ vòng đời của một HTTP request** trong hệ thống HRM, đồng thời thể hiện **cách MetricsMiddleware thu thập metric** và **cách Prometheus – Grafana khai thác dữ liệu đó**.

Trọng tâm của sơ đồ là:

- Metric được thu thập **trong lúc request đang chạy**, không phải sau khi log
    
- Metric được **pull nội bộ**, đảm bảo bảo mật
    
![[Pasted image 20260119094226.png]]
---

## 2. Diễn giải từng bước (theo số thứ tự trên hình)

### (1) Client / User → HRM Service: HTTP Request

Người dùng hoặc hệ thống bên ngoài gửi một HTTP request (GET/POST/…) đến HRM Service thông qua Gateway (không thể hiện trong sơ đồ này).

👉 Đây là điểm **bắt đầu vòng đời request**.

---

### (2) HRM Service → MetricsMiddleware: Enter request

Request đi vào pipeline của ASP.NET Core và **được MetricsMiddleware intercept**.

👉 Middleware đứng ở đầu (hoặc gần đầu) pipeline nên:

- Không bỏ sót request nào
    
- Bao phủ toàn bộ API
    

---

### (3) MetricsMiddleware: ActiveRequests +1

Ngay khi request bắt đầu:

- Metric `http_server_active_requests` được tăng lên 1
    

👉 Thể hiện:

- Có thêm 1 request đang được xử lý
    
- Dùng để phát hiện nghẽn, treo, deadlock
    

---

### (4) MetricsMiddleware: Start Stopwatch

Middleware khởi tạo `Stopwatch` để đo **thời gian xử lý thực tế** của request.

👉 Đây là cơ sở để tính:

- Latency
    
- p50 / p95 / p99 trong Grafana
    

---

### (5) MetricsMiddleware → HRM Service: Continue pipeline

Middleware **chuyển quyền xử lý tiếp** cho:

- Controller
    
- Business Logic
    
- Database / Redis / Service khác (nếu có)
    

👉 Middleware **không can thiệp** vào nghiệp vụ.

---

### (6) HRM Service → MetricsMiddleware: Response

Sau khi xử lý xong nghiệp vụ:

- Response quay trở lại Middleware
    

👉 Middleware lúc này đã có:

- Thời gian xử lý
    
- Status code
    
- Route chuẩn hóa
    

---

### (7) MetricsMiddleware: Stop Stopwatch

Middleware dừng đồng hồ đo thời gian.

👉 Giá trị này được dùng để ghi vào:

- `http_server_request_duration_seconds` (Histogram)
    

---

### (8) MetricsMiddleware: ActiveRequests -1

Sau khi request kết thúc:

- Giảm `http_server_active_requests` xuống 1
    

👉 Điều này đảm bảo:

- Gauge phản ánh **đúng số request đang chạy tại thời điểm hiện tại**
    

---

### (9) MetricsMiddleware: Record Counter + Histogram

Middleware ghi nhận metric cuối cùng:

- **Counter**: tổng số request (theo method, status, path)
    
- **Histogram**: thời gian xử lý request
    

👉 Đây là bước **ghi dữ liệu metric vào memory** của service.

---

### (10) Prometheus → HRM Service: Scrape /metrics (private port)

Prometheus định kỳ:

- Gọi endpoint `/metrics`
    
- Qua **private port**
    
- Trong **internal network**
    

👉 Prometheus **chủ động pull**, không có service nào push metric.

---

### (11) Prometheus → Grafana: Time-series data

Grafana truy vấn Prometheus để:

- Hiển thị dashboard
    
- Phân tích xu hướng
    
- Thiết lập cảnh báo
    

👉 Grafana **chỉ đọc dữ liệu**, không ảnh hưởng hệ thống.

---

## 3. Ý nghĩa kiến trúc thể hiện qua sơ đồ

### 3.1 Về kỹ thuật

- Metric thu thập **đồng bộ với vòng đời request**
    
- Không phụ thuộc log
    
- Không cần sửa business code
    

### 3.2 Về vận hành

- Biết hệ thống đang:
    
    - Chạy nhanh hay chậm
        
    - Bị nghẽn hay không
        
- Phân biệt được:
    
    - Chậm do tải
        
    - Chậm do logic
        

### 3.3 Về bảo mật

- Metric không public
    
- Không lộ dữ liệu người dùng
    
- Không đi qua Gateway
    

---

## 4. Đoạn kết luận ngắn

> Sơ đồ sequence thể hiện cách MetricsMiddleware thu thập metric xuyên suốt vòng đời của một HTTP request trong hệ thống HRM. Metric được ghi nhận tại thời điểm request bắt đầu và kết thúc, sau đó được Prometheus thu thập thông qua endpoint riêng trong mạng nội bộ. Dữ liệu giám sát được trực quan hóa trên Grafana nhằm phục vụ theo dõi hiệu năng, vận hành và kiểm toán hệ thống.
