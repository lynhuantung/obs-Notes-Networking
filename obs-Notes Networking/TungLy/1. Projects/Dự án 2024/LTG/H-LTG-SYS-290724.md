---
Mã cuộc họp: H-LTG-SYS-290724
aliases: 
title: Họp GAP kiêm nhiệm theo pháp nhân
tags:
  - "#meeting"
date: 2024-07-29
members:
  - tungly
  - ngannguyen
  - tiendang
  - baotran
Related: "[[0.H-LTG]]"
Link: https://docs.google.com/spreadsheets/d/1D3U6zLARK2ZXgCtTkxFYHdrfcc_wzhyC8nkOBBbm9Yw/edit?gid=1977722742#gid=1977722742
Project:
  - LTG
Thời gian họp: 1h
---

## Họp quản lý theo pháp nhân - Dự án LTG
## Biên bản họp : 29/07/2024
- Mã cuộc họp: **H-LTG-SYS-290724**
- **Người tham gia**: TungLy, ngannguyen, tiendang, baotran, leaderSE

## Mục tiêu:
	1. Quản lý kiêm nhiệm của nhân viên tại nhiều pháp nhân khác nhau
		
## Yêu cầu khách hàng:
	

## 📝Các ý chính
- Profile chỉ có 1, nhưng kiêm nhiệm ở những pháp nhân khác nhau
	- VD: 10 phụ cấp, 3 phụ cấp công ty 1, 7 phụ cấp công ty 2 
- Tạo dữ liệu
	- Tạo , lưu, load
- Dữ liệu dùng chung
- Dữ liệu dùng riêng
- Kịch bản kiêm nhiệm:
	- 1. Tạo mới hợp đồng cho công ty (chọn pháp nhân, 1 pháp nhân thì load mặc định)
	- set kiêm nhiệm
		- Phân quyền (1)
			- Kiểm tra số pháp nhân user được phân quyền
		- Nhân viên (2)
			- Kiểm tra kiêm nhiệm nhân viên + hiệu lực kiêm nhiệm
		- Lấy kết quả (1) và (2)
	- Lấy QTCT theo pháp nhân có hiệu lực xuống bảng chính
	- Điều chỉnh hàm phân quyền đọc dữ liệu từ bảng chính, không đọc qua profile(đọc dữ  liệu QTCT từ bảng chính HĐ)
-   
1.Khi tạo mới HĐ bắt buộc chọn pháp nhân:  
- Nếu 1 pháp nhân: tự load lên  
- Nếu n pháp nhân: user tự chọn  
2. Xét kiêm nhiệm trên:  
- Phân quyền (*): Kiểm tra số pháp nhân của user được phân quyền  
=> Đọc field công ty trong MH phân quyền  
- Nhân viên(**): Kiểm tra kiêm nhiệm của NV + hiệu lực kiêm nhiệm + ngày hiệu lực HĐ  
  
=> lấy kết quả của (* và **)  
3. Lấy QTCT theo pháp nhân có hiệu lực lưu xuống bảng chính  
4. Điều chỉnh hàm phân quyền đọc dữ liệu từ bảng chính, không đọc qua profile (đọc dữ liệu QTCT từ bảng chính HĐ)  
--------  
Thao tác trên giao diện  
B1. Bắt buộc chọn cty trước  
B2. load DS NV theo phân quyền hiện tại + NV kiêm nhiệm vô pháp nhân đó (kiểm tra QTCT kiêm nhiệm có cty = cty ở B1 và hiệu lực kiêm nhiệm đến ngày hiện tại)

- ![[Pasted image 20240729141619.png]]


## Action tiếp theo:
 1. 
 
# Thông tin thêm:
- Link email: 
- Link  GAP list : [https://docs.google.com/spreadsheets/d/1D3U6zLARK2ZXgCtTkxFYHdrfcc_wzhyC8nkOBBbm9Yw/edit?gid=1977722742#gid=1977722742](https://docs.google.com/spreadsheets/d/1D3U6zLARK2ZXgCtTkxFYHdrfcc_wzhyC8nkOBBbm9Yw/edit?gid=1977722742#gid=1977722742)

# Tóm tắt
 

--- 
**5 Ý chính:**

1. Quản lý kiêm nhiệm nhân viên tại nhiều pháp nhân
2. Profile chung, dữ liệu kiêm nhiệm riêng lẻ
3. Kịch bản kiêm nhiệm: tạo mới hợp đồng, chọn pháp nhân, phân quyền kiểm tra
4. Phân quyền đọc dữ liệu từ bảng chính, bỏ qua thông tin trong profile
5. Thao tác trên giao diện: chọn pháp nhân, tải danh sách nhân viên kiêm nhiệm

**Liên kết:**

- Profile: [[1.User Profile]]
- Hợp đồng: [[2.Contract]]
- Phân quyền: [[3.Authorization]]
- Bảng chính: [[4.Main Table]]

 --- 




### Liên kết:
[[0.H-LTG]]