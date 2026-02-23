---
Mã: 26010419-01
aliases:
date: "20260119"
tags:
  - daily
Project: "[[Dự án VnPay]]"
Link: https://app.diagrams.net/#G1exxshAh8chDj54AMWR9skxvbPr3ROUuJ#%7B%22pageId%22%3A%22i4jZ3c52FqBNQ2P4fCFT%22%7D
---

Hệ thống HRM sử dụng middleware metric dựa trên Prometheus để thu thập dữ liệu hiệu năng ở tầng HTTP cho toàn bộ service. Metric được expose qua endpoint riêng, chỉ cho phép Prometheus truy cập nội bộ. Dữ liệu được lưu trữ dạng time-series và trực quan hóa bằng Grafana, giúp theo dõi tải, độ trễ, và phát hiện sớm cổ chai trong hệ thống.

---

## 1. Hệ thống đang dùng **công nghệ gì?**

Từ đoạn code, có thể xác định rõ **stack metric** như sau:

| Thành phần    | Công nghệ                    | Vai trò                  |
| ------------- | ---------------------------- | ------------------------ |
| Web Service   | ASP.NET Core                 | Xử lý HTTP request       |
| Metric SDK    | **prometheus-net**           | Thu thập & expose metric |
| Middleware    | Custom MetricsMiddleware     | Bắt toàn bộ request      |
| Metric Format | Prometheus exposition format | Chuẩn scrape             |
| Collector     | Prometheus                   | Thu thập metric          |
| Visualization | Grafana                      | Trực quan & phân tích    |

👉 Quan trọng: **không dùng log-based metric**, mà dùng **in-process metric** (ghi trực tiếp trong runtime).

---

## 2. Kiến trúc tổng thể Metric (Big Picture)

