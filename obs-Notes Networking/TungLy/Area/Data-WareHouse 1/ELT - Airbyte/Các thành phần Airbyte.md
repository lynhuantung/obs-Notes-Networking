---
aliases: 
date: 2024-10-26
tags:
  - "#airbyte"
---

## Các thành phần trong airbyte  và kết nối với nhau
---
Trong Airbyte, các mục **Connection**, **Sources**, **Destination**, **Builder**, và **Settings** cùng với quy trình **Define Source**, **Define Destination**, **Select Streams**, và **Configure Connection** hoạt động phối hợp để thiết lập và quản lý quy trình ETL:

1. **[[TungLy/Area/Data-WareHouse 1/ELT - Airbyte/Sources]]**: Đây là nơi thiết lập các nguồn dữ liệu (ví dụ: SQL Server, MySQL, API) mà bạn muốn trích xuất.

2. **[[TungLy/Area/Data-WareHouse 1/ELT - Airbyte/Destinations]]**: Nơi thiết lập đích đến của dữ liệu (data warehouse, cơ sở dữ liệu hoặc dịch vụ lưu trữ như Snowflake, BigQuery) để nạp dữ liệu sau khi xử lý.

3. **[[TungLy/Area/Data-WareHouse 1/ELT - Airbyte/Connection]]**: Đây là nơi quản lý các kết nối giữa nguồn và đích. Bạn có thể theo dõi trạng thái của từng kết nối, thời gian đồng bộ, và các cài đặt liên quan.

4. **[[TungLy/Area/Data-WareHouse 1/ELT - Airbyte/Builder]]**: Tính năng này cho phép tạo connector tùy chỉnh nếu Airbyte không có sẵn loại nguồn hoặc đích bạn cần. 

5. **Settings**: Cài đặt hệ thống chung của Airbyte, bao gồm quản lý quyền, lịch sử đồng bộ, và tùy chỉnh cấu hình.

#### Quy trình tạo kết nối ETL:

1. **Define Source**: Chọn hoặc thiết lập một nguồn mới, điền thông tin kết nối đến cơ sở dữ liệu hoặc dịch vụ.
2. **Define Destination**: Chọn đích đến nơi dữ liệu sẽ được nạp vào sau khi trích xuất và xử lý.
3. **Select Streams**: Chọn các bảng hoặc luồng dữ liệu cụ thể từ nguồn bạn muốn đồng bộ với đích.
4. **Configure Connection**: Cấu hình chi tiết kết nối như tần suất đồng bộ (lịch trình), loại đồng bộ (full hoặc incremental), và các cài đặt khác.

### Mối liên kết giữa các mục
Mỗi mục trong Airbyte đều là một phần của quy trình ETL tổng thể. **Sources** và **Destinations** cung cấp nơi lưu trữ thông tin về nguồn và đích, **Connection** thiết lập quy trình đồng bộ giữa hai thành phần này, và **Builder** hỗ trợ tùy chỉnh nếu cần thêm các kết nối đặc biệt. Trong khi đó, các bước của quy trình (Define Source, Define Destination, Select Streams, Configure Connection) tạo ra quy trình tuần tự để thiết lập và chạy các kết nối ETL.