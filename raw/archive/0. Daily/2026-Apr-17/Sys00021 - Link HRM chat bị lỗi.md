---
Mã: Sys00021
aliases:
date: 2021-05-10
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00007 - Webconfig thiếu key]]"
  - "[[Sys00016 - Lộ quyền dữ liệu HVN]]"
---
# Link HRM chat bị lỗi

**Vấn đề:** Gọi link HRM từ google chat bị lỗi hình răng cưa, phải refresh trang 1 lần nửa mới vô được trang HRM

**Lý Do:**
Hệ thống chặn link ngoài gọi vào HRM

**Nguyên nhân gốc:**
Do chưa add key AllowOrigin của link google.com

**Cách phòng tránh:**
Add key `<add key="AllowOrigin" value="https://www.google.com/" />` vào webconfig main và portal

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| Tung.Ly | Sys00021 | SE | 10/05/2021 |
