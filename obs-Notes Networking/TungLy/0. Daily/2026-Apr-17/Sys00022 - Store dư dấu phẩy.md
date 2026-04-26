---
Mã: Sys00022
aliases:
date: 2021-06-01
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00013 - Script sai thiếu script]]"
  - "[[Sys00014 - Script thiếu field bảng]]"
  - "[[Sys00015 - Store thiếu tham số]]"
  - "[[Sys00023a - Lỗi bất cẩn khi code]]"
---
# Store dư dấu phẩy

**Vấn đề:** Lỗi store bị dư dấu phẩy
hrm_sys_sp_get_UserApproveById

**Lý Do:**
Bị dư dấu phẩy

**Nguyên nhân gốc:**
- Tại sao dư dấu phẩy: Vì thêm code vào source mà ko execute để test
- Tại sao thêm code vào source mà ko execute để test: Vì thêm những phần có chỉnh sửa từ sql vào thay vi copy hết dẫn đến việc ko cần execute để test lại
- Nguyên nhân gốc: Do thêm code bằng tay từ bên sql sang source

**Cách phòng tránh:**
Copy hết store trong sql sang source

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Khai.Nguyen] | Sys00022 | SE | 1/06/2021 |
