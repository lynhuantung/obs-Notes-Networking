---
type: source
description: "Bug bảo hiểm báo cáo D02: thải sản, nghỉ 14 ngày, phiếu cần xử lý và mantis theo dõi."
domain: ins
tags: [bao-hiem, D02, thai-san, nghi-14-ngay, bug, mantis]
source-file: raw/Nghiệp vụ HRM/INS/INS-BC-D02.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-TaiLieuBaoHiem-01]]"
  - "[[wiki/sources/INS-ThietKe-V8]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/architecture/INS-Architecture]]"
---

# INS — Bug Báo Cáo D02 Không Hiển Thị Điều Chỉnh Lương

## Tóm tắt

Tài liệu mô tả bug Mantis #57589: khi nhân viên nghỉ thai sản hoặc nghỉ ≥ 14 ngày, hệ thống không hiển thị phần điều chỉnh lương lên báo cáo D02. Đây là issue thực tế ảnh hưởng tất cả khách hàng có sử dụng báo cáo D02. Tài liệu ghi nhận triệu chứng và tham chiếu đến các issue liên quan (Mantis 57594 — ON/OFF thai sản), nhưng phần nguyên nhân và xử lý chưa được điền đầy đủ.

## Key Takeaways

- **Bug Mantis #57589**: D02 thiếu phần điều chỉnh lương khi nghỉ thai sản hoặc nghỉ ≥ 14 ngày
- Ảnh hưởng tất cả khách hàng dùng báo cáo D02 (rộng)
- Liên quan chặt với Mantis #57594 (nguyên tắc ON/OFF thai sản)
- Nguyên nhân và cách xử lý **chưa được ghi nhận** trong tài liệu gốc — cần bổ sung từ hiện trường
- File này là dạng issue tracking note, không phải tài liệu giải pháp

## Trích dẫn quan trọng

> Khi nhân viên **nghỉ thai sản** hoặc **nghỉ ≥ 14 ngày**, hệ thống **không hiển thị phần điều chỉnh lương** lên báo cáo D02.

## Liên kết

- [[wiki/sources/INS-TaiLieuBaoHiem-01]] — Tài liệu toàn diện INS v8
- [[wiki/sources/INS-ThietKe-V8]] — Thiết kế chức năng INS V8 gồm biểu mẫu D02
- [[wiki/sources/INS-NghiThaiSan]] — Chế độ thai sản: 6 tháng, 100% lương
- [[wiki/sources/INS-Nghi14Ngay]] — Quy tắc nghỉ ốm 14 ngày
- [[wiki/architecture/INS-Architecture]] — Architecture phân hệ INS
