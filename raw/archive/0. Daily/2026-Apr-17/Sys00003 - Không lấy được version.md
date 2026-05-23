---
Mã: Sys00003
aliases:
date: 2021-04-19
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00005 - Không login được]]"
  - "[[Sys00007 - Webconfig thiếu key]]"
  - "[[Sys00024 - Login lỗi 500 GetEnum]]"
  - "[[Sys00025 - Màn hình main bị lỗi]]"
---
# Không lấy được version login

**Vấn đề:** Lỗi không lấy được version ở trang login (do không chay link HR Service hoặc Sys Service được)

**Lý Do:**
- Tại sao 1: Vì không chạy được service System
- Tại sao 2: Vì webconfig bi sai và đã sửa webconfig chạy đúng
- Tại sao 3: Port system service chưa mở hoặc bị chặn
- Tại sao 4: (chưa ghi)

**Nguyên nhân gốc:**
- Webconfig bi sai
- Port system service bị chặn

**Cách phòng tránh:**
Tạo tool chỉnh webconfig cho đúng ngày từ đầu cho a/e PE và tool dựng IIS

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00003 | SE | 19/04/2021 |
