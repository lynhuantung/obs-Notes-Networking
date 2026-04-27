

### 1. Đồng bộ user superadmin
- User superadmin của main và portal chưa đồng bộ
	- Không dùng identity (chưa đồng bộ user superadmin)
		- User superadmin main : UserA
		- User superadmin portal: UserB
	- Dùng identity (đồng bộ user superadmin)
		- User superadmin main : UserA
		- User superadmin portal: UserA
=> Cần đồng bộ user superadmin, vì bản chất supeadmin (main và portal cùng 1 hệ thống) chỉ liên quan identy.


### 2. Đồng bộ user với identity
hỗ trợ giúp Hoang API lấy những thông tin này với nha:  
- HrmUserId (UserId)      
- UserName (UserLogin)      
- Email      
- FullName      
- PhoneNumber      
- IsDeactive      
- PasswordMD5 (Password hiện tại của User)      
- MisaId      
- IsDeleted

### 3. Kiểm tra user LDAP
- Tạo 2 user cùng 1 nhân viên.
	- User thường
	- User ldap
		- Khi đăng nhập user ldap thì báo là user thường => cần tìm nguyên nhân


