---
Mã: Sys015
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys014 - Xóa memory optimized filegroup]]"
  - "[[Sys022 - SQL chậm MAXDOP 1 CPU]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Shrink log database về 1MB

**Vấn đề:** Giảm dung lượng file log của database về 1 MB

**Hiện trạng:**
- Dung lượng file log của database quá lớn, mong muốn giảm dung lượng file log của database về 1 MB

**Nguyên nhân:**
- Dung lượng file log của database quá lớn

**Phương án:**

> **Shrink database:** giúp giảm kích thước cơ sở dữ liệu bằng cách thu nhỏ không gian trống trong các file data và log. SQL Server sẽ di chuyển các trang dữ liệu từ cuối file về phía trước để giải phóng không gian.
> **Lưu ý:** Phải xóa **file group memory optimized** trước. Xem [[Sys014 - Xóa memory optimized filegroup]]

Câu lệnh tổng hợp:

```sql
USE tên_DB;
GO
ALTER DATABASE tên_DB SET RECOVERY SIMPLE;
GO
--Ten_log: tên file log, shrink về còn 1 mb
DBCC SHRINKFILE (Ten_log, 1);
GO
ALTER DATABASE tên_DB SET RECOVERY FULL;
GO
```

#### Bước 1: Thay đổi recovery model thành SIMPLE

```sql
ALTER DATABASE MB SET RECOVERY SIMPLE;
GO
```

#### Bước 2: Thu nhỏ file log về 1 MB

```sql
DBCC SHRINKFILE (Ten_log, 1);
GO
```

#### Bước 3: Kiểm tra dung lượng file log sau khi thực hiện

```sql
SELECT name, size/128.0 AS size_in_MB FROM sys.database_files WHERE type = 1;
GO
```

#### Bước 4: Khôi phục recovery model về FULL

```sql
ALTER DATABASE MB SET RECOVERY FULL;
GO
```

#### Kết quả sau khi shrinkfile
![issuelogs_sys015_001.jpg](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys015_001.jpg)
