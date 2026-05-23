---
Mã:
aliases:
date: 2026-03-05
tags:
  - daily
  - "#firewall"
  - "#hatang"
Project:
---
WAF là viết tắt của **Web Application Firewall**. Đây là một lớp **tường lửa bảo mật chuyên dành cho ứng dụng web**, đặt giữa **người dùng và server** để kiểm tra và chặn các request nguy hiểm trước khi chúng tới ứng dụng.

Hiểu đơn giản, WAF giống như **người bảo vệ đứng trước cửa hệ thống web**. Mọi request từ browser hoặc API đều phải đi qua WAF trước. Nếu request bị nghi là tấn công thì WAF sẽ **chặn ngay lập tức**.

---

## 1. Vị trí của WAF trong hệ thống

Trong một hệ thống web thông thường, luồng request sẽ như sau:

|Thứ tự|Thành phần|Vai trò|
|---|---|---|
|1|Client (Browser / App)|Người dùng gửi request|
|2|WAF|Kiểm tra request có nguy hiểm không|
|3|Load Balancer / Reverse Proxy|phân phối request|
|4|Web Server (IIS / Nginx)|xử lý web|
|5|API / Application|logic hệ thống|
|6|Database|lưu dữ liệu|

Luồng request (WAF : web application Firewall - tường lửa dành cho ứng dụng web):

```
User → WAF → Load Balancer → Web Server → API → Database
```

Nếu WAF thấy request có dấu hiệu tấn công thì sẽ:

```
User → WAF ❌ (block)
```

Request **không bao giờ tới API**.

---

## 2. WAF bảo vệ hệ thống khỏi những gì?

WAF thường dựa trên bộ rule như **OWASP Core Rule Set** để phát hiện tấn công web phổ biến.

|Loại tấn công|Ví dụ|
|---|---|
|SQL Injection|`' OR 1=1`|
|Cross Site Scripting (XSS)|`<script>alert(1)</script>`|
|File upload exploit|upload `.php`|
|Command injection|`; rm -rf`|
|Path traversal|`../../etc/passwd`|
|Bad bot / scanner|crawler quét lỗ hổng|

Ví dụ request nguy hiểm:

```
POST /login
username=admin' OR 1=1
```

WAF sẽ nhận diện pattern SQL Injection và block.

---

## 3. Các chế độ hoạt động của WAF

|Mode|Ý nghĩa|
|---|---|
|Detect / Monitor|chỉ log, không chặn|
|Block / Prevention|phát hiện là chặn ngay|
|Learning|tự học hành vi|

Hệ thống của bạn đang ở:

```
Block mode
```

Nghĩa là rule match → **block request ngay**.

---

## 4. Vì sao upload file thường bị WAF chặn?

Upload file là request **multipart/form-data**, payload lớn nên rất dễ trùng signature.

Ví dụ WAF thấy:

```
Content-Disposition: form-data
filename="test<script>.txt"
```

hoặc

```
<script>
```

→ WAF hiểu là **XSS payload** → block.

---

## 5. Một số WAF phổ biến

|WAF|Hệ thống|
|---|---|
|ModSecurity|Nginx / Apache|
|AWS WAF|AWS|
|Cloudflare WAF|Cloudflare|
|Azure WAF|Azure|
|F5 BIG-IP ASM|Enterprise|
|Imperva|Enterprise|

Nhiều hệ thống Kubernetes / cloud đều dùng WAF ở tầng gateway.

---

## 6. Dấu hiệu nhận biết bị WAF chặn

Nếu gặp các dấu hiệu sau thì gần như là WAF:

- API **không có log**
    
- trả về **403 / 406 / 502**
    
- request **không vào được backend**
    
- lỗi xuất hiện ngay khi upload
    

---

## 7. Ví dụ thực tế

User upload file:

```
POST /api/upload
```

File:

```
test<script>.txt
```

WAF rule:

```
941100 XSS Attack Detected
```

WAF trả về:

```
403 Forbidden
```

API **không nhận được request**.

---

## 8. Kết luận

WAF là:

- **tường lửa dành cho ứng dụng web**
    
- kiểm tra request HTTP/HTTPS
    
- chặn tấn công trước khi tới server
    
- hoạt động dựa trên rule bảo mật
    

Trong trường hợp của bạn:

```
Upload file → request match rule WAF → WAF block
```

nên phải nhờ **hạ tầng kiểm tra rule ID hoặc whitelist endpoint upload**.

