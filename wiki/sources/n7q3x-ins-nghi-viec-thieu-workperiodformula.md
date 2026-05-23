---
type: source
code: n7q3x
description: "Config case: NV nghỉ việc tháng N bị báo tháng N+1 do chế độ công thiếu WorkPeriodFormula khiến CalculateNumberOfDayByFormula trả về 0."
domain: ins
tags:
  - ins
  - nghi-viec
  - config
  - 14-ngay
  - WorkPeriodFormula
  - CalculateNumberOfDayByFormula
  - golive
created: 2026-05-12
updated: 2026-05-12
source-file: "raw/Nghiệp vụ HRM/INS/2026-05-12-ins-nghi-viec-dau-thang-roster-rong.md"
related:
  - "[[wiki/sources/INS-FAQ-NghiViecTrongKy]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]]"
  - "[[wiki/glossary/HRM-Glossary]]"
---

# Source: INS — NV nghỉ việc tháng N bị báo tháng N+1 (Thiếu WorkPeriodFormula)

## Tóm tắt

Case phát sinh lúc golive: NV ST2416 có `DateQuit` tháng 4/2026 nhưng phân tích BH tháng 4 sinh dòng đóng BH bình thường, tháng 5 mới báo `IsQuit=true`. Sau điều tra, xác định nguyên nhân là **lỗi config**: `Cat_GradeAttendance.WorkPeriodFormula` chưa được cấu hình trong chế độ công → hàm `CalculateNumberOfDayByFormula` trả về 0 ngày nghỉ → 0 < 14 → config `isCheck14dayProfileQuitNextMonth = ON` kích hoạt logic 2 dòng. Fix đơn giản: cấu hình đúng công thức trong chế độ công, không cần sửa code.

## Key Takeaways

- **Đây là lỗi config, không phải bug code** — `InsuranceServices` hoạt động đúng logic, nhưng thiếu dữ liệu đầu vào (`WorkPeriodFormula`) khiến kết quả sai.
- **Chuỗi nhân quả**: `WorkPeriodFormula` rỗng → `CalculateNumberOfDayByFormula` = 0 → 0 < ngưỡng 14 → config ON kích hoạt 2 dòng → T4 đóng BH + T5 `IsQuit`.
- **Config `isCheck14dayProfileQuitNextMonth`** điều khiển toàn bộ hành vi: OFF = luôn báo `IsQuit` tháng có `DateQuit`; ON = phụ thuộc số ngày nghỉ tính được.
- **Checklist debug** khi BH báo nghỉ việc sai tháng: (1) kiểm tra `isCheck14dayProfileQuitNextMonth`, (2) kiểm tra `Cat_GradeAttendance.WorkPeriodFormula` có giá trị không, (3) nếu rỗng → cấu hình → phân tích lại.
- **Pattern tổng quát**: bất kỳ NV nào bị báo nghỉ việc T+1 thay vì T → nghi ngờ ngay `WorkPeriodFormula` chưa cấu hình.

## Trích dẫn quan trọng

> **Root Cause**: Chế độ công chưa cấu hình `WorkPeriodFormula` → `CalculateNumberOfDayByFormula` trả về 0 ngày nghỉ → 0 < 14 → config `isCheck14dayProfileQuitNextMonth = ON` sinh 2 dòng: T4 đóng BH + T5 `IsQuit=true`.

> **Fix**: Vào Danh mục > Chế độ công → cấu hình `WorkPeriodFormula` = `[D]-[SUN]-[SAT]` (hoặc công thức phù hợp lịch làm việc) → phân tích lại BH. Không cần sửa code.

> **Kiểm tra config trước khi nghi code** — nguyên tắc debug BH: lỗi config chiếm phần lớn case "hành vi sai" khi golive.

## Liên kết

- [[wiki/sources/INS-FAQ-NghiViecTrongKy]] — logic 2 dòng D02 khi `isCheck14dayProfileQuitNextMonth = ON`
- [[wiki/sources/INS-Nghi14Ngay]] — 2 chế độ đếm ngày: Formula-based vs Day-by-day, `WorkPeriodFormula`
- [[wiki/sources/INS-Config-FAQ]] — tra cứu đầy đủ `isCheck14dayProfileQuitNextMonth` và các config BH
- [[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]] — case tương tự: nghỉ việc + thai sản cùng tháng
- [[wiki/glossary/HRM-Glossary]] — định nghĩa "nghỉ việc trong kỳ BH", pitfall thiếu WorkPeriodFormula
