---
Mã: 25031326-01
aliases:
date: 2025-03-26
time: 15:49
Week: "13"
tags:
  - daily
Link:
  - "[[SSO - DotNet core]]"
---


## 📌 MỤC TIÊU CUỘC HỌP

- Thống nhất quy trình tích hợp SSO giữa hệ thống HRM và ứng dụng bên thứ ba.
- Làm rõ vai trò giữa phía VnResource và bên tích hợp.
- Xác định các bước kỹ thuật cần triển khai và thông tin cần trao đổi.

---

## 1. 📋 ĐĂNG KÝ ỨNG DỤNG

- **Phía tích hợp cần liên hệ VnResource** để được cấp:
    - `ClientId`, `ClientSecret`, `RedirectUri`, `Scopes`, ...
- VnResource sẽ cấu hình hệ thống cho phép ứng dụng bên thứ ba thực hiện xác thực SSO.

---

## 2. 🔐 THÔNG TIN XÁC THỰC (OIDC)

Các thông tin bắt buộc để tích hợp:

|Thông tin|Bắt buộc|Ghi chú|
|---|---|---|
|Issuer|✅|URL Identity của VNR|
|ClientId|✅|Cung cấp bởi VNR|
|ClientSecret|✅|Bảo mật kỹ lưỡng|
|Scopes|✅|Xác định quyền truy cập|
|GrantType|✅|Thường là `authorization_code`|
|RedirectUri|✅|URL callback sau khi xác thực|
|PKCE|✅|Tăng tính bảo mật|

Ví dụ URL xác thực:

```
https://{issuer}/authorize?response_type=code&code_challenge={...}&...&redirect_uri={...}
```

---

## 3. 🔁 QUY TRÌNH XÁC THỰC SSO

### 3.1 Phía HRM (VnResource)

1. **Tạo ứng dụng:** Cấu hình các thông tin cho bên tích hợp.
2. **Xác thực người dùng:** Kiểm tra trạng thái đăng nhập và chuyển hướng nếu cần.
3. **Ghi log xác thực:** Lưu log trong vòng 30 ngày.

### 3.2 Phía tích hợp (bên thứ ba)

|Bước|Mô tả|
|---|---|
|1|Sử dụng thông tin do VnR cấp để khởi tạo xác thực|
|2|Tự sinh `code_challenge`, `code_verifier`, `state`|
|3|Tạo nút "Login with VnResource"|
|4|Nhận mã xác thực và đổi lấy access token|
|5|(Tùy chọn) Auto login bằng redirect mặc định|
|6|(Tùy chọn) Dùng refresh token để lấy access token mới|

---

## 4. 🌐 CÁC ENDPOINT QUAN TRỌNG

|Endpoint|Chức năng|
|---|---|
|`/connect/authorize`|Khởi tạo xác thực|
|`/connect/token`|Lấy access token|
|`/connect/userinfo`|Lấy thông tin người dùng|
|`/connect/endsession`|Kết thúc phiên làm việc|
|`/connect/introspect`|Kiểm tra token|
|`/connect/deviceauthorization`|Xác thực thiết bị|

---


## ✅ KẾT LUẬN & HÀNH ĐỘNG TIẾP THEO

- ✅ Phía tích hợp cần gửi yêu cầu lấy thông tin ClientId, Secret.
- ✅ VnR hỗ trợ khởi tạo và cung cấp hướng dẫn endpoint.
- ✅ Hai bên test thử với `Authorization Code Flow with PKCE`.
