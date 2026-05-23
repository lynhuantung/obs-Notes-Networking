---
type: source
code: f3g6r
description: "Schema Cat_GradeCfg: bảng cấu hình chế độ công/bậc lương — OT types, phép năm, bảo hiểm, trừ công, ca mặc định theo ngày, kỳ lương"
domain: att
tags:
  - att
  - database
  - schema
  - grade-cfg
  - config
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/architecture/ATT-Database-Schema]]"
  - "[[wiki/sources/b5f9g-att-db-overview]]"
  - "[[wiki/sources/k9v2x-att-du-lieu-tinh-cong]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
---

# Source: ATT – DB Cat_GradeCfg (Chế độ công)

## Tóm tắt

Schema bảng `Cat_GradeCfg` — bảng cấu hình chế độ công / bậc lương trong HRM Pro 8. Quyết định cách tính công, OT, nghỉ phép và bảo hiểm cho từng nhóm nhân viên. Là bảng catalog quan trọng bậc nhất: mọi nhân viên đều phải được gán Cat_GradeCfg để tính công chính xác.

## Key Takeaways

- **Thời gian làm việc**: WorkingTimeType, HourOnWorkDate (giờ/ngày), ExpHourFrom/To (khung giờ kỳ vọng)
- **OT types**: 6 loại FK → Cat_OvertimeType (ngày thường/nghỉ/lễ × ngày/đêm), IsFixedOTType
- **Nghỉ phép**: TotalDayAnnualLeaveOnYear, FormulaAnnualLeave — 4 phương pháp: Fixed/Actual/Roster/Formula
- **Bảo hiểm**: tỷ lệ BHYT/BHXH/BHTN cho doanh nghiệp và NV — là nguồn cấu hình cho phân hệ INS
- **Trừ công**: IsDeductInLateOutEarly (trừ công đi trễ/về sớm), IsDeductAbsenteesmDay, MinWorkDay
- **Ca mặc định**: WorkOnMondayID → WorkOnSundayID (ca theo từng ngày trong tuần)
- **Kỳ lương**: IsMonthlyCutOff, IsDurationCutOff, IsMonthlyMidCutOff, MidCutOffDay
- **OT methods**: IsFixedOT / IsActualOT / IsRosterOT / IsFormulaOT

## Trích dẫn quan trọng

> Bảng cấu hình chế độ công / bậc lương. Quyết định cách tính công, OT, nghỉ phép, bảo hiểm cho từng nhóm nhân viên.

## Liên kết

- [[wiki/architecture/ATT-Database-Schema]] — vị trí trong tổng thể schema
- [[wiki/architecture/INS-Database-Schema]] — tỷ lệ BH trong Cat_GradeCfg cũng ảnh hưởng phân hệ INS
- [[wiki/sources/k9v2x-att-du-lieu-tinh-cong]] — "Chế độ công" là nhóm dữ liệu #1 trong tính công
