---
Mã: 25010318-01
aliases: 
date: 2025-01-18
time: 10:14
Week: "03"
tags:
  - daily
  - "#sso"
Project:
  - "[[Dự án HongNgoc]]"
---
# Hướng Dẫn Cấu Hình Chuyển Hướng Tự Động Giữa Portal HongNgoc Cũ và Mới

## 1. Hiện Trạng

Hiện tại, hệ thống có hai cổng thông tin (portal):

- **Portal HongNgoc cũ**: Phiên bản **8.9.16**
- **Portal HongNgoc mới**: Phiên bản **8.12.46**

## 2. Mong Muốn

- Khi người dùng đăng nhập vào **portal HongNgoc cũ** và truy cập một đường dẫn cụ thể (_1link chỉ định_), hệ thống sẽ tự động **chuyển hướng** sang **portal HongNgoc mới**.
- Việc chuyển hướng này đảm bảo **đăng nhập tự động** vào **portal HongNgoc mới** mà không yêu cầu nhập lại thông tin.

## 3. Điều Kiện

- Khi truy cập **1link cụ thể** trong **portal cũ**, hệ thống phải tự động đăng nhập vào **portal mới**.

---

## 4. Cấu Hình Portal HongNgoc Cũ (Phiên bản 8.9.16)

### 4.1. Cấu Hình **web.config**

#### 4.1.1. Thiết Lập Session

```xml
<sessionState cookieName="Session.Portal.HongNgoc" cookieSameSite="Lax" timeout="240" />
```

**Ý nghĩa:**

- **`cookieName="Session.Portal.HongNgoc"`**: Đặt tên cookie riêng cho **portal HongNgoc cũ**.  Dùng để tránh bị mất session khi chuyển hướng sang portal mới.
- Nếu cả hai portal sử dụng chung tên cookie (`Session.Portal`), quá trình **đăng xuất** sẽ tạo một session ID mới, dẫn đến mất thông tin phiên đăng nhập.

#### 4.1.2. Thiết Lập Chuyển Hướng Đến Portal Mới

```xml
<add key="Hrm_Main_Web_SSO" value="https://tl-portal.vnrlocal.com/New_Login/New_Index" />
```

**Ý nghĩa:**

- **`Hrm_Main_Web_SSO`**: URL trang đăng nhập của **portal HongNgoc mới**.
- Khi người dùng truy cập **1link cụ thể**, hệ thống sẽ **chuyển hướng** đến URL này kèm theo **JWT** để đăng nhập tự động.

#### 4.1.3. Cấu Hình Link Đích Sau Khi Đăng Nhập

```xml
<add key="Hrm_Main_Web_SSO_Return" value="" />
```

**Ý nghĩa:**

- **`Hrm_Main_Web_SSO_Return`**: Địa chỉ URL của **trang cụ thể** trong portal mới mà người dùng sẽ được chuyển hướng đến sau khi đăng nhập thành công.

#### 4.1.4. Cấu Hình Mã Hóa JWT

```xml
<add key="SSO_SecretKey" value="HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095" />
```

**Ý nghĩa:**

- **`SSO_SecretKey`**: Khóa bí mật để **mã hóa JWT**, giúp bảo vệ tính bảo mật của quá trình xác thực khi chuyển hướng đến portal mới.

---

## 5. Cấu Hình Portal HongNgoc Mới (Phiên bản 8.12.46)

### 5.1. Cho Phép Chuyển Hướng Từ Portal Cũ

Trong file cấu hình, cần thiết lập **AllowOrigin** để cho phép portal cũ chuyển hướng đến portal mới.

```json
"AllowOrigin": "http://172.21.30.43:1051;http://172.21.30.43:1052;http://172.21.30.43:1036"
```

**Ý nghĩa:**

- **Danh sách các URL được phép chuyển hướng** đến portal mới:
    - `http://172.21.30.43:1036` (Portal HongNgoc cũ - phiên bản 8.9.16). 

### 5.2. Thiết Lập Khóa Bí Mật Để Giải Mã JWT

```json
"SSO_SecretKey": "HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095"
```

**Ý nghĩa:**

- **Cùng giá trị `SSO_SecretKey`** như portal cũ.
- Dùng để **giải mã JWT** khi nhận token đăng nhập từ portal cũ.

---
## 6. Webconfig và WebSetting mẫu
### Web.config : dùng cho link portal cũ
![[Pasted image 20250118102956.png]]

### WebSetting.json : dùng cho link portal mới
![[Pasted image 20250118103034.png]]
---
## 7. Kết Luận

Với cấu hình trên:

- Khi người dùng **truy cập 1link trong portal cũ**, hệ thống sẽ **tự động redirect** đến portal mới.
- Sử dụng **JWT token** để **đăng nhập tự động**, đảm bảo tính bảo mật và tiện lợi.
- **Portal mới có cơ chế xác thực JWT**, cho phép người dùng vào ngay mà không cần nhập lại thông tin đăng nhập.

Nếu có bất kỳ vấn đề gì khi triển khai, hãy kiểm tra lại **cấu hình AllowOrigin**, **SSO_SecretKey**, và **JWT token** để đảm bảo hoạt động đúng.