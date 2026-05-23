---
type: source
tags:
  - bao-hiem
  - BHXH
  - insurance-logic
  - day-count
  - record
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/Ins_InsuranceRecordDayCount_05.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/sources/INS-InsurancePayback]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/projects/VnPay-Project]]"
description: "Logic đếm số ngày thực tế bản ghi bảo hiểm trong tháng, nền tảng tính tiền đóng và tiền trích BHXH/BHYT/BHTN."
---

# INS — Đếm Ngày Bản Ghi Bảo Hiểm (InsuranceRecordDayCount)

## Tóm tắt

Hai tài liệu `Ins_InsuranceRecordDayCount_05.png` và `DayCount_InsuranceRecord.png` mô tả logic đếm số ngày thực tế của một bản ghi bảo hiểm trong một tháng nhất định. Đây là phép tính nền tảng cho toàn bộ nghiệp vụ BH: xác định ngày đóng → tính tiền đóng → tính tiền trích → báo cáo. Sai số đếm ngày là nguồn gốc của nhiều lỗi nghiệp vụ phổ biến.

## Key Takeaways

- **Công thức cơ bản**: `DayCount = MIN(EndDate, LastDayOfMonth) - MAX(StartDate, FirstDayOfMonth) + 1`
- **Trường hợp biên quan trọng**:
  - Bản ghi bắt đầu trước tháng → clamp về ngày 1 tháng
  - Bản ghi kết thúc sau tháng → clamp về ngày cuối tháng
  - Bản ghi hoàn toàn nằm ngoài tháng → `DayCount = 0` (loại bỏ)
  - Bản ghi 1 ngày (StartDate = EndDate) → `DayCount = 1`
- **Tháng 28/29/30/31 ngày**: Logic phải dùng hàm `EOMONTH` hoặc tương đương, không hardcode 30.
- **Nhiều bản ghi trong 1 tháng**: Tổng DayCount không được vượt quá số ngày trong tháng — cần kiểm tra overlap.
- **Ứng dụng**:
  - Tính lương BH theo ngày (nếu không đóng đủ tháng)
  - Xác định tỷ lệ hoàn trả khi nghỉ giữa tháng
  - Input cho báo cáo D02 và C70

## Trích dẫn quan trọng

> `DayCount = 0` → bản ghi không hợp lệ cho tháng này, không được đưa vào tính toán.

> Overlap detection: nếu hai bản ghi cùng nhân viên có khoảng ngày chồng nhau trong cùng tháng → lỗi dữ liệu, cần alert.

> Tháng đủ = DayCount bằng đúng số ngày trong tháng → đóng full tháng, không cần tính tỷ lệ.

## Sơ đồ logic (từ ảnh)

```
Input: StartDate, EndDate, Month (YYYY-MM)
  ↓
FirstDay = ngày 1 của Month
LastDay  = ngày cuối của Month
  ↓
EffectiveStart = MAX(StartDate, FirstDay)
EffectiveEnd   = MIN(EndDate,   LastDay)
  ↓
IF EffectiveStart > EffectiveEnd → DayCount = 0 (invalid)
ELSE → DayCount = EffectiveEnd - EffectiveStart + 1
```

## Liên kết

- [[wiki/sources/INS-InsuranceMonthJoin]] — Bước trước: xác định tháng nào có bản ghi
- [[wiki/sources/INS-InsurancePayback]] — Dùng DayCount để tính mức hoàn trả
- [[wiki/sources/INS-Nghi14Ngay]] — Nghỉ ốm làm gián đoạn bản ghi, ảnh hưởng DayCount
- [[wiki/sources/INS-C70-TinhLuong]] — C70 dùng DayCount làm input tính lương
- [[wiki/sources/INS-D02-ChungTu]] — D02 tổng hợp ngày đóng BH
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
