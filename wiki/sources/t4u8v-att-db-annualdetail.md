---
type: source
code: t4u8v
description: "Schema Att_AnnualDetail: chi tiết phép năm theo tháng — Available, LeaveInMonth, Remain, SeniorBonus, PregnantLeaveAvailablePerMonth"
domain: att
tags:
  - att
  - database
  - schema
  - phep-nam
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/architecture/ATT-Database-Schema]]"
  - "[[wiki/sources/b5f9g-att-db-overview]]"
  - "[[wiki/sources/r6e1w-att-db-annualleave]]"
  - "[[wiki/sources/n5c1k-att-luat-ngay-nghi]]"
---

# Source: ATT – DB Att_AnnualDetail (Chi tiết phép tháng)

## Tóm tắt

Schema bảng `Att_AnnualDetail` — lưu chi tiết phép năm theo từng tháng của nhân viên trong HRM Pro 8. Theo dõi số phép tích lũy, sử dụng và còn lại từng tháng. Là bảng con của Att_AnnualLeave, được sinh ra khi chạy phân tích phép năm.

## Key Takeaways

- 20+ fields: MonthYear, Available, LeaveInMonth, TotalLeaveBef, Remain là 4 trường quan trọng nhất
- SeniorBonus: phép thưởng thâm niên (liên kết luật 5 năm +1 ngày)
- PregnantLeaveAvailablePerMonth: phép thai sản tháng — tách biệt với phép năm thường
- InitAvailableInMonth / AvailableInMonth: phép khởi tạo và phép có trong tháng
- SettlementInMonth / TotalSettlementInMonthBef: thanh toán phép và tích lũy thanh toán
- Type (varchar 50): phân loại phép trong tháng

## Trích dẫn quan trọng

> Bảng lưu chi tiết phép năm theo từng tháng của nhân viên. Theo dõi số phép tích lũy, sử dụng và còn lại từng tháng.

## Liên kết

- [[wiki/sources/r6e1w-att-db-annualleave]] — bảng cha tổng hợp phép năm
- [[wiki/architecture/ATT-Database-Schema]] — diagram tổng thể
