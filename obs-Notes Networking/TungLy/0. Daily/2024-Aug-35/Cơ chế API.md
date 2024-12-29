---
aliases: 
date: 2024-08-27
tags:
  - daily
---

## Cơ chế lấy token
---
1. **Cơ chế dùng username và password:**
- Người dùng gửi username và password để xác thực.
- Nếu xác thực thành công, hệ thống sinh ra một access token và một refresh token.
- Access token này có thời hạn sử dụng ngắn (15 phút) và được dùng để truy cập các tài nguyên bảo mật.
- Refresh token có thời hạn dài hơn (12 tiếng) và dùng để lấy một access token mới khi access token hết hạn mà không cần xác thực lại bằng username và password.

2. **Cơ chế dùng refresh token:**
- Khi access token hết hạn, người dùng gửi refresh token để lấy một access token mới mà không cần nhập lại username và password.
- Hệ thống sinh ra một access token mới và có thể cấp lại một refresh token mới để thay thế token cũ, đảm bảo tính bảo mật và tiếp tục phiên làm việc của người dùng.

3. **Về thời gian hết hạn:**
- Token có thời hạn 15 phút
- Refresh token có thời hạn 12 tiếng. Vì thế khi hết token thì có thể dùng refresh token để lấy lại token.

**Lưu ý**: khi sinh ra token thì lưu trữ lại refresh token ở 1 nơi để phục vụ cho lần lấy token sau .

Trong trường hợp mất refresh token thì có thể đăng nhập vào link api để tiến hành lấy refresh token

![[Pasted image 20240827171113.png]]

![[Pasted image 20240827171127.png]]
![[Pasted image 20240827171155.png]]


## Quy trình lấy token và quản lý phiên làm việc với API
---
**Bước 1: Gọi API bằng Access Token**
- Người dùng đăng nhập và nhận được access token và refresh token.
- Access token được dùng để gọi API.  

**Bước 2: Access Token hết hạn sau 15 phút**
- Sau 15 phút, access token hết hạn.
- Nếu gọi API với access token hết hạn, máy chủ trả về mã 401 Unauthorized.

**Bước 3: Lấy Access Token mới bằng Refresh Token**
- Khi nhận mã 401, ứng dụng dùng refresh token để yêu cầu access token mới.
- Nếu refresh token còn hạn (12 tiếng), hệ thống cấp lại access token và có thể là refresh token mới.

**Bước 4: Tiếp tục gọi API**
- Dùng access token mới để gọi API.
- Quá trình này lặp lại, không cần gia hạn thủ công.  

**Lợi ích của cơ chế này:**
- Access token có thời hạn ngắn giúp giảm thiểu rủi ro bảo mật nếu token bị lộ.
- Refresh token có thời hạn dài hơn, cho phép người dùng duy trì phiên làm việc mà không cần đăng nhập lại liên tục.
- Quy trình này giúp duy trì trải nghiệm người dùng mượt mà và liên tục, đồng thời tăng cường bảo mật cho hệ thống.