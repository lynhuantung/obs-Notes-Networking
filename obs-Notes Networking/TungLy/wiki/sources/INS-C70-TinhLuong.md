---
type: source
tags:
  - bao-hiem
  - tinh-luong
  - C70
  - bao-cao
  - salary-calculation
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/C70_TinhLuong.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/sources/INS-D02-ChungTu]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# INS — Bảng Tính Lương C70 với Bảo Hiểm

## Tóm tắt

Tài liệu mô tả **bảng lương C70** — biểu mẫu tổng hợp lương và bảo hiểm theo chuẩn kế toán Việt Nam. C70 là "sản phẩm đầu ra" của toàn bộ module tính lương + BH: mọi tính toán về BHXH, BHYT, BHTN (cả phần người lao động đóng và người sử dụng lao động đóng) đều được tổng hợp vào đây. C70 là cơ sở để kế toán hạch toán và đối soát với BHXH.

## Key Takeaways

- **C70 là gì**: Bảng tổng hợp lương + trích nộp BH theo mẫu Thông tư 200/QĐBH hoặc TT133, gồm cột lương cơ bản, các khoản phụ cấp, tổng thu nhập, BHXH/BHYT/BHTN (NLĐ + NSDLĐ), thuế TNCN, thực lĩnh.
- **Cấu trúc cột chính**:
  - Lương cơ bản
  - Phụ cấp (trách nhiệm, chức vụ, xăng xe, ăn trưa, ...)
  - Tổng thu nhập chịu thuế
  - BHXH NLĐ (8%), BHYT NLĐ (1.5%), BHTN NLĐ (1%)
  - BHXH NSDLĐ (17.5%), BHYT NSDLĐ (3%), BHTN NSDLĐ (1%)
  - Thuế TNCN
  - Thực lĩnh
- **Input từ BH**: `DayCount`, `InsuranceMonthJoin` → xác định ai được tính BH tháng này và với mức nào.
- **Tháng không đủ ngày**: Tính theo tỷ lệ `(DayCount / TotalDaysInMonth)` × mức lương đóng.
- **Đối soát**: C70 phải khớp với D02 — tổng cột BHXH trên C70 = tổng trên D02.

## Trích dẫn quan trọng

> C70 là bằng chứng kế toán — mọi số liệu trên C70 phải có dấu vết tính toán, không được nhập tay.

> Lỗi phổ biến: C70 có nhân viên nhưng D02 không có → dữ liệu tham gia BH bị lọc sai.

> Tỷ lệ BH năm 2024: BHXH (NLĐ 8% + NSDLĐ 17.5%), BHYT (NLĐ 1.5% + NSDLĐ 3%), BHTN (NLĐ 1% + NSDLĐ 1%).

## Liên kết cột C70 với module BH

| Cột C70 | Nguồn dữ liệu |
|---------|--------------|
| BHXH NLĐ | `InsuranceMonthJoin` × mức lương BH × 8% |
| BHYT NLĐ | `InsuranceMonthJoin` × mức lương BH × 1.5% |
| BHTN NLĐ | `InsuranceMonthJoin` × mức lương BH × 1% |
| BHXH NSDLĐ | `InsuranceMonthJoin` × mức lương BH × 17.5% |
| Số ngày BH | `InsuranceRecordDayCount` |

## Liên kết

- [[wiki/sources/INS-InsuranceRecordDayCount]] — DayCount là input tính lương BH
- [[wiki/sources/INS-InsuranceMonthJoin]] — Xác định nhân viên nào được đưa vào C70 tháng này
- [[wiki/sources/INS-D02-ChungTu]] — C70 và D02 phải đối soát khớp nhau
- [[wiki/sources/INS-InsurancePayback]] — Hoàn trả phản ánh ngược lên C70
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
- [[wiki/projects/VnPay-Project]] — Triển khai thực tế
