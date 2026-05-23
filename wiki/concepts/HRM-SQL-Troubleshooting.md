---
description: "Xử lý sự cố SQL Server HRM: CLR, deadlock, performance, index, các lệnh chẩn đoán và tối ưu query."
type: concept
tags:
  - hrm
  - sql-server
  - clr
  - troubleshooting
  - performance
date-updated: 2026-04-26
related:
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
- "[[wiki/concepts/HRM-Security-Config]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
- "[[wiki/sources/Nhat-ky-van-de-nghiep-vu]]"
- "[[wiki/sources/SysLog-HeThong-Chi-Tiet]]"
---

# HRM — SQL Server Troubleshooting

> Ghi chú nguyên tử: các lỗi SQL Server thường gặp trong HRM, đặc biệt CLR, Memory Optimized, và hiệu suất.

## CLR — Bật và Cấp Quyền

**Dùng khi:** Login 500 Sys_GetData/GetEnum, restore DB xong không dùng được hàm `VnrDecrypt`

```sql
-- Kiểm tra trạng thái CLR
SELECT name, value FROM sys.configurations WHERE name = 'clr enabled'

-- Kiểm tra TRUSTWORTHY
declare @dbName nvarchar(1000) = (select DB_NAME())
SELECT is_trustworthy_on, name FROM sys.databases WHERE name = @dbName;

-- Bật CLR + TRUSTWORTHY (chạy bởi sysadmin)
declare @dbName nvarchar(1000) = (select DB_NAME())
set @dbName = 'ALTER DATABASE ' + @dbName + ' SET TRUSTWORTHY ON'
exec sp_executesql @dbName
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

> ⚠️ SQL Server 2017+ có `clr strict security = 1` mặc định → assembly phải được ký hoặc nạp bởi sysadmin

**Sau khi cài xong:** Thu hồi sysadmin ngay. Vận hành chỉ cần: `GRANT EXECUTE ON dbo.VnrDecrypt TO [AppUser];`

## Memory Optimized Filegroup — Xóa

**Dùng khi:** Không xóa được filegroup, muốn Shrink DB

```sql
-- Bước 1: Xem bảng Memory Optimized
SELECT o.name, s.name, o.type_desc FROM sys.filegroups fg
JOIN sys.data_spaces ds ON fg.data_space_id = ds.data_space_id
JOIN sys.allocation_units au ON ds.data_space_id = au.data_space_id
JOIN sys.partitions p ON au.container_id = p.partition_id
JOIN sys.objects o ON p.object_id = o.object_id
JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE fg.name = 'fg_Memory_Optimized';

-- Bước 2: Drop bảng cache
drop table Sys_CacheDataPermission
drop table Sys_TablePermissionCache

-- Bước 3: Detach → Tạo DB test → Trỏ đến file cũ → Repair
alter database test123 set emergency
alter database test123 set single_user with ROLLBACK IMMEDIATE;
dbcc checkdb(test123, repair_allow_data_loss)
alter database test123 set multi_user
alter database test123 set online

-- Bước 4: Remove filegroup
ALTER DATABASE test123 REMOVE FILEGROUP [fg_Memory_Optimized]
```

## Shrink Log DB

> ⚠️ Phải xóa Memory Optimized Filegroup trước → xem phần trên

```sql
USE tên_DB;
ALTER DATABASE tên_DB SET RECOVERY SIMPLE;
DBCC SHRINKFILE (Ten_log, 1);  -- về 1 MB
ALTER DATABASE tên_DB SET RECOVERY FULL;
```

## MAXDOP — Tăng Hiệu Suất

**Dùng khi:** SQL chậm, báo cáo tổng hợp mất nhiều thời gian

```sql
-- Kiểm tra hiện tại
SELECT name, value_in_use FROM sys.configurations WHERE name = 'max degree of parallelism';

-- Tăng lên 8 nhân
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'max degree of parallelism', 8; RECONFIGURE;
```

## Cache Config Limit (Bug đã ghi nhận)

- Hệ thống cache cấu hình giới hạn **10,000 dòng**
- Nếu DB có > 10,000 key config → một số config không load được (ví dụ: server mail tuyển dụng)
- Phương án dài hạn: load toàn bộ key từ DB thay vì giới hạn cứng

## Liên kết kích hoạt

- Sau khi fix SQL, vào được IIS nhưng vẫn lỗi → [[wiki/concepts/HRM-IIS-Troubleshooting]]
- Cần sysadmin cho CLR → giải trình bảo mật → [[wiki/concepts/HRM-Security-Config]]
- Deploy server mới → checklist đầy đủ → [[wiki/concepts/HRM-Deploy-Checklist]]
