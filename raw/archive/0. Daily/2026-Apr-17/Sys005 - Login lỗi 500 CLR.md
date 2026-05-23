---
Mã: Sys005
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys008 - Portal không đăng nhập được]]"
  - "[[Sys014 - Xóa memory optimized filegroup]]"
  - "[[Sys021 - Giải trình quyền SYSADMIN]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Login lỗi 500 CLR

**Vấn đề:** Login main bị lỗi 500 Sys_GetData/GetEnum [2022/08/05]
- Login main bị lỗi 500 do api Sys_GetData/GetEnum

**Hiện trạng:**
- Hệ thống không login được do lỗi 500 api Sys_GetData/GetEnum, link nhà dùng source giống với link khách hàng, tuy nhiên khách hàng bị lỗi này. Hiện trạng là server khách hàng cài mới, cài sql và iis mới
- ![issuelogs_sys005_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys005_001.png)

**Nguyên nhân:**
- Do chưa thực thi clr
- Kiểm tra database đã trust chưa?

```sql
SELECT name, value  FROM sys.configurations
WHERE name = 'clr enabled'

declare @dbName nvarchar(1000) = (select DB_NAME())
SELECT is_trustworthy_on,name FROM sys.databases WHERE name = @dbName;
```

Nếu giá trị trả về là 1: TRUSTWORTHY đã bật. Nếu là 0: TRUSTWORTHY đang tắt.

**Phương án:**
Thực thi câu lệnh sql (nếu database chưa trustWorthy):

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

- ![issuelogs_sys005_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys005_002.png)
