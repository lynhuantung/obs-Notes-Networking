---
Mã cuộc họp: H-HVN-SYS-060924
aliases: 
title: Biên bản họp khóa đối tượng theo loại kỳ công
tags:
  - "#meeting"
  - LockObject
  - khoadoituong
date: 2024-06-15
members:
  - tungly
  - dunghoang
  - tinnguyen
Related: "[[0.Meeting]]"
Link: 
Project:
  - HVN
---

## Biên bản họp: 06/09/2024

## Mục tiêu:
1. Xử lý khóa đối tượng theo loại kỳ công (vì 1 tháng có giao 2 kỳ công)


> [!NOTE] Tóm tắt 5 Ý Chính:
> 
> 1. **Khóa Đối Tượng:** Thêm tùy chọn loại kỳ công vào màn hình khóa đối tượng. [[Khóa đối tượng]]
> 2. **Kiểm Tra Khóa Đối Tượng:** Lọc lại loại kỳ công trong dữ liệu khóa đối tượng. [[Kiểm tra khóa đối tượng]]
> 3. **Nghiệp Vụ Module:** Truyền thêm loại kỳ công vào các module như công, tăng ca và lương. [[Nghiệp vụ module]]
> 4. **Giải Pháp của BA Tiến Đặng:** Thêm loại kỳ công vào nhóm nhân viên và dựa vào đó để lọc danh sách khóa đối tượng. [[Giải pháp của BA Tiến Đặng]]
> 5. **Hành Động Tiếp Theo:** Dung Hoang sẽ xử lý màn hình khóa đối tượng, nghiệp vụ công, lương; Tiến Đặng sẽ thêm loại kỳ công vào nhóm nhân viên và xử lý kiểm tra khóa đối tượng. [[Hành động tiếp theo]]
> 




## 📝Các ý chính
#### Xử lý khóa đối tượng
- Thêm option loai kỳ công trong màn hình khóa đối tượng
- Khi kiểm tra khóa đối tượng sẽ lọc lại loại kỳ công trong dữ liệu khóa đối tượng
	- Hàm saveChange : module sẽ truyền loại kỳ công
	- Hàm kiểm tra khóa đối tượng : truyền loại kỳ công
#### Xử lý nghiệp vụ các module
- Công - Tăng ca : truyền thêm loại kỳ công xuống
- Lương....

#### Giải pháp BA -TiếnĐặng
- Trong nhóm nhân viên (Nằm trong Hre_Profile) sẽ có loại kỳ công
- Khi kiểm tra khóa đối tượng sẽ dựa vào nhân viên -> Nhóm nhân viên -> loại kỳ công => để lọc lại danh sách khóa đối tượng.
![[Pasted image 20240907084315.png]]

#### Đổi giải pháp BA -TiếnĐặng (ngày 20/09/2024): 
- Trong màn hình khóa đối tượng xử lý khi load kỳ công sẽ load loại nv
![[Pasted image 20240920161434.png]]
- Khi kiểm tra khóa đối tượng sẽ dựa vào nhân viên -> loại nhân viên -> loại kỳ công => để lọc lại danh sách khóa đối tượng.
![[Pasted image 20240920174202.png]]


## Action tiếp theo:
 1. Dung.Hoang :  
	 - Raise task màn hình khóa đối tượng và xử lý khóa đối tượng
	 - Raise task xử lý nghiệp vụ công, lương
 2. Giải pháp Tiến.Đặng
	 - Dung.Hoang raise task thêm loại kỳ công vào nhóm nhân viên.
	 - Và raise thêm task khi kiểm tra khóa đối tượng sẽ lọc theo nhóm nhân viên -> loại kỳ công.



