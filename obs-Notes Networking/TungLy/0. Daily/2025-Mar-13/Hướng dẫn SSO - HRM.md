---
Mã: "25031326-01"
aliases: 
date: "2025-03-26"
time: "15:54"
Week: "13"
tags:
  - daily
---

##  CHỦ ĐỀ HỌP: TÍCH HỢP SSO VỚI HỆ THỐNG HRM – VNRESOURCE

---

### I. MỤC TIÊU

- Hiểu rõ kiến trúc và luồng xác thực SSO.
- Thống nhất các thông tin cần cung cấp giữa hai bên (VnResource và đối tác tích hợp).
- Làm rõ vai trò các endpoint và cách sử dụng từng loại grant type.

---

### II.  THÔNG TIN CẦN THIẾT KHI TÍCH HỢP

|Trường thông tin|Bắt buộc|Ghi chú|
|---|---|---|
|Issuer|✅|URL Identity VnResource|
|ClientId|✅|Cung cấp bởi VnR|
|ClientSecret|✅|Bảo mật tuyệt đối|
|RedirectUri|✅|URL callback sau xác thực|
|Scopes|✅|VD: `openid`, `email`, `profile`, `api1`|
|GrantType|✅|`authorization_code` (chính), có thể có `password`, `client_credentials`,...|
|PKCE|✅|Bảo mật luồng `authorization_code`|
|State & Nonce|✅|Tránh CSRF và replay attack|

---

### III.  LUỒNG CHÍNH: Authorization Code Flow with PKCE

1. **Client redirect người dùng đến**:
    
    ```
    GET /connect/authorize
    ```
    
2. **Người dùng đăng nhập**, nhận `authorization_code`.
    
3. **Client trao đổi code để lấy token tại**:
    
    ```
    POST /connect/token
    ```
    
4. **Gọi API hoặc lấy thông tin người dùng qua**:
    
    ```
    GET /connect/userinfo
    ```
    
5. **(Tuỳ chọn) Refresh token hoặc đăng xuất qua**:
    
    - `/connect/token` (với `grant_type=refresh_token`)
    - `/connect/endsession`

---

### IV.  CÁC ENDPOINT QUAN TRỌNG

|Mục đích|Endpoint|
|---|---|
|Lấy metadata cấu hình|`/.well-known/openid-configuration`|
|Xác thực & nhận code|`/connect/authorize`|
|Lấy token|`/connect/token`|
|Lấy thông tin user|`/connect/userinfo`|
|Đăng xuất|`/connect/endsession`|
|Kiểm tra token|`/connect/introspect`|
|Hủy token|`/connect/revocation`|
|Xác thực thiết bị|`/connect/deviceauthorization`|

---

### V. TÌNH HUỐNG TRIỂN KHAI & GỢI Ý

- Nếu tích hợp Web App: dùng **Authorization Code Flow with PKCE**.
- Nếu là Backend-to-Backend (không có user): dùng **Client Credentials Flow**.
- Nếu xác thực với username/password trực tiếp (có rủi ro): dùng **Password Grant** (không khuyến khích).
- Nếu là thiết bị không có trình duyệt (TV, kiosk): dùng **Device Authorization Flow**.

---

### VI.  KẾT LUẬN & HÀNH ĐỘNG

|Việc cần làm|Trách nhiệm|
|---|---|
|Cung cấp `ClientId`, `Secret`, `RedirectUri`, Scopes|VnResource|
|Thiết lập các bước xác thực theo flow|Bên tích hợp|
|Test xác thực & xử lý lỗi|Cả hai bên|
|Ghi log xác thực (lưu 30 ngày)|VnResource|

