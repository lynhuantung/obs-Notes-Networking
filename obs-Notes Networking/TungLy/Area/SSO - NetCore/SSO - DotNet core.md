---
aliases: 
date: 2025-02-03
tags:
  - "#Area"
  - "#sso"
  - "#dotnet-core"
  - "#upgrade"
Related:
  - "[[Identity]]"
---
 - Update NET8
	 - SSO
	 - [[Cấu hình launchSettings]]
## Các bước thực hiện
	- Cài đặt net8
	- Get source của Hoàng
	- Identity
Link google sheet: [[VnR] HRM Project Upgrade Plan - Google Sheets](https://docs.google.com/spreadsheets/d/1DFnMBfd06uOBLhMg3k8xMOpC3Z8qiAmnw5E1HA-uYlM/edit?gid=346754352#gid=346754352)

HRService/SystemService SSO API  
SDK SSO => OPENIDConnect  
1. Đọc cấu hình như cũ ở auth.config (tạm thời hard.code)  
2. Identity cấu hình thêm client trong appsettings.json  
3. Xử lý code ở HrService/SystemService (có SDK khai báo thông tin đọc từ auth.config)  
4. Add thêm code ở Swagger

Xử lý ở program trong hr service
![[Pasted image 20250203105931.png]]