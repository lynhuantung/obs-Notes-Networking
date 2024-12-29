---
Mã cuộc họp: H-TERUMO-SYS-181224
aliases: 
title: Biên bản họp màn hình người dùng
tags:
  - "#meeting"
date: 2024-12-17
members:
  - tungly
  - tienle
  - linhtran
  - ngannguyen
Related: "[[0.Meeting]]"
Link: 
Project:
  - Terumo
---
## Họp tìm giải pháp bỏ bắt buộc nhân viên  - Dự án Terumo
## Biên bản họp : 18/12/2024
- Mã cuộc họp: H-TERUMO-SYS-181224
- **Người tham gia**: TungLy, LinhTran, TienLe, NganNguyen
- Thông tin thêm 
![[Pasted image 20241218092533.png]]

# Tóm tắt
--- 
1. Hệ thống V3 yêu cầu liên kết nhân viên khi tạo người dùng cho main và portal, dẫn đến tình trạng user portal có thể nhìn thấy dữ liệu đăng ký hộ từ main.
2. **Yêu cầu của khách hàng:** Chỉ cho phép user portal nhìn thấy dữ liệu của họ, ẩn dữ liệu đăng ký hộ trên main.
3. **Đề xuất giải pháp:** Tách biệt user main và user portal, quản lý quyền hạn để user main không cần chọn nhân viên khi tạo user.
4. **Action tiếp theo:** Phân tích kỹ thuật tách biệt user (1 ngày), thiết kế quyền trên main (1 ngày).
 
## Mục tiêu:
---
- Đảm bảo **user portal** chỉ nhìn thấy dữ liệu đăng ký của **bản thân**.
- Loại bỏ tình trạng user portal nhìn thấy dữ liệu **đăng ký hộ trên main** không cần thiết.
- Tách biệt rõ vai trò và quyền hạn của **user main** và **user portal** để tránh nhầm lẫn.

## 📝Các ý chính  
---
#### **Hiện trạng**

- **Hệ thống V3** yêu cầu gắn nhân viên khi tạo user cho main và portal.
- Hiện tại có 3 loại user:
    1. **User dùng cả main và portal**
    2. **User portal**
    3. **User đăng ký hộ trên main và dùng portal**
- **Ảnh hưởng**: User portal đang nhìn thấy dữ liệu đăng ký hộ từ main, gây nhầm lẫn.

#### **Yêu cầu của khách hàng**

- **User portal** chỉ thấy dữ liệu đăng ký của **bản thân**.
- Dữ liệu đăng ký hộ trên **main** không được hiển thị trên portal.

#### **Đề xuất giải pháp PE**

1. **Tách biệt user main và user portal**:
    - Tạo 2 user riêng biệt cho từng hệ thống.
2. **Quản lý quyền hạn**:
    - **User main**: Không cần chọn nhân viên khi tạo user.
    - **User portal**: Vẫn cần chọn nhân viên để đảm bảo phân quyền đúng như hiện tại.

## Action tiếp theo:
---
 1. Phân tích kỹ thuật tách biệt user (dev) : 1 ngày
 2. Thiết kế quyền trên web main (PE): 1 ngày
 




### Liên kết:
---


