---
type: source
domain: ins
tags: [bao-hiem, EBHXH, tang-giam-dieu-chinh, ma-D02, IBHXH, mapping]
source-file: raw/Nghiệp vụ HRM/INS/INS-EBHXH.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-TaiLieuBaoHiem-01]]"
  - "[[wiki/sources/INS-ThietKe-V8]]"
  - "[[wiki/sources/INS-iBHXH-Analyze]]"
  - "[[wiki/sources/INS-Bieu-Mau]]"
  - "[[wiki/architecture/INS-Architecture]]"
description: "Bảng mã EBHXH tăng (11 mã), giảm (16 mã) và điều chỉnh kê khai điện tử, mapping sang trạng thái D02 HRM và khác biệt với IBHXH."
---

# INS — Nghiệp Vụ EBHXH: Bảng Mã Tăng / Giảm / Điều Chỉnh

## Tóm tắt

Tài liệu tra cứu toàn bộ mã EBHXH (Electronic BHXH — khai báo điện tử) dùng trong phân hệ INS, phân loại theo 3 nhóm: Tăng (11 mã), Giảm (16 mã), và Điều chỉnh. Mỗi mã EBHXH được map sang trạng thái D02 tương ứng và có diễn giải tiếng Việt. Bảng so sánh cuối document chỉ ra khác biệt chính giữa IBHXH và EBHXH: EBHXH có phần Điều chỉnh riêng biệt, không có loại TL (tăng thay đổi pháp nhân).

## Key Takeaways

- **EBHXH Tăng**: 11 mã — TM (tăng LĐ), TD (tăng do chuyển nơi đóng), ON (thai sản/bệnh/14 ngày), DC (lương), CD (chức danh), AD (truy thu), TT (BHYT), TN (BHTN)
- **EBHXH Giảm**: 16 mã — GH (giảm LĐ/nghỉ việc sau TS/tạm hoãn), GD (chuyển nơi đóng), KL (nghỉ 14 ngày), TS (thai sản), SB (điều chỉnh giảm), TU (BHYT), GN (BHTN), OF_1 (bệnh), GL (thay đổi pháp nhân)
- **EBHXH Điều chỉnh**: bao gồm hầu hết mã Giảm + CD (đổi chức danh)
- **Khác với IBHXH**: EBHXH có "Điều chỉnh" riêng, không có loại TL; mã GL có diễn giải khác
- File này là bảng reference tra cứu nhanh, bổ sung cho INS-IBHXH

## Trích dẫn quan trọng

> **Điểm khác biệt IBHXH vs EBHXH**: IBHXH có loại TL (Tăng LĐ thay đổi pháp nhân), EBHXH không có. EBHXH có phần Điều chỉnh riêng biệt, IBHXH không có riêng.

## Liên kết

- [[wiki/sources/INS-TaiLieuBaoHiem-01]] — Tài liệu toàn diện INS v8 (chứa cả IBHXH/EBHXH)
- [[wiki/sources/INS-iBHXH-Analyze]] — Phân tích luồng tích hợp HRM → iBHXH
- [[wiki/sources/INS-Bieu-Mau]] — Biểu mẫu D02-TS và mã ký hiệu
- [[wiki/architecture/INS-Architecture]] — Architecture phân hệ INS
