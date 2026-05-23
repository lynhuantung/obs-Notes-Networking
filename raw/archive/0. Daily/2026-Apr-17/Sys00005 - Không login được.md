---
Mã: Sys00005
aliases:
date: 2021-04-19
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00003 - Không lấy được version]]"
  - "[[Sys00007 - Webconfig thiếu key]]"
  - "[[Sys00016 - Lộ quyền dữ liệu HVN]]"
  - "[[Sys00024 - Login lỗi 500 GetEnum]]"
---
# Không login được hệ thống

**Vấn đề:** Không login được

**Lý Do:**
- Tại sao 1: Vì có cấu hình web config có cấu hình redis và không cấu hình đúng
- Tại sao 2: Vì sytem service không hoạt động do chặn port hoặc không mở port
- Tại sao 3: Vì màn hình login bị bug

**Nguyên nhân gốc:**
- Do webconfig và port bị chặn
- Màn hình login bị lỗi

**Cách phòng tránh:**
Tạo tool webconfig

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00005 | SE | 19/04/2021 |
