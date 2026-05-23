---
Mã: Sys00016
aliases:
date: 2021-05-10
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00005 - Không login được]]"
  - "[[Sys00021 - Link HRM chat bị lỗi]]"
---
# Lộ quyền dữ liệu HVN

**Vấn đề:** Lộ quyền HVN khi dùng chrome có proxy về policy
Một máy bên HVN không thấy tất cả dữ liệu mặc dù không có quyền

**Lý Do:**
- Why1: Bởi vì header user login không truyền vào được với chrome cụ thể
- Why2: Vì func phân quyền xử lý xót trường hợp không truyền user hoặc truyền sai user -> sửa funct phân quyền
- Why3: Bởi vì trình duyệt chrome 1 máy cụ thể có dùng proxy không truyền header user => tìm giải pháp chorme truyền được header
- Why4: Bởi vì trình diệt virus Synmatec chặn header (nguyên nhân suy đoán chưa kiểm chứng). Vì không có quyền kiểm tra kỹ setting của Symantec nên chỉ kiểm tra sơ bộ thấy sự khác nhau giữa 2 trình duyệt Chrome và Firefox là khi 2 trình duyệt hoạt định thì trong phần Network Activity (Kiểm tra mạng của Symantec) chỉ nhận được Firefox còn Chrome thì không thấy
- Why5: Vì chưa cài chrome với quyền administrator

**Nguyên nhân gốc:**
- Func phân quyền chưa đúng khi userlogin chưa truyền được hoặc truyền user không tồn tại trong hệ thống.
- Cài đặt chrome với quyền user thường.

**Cách phòng tránh:**
- Sửa func phân quyền (chỉ giải quyết lộ quyền)
- Cài đặt chrome với quyền administrator sẽ giải quyết được

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00016 | SE | 10/05/2021 |
