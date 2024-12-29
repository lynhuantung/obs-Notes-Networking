---
aliases: 
date: 2024-09-04
tags:
  - daily
---
### Hỗ trợ 
---
- Hỗ trợ sinh người dùng tự động cho dự án Fit (6 tiếng)****
> [!NOTE] Giải trình nguyên nhân tự sinh người dùng
> **Vấn đề**: dữ liệu người dùng tự sinh 
> 
> **Hiện trạng**:
> - Khi người dùng đăng nhập bằng tài khoản Microsoft hoặc Identity, hệ thống sẽ kiểm tra trong cơ sở dữ liệu bảng người dùng. Nếu tài khoản người dùng chưa tồn tại, hệ thống sẽ tự động tạo mới tài khoản này.
> 
> **Nguyên nhân**:
> - Trước đây, khi người dùng đăng nhập bằng tài khoản Microsoft, hệ thống đã gặp lỗi 403 vì tài khoản chưa tồn tại trong cơ sở dữ liệu. Để khắc phục lỗi này, hệ thống đã được điều chỉnh để tự động tạo tài khoản mới khi người dùng đăng nhập bằng Microsoft hoặc Identity.
> 
> **Giải pháp**:
> - Loại bỏ tính năng tự động tạo tài khoản mới khi người dùng đăng nhập bằng Identity hoặc tài khoản Microsoft.
> - Sửa store : hrm_sys_sp_get_users_auth_byUserLogin
- Hỗ trợ kiểm tra xuất hợp đồng không có template dự án  Thaco
- 
### Team
---
- Chấm KPI team 20 phút
- Cập nhật Jira 30 phút
- 

