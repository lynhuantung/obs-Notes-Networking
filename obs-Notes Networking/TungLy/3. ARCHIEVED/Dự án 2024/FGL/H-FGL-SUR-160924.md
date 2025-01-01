---
Mã cuộc họp: H-FGL-SUR-160924
aliases: 
title: Biên bản họp tích hợp survey
tags:
  - "#meeting"
date: 2024-09-16
members:
  - tungly
  - tamhuynh
  - khach-hang-FGL
Related: "[[0.Meeting]]"
Link: 
Project:
  - "[[Dự án FGL]]"
---
## Họp tìm giải pháp tích hợp survey  - Dự án FGL
## Biên bản họp : 16/09/2024
- Mã cuộc họp: H-FGL-SUR-160924
- **Người tham gia**: TungLy, TamHuynh, Cuong-FGL
- Thông tin thêm 
	- GAP list [^1]

# Tóm tắt
--- 

 
## Mục tiêu:
---
- Tìm giải pháp cho tích hợp web Survey của FGL với web HRM của VnR

## 📝Các ý chính  
---
- Giải thích thêm về API web khảo sát không lấy được thông tin đăng nhập theo giải pháp trước đây, và cần thay đổi giải pháp như bên dưới.

	**Yêu cầu:** Kiểm tra người dùng đã đăng nhập web HRM chưa trước khi truy cập vào web khảo sát. Nếu chưa đăng nhập, không được vào trang khảo sát.
	
	**Giải pháp trước đây** (không thể kiểm tra đăng nhập từ web khác): Tạo API bên HRM:
	- Web khảo sát gọi API của HRM để kiểm tra đăng nhập.
	- Tuy nhiên, do hai web khác nhau nên không thể chia sẻ thông tin đăng nhập trực tiếp.
	
	**Giải pháp đề xuất** (xem hình flowchart): Dùng redirect:
	- Khi người dùng vào web khảo sát, sẽ được redirect sang HRM để kiểm tra đăng nhập.
	- Nếu chưa đăng nhập: HRM sẽ chuyển hướng đến trang đăng nhập HRM.
	- Nếu đã đăng nhập: HRM chuyển hướng lại web khảo sát kèm theo token chứa thông tin người dùng (CodeEmp, ProfileName, OrgstructureName).
- Code:
```js
location.href = 'https://cs01.vnresource.net:2104/SurveyAuthen/Index?surveyURL=https://fgl-survey.fashiongarments.com:3000/Login/index?lang=&token=&urlHRM=https://cs01.vnresource.net:2104/New_Login/New_Index'
```

- Flow xử lý
 ![[Pasted image 20240916154338.png]]

## Action tiếp theo:
---
 1. Xử lý theo hướng redirect




### Liên kết:
---
[[H-FGL-SYS-240724]]


[^1]: GAP list: [Terumo - Function list - Google Sheets](https://docs.google.com/spreadsheets/d/1fcCXATnmUflQItX6mFdAYQAFWSwJC_i3UhjM9E90dIY/edit?gid=306720884#gid=306720884)
