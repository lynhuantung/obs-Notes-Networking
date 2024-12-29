---
aliases: 
date: 2024-07-29
tags:
  - daily
---
- Hướng dẫn Tân (2 tiếng)
	- Task performance
	- 
	- Tân (2 tiếng)
		- Jira : ghi hàng ngày
		- Lộ trình KPI
		- Task tháng 08/2024
			- [x] Chậm chế độ bảo hiểm (task [0183060](http://mantis.vnresource.net:89/mantis/view.php?id=0183060))			- 
			- Trong các màn thiết lập, chuyển từ xml sang json (gồm upload và download). Trao  đổi thêm với TungLy
			- BaseService : truyền userLogin UserID ([183152](http://mantis.vnresource.net:89/mantis/view.php?id=183152))
			- Xử lý thêm các bug...
			- Task lớn: gồm nhiều task nhỏ
- Làm tài liệu confluence (2 tiếng)
	- Tạo space cho khách hàng
	- 
- Họp với Ngân về dự án LTG - các task kiêm nhiệm
- Hỗ trợ PE -Dung.Tran về ghi log

- Tâm (2 tiếng):
	- Scheduler: gọi api của bên thứ 3, cần truyền token lay từ cache
	- Hỗ trợ debug window service


Chức năng chuyển xml sang json
- Hiện trạng:
	- Export : 
		- đọc model của giao diện 
		- Chuyển model sang file xml
	- Import
		- Chọn file xml
		- Đọc file xml và chuyển thành đối tượng (model)
		- Load model ra giao diện
- Mong muốn chuyển xml sang json
	- Export
		- Đọc model của giao diện
		- Chuyển model sang file json
			-          string jsonBody = JsonConvert.SerializeObject(notification);
	- Import
		- Chọn file json
		- Đọc file json và chuyển thành đối tượng (model)
			JsonConvert.DeserializeObject<Model>(NoiDungFileJson);
		- Load model ra giao diện



