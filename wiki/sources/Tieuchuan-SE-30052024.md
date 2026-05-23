---
description: "Tiêu chuẩn SE 30/05/2024: 6 loại lỗi phổ biến, chuẩn UI button/control/validate/thông báo và màu trạng thái lưới HRM."
type: source
domain: system
tags: [standard-se, UI, validate, button, grid, notification, code-quality, nghia]
source-file: src/Tieuchuan_30052024.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/concepts/HRM-Code-Quality]]"
  - "[[wiki/sources/StandardUI-SE-2024]]"
  - "[[wiki/sources/NghiepVu-ATT-SAL]]"
---

# Tiêu Chuẩn SE (Nghĩa) — 30/05/2024

## Tóm tắt

Tài liệu tổng hợp 6 loại lỗi phổ biến trong phát triển HRM và tiêu chuẩn khắc phục tương ứng, do Nghĩa biên soạn ngày 30/05/2024. Bao gồm: tiêu chuẩn UI (tỷ lệ màn hình 1366×768, đặt tên đường dẫn, hiển thị lưới), tiêu chuẩn button (thứ tự 6 button chuẩn), tiêu chuẩn control (ngày tháng, multiselect, logic tìm kiếm), tiêu chuẩn validate (field name, maxlength, ngày bắt đầu/kết thúc), tiêu chuẩn lưu dữ liệu (trùng dữ liệu, chọn nhiều NV), và tiêu chuẩn dịch ngôn ngữ (key dịch EN/VI).

## Key Takeaways

- **Thứ tự button chuẩn**: Tạo mới > Tìm kiếm > Xuất word > Xuất excel > Đổi cột > Xóa
- **Tỷ lệ màn hình chuẩn**: 1366 × 768
- **Đặt tên**: "DS" đứng đầu (tiếng Việt) / "List" đứng cuối (tiếng Anh); "BC" đứng đầu / "Report" đứng cuối
- **Control ngày**: bắt buộc có từ-đến, không nhập = vô cùng, định dạng dd/mm/yyyy
- **Validate sai ngày**: hệ thống tự động xóa dữ liệu sai định dạng, KHÔNG tô đỏ
- **Màu thông báo**: thành công = xanh lá, thất bại = đỏ nhạt, cảnh báo = vàng cam/chữ đen
- **Màu trạng thái lưới**: Lưu tạm / Yêu cầu / Chờ duyệt / Từ chối / Hủy / Xác nhận (có mã màu riêng)
- **Màn hình mới**: bắt buộc đủ 6 button, phân quyền, cấu hình kiểm tra trùng, key dịch EN/VI

## Trích dẫn quan trọng

> Validate sai định dạng ngày tháng: Hệ thống sẽ **tự động xóa đi** dữ liệu và không tô đỏ.

> Logic tìm kiếm: Tìm kiếm mã nhân viên cho phép tìm nhiều, load danh mục không load danh mục có check "Vô hiệu".

> Tiêu chuẩn đặt bộ button "Lưu": Popup đặt **giữa màn hình**, trên trang mới thì góc trên tay trái màn hình.

## Liên kết

- [[wiki/concepts/HRM-Code-Quality]] — Quy tắc store, merge, enum, giao tiếp SE-BA-QC
- [[wiki/sources/StandardUI-SE-2024]] — Tài liệu chuẩn UI SE 2024 (Nghĩa) chi tiết hơn
