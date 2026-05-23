---
type: source
code: f14r
tags:
  - "rca"
  - "ins"
  - "nghi14ngay"
  - "formula14dayins"
  - "quickpack"
  - "pdca"
  - "bug"
domain: ins
created: 2026-05-04
updated: 2026-05-04
ticket: INS_BUG_QPVN2596
task_id: "3831226"
task_url: "https://amisapp.misa.vn/task/project?Type=2&ProjectID=85345&DepartmentID=62436&companyCode=1O4AZTLN&taskID=3831226"
related:
  - "[[wiki/bugs/Ins026-nghi14ngay-total-days-qpvn]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
description: "RCA và PDCA bug Formula14DayIns tại QuickPack QPVN 2026: màn hình phân tích BH không hiển thị TotalSickleave và TotalUnpaidLeave."
---

# Source: INS-RCA-Formula14Day-TotalSickUnpaid — RCA + PDCA Nghỉ 14 Ngày (QPVN 2026)

## Tóm tắt

Tài liệu phân tích nguyên nhân gốc rễ (RCA) và kế hoạch hành động (PDCA) cho bug `INS_BUG_QPVN2596` tại Golive QuickPack QPVN — tháng 05/2026. Màn hình **Phân tích Bảo hiểm** không hiển thị `TotalSickleaveDays` và `TotalUnpaidLeaveDays` khi chế độ lương cấu hình `Formula14DayIns`. Phân tích xác định đây là **giới hạn thiết kế** của `Calculate14DayFomular()` — hàm này chỉ phán định đủ/không đủ 14 ngày, chưa được thiết kế để phân loại loại nghỉ. Workaround: xóa `Formula14DayIns`. Fix lâu dài: modify code bổ sung phân loại.

## Key Takeaways

- **Hai chế độ đếm nghỉ 14 ngày** trong `InsuranceServices.cs`:
  - **Chế độ 1 (Day-by-Day)**: `Formula14DayIns = NULL` → vòng `for` từng ngày, join `Cat_LeaveDayType.InsuranceType` → phân loại đúng `TotalSickleaveDays` / `TotalUnpaidLeaveDays`
  - **Chế độ 2 (Công thức)**: `Formula14DayIns ≠ NULL` → gọi `Calculate14DayFomular()` → chỉ trả về `countLeave` (tổng ngày) → **không gán 2 field loại nghỉ → luôn = 0**
- **Root cause**: `Calculate14DayFomular()` được thiết kế cho bài toán phán định (boolean), chưa mở rộng cho bài toán đo lường (phân loại loại nghỉ). Đây là **giới hạn thiết kế, không phải bug logic**.
- **Tại sao Golive ≠ UAT**: QPVN Golive có `Formula14DayIns` trong `Cat_GradePayroll` → Chế độ 2; UAT không có → Chế độ 1 → hiển thị đúng.
- **Phân loại nghỉ ốm vs không lương** dựa vào `Cat_LeaveDayType.InsuranceType`:
  - `sickTypes` = `{E_SICK_SHORT, E_SICK_CHILD, E_SICK_LONG}` → `TotalSickleaveDays`
  - Còn lại (`IsInsuranceLeave = true` nhưng không thuộc sickTypes) → `TotalUnpaidLeaveDays`
- **Workaround**: Xóa `Formula14DayIns` trong `Cat_GradePayroll` → hệ thống chuyển Chế độ 1 → fix ngay, không deploy code.
- **Fix lâu dài (PA1)**: Modify `Calculate14DayFomular()` bổ sung logic join `Cat_LeaveDayType` để gán đủ 2 field.

## PDCA tóm tắt

| Ô | Hành động chính |
|---|----------------|
| **Plan** | Kiểm tra Formula14DayIns Golive, confirm KH, raise task modify |
| **Do** | Xóa Formula14DayIns, phân tích lại BH T1/2026, verify 2 cột |
| **Check** | So sánh Golive vs UAT, verify tính lương sau phân tích lại |
| **Act** | Bổ sung checklist onboarding KH, modify Calculate14DayFomular(), thêm test case QC |

## Trích dẫn quan trọng

> **Root cause**: `Calculate14DayFomular()` được thiết kế cho bài toán phán định (đủ/không đủ 14 ngày), chưa được mở rộng để giải bài toán đo lường (phân loại loại nghỉ). Hai nhánh dùng chung điều kiện kích hoạt nhưng nhánh công thức thiếu bước phân loại `InsuranceType`.

> Khi dùng `Formula14DayIns`, hệ thống chỉ biết NV có nghỉ ≥14 ngày hay không — **không xác định được nghỉ ốm hay nghỉ không lương**. Đây là trade-off thiết kế cần tư vấn KH trước khi cấu hình.

> **Golive ≠ UAT về 2 cột ngày nghỉ** → kiểm tra `Cat_GradePayroll.Formula14DayIns` trước tiên, không phải config BH (`Sys_InsConfig`).

> Bổ sung checklist onboarding KH: *"Nếu dùng `Formula14DayIns`, `TotalSickleaveDays` / `TotalUnpaidLeaveDays` sẽ = 0 — tư vấn trước khi cấu hình."*

## SQL kiểm tra nhanh

```sql
-- Kiểm tra grade nào đang có Formula14DayIns
SELECT * FROM Cat_GradePayroll
WHERE Formula14DayIns IS NOT NULL AND Formula14DayIns <> ''

-- Fix workaround: xóa công thức (confirm KH trước khi chạy)
UPDATE Cat_GradePayroll
SET Formula14DayIns = NULL
WHERE Formula14DayIns IS NOT NULL AND Formula14DayIns <> ''
```

## Liên kết

- [[wiki/bugs/Ins026-nghi14ngay-total-days-qpvn]] — Bug entry chính (status: resolved)
- [[wiki/sources/INS-Nghi14Ngay]] — Kỹ thuật 2 chế độ đếm ngày nghỉ 14 ngày
- [[wiki/sources/INS-Config-FAQ]] — Nhóm config "Nghỉ ≥14 Ngày", Formula14DayIns
- [[wiki/projects/QuickPack-Project]] — Dự án QPVN Golive 01/12/2025
- [[wiki/flows/Flow-BaoHiem-Monthly]] — Luồng phân tích BH hàng tháng
