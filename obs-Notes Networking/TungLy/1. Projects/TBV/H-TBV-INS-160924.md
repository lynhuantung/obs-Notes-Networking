---
Mã cuộc họp: H-TBV-INS-160924
aliases: 
title: Biên bản họp quản lý nhân tài
tags:
  - "#meeting"
  - phantichbaohiem
date: 2024-09-16
members:
  - tungly
  - minhnguyendat
  - ngannguyen
  - thongtrinh
Related: "[[0.Meeting]]"
Link: https://docs.google.com/spreadsheets/d/1LeOoyFHpXN78jCnxm-tb6ttvRx0__3pyZpR4x0o2Pgo/edit?gid=737863023#gid=737863023
Project:
  - TBV
---
## Họp phân tích bảo hiểm - Dự án TBV
## Biên bản họp : 16/09/2024
- Mã cuộc họp: H-TBV-INS-160924
- **Người tham gia**: TungLy, MinhNguyendat, NganNguyen, ThongTrinh, Thao 
- Thông tin thêm 
	- GAP list [^1]

# Tóm tắt
--- 
**5 Ý chính:**

1. **Quy trình quản lý trích nộp bảo hiểm:** Thêm tính năng chọn nơi đóng bảo hiểm mặc định, tính lương chưa đủ mức trích nộp, nghỉ không lương full tháng vẫn đóng BHYT.
2. **Tích hợp Amis:** Tích hợp 01-HSB với Misa, trao đổi thêm để tiến hành tích hợp.
3. **Quy trình thanh toán chế độ Ốm đau – Thai sản:** Cảnh báo nghỉ dài ngày, khám thai quá mức, thêm chức năng nhập số tiền thanh toán của cơ quan bảo hiểm, không thay đổi ngày nghỉ khi thay đổi loại chứng từ.
4. **Xuất báo cáo bảo hiểm:** Báo tăng nhân viên giảm ốm/không hưởng lương đi làm lại để duy trì BHYT.
5. **Tích hợp Amis:** Đang tích hợp tờ khai 600 (Tăng/giảm/điều chỉnh), vẫn chưa tích hợp 01-HSB.
 
## Mục tiêu:
---
- Quy trình quản lý trích nộp bảo hiểm
- Tích hợp Amis
- Quy trình thanh toán chế độ Ốm đau – Thai sản 

## 📝Các ý chính  
---
-  Quy trình quản lý trích nộp bảo hiểm
	- Yêu cầu : Nơi đóng bảo hiểm mặc định là huyện Long Thành.
	- Kiểm tra chưa có tính năng huyện đóng bảo hiểm ở màn hinh phân tích bảo hiểm
	- Câu hỏi:
		- Nhờ BA kiểm tra task nào lưu huyện đóng bảo hiểm?
- Tích hợp Amis
	- Tích hợp 01-HSB với Misa
	- Trao đổi thêm giữa HRM và Misa để tiến hành tích hợp 01-HSB
- Quy trình thanh toán chế độ Ốm đau – Thai sản 
	- Cảnh báo nghỉ dài ngày nếu lớn hơn 180 ngày
	- Cảnh báo khám thai 5 lần trên 1 thai kỳ
	![[Pasted image 20240916145946.png]]

- Quy trình quản lý trích nộp bảo hiểm
	1. Phương án cho trường hợp Nhân viên không đủ lương để trích nộp tham gia bảo hiểm sẽ cho nhân viên chọn phương án:
		  + Trừ toàn bộ vào tháng sau
	1. Nhân viên xin nghỉ không lương full tháng vẫn đóng BHYT (4.5% NLĐ)
	2. Nhân viên nghỉ việc sau ngày 15, trước đó vẫn có ngày nghỉ (bệnh, không lương),… nhiều hơn 14 ngày thì  tính là nghỉ không lương
	3. Khi phân tích bảo hiểm xong có chức năng xác nhận dòng dữ liệu nếu chốt dòng dữ liệu đó đã đúng, không được chỉnh sửa hay phân tích lại nữa.
	4. Thiết lập mặc định nơi đóng bảo hiểm “ BHXH huyện Long Thành” nếu cần thay đổi, NV phụ trách sẽ điều chỉnh"

- Quy trình thanh toán chế độ Ốm đau – Thai sản
	1. Ngày nghỉ ốm nhưng không có chứng từ, không cần quản lý dòng dữ liệu này ở chứng từ
	2. Mỗi loại chứng từ có mức hưởng tối đa khác nhau trong năm, quá số ngày tối đa đó thì không quản lý nữa
	3. Thêm chức năng nhập số tiền và kết quả thanh toán chứng từ của cơ quản bảo hiểm trả về.
	4. Không thay đổi ngày nghỉ của chứng từ so với ngày nghỉ đã đăng ký ở DS Ngày nghỉ
	5. Có thể thay đổi loại chứng từ: từ ốm ngắn ngày thành dài ngày"

- Xuất báo cáo bảo hiểm
	1. Nhân viên giảm ốm đau đi làm lại trong kỳ bảo hiểm và thỏa Điều kiện tham gia. .=> các trường hợp chưa đi làm lại vẫn báo tăng trong kỳ, sau đó sẽ báo giảm lại trong kỳ để duy trì thẻ BHYT cho NLĐ.
	2. Nhân viên giảm không hưởng lương đi làm lại trong kỳ bảo hiểm và thỏa Điều kiện tham gia. => các trường hợp chưa đi làm lại vẫn báo tăng trong kỳ, sau đó sẽ báo giảm lại trong kỳ để duy trì thẻ BHYT cho NLĐ."

- Tích hợp Amis
	1. Đang tích hợp tờ khai 600 (Tăng/giảm/điều chỉnh), nhưng không thấy tích hợp 01-HSB


## Action tiếp theo:
---
 1. BA kiểm  tra task nào lưu huyện đóng bảo hiểm trong phân tích bảo hiểm?




### Liên kết:
---
[[0.H-TBV]]


[^1]: GAP list: [Terumo - Function list - Google Sheets](https://docs.google.com/spreadsheets/d/1fcCXATnmUflQItX6mFdAYQAFWSwJC_i3UhjM9E90dIY/edit?gid=306720884#gid=306720884)




