---
Mã: 25093713-01
aliases:
date: 2025-09-13
time: 11:04
Week: "37"
tags:
  - daily
  - security
  - sonar
  - ETL-TOS
  - vcbs-project
---
---


# 🛡️ Bảng kiểm fix bảo mật HRM

> Ghi chú: Tài liệu này dùng trong Obsidian để theo dõi các hạng mục fix bảo mật, tình trạng và kiểm thử đi kèm.

## Tổng quan

- Chủ đề: Security hardening + xử lý cảnh báo Sonar
    
- Môi trường áp dụng: HRM Portal/API, tích hợp nội bộ và bên ngoài
    
- Chủ sở hữu: @Tùng
    

---

## Bảng tổng hợp

|Mục|Cách fix|Ảnh hưởng|
|---|---|---|
|Change this code to use a stronger protocol.|Giữ lại TLS1.2, **xóa** TLS1.0, TLS1.1, SSL|Test gửi mail và HTTPS với TLS1.2 (Hạc đã xác nhận khách hàng đang dùng TLS1.2)|
|Content Security Policies should be restrictive to mitigate the risk of content injection attacks.|Hệ thống đã xử lý, chỉ cần cấu hình lại trong **webSetting** chỉ chấp nhận nguồn tin cậy (nguồn từ hệ thống hoặc Google…)|Không ảnh hưởng|
|Enable server certificate validation on this SSL/TLS connection.|**Trước khi sửa:** Bỏ qua kiểm thực chứng chỉ (chấp nhận tất cả). **Sau khi sửa:** Chỉ cho phép truy cập khi chứng chỉ hợp lệ (gồm API nội bộ và API bên ngoài).|Giao tiếp API nội bộ ⇒ bắt buộc **HTTPS** có chứng chỉ hợp lệ (HRM đã test). Giao tiếp API với bên ngoài ⇒ bắt buộc chứng chỉ hợp lệ, cần AVN dùng **HTTPS** cho mọi URL tích hợp.|
|Make sure this Azure Storage Account Key gets revoked, changed, and removed from the code.|Xóa code liên quan đến **secret key** Azure đã comment trong source|Không ảnh hưởng (Sonar scan cả dòng comment)|
|Make sure this database password gets changed and removed from the code.|Làm rối mã/ẩn chuỗi, tránh lộ trực tiếp chuỗi kết nối SQL (đa phần liên quan máy chấm công)|Có hardcode trong source, đánh giá **không ảnh hưởng**. Nếu cần, test kết nối máy chấm công.|
|Make sure this service account key gets revoked, changed, and removed from the code.|Mật khẩu & secret key trong **websetting/appsetting** đã **mã hóa** ⇒ đã yêu cầu **Sonar bypass**|Không ảnh hưởng|
|Use at least 100,000 iterations and a state-of-the-art digest algorithm here.|Cơ chế mã hiện tại mặc định; Sonar yêu cầu ≥100k iterations. Thay đổi sẽ ảnh hưởng dữ liệu mã hóa & performance ⇒ **giữ nguyên**, **Sonar đã đồng ý bypass**|Không ảnh hưởng|
|Use secure mode and padding scheme.|Liên quan mã hóa chat. SE đã **unit test**, kết quả trước/sau **như nhau**|Test nhắn tin chat trong portal xem có bất thường không|

---

## Theo dõi & kiểm thử chi tiết

### 1) TLS

-  Disable TLS 1.0/1.1/SSL tại OS/IIS/Registry/SchUseStrongCrypto
    
-  Verify SMTP/TLS1.2 (gửi mail)
    
-  Verify HTTPS/TLS1.2 với các endpoint chính
    
-  Ghi lại server list đã áp dụng
    

### 2) CSP

-  Rà soát nguồn: script-src, style-src, img-src, connect-src
    
-  Cấu hình whitelist: hệ thống nội bộ, Google (nếu dùng), bỏ `*`
    
-  Bật `upgrade-insecure-requests` nếu phù hợp
    
-  Kiểm thử trang chủ, các module động (Grid/Upload/Kendo)
    

### 3) Certificate Validation

-  Gỡ bỏ code bypass `ServerCertificateValidationCallback`
    
-  Kiểm thử API nội bộ (HTTPS, cert hợp lệ)
    
-  Kiểm thử API bên ngoài (yêu cầu đối tác dùng HTTPS hợp lệ)
    
-  Danh sách URL tích hợp cần chuyển HTTPS (làm việc với AVN)
    

### 4) Secrets trong code

-  Tìm & xóa hardcode keys **(kể cả dòng comment)**
    
-  Đưa secrets vào vault/biến môi trường/config mã hóa
    
-  Kiểm thử build/release không lộ secrets (Sonar/DevOps)
    

### 5) Chuỗi kết nối DB/máy chấm công

-  Ẩn/obfuscate connection string trong code
    
-  Kiểm thử kết nối máy chấm công thực tế
    
-  Lộ trình chuyển dần sang cấu hình an toàn (nếu có)
    

### 6) Thuật toán băm/iterations

-  Ghi nhận Sonar bypass đã được chấp thuận
    
-  Theo dõi hiệu năng nếu sau này nâng iterations
    

### 7) Mã hóa chat (mode & padding)

-  Đối chiếu thuật toán, mode, padding
    
-  Unit test & regression test chat
    
-  Theo dõi log bất thường sau triển khai
    
