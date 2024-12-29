---
Mã: Sys001
aliases: 
date: 2024-06-02
tags:
  - "#nhatkyvande"
permalink: "[[0.Nhật Ký Vấn Đề]]"
---
# NHẬT KÝ VẤN ĐỀ DỰNG LINK

## ==0. Mẫu nhật ký vấn đề==

### Tiêu đề nhật ký vấn đề

- Mô tả ngắn gọn ít hơn 25 từ

### Hiện trạng

- [Mô tả hiện trạng. Mô tả bối cảnh]

### Nguyên nhân

- [Mô tả nguyên nhân]

### Phương án

- [Hình ảnh hoặc mô tả phương án và vừa cho xem quá trình tư duy (đưa ra nhiều phương án để lựa chọn)]

---

## ==[Sys000] Check nguồn gốc lỗi từ tool có sẵn trong server và tool tích hợp trong HRM==

### Cách Check Link [2022/12/07]

- Cách check link và dự đoán những nguyên nhân lỗi dựa vào các công cụ có sẵn trên server và trên phần mềm HRM

### Hiện trạng

- Khi link bị lỗi, hình bên dưới là các cách kiểm tra lỗi  
    ![issuelogs_sys000_000.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_000.png)

### Nguyên nhân

- ....

### Phương án

