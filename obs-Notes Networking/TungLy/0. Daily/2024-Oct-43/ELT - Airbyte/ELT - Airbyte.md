---
aliases: 
date: 2024-10-26
tags:
  - daily
  - "#airbyte"
  - "#ELT"
Hướng dẫn kết nối sql server: https://www.youtube.com/watch?v=2FvMa7vaxDY
Link demo airbyte: https://demo.airbyte.com/workspaces/831c25f5-5f54-42dc-ac2b-dc338eaba843/connections/new-connection?sourceType=new&sourceDefinitionId=b5ea17b1-f170-46dc-bc31-cc744ca984c1
---
## Tổng quan cách sử dụng Airbyte
---
Dưới đây là quy trình ETL tổng thể sử dụng Airbyte, từ việc cài đặt đến quản lý dữ liệu:
Link demo : 
[Airbyte | New connection](https://demo.airbyte.com/workspaces/831c25f5-5f54-42dc-ac2b-dc338eaba843/connections/new-connection?sourceType=new&sourceDefinitionId=b5ea17b1-f170-46dc-bc31-cc744ca984c1)
![[Pasted image 20241026094512.png]]

- Airbyte là công cụ ELT:
![[Pasted image 20241026113646.png]]

### 1. **Cài đặt Airbyte**

- **Tự cài đặt**: Có thể cài đặt Airbyte trên server hoặc môi trường đám mây. Cung cấp giao diện trực quan qua trình duyệt để dễ dàng thiết lập và theo dõi.
- [[Các bước thực hiện Airbyte]]


### 2. **Thiết lập Source (Nguồn Dữ Liệu)**

- Chọn nguồn dữ liệu cần tích hợp (ví dụ: SQL Server, MySQL, PostgreSQL, API của các dịch vụ SaaS).
- Cung cấp thông tin kết nối cho nguồn, bao gồm địa chỉ máy chủ, tên cơ sở dữ liệu, tên đăng nhập và mật khẩu.

### 3. **Thiết lập Destination (Đích Đến)**

- Chọn kho lưu trữ đích, ví dụ: Snowflake, BigQuery, hoặc một data warehouse khác.
- Cấu hình chi tiết cho đích đến (thông tin xác thực, tên cơ sở dữ liệu và schema).

### 4. **Tạo và Cấu Hình Connection**

- Trong **tab Connections**, tạo kết nối giữa nguồn và đích đã chọn.
- Lựa chọn các bảng và dữ liệu cần đồng bộ, thiết lập tần suất (như hằng ngày hoặc theo cron).

### 5. **Chạy Quy Trình ETL (Sync)**

- Nhấn **Sync Now** để thực hiện đồng bộ dữ liệu ngay lập tức hoặc để Airbyte tự đồng bộ theo lịch trình.
- Quá trình ETL sẽ thực hiện theo tuần tự: trích xuất (extract) dữ liệu từ nguồn, biến đổi (transform) nếu cần, và nạp (load) vào đích.

### 6. **Quản lý và Giám sát**

- Kiểm tra trạng thái của các kết nối (đang chạy, thành công, hay lỗi).
- Airbyte có tính năng cảnh báo lỗi, ghi lại lịch sử đồng bộ giúp dễ dàng xử lý sự cố.

### 7. **Biến đổi Dữ Liệu (Transform)**

- Airbyte tập trung vào phần ELT (Extract và Load), phần Transform sẽ được thực hiện trong kho dữ liệu (ví dụ, với công cụ dbt để biến đổi dữ liệu).
	- Trong quy trình ELT của Airbyte, **Transform** (biến đổi) diễn ra trong kho dữ liệu sau khi dữ liệu đã được nạp. Sử dụng công cụ như **dbt (Data Build Tool)** cho phép thực hiện các biến đổi bằng SQL, như làm sạch, hợp nhất bảng, tạo các trường tính toán, và chuẩn hóa dữ liệu. Điều này giúp dữ liệu trở nên sẵn sàng cho phân tích và báo cáo, duy trì được độ chính xác và cập nhật khi có dữ liệu mới từ Airbyte.

### 8. **Bảo Trì và Tối Ưu**

- Thực hiện bảo trì định kỳ các kết nối, cập nhật connector khi cần thiết.
- Tối ưu lịch trình đồng bộ để giảm tải cho hệ thống và tăng hiệu suất.

### Tổng kết

Airbyte giúp tự động hóa quy trình ETL với giao diện đơn giản, giúp tiết kiệm thời gian và dễ dàng tích hợp dữ liệu từ nhiều nguồn khác nhau vào một nơi lưu trữ tập trung để phục vụ phân tích và báo cáo.

[[Các thành phần Airbyte]]