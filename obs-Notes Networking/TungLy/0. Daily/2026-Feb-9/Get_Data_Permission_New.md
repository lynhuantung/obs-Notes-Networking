---
Mã: 20260228085726
aliases:
date: 2026-02-28
tags:
  - daily
Project:
---
```sql

set statistics io on
DECLARE @tblPermission TABLE (id uniqueidentifier primary key )				
INSERT INTO @tblPermission EXEC Get_Data_Permission_New  'vnr', 'hre_profile' , 'ProfileCommonSearchProfileIds=''AEE8B585-67EC-4DE7-8404-0035238B0A4B'''
select distinct id from @tblPermission

set statistics io off



```