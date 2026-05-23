---
type: source
code: m7x2
tags:
  - "ins"
  - "ibhxh"
  - "d02"
  - "tang-giam"
domain: ins
created: 2026-04-30
updated: 2026-04-30
source-file: raw/Nghiệp vụ HRM/INS/INS-IBHXH.md
related:
  - "[[wiki/sources/INS-EBHXH]]"
  - "[[wiki/sources/INS-Nghiep-Vu]]"
  - "[[wiki/sources/INS-Bieu-Mau]]"
  - "[[wiki/sources/INS-VennD02]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
description: "Bảng mã IBHXH tăng (12 mã) và giảm (19 mã) bảo hiểm điện tử, kèm mapping chi tiết cột dữ liệu xuất file IBHXH."
---

# Source: INS – Nghiệp Vụ IBHXH Tăng và Giảm

## Tóm tắt

Tài liệu mô tả đầy đủ bảng mã IBHXH cho nghiệp vụ **Tăng** (12 mã) và **Giảm** (19 mã) bảo hiểm xã hội điện tử, kèm trạng thái D02 tương ứng trong HRM. Đồng thời cung cấp mapping chi tiết từng cột dữ liệu (Col0–Col53) khi xuất file IBHXH Tăng và IBHXH Giảm — chỉ rõ bảng nguồn và field cụ thể. Đây là tài liệu kỹ thuật tra cứu khi phát triển hoặc debug tích hợp iBHXH.

## Key Takeaways

- **19 mã Giảm** — từ GH (giảm LĐ) đến GL (thay đổi pháp nhân), KL (nghỉ 14 ngày), TS (thai sản)
- **12 mã Tăng** — từ TM (tăng LĐ) đến TL (thay đổi pháp nhân), ON (thai sản/bệnh/14 ngày)
- Mã **DC** xuất hiện cả Tăng lẫn Giảm — dùng để điều chỉnh lương mức đóng
- Cột **Col5 (JobName)** lấy từ `InsuranceMonthly.JobName` — đây chính là nguồn lỗi "Tên Công Việc" trống
- Cột **Col6 (Lương BHXH)** lấy từ `D02.NewBasicSalary` (tăng) hoặc `D02Item.NewBasicSalary` (giảm)
- Cột **Col20** có logic khác nhau giữa Tăng (tình trạng sổ BH) và Giảm (không trả thẻ BHYT)
- Tỉ lệ đóng Col18 = **32.5 cố định**

## Trích dẫn quan trọng

> | Mã IBHXH | Trạng thái D02 | Diễn giải |
> |----------|----------------|-----------|
> | KL | E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ hơn 14 ngày |
> | TS | E_GIAM_TS | Giảm thai sản |
> | ON | E_TANG_TS | Tăng thai sản |
> | DC | E_TANG_LUONG | Tăng mức đóng |

> Col20 (Tăng): Tình trạng sổ BH — Nếu SocialInsNo = Null → 1, ngược lại → 2
> Col20 (Giảm): Không Trả Thẻ BHYT — Nếu loại GH → 1, ngược lại null

## Liên kết

- [[wiki/sources/INS-EBHXH]] — Bảng mã EBHXH so sánh
- [[wiki/sources/INS-Nghiep-Vu]] — Nghiệp vụ tăng/giảm/điều chỉnh tổng quan
- [[wiki/sources/INS-Bieu-Mau]] — Biểu mẫu D02-TS đầy đủ
- [[wiki/sources/INS-VennD02]] — So sánh IBHXH / VNPT / Viettel
- [[wiki/sources/INS-Database-Tables]] — Bảng `Ins_ReportD02Item`, `Hre_Profile`
