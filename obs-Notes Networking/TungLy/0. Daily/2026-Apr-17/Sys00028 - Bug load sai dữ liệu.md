---
Mã: Sys00028
aliases:
date: 2023-05-18
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00014 - Script thiếu field bảng]]"
  - "[[Sys00015 - Store thiếu tham số]]"
  - "[[Sys00027 - Enum không đồng bộ lưới dropdown]]"
---
# Bug load sai dữ liệu

**Vấn đề:** Bug load khong dung du lieu (Yeu cau task sua 5 man hinh cung 1 chuc nang load nguoi uy quyen duyet)
Dịch enum không đồng bộ ở lưới và dropdown popup
Lỗi lặp lại 2 lần (MantisID: 0159034)

**Lý Do:**
- Tại sao 1: (QC test fail không load được dữ liệu) => khi test sửa dưới DB nhưng do check code thiếu trong store.
- Tại sao 2: (QC test fail load không đúng dữ liệu) chỉ sửa không load được dữ liệu, không test hết được các case có thể khi load dữ liệu lên.
- Tại sao 3: pass (sửa xử lý field đang làm khi thay đổi các field liên quan)

**Nguyên nhân gốc:**
- Khi sửa store không sửa ngay trong source
- Do màn hình xử lý khác nhau nên không test kỹ hết.

**Cách phòng tránh:**
- Khi sửa store phải sửa ngay trong source.
- Khi test phải check hết những tham chiếu liên quan.

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tu.HuynhCam] | Sys00028 | SE | 18/05/2023 |
