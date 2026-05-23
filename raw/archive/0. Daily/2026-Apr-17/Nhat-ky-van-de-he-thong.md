---
Mã:
aliases:
date: 2026-04-26
tags:
  - daily
  - "#nhatkyvande"
Project:
---

 

|                                                                                                      |     |     |     |
| ---------------------------------------------------------------------------------------------------- | --- | --- | --- |
| ## [AAA_001] :  Nội dung                                                                             |     |     |     |
| - [Vấn đề cần ghi nhận nhật ký. Mô tả ngắn gọn ít hơn 25 từ]                                         |     |     |     |
| **Hiện trạng:**                                                                                      |     |     |     |
| - Mô tả hiện trạng. Mô tả bối cảnh<br><br>**Nguyên nhân:**<br><br>- Trình bày nguyên nhân            |     |     |     |
| **Phương án:**                                                                                       |     |     |     |
| - Hình ảnh hoặc mô tả phương án và vừa cho xem quá trình tư duy (đưa ra nhiều phương án để lựa chọn) |     |     |     |

---

  

  

|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |     |     |     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- | --- | --- |
| ## [Sys000] Check nguồn gốc lỗi từ tool có sẵn trong server và tool tích hợp trong HRM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |     |     |     |
| - Cách check link và dự đoán những nguyên nhân lỗi dựa vào các công cụ có sẵn trên server và trên phần mềm HRM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |     |     |     |
| **Hiện trạng:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |     |     |     |
| - Khi link bị lỗi, hình bên dưới là các cách kiểm tra lỗi<br><br>![issuelogs_sys000_000.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_000.png)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |     |     |     |
| **Phương án:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |     |     |     |
| Log Review(tài liệu: [Log Request](https://confluence.vnresource.net:18001/display/SED/Log+Request)) : kiểm tra những lỗi mà bộ phận kỹ thuật đã ghi log (phải đăng nhập superadmin mới thấy tính năng này)<br><br> ![issuelogs_sys000_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_003.png)<br><br>- Log Request (tài liệu: [Log request](https://confluence.vnresource.net:18001/display/SED/Log+Request)): kiểm tra những api lỗi dựa trên request (phải đăng nhập superadmin mới thấy tính năng này)<br>    <br><br> ![issuelogs_sys000_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_002.png)<br><br>- Remote Server: + remote lên server và kiểm tra những file như : lang_vn_spec.xml, field_info_spec.xml, field_hidden_spec.xml<br>    <br><br>Event Viewer: Kiểm tra lỗi, yêu cầu chạy link lỗi trên server. <br><br>![issuelogs_sys007_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_002.png)<br><br>![issuelogs_sys000_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_001.png)<br><br>- IIS Request (Worker procecces): kiểm tra API chạy bao lâu <br>    <br><br>![issuelogs_sys000_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_004.png)<br><br>- IIS Log: xem log từ IIS |     |     |     |

  

---

### Lỗi 405 về tín hiệu network [2022/08/05]

- Lỗi 405 về tín hiệu network

### Hiện trạng

- Không kết nối máy chủ ở HR Service được ![issuelogs_sys001_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys001_001.png)

### Nguyên nhân

- Webconfig chưa đúng.

### Phương án

- Sửa web.config bên main (xóa dòng như hình bên dưới) ![issuelogs_sys001_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys001_002.png)
    
    ---
    

## [Sys002] Không có quyền thư mục IIS_IUSRS 

### - Không có quyền thư mục IIS_IUSRS [2022/08/05]

- Không có quyền thư mục mặc dù đẵ phân quyền IIS_IUSRS

### Hiện trạng

- Không truy cập được file log (access denied), mặc dù đã phân quyền IIS_IUSRS ![issuelogs_sys002_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_001.png)

### Nguyên nhân

- Do copy source từ IIS khác và trước đó đã phân quyền pool cho user khác nên không hiểu quyền thư mục log của user hiện tại.

### Phương án

- Sửa cấu hình authentication của iis web hiện tại, và chọn Anonymous Authentication >> chọn edit >> check vào application pool identity để xác nhận quyền pool của user hiện tại. ![issuelogs_sys002_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_002.png)
- Tiếp theo tiến hành phân quyền thư mục. ![issuelogs_sys002_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_003.png)
- Nếu cách trên vẫn không được, tiến hành hướng dẫn bên dưới (thiết lập 3 source cùng 1 pool): ![issuelogs_sys002_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_004.png)

---

## [Sys003] Bị lỗi outOfMemory do không đủ RAM 

### - Bị lỗi outOfMemory do không đủ RAM [2022/08/05]

- Bị lỗi outOfMemory do không đủ RAM

### Hiện trạng

- Bị lỗi outOfMemory do không đủ RAM

### Nguyên nhân

- Do cấu hình pool trong IIS, nếu chọn “Enable 32 Bit Application” là true thì chỉ dùng được tối đa 4GB RAM.

### Phương án

- Vào pool của IIS chỉnh thông tin “Enable 32 Bit Application” la false (vì dùng 64bit sẽ sử dụng tối đa RAM). Xem hình chi tiết cách cấu hình bên dưới: ![issuelogs_sys003_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys003_001.png)

---

## [Sys004] Gọi link Hrm từ google chat bị lỗi hình răng cưa 

### - Gọi link Hrm từ google chat bị lỗi hình răng cưa [2022/08/05]

- Gọi link HRM từ google chat bị lỗi hình răng cưa, phải refresh trang 1 lần nửa mới vô được trang HRM

### Hiện trạng

- Hệ thống chặn link ngoài gọi vào HRM

### Nguyên nhân

- Do cấu hình pool trong IIS, nếu chọn “Enable 32 Bit Application” là true thì chỉ dùng được tối đa 4GB RAM.

### Phương án

- Add key `<add key="AllowOrigin" value="[https://www.google.com/](https://www.google.com/)" />` vào webconfig (hoặc webSetting.json) main và portal ![issuelogs_sys004_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys004_001.png)

---

## [Sys005] Login main bị lỗi 500 Sys_GetData/GetEnum 

### - Login main bị lỗi 500 Sys_GetData/GetEnum [2022/08/05]

- Login main bị lỗi 500 do api Sys_GetData/GetEnum

### Hiện trạng

- Hệ thống không login được do lỗi 500 api Sys_GetData/GetEnum, link nhà dùng source giống với link khách hàng, tuy nhiên khách hàng bị lỗi này. Hiện trạng là server khách hàng cài mới, cài sql và iis mới ![issuelogs_sys005_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys005_001.png)

### Nguyên nhân

- Do chưa thực thi clr
- Kiểm tra database đã trust chưa?
    
    - Bạn có thể kiểm tra thuộc tính TRUSTWORTHY của cơ sở dữ liệu bằng cách sử dụng câu lệnh sau trong SQL Server Management Studio:
    
    ```SQL
    SELECT name, value  FROM sys.configurations
    WHERE name = 'clr enabled'
    
    declare @dbName nvarchar(1000) = (select DB_NAME())
    SELECT is_trustworthy_on,name FROM sys.databases WHERE name = @dbName;
    ```
    
    - Trong đó `@dbName` là tên của cơ sở dữ liệu mà bạn muốn kiểm tra. Nếu giá trị trả về là 1, điều đó có nghĩa là thuộc tính TRUSTWORTHY đã được bật. Nếu giá trị trả về là 0, điều đó có nghĩa là thuộc tính TRUSTWORTHY đang tắt.

### Phương án

Thực thi câu lệnh sql (nếu database chưa trustWorthy)

**SQL**

 declare @dbName nvarchar(1000) = (select DB_NAME())
set @dbName = 'ALTER DATABASE ' + @dbName+' SET TRUSTWORTHY ON'
exec sp_executesql  @dbName
GO
--
GO
RECONFIGURE;
GO
sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO
EXEC sp_changedbowner 'sa'
ALTER ASSEMBLY [VnResource.DatabaseClr] WITH PERMISSION_SET = UNSAFE;
 

  

![issuelogs_sys005_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys005_002.png)

## [Sys006] Tắt log trong IIS 

### - Tắt log trong IIS [2022/08/10]

- Web sử dụng lâu và dung lượng log tăng quá cao.

### Hiện trạng

- Dung lượng log của IIS tăng quá cao sau 4 năm.

### Nguyên nhân

- Dung lượng log tăng quá cao

### Phương án

#### - Vào IIS chọn Logging

![issuelogs_sys006_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys006_001.png)

#### - Disable tính năng ghi log trong IIS

![issuelogs_sys006_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys006_002.png)

## [Sys007] Ghi nhận file event viewer logs từ server về kiểm tra nguyên nhân lỗi 

### - Ghi nhận file log từ server về kiểm tra nguyên nhân lỗi [2022/08/11]

- Ghi nhận file log từ server về kiểm tra nguyên nhân lỗi.

### Hiện trạng

- Khi hệ thống bị lỗi, window sẽ tiến hành ghi log vào event viewer. Chúng ta tiến hành lấy file log về để kiểm tra nguyên nhân

### Nguyên nhân

- Khi hệ thống bị lỗi, window sẽ tiến hành ghi log vào event viewer. Nhìn vào log, chúng ta sẽ xác định được nguyên nhân lỗi mà không cần mở source debug.

### Phương án

#### - Vào cửa sổ window trên server chứa IIS và vào tìm kiếm `event viewer`

![issuelogs_sys007_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_001.png)

#### - Trong cửa sổ event viewer, chọn Windows Logs\Application. Tiếp theo chọn event log lỗi (dấu hiệu nhận biết log lỗi là có hình icon tam giác màu vàng) và save về máy để gửi cho bộ phận kỹ thuật kiểm tra nguyên nhân.

![issuelogs_sys007_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_002.png)

#### - Để mở file log trên `Event viewer`, ta vào Windows Logs\Application và chọn `open Saved Log` ở gốc phải

![issuelogs_sys007_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_003.png)

#### - Kết quả sau khi mở log, bộ phận kỹ thuật tiến hành kiểm tra và phỏng đoán nguyên nhân lỗi.

![issuelogs_sys007_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_004.png)

## [Sys008] Đăng nhập Portal không được, mặc dù đúng username và Password 

### - Đăng nhập Portal không được, mặc dù đúng username và Password [2022/08/11]

- Đăng nhập portal không thành công, mặc dù thông tin username và password đều đúng. 4 Link đều hoạt động bình thường.

### Hiện trạng

- Khi đăng nhập vào web portal báo sai thông tin đăng nhập. Mặc dù đã kiễm tra lại thông tin đăng nhập đúng. ![issuelogs_sys008_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys008_001.png)

### Nguyên nhân

- ConnectString Database trong file webSettings.json của Portal bị sai. Không trùng với Database của Main.

### Phương án

- Sửa ConnectString Database trong file webSettings.json của Portal ![issuelogs_sys008_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys008_002.png)

## [Sys009] Upload files không vượt quá 20MB 

### - Không upload files vượt quá 20MB [2022/10/19]

- Khi upload files, không thể upload vượt quá 20MB

### Hiện trạng

- Khi upload files, không thể upload vượt quá 20MB

### Nguyên nhân

- Khi upload files với dung lượng lớn sẽ ảnh hưởng hệ thống.

### Phương án

- Cấu hình trong webConfig của web main với attribute maxRequestLength với dung lượng mong muốn nhưng không được vượt quá 20 MB ![issuelogs_sys009_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys009_001.png) vd: <httpRuntime targetFramework="4.6.2" maxRequestLength="20480" />

## [Sys010] Sau khi upbuid xuất hiện lỗi 403.14 không hiện được trang 

### Hiện trạng

- Không vào được trang
- Xuất hiện lỗi 403.14

### Nguyên nhân

- Bản build dang sử dụng trước khi update build bằng tay

### Phương án

- Sử dụng <a href="[https://docs.vnresource.net/vi/general/tools/tool-config-hrm](https://docs.vnresource.net/vi/general/tools/tool-config-hrm)" target="_blank" >tool update tự động </a>
- Trước hợp update bằng tay: Tìm và xóa file <b style=" color: red; font-size: 27px; ">PrecompiledApp.config</b> Tìm và xóa tất cả thư mục <b style=" color: red; font-size: 27px; ">bin</b> Tiến hành giải nén lại <b style=" color: red; font-size: 27px; ">File nén của bản build</b>

## [Sys011] Không thể xem log request 

### Hiện trạng

- Không vào được trang log request
- Xuất hiện lỗi **Unable to load DLL 'SQLite.Interop.dll': The specified module could not be found. (Exception from HRESULT: 0x8007007E)** ![issuelogs_sys011_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_001.png)

### Nguyên nhân

- Do chưa cài Visual C++ 2010,2012,2013,2015-2022 => cài cả X86 và X64

### Phương án

- Cài đặt Visual C++ 2010,2012,2013,2015-2022 => Cài theo thứ tự từ 2010 đến 2022 => cài cả X86 và X64 (Link cài đặt: [https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)) ![issuelogs_sys011_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_003.png)
- Tool chạy sqlLites : [https://sqlitebrowser.org/dl/](https://sqlitebrowser.org/dl/)
- Kết quả: ![issuelogs_sys011_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_002.png)

## [Sys012] Lỗi ghi log request 

### Hiện trạng

- Không ghi log request
- Vào màn hình log request không tìm thấy log request mới nhật mặc dù đã cấu hình ghi log request

### [Nguyên nhân](https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=30965800#nguy%C3%AAn-nh%C3%A2n-13)

- Do không stop tất cả pool khi cập nhật bản build
- Do khi web đang chạy mà cập nhật build thì những file log đang ghi sẽ bị lỗi. Vì thế cần stop pools trước khi cập nhật build

### Phương án

#### Các bước thực hiện

##### Bước 1: Tắt site và pool link đang chạy

##### Bước 2: Vào source -> vào Folder HRM.Prosentation.Main tìm thư mục log

![issuelogs_sys012_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys012_001.png)

##### Bước 3: Trong Folder Log chứa 4 Folder (xóa hoặc chuyển thư mục RequestInformation sang nơi khác)

- HRM.Presentation.EmpPortal (a)
- HRM.Presentation.Hr.Service (b)
- HRM.Presentation.HrmSystem.Service (c)
- HRM.Presentation.Main (d)

- Vào từng Folder trên tìm Folder: RequestInformation “Folder ghi log”

- Back up lại các folder này ra khỏi folder a,b,c,d (cut 4 folder RequestInformation vào 1 folder mới nằm ngoài source rồi lưu lại) ![issuelogs_sys012_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys012_002.png)
    - Sau khi đã cut RequestInformation ra khỏi 4 folder thì mở lại site và start pools chạy bình thường để hệ thống ghi log lại.

## [Sys013] Lỗi không vào hệ thống HRM 

### Hiện trạng

- Lỗi không vào hệ thống HRM

### Nguyên nhân

- Vào event Viewer để xem lỗi gì? => phải chạy link trên server chứa IIS mới thấy được lỗi.
- `Nguyên nhân : do file lang_vn.spec.xml PE chỉnh bị trùng key` ![issuelogs_sys013_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys013_001.png)

### Phương án

#### Tìm ra key đã bị trùng bằng tay hoặc dùng tool kiểm tra key trùng (tools kiểm tra key trùng thì liên hệ Phúc IT được nhận tools

- Vào file lang spec tìm key trùng như tool mô tả và xóa dòng trùng trong file lang. ![issuelogs_sys013_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys013_002.png)

## [Sys014] Không thể xóa file group memory optimized 

> **File group memory optimized** là một tính năng của SQL Server, cho phép bạn tạo các bảng và biến bảng được tối ưu hóa cho bộ nhớ {.is-info}

### Hiện trạng

- Không thể xóa file group memory optimized ![issuelogs_sys014_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys014_001.png)

### Nguyên nhân

- File group memory optimized sau khi đã tạo và cache memory table thì không xóa được

### Phương án

#### Bước 1: Restore db từ file .bak và kiểm tra có dữ liệu bảng Hre_Profile không?

- Trước khi thực hiện bước tiếp theo. Kiểm tra những bảng có loại là Memory_Optimized

**SQL**

--Lấy danh sách bảng Memory_Optimized
SELECT
   o.name AS ObjectName,
   s.name AS SchemaName,
   o.type_desc AS ObjectType
FROM
   sys.filegroups fg
   JOIN sys.data_spaces ds ON fg.data_space_id = ds.data_space_id
   JOIN sys.allocation_units au ON ds.data_space_id = au.data_space_id
   JOIN sys.partitions p ON au.container_id = p.partition_id
   JOIN sys.objects o ON p.object_id = o.object_id
   JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE
   fg.name = 'fg_Memory_Optimized';

- Nếu tồn tại bảng, tiến hành drop table (bên dưới là 2 bảng memory_Optimized cần xóa)

**SQL**

--drop những bảng Memory_Optimized
 drop table Sys_CacheDataPermission
 drop table Sys_TablePermissionCache

#### Bước 2: Detach Database

#### Bước 3: Tạo database mới với tên mới : test123

- Tạo thư mục mới nằm cùng thư mục của database vừa detach. Vd thư mục hiện tại là `d:\db\du-an-A` thì tạo thư mục mới tên là `d:\db\du-an-A\test`
- Tạo database mới với tên `test123 trong thư mục d:\db\du-an-A\test`

#### Bước 4: Chỉnh sửa thông tin db dẫn đến file mdf,ldf vừa detach

**SQL**

alter database test123 modify file (name='test123' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.mdf')
alter database test123 modify file (name='test123_log' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.ldf')

Trong đó: "D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.mdf" và "D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.ldf" là đường dẫn file vừa detach

#### Bước 4.1: restart sql server để cho có dữ liệu bảng Hre_Profile => sau khi có dữ liệu thì tiến hành repair db ở các bước sau.

![issuelogs_sys014_002.jpg](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys014_002.jpg)

#### Bước 5: repair db

**SQL**

alter database test123 set emergency
alter database test123 set single_user with ROLLBACK IMMEDIATE;
dbcc checkdb(test123,repair_allow_data_loss)
alter database test123 set multi_user
alter database test123 set online

  

Giải thích ý nghĩa từng câu lệnh ở trên như sau:

- Lệnh `alter database test123 set emergency` dùng để đặt cơ sở dữ liệu test123 vào chế độ khẩn cấp (emergency mode). Khi đó, cơ sở dữ liệu sẽ chỉ có thể truy cập được bởi quản trị viên, và chỉ cho phép đọc dữ liệu. Chế độ khẩn cấp giúp bạn kiểm tra và khắc phục lỗi nghiêm trọng của cơ sở dữ liệu.
- Lệnh `alter database test123 set single_user with ROLLBACK IMMEDIATE` dùng để đặt cơ sở dữ liệu test123 vào chế độ người dùng đơn (single-user mode). Khi đó, cơ sở dữ liệu sẽ chỉ cho phép một kết nối duy nhất tại một thời điểm, và huỷ bỏ tất cả các giao dịch đang chờ xử lý. Chế độ người dùng đơn giúp bạn thực hiện các thao tác sửa chữa cơ sở dữ liệu mà không bị can thiệp bởi các kết nối khác.
- Lệnh `dbcc checkdb(test123,repair_allow_data_loss)` dùng để kiểm tra và sửa chữa cơ sở dữ liệu test123 bằng cách sử dụng tùy chọn `repair_allow_data_loss`. Khi đó, lệnh sẽ cố gắng khắc phục tất cả các lỗi được báo cáo bởi lệnh `dbcc checkdb`, nhưng có thể gây mất dữ liệu. Tùy chọn `repair_allow_data_loss` nên được sử dụng như một biện pháp cuối cùng để sửa chữa cơ sở dữ liệu.
- Lệnh `alter database test123 set multi_user` dùng để đặt cơ sở dữ liệu test123 trở lại chế độ người dùng nhiều (multi-user mode). Khi đó, cơ sở dữ liệu sẽ cho phép nhiều kết nối cùng lúc, và hoạt động bình thường.
- Lệnh `alter database test123 set online` dùng để đặt cơ sở dữ liệu test123 trở lại trạng thái hoạt động (online). Khi đó, cơ sở dữ liệu sẽ có thể truy cập được bởi các kết nối khác.

#### Bước 6: remove memory optimized filegroup

**SQL**

ALTER DATABASE test123 REMOVE FILEGROUP [fg_Memory_Optimized]

## [Sys015] Giảm dung lượng file log của database về 1 MB 

### Hiện trạng

- Dung lượng file log của database quá lớn, mong muốn giảm dung lượng file log của database về 1 MB

### Nguyên nhân

- Dung lượng file log của database quá lớn

### Phương án

> **Phương án dùng shrinkfile database:** Shrink database là một tính năng của SQL Server, giúp giảm kích thước của cơ sở dữ liệu bằng cách thu nhỏ không gian trống trong các file data và log. Khi bạn thực hiện shrink database, SQL Server sẽ di chuyển các trang dữ liệu từ cuối file về phía trước, để giải phóng không gian trống ở cuối file và trả lại cho hệ thống file. **shrinkfile database có thể giúp bạn tiết kiệm không gian lưu trữ và tối ưu hóa năng suất hoạt động của server**. {.is-info}

> Lưu ý: để shrinkfile database, bạn phải xóa **file group memory optimized**, Phương pháp xóa được hướng dẫn ở mục [Sys014] Không thể xóa file group memory optimized trong trang "Nhật ký vấn đề" {.is-warning}

**SQL**

USE tên_DB;
GO
ALTER DATABASE tên_DB SET RECOVERY SIMPLE;
GO
--Ten_log tên file log, shrink về còn 1 mb
DBCC SHRINKFILE (Ten_log, 1);
GO
ALTER DATABASE tên_DB SET RECOVERY FULL;
GO

`Bên dưới là các bước Shrink database giúp giảm dung lượng file log của database về 1 MB`

#### Bước 1: bạn cần thay đổi recovery model của database MB thành SIMPLE bằng lệnh sau:

**SQL**

ALTER DATABASE MB SET RECOVERY SIMPLE;
GO

#### Bước 2: bạn cần thu nhỏ file log của database về 1 MB bằng lệnh sau:

**SQL**

DBCC SHRINKFILE (Ten_log, 1);
GO

#### Bước 3:Bạn có thể kiểm tra dung lượng file log của database MB sau khi thực hiện các lệnh trên bằng lệnh sau:

**SQL**

SELECT name, size/128.0 AS size_in_MB FROM sys.database_files WHERE type = 1;
GO

#### Bước 3: Nếu bạn muốn khôi phục recovery model của database MB thành FULL, bạn cần thực hiện lệnh sau:

**SQL**

ALTER DATABASE MB SET RECOVERY FULL;
GO

  

#### Kết quả sau khi shrinkfile

![issuelogs_sys015_001.jpg](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys015_001.jpg)

## [Sys016] Lỗi không tự xóa log sau 30 ngày 

### Hiện trạng

- Lỗi không tự xóa log sau 30 ngày

### Nguyên nhân

- Xử lý xóa log của hệ thống, khi tạo thư mục không hợp lệ sẽ không tự xóa log.

### Phương án

- Tạo scheduler task trong window để xử lý xóa log tự động.

#### Bước 1

- Download file import task có sẵn theo đính kèm : [issuelogs_sys016_deletehrmlog_001.xml](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys016_deletehrmlog_001.xml)

#### Bước 2

- Tìm ứng dụng `Task Scheduler` trong window
- Tạo một thư mục trong Task scheduler
- Thực hiện import task từ file đính kèm ở bước 1 (chọn file `issuelogs_sys016_deletehrmlog_001.xml`) và tiến hành import task. ![issuelogs_sys016_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys016_002.png)
- Giải thích các tham số: <strong> /p "D:\HRM.Presentation.Main\Log" /s /d -30 /c "cmd /c del @file" </strong>
    - `D:\HRM.Presentation.Main\Log` : là thư mục chứa file log
    - `-30` : là chỉ xóa những file log trước đó 30 ngày (có thể tùy chỉnh theo ý cá nhân)

> Lưu ý: tab Triggers : dùng để tạo scheduler chạy hàng ngày, hàng tuần hay hàng tháng tab Actions: dùng để thực thi xử lý xóa log (thông qua ForFiles - lệnh thực hiện trên 1 file hoặc một tập hợp file có sẵn trong window, lệnh ForFiles hữu ích cho xử lý hàng loạt) Link tham khảo tạo task scheduler : [https://dacocach.com/xoa-file-windows-10/](https://dacocach.com/xoa-file-windows-10/) {.is-warning}

## [Sys017] Phân quyền hệ thống, portal không nhận key quyền vừa phân quyền 

### Hiện trạng

- Phân quyền hệ thống, portal (api center) không nhận key quyền vừa phân quyền

### Nguyên nhân

- Không refresh cache quyền khi phân nhóm quyền, do thiếu cấu hình `Hrm_APICenter_Web` trong `WebSettings.json` của `WebMain`.

### Phương án

- Để tránh việc không refresh cache quyền trong api center khi phân nhóm quyền, cần kiểm tra cấu hình `Hrm_APICenter_Web` trong tệp `WebSettings.json` của `WebMain`. Nếu có key này, hệ thống sẽ tự động refresh cache khi chỉnh sửa nhóm quyền trong api center.

> - Vd: `"Hrm_APICenter_Web": "[https://pehn02.vnresource.net:2425/](https://pehn02.vnresource.net:2425/)"`
> - Trong đó, key `Hrm_APICenter_Web` là đường link của api Center API. {.is-info}

![issuelogs_sys017_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys017_001.png)

  

|   |   |   |   |
|---|---|---|---|
|## [Sys018] Kiểm tra kết nối mạng|   |   |   |
|- Kiểm tra kết nối mạng|   |   |   |
|**Hiện trạng:**|   |   |   |
|**Hiện trạng:**<br><br>- Người dùng đang gặp các vấn đề liên quan đến kết nối mạng, ví dụ như: <br>    <br>    - Không truy cập được vào website hoặc máy chủ từ xa.<br>    - Không kết nối được đến dịch vụ cụ thể (như một ứng dụng web, cơ sở dữ liệu).<br>    - Khó khăn trong việc phân giải tên miền hoặc truy cập một dịch vụ mạng qua cổng nhất định.<br><br>**Nguyên nhân:**<br><br>- Các nguyên nhân phổ biến có thể bao gồm: <br>    <br>    - **DNS phân giải sai hoặc không thể phân giải.**<br>        - Ví dụ: Máy không thể phân giải tên miền thành địa chỉ IP.<br>    - **Cổng TCP không mở hoặc bị tường lửa chặn.**<br>        - Ví dụ: Kết nối đến dịch vụ qua cổng 80 (web) hoặc cổng 443 (SSL) bị chặn.<br>    - **Cấu hình mạng hoặc Gateway không chính xác.**<br>        - Ví dụ: Sai địa chỉ IP, Gateway hoặc các thiết lập mạng không đúng, khiến máy không thể kết nối ra ngoài.|   |   |   |
|**Phương án:**|   |   |   |
|- Để chẩn đoán và khắc phục các vấn đề này, bạn có thể thực hiện các phương pháp sau, sử dụng `Test-NetConnection` để xác minh kết nối mạng và tìm ra nguyên nhân:<br>    <br>    #### **Ví dụ 1: Kiểm tra phân giải DNS**<br>    <br>    - **Phương pháp:** Kiểm tra việc phân giải tên miền thành địa chỉ IP.<br>    - **Cách làm:**<br>        <br>        **PowerShell**<br>        <br>        Test-NetConnection google.com<br>        <br>    - **Kết quả:** Nếu phân giải DNS thành công, hệ thống sẽ trả về địa chỉ IP của `[google.com](http://google.com/)`. Nếu thất bại, bạn có thể cần kiểm tra cấu hình DNS hoặc sử dụng máy chủ DNS khác.<br>    <br>    #### **Ví dụ 2: Kiểm tra kết nối TCP đến một dịch vụ qua cổng cụ thể**<br>    <br>    - **Phương pháp:** Kiểm tra kết nối TCP đến một dịch vụ web thông qua cổng 80 (HTTP) hoặc cổng 443 (HTTPS).<br>    - **Cách làm:**<br>        <br>        **PowerShell**<br>        <br>        Test-NetConnection google.com -Port 80<br>        <br>    - **Kết quả:** Nếu kết nối thành công, nghĩa là cổng 80 của dịch vụ đang hoạt động bình thường. Nếu thất bại, có thể do tường lửa chặn cổng hoặc dịch vụ không khả dụng.<br>    <br>    #### **Ví dụ 3: Kiểm tra kết nối mạng cục bộ**<br>    <br>    - **Phương pháp:** Kiểm tra thông tin kết nối mạng trên máy cục bộ, bao gồm địa chỉ IP, Gateway, DNS.<br>    - **Cách làm:**<br>        <br>        **PowerShell**<br>        <br>        Test-NetConnection<br>        <br>    - **Kết quả:** Kết quả sẽ trả về thông tin về trạng thái mạng hiện tại. Nếu phát hiện lỗi, người dùng có thể phải kiểm tra lại cấu hình mạng hoặc khởi động lại thiết bị mạng (router, modem).|   |   |   |

---

  

## [App019] Lỗi chọn loại tài khoản là khác portal nhưng vẫn đăng nhập được trên portal và App

  

- Hiện trạng trên Portal V2 và App V2 đang bị lỗi khi user tạo tài khoản với loại tài khoản khác "portal" => Hiện tại trên V2 sẽ không hỗ trợ fix (V3 đã đáp ứng). nếu sau có dự án dùng V2 sẽ fix sau.

  

|   |   |   |   |
|---|---|---|---|
|## [Sys_020] :  Mật khẩu giải mã (VnrDecrypt) có thể thay đổi hay không|   |   |   |
|- Khách hàng hỏi mật khẩu giải mã có thể thay đổi được không?<br>    <br>- Vd: select dbo.VnrDecrypt('spdIziW5u8AeB2Ed8nG/fA==')|   |   |   |
|**Hiện trạng:**|   |   |   |
|- Hệ thống đang mã hoá dữ liệu bằng thuật toán SHA2-512.<br>    <br>- Một mật khẩu cố định được nhúng trong DLL framework, lập trình viên cũng không biết giá trị này.<br>    <br>- Ngoài ra, mỗi source có một mật khẩu riêng để tăng cường bảo mật.<br>    <br>- Khi build ra assembly và tạo function cho sql sử dụng, mật khẩu cố định được dùng cho việc giải mã.<br>    <br><br>![](https://confluence.vnresource.net:18001/download/attachments/39911747/image-2025-9-25_10-29-38.png?version=1&modificationDate=1758770979926&api=v2)<br><br>**Nguyên nhân:**<br><br>- Mật khẩu được gắn cứng trong DLL và đi theo từng source.<br>    <br>- Nếu thay đổi mật khẩu thì toàn bộ dữ liệu đã mã hoá trước đó sẽ không còn giải mã được, dẫn đến mất toàn vẹn dữ liệu.|   |   |   |
|**Phương án:**|   |   |   |
|**Giữ nguyên thiết kế hiện tại**<br><br>- **Mô tả:** Mật khẩu giải mã được nhúng cứng trong DLL và source.<br>    <br>- **Ưu điểm:** Bảo mật cao, ít rủi ro thay đổi.<br>    <br>- **Nhược điểm:** Không thể thay đổi mật khẩu sau khi dữ liệu đã mã hoá.|   |   |   |

---

  

---

|   |   |   |   |
|---|---|---|---|
|## [Sys_021] :  Giải trình việc cấp quyền SYSADMIN trong SQL Server|   |   |   |
|- Một số thao tác trong quá trình triển khai hệ thống (như bật CLR, tạo Assembly mã hóa dữ liệu, ký chứng chỉ xác thực) yêu cầu **quyền sysadmin** trong SQL Server.  <br>    Điều này khiến khách hàng thắc mắc **vì sao phải cấp quyền sysadmin**, thay vì dùng quyền `db_owner` thông thường.|   |   |   |
|**Hiện trạng:**|   |   |   |
|- Khi triển khai hoặc restore database, hệ thống HRM có sử dụng các hàm CLR như `dbo.VnrDecrypt`.<br>    <br>- Các hàm này chỉ hoạt động khi cấu hình `clr enabled` được bật và assembly được nạp vào SQL Server.<br>    <br>- Tuy nhiên, thao tác này yêu cầu thay đổi cấu hình cấp **máy chủ (server level)**, vượt quá quyền hạn của `db_owner`.<br>    <br><br>**Nguyên nhân:**<br><br>- **SQL Server từ phiên bản 2017** trở đi bật mặc định **`clr strict security = 1`**, yêu cầu mọi assembly phải được ký chứng chỉ tin cậy hoặc được nạp bởi **sysadmin**.<br>    <br>- Các thao tác như:<br>    <br>    - `sp_configure 'clr enabled'`, `RECONFIGURE`<br>        <br>    - `CREATE ASSEMBLY`, `CREATE ASYMMETRIC KEY`, `CREATE LOGIN FROM ASYMMETRIC KEY`  <br>        đều là **server-scope commands**, chỉ thực hiện được bởi **sysadmin**.<br>        <br>- Vì vậy, tài khoản triển khai (Deployment Account) cần sysadmin **tạm thời** để thực hiện.|   |   |   |
|**Phương án:**|   |   |   |
|- **A. Giai đoạn cần sysadmin:**<br>    <br>    1. Khi **cài đặt mới hoặc nâng cấp hệ thống**<br>        <br>        - Bật cấu hình CLR: `sp_configure 'clr enabled', 1; RECONFIGURE;`<br>            <br>        - Tạo/ký assembly để nạp DLL mã hóa (`VnResource.DatabaseClr.dll`).<br>            <br>        - Đăng ký các hàm CLR như `dbo.VnrDecrypt`.<br>            <br>    2. Khi **restore database**<br>        <br>        - Kích hoạt lại CLR và nạp lại assembly để hàm hoạt động.<br>            <br>    <br>    ➡️ Sau khi hoàn tất, **thu hồi quyền sysadmin ngay**.<br>    <br>    ---<br>    <br>    **B. Giai đoạn vận hành (user thông thường):**<br>    <br>    - Ứng dụng chỉ cần quyền `EXECUTE` để sử dụng hàm CLR.<br>        <br>        `GRANT EXECUTE ON dbo.VnrDecrypt TO [AppUser];`<br>        <br>    - Người dùng không cần sysadmin vẫn có thể gọi hàm mã hóa/giải mã trong nghiệp vụ hằng ngày.<br>        <br>    <br>    ---<br>    <br>    **C. Cam kết bảo mật:**<br>    <br>    - Không cấp quyền sysadmin cho người dùng ứng dụng.<br>        <br>    - Chỉ cấp sysadmin tạm thời cho tài khoản triển khai.<br>        <br>    - Ghi log toàn bộ thao tác và thu hồi sau khi hoàn tất.<br>        <br>    - Tuân thủ nguyên tắc **“Least Privilege”** – chỉ cấp quyền tối thiểu cần thiết.|   |   |   |
||   |   |   |

---

|   |   |   |   |
|---|---|---|---|
|## [Sys_022] :  SQL chạy chậm do chỉ sử dụng 1 nhân CPU (MAXDOP = 1)|   |   |   |
|- SQL Server chỉ dùng 1 CPU cho mỗi truy vấn, dẫn đến hiệu suất xử lý thấp với các truy vấn nặng.|   |   |   |
|**Hiện trạng:**|   |   |   |
|- Kiểm tra cấu hình song song hiện tại:<br><br>**SQL**<br><br>SELECT name, value_in_use<br>FROM sys.configurations<br>WHERE name = 'max degree of parallelism';<br><br>Kết quả: `max degree of parallelism = 1` → SQL chỉ chạy **1 luồng CPU** cho mỗi truy vấn.<br><br>**Nguyên nhân:**<br><br>- Tham số `MAXDOP` (**Max Degree of Parallelism**) quy định số **nhân CPU tối đa** mà **một truy vấn** được phép sử dụng cùng lúc.<br>    <br>- Khi đặt `MAXDOP = 1`, SQL sẽ chạy **đơn luồng** → các truy vấn tổng hợp, JOIN hoặc báo cáo lớn sẽ **chạy chậm rõ rệt** do không tận dụng được đa nhân CPU.|   |   |   |
|**Phương án:**|   |   |   |
|- Tăng số luồng xử lý song song lên **8 nhân CPU** để tận dụng tài nguyên máy chủ:<br><br>EXEC sp_configure 'show advanced options', 1; RECONFIGURE;<br>EXEC sp_configure 'max degree of parallelism', 8; RECONFIGURE;<br><br>Kiểm tra lại sau khi thay đổi:<br><br>SELECT name, value_in_use<br>FROM sys.configurations<br>WHERE name = 'max degree of parallelism';<br><br>![](https://confluence.vnresource.net:18001/download/attachments/39911747/image-2025-10-30_11-24-3.png?version=1&modificationDate=1761798243228&api=v2)<br><br>### **Kết quả mong đợi**<br><br>- SQL Server cho phép truy vấn nặng chạy **tối đa 8 luồng song song**.<br>    <br>- Thời gian xử lý báo cáo hoặc thống kê **giảm đáng kể**.<br>    <br>- CPU được **phân bổ đều hơn** giữa các nhân, tránh nghẽn tại 1 core.|   |   |   |