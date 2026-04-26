---
Mã: Sys014
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys005 - Login lỗi 500 CLR]]"
  - "[[Sys015 - Shrink log database về 1MB]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Xóa memory optimized filegroup

**Vấn đề:** Không thể xóa file group memory optimized

> **File group memory optimized** là một tính năng của SQL Server, cho phép bạn tạo các bảng và biến bảng được tối ưu hóa cho bộ nhớ

**Hiện trạng:**
- Không thể xóa file group memory optimized
- ![issuelogs_sys014_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys014_001.png)

**Nguyên nhân:**
- File group memory optimized sau khi đã tạo và cache memory table thì không xóa được

**Phương án:**

#### Bước 1: Restore db từ file .bak và kiểm tra có dữ liệu bảng Hre_Profile không?
- Kiểm tra những bảng có loại là Memory_Optimized:

```sql
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
```

- Nếu tồn tại bảng, tiến hành drop table:

```sql
--drop những bảng Memory_Optimized
drop table Sys_CacheDataPermission
drop table Sys_TablePermissionCache
```

#### Bước 2: Detach Database

#### Bước 3: Tạo database mới với tên mới: test123
- Tạo thư mục mới nằm cùng thư mục của database vừa detach. Vd: `d:\db\du-an-A` thì tạo `d:\db\du-an-A\test`
- Tạo database mới tên `test123` trong thư mục `d:\db\du-an-A\test`

#### Bước 4: Chỉnh sửa thông tin db dẫn đến file mdf,ldf vừa detach

```sql
alter database test123 modify file (name='test123' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.mdf')
alter database test123 modify file (name='test123_log' , filename='D:\SQLSERVER\MSSQL15.SQLSERVER2019\MSSQL\DATA\test\HRMPro11.ldf')
```

#### Bước 4.1: restart sql server để có dữ liệu bảng Hre_Profile => sau khi có dữ liệu thì tiến hành repair db
![issuelogs_sys014_002.jpg](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys014_002.jpg)

#### Bước 5: repair db

```sql
alter database test123 set emergency
alter database test123 set single_user with ROLLBACK IMMEDIATE;
dbcc checkdb(test123,repair_allow_data_loss)
alter database test123 set multi_user
alter database test123 set online
```

**Giải thích:**
- `set emergency`: đặt db vào chế độ khẩn cấp, chỉ admin đọc được.
- `set single_user with ROLLBACK IMMEDIATE`: chỉ 1 kết nối tại một thời điểm, huỷ giao dịch đang chờ.
- `dbcc checkdb(...,repair_allow_data_loss)`: sửa chữa lỗi, có thể gây mất dữ liệu — dùng như biện pháp cuối cùng.
- `set multi_user`: cho phép nhiều kết nối trở lại.
- `set online`: đưa db về trạng thái hoạt động bình thường.

#### Bước 6: remove memory optimized filegroup

```sql
ALTER DATABASE test123 REMOVE FILEGROUP [fg_Memory_Optimized]
```
