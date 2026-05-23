---
title: "ATT – DB Att_AnnualDetail (Chi tiết phép tháng)"
date: 2026-05-09
code: att-db-annualdetail
domain: att
module: Attendance / Database
tags:
  - att
  - database
  - schema
  - phep-nam
verified: yes
related:
  - "[[ATT-DB-Overview]]"
  - "[[ATT-DB-AttAnnualLeave]]"
  - "[[ATT-LuatNgayNghi]]"
---

# ATT – DB Att_AnnualDetail

## Mô tả

Bảng lưu chi tiết phép năm theo từng tháng của nhân viên. Theo dõi số phép tích lũy, sử dụng và còn lại từng tháng.

## Schema chính

| Field | Type | FK | Mô tả |
|-------|------|----|-------|
| ID | uniqueidentifier | | PK |
| ProfileID | uniqueidentifier | Hre_Profile | Nhân viên |
| Year | int | | Năm |
| MonthYear | Datetime | | Tháng áp dụng |
| MonthBeginInYear | Int | | Tháng bắt đầu năm phép |
| MonthResetInitAvailable | Int | | Tháng reset phép khởi tạo |
| MonthStartProfile | Int | | Tháng bắt đầu của nhân viên |
| Available | Float | | Số phép hiện có |
| LeaveInMonth | float | | Số phép nghỉ trong tháng |
| TotalLeaveBef | Float | | Tổng phép đã nghỉ trước tháng này |
| Remain | Float | | Phép còn lại |
| InitAvailable | Float | | Phép khởi tạo |
| SeniorBonus | Float | | Phép thưởng thâm niên |
| PregnantLeaveAvailablePerMonth | Float | | Phép thai sản tháng |
| InitAvailableInMonth | Float | | Phép khởi tạo trong tháng |
| AvailableInMonth | Float | | Phép có trong tháng |
| SettlementInMonth | Float | | Thanh toán phép tháng |
| TotalSettlementInMonthBef | Float | | Tổng thanh toán phép trước tháng |
| LeaveInMonthFromInitAvailable | Float | | Phép nghỉ từ phép khởi tạo |
| Type | varchar(50) | | Loại phép |
