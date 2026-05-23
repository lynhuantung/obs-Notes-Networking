---
title: "ATT – DB Att_AttendanceTable (Bảng công tháng)"
date: 2026-05-09
code: att-db-attendancetable
domain: att
module: Attendance / Database
tags:
  - att
  - database
  - schema
  - bang-cong
verified: yes
related:
  - "[[ATT-DB-Overview]]"
  - "[[ATT-DB-AttAttendanceTableItem]]"
  - "[[ATT-CongCongCongTru]]"
---

# ATT – DB Att_AttendanceTable

## Mô tả

Bảng công tổng hợp theo tháng của nhân viên. Là bảng trung tâm của phân hệ chấm công, lưu toàn bộ kết quả sau khi tính công.

## Schema chính theo nhóm

### Thông tin cơ bản
| Field | Type | FK | Mô tả |
|-------|------|----|-------|
| ID | uniqueidentifier | | PK |
| MonthYear | Datetime | | Tháng công |
| ProfileID | uniqueidentifier | Hre_Profile | Nhân viên |
| CutOffDurationID | uniqueidentifier | Att_CutOffDuration | Kỳ chốt công |
| Status | nvarchar(50) | | Trạng thái bảng công |
| DateStart / DateEnd | datetime | | Khoảng thời gian bảng công |

### Ngày công
| Field | Mô tả |
|-------|-------|
| StdWorkDayCount | Số công chuẩn |
| RealWorkDayCount | Số công thực tế |
| PaidWorkDayCount | Số công hưởng lương |
| TotalRealWorkDayCount | Tổng công thực tế |
| TotalPaidWorkDayCount | Tổng công hưởng lương |
| AdWorkDayCount / BackWorkDayCount | Công thêm / bù |
| HourPerDay | Số giờ/ngày |
| UnPaidLeave | Số ngày nghỉ không lương |

### Nghỉ phép
| Field | Mô tả |
|-------|-------|
| AnlDayTaken | Số phép đã nghỉ |
| AnlDayAvailable | Số phép còn lại |
| TotalAnlDayAvailable | Tổng phép năm |
| SickDayTaken / SickDayAvailable | Phép bệnh |
| AnlDayAdjacent / SickDayAdjacent | Phép liền kề |
| AnlDayReset | Phép reset |
| PaidLeaveDays | Ngày nghỉ hưởng lương |

### Loại nghỉ (đến 6 loại)
| Field | FK |
|-------|---|
| LeaveDay1Type → LeaveDay6Type | Cat_LeaveDayType |
| LeaveDay1Hours → LeaveDay6Hours | Float |
| LeaveDay1Days → LeaveDay6Days | Float |

### Tăng ca (đến 9 loại OT + 8 loại OT bù)
| Field | FK |
|-------|---|
| Overtime1Type → Overtime9Type | Cat_OvertimeType |
| Overtime1Hours → Overtime9Hours | Float |
| OvertimeOFF1Type → OvertimeOFF8Type | Cat_OvertimeType (nghỉ bù OT) |

### Đi trễ / về sớm
| Field | Mô tả |
|-------|-------|
| LateEarlyDeductionHours | Giờ trừ do đi trễ/về sớm |
| LateEarlyLeastCount | Số lần đi trễ/về sớm nhẹ |
| LateEarlyGreaterCount | Số lần đi trễ/về sớm nặng |
| LateEarlyTotal | Tổng đi trễ/về sớm |
| LateCount / EarlyCount | Số lần trễ / về sớm |
| CardMissingCount | Số lần quên chấm công |
| TotalMissInOut | Tổng lần thiếu in/out |

### Ca đêm & thai sản
| Field | Mô tả |
|-------|-------|
| NightShiftHours | Giờ ca đêm |
| OTNightShiftHours | OT ca đêm |
| OTPregnancyHours | OT thai sản |
| IsWomanPolicy | Áp dụng chính sách nữ |

### Phê duyệt
| Field | Mô tả |
|-------|-------|
| UserRegister / DateRegister | Người / ngày đăng ký |
| UserApprove / DateApprove | Người / ngày duyệt |

### Liên kết tổ chức
| Field | FK |
|-------|---|
| OrgStructureID | Cat_OrgStructure |
| PositionID | Cat_Position |
| JobTitleID | - |
| PayrollGroupID | - |
| CostCentreID | Cat_CostCentre |
| GradeAttendanceID | Cat_GradeAttendance |
| SalGradeID | Cat_GradeCfg |

## Quan hệ

```
Att_AttendanceTable (1) → (N) Att_AttendanceTableItem
```
