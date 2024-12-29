

- [HRM-04] BROKEN ACCESS CONTROL : 
	**Mô tả :** ● Broken Access Control là lỗ hổng bảo mật xảy ra khi hệ thống không thực thi đúng các chính sách kiểm soát truy cập. Điều này cho phép kẻ tấn công truy cập trái phép vào các chức năng và dữ liệu mà họ không được phép, dẫn đến rủi ro an ninh nghiêm trọng.
		- /Sys_GetData/GetUserList  (done)
		-  /api/Sys_User/    (done)
		-   /Sys_GetData/GetItemTrackingList  (done)

- Xss [^1] : 
	- trên lưới không cho phép hiển thị html mà là html mã hóa
- Store kaizen bị sql injection
- 0181520 Lộ thông tin ứng dụng
	- commit code: [Commit c1db3823: [Tung.Ly 20240702][0181520]: [Bảo mật] [Main] [Sprint 26/2024] Lộ thông tin ứng … - Microsoft Team Foundation Server](http://172.21.35.3:8080/tfs/HRMCollection/_git/HRM9/commit/c1db3823bafc561bfeb5b4377cf155a108473838)
	- 

![[Pasted image 20240625145009.png]]
![[Pasted image 20240625145018.png]]
lỗi xss trên lưới cho phép hiển thị html
![[Pasted image 20240625145323.png]]

[^1]: Link Xss : [Lỗi XSS - Google Sheets](https://docs.google.com/spreadsheets/d/17Fc7K8hFJJ1vqW6ZkN4NQWqJWRiWKPH-CPXUkhUEqN8/edit?gid=270755107#gid=270755107)