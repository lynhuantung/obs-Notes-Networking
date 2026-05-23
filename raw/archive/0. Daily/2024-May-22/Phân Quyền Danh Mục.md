---
aliases:
  - Phân quyền danh mục
date: 28/05/2024
tags:
  - "#phanquyendanhmuc"
title: 
permalink: "[[20240528_00]]"
---
# Cấu hình phân quyền danh mục trong cấu hình chung
- Có check cấu hình phân quyền dự án
- 
# Màn hình người dùng
## Chưa chọn dự án
	Q: có thấy dữ liệu ?
	 A: Thấy full (có vấn đề gì không? BA thấy có vấn đề)  
## chọn dự án
	Thấy dữ liệu tương ứng dự án
 

# Màn hình danh mục có multi
	Lấy store
		- Tên store phải có chữ multi
	Lấy cache
		- Có xử lý trong lazyCache để phân quyền
	Lấy queryable
		- Chưa xử lý
	

# Các store cần quan tâm 

^83d8a3

- hrm_get_DynamicStore => dùng cho multi
- cat_sp_Data_Permission_Category_New (store cũ : cat_sp_Data_Permission_Category) => dùng trong store danh sách 
- Get_MasterDataForUser (Store trả về Ids danh mục được phân quyền ứng với từng userID và bảng danh mục)

# Phân quyền dự án
## Lưới (dùng store list)
	- Store danh sách phải viết hàm check quyền danh mục
## Multi
	- Store phải có chữ multi
	- Trong dynamic store : có xử lý phân quyền dự án


# Câu hỏi (có cấu hình hình phân quyền dự án)
- Quyền superadmin có thấy được full dữ liệu danh mục không? => BA cần họp trao đổi (họp leader) , vấn đề lộ quyền
- Người dùng chưa được phân quyền thì có thấy dữ liệu all không? Hiện tại thấy full! BA không đồng ý, cần raise task sửa lại
- Khi tạo mới 1 danh mục mà không chọn dự án thì bản thân người tạo có thấy dữ liệu không? Trường hợp tạo mẫu BC chưa hiển thị dự án để chọn, cần raise task
- Dữ liệu cũ mà chưa được phân quyền thì sẽ ko thấy dữ liệu ? => đúng
- Dữ liệu danh mục không có giá trị cột code thì có thấy dữ liệu không? => không thấy ,raise task để xử lý tự sinh mã cho cột code.
## câu hỏi của PE - Bùi Minh Thái

^6ad797

![[Pasted image 20240530153204.png]]




>[!gemini]+ Tóm tắt
>**5 Ý chính tóm tắt:**
> 
> 1. **Phân quyền dự án:**
>     - Xác minh cấu hình phân quyền dự án.
> 
> 2. **Phân quyền hiển thị dữ liệu trên màn hình:**
>     - Người dùng chưa chọn dự án: Xem dữ liệu đầy đủ (cần xử lý).
>     - Người dùng đã chọn dự án: Chỉ xem dữ liệu liên quan đến dự án.
> 
> 3. **Phân quyền trong cửa sổ danh mục đa mục:**
>     - Cần xử lý phân quyền trong store đa mục, cache và truy vấn.
> 
> 4. **Store quan trọng liên quan đến phân quyền danh mục:**
>     - `hrm_get_DynamicStore` (đa mục)
>     - `cat_sp_Data_Permission_Category_New` (danh sách phân quyền)
>     - `Get_MasterDataForUser` (trả về ID danh mục được phân quyền)
> 
> 5. **Phân quyền dự án:**
>     - Phân quyền lưới danh mục thông qua hàm kiểm tra quyền danh mục trong store danh sách.
>     - Phân quyền cửa sổ đa mục thông qua store đa mục.
 