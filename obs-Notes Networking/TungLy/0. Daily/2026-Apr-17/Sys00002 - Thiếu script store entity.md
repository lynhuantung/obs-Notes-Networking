---
Mã: Sys00002
aliases:
date: 2021-04-19
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00001 - Không chạy superadmin QC]]"
  - "[[Sys00006 - Mất code merge conflict]]"
  - "[[Sys00013 - Script sai thiếu script]]"
  - "[[Sys00023c - Thêm field đổi kiểu dữ liệu]]"
---
# Thiếu script store build

**Vấn đề:** Lỗi thiếu script, store (hoặc do phiên bản SQL chưa hỗ trợ từ khóa SQL)

**Lý Do:**
- Why1: Vi khi thêm script chưa cập nhật trong project main
- Why2: Vì trước khi chạy script tự build entity trước dẫn đến script va entity không khớp, người build và người tạo script chưa truyền thông và kiểm tra.
- Why3: Khi đưa code lên bị conflict và xử lý conflict chưa tốt dẫn đến bị double code
- Why4: Vì tiêu chuẩn xử lý chưa rõ ràng và lệ thuộc vào thao tác của con người, mà con người dễ dẫn đến sai
- Why5: Tìm cách tự động hóa (giảm thiểu thao tác sai của con người)

**Nguyên nhân gốc:**
- Người viết script và người build entity do chưa truyền thông
- Chưa có tiêu chuẩn rõ ràng về việc đưa code

**Cách phòng tránh:**
Tạo tiêu chuẩn

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00002 | SE | 19/04/2021 |
