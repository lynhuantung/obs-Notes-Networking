---
Mã:
aliases:
date: 2026-01-20
tags:
  - daily
Project: "[[Dự án VnPay]]"
---

# Tài liệu Cấu hình Hạ tầng Giám sát Metrics (Prometheus) cho Hệ thống HRM

## 1. Tổng quan Mục đích

Tập lệnh trên được sử dụng để chuẩn bị môi trường máy chủ (Server Environment) cho việc triển khai hệ thống giám sát **Prometheus**. Cụ thể, nó thực hiện việc **mở cổng (port)** và **cấp quyền** cho các phân hệ phần mềm (HRM Modules) được phép phát ra các chỉ số đo lường hiệu năng (metrics) ra bên ngoài để hệ thống giám sát thu thập.

Mỗi cặp lệnh tương ứng với một phân hệ cụ thể (Main, HR, System, Portal, v.v.) và thực hiện hai nhiệm vụ chính:

1. **Cấp quyền lắng nghe HTTP (URL Reservation):** Cho phép ứng dụng IIS chạy dưới quyền hạn chế có thể mở port.
2. **Mở tường lửa (Firewall):** Cho phép lưu lượng truy cập từ bên ngoài vào port đó.

---

## 2. Phân tích Chi tiết Lệnh

### A. Lệnh `netsh http add urlacl`

> **Cú pháp mẫu:**
> `netsh http add urlacl url=http://+:9090/metrics/ user="IIS AppPool\VNPAY_Main_2101"`

* **Ý nghĩa:** Windows sử dụng `HTTP.sys` làm trình điều khiển lắng nghe các yêu cầu HTTP. Mặc định, chỉ có tài khoản Administrator mới có quyền mở một port để lắng nghe. Lệnh này thực hiện "ủy quyền" (delegation).
* **`url=http://+:9090/metrics/`**: Đăng ký URL cụ thể.
* `+`: Chấp nhận kết nối từ mọi IP trên máy chủ.
* `9090`: Cổng dịch vụ.
* `/metrics/`: Đường dẫn (endpoint) tiêu chuẩn mà Prometheus thường dùng để "cào" (scrape) dữ liệu.


* **`user="IIS AppPool\..."`**: Chỉ định rõ ràng rằng tài khoản ảo (Virtual Account) của **IIS Application Pool** (ví dụ: `VNPAY_Main_2101`) được phép binding vào port này.
* **Tại sao cần thiết?** Nếu không có lệnh này, khi ứng dụng web cố gắng khởi động server metrics trên port 9090, nó sẽ bị lỗi "Access Denied" (503) vì IIS AppPool thường chạy với quyền hạn thấp để bảo mật.

### B. Lệnh `New-NetFirewallRule`

> **Cú pháp mẫu:**
> `New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Main" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9090`

* **Ý nghĩa:** Tạo một quy tắc mới trong Windows Firewall.
* **`-Direction Inbound -Action Allow`**: Cho phép các gói tin đi **vào** máy chủ.
* **`-LocalPort 9090`**: Chỉ mở đúng port này, đảm bảo nguyên tắc bảo mật tối thiểu (Least Privilege).
* **Tại sao cần thiết?** Dù ứng dụng đã được cấp quyền lắng nghe (bởi lệnh `netsh`), nếu tường lửa đóng, hệ thống giám sát (Prometheus Server) từ bên ngoài sẽ không thể kết nối để lấy dữ liệu.

---

## 3. Bảng Tra cứu Cấu hình (Port Mapping)

Bảng dưới đây tổng hợp ánh xạ giữa các Phân hệ (Modules), Cổng giao tiếp (Port) và Tài khoản vận hành (Identity):

```PowerShell

netsh http add urlacl url=http://+:9090/metrics/ user="IIS AppPool\VNPAY_Main_2101"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Main" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9090

netsh http add urlacl url=http://+:9091/metrics/ user="IIS AppPool\VNPAY_HrService_2103"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Hr" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9091

netsh http add urlacl url=http://+:9092/metrics/ user="IIS AppPool\VNPAY_System_2104"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Sys" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9092

netsh http add urlacl url=http://+:9093/metrics/ user="IIS AppPool\VNPAY_Portal_2102"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Portal" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9093

netsh http add urlacl url=http://+:9094/metrics/ user="IIS AppPool\VNPAY_Iden_2106"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Ids4" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9094

netsh http add urlacl url=http://+:9095/metrics/ user="IIS AppPool\VNPAY_2105_Api"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics SC API" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9095

netsh http add urlacl url=http://+:9096/metrics/ user="IIS AppPool\VNPAY_2121_IntegrationApi"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Itg Api" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9096

netsh http add urlacl url=http://+:9097/metrics/ user="IIS AppPool\VNPAY_ChatApi_2124"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Chat Api" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9097

netsh http add urlacl url=http://+:9098/metrics/ user="IIS AppPool\VNPAY_SurveyApi_2123"
New-NetFirewallRule -DisplayName "HRM Prometheus Metrics Survey Api" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 9098
```

| Port | Tên Phân hệ (System) | Tên Application Pool (Identity) | Tên quy tắc Firewall |
| --- | --- | --- | --- |
| **9090** | Main (Core) | `IIS AppPool\VNPAY_Main_2101` | HRM Prometheus Metrics Main |
| **9091** | HR Service | `IIS AppPool\VNPAY_HrService_2103` | HRM Prometheus Metrics Hr |
| **9092** | System Module | `IIS AppPool\VNPAY_System_2104` | HRM Prometheus Metrics Sys |
| **9093** | Portal | `IIS AppPool\VNPAY_Portal_2102` | HRM Prometheus Metrics Portal |
| **9094** | Identity (Ids4) | `IIS AppPool\VNPAY_Iden_2106` | HRM Prometheus Metrics Ids4 |
| **9095** | SC API | `IIS AppPool\VNPAY_2105_Api` | HRM Prometheus Metrics SC API |
| **9096** | Integration API | `IIS AppPool\VNPAY_2121_IntegrationApi` | HRM Prometheus Metrics Itg Api |
| **9097** | Chat API | `IIS AppPool\VNPAY_ChatApi_2124` | HRM Prometheus Metrics Chat Api |
| **9098** | Survey API | `IIS AppPool\VNPAY_SurveyApi_2123` | HRM Prometheus Metrics Survey Api |

---

## 4. Ý nghĩa Vận hành & Bảo mật

1. **Tính tách biệt (Isolation):** Việc sử dụng các port riêng biệt (9090-9098) cho phép giám sát độc lập từng dịch vụ. Nếu Chat API (9097) bị quá tải, nó không ảnh hưởng đến việc giám sát Core Main (9090).
2. **Khả năng quan sát (Observability):** Cấu hình này là tiền đề để xây dựng các Dashboard trên Grafana, giúp đội ngũ kỹ thuật theo dõi sức khỏe hệ thống (CPU, RAM, Request/s, Error Rate) của từng AppPool theo thời gian thực.
3. **Lưu ý bảo mật:** Các port này đang mở HTTP. Cần đảm bảo rằng Firewall mức mạng (Network Firewall) chỉ cho phép địa chỉ IP của Prometheus Server truy cập vào các port này, tránh lộ thông tin metrics ra public internet.

