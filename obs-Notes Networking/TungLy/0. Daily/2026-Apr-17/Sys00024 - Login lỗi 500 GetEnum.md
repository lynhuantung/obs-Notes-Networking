---
Mã: Sys00024
aliases:
date: 2021-07-27
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00003 - Không lấy được version]]"
  - "[[Sys00005 - Không login được]]"
  - "[[Sys00025 - Màn hình main bị lỗi]]"
---
# Login lỗi 500 GetEnum

**Vấn đề:** Login main bị lỗi 500 do api Sys_GetData/GetEnum
Hiện trạng: hệ thống không login được do lỗi 500 api Sys_GetData/GetEnum, link nhà dùng source giống với link khách hàng, tuy nhiên khách hàng bị lỗi này. Hiện trạng là server khách hàng cài mới, cài sql và iis mới

**Lý Do:**
- Tại sao login không được: Vì Chưa phân quyền IIS_IUSRS thư HRM.Presentation.Main, HRM.Presentation.Hr.Service, HRM.Presentation.HrmSystem.Service, HRM.Presentation.EmpPortal
- Tại sao phân quyền thư mục với quyền IIS_IUSRS vẫn không login được: Do SQL mới cài chưa enable clr và thiet lập db TRUSTWORTHY on.

**Nguyên nhân gốc:**
- Do chưa enable clr
- Chưa phân quyền thư mục với quyền IIS_IUSRS (khi copy source, nên copy source pass, không được phép copy source đã dựng trên link nhà vì có thể ảnh hưởng đến phân quyền IIS)

**Cách phòng tránh:**
PE cần note câu lệnh để khi cài đặt server mới sẽ chạy đoạn lệnh:

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
```

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00024 | SE | 27/07/2021 |
