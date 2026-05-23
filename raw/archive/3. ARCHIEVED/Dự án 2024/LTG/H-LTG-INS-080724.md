---
Mã cuộc họp: H-LTG-INS-080724
aliases: 
title: Họp trao đổi issue bảo hiểm phát sinh sau UAT
tags:
  - "#meeting"
  - "#baohiem"
date: 2024-07-08
members:
  - tungly
  - minhnguyendat
  - thongtrinh
Related: "[[0.H-LTG]]"
Link: https://docs.google.com/spreadsheets/d/1NEzY1PRpz0OW7PG9wRHWHLLdeWlXcXxQ/edit?gid=2090953782#gid=2090953782&fvid=879198301
Project:
  - "[[Dự án LTG]]"
Thời gian họp: 3h
---

## Họp quản lý bảo hiểm - Dự án LTG
## Biên bản họp : 08/07/2024
- Mã cuộc họp: **H-LTG-INS-080724**
- **Người tham gia**: TungLy, ThongTrinh, MinhNguyendat, Thao.Phan

## Mục tiêu:
	1. Quản lý bảo hiểm
		1. Chứng từ bảo hiểm
		2. Phân tích bảo hiểm
		
## Yêu cầu khách hàng:
	

## 📝Các ý chính
- MH Chứng từ BHXH và chờ chứng từ:
	- Đồng bộ nút Duyệt lấy đủ các trường thông tin từ bảng Ngày nghỉ chờ CT BHXH qua bảng Chứng từ BHXH
		- Khi nhấn nút Duyệt lấy thông tin từ bảng ngày nghỉ + bảng lưu tạm chứng từ để đẩy qua bảng chứng từ	
- Màn hình chứng từ
	- ~~Load quá trình thai sản => load ngày dự sinh => đã đáp ứng~~
- Phân tích bảo hiểm
	- Nghỉ 14 ngày: 1 ngày làm 24 tiếng => 1 tháng chỉ làm 12 ngày => không bao giờ nghỉ hơn 14 ngày
		- Giải pháp: tính số ngày đi làm từ phần tử bảo hiểm (tính công trước)


![[Pasted image 20240708153052.png]]
## Action tiếp theo:
 1. Thao -PE (10/07):  Thêm logic nút duyệt chờ chứng từ để lấy bảng ngày nghỉ + bảng lưu tạm chứng từ để đẩy qua bảng chứng từ	
 
# Thông tin thêm:
- Link email: 
- Link  GAP list : https://docs.google.com/spreadsheets/d/1NEzY1PRpz0OW7PG9wRHWHLLdeWlXcXxQ/edit?gid=2090953782#gid=2090953782&fvid=879198301

# Tóm tắt
 
1. **Đồng bộ nút Duyệt** lấy thông tin từ Ngày nghỉ chờ CT BHXH vào Chứng từ BHXH [[#MH Chứng từ BHXH và chờ chứng từ]]
2. **Tính số ngày làm việc** từ phần tử bảo hiểm cho trường hợp nghỉ 14 ngày [[#Phân tích bảo hiểm]]
3. Thêm **ngày dự sinh** load từ quá trình thai sản vào loại chứng từ sẩy thai [[#Màn hình chứng từ]]
4. Sửa lỗi **Màn hình chứng từ** để load đúng quá trình thai sản [[#Màn hình chứng từ]]


### Liên kết:
[[0.H-LTG]]