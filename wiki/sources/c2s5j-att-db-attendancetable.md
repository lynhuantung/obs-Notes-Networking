---
type: source
code: c2s5j
description: "Schema Att_AttendanceTable: bảng công tổng hợp tháng — StdWorkDayCount, PaidWorkDayCount, 6 loại nghỉ, 9 loại OT, đi trễ/về sớm, ca đêm, thai sản"
domain: att
tags:
  - att
  - database
  - schema
  - bang-cong
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/architecture/ATT-Database-Schema]]"
  - "[[wiki/sources/b5f9g-att-db-overview]]"
  - "[[wiki/sources/z8h4l-att-db-attendancetableitem]]"
  - "[[wiki/sources/m4b8z-att-cong-cong-tru]]"
---

# Source: ATT – DB Att_AttendanceTable (Bảng công tháng)

## Tóm tắt

Schema bảng `Att_AttendanceTable` — bảng trung tâm phân hệ chấm công, lưu toàn bộ kết quả sau khi tính công theo tháng. Được sinh ra ở bước 5 của quy trình 8 bước tính công. Quan hệ 1-N với Att_AttendanceTableItem (bảng công ngày).

## Key Takeaways

- **Ngày công**: StdWorkDayCount, RealWorkDayCount, PaidWorkDayCount, UnPaidLeave
- **Nghỉ phép**: AnlDayTaken, AnlDayAvailable, SickDayTaken/Available — theo dõi phép năm và phép bệnh
- **Loại nghỉ**: LeaveDay1Type → LeaveDay6Type (6 loại nghỉ với Hours và Days)
- **Tăng ca**: Overtime1Type → Overtime9Type (9 loại OT) + OvertimeOFF1Type → OvertimeOFF8Type (8 loại OT bù)
- **Đi trễ/về sớm**: LateEarlyDeductionHours, LateCount, EarlyCount, CardMissingCount
- **Ca đêm & thai sản**: NightShiftHours, OTPregnancyHours, IsWomanPolicy
- **Phê duyệt**: UserRegister/DateRegister, UserApprove/DateApprove
- **Liên kết tổ chức**: OrgStructureID, PositionID, CostCentreID, GradeAttendanceID, SalGradeID

## Trích dẫn quan trọng

> Bảng công tổng hợp theo tháng của nhân viên. Là bảng trung tâm của phân hệ chấm công, lưu toàn bộ kết quả sau khi tính công.

## Liên kết

- [[wiki/sources/z8h4l-att-db-attendancetableitem]] — bảng công chi tiết ngày
- [[wiki/sources/m4b8z-att-cong-cong-tru]] — nghiệp vụ công cộng/trừ map vào các field này
- [[wiki/architecture/ATT-Database-Schema]] — diagram tổng thể
