---
Mã cuộc họp: H-LTG-TAL-090724
aliases: 
title: Biên bản họp quản lý nhân tài
tags:
  - "#meeting"
  - "#quanlynhantai"
  - "#talent"
date: 2024-07-09
members:
  - tungly
  - minhnguyendat
  - tiendang
Related: "[[0.Meeting]]"
Link: https://docs.google.com/spreadsheets/d/1LeOoyFHpXN78jCnxm-tb6ttvRx0__3pyZpR4x0o2Pgo/edit?gid=737863023#gid=737863023
Project:
  - LTG
---
## Họp quản lý nhân tài - Dự án LTG
## Biên bản họp : 09/07/2024
- Mã cuộc họp: **H-LTG-TAL-090724**
- **Người tham gia**: TungLy, TienDang, MinhNguyendat
- Cuộc họp liên quan [^1]
- Thông tin thêm
	- Link email [^2]
	- GAP list [^3]
## Mục tiêu:
	Quản lý nhân tài
	 Phân quyền tự động

## 📝Các ý chính
- #### Quản lý nhân tài
- Quản lý nhân tài 
	- Chức năng bình luận: Duyệt nhân sự kế thừa > Bình luận
		- Vấn đề: Sau khi bình luận hệ thống đóng Pop-up bình luận. Chuyển sang một tab khác để người bình luận có thể xem tương tự concept duyệt, Phải bình luận trước rồi người duyệt mới duyệt được dữ liệu nếu có setup người bình luận
		- Hiện trạng: Khi thực hiện B4 mà chưa thực hiện B3. Vẫn xử lý duyệt được
		- Hướng giải quyết: 
			- Khi bình luận xong đóng pop-up. Phải bình luân xong mới có được duyệt  
			- Quy trình duyệt Đội ngũ kế cận:  
				- B1: Phân tích đội ngũ kế cận  
				- B2: Tạo đề xuất >> Output: 1 dòng đội ngũ kế cận trạng thái yêu cầu  
				- B3: Bình luận đề xuất kế cận (1 người bình luận)  
				- B4: Duyệt đề xuất kế cận  			  
	- Thêm mới năng lực vị trí hướng tới
		- Chức năng : Kế thừa V2 > Tab mục tiêu > Tạo mới mục tiêu năng lực, mục tiêu đào tạo
		- Vấn đề khách hàng: Hiện chưa thấy sự liên kế trong việc xây dựng kế hoạch này. Hệ thống co danh sách khóa học cần đào tạo theo năng lực, hệ thống có được những năng lực nào của nhân viên đang GAP nhưng lại không có cơ chế ràng buộc hoặc tự tạo
		- Hướng giải quyết: Sau khi duyệt. Hệ thống tự tạo mục tiêu năng lực hướng tới và mục tiêu đào tạo hướng tới theo GAP của nhân viên
	- Phân tích đào tạo đội ngũ kế thừa
		- Chức năng : kế thừa V2
		- Vấn đề khách hàng: Hiện nếu nhân viên chưa có năng lực, không phân tích được. Thêm cột vị trí chủ chốt, mã chức vụ vị trí chủ chốt, mã lộ trình nghề nghiệp
		- Hướng giải quyết: Thêm logic phân tích đối với những năng lực mà nhân viên không có. Thêm cột
		- Giải phát chốt: Có thể phân tích được những năng lực mà nhân viên đang không có so với vị trí chủ chốt
- Cấu hình phân quyền tự động
		- Vấn đề khách hàng: Khi có NV mới: Tự động tạo user và phân quyền portal cho NV - Nếu nhân viên thuộc nhóm "Nhân viên", "Lao động giản đơn", "Công nhân" => Phân nhóm quyền "Nhân viên LTG" - Nếu nhân viên thuộc các đối tượng còn lại => Phân nhóm quyền "Nhân viên LTG" và "Quản lý"
		- Hướng giải quyết: Đã có màn hình cấu hình phân quyền tự động nhưng chưa có loại điều kiện Nhóm nhân viên
		- Giải pháp chốt: thêm điều kiện Nhóm nhân viên khi tạo mới cấu hình phân quyền tự động 
	

## Action tiếp theo:
 1. PIC (dd/MM):  Chức năng bình luận
 2. PIC (dd/MM):  Hệ thống tự tạo mục tiêu năng lực hướng tới và mục tiêu đào tạo hướng tới theo GAP của nhân viên
 3. PIC (dd/MM):  phân tích được những năng lực mà nhân viên đang không có so với vị trí chủ chốt
 4. PIC (dd/MM):  Cấu hình phân quyền tự động


# Tóm tắt

1. **Quản lý nhân tài:**
   - Chức năng bình luận và duyệt kế thừa nhân sự
   - Thêm năng lực hướng tới mới
   - Phân tích đào tạo đội ngũ kế thừa

2. **Cấu hình phân quyền tự động:**
   - Tạo cấu hình phân quyền cho nhóm nhân viên mới

3. **Hướng giải quyết vấn đề bình luận kế thừa:**
   - Đóng pop-up bình luận sau khi bình luận xong
   - Yêu cầu bình luận trước mới được duyệt

4. **Hướng giải quyết vấn đề phân tích đào tạo:**
   - Thêm logic phân tích năng lực nhân viên còn thiếu
   - Thêm cột vị trí chủ chốt và lộ trình nghề nghiệp

5. **Phân quyền tự động theo nhóm nhân viên:**
   - Thêm điều kiện nhóm nhân viên vào cấu hình phân quyền tự động

 ### Liên kết:
[[0.H-LTG]]



[^1]: Cuộc họp trước [[H-LTG-TAL-020724]] 
[^2]: Email;
[^3]: GAP list: [LTG Phase 3-DetailPlan-Nội bộ - Google Sheets](https://docs.google.com/spreadsheets/d/1LeOoyFHpXN78jCnxm-tb6ttvRx0__3pyZpR4x0o2Pgo/edit?gid=737863023#gid=737863023)
