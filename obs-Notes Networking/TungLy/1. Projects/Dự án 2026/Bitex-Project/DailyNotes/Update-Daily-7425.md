---
Mã: Update-Daily
aliases: 
date: 2025-08-12
time: 06:40
Week: "02"
tags:
  - daily
Project: "[[Dự án Bitex]]"
Liên kết:
---
# 12/02/2026
---
-  Xử lý lỗi loading app do không lấy được cấu hình và báo lỗi không đọc file được
	- Nguyên nhân: do dùng cache httpcontext để cách các file xml mà app sử dụng và đọc file liên tục, trong khi file rất ít thay đổi
	- Giải pháp: cache vào redis 
	- Trước đây hệ thống dùng **HttpContext.Cache**, cache chỉ tồn tại theo từng request. Khi nhiều request chạy cùng lúc, có thể cùng đọc file cấu hình và gây **lỗi file đang được sử dụng**. 
	- Chuyển sang **Redis** giúp dùng cache chung cho toàn hệ thống, chỉ đọc file một lần, các request khác dùng lại, từ đó **khắc phục lỗi** .
# 12/08/2025
---
-  Check link lỗi