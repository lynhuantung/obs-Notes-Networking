---
type: source
code: b5f9g
description: "DB Overview phân hệ ATT: 5 bảng chính (Cat_GradeCfg, Att_AnnualLeave, Att_AnnualDetail, Att_AttendanceTable, Att_AttendanceTableItem) và quan hệ giữa các bảng"
domain: att
tags:
  - att
  - database
  - schema
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/architecture/ATT-Database-Schema]]"
  - "[[wiki/sources/p1a3t-att-overview]]"
---

# Source: ATT – DB Overview (các bảng chấm công)

## Tóm tắt

Tài liệu tổng quan 5 bảng database chính của phân hệ ATT trong HRM Pro 8. Mô tả tên bảng, chức năng, và quan hệ phân cấp từ Hre_Profile → bảng công tháng → bảng công ngày. Là bản đồ điều hướng trước khi đọc schema chi tiết từng bảng.

## Key Takeaways

- 5 bảng chính: Cat_GradeCfg, Att_AnnualLeave, Att_AnnualDetail, Att_AttendanceTable, Att_AttendanceTableItem
- Quan hệ phân cấp: Hre_Profile → AnnualLeave → AnnualDetail (phép năm); Hre_Profile → AttendanceTable → AttendanceTableItem (bảng công)
- AttendanceTableItem phụ thuộc 3 catalog: Cat_Shift, Cat_LeaveDayType, Cat_OvertimeType
- Cat_GradeCfg → Cat_OvertimeType và Cat_GradeAttendance (cấu hình chế độ công)

## Trích dẫn quan trọng

```
Hre_Profile (nhân viên)
  ├── Att_AnnualLeave (phép năm)
  │     └── Att_AnnualDetail (chi tiết phép tháng)
  └── Att_AttendanceTable (bảng công tháng)
        └── Att_AttendanceTableItem (bảng công ngày)
              ├── Cat_Shift (ca làm việc)
              ├── Cat_LeaveDayType (loại nghỉ)
              └── Cat_OvertimeType (loại OT)
```

## Liên kết

- [[wiki/architecture/ATT-Database-Schema]] — schema chi tiết từng bảng
