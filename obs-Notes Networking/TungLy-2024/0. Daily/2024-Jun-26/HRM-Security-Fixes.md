---
aliases: 
date: 2024-06-26
tags:
  - "#new_note"
  - "#security"
  - "#misa"
Link: https://docs.google.com/spreadsheets/d/1KZ12r-KELfPu5R67ft06PQ21i75MT2WQDivXuynYgg8/edit?gid=0#gid=0
---
- Xử lý bảo mật cho Sáng [[Bảo mật HRM - Misa]] [^1]
	- Xử lý  HRM-04 BROKEN ACCESS CONTROL => Done
		- Xử lý kiểm tra quyền khi gọi các API của mục HRM-04
	- HRM-05 PRIVILEGE ESCALATION  => done
		- Xử lý kiểm tra quyền chỉnh sửa người dùng
	- HRM-06 SENSITIVE DATA EXPOSURE => Done
		- Sys_GetData/GetUserList : xử lý lộ mật khẩu
		- Sys_GetData/GetTeamPlateEmailList : xử lý lộ đường dẫn file mẫu template
- commitid cho xử lý bảo mật misa: [Commit a77cd7d9: [Tung.Ly 20240626]: xử lý bảo mật kiểm tra quyền trước khi gọi api danh sách … - Microsoft Team Foundation Server](http://172.21.35.3:8080/tfs/HRMCollection/_git/HRM9/commit/a77cd7d98cd336aa464752b6c9409b65e22ca4e6)
- REPORT_PENTEST_VnR_HRM2.pdf  (password đọc file pdf : Vnr@#$2024)
- ![[REPORT_PENTEST_VnR_HRM2.pdf]]
- Check link Paiho
- Check bug bảo hiểm cho LTG





[^1]: đường dẫn quản lý bảo mật Misa : [Kế hoach test fix HRM-Misa - Google Sheets](https://docs.google.com/spreadsheets/d/1KZ12r-KELfPu5R67ft06PQ21i75MT2WQDivXuynYgg8/edit?gid=0#gid=0)