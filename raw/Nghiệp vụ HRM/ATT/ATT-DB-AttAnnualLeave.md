---
title: "ATT – DB Att_AnnualLeave (Phép năm)"
date: 2026-05-09
code: att-db-annualleave
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
  - "[[ATT-DB-AttAnnualDetail]]"
  - "[[ATT-LuatNgayNghi]]"
---

# ATT – DB Att_AnnualLeave

## Mô tả

Bảng lưu tổng hợp phép năm của từng nhân viên theo năm. Là nguồn dữ liệu gốc để tính số ngày phép còn lại.

## Schema chính

| Field | Type | FK | Mô tả |
|-------|------|----|-------|
| ID | uniqueidentifier | | PK |
| ProfileID | uniqueidentifier | Hre_Profile | Nhân viên |
| Year | Int | | Năm áp dụng |
| MonthStart | Int | | Tháng bắt đầu năm phép |
| InitAnlValue | Float | | Số phép năm khởi tạo |
| InitSickValue | Float | | Số phép bệnh khởi tạo |
| InitSaveSickValue | Float | | Phép bệnh tích lũy |
| AnlValueLastYear | float | | Phép năm chuyển từ năm trước |
| ExpireAnlValueLastYear | datetime | | Ngày hết hạn phép năm trước |
| SurplusAnllastYear | Float | | Dư phép năm trước |
| SurplusSicklastYear | Float | | Dư phép bệnh năm trước |
| AvailableByProfile | Float | | Phép theo hồ sơ nhân viên |
| AvailableByProfileNew | Float | | Phép mới theo hồ sơ |
| DateChangeNewAvailable | datetime | | Ngày thay đổi phép mới |
| InitMensesValue | float | | Phép kinh nguyệt |
| InitAdditionalValue | float | | Phép bổ sung |
| AnlMonthReset | nvarchar(100) | | Tháng reset phép |
| MonthResetAnlOfBeforeYear | int | | Tháng reset phép năm trước |

## Quan hệ

```
Att_AnnualLeave (1) → (N) Att_AnnualDetail
```
