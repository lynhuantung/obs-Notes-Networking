---
date: 2024-06-21
tags:
  - "#sendmail"
Link CheckList: https://docs.vnresource.net/vi/CheckList-SendMail
---

### 1. Kiểm tra kết nối mạng và cấu hình DNS

- Đảm bảo rằng kết nối Internet của bạn hoạt động bình thường.
- Kiểm tra cấu hình DNS để đảm bảo rằng nó không bị sai. Bạn có thể sử dụng lệnh `nslookup` để kiểm tra DNS:
    
    `nslookup outlook.office365.com`
    

### 2. Ping và kiểm tra cổng

Để kiểm tra kết nối đến máy chủ Office 365 và xem các cổng cần thiết có mở không, bạn có thể sử dụng lệnh `ping` và `telnet`.

#### Ping Office 365

`ping outlook.office365.com`

#### Kiểm tra cổng SMTP (Port 587)

`telnet smtp.office365.com 587`

- Nếu kết nối thành công, màn hình sẽ hiển thị thông báo chào mừng từ máy chủ SMTP của Office 365.
- Nếu không kết nối được, có thể firewall hoặc ISP của bạn đang chặn cổng này.

#### Kiểm tra cổng SMTP (Port 587) dùng Test-NetConnection
```
Test-NetConnection -ComputerName smtp.office365.com -Port 587
```

- Các lệnh trên sẽ giúp bạn kiểm tra xem máy tính của bạn có thể kết nối với server SMTP của Office 365 hay không. Kết quả sẽ cho bạn biết trạng thái của kết nối, cũng như thông tin về thời gian trễ (latency) và địa chỉ IP của server đích.

![[Pasted image 20240622094929.png]]
### 3. Kiểm tra cài đặt email client

- Kiểm tra lại cấu hình email client (Outlook, Thunderbird, v.v.) để đảm bảo rằng bạn đã nhập đúng thông tin đăng nhập, máy chủ SMTP, và các cài đặt bảo mật (SSL/TLS).

### 4. Kiểm tra tài khoản Office 365

- Đăng nhập vào tài khoản Office 365 qua web (https://outlook.office365.com) để xác nhận rằng tài khoản của bạn vẫn hoạt động bình thường.
- Kiểm tra xem tài khoản của bạn có bị giới hạn gửi email không (ví dụ: do vượt quá hạn mức gửi mail trong ngày).

### 5. Kiểm tra firewall và antivirus

- Đảm bảo rằng firewall và antivirus trên máy tính của bạn không chặn kết nối đến máy chủ Office 365.
- Bạn có thể thử tạm thời vô hiệu hóa firewall và antivirus để kiểm tra.

### 6. Kiểm tra nhật ký lỗi (log)

- Kiểm tra nhật ký lỗi của email client để xem có thông báo lỗi cụ thể nào không. Các thông báo này thường sẽ giúp bạn xác định nguyên nhân cụ thể.

### 7. Liên hệ với hỗ trợ kỹ thuật

- Nếu sau khi thực hiện các bước trên mà vẫn không gửi được mail, bạn nên liên hệ với bộ phận hỗ trợ kỹ thuật của Microsoft hoặc quản trị viên IT của công ty để được hỗ trợ thêm.

### 8. Cập nhật window server
![[Pasted image 20240621133507.png]]
- Việc chưa cập nhật hệ điều hành Windows Server có thể ảnh hưởng đến khả năng gửi mail từ Office 365 nếu các bản cập nhật đó chứa các bản sửa lỗi liên quan đến bảo mật hoặc tính năng mạng. Các bản cập nhật thường bao gồm:

- **Cập nhật bảo mật**: Giúp bảo vệ hệ thống khỏi các lỗ hổng có thể bị khai thác bởi các phần mềm độc hại hoặc các cuộc tấn công.
- **Cải thiện hiệu suất và tính ổn định**: Giúp hệ thống hoạt động mượt mà hơn và tránh các lỗi không mong muốn.
- **Sửa lỗi và nâng cấp tính năng**: Đảm bảo rằng các tính năng hiện tại hoạt động đúng cách và thêm các tính năng mới.

Để đảm bảo rằng hệ thống của bạn hoạt động tối ưu và tránh gặp các vấn đề khi sử dụng dịch vụ email, bạn nên:

1. **Cập nhật hệ điều hành**: Tiến hành cài đặt tất cả các bản cập nhật đang chờ như trong hình bạn đã cung cấp. Điều này có thể giúp khắc phục các sự cố hiện tại liên quan đến việc gửi email.
    
2. **Khởi động lại máy chủ**: Sau khi cập nhật, hãy khởi động lại máy chủ để đảm bảo rằng tất cả các bản cập nhật được áp dụng chính xác.


### 9. Kiểm tra kết nối và xác thực kết nối email ([testconnectivity](https://testconnectivity.microsoft.com/tests/O365InboundSmtp/input))
- Trang web testconnectivity là một công cụ hữu ích được cung cấp bởi Microsoft để kiểm tra và xác thực kết nối email. Công cụ này thường được sử dụng để kiểm tra khả năng kết nối và khắc phục sự cố liên quan đến Microsoft Exchange, Office 365, và các dịch vụ email khác.

- Khi bạn truy cập vào trang này, bạn sẽ thấy một số tùy chọn để kiểm tra:

	- Office 365: Kiểm tra và xác thực các dịch vụ của Office 365.
	- Microsoft Exchange: Kiểm tra kết nối đến Microsoft Exchange Server.
	- Internet Email Tests: Kiểm tra các kết nối email chuẩn, như POP3, IMAP, và SMTP.
	- Mail Flow Diagnostic: Phân tích dòng thư và tìm hiểu nguyên nhân gây ra sự cố.
- Bước 1: vào trang https://testconnectivity.microsoft.com/tests/O365InboundSmtp/input
	- Nhập thông tin cần thiết: Cung cấp thông tin đăng nhập và các chi tiết cần thiết để công cụ thực hiện kiểm tra
![[Pasted image 20240622102233.png]]
- Bước 2: thực hiện kiểm tra
	- Sau khi kiểm tra xong, bạn sẽ nhận được báo cáo chi tiết về tình trạng kết nối và bất kỳ sự cố nào đã được phát hiện.
![[Pasted image 20240622102242.png]]





