---
Mã cuộc họp: H-LTG-SYS-310724
aliases: 
title: Biên bản họp phân quyền theo kiêm nhiệm
tags:
  - "#meeting"
  - "#permission"
  - "#kiemnhiem"
date: 2024-07-31
members:
  - tungly
  - sonvo
  - tungtran
  - tinnguyen
  - baotran
  - hienpham
  - ngannguyen
  - tiendang
Related: "[[0.H-LTG]]"
Link: 
Project:
  - "[[Dự án LTG]]"
---
## Họp phân quyền theo kiêm nhiệm - Dự án LTG
## Biên bản họp : 31/07/2024
- Mã cuộc họp: H-LTG-SYS-310724
- **Người tham gia**: TungLy, Tungtran, sonvo, tinnguyen, baotran, tiendang, ngannguyen
- Cuộc họp liên quan [^1]
- Thông tin thêm
	- Link email 
	- GAP list 
	- Thông tin liên quan: [[Kiêm Nhiệm LTG]]
## Mục tiêu:
- Xử lý nghiệp vụ kiêm nhiệm
- Phân quyền kiêm nhiệm

## 📝Các ý chính  
-  
> **Vấn đề**:  nghiệp vụ kiêm nhiệm của dự án LTG (quyền)
> 
> **Hiện Trạng**: - Get_Permission_New(userLogin, TableName) => trả ra danh sách ProfileID có quyền 
> 
> **Mong muốn** 
> - Get_Permission_New(userLogin, TableName) => trả ra danh sách ProfileID của bảng cần check và profileID của bảng kiêm nhiệm
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


## Action tiếp theo:
 1.  Sửa store `Get_Data_Permission_New(UserLogin, TableName)`
 2. Viết store get quyền mới (xử lý kiêm nhiệm) : `Get_Data_PermissionConCurrent_New(UserLogin, TableName)` => trả ra ds CompanyID

# Tóm tắt



--- 
**5 Ý chính:**

- **Vấn đề:** Xử lý nghiệp vụ kiêm nhiệm trong dự án LTG.
- **Hiện trạng:** Get_Permission_New() trả về danh sách ProfileID có quyền, nhưng mong muốn trả về danh sách ID của bảng cần kiểm tra.
- **Giải pháp:** Chọn giải pháp join 2 lần để lấy danh sách ID.
- **Next Action:** Viết store lấy danh sách ID có quyền (xử lý kiêm nhiệm): permissionNewKiemNhiem().
- **Action tiếp theo:** Sửa store Get_Data_Permission_New() và viết store Get_Data_PermissionConCurrent_New().

 --- 


