---
aliases: 
date: 2024-08-12
tags:
  - daily
---

Tạo task Jira
Tổ chức tài liệu Confluence
Cài đặt SSO
Rà soát Task.Run và tiến hành xử lý triệt để cache phân quyền clear cả API V3 [[Giải trình lỗi cache phân quyền|Giải trình cache phân quyền không apply cho API V3]]
Tổ chức lại cache quyền danh mục [[Giải trình lỗi cache phân quyền]]
Hỗ trợ PE kiểm tra log request không chạy được (dự án Thaco) (1 tiếng)
Hỗ trợ KOG update ldap của user (2 tiếng)
	- Trước khi update: Đối với những user trước giờ chưa dùng LDAP
	- Sau khi update: những user trước đây chưa update ldap , khi đăng nhập thì phải đăng nhập bằng tài khoản ldap.
```
update Sys_UserInfo
	set IsCheckLDAP  =1 , LDAPDatasource='10.0.0.13:389', LdapConfigID='D4F75A31-0BD7-411B-9EF5-5950323B03CC'
	where IsDelete is null and LdapConfigID is null

```

Hỗ trợ KOG - Kiểm tra quyền màn hình Ins_InsuranceInfo, do chưa check quyền (20 phút)
```sql
DECLARE @tblPermission TABLE (id uniqueidentifier primary key )
INSERT INTO @tblPermission EXEC Get_Data_Permission_New @Username,'Ins_ProfileInsuranceMonthly';
JOIN @tblPermission fcP ON fcP.Id = hp.ID
```
