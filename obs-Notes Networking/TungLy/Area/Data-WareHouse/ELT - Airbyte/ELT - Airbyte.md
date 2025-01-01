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
- [[TungLy/Area/Data-WareHouse/ELT - Airbyte/Các bước thực hiện Airbyte]]

> [!NOTE] Thông tin Airbyte local  
>  Link: http://172.21.100.97:8000/
>  User/Pass: airbyte / password


### 2. **Thiết lập Source (Nguồn Dữ Liệu)**
#### Để thiết lập nguồn database có 2 cách:
##### Cách 1: Dùng bảng trong một database
- Chọn nguồn dữ liệu cần tích hợp (ví dụ: SQL Server, MySQL, PostgreSQL, API của các dịch vụ SaaS).
- Cung cấp thông tin kết nối cho nguồn, bao gồm địa chỉ máy chủ, tên cơ sở dữ liệu, tên đăng nhập và mật khẩu.
![[Pasted image 20241028091206.png]]
##### Cách 2: Dùng builder [[TungLy/Area/Data-WareHouse/ELT - Airbyte/Builder-airbyte-guide]] để tiến hành gọi API để sinh ra các cột custom theo api
![[Pasted image 20241028101317.png]]


### 3. **Thiết lập Destination (Đích Đến)**
#### Cách 1: kết nối database đích là bảng

- Chọn kho lưu trữ đích, ví dụ: Snowflake, BigQuery, hoặc một data warehouse khác.
- Cấu hình chi tiết cho đích đến (thông tin xác thực, tên cơ sở dữ liệu và schema).
![[Pasted image 20241028091248.png]]

### 4. **Tạo và Cấu Hình Connection**

- Trong **tab Connections**, tạo kết nối giữa nguồn và đích đã chọn.
- Lựa chọn các bảng và dữ liệu cần đồng bộ, thiết lập tần suất (như hằng ngày hoặc theo cron).
- Trong tab connection sẽ thực hiện đồng bộ từ nguồn đến database đích, bao gồm chọn những trường thông tin cần thiết cho database đích
![[Pasted image 20241028091501.png]]
Trong đó các tab **Status**, **Job History**, **Schema**, và **Settings** trong Airbyte:

1. **Status**:
    
    - Tab này hiển thị trạng thái hiện tại của kết nối. Bạn sẽ thấy các thông tin như:
        - **Trạng thái đồng bộ**: Nếu đồng bộ đã hoàn tất thì sẽ có trạng thái **Synced** (đã đồng bộ), còn nếu có lỗi sẽ hiển thị **Failed** (thất bại).
        - **Stream name**: Tên của các stream dữ liệu đang được đồng bộ.
        - **Latest sync**: Số lượng bản ghi đã được tải trong lần đồng bộ gần nhất.
        - **Data fresh as of**: Thời gian dữ liệu được làm mới gần nhất.
    - Bạn cũng có thể nhấn **Sync now** để thực hiện đồng bộ ngay lập tức nếu cần.
2. **Job History**:
    
    - Tab này lưu lại lịch sử của các lần đồng bộ đã thực hiện. Thông tin bao gồm:
        - **Thời gian bắt đầu và kết thúc**: Giúp bạn biết được lần đồng bộ đó diễn ra khi nào.
        - **Kết quả đồng bộ**: Hiển thị số lượng bản ghi đã đồng bộ thành công, hoặc chi tiết lỗi nếu có sự cố.
        - Bạn có thể kiểm tra các lỗi đã xảy ra trong quá trình đồng bộ và phân tích chúng để cải thiện quy trình đồng bộ trong tương lai.
3. **Schema**:
    
    - Tab này hiển thị cấu trúc dữ liệu (schema) của các stream. Tại đây bạn có thể:
        - **Xem và lựa chọn các trường (field)** bạn muốn đồng bộ. Ví dụ: chọn hoặc bỏ chọn các trường như `BankCode`, `BankName`, v.v. để chỉ đồng bộ các trường cần thiết.
        - **Xem kiểu dữ liệu của các trường**: như String, Datetime, Boolean, giúp bạn nắm rõ cấu trúc dữ liệu để đảm bảo tính nhất quán khi đồng bộ.
    - **Primary Key** và **Cursor Field** cũng được hiển thị tại đây nếu bạn muốn thiết lập các giá trị này để kiểm soát quá trình đồng bộ.
4. **Settings**:
    
    - Tab này chứa các thiết lập cơ bản và nâng cao cho kết nối. Một số tùy chọn phổ biến bao gồm:
        - **Tần suất đồng bộ**: Bạn có thể thiết lập tần suất tự động đồng bộ như hàng ngày, hàng giờ, hoặc tùy chỉnh theo nhu cầu.
        - **Cấu hình nguồn và đích**: Cho phép chỉnh sửa cấu hình nguồn dữ liệu và đích nếu bạn muốn thay đổi bất kỳ thông tin kết nối nào.
        - **Xóa kết nối**: Nếu bạn không cần kết nối này nữa, bạn có thể xóa để dọn dẹp không gian làm việc.