![Image](https://miro.medium.com/1%2AMCKfypz3_qBnQcAcoR1l7Q.png)

![Image](https://learn.microsoft.com/en-us/aspnet/core/log-mon/metrics/metrics/static/prometheus_status.png?view=aspnetcore-10.0)

![Image](https://orkes.io/images/blogs/microservices-monitoring-using-prometheus-and-grafana.png)

![Image](https://s3.amazonaws.com/a-us.storyblok.com/f/1022730/9ef0a37803/spring-boot-grafana-cloud-dashboard-hello-observability-app.png)

**Tư duy kiến trúc:**

```
Request → Middleware → Metric (Memory)
                         ↓
                   /metrics endpoint
                         ↓
                    Prometheus
                         ↓
                      Grafana
```

- Metric **không ghi DB**
    
- Metric **không ghi log**
    
- Metric sống trong **memory của service**
    

---

## 3. Luồng metric chi tiết (end-to-end)

### Bước 1 – Request đi vào service

- Tất cả request HTTP đều đi qua `MetricsMiddleware`
    
- Trừ các endpoint đã loại trừ (`/metrics`, `/health`, …)
    

### Bước 2 – Middleware thu thập dữ liệu

Trong middleware, hệ thống đo **3 khía cạnh**:

|Loại|Metric|Ý nghĩa|
|---|---|---|
|Counter|`http_server_requests_total`|Bao nhiêu request|
|Histogram|`http_server_request_duration_seconds`|Chạy mất bao lâu|
|Gauge|`http_server_active_requests`|Đang kẹt bao nhiêu|

👉 Đây là **RED metrics** (Request – Error – Duration), chuẩn SRE.

---

### Bước 3 – Chuẩn hóa route (rất quan trọng)

Middleware **không dùng raw URL**, mà:

- Lấy `RoutePattern`
    
- Hoặc `Controller/Action`
    
- Tránh label explosion
    

➡️ Điều này cho thấy hệ thống **đã được thiết kế để chạy production lâu dài**, không chỉ test.

---

### Bước 4 – Expose metric qua `/metrics`

- `prometheus-net` tự expose endpoint `/metrics`
    
- Dữ liệu dạng text:
    

```text
http_server_requests_total{method="GET",status_code="200",path="api/Att_Workday/GetList"} 12456
```

---

## 4. Public metric port riêng để **bảo mật**

### Vì sao **KHÔNG nên** public `/metrics` chung port API?

- Metric tiết lộ:
    
    - API name
        
    - Tần suất gọi
        
    - Hành vi hệ thống
        
- Là **sensitive operational data**
    

---

### Kiến trúc khuyến nghị (chuẩn production)

![Image](https://www.krakend.io/images/documentation/screenshots/grafana-prometheus-otel.png)

![Image](https://prometheus.io/assets/blog/2021-11-16/prom.png)

![Image](https://miro.medium.com/1%2AithJelVGBDZ38Ooz2B1rMg.png)

|Cách|Mô tả|
|---|---|
|Port riêng|Ví dụ: API :7005 – Metric :9100|
|Network nội bộ|Chỉ Prometheus truy cập|
|Không qua Gateway|Tránh public|
|Firewall|Chặn từ Internet|

**Ví dụ triển khai:**

- `https://service/api/*` → public
    
- `http://service:9100/metrics` → private
    

👉 Đây là **best practice bắt buộc** trong tài liệu kiến trúc.

---

## 5. Prometheus dùng metric này như thế nào?

Prometheus:

- Định kỳ cào data theo api `/metrics`
	- Prometheus **định kỳ gọi (pull)** endpoint metric của service
	- Mặc định: **15 giây / lần** (có thể cấu hình)
	- Dữ liệu lấy về ở dạng **time-series samples**  (giá trị + timestamp + label)
    
- Lưu vào **time-series database**
	- Prometheus lưu metric **trên local disk** của chính server Prometheus, trong thư mục: /prometheus/data
	- Nếu **không cấu hình**, Prometheus sẽ: Lưu **15 ngày** Hoặc đến khi **hết dung lượng disk**
        

**Ví dụ scrape config:**

```yaml
scrape_interval: 15s
static_configs:
  - targets: ['hrm-api:9100']
```

---

## 6. Grafana được dùng để view ra sao?

### 6.1 Dashboard cấp hệ thống

- Tổng RPS (request per seconds)
    
- Tổng active request
    
- p95 toàn service
    

### 6.2 Dashboard theo API

- RPS theo `path`
    
- p95 / p99 theo từng API
    
- Top API chậm nhất
    

### 6.3 Dashboard điều tra sự cố

- ActiveRequests tăng?
    
- RPS đứng yên?
    
- Duration kéo dài?
    

➡️ Trả lời câu hỏi:

> “Hệ thống chậm do đâu – DB, code hay tải?”

---

### Ví dụ các panel phổ biến

|Panel|Metric|
|---|---|
|Request / giây|`rate(http_server_requests_total[1m])`|
|p95 latency|`histogram_quantile(0.95, …)`|
|Active request|`http_server_active_requests`|
|Error rate|status_code ≠ 200|

---

## 7. Tại sao kiến trúc này cho cái nhìn **toàn diện**?

✔ Nhìn được **hiện tại** (Gauge)  
✔ Nhìn được **xu hướng** (Histogram)  
✔ Nhìn được **tải** (Counter)  
✔ Không phụ thuộc business code  
✔ Dùng chuẩn công nghiệp (Prometheus + Grafana)  
✔ Scale tốt cho microservice

---

## 8. Một đoạn mô tả “chuẩn tài liệu kiến trúc”

> _Hệ thống HRM sử dụng middleware metric dựa trên Prometheus để thu thập dữ liệu hiệu năng ở tầng HTTP cho toàn bộ service. Metric được expose qua endpoint riêng, chỉ cho phép Prometheus truy cập nội bộ. Dữ liệu được lưu trữ dạng time-series và trực quan hóa bằng Grafana, giúp theo dõi tải, độ trễ, và phát hiện sớm cổ chai trong hệ thống._

