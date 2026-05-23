---
description: "Bug INS026: Phân tích BH không hiển thị tổng ngày nghỉ ốm/không lương trong module QPVN Golive, đã giải quyết."
type: bug
code: q2vn
status: resolved
tags:
  - "bug"
  - "ins"
  - "nghi14ngay"
  - "phan-tich-bh"
  - "quickpack"
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
---

## Ins026 — Phân tích BH không hiển thị tổng ngày nghỉ ốm / không lương (QPVN Golive)

- **Status**: `resolved`
- **Ticket**: INS_BUG_QPVN2596
- **Date**: 2026-05-02
- **Affected**: Màn hình Phân tích Bảo hiểm — Golive QPVN; UAT và môi trường nhà không bị ảnh hưởng

### Hiện trạng

- Lọc Tháng 1/2026 + loại giảm "Nghỉ 14 ngày" → Tìm kiếm
- Cột **Tổng số ngày nghỉ không lương** và **Tổng số ngày nghỉ ốm** = trống / = 0
- UAT và link nhà hiển thị đúng giá trị

### Nguyên nhân (Root Cause)

`InsuranceServices.cs` có **2 chế độ đếm ngày nghỉ 14 ngày**:

| | Chế độ 1: Day-by-Day | Chế độ 2: Công thức |
|---|---|---|
| **Điều kiện** | `Cat_GradePayroll.Formula14DayIns` = null/rỗng | `Formula14DayIns` ≠ null |
| **Cơ chế** | Vòng `for` từng ngày, phân loại `sickLeaveCount` / `unPaidLeaveCount` | Gọi `Calculate14DayFomular()` — chỉ trả về 0/1 (đủ/không đủ 14 ngày) |
| **TotalSickleaveDays** | ✅ Có giá trị | ❌ Luôn = 0 |
| **TotalUnpaidLeaveDays** | ✅ Có giá trị | ❌ Luôn = 0 |

**Golive QPVN** cấu hình `Formula14DayIns` trong chế độ lương → rơi vào Chế độ 2 → hệ thống chỉ biết NV có nghỉ ≥14 ngày, không xác định được loại nghỉ → hai cột = 0.

**UAT/nhà** không có `Formula14DayIns` → Chế độ 1 → đếm đúng từng loại.

### Khắc phục

Kiểm tra và xóa giá trị `Formula14DayIns` trong `Cat_GradePayroll` trên Golive:

```sql
-- Kiểm tra
SELECT GradePayrollCode, Formula14DayIns
FROM Cat_GradePayroll
WHERE Formula14DayIns IS NOT NULL AND Formula14DayIns <> ''

-- Fix: xóa công thức để hệ thống dùng chế độ đếm từng ngày
UPDATE Cat_GradePayroll
SET Formula14DayIns = NULL
WHERE ... -- điều kiện cụ thể
```

Sau đó phân tích lại BH tháng bị lỗi.

### Bài học

> **Khi Golive ≠ UAT về hiển thị tổng ngày nghỉ 14 ngày**: đầu tiên kiểm tra `Cat_GradePayroll.Formula14DayIns` giữa 2 môi trường — đây là nguyên nhân phổ biến nhất, không phải config BH (`Sys_InsConfig`).

> **Giới hạn của công thức nghỉ 14 ngày**: Khi dùng `Formula14DayIns`, hệ thống chỉ phán định được "đủ/không đủ 14 ngày" — **không xác định được nghỉ ốm hay nghỉ không lương**. Đây là trade-off thiết kế cần tư vấn KH trước khi cấu hình công thức.

> **Không nhầm với config BH**: `HRM_INS_CONFIG_INSLEAVE14DAYTYPE` (nguồn dữ liệu) và `HRM_INS_CONFIG_ISATTENDANCETABLEFOR14DAY` (bảng công) đều nằm trong Chế độ 1 — vô hiệu khi đã dùng công thức.

### Links

- Nghiệp vụ: [[wiki/sources/INS-Nghi14Ngay]] — section kỹ thuật "Hai chế độ đếm"
- Config: [[wiki/sources/INS-Config-FAQ]] — nhóm "Nghỉ >= 14 Ngày"
- Dự án: [[wiki/projects/QuickPack-Project]]
- Luồng: [[wiki/flows/Flow-BaoHiem-Monthly]]
