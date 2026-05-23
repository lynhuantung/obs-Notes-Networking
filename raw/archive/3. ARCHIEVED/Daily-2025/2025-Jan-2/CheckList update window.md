---
Mã: 25010206-01
aliases: 
date: 2025-01-06
time: 11:27
Week: "02"
tags:
  - daily
  - "#checklist"
---
### Check list sau khi update window
- [ ] Redis service
	- [ ] Kiểm tra service redis đã start ?
	- [ ] Dùng tool redis insight để kiểm tra kết nối redis thành công chưa?
	- [ ] Kiểm tra cấu hình Redis (file `redis.conf`) có bị thay đổi không.
	- [ ] Sau khi start service redis => Start các pool của HRM
- [ ] Window service (HRM)
	- [ ] Kiểm tra window service của HRM đã start chưa?
	- [ ] Kiểm tra log event viewer
- [ ] Kiểm tra chức năng gửi mail
	- [ ] Gửi thử email kiểm tra từ ứng dụng
- [ ] Kiểm tra chung hệ thống HRM
	- [ ] Đảm bảo HRM chạy bình thường
	- [ ] Kiểm tra kết nối mạng
	- [ ] Kiểm tra kết nối SQL server
- [ ] Kiểm tra Firewall và các chính sách bảo mật
	 - [ ] Sau khi update, Windows Firewall hoặc các chính sách bảo mật có thể thay đổi. Kiểm tra lại cài đặt để đảm bảo các ứng dụng và dịch vụ không bị chặn bao gồm kiểm tra có bị chặn port.

