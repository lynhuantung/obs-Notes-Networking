---
type: architecture
code: d7m2q
description: "Schema 5 bảng chính phân hệ ATT: Cat_GradeCfg, Att_AnnualLeave, Att_AnnualDetail, Att_AttendanceTable, Att_AttendanceTableItem — quan hệ và nhóm field"
domain: att
tags:
  - att
  - database
  - schema
  - architecture
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/sources/b5f9g-att-db-overview]]"
  - "[[wiki/sources/c2s5j-att-db-attendancetable]]"
  - "[[wiki/sources/z8h4l-att-db-attendancetableitem]]"
  - "[[wiki/sources/r6e1w-att-db-annualleave]]"
  - "[[wiki/sources/t4u8v-att-db-annualdetail]]"
  - "[[wiki/sources/f3g6r-att-db-catgradecfg]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
---

# ATT – Database Schema

Kiến trúc database phân hệ Chấm công (ATT) trong HRM Pro 8. Gồm 5 bảng chính + 3 bảng catalog lookup.

## Sơ đồ quan hệ

```
Hre_Profile (nhân viên)
  │
  ├── Cat_GradeCfg ──────────────────── (chế độ công / bậc lương)
  │     ├── NormalOTTypeID ──────────► Cat_OvertimeType
  │     ├── WeekendOTTypeID ─────────► Cat_OvertimeType
  │     ├── HolidayOTTypeID ─────────► Cat_OvertimeType
  │     └── WorkOnMondayID…SundayID ► Cat_Shift
  │
  ├── Att_AnnualLeave ────────────────── (phép năm tổng hợp theo năm)
  │     └── Att_AnnualDetail ─────────── (chi tiết phép từng tháng)
  │
  └── Att_AttendanceTable ────────────── (bảng công tổng hợp tháng)
        ├── LeaveDay1–6Type ──────────► Cat_LeaveDayType
        ├── Overtime1–9Type ──────────► Cat_OvertimeType
        ├── OvertimeOFF1–8Type ───────► Cat_OvertimeType
        └── Att_AttendanceTableItem ──── (bảng công chi tiết ngày)
              ├── ShiftID / Shift2ID ──► Cat_Shift
              ├── LeaveTypeID ─────────► Cat_LeaveDayType
              ├── ExtraLeaveTypeID1–6 ► Cat_LeaveDayType
              ├── OvertimeTypeID ──────► Cat_OvertimeType
              └── ExtraOvertimeTypeID1–4 ► Cat_OvertimeType
```

## Cat_GradeCfg — Chế độ công

Bảng catalog quan trọng nhất — mọi nhân viên phải được gán chế độ công.

| Nhóm | Fields quan trọng |
|------|-------------------|
| Thời gian | WorkingTimeType, HourOnWorkDate, ExpHourFrom/To |
| OT types | NormalOTTypeID, WeekendOTTypeID, HolidayOTTypeID, Night* variants |
| OT method | IsFixedOT, IsActualOT, IsRosterOT, IsFormulaOT |
| Nghỉ phép | TotalDayAnnualLeaveOnYear, FormulaAnnualLeave, IsFixedLeave/IsActualLeave/... |
| Bảo hiểm | HealthInsCompRate/EmpRate, SocialInsCompRate/EmpRate, UnemployInsCompRate/EmpRate |
| Trừ công | IsDeductInLateOutEarly, IsDeductAbsenteesmDay, MinWorkDay |
| Ca mặc định | WorkOnMondayID → WorkOnSundayID |
| Kỳ lương | IsMonthlyCutOff, IsDurationCutOff, MidCutOffDay |

## Att_AnnualLeave — Phép năm tổng hợp

| Field | Mô tả |
|-------|-------|
| ProfileID | FK → Hre_Profile |
| Year | Năm áp dụng |
| InitAnlValue | Phép năm khởi tạo |
| InitSickValue | Phép bệnh khởi tạo |
| AnlValueLastYear | Phép chuyển từ năm trước |
| ExpireAnlValueLastYear | Ngày hết hạn phép năm trước |
| InitMensesValue | Phép kinh nguyệt |
| AnlMonthReset | Tháng reset phép |

→ Xem schema đầy đủ: [[wiki/sources/r6e1w-att-db-annualleave]]

## Att_AnnualDetail — Chi tiết phép tháng

| Field | Mô tả |
|-------|-------|
| MonthYear | Tháng áp dụng |
| Available | Số phép hiện có |
| LeaveInMonth | Phép nghỉ trong tháng |
| Remain | Phép còn lại |
| SeniorBonus | Phép thâm niên |
| PregnantLeaveAvailablePerMonth | Phép thai sản tháng |

→ Xem schema đầy đủ: [[wiki/sources/t4u8v-att-db-annualdetail]]

## Att_AttendanceTable — Bảng công tháng (bảng trung tâm)

| Nhóm | Fields quan trọng |
|------|-------------------|
| Trạng thái | MonthYear, ProfileID, CutOffDurationID, Status |
| Ngày công | StdWorkDayCount, RealWorkDayCount, PaidWorkDayCount, UnPaidLeave |
| Nghỉ phép | AnlDayTaken, AnlDayAvailable, SickDayTaken/Available |
| Loại nghỉ | LeaveDay1–6Type, LeaveDay1–6Hours, LeaveDay1–6Days |
| OT | Overtime1–9Type, Overtime1–9Hours |
| OT bù | OvertimeOFF1–8Type |
| Đi trễ | LateEarlyDeductionHours, LateCount, EarlyCount, CardMissingCount |
| Ca đêm/thai sản | NightShiftHours, OTPregnancyHours, IsWomanPolicy |
| Phê duyệt | UserApprove, DateApprove |

→ Xem schema đầy đủ: [[wiki/sources/c2s5j-att-db-attendancetable]]

## Att_AttendanceTableItem — Bảng công ngày

| Nhóm | Fields quan trọng |
|------|-------------------|
| Giờ chấm công | FirstInTime, LastOutTime, RootInTime/RootOutTime |
| Ca | ShiftID, Shift2ID, AvailableHours |
| Giờ làm | WorkHours, WorkPaidHours, NightShiftHours, TotalActualWorkHour |
| Nghỉ | LeaveTypeID, LeaveHours/Days, ExtraLeaveTypeID(1–6), UnpaidLeaveHours |
| OT | OvertimeTypeID, OvertimeHours, ExtraOvertimeTypeID(1–4), OTPregnancyHours |
| Đi trễ | LateInMinutes, EarlyOutMinutes, RealLateEarlyMinutes, CountMissInOut |
| Thai sản | IsHavingPregTreatment, PregnancyType |
| Pre-compute | StdAmountSalary, DayAmountSalary, NightAmountSalary, OT1–6AmountSalary |

→ Xem schema đầy đủ: [[wiki/sources/z8h4l-att-db-attendancetableitem]]

## Lưu ý kỹ thuật

- Tất cả PK là `uniqueidentifier` (GUID)
- `Sys_AllSetting` lưu cấu hình runtime — xem [[wiki/sources/h2j7q-att-sys-attendance-config]]
- Tỷ lệ BH trong Cat_GradeCfg → ảnh hưởng phân hệ INS — xem [[wiki/architecture/INS-Database-Schema]]
