---
aliases: 
date: 2024-07-27
tags:
  - daily
  - "#powerBI"
permalink: "[[Power BI]]"
---
## Tài liệu Power Query

### Phần 1: Giới thiệu

**Power Query** là công cụ trong Power BI giúp bạn kết nối, nhập, biến đổi và làm sạch dữ liệu từ nhiều nguồn khác nhau. Mục tiêu của Power Query là:

1. **Kết nối dữ liệu từ nhiều nguồn**: Excel, CSV, SQL Server, SharePoint, web, v.v.
2. **Biến đổi và làm sạch dữ liệu**: Lọc, sắp xếp, thay đổi kiểu dữ liệu, tách/ghép cột, thêm cột tính toán.
3. **Hợp nhất dữ liệu**: Kết hợp dữ liệu từ nhiều nguồn khác nhau.
4. **Tự động hóa quy trình ETL**: Tiết kiệm thời gian và giảm thiểu lỗi khi xử lý dữ liệu lặp lại.
5. **Tăng cường khả năng lập báo cáo và phân tích**: Chuẩn bị dữ liệu hiệu quả để tạo ra báo cáo và biểu đồ chính xác.

### Phần 2: Thực hành

#### 1. Cài đặt và thiết lập ban đầu

- **Cài đặt**: Tải và cài đặt Power BI Desktop từ trang chủ Microsoft.

#### 2. Tạo kết nối dữ liệu

1. **Excel**:
    
    - Home > Get Data > Excel.
    - Chọn tệp Excel > Chọn bảng.
2. **CSV**:
    
    - Home > Get Data > Text/CSV.
    - Chọn tệp CSV > Open.
3. **SQL Server**:
    
    - Home > Get Data > SQL Server.
    - Nhập thông tin máy chủ và cơ sở dữ liệu.
4. **Web**:
    
    - Home > Get Data > Web.
    - Nhập URL chứa dữ liệu.

#### 3. Biến đổi dữ liệu

1. **Lọc dữ liệu**:
    
    - Chọn cột > Filter Rows > Nhập điều kiện lọc.
2. **Sắp xếp**:
    
    - Chọn cột > Sort Ascending/Descending.
3. **Thay đổi kiểu dữ liệu**:
    
    - Chọn cột > Transform > Data Type > Chọn kiểu dữ liệu.
4. **Tách cột**:
    
    - Chọn cột > Split Column > By Delimiter.
5. **Ghép cột**:
    
    - Chọn các cột > Merge Columns.

#### 4. Hợp nhất dữ liệu

1. **Append Queries**:
    
    - Home > Append Queries > Chọn các bảng để hợp nhất.
2. **Merge Queries**:
    
    - Home > Merge Queries > Chọn các bảng và cột khóa để kết hợp.

#### 5. Tự động hóa quy trình ETL

1. **Advanced Editor**:
    - Home > Advanced Editor > Viết mã M.

#### 6. Tạo Blank Query và nhập mã

1. **Tạo Blank Query**:
    
    - Home > Get Data > Blank Query.
    - Chọn Advanced Editor.
2. **Nhập đoạn mã dưới đây vào Advanced Editor**:
```js
let
    // Step 1: Get the access token
    url = LinkAPI & "/Token",
    headers = [
        #"Content-Type" = "application/x-www-form-urlencoded", 
        #"Accept" = "/"
    ],
    postData = [
        grant_type = "password",
        username = UserName,
        password = Password
    ],
    tokenResponse = Json.Document(Web.Contents(url,
    [
        Headers = headers,
        Content = Text.ToBinary(Uri.BuildQueryString(postData))
    ])),
    token = tokenResponse[access_token],
    
    // Step 2: Get the data from the API
    Source = Json.Document(Web.Contents(LinkAPI & "/api/Hre_Profile/GetListDataCustomByStore?storeName=API_SP_GET_BANK",
    [
        Timeout=#duration(0, 0, 15, 0), 
        Headers=[Authorization="Bearer " & token]
    ])),
    
    // Step 3: Convert to table and get the list of records
    #"Converted to Table" = Record.ToTable(Source),
    Value = #"Converted to Table"{1}[Value],
    #"Converted to Table1" = Table.FromList(Value, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    
    // Step 4: Get the list of column names dynamically
    FirstRecord = #"Converted to Table1"{0}[Column1],
    ColumnNames = Record.FieldNames(FirstRecord),
    
    // Step 5: Expand the table using dynamic column names
    #"Expanded Columns" = Table.ExpandRecordColumn(#"Converted to Table1", "Column1", ColumnNames, ColumnNames)
in
    #"Expanded Columns"

```
```
```

#### 7. Lập báo cáo

- Kéo dữ liệu đã chuẩn bị từ Fields vào không gian làm việc để tạo báo cáo và biểu đồ.

#### 8. Tài liệu tham khảo

- [Microsoft Power BI](https://powerbi.microsoft.com/)
- [Power Query Guide](https://docs.microsoft.com/en-us/power-query/)