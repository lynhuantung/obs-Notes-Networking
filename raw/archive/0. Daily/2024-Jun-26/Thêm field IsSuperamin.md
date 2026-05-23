---
aliases: 
tags:
  - "#issues"
  - "#idea"
---

--- 
**Vấn đề** : Đồng bộ field Superadmin từ webSetting.json sang bảng Sys_UserInfo.IsSuperadmin

**Hiện trạng** : Cấu hình Superadmin hiện đang được thực hiện thông qua **webSetting.json** (web main, portal, identity, window service), dẫn đến các vấn đề sau:

* **Khó cấu hình:** Cấu hình phân tán trên nhiều file và thư mục, gây khó khăn cho việc quản lý .
* **Không thống nhất:** Các thiết lập Superadmin có thể khác nhau trên các môi trường (web main, portal, identity, window service), dẫn đến sự không nhất quán.

**Giải pháp đề xuất:**

* Thêm cột **IsSuperadmin** vào bảng **Sys_UserInfo**.
* Cập nhật trường **IsSuperadmin** trong bảng **Sys_UserInfo** thông qua việc chạy store script tự động (lấy từ key userName trong file  **webSetting.json** ).
* Ngăn chặn người dùng cập nhật trường **IsSuperadmin** thông qua giao diện người dùng để đảm bảo tính đồng nhất.