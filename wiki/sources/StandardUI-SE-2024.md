---
description: "Tiêu chuẩn SE 2024: 6 nhóm lỗi phổ biến, chuẩn UI (1366×768), thứ tự button, control ngày, màu thông báo và checklist màn hình mới HRM."
type: source
tags:
  - standard
  - ui-ux
  - se
  - code-quality
related:
  - "[[wiki/concepts/HRM-Code-Quality]]"
---

# Source: Tiêu Chuẩn SE — StandardUI (Nghĩa)

## Tóm tắt

Tài liệu tiêu chuẩn SE do Nghĩa biên soạn (30/05/2024), tóm tắt từ "StandardUI SE.doc". Bao gồm 6 nhóm tiêu chuẩn: UI, Button, Control, Mô tả xử lý, Thông báo, Thêm màn hình mới. Dùng làm checklist khi SE phát triển chức năng mới hoặc review lỗi.

## Key Takeaways

- **6 nhóm lỗi phổ biến**: Logic/quyền chỉnh sửa, Load dữ liệu, Giao diện, Validate, Lưu dữ liệu, Dịch ngôn ngữ.
- **UI Standards**: Màn hình chuẩn 1366×768; Tên đường dẫn = tên màn hình; DS/List prefix; BC/Report suffix; độ rộng cột cố định (Code: 60px, Name: 120px).
- **Button thứ tự chuẩn**: Tạo mới → Tìm kiếm → Xuất word → Xuất excel → Đổi cột → Xóa.
- **Control ngày**: Từ-đến, không nhập = vô cùng, format dd/mm/yyyy; nhập sai → tự xóa, không tô đỏ.
- **Thông báo màu**: Thành công = xanh lá; Thất bại = đỏ nhạt; Cảnh báo = vàng cam/chữ đen.
- **Màn hình mới bắt buộc**: Đủ button chuẩn + phân quyền + cấu hình kiểm tra trùng + key dịch EN/VN + mô tả cột mặc định.
- **Validate ngày**: Không cho phép ngày kết thúc < ngày bắt đầu; maxlength phải khớp với field DB.
- **Thông báo xóa/duyệt**: Hiển thị "X/Y dòng thỏa điều kiện" trước khi thực hiện.

## Trích dẫn quan trọng

> **Button chuẩn thứ tự**: Tạo mới > Tìm kiếm > Xuất word > Xuất excel > Đổi cột > Xóa

> **Thông báo không thể bỏ trống**: `[Tên field] không thể bỏ trống.` — phải dùng đúng tên field thật, không dùng generic message.

> **Màn hình mới checklist**:
> 1. Đủ các button chuẩn
> 2. Phân quyền các button (Bắt buộc nhập / Ẩn hiện / Dịch theo Super admin)
> 3. Cấu hình kiểm tra trùng theo fieldinfo/fieldinfoSpec
> 4. Key dịch tiếng Anh và tiếng Việt
> 5. BA note rõ các cột hiển thị mặc định trên lưới

## Liên kết

- [[wiki/concepts/HRM-Code-Quality]] — Quy tắc store, merge, enum, giao tiếp SE-BA-QC
