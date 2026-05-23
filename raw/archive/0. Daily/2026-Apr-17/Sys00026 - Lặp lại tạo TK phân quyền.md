---
Mã: Sys00026
aliases:
date: 2023-04-21
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00017 - Đổi giải pháp lúc QC]]"
  - "[[Sys00020 - BA đổi tài liệu không thông báo]]"
  - "[[Sys00023a - Lỗi bất cẩn khi code]]"
---
# Lặp lại tạo TK phân quyền

**Vấn đề:** Thêm tính năng tạo TK, phân quyền nhanh cho user chưa có tài khoản
Lỗi lặp lại 2 lần (MantisID: 159092)

**Lý Do:**
- Tại sao 1: Đánh giá sai point task (task loại 5)
- Tại sao 2: Gặp nhiều khó khăn trong kỹ thuật code về cache lưới tạm
- Tại sao 3: Trong lúc làm có góp ý thay đổi tài liệu với BA nhiều lần
- Tại sao 4: Không fix kịp một số case do đang trong thời điểm bị các task khác dí (task modify, task hỗ trợ PE GOLIVE, kaizen performance, c70,...)

**Nguyên nhân gốc:**
- Do chưa kiểm soát phát sinh từ PE (dẫn đến PE dí task)
- Khi confirm task do chưa chốt giải pháp
- Chưa đánh giá số point chính xác khi confirm task

**Cách phòng tránh:**
- Kiểm soát và review code kỹ trước khi release
- Rèn luyện kỹ năng đánh giá task đúng point và quản lý rủi ro
- Khi gặp vấn đề phải cảnh báo sớm với leader

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Minh.NguyenDat] | Sys00026 | SE | 21/04/2023 |