- Log Review(tài liệu: [https://docs.vnresource.net/vi/se-docs/logs/log-review](https://docs.vnresource.net/vi/se-docs/logs/log-review)) : kiểm tra những lỗi mà bộ phận kỹ thuật đã ghi log (phải đăng nhập superadmin mới thấy tính năng này)  
    ![issuelogs_sys000_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_003.png)
    
- Log Request (tài liệu: [https://docs.vnresource.net/vi/se-docs/logs/logrequest](https://docs.vnresource.net/vi/se-docs/logs/logrequest)): kiểm tra những api lỗi dựa trên request (phải đăng nhập superadmin mới thấy tính năng này)  
    ![issuelogs_sys000_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_002.png)
    
- Remote Server:  
    + remote lên server và kiểm tra những file như : lang_vn_spec.xml, field_info_spec.xml, field_hidden_spec.xml
    
- Event Viewer: Kiểm tra lỗi, yêu cầu chạy link lỗi trên server.  
    ![issuelogs_sys007_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_002.png)
    
- IIS Request (Worker procecces): kiểm tra API chạy bao lâu  
    ![issuelogs_sys000_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_001.png)
    
- IIS Log: xem log từ IIS  
    ![issuelogs_sys000_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_004.png)
    
    ---
    

## ==[Sys001] Lỗi 405 về tín hiệu network==

### Lỗi 405 về tín hiệu network [2022/08/05]

- Lỗi 405 về tín hiệu network

### Hiện trạng

- Không kết nối máy chủ ở HR Service được  
    ![issuelogs_sys001_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys001_001.png)

### Nguyên nhân

- Webconfig chưa đúng.

### Phương án

- Sửa web.config bên main (xóa dòng như hình bên dưới)  
    ![issuelogs_sys001_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys001_002.png)
    
    ---
    

## ==[Sys002] Không có quyền thư mục IIS_IUSRS==

### - Không có quyền thư mục IIS_IUSRS [2022/08/05]

- Không có quyền thư mục mặc dù đẵ phân quyền IIS_IUSRS

### Hiện trạng

- Không truy cập được file log (access denied), mặc dù đã phân quyền IIS_IUSRS  
    ![issuelogs_sys002_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_001.png)

### Nguyên nhân

- Do copy source từ IIS khác và trước đó đã phân quyền pool cho user khác nên không hiểu quyền thư mục log của user hiện tại.

### Phương án

- Sửa cấu hình authentication của iis web hiện tại, và chọn Anonymous Authentication >> chọn edit >> check vào application pool identity để xác nhận quyền pool của user hiện tại.  
    ![issuelogs_sys002_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_002.png)
- Tiếp theo tiến hành phân quyền thư mục.  
    ![issuelogs_sys002_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_003.png)
- Nếu cách trên vẫn không được, tiến hành hướng dẫn bên dưới (thiết lập 3 source cùng 1 pool):  
    ![issuelogs_sys002_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_004.png)

---

## ==[Sys003] Bị lỗi outOfMemory do không đủ RAM==

### - Bị lỗi outOfMemory do không đủ RAM [2022/08/05]

- Bị lỗi outOfMemory do không đủ RAM

### Hiện trạng

- Bị lỗi outOfMemory do không đủ RAM

### Nguyên nhân

- Do cấu hình pool trong IIS, nếu chọn “Enable 32 Bit Application” là true thì chỉ dùng được tối đa 4GB RAM.

### Phương án

- Vào pool của IIS chỉnh thông tin “Enable 32 Bit Application” la false (vì dùng 64bit sẽ sử dụng tối đa RAM). Xem hình chi tiết cách cấu hình bên dưới:  
    ![issuelogs_sys003_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys003_001.png)

---

## ==[Sys004] Gọi link Hrm từ google chat bị lỗi hình răng cưa==

### - Gọi link Hrm từ google chat bị lỗi hình răng cưa [2022/08/05]

- Gọi link HRM từ google chat bị lỗi hình răng cưa, phải refresh trang 1 lần nửa mới vô được trang HRM

### Hiện trạng

- Hệ thống chặn link ngoài gọi vào HRM

### Nguyên nhân

- Do cấu hình pool trong IIS, nếu chọn “Enable 32 Bit Application” là true thì chỉ dùng được tối đa 4GB RAM.

### Phương án

- Add key `<add key="AllowOrigin" value="https://www.google.com/" />` vào webconfig (hoặc webSetting.json) main và portal  
    ![issuelogs_sys004_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys004_001.png)

---

## ==[Sys005] Login main bị lỗi 500 Sys_GetData/GetEnum==

### - Login main bị lỗi 500 Sys_GetData/GetEnum [2022/08/05]

- Login main bị lỗi 500 do api Sys_GetData/GetEnum

### Hiện trạng

- Hệ thống không login được do lỗi 500 api Sys_GetData/GetEnum, link nhà dùng source giống với link khách hàng, tuy nhiên khách hàng bị lỗi này. Hiện trạng là server khách hàng cài mới, cài sql và iis mới  
    ![issuelogs_sys005_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys005_001.png)

### Nguyên nhân

- Do chưa thực thi clr
- Kiểm tra database đã trust chưa?
    
    - Bạn có thể kiểm tra thuộc tính TRUSTWORTHY của cơ sở dữ liệu bằng cách sử dụng câu lệnh sau trong SQL Server Management Studio:
    
    ```sql
    SELECT name, value  FROM sys.configurations
    WHERE name = 'clr enabled'
    
    declare @dbName nvarchar(1000) = (select DB_NAME())
    SELECT is_trustworthy_on,name FROM sys.databases WHERE name = @dbName;
    ```
    
    Copy
    
    - Trong đó `@dbName` là tên của cơ sở dữ liệu mà bạn muốn kiểm tra. Nếu giá trị trả về là 1, điều đó có nghĩa là thuộc tính TRUSTWORTHY đã được bật. Nếu giá trị trả về là 0, điều đó có nghĩa là thuộc tính TRUSTWORTHY đang tắt.

### Phương án

Thực thi câu lệnh sql (nếu database chưa trustWorthy)

```sql
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
```

Copy

![issuelogs_sys005_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys005_002.png)

## ==[Sys006] Tắt log trong IIS==

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

## ==[Sys007] Ghi nhận file event viewer logs từ server về kiểm tra nguyên nhân lỗi==

### - Ghi nhận file log từ server về kiểm tra nguyên nhân lỗi [2022/08/11]

- Ghi nhận file log từ server về kiểm tra nguyên nhân lỗi.

### Hiện trạng

- Khi hệ thống bị lỗi, window sẽ tiến hành ghi log vào event viewer. Chúng ta tiến hành lấy file log về để kiểm tra nguyên nhân

### Nguyên nhân

- Khi hệ thống bị lỗi, window sẽ tiến hành ghi log vào event viewer. Nhìn vào log, chúng ta sẽ xác định được nguyên nhân lỗi mà không cần mở source debug.

### Phương án

#### - Vào cửa sổ window trên server chứa IIS và vào tìm kiếm `event viewer`

![issuelogs_sys007_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_001.png)

#### - Trong cửa sổ event viewer, chọn Windows Logs\Application. Tiếp theo chọn event log lỗi (dấu hiệu nhận biết log lỗi là có hình icon tam giác màu vàng) và save về máy để gửi cho bộ phận kỹ thuật kiểm tra nguyên nhân.

![issuelogs_sys007_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_002.png)

#### - Để mở file log trên `Event viewer`, ta vào Windows Logs\Application và chọn `open Saved Log` ở gốc phải

![issuelogs_sys007_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_003.png)

#### - Kết quả sau khi mở log, bộ phận kỹ thuật tiến hành kiểm tra và phỏng đoán nguyên nhân lỗi.

![issuelogs_sys007_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_004.png)

## ==[Sys008] Đăng nhập Portal không được, mặc dù đúng username và Password==

### - Đăng nhập Portal không được, mặc dù đúng username và Password [2022/08/11]

- Đăng nhập portal không thành công, mặc dù thông tin username và password đều đúng. 4 Link đều hoạt động bình thường.

### Hiện trạng

- Khi đăng nhập vào web portal báo sai thông tin đăng nhập. Mặc dù đã kiễm tra lại thông tin đăng nhập đúng.  
    ![issuelogs_sys008_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys008_001.png)

### Nguyên nhân

- ConnectString Database trong file webSettings.json của Portal bị sai. Không trùng với Database của Main.

### Phương án

- Sửa ConnectString Database trong file webSettings.json của Portal  
    ![issuelogs_sys008_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys008_002.png)

## ==[Sys009] Upload files không vượt quá 20MB==

### - Không upload files vượt quá 20MB [2022/10/19]

- Khi upload files, không thể upload vượt quá 20MB

### Hiện trạng

- Khi upload files, không thể upload vượt quá 20MB

### Nguyên nhân

- Khi upload files với dung lượng lớn sẽ ảnh hưởng hệ thống.

### Phương án

- Cấu hình trong webConfig của web main với attribute maxRequestLength với dung lượng mong muốn nhưng không được vượt quá 20 MB  
    ![issuelogs_sys009_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys009_001.png)  
    vd: <httpRuntime targetFramework="4.6.2" ==maxRequestLength="20480"== />

## ==[Sys010] Sau khi upbuid xuất hiện lỗi 403.14 không hiện được trang==

### Hiện trạng

- Không vào được trang
- Xuất hiện lỗi 403.14

### Nguyên nhân

- Bản build dang sử dụng trước khi update build bằng tay

### Phương án

- Sử dụng [tool update tự động](https://docs.vnresource.net/vi/general/tools/tool-config-hrm)
- Trước hợp update bằng tay:  
    Tìm và xóa file **PrecompiledApp.config**  
    Tìm và xóa tất cả thư mục **bin**  
    Tiến hành giải nén lại **File nén của bản build**

## ==[Sys011] Không thể xem log request==

### Hiện trạng

- Không vào được trang log request
- Xuất hiện lỗi **Unable to load DLL 'SQLite.Interop.dll': The specified module could not be found. (Exception from HRESULT: 0x8007007E)**  
    ![issuelogs_sys011_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_001.png)

### Nguyên nhân

- Do chưa cài Visual C++ 2010,2012,2013,2015-2022 => cài cả X86 và X64

### Phương án

- Cài đặt Visual C++ 2010,2012,2013,2015-2022 => Cài theo thứ tự từ 2010 đến 2022 => cài cả X86 và X64 (Link cài đặt: [https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170))  
    ![issuelogs_sys011_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_003.png)
- Tool chạy sqlLites : [https://sqlitebrowser.org/dl/](https://sqlitebrowser.org/dl/)
- Kết quả:  
    ![issuelogs_sys011_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_002.png)

## ==[Sys012] Lỗi ghi log request==

### Hiện trạng

- Không ghi log request
- Vào màn hình log request không tìm thấy log request mới nhật mặc dù đã cấu hình ghi log request

### Nguyên nhân

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

- Back up lại các folder này ra khỏi folder a,b,c,d (cut 4 folder RequestInformation vào 1 folder mới nằm ngoài source rồi lưu lại)  
    ![issuelogs_sys012_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys012_002.png)
    - Sau khi đã cut RequestInformation ra khỏi 4 folder thì mở lại site và start pools chạy bình thường để hệ thống ghi log lại.

## ==[Sys013] Lỗi không vào hệ thống HRM==

### Hiện trạng

- Lỗi không vào hệ thống HRM

### Nguyên nhân

- Vào event Viewer để xem lỗi gì? => phải chạy link trên server chứa IIS mới thấy được lỗi.
- `Nguyên nhân : do file lang_vn.spec.xml PE chỉnh bị trùng key`  
    ![issuelogs_sys013_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys013_001.png)

### Phương án

#### Tìm ra key đã bị trùng bằng tay hoặc dùng tool kiểm tra key trùng (tools kiểm tra key trùng thì liên hệ Phúc IT được nhận tools

- Vào file lang spec tìm key trùng như tool mô tả và xóa dòng trùng trong file lang.  
    ![issuelogs_sys013_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys013_002.png)

## ==[Sys014] Không thể xóa file group memory optimized==

> **File group memory optimized** là một tính năng của SQL Server, cho phép bạn tạo các bảng và biến bảng được tối ưu hóa cho bộ nhớ

### Hiện trạng

- Không thể xóa file group memory optimized  
    ![issuelogs_sys014_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys014_001.png)

### Nguyên nhân

- File group memory optimized sau khi đã tạo và cache memory table thì không xóa được

### Phương án

#### Bước 1: Restore db từ file .bak và kiểm tra có dữ liệu bảng Hre_Profile không?

#### Bước 2: Detach Database

#### Bước 3: Tạo database mới với tên mới : test123

#### Bước 4: Chỉnh sửa thông tin db dẫn đến file mdf,ldf vừa detach

```none
alter database test123 modify file (name='test123' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.mdf')
alter database test123 modify file (name='test123_log' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.ldf')
```

Copy

#### Bước 4.1: restart sql server để cho có dữ liệu bảng Hre_Profile => sau khi có dữ liệu thì tiến hành repair db ở các bước sau.

#### Bước 5: repair db

```none
alter database test123 set emergency
alter database test123 set single_user with ROLLBACK IMMEDIATE;
dbcc checkdb(test123,repair_allow_data_loss)
alter database test123 set multi_user
alter database test123 set online
```

Copy

Giải thích ý nghĩa từng câu lệnh ở trên như sau:

- Lệnh `alter database test123 set emergency` dùng để đặt cơ sở dữ liệu test123 vào chế độ khẩn cấp (emergency mode). Khi đó, cơ sở dữ liệu sẽ chỉ có thể truy cập được bởi quản trị viên, và chỉ cho phép đọc dữ liệu. Chế độ khẩn cấp giúp bạn kiểm tra và khắc phục lỗi nghiêm trọng của cơ sở dữ liệu.
- Lệnh `alter database test123 set single_user with ROLLBACK IMMEDIATE` dùng để đặt cơ sở dữ liệu test123 vào chế độ người dùng đơn (single-user mode). Khi đó, cơ sở dữ liệu sẽ chỉ cho phép một kết nối duy nhất tại một thời điểm, và huỷ bỏ tất cả các giao dịch đang chờ xử lý. Chế độ người dùng đơn giúp bạn thực hiện các thao tác sửa chữa cơ sở dữ liệu mà không bị can thiệp bởi các kết nối khác.
- Lệnh `dbcc checkdb(test123,repair_allow_data_loss)` dùng để kiểm tra và sửa chữa cơ sở dữ liệu test123 bằng cách sử dụng tùy chọn `repair_allow_data_loss`. Khi đó, lệnh sẽ cố gắng khắc phục tất cả các lỗi được báo cáo bởi lệnh `dbcc checkdb`, nhưng có thể gây mất dữ liệu. Tùy chọn `repair_allow_data_loss` nên được sử dụng như một biện pháp cuối cùng để sửa chữa cơ sở dữ liệu.
- Lệnh `alter database test123 set multi_user` dùng để đặt cơ sở dữ liệu test123 trở lại chế độ người dùng nhiều (multi-user mode). Khi đó, cơ sở dữ liệu sẽ cho phép nhiều kết nối cùng lúc, và hoạt động bình thường.
- Lệnh `alter database test123 set online` dùng để đặt cơ sở dữ liệu test123 trở lại trạng thái hoạt động (online). Khi đó, cơ sở dữ liệu sẽ có thể truy cập được bởi các kết nối khác.

#### Bước 6: remove memory optimized filegroup

```none
ALTER DATABASE test123 REMOVE FILEGROUP [fg_Memory_Optimized]
```

Copy

## ==[Sys015] Giảm dung lượng file log của database về 1 MB==

### Hiện trạng

- Dung lượng file log của database quá lớn, mong muốn giảm dung lượng file log của database về 1 MB

### Nguyên nhân

- Dung lượng file log của database quá lớn

### Phương án

> **Phương án dùng shrinkfile database:**  
> Shrink database là một tính năng của SQL Server, giúp giảm kích thước của cơ sở dữ liệu bằng cách thu nhỏ không gian trống trong các file data và log. Khi bạn thực hiện shrink database, SQL Server sẽ di chuyển các trang dữ liệu từ cuối file về phía trước, để giải phóng không gian trống ở cuối file và trả lại cho hệ thống file. **shrinkfile database có thể giúp bạn tiết kiệm không gian lưu trữ và tối ưu hóa năng suất hoạt động của server**.

> Lưu ý: để shrinkfile database, bạn phải xóa **file group memory optimized**, Phương pháp xóa được hướng dẫn ở mục ==[Sys014] Không thể xóa file group memory optimized== trong trang "Nhật ký vấn đề"

```sql
USE tên_DB;
GO
ALTER DATABASE tên_DB SET RECOVERY SIMPLE;
GO
--Ten_log tên file log, shrink về còn 1 mb
DBCC SHRINKFILE (Ten_log, 1);
GO
ALTER DATABASE tên_DB SET RECOVERY FULL;
GO
```

Copy

`Bên dưới là các bước Shrink database giúp giảm dung lượng file log của database về 1 MB`

#### Bước 1: bạn cần thay đổi recovery model của database MB thành SIMPLE bằng lệnh sau:

```sql
ALTER DATABASE MB SET RECOVERY SIMPLE;
GO
```

Copy

#### Bước 2: bạn cần thu nhỏ file log của database về 1 MB bằng lệnh sau:

```sql
DBCC SHRINKFILE (Ten_log, 1);
GO
```

Copy

#### Bước 3:Bạn có thể kiểm tra dung lượng file log của database MB sau khi thực hiện các lệnh trên bằng lệnh sau:

```sql
SELECT name, size/128.0 AS size_in_MB FROM sys.database_files WHERE type = 1;
GO
```

Copy

#### Bước 3: Nếu bạn muốn khôi phục recovery model của database MB thành FULL, bạn cần thực hiện lệnh sau:

```sql
ALTER DATABASE MB SET RECOVERY FULL;
GO
```

Copy

#### Kết quả sau khi shrinkfile

![issuelogs_sys015_001.jpg](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys015_001.jpg)

## ==[Sys016] Lỗi không tự xóa log sau 30 ngày==

### Hiện trạng

- Lỗi không tự xóa log sau 30 ngày

### Nguyên nhân

- Xử lý xóa log của hệ thống, khi tạo thư mục không hợp lệ sẽ không tự xóa log.

### Phương án

- Tạo scheduler task trong window để xử lý xóa log tự động.

#### Bước 1

- Download file import task có sẵn theo đính kèm : [issuelogs_sys016_deletehrmlog_001.xml](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys016_deletehrmlog_001.xml)

#### Bước 2

- Tìm ứng dụng `Task Scheduler` trong window
- Tạo một thư mục trong Task scheduler
- Thực hiện import task từ file đính kèm ở bước 1 (chọn file `issuelogs_sys016_deletehrmlog_001.xml`) và tiến hành import task.  
    ![issuelogs_sys016_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys016_002.png)
- Giải thích các tham số: **/p =="D:\HRM.Presentation.Main\Log"== /s /d ==-30== /c "cmd /c del @file"**
    - `D:\HRM.Presentation.Main\Log` : là thư mục chứa file log
    - `-30` : là chỉ xóa những file log trước đó 30 ngày (có thể tùy chỉnh theo ý cá nhân)

> Lưu ý:  
> tab Triggers : dùng để tạo scheduler chạy hàng ngày, hàng tuần hay hàng tháng  
> tab Actions: dùng để thực thi xử lý xóa log (thông qua ForFiles - lệnh thực hiện trên 1 file hoặc một tập hợp file có sẵn trong window, lệnh ForFiles hữu ích cho xử lý hàng loạt)  
> Link tham khảo tạo task scheduler : [https://dacocach.com/xoa-file-windows-10/](https://dacocach.com/xoa-file-windows-10/)

## ==[Sys017] Phân quyền hệ thống, portal không nhận key quyền vừa phân quyền==

### Hiện trạng

- Phân quyền hệ thống, portal (api center) không nhận key quyền vừa phân quyền

### Nguyên nhân

- Không refresh cache quyền khi phân nhóm quyền, do thiếu cấu hình `Hrm_APICenter_Web` trong `WebSettings.json` của `WebMain`.

### Phương án

- Để tránh việc không refresh cache quyền trong api center khi phân nhóm quyền, cần kiểm tra cấu hình `Hrm_APICenter_Web` trong tệp `WebSettings.json` của `WebMain`. Nếu có key này, hệ thống sẽ tự động refresh cache khi chỉnh sửa nhóm quyền trong api center.

> - Vd: `"Hrm_APICenter_Web": "https://pehn02.vnresource.net:2425/"`
> - Trong đó, key `Hrm_APICenter_Web` là đường link của api Center API.

![issuelogs_sys017_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys017_001.png)

## ==[Sys018] Nội dung....==