---
aliases: 
date: 2024-10-26
tags:
  - airbyte
  - "#ELT"
---
### Các bước thực hiện trong Airbyte

1. **Cài đặt và cấu hình Airbyte**:
    
    - Airbyte có thể cài đặt dưới dạng Docker, giúp việc triển khai dễ dàng.
    - Thiết lập Airbyte bằng cách truy cập vào giao diện quản trị qua trình duyệt sau khi khởi động.
2. **Kết nối nguồn dữ liệu ([[Sources]])**:
    
    - Chọn nguồn dữ liệu từ danh sách có sẵn (SQL Server, MySQL, PostgreSQL, API, CSV, v.v.).
    - Cấu hình thông tin kết nối cho từng nguồn (host, port, authentication...).
    - Xác nhận kết nối để đảm bảo có thể truy cập vào dữ liệu.
3. **Kết nối đích dữ liệu ([[Destinations]])**:
    
    - Chọn đích đến cho dữ liệu (Data Warehouse như Snowflake, BigQuery, hoặc Data Lake).
    - Cấu hình kết nối tương tự như khi chọn nguồn.
4. **Cấu hình đồng bộ (Sync Settings)**:
    
    - Lựa chọn bảng và cột muốn đồng bộ từ nguồn sang đích.
    - Thiết lập loại đồng bộ (full refresh hay incremental).
    - Cấu hình lịch trình tự động (cron job) để Airbyte có thể chạy đồng bộ định kỳ.
5. **Chạy đồng bộ và giám sát**:
    
    - Bắt đầu quy trình đồng bộ và giám sát qua giao diện để theo dõi tiến độ.
    - Airbyte sẽ ghi lại thông tin đồng bộ, báo cáo lỗi, và cho phép sửa lỗi hoặc chạy lại nếu cần.
6. **Xử lý và phân tích dữ liệu trong Data Warehouse**:
    
    - Sau khi dữ liệu đã được tải lên, các thao tác chuyển đổi và phân tích sẽ được thực hiện trong Data Warehouse với các công cụ khác hoặc bằng SQL trực tiếp.