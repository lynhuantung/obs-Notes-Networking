---
aliases: 
date: 2024-12-02
tags:
  - "#Area"
  - "#sso"
  - "#okta"
  - "#openid"
Related: "[[Okta link login]]"
---
# Hướng dẫn Đăng Nhập SSO với Okta

## 1. Giới thiệu
Single Sign-On (SSO) là phương thức xác thực cho phép người dùng đăng nhập một lần để truy cập vào nhiều ứng dụng mà không cần đăng nhập lại. Okta là một nền tảng quản lý nhận dạng hỗ trợ SSO mạnh mẽ, tích hợp dễ dàng với các ứng dụng web và di động.

## 2. Cách thức hoạt động của Okta SSO

### 2.1. Kiến trúc SSO
Okta SSO dựa trên các giao thức xác thực phổ biến như:
- **SAML 2.0** (Security Assertion Markup Language)
- **OIDC (OpenID Connect)**
- **OAuth 2.0**

Dữ liệu xác thực và quyền truy cập sẽ được gửi qua các kênh an toàn giữa Okta và ứng dụng tích hợp.

### 2.2. Quy trình đăng nhập
1. Người dùng truy cập ứng dụng (SP - Service Provider).
2. Ứng dụng chuyển hướng người dùng tới Okta để xác thực.
3. Người dùng nhập thông tin đăng nhập tại Okta (IdP - Identity Provider).
4. Sau khi xác thực thành công, Okta chuyển hướng lại ứng dụng với một mã thông báo (Token).
5. Ứng dụng sử dụng mã thông báo này để cấp quyền truy cập.

## 3. Thiết lập Okta SSO

### 3.1. Tạo ứng dụng trong Okta
1. **Đăng nhập vào Okta Admin Console**: Truy cập [Okta Admin Console](https://admin.okta.com) với tài khoản quản trị.
2. **Thêm ứng dụng**:
   - Vào menu **Applications** > **Applications**.
   - Nhấp **Create App Integration**.
   - Chọn loại ứng dụng (OIDC/SAML) và nhấp **Next**.
3. **Cấu hình ứng dụng**:
   - Điền thông tin ứng dụng:
     - **App name**: Tên ứng dụng.
     - **Login redirect URIs**: URL mà người dùng sẽ được chuyển hướng sau khi đăng nhập.
     - **Logout redirect URIs**: URL khi người dùng đăng xuất.
   - Nhấp **Save** để hoàn tất.

### 3.2. Cấu hình ứng dụng bên thứ ba
Kết nối ứng dụng với Okta bằng cách nhập thông tin cần thiết như:
- Client ID
- Client Secret
- Issuer URL (https://<okta_domain>/oauth2/default)
- Redirect URI


## 4. Đăng nhập SSO

### 4.1. Đăng nhập qua giao diện người dùng
1. Người dùng truy cập ứng dụng và nhấp nút "Đăng nhập với Okta".
2. Hệ thống chuyển hướng đến trang đăng nhập Okta.
3. Người dùng nhập thông tin tài khoản Okta và nhấn **Login**.
4. Nếu xác thực thành công, người dùng được chuyển hướng trở lại ứng dụng.

### 4.2. Đăng nhập qua API
- Gửi yêu cầu xác thực tới Okta API:
```http
POST https://<okta_domain>/oauth2/default/v1/token
Headers: {
   "Content-Type": "application/x-www-form-urlencoded"
}
Body: {
   "grant_type": "password",
   "client_id": "<client_id>",
   "client_secret": "<client_secret>",
   "username": "<username>",
   "password": "<password>",
   "scope": "openid profile email"
}
```
- Nhận về access token và sử dụng để truy cập ứng dụng.

## 5. Các vấn đề phổ biến

### 5.1. Không đăng nhập được
- Kiểm tra **Client ID** và **Client Secret** có đúng không.
- Xác minh **Redirect URI** được cấu hình chính xác trong Okta và ứng dụng.

### 5.2. Lỗi token
- Đảm bảo thời gian hệ thống chính xác (đồng bộ với NTP).
- Kiểm tra phạm vi (**Scope**) đã được cấp quyền trong cấu hình ứng dụng.

## 6. Bảo mật và kiểm soát truy cập
- **Multi-factor Authentication (MFA)**: Kích hoạt xác thực đa yếu tố để tăng cường bảo mật.
- **IP Whitelisting**: Hạn chế truy cập chỉ từ các địa chỉ IP đáng tin cậy.
- **Audit Logs**: Theo dõi nhật ký đăng nhập trong Okta Admin Console.

## 7. Tài liệu tham khảo
- [Okta Developer Documentation](https://developer.okta.com/)
- [Okta Admin Guide](https://support.okta.com/)





