---
type: source
code: z8h4l
description: "Schema Att_AttendanceTableItem: bảng công chi tiết ngày — giờ vào/ra, ca làm, WorkHours, OT, nghỉ phép, đi trễ, thai sản, pre-compute tiền lương"
domain: att
tags:
  - att
  - database
  - schema
  - bang-cong
  - chi-tiet-ngay
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/architecture/ATT-Database-Schema]]"
  - "[[wiki/sources/b5f9g-att-db-overview]]"
  - "[[wiki/sources/c2s5j-att-db-attendancetable]]"
  - "[[wiki/sources/w3t6p-att-luat-tang-ca]]"
---

# Source: ATT – DB Att_AttendanceTableItem (Bảng công ngày)

## Tóm tắt

Schema bảng `Att_AttendanceTableItem` — bảng ghi nhận dữ liệu chấm công đã xử lý theo từng ngày của nhân viên. Là bảng chi tiết nhất trong phân hệ ATT, chứa đầy đủ thông tin giờ vào/ra, ca làm, OT, nghỉ phép, vi phạm, và cả pre-compute tiền lương. FK quan trọng: AttendanceTableID → Att_AttendanceTable.

## Key Takeaways

- **Giờ chấm công**: FirstInTime, LastOutTime, RootInTime/RootOutTime (gốc từ máy)
- **Ca làm việc**: ShiftID, Shift2ID (hỗ trợ đa ca), AvailableHours per ca
- **Giờ làm**: WorkHours, WorkPaidHours, ActualWorkHour, NightShiftHours, TotalActualWorkHour
- **Nghỉ phép**: LeaveTypeID + LeaveHours/Days, ExtraLeaveTypeID(1–6) cho nhiều loại nghỉ phụ, UnpaidLeaveHours/Days
- **OT**: OvertimeTypeID + OvertimeHours (chính), ExtraOvertimeTypeID(1–4) (phụ), OvertimeOFFTypeID(1–3) (bù nghỉ), OTPregnancyHours
- **Đi trễ/về sớm**: LateInMinutes, EarlyOutMinutes, RealLateEarlyMinutes, CountMissInOut
- **Thai sản**: IsHavingPregTreatment, PregnancyType, PregnancyIsNotSubmitDoc
- **Pre-compute lương**: StdAmountSalary, DayAmountSalary, NightAmountSalary, OT1–OT6AmountSalary

## Trích dẫn quan trọng

> Bảng công chi tiết từng ngày của nhân viên. Là bảng ghi nhận dữ liệu chấm công thô sau xử lý: giờ vào/ra, ca làm, OT, nghỉ phép, vi phạm.

## Liên kết

- [[wiki/sources/c2s5j-att-db-attendancetable]] — bảng cha tổng hợp tháng
- [[wiki/sources/w3t6p-att-luat-tang-ca]] — hệ số OT map vào ExtraOvertimeTypeID
- [[wiki/architecture/ATT-Database-Schema]] — diagram tổng thể
