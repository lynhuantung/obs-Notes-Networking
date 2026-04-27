---
aliases: 
date: 2024-08-01
tags:
  - "#permission"
  - "#kiemnhiem"
Project:
  - LTG
---

> **Vấn đề**:  nghiệp vụ kiêm nhiệm của dự án LTG (quyền)
> 
> **Hiện Trạng**: - Get_Permission_New(userLogin, TableName) => trả ra danh sách ProfileID có quyền 
> 
> **Mong muốn** 
> - Get_Permission_New(userLogin, TableName) => trả ra danh sách ID của bảng cần check 
> 
> **Kết quả:**
> - Các store có xử lý quyền => cần join lại theo ID  
> - **Giải pháp 1**: Select * from Sal_BasicSalary sb join permission p on p.id = sb.id
> - **Giải pháp 2** (join 2 lần): .
> 		Select * from Sal_BasicSalary sb 
> 					join Get_Data_Permission_New p on p.id = sb.ProfileID
> 					join Get_Data_PermissionConCurrent_New kp on kp.id = sb.CompanyID
> 	
> => Lựa chọn giải pháp 2
> Notes: Chỉ apply 1 số nghiệp vụ cần (ko apply tất cả nghiệp vụ)
> 
> **Next Action:**
> - TungLy : viết 1 store giống hàm get quyền nhưng lấy ds ID của bảng chính permissionNewKiemNhiem(userLogin, tableName)
> - Tin: Chèn đoạn join store mới vào dynamicStore   


### Chốt giải thuật họp lần 2 về phân quyền theo kiêm nhiệm
- Thêm cấu hình : xử lý kiêm nhiệm trong cấu hình chung
- Sửa store `Get_Data_Permission_New(UserLogin, TableName)` => Trả ra danh sách profileID
	- Xử lý thêm: nếu có cấu hình, xử lý lấy danh sách kiêm nhiệm ở màn hình quá trình kiêm nhiệm => ra danh sách profileids. Sau đó union với danh sách quyền profileids
- Viết store get quyền mới (xử lý kiêm nhiệm) : `Get_Data_PermissionConCurrent_New(UserLogin, TableName)` => trả ra ds CompanyID

![[Pasted image 20240802114606.png]]