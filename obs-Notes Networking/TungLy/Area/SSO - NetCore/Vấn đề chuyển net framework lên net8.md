---
aliases: 
date: 2025-03-26
tags:
  - "#Area"
  - "#dotnet-core"
  - "#upgrade"
Related:
---
vấn đề dapper giữa net framework và net8
- Net framework : khi store có nhiều cột ID sẽ lấy cột ID đầu tiên
- Net8 : khi store có nhiều cột ID sẽ lấy cột ID cuối cùng
Giải pháp: trong store không select * mà select tenbang.*
thấy dấu * thành tenbang.*
```sql
SELECT *
 FROM Sys_UserInfo sui
 left join Sys_LdapConfig ld on sui.LdapConfigID = ld.ID and ld.IsDelete is null
 left join Cat_OrgStructure cos on sui.OrgStructureID = cos.ID and cos.IsDelete is null
 left join Hre_Profile hre on hre.ID = sui.ProfileID and hre.IsDelete is null
 WHERE sui.IsDelete IS NULL and sui.ID = @workhistoryId

```

Thành
```sql
SELECT sui.*, hre.CodeEmp
 FROM Sys_UserInfo sui
 left join Sys_LdapConfig ld on sui.LdapConfigID = ld.ID and ld.IsDelete is null
 left join Cat_OrgStructure cos on sui.OrgStructureID = cos.ID and cos.IsDelete is null
 left join Hre_Profile hre on hre.ID = sui.ProfileID and hre.IsDelete is null
 WHERE sui.IsDelete IS NULL and sui.ID = @workhistoryId
```