> [!Warning] Lưu ý
> - Database nguồn chỉ hỗ trợ bảng hoặc view (không hỗ trợ store procedure)

#### Cách 2: kết nối database nguồn là api (xem [[TungLy/Area/Data-WareHouse/ELT - Airbyte/Builder-airbyte-guide]])
![[Pasted image 20241028101630.png]]

### 5. **Chạy Quy Trình ETL (Sync)**

- Nhấn **Sync Now** để thực hiện đồng bộ dữ liệu ngay lập tức hoặc để Airbyte tự đồng bộ theo lịch trình.
- Quá trình ETL sẽ thực hiện theo tuần tự: trích xuất (extract) dữ liệu từ nguồn, biến đổi (transform) nếu cần, và nạp (load) vào đích.
- Sau khi sync data sẽ ra kết quả:
  ![[Pasted image 20241028091104.png]]

### 6. **Quản lý và Giám sát**

- Kiểm tra trạng thái của các kết nối (đang chạy, thành công, hay lỗi).
- Airbyte có tính năng cảnh báo lỗi, ghi lại lịch sử đồng bộ giúp dễ dàng xử lý sự cố.

### 7. **Biến đổi Dữ Liệu (Transform)**

- Airbyte tập trung vào phần ELT (Extract và Load), phần Transform sẽ được thực hiện trong kho dữ liệu (ví dụ, với công cụ dbt để biến đổi dữ liệu).
	- Trong quy trình ELT của Airbyte, **Transform** (biến đổi) diễn ra trong kho dữ liệu sau khi dữ liệu đã được nạp. Sử dụng công cụ như **dbt (Data Build Tool)** cho phép thực hiện các biến đổi bằng SQL, như làm sạch, hợp nhất bảng, tạo các trường tính toán, và chuẩn hóa dữ liệu. Điều này giúp dữ liệu trở nên sẵn sàng cho phân tích và báo cáo, duy trì được độ chính xác và cập nhật khi có dữ liệu mới từ Airbyte.
- Để biến đổi dữ liệu (transform), vào database đích để xử lý
	- Tạo view hoặc viết store procedure để biến đổi dữ liệu
	- Vd:
	- Trước khi biến đổi dữ liệu
	![[Pasted image 20241028100249.png]]
	- Sau khi biến đổi dữ liệu:
	- Tạo view trong sql để biến đổi dữ liệu:
```sql
Create view V_Cleaned_Cat_Bank
as
  SELECT 
    JSON_VALUE(_airbyte_data, '$.ID') AS ID,
    JSON_VALUE(_airbyte_data, '$.BankName') AS BankName,
    JSON_VALUE(_airbyte_data, '$.BankCode') AS BankCode,
    JSON_VALUE(_airbyte_data, '$.IsDelete') AS IsDelete,
    JSON_VALUE(_airbyte_data, '$.IsInactive') AS IsInactive,
    _airbyte_extracted_at
FROM [Test_DataWarehouse].[airbyte_internal].[dbo_raw__stream_Cat_Bank];
```
![[Pasted image 20241028100427.png]]

Tạo View
```sql

CREATE VIEW [dbo].[View_Profile_Birthday]
AS
 
   SELECT     
    JSON_VALUE(Hre_Profile.value, '$.ProfileID') AS ID,
    JSON_VALUE(Hre_Profile.value, '$.CodeEmp') AS CodeEmp,
    JSON_VALUE(Hre_Profile.value, '$.ProfileName') AS ProfileName,
	JSON_VALUE(Hre_Profile.value, '$.DateQuit') AS DateQuit,
	JSON_VALUE(Hre_Profile.value, '$.MonthOfBirth') AS MonthOfBirth,
    _airbyte_extracted_at
FROM 
     [Test_DataWareHouse].[dbo].[dbo_raw__stream_Profile_Birthday]
CROSS APPLY 
    OPENJSON(JSON_QUERY(_airbyte_data, '$.data')) AS Hre_Profile;

```
### 8. **Bảo Trì và Tối Ưu**

- Thực hiện bảo trì định kỳ các kết nối, cập nhật connector khi cần thiết.
- Tối ưu lịch trình đồng bộ để giảm tải cho hệ thống và tăng hiệu suất.

### Tổng kết

Airbyte giúp tự động hóa quy trình ETL với giao diện đơn giản, giúp tiết kiệm thời gian và dễ dàng tích hợp dữ liệu từ nhiều nguồn khác nhau vào một nơi lưu trữ tập trung để phục vụ phân tích và báo cáo.

[[TungLy/Area/Data-WareHouse/ELT - Airbyte/Các thành phần Airbyte]]