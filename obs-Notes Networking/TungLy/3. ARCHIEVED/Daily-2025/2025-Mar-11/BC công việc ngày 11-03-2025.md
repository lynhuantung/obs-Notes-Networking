---
Mã: 25031111-01
aliases: 
date: 2025-03-11
time: 08:30
Week: "11"
tags:
  - daily
Liên kết:
  - "[[Upgrade Net8 - Weekly]]"
---

### Công việc hoàn thành
---
- Chạy được thêm/xóa/sửa/đổi cột/excel màn hình danh mục
- Chạy được đăng nhập SSO (main, portal, hr, sys, api core)
- Edit trên lưới
- Một số api chưa chỉnh lại url đúng
- Docker 
	- Chạy được 4 web (main, portal, hr, sys)

### Công việc đang thực hiện
---
-  Logout
- Scheduler theo background service
- Docker: SSO : chưa chạy được identity
### Khó khăn
---
- Chưa biết cách xử lý logout sẽ logout cả identity, main, xóa cookies...
- Chưa chạy được my-app, chưa chạy được portal
- Khi lấy dữ liệu người dùng đang lấy sai ID thành profileid (nghi ngờ mapping của hệ thống bị hiểu nhầm)
- Chạy entity bị chậm lần đầu
- Khi hết hạn token không thể tạo mới token dựa vào refresh_token trước.

### Kế hoạch tiếp theo:
- Xử lý logout sẽ logout cả identiy và main
- Xử lý refresh token
- Chạy được my-app portal
- 11/03 : build 1 bản cho QC test lại lúc 11 giờ
- 