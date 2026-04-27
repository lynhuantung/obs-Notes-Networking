![](Sys_TaiLieuGetAPIToExcel_07_image2.png)

<u>Document History</u>

| **Date** | **Revision** | **Description** | **Prepared by** | **Approved by** |
|:--:|:--:|----|:--:|:--:|
| 30/05/2022 | 1.0 | Tài liệu hướng dẫn lấy API và load dữ liệu sang excel | Tung.Ly@VnResource.vn |  |

<u>Contents</u>

[1. Mục Tiêu [2](#mục-tiêu)](#mục-tiêu)

[2. Lấy API [3](#lấy-api)](#lấy-api)

[2.1 Lấy token của API. [3](#lấy-token-và-api-get-profiles-của-api.)](#lấy-token-và-api-get-profiles-của-api.)

[3. Lấy dữ liệu từ database [9](#lấy-dữ-liệu-từ-database)](#lấy-dữ-liệu-từ-database)

[3.1 Lấy Dữ Liệu Trực Tiếp Từ Bảng Trong DataBase [9](#lấy-dữ-liệu-trực-tiếp-từ-bảng-trong-database)](#lấy-dữ-liệu-trực-tiếp-từ-bảng-trong-database)

[3.2 Lấy Dữ Liệu Từ Các Bảng Đã Chọn Trong DataBase [10](#lấy-dữ-liệu-từ-các-bảng-đã-chọn-trong-database)](#lấy-dữ-liệu-từ-các-bảng-đã-chọn-trong-database)

[3.3 Lấy Dữ Liệu Trực Tiếp Từ Store Procedure [11](#lấy-dữ-liệu-trực-tiếp-từ-store-procedure)](#lấy-dữ-liệu-trực-tiếp-từ-store-procedure)

# Mục Tiêu

- Giải quyết vấn đề import đối với những bảng trong database có ID nhưng không có khóa ngoại và cho phép get API (theo loại token là Bearer) từ HRM để giải quyết những vấn đề get dữ liệu theo mong muốn khách hàngHướng dẫn lấy API sang Excel

- Excel 2016 trở lên hỗ trợ gọi API, những phiên bản trước đó phải cài thêm addon.

- File excel đã cấu hình API:![](Sys_TaiLieuGetAPIToExcel_07_image3.emf)

# Lấy API

## Lấy token và API get Profiles của API.

- Bước 1 : mở excel, chọn tab **Data** -\> **Get Data** -\> **From other Sources** -\> chọn **Blank Query**

> ![](Sys_TaiLieuGetAPIToExcel_07_image4.png)

- Bước 2: trong **power query**, chọn **Home** -\> chọn **Advance Editor**

> Nhập nội dung để get token :
>
> let
>
> url = "https://main-tl.dev.local:3001/Token",
>
> headers = \[#"Content-Type" = "application/x-www-form-urlencoded", \#"Accept" = "/"\],
>
> postData = \[
>
> grant_type = "password",
>
> username = "khang.nguyen",
>
> password = "Zxcv@123"
>
> \],
>
> tokenResponse = Json.Document(Web.Contents(url,
>
> \[
>
> Headers = headers,
>
> Content = Text.ToBinary(Uri.BuildQueryString(postData))
>
> \])),
>
> token = tokenResponse\[access_token\],
>
> Source=Json.Document(Web.Contents("https://main-tl.dev.local:3001/api/Hre_Profile/Get?PageIndex=1&PageSize=10000&IsCurrentUpdate=0",
>
> \[Timeout=#duration(0, 0, 15, 0), Headers=\[Authorization="Bearer " & token\]\]))
>
> in
>
> Source

Chú thích:

- <https://main-tl.dev.local:3001/Token> : đây là API get token

- <http://172.21.30.43:5555/api/Hre_Profile/Get?PageIndex=1&PageSize=10000&IsCurrentUpdate=0> : đây là API get dữ liệu

- Headers : Content Type

- PostData : nhập thông tin grant_type, username, password

> ![](Sys_TaiLieuGetAPIToExcel_07_image5.png)
>
> Giải thích code: Đây là mã Power Query để lấy dữ liệu từ một API của hệ thống quản lý nhân sự. Bước đầu tiên là lấy token từ API thông qua gửi một request POST lên đường dẫn /Token với các thông tin đăng nhập: grant_type, username, password.
>
> ![](Sys_TaiLieuGetAPIToExcel_07_image6.png)
>
> Kết quả của request này sẽ trả về một object JSON chứa thông tin token, sau đó ta lấy token này để gọi request tiếp theo đến API để lấy dữ liệu.
>
> ![](Sys_TaiLieuGetAPIToExcel_07_image7.png)
>
> Request này lấy dữ liệu từ đường dẫn /api/Hre_Profile/Get với các tham số PageIndex, PageSize, IsCurrentUpdate. Ta thêm thông tin Authorization vào headers của request này với giá trị là "Bearer " + token lấy được từ bước trước đó. Sau đó mã Power Query sử dụng hàm Json.Document để chuyển đổi dữ liệu trả về từ API thành dạng bảng.

- Bước 3: Xuất hiện khung **Power Query Editor**

  - Click chuột vào “**List**” để cho ra danh sách dữ liệu lấy từ API

> ![](Sys_TaiLieuGetAPIToExcel_07_image8.png)

- Bước 3: Xuất hiện khung Power Query Editor

  - Phải chuột chọn “**List**” và chọn “**To Table**” -\> xuất hiện khung To Table, chọn “**OK**”

> ![](Sys_TaiLieuGetAPIToExcel_07_image9.png)

- Bước 4: Ra danh sách dữ liệu cần xử lý

  - Chọn vào khung như hình, và chọn những field cần hiển thị , tiếp theo bỏ prefix để tạo ra cột theo tên field, cuối cùng chọn ok

> ![](Sys_TaiLieuGetAPIToExcel_07_image10.png)

- Bước 5: Xuất hiện danh sách dữ liệu cần thiết

  - Sau khi xuất hiện dữ liệu ưng ý, tiến hành chọn close & Load để tải dữ liệu sang sheet trong excel

> ![](Sys_TaiLieuGetAPIToExcel_07_image11.png)

- Bước 6: Kết quả các dữ liệu xuất hiện ở 1 sheet trong excel

  - Nếu dữ liệu trên sheet không phải mới nhất -\> tiến hành refresh để gọi API lấy dữ liệu mới nhất về.

> ![](Sys_TaiLieuGetAPIToExcel_07_image12.png)

# Lấy dữ liệu từ database

## Lấy Dữ Liệu Trực Tiếp Từ Bảng Trong DataBase

- Lấy dữ liệu với câu lệnh trực tiếp từ Sql Server

> ![](Sys_TaiLieuGetAPIToExcel_07_image13.png)

##  Lấy Dữ Liệu Từ Các Bảng Đã Chọn Trong DataBase

- Chọn 1 số bảng trong SQL Server để tiến hành xử lý dữ liệu

> ![](Sys_TaiLieuGetAPIToExcel_07_image14.png)

##  Lấy Dữ Liệu Trực Tiếp Từ Store Procedure

- Excel cho phép kết nối SQL Server và load dữ liệu từ store procedure

![](Sys_TaiLieuGetAPIToExcel_07_image15.png)

- Bước 1: Chọn kết nối với SQL server với thông tin server, user/pass

- Bước 2 : Gọi store thực thi

  - Câu lệnh thực thi : <span class="mark">exec hrm_cat_sp_get_Bank null,null,0,1,2000,'hanh.nguyen','id'</span>

- Tiến hành xử lý dữ liệu.
