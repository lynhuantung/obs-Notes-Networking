---
aliases: 
date: 2024-10-30
tags:
  - daily
---
- Làm công cụ ETL [[ETL]]

## Công việc hôm nay :
- Gọi API động để lấy dữ liệu từ các store khác nhau chỉ bằng cách truyền tên store mong muốn và tham số cần thiết. Ví dụ với URL sau:
-  Thông tin api:
http://172.21.55.3:2707/api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_AttendanceMonth&Param=2024-01-01

- API sẽ tự động tạo ra các bảng tương ứng.
- Hiện tại, có thể sinh ra được 2 bảng sau:
	- Bảng công: dbo_raw__stream_API_CustomByStore_AttendanceMonth
	- Bảng sinh nhật: dbo_raw__stream_Profile_Birthday

