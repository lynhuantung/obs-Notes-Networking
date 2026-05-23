---
title: "ATT – DB Cat_GradeCfg (Chế độ công)"
date: 2026-05-09
code: att-db-catgradecfg
domain: att
module: Attendance / Database
tags:
  - att
  - database
  - schema
  - grade-cfg
verified: yes
related:
  - "[[ATT-DB-Overview]]"
  - "[[ATT-DuLieuTinhCong]]"
---

# ATT – DB Cat_GradeCfg

## Mô tả

Bảng cấu hình chế độ công / bậc lương. Quyết định cách tính công, OT, nghỉ phép, bảo hiểm cho từng nhóm nhân viên.

## Các trường chính theo nhóm chức năng

### Thông tin cơ bản
| Field | Type | Mô tả |
|-------|------|-------|
| ID | uniqueidentifier | PK |
| GradeCfgName | nvarchar(100) | Tên chế độ |
| Code | nvarchar(30) | Mã |
| Description | nvarchar(500) | Mô tả |

### Thời gian làm việc
| Field | Type | Mô tả |
|-------|------|-------|
| WorkingTimeType | nvarchar(50) | Loại thời gian làm việc |
| WorkingTimeDay | Float | Số ngày làm việc |
| HourOnWorkDate | Float | Số giờ/ngày |
| ExpHourPerDay | Float | Giờ kỳ vọng/ngày |
| ExpHourFrom / ExpHourTo | datetime | Khung giờ kỳ vọng |

### Tăng ca (OT)
| Field | Type | Mô tả |
|-------|------|-------|
| NormalOTTypeID | uniqueidentifier | → Cat_OvertimeType |
| WeekendOTTypeID | uniqueidentifier | → Cat_OvertimeType |
| HolidayOTTypeID | uniqueidentifier | → Cat_OvertimeType |
| NightNormalOTTypeID | uniqueidentifier | → Cat_OvertimeType |
| NightWeekendOTTypeID | uniqueidentifier | → Cat_OvertimeType |
| NightHolidayOTTypeID | uniqueidentifier | → Cat_OvertimeType |
| IsFixedOTType | bit | Cố định loại OT |
| IsReceiveOvertimeBonus | bit | Có nhận thưởng OT |
| IsReceiveNightShiftBonus | bit | Có nhận thưởng ca đêm |

### Nghỉ phép
| Field | Type | Mô tả |
|-------|------|-------|
| TotalDayAnnualLeaveOnYear | Float | Tổng phép năm |
| Seniority | Float | Thâm niên |
| FormulaAnnualLeave | varchar(500) | Công thức tính phép |
| IsFixedLeave / IsActualLeave / IsRosterLeave / IsFormulaLeave | bit | Phương pháp tính nghỉ phép |

### Bảo hiểm
| Field | Type | Mô tả |
|-------|------|-------|
| HealthInsCompRate / EmpRate | Float | Tỷ lệ BHYT doanh nghiệp / NV |
| SocialInsCompRate / EmpRate | Float | Tỷ lệ BHXH doanh nghiệp / NV |
| UnemployInsCompRate / EmpRate | Float | Tỷ lệ BHTN doanh nghiệp / NV |

### Trừ công
| Field | Type | Mô tả |
|-------|------|-------|
| IsDeductInLateOutEarly | bit | Trừ công khi đi trễ / về sớm |
| IsDeductAbsenteesmDay | bit | Trừ ngày vắng |
| IsLateEarlyRounding | bit | Làm tròn đi trễ/về sớm |
| MinWorkDay | Int | Số ngày làm tối thiểu |

### Phương pháp tính OT
| Field | Mô tả |
|-------|-------|
| IsFixedOT | Cố định |
| IsActualOT | Thực tế |
| IsRosterOT | Theo lịch |
| IsFormulaOT | Theo công thức |

### Ca làm việc mặc định theo ngày
| Field | Mô tả |
|-------|-------|
| WorkOnMondayID → WorkOnSundayID | Ca mặc định từ thứ 2 đến chủ nhật |

### Kỳ lương
| Field | Mô tả |
|-------|-------|
| IsMonthlyCutOff | Chốt công theo tháng |
| IsDurationCutOff | Chốt công theo kỳ |
| IsMonthlyMidCutOff | Chốt giữa tháng |
| MidCutOffDay | Ngày chốt giữa tháng |
