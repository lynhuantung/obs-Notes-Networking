---
title: "ATT – DB Att_AttendanceTableItem (Bảng công ngày)"
date: 2026-05-09
code: att-db-attendancetableitem
domain: att
module: Attendance / Database
tags:
  - att
  - database
  - schema
  - bang-cong
  - chi-tiet-ngay
verified: yes
related:
  - "[[ATT-DB-Overview]]"
  - "[[ATT-DB-AttAttendanceTable]]"
  - "[[ATT-CongCongCongTru]]"
  - "[[ATT-LuatTangCa]]"
---

# ATT – DB Att_AttendanceTableItem

## Mô tả

Bảng công chi tiết từng ngày của nhân viên. Là bảng ghi nhận dữ liệu chấm công thô sau xử lý: giờ vào/ra, ca làm, OT, nghỉ phép, vi phạm.

## Schema chính theo nhóm

### Thông tin cơ bản
| Field | Type | FK | Mô tả |
|-------|------|----|-------|
| ID | uniqueidentifier | | PK |
| AttendanceTableID | uniqueidentifier | Att_AttendanceTable | Bảng công tháng |
| WorkDate | datetime | | Ngày làm việc |
| DutyCode | nvarchar(50) | | Mã nghĩa vụ |
| Type | varchar(32) | | Loại bản ghi |
| IsHoliday | bit | | Ngày lễ |
| IsExpired | bit | | Đã hết hạn |

### Giờ chấm công thực tế
| Field | Mô tả |
|-------|-------|
| FirstInTime | Giờ vào đầu tiên |
| LastOutTime | Giờ ra cuối cùng |
| RootInTime / RootOutTime | Giờ gốc từ máy |

### Ca làm việc
| Field | FK | Mô tả |
|-------|---|-------|
| ShiftID | Cat_Shift | Ca chính |
| Shift2ID | Cat_Shift | Ca thứ 2 (nếu đa ca) |
| AvailableHours | float | Giờ theo ca |
| AvailableHoursShift1 / 2 | float | Giờ theo từng ca |

### Giờ làm việc
| Field | Mô tả |
|-------|-------|
| WorkHours | Giờ làm thực tế |
| WorkPaidHours | Giờ hưởng lương |
| ActualWorkHour | Giờ làm thực tế (xử lý) |
| NightShiftHours | Giờ ca đêm |
| OTNightShiftHours | Giờ OT ca đêm |
| TotalActualWorkHour | Tổng giờ làm |

### Nghỉ phép
| Field | FK | Mô tả |
|-------|---|-------|
| LeaveTypeID | Cat_LeaveDayType | Loại nghỉ chính |
| LeaveHours / LeaveDays | float | Số giờ / ngày nghỉ |
| ExtraLeaveTypeID (1–6) | Cat_LeaveDayType | Loại nghỉ phụ |
| ExtraLeaveHours (1–6) | float | Số giờ nghỉ phụ |
| UnpaidLeaveHours / Days | float | Nghỉ không lương |
| PaidLeaveHours / Days | float | Nghỉ hưởng lương |
| LeaveWorkDayType | Cat_LeaveDayType | Nghỉ ngày làm |

### Tăng ca (OT)
| Field | FK | Mô tả |
|-------|---|-------|
| OvertimeTypeID | Cat_OvertimeType | Loại OT chính |
| OvertimeHours | float | Số giờ OT |
| OvertimeDurationType | nvarchar(50) | Kỳ OT |
| ExtraOvertimeTypeID (1–4) | Cat_OvertimeType | OT phụ |
| ExtraOvertimeHours (1–4) | float | Giờ OT phụ |
| OvertimeOFFTypeID (1–3) | Cat_OvertimeType | OT bù nghỉ |
| OTPregnancyHours | float | OT thai sản |
| OvertimeRegisterHours | float | Giờ đăng ký OT |

### Đi trễ / về sớm
| Field | Mô tả |
|-------|-------|
| LateEarlyMinutes | Phút đi trễ/về sớm |
| LateInMinutes | Phút đi trễ |
| EarlyOutMinutes | Phút về sớm |
| EarlyInMinutes | Phút vào sớm |
| LateOutMinutes | Phút ra trễ |
| RealLateEarlyMinutes | Phút thực tế |
| LateEarlyCount / LateCount / EarlyCount | Số lần vi phạm |
| LateEarlyMinutes2 | Phút tính lần 2 |
| CountMissInOut | Số lần thiếu in/out |

### Thai sản
| Field | Mô tả |
|-------|-------|
| IsHavingPregTreatment | Đang điều trị thai sản |
| PregnancyType | Loại thai sản |
| PregnancyIsNotSubmitDoc | Chưa nộp chứng từ |
| WorkPaidHourNonPreg | Giờ hưởng lương không tính thai sản |

### Tính tiền lương (pre-compute)
| Field | Mô tả |
|-------|-------|
| StdAmountSalary | Tiền lương chuẩn |
| DayAmountSalary | Tiền lương ngày |
| NightAmountSalary | Tiền ca đêm |
| OT1–OT6AmountSalary | Tiền OT từng loại |

### Liên kết tổ chức
| Field | FK |
|-------|---|
| OrgstructureID | Cat_OrgStructure |
| PositionID | Cat_Position |
| ShopID | Cat_Shop |
| CostCentreID | Cat_CostCentre |
| GradeAttendanceID | Cat_GradeAttendance |
