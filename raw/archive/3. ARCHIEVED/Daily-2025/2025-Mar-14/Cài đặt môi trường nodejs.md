---
Mã: 25031431-01
aliases: 
date: 2025-03-31
time: 08:26
Week: "14"
tags:
  - "#setup"
  - "#frontend"
  - nodejs
Link: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=9469958
---
# Thông tin link hướng dẫn
- canva hướng dẫn : [Trainning frontend angular (buoi1).pptx - Bài thuyết trình](https://www.canva.com/design/DAGjQXGxGo8/p_i47RXZFtaM_DDXPj1bzQ/edit)
- Link hướng dẫn cài đặt môi trường: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=9469958
# Cài đặt môi trường 
- Link hướng dẫn cài đặt môi trường: [Cài đặt môi trường - Front-End Developers - Confluence](https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=9469958)
- cài đặt NVM (ver >= 18.15.0
	Trong ngữ cảnh bạn đang xem, **NVM** (Node Version Manager) là một công cụ hỗ trợ quản lý các phiên bản Node.js trên máy tính của bạn. Nó cho phép bạn cài đặt, chuyển đổi và sử dụng nhiều phiên bản Node.js khác nhau mà không gây xung đột. Điều này rất hữu ích khi bạn làm việc với các dự án yêu cầu phiên bản Node.js cụ thể.
- Cài đặt nodejs (link download: [Node.js — Download Node.js®](https://nodejs.org/en/download))
- Cài đặt Angula CLI
	- Cài đặt Angular CLI trên Node Version đang sử dụng trên NVM
	`npm install -g @angular/cli`
	
##  Kiểm tra các môi trường đã hoạt động hay chưa

|**Package**|Scripts|
|---|---|
|nodejs|node -v|
|npm|npm -v|
|angular cli|ng version|
|yarn|yarn -v|
![[Pasted image 20250331085918.png]]
Sau khi kiểm tra , đã có thể sử dụng node.js và angular 
 - Node.Js (backEnd):
	 - Thường được sử dụng ở **phía máy chủ**, cung cấp API, xử lý logic ứng dụng, quản lý cơ sở dữ liệu và xử lý các yêu cầu từ frontend.
 - Angular (front end):
	 - Angular là framework mạnh mẽ dành cho **phía người dùng (client-side)**, giúp xây dựng giao diện người dùng (UI) tương tác và phản hồi nhanh.

##  Clone source
- clone source url: http://svr-hcm-se:8080/tfs/RD/VNR%20-%20FrontEnd%20-%20Framework/_git/Vnr.Dev.HrmPortal
- Sau khi clone source xong, vào Teminal để chạy lệnh bên dưới để tiến hành cài đặt package
##  Cài đặt thư viện
![[Pasted image 20250331091239.png]]
Kết quả sau khi cài đặt thư viện:
![[Pasted image 20250331091355.png]]



## Xử lý cài lại khi bị lỗi cài package
1. xóa thư mục .angular  
2. xóa thư mục node_modules/vnr-module  
![[Pasted image 20250331111107.png]]
3. vô file yarn.lock => tìm và xóa vnr-module  
![[Pasted image 20250331111120.png]]
4. chạy lệnh lại yarn add vnr-module@0.2.1 --registry http://172.21.35.3:56000  
	1. Lệnh này nằm ở package
	![[Pasted image 20250331111231.png]]
5. chạy lại source
	1. vd: chạy module HR
	![[Pasted image 20250331111345.png]]