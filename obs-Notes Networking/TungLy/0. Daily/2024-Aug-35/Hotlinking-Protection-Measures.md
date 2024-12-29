---
aliases: 
date: 2024-08-28
tags:
  - daily
---

### Bảo vệ chống Hotlinking là gì
---
**Hotlinking** là hành động sử dụng trực tiếp URL của tài nguyên (như hình ảnh, video, tệp) trên một trang web khác mà không lưu trữ bản sao trên máy chủ của mình. Điều này có nghĩa là mỗi khi tài nguyên được tải trên trang web của bên thứ ba, nó sẽ tiêu tốn băng thông từ máy chủ của bạn thay vì từ máy chủ của bên đó.

**Bảo vệ chống Hotlinking** là các biện pháp được triển khai để ngăn chặn việc người khác sử dụng tài nguyên của bạn mà không được phép. Điều này thường được thực hiện bằng cách cấu hình máy chủ web để từ chối các yêu cầu đến từ các trang web không phải của bạn.

Nếu yêu cầu không đến từ miền của bạn (`yourdomain.com`), máy chủ sẽ từ chối yêu cầu đó với mã phản hồi là 403 (Forbidden).
Để cho phép link ngoài chạy vào hệ thống thì cấu hình **"AllowOrigin"** trong webSetting.json.

#### Một số biện pháp bảo vệ khác:
- **Tokenized URLs:** Chỉ cung cấp URL chứa token hợp lệ mà chỉ trang của bạn có thể tạo.
- **Chuyển hướng yêu cầu không hợp lệ:** Chuyển hướng các yêu cầu hotlinking đến một hình ảnh khác, ví dụ, một thông báo cảnh báo.

Việc bảo vệ chống Hotlinking giúp bạn bảo vệ tài nguyên của mình, tránh bị lạm dụng băng thông không cần thiết và giảm chi phí máy chủ.


### Hỗ trợ
---
- Kiểm tra kết nối ldap [[Kiểm tra kết nối LDAP]] của dự án ACBH
- 

