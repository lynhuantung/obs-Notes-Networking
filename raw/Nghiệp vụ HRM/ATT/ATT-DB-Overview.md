---
title: "ATT – DB Overview (các bảng chấm công)"
date: 2026-05-09
code: att-db-overview
domain: att
module: Attendance / Database
tags:
  - att
  - database
  - schema
verified: yes
related:
  - "[[ATT-Overview]]"
  - "[[ATT-DB-CatGradeCfg]]"
  - "[[ATT-DB-AttAnnualLeave]]"
  - "[[ATT-DB-AttAnnualDetail]]"
  - "[[ATT-DB-AttAttendanceTable]]"
  - "[[ATT-DB-AttAttendanceTableItem]]"
---

# ATT – DB Overview (các bảng chấm công)

## Danh sách bảng chính

| STT | Tên bảng | Mô tả |
|-----|----------|-------|
| 1 | Cat_GradeCfg | Chế độ công / bậc lương |
| 2 | Att_AnnualLeave | Phép năm tổng hợp theo năm |
| 3 | Att_AnnualDetail | Chi tiết phép năm theo tháng |
| 4 | Att_AttendanceTable | Bảng công tổng hợp tháng |
| 5 | Att_AttendanceTableItem | Bảng công chi tiết từng ngày |

## Quan hệ giữa các bảng

```
Hre_Profile (nhân viên)
  ├── Att_AnnualLeave (phép năm)
  │     └── Att_AnnualDetail (chi tiết phép tháng)
  └── Att_AttendanceTable (bảng công tháng)
        └── Att_AttendanceTableItem (bảng công ngày)
              ├── Cat_Shift (ca làm việc)
              ├── Cat_LeaveDayType (loại nghỉ)
              └── Cat_OvertimeType (loại OT)

Cat_GradeCfg (chế độ công)
  ├── Cat_OvertimeType (loại OT)
  └── Cat_GradeAttendance (bậc chấm công)
```

Chi tiết schema từng bảng xem tại các ghi chú riêng.
