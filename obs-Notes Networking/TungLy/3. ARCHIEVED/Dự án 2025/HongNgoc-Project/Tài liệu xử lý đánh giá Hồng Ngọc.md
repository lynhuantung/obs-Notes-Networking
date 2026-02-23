---
Mã: "25010314-01"
aliases: 
date: "2025-01-14"
time: "14:55"
Week: "03"
tags:
  - daily
---
### Chức năng: Tự động đăng nhập vào trang đánh giá mới khi trang đánh giá cũ đã được đăng nhập

#### 1. Cấu hình **web.config** trong source đánh giá cũ (HONGNGOC_v8.9.16.01.07):

- Thêm các cấu hình sau vào file `web.config`:
    
    ```xml
    <add key="Hrm_Main_Web_SSO" value="https://tl-main.vnrlocal.com/Home/Login" />
    <add key="SSO_SecretKey" value="HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095" />
    ```
    
    - **Hrm_Main_Web_SSO**: Đường dẫn đến trang đăng nhập của hệ thống đánh giá mới.
    - **SSO_SecretKey**: Khóa bí mật dùng để tạo token JWT phục vụ cho việc xác thực.

#### 2. Cấu hình **web.config** trong source đánh giá mới (HONGNGOC_v8.12.46.01.08):

- Thêm cấu hình sau vào file `web.config`:
    
    ```xml
    <add key="SSO_SecretKey" value="HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095" />
    ```
    
    - **SSO_SecretKey**: Khóa bí mật để xác thực token JWT (giá trị này phải trùng khớp với khóa được cấu hình trong source HONGNGOC_v8.9.16.01.07).

#### 3. Quy trình thực hiện:

- Truy cập: **Trang chủ > Đánh giá > Tổng hợp dữ liệu để đánh giá**.
- Nhấn vào nút **Đánh giá mới**:
    - Khi nhấn, hệ thống sẽ chuyển hướng đến trang đánh giá mới.
    ![[Pasted image 20250114150222.png]]
    - Token JWT sẽ được gửi kèm để xác thực.
    - Người dùng sẽ được tự động đăng nhập vào hệ thống đánh giá mới mà không cần nhập lại thông tin.
