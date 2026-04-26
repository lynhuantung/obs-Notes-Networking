---
Mã: Sys00027
aliases:
date: 2023-05-18
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00019 - Key dịch không đồng nhất]]"
  - "[[Sys00028 - Bug load sai dữ liệu]]"
---
# Enum không đồng bộ lưới dropdown

**Vấn đề:** Dịch enum không đồng bộ ở lưới và dropdown popup
Lỗi lặp lại 2 lần (MantisID: 157357)

**Lý Do:**
- Tại sao 1: Do chưa biết enum đã tồn tại trong cat_enumTranslate -> sử dụng key dịch cũ, khác tài liệu BA
- Tại sao 2: Do chưa tìm đúng nguyên nhân lỗi + không test kỹ
- Tại sao 3: Test pass (sửa file Lang cho dropdown đồng bộ với key enum cũ)

**Nguyên nhân gốc:**
- Do không kiểm tra kỹ khi insert enum vào cat_enumTranslate trùng
- Chưa hiểu rõ logic load của enum dịch trên lưới

**Cách phòng tránh:**
- Kiểm tra enum đã tồn tại trước khi insert vào cat_enumTranslate.
- Hiểu được cách khi nào dịch ở file lang, khi nào insert bảng cat_EnumTranslate.

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tu.HuynhCam] | Sys00027 | SE | 18/05/2023 |
