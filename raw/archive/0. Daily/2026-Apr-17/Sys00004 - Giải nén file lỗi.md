---
Mã: Sys00004
aliases:
date: 2021-04-19
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00001 - Không chạy superadmin QC]]"
  - "[[Sys00005 - Không login được]]"
---
# Giải nén file bị lỗi

**Vấn đề:** Giải nén lỗi

**Lý Do:**
- Tại sao 1: Vì quá trình nén bị lỗi
- Tại sao 2: Vì trong khi nén vẫn chạy web hoặc thư mục cần nén
- Tại sao 3: Trong quá trình nén, có thao tác xóa hoặc gây ảnh hưởng đến files cần nén

**Nguyên nhân gốc:**
Trong quá trình này có thao tác bất thường đến những files cần nén

**Cách phòng tránh:**
Khi nén, stop IIS nơi chứa file cần nén, không thao tác đến những file trong thư mục cần nén

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00004 | SE | 19/04/2021 |
