---
aliases: 
date: 2024-07-27
tags:
  - daily
  - "#powerBI"
---
## Cách filter power BI

![[Pasted image 20240727210043.png]]

![[Pasted image 20240727210101.png]]


// link nhúng power BI không filter
https://app.powerbi.com/reportEmbed?reportId=6ef7732c-1862-46d0-8ed6-9541345d3267&autoAuth=true&ctid=115e1d60-519a-41d7-93ab-a6bae03fbefe&refreshAccessToken=true

// link nhúng power BI có truyền filter => ở đây truyền filter là phân hệ HRE (GetMantisAllModules/Module là tên bảng và tên field cần filter)
https://app.powerbi.com/reportEmbed?reportId=6ef7732c-1862-46d0-8ed6-9541345d3267&autoAuth=true&ctid=115e1d60-519a-41d7-93ab-a6bae03fbefe&refreshAccessToken=true&filter=GetMantisAllModules/Module%20eq%20%27HRE%27

Tham số filter=GetMantisAllModules/Module%20eq%20%27HRE%27
truyền filter theo HRE



## Tạo power query động
let
    // Step 1: Get the access token
    // Lấy access token: Đoạn mã này giữ nguyên như ban đầu để lấy token từ API.
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
    // Lấy dữ liệu từ API: Đoạn mã này giữ nguyên để lấy dữ liệu JSON từ API.
    Source = Json.Document(Web.Contents(LinkAPI & "/api/Hre_Profile/GetListDataCustomByStore?storeName=API_SP_GET_BANK",
    [
        Timeout=#duration(0, 0, 15, 0), 
        Headers=[Authorization="Bearer " & token]
    ])),
    
    // Step 3: Convert to table and get the list of records
    // Chuyển đổi sang bảng và lấy danh sách bản ghi: Chuyển dữ liệu JSON sang bảng và lấy danh sách các bản ghi.
    #"Converted to Table" = Record.ToTable(Source),
    Value = #"Converted to Table"{1}[Value],
    #"Converted to Table1" = Table.FromList(Value, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    
    // Step 4: Get the list of column names dynamically
    // Lấy danh sách tên cột động: Sử dụng bản ghi đầu tiên để lấy danh sách tên cột bằng cách dùng Record.FieldNames
    FirstRecord = #"Converted to Table1"{0}[Column1],
    ColumnNames = Record.FieldNames(FirstRecord),
    
    // Step 5: Expand the table using dynamic column names
    // Mở rộng bảng sử dụng tên cột động: Sử dụng danh sách tên cột đã lấy để mở rộng bảng, không cần xác định trước các tên cột.
    #"Expanded Columns" = Table.ExpandRecordColumn(#"Converted to Table1", "Column1", ColumnNames, ColumnNames)
in
    #"Expanded Columns"

---
Phần 1: Giới thiệu về Power BI
Power BI là một bộ công cụ phân tích kinh doanh từ Microsoft, cung cấp khả năng trực quan hóa dữ liệu, chia sẻ thông tin chi tiết và tích hợp với nhiều nguồn dữ liệu khác nhau. Power BI bao gồm các thành phần chính sau:

Phần 2: Các Thành Phần Chính của Power BI
1. Power BI Desktop
Mô tả: Ứng dụng máy tính để bàn dùng để tạo báo cáo và trực quan hóa dữ liệu.
Chức năng:
Tạo và thiết kế báo cáo.
Kết nối với nhiều nguồn dữ liệu.
Sử dụng các tính năng như Power Query và DAX (Data Analysis Expressions) để biến đổi và phân tích dữ liệu.
2. Power BI Service (Power BI Online)
Mô tả: Nền tảng trực tuyến để chia sẻ và cộng tác trên các báo cáo và bảng điều khiển.
Chức năng:
Chia sẻ báo cáo và bảng điều khiển với người dùng khác.
Cộng tác và bình luận trực tiếp trên các báo cáo.
Thiết lập và quản lý các cảnh báo và thông báo.
3. Power BI Mobile
Mô tả: Ứng dụng di động cho các thiết bị iOS và Android để xem và tương tác với các báo cáo và bảng điều khiển trên điện thoại hoặc máy tính bảng.
Chức năng:
Xem báo cáo và bảng điều khiển mọi lúc, mọi nơi.
Nhận thông báo và cảnh báo trực tiếp trên thiết bị di động.
4. Power BI Report Server
Mô tả: Máy chủ báo cáo tại chỗ (on-premises) để lưu trữ và quản lý các báo cáo Power BI cũng như các báo cáo truyền thống (paginated reports).
Chức năng:
Lưu trữ báo cáo Power BI tại chỗ.
Kết hợp các báo cáo Power BI và các báo cáo truyền thống trong một nền tảng duy nhất.
5. Power BI Embedded
Mô tả: Dịch vụ Azure cho phép các nhà phát triển tích hợp báo cáo và bảng điều khiển Power BI vào ứng dụng của họ.
Chức năng:
Tích hợp các khả năng phân tích và trực quan hóa dữ liệu vào ứng dụng mà không cần phải xây dựng từ đầu.
6. Power BI Gateway
Mô tả: Phần mềm kết nối trực tiếp với các nguồn dữ liệu tại chỗ để làm mới dữ liệu và đảm bảo tính nhất quán giữa dữ liệu tại chỗ và trong Power BI Service.
Chức năng:
Hỗ trợ kết nối an toàn và làm mới dữ liệu từ các nguồn dữ liệu tại chỗ.
Cho phép kết nối trực tiếp với cơ sở dữ liệu tại chỗ như SQL Server, Oracle, SharePoint, v.v.
Phần 3: Tổng Quan về Quy Trình Làm Việc với Power BI
Thu thập dữ liệu: Kết nối với các nguồn dữ liệu bằng Power BI Desktop.
Biến đổi dữ liệu: Sử dụng Power Query để làm sạch và biến đổi dữ liệu.
Phân tích dữ liệu: Sử dụng DAX để tạo các phép tính và biểu thức phân tích.
Trực quan hóa dữ liệu: Tạo các báo cáo và bảng điều khiển với các biểu đồ và hình ảnh trực quan.
Chia sẻ và cộng tác: Đăng tải báo cáo lên Power BI Service và chia sẻ với người dùng khác.
Di động và trực tuyến: Xem báo cáo và bảng điều khiển trên Power BI Mobile hoặc tích hợp vào ứng dụng qua Power BI Embedded.
Bảo mật và quản lý: Sử dụng Power BI Gateway và Power BI Report Server để quản lý dữ liệu và báo cáo an toàn.