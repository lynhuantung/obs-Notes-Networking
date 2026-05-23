---
type: rca
code: ins-rca-f14-01
tags:
  - "rca"
  - "ins"
  - "nghi14ngay"
  - "formula14dayins"
  - "quickpack"
  - "pdca"
domain: ins
created: 2026-05-04
updated: 2026-05-04
ticket: INS_BUG_QPVN2596
task_id: "3831226"
task_url: "https://amisapp.misa.vn/task/project?Type=2&ProjectID=85345&DepartmentID=62436&companyCode=1O4AZTLN&taskID=3831226"
task_title: "[INS_BUG_QPVN2596] Lỗi không đếm được tổng số ngày nghỉ tại màn hình Phân tích bảo hiểm (link Golive)"
project: QuickPack QPVN
author: Tung.Ly
status: workaround-applied
related:
  - "[[wiki/bugs/Ins026-nghi14ngay-total-days-qpvn]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
---

# INS_BUG_QPVN2596 — RCA: TotalSickleaveDays / TotalUnpaidLeaveDays = 0 khi dùng Formula14DayIns

**Ngày:** 04/05/2026 | **Dự án:** QuickPack QPVN | **SE:** Tung.Ly  
**Ticket:** INS_BUG_QPVN2596  
**Môi trường:** Golive QPVN (UAT / nhà không bị ảnh hưởng)

---

## NỘI DUNG

Màn hình Phân tích BH không hiển thị TotalSickleaveDays và TotalUnpaidLeaveDays khi chế độ lương cấu hình Formula14DayIns.

---

## HIỆN TRẠNG

- Lọc Tháng 1/2026 + Loại giảm "Nghỉ 14 ngày" → cột **Tổng ngày nghỉ ốm** và **Tổng ngày nghỉ không lương** = trống.
- UAT và môi trường nhà hiển thị đúng.
- Golive QPVN bị ảnh hưởng do `Cat_GradePayroll.Formula14DayIns` có giá trị.

---

## NGUYÊN NHÂN — PHÂN TÍCH 5 WHYS

**(1) Tại sao 2 cột hiển thị trống?**
→ `TotalSickleaveDays` / `TotalUnpaidLeaveDays` không được gán giá trị trong nhánh xử lý công thức.
`[fact — InsuranceServices.cs ~line 2523]`

**(2) Tại sao không được gán?**
→ Hệ thống kích hoạt `Calculate14DayFomular()` thay vì vòng for day-by-day khi `Formula14DayIns ≠ NULL`. Hàm này chỉ trả về `countLeave` (tổng số ngày) — không gán 2 field loại nghỉ.
`[fact — InsuranceServices.cs ~line 2485, 2523]`

**(3) Tại sao Calculate14DayFomular() không phân loại loại nghỉ?**
→ Hàm được thiết kế chỉ để phán định "đủ/không đủ 14 ngày" — output duy nhất là số nguyên. Chưa có logic join `Cat_LeaveDayType` để lấy `InsuranceType` phân loại ốm / không lương.
`[fact — InsuranceServices.cs ~line 2896-2898]`

**(4) Tại sao chế độ day-by-day lại phân loại được?**
→ Vòng for duyệt từng ngày, join sang `Cat_LeaveDayType.InsuranceType`, so sánh với `sickTypes` {`E_SICK_SHORT`, `E_SICK_CHILD`, `E_SICK_LONG`} → gán đúng `TotalSickleaveDays` / `TotalUnpaidLeaveDays`.
`[fact — InsuranceServices.cs ~line 3275-3283]`

**→ ROOT CAUSE:**
`Calculate14DayFomular()` chưa được thiết kế để lưu chi tiết loại nghỉ. Hai nhánh (day-by-day và công thức) dùng chung điều kiện kích hoạt (`Formula14DayIns != null`) nhưng nhánh công thức thiếu bước phân loại `InsuranceType` → 2 field luôn = 0. **Đây là giới hạn thiết kế, cần modify code.**

---

## PHƯƠNG ÁN

**PA1 — Modify Calculate14DayFomular() ⭐ (dài hạn)**
Bổ sung logic phân loại loại nghỉ theo `Cat_LeaveDayType.InsuranceType` vào nhánh công thức, gán `TotalSickleaveDays` / `TotalUnpaidLeaveDays` tương tự chế độ day-by-day.
- Ưu: giữ được lợi thế công thức, fix đúng bản chất.
- Nhược: cần thời gian dev + test kỹ.

**PA2 — Xóa Formula14DayIns (workaround tạm thời)**
Xóa giá trị `Formula14DayIns` trong `Cat_GradePayroll` → hệ thống tự chuyển sang chế độ day-by-day → hiển thị đúng ngay.
- Ưu: fix được ngay, không cần deploy code.
- Nhược: mất tính toán lương theo công thức nếu KH đang dùng.

**Phương án chọn:** PA2 trước để unblock KH, song song raise task PA1.

```sql
-- Kiểm tra grade nào đang có Formula14DayIns
SELECT * FROM Cat_GradePayroll
WHERE Formula14DayIns IS NOT NULL AND Formula14DayIns <> ''

-- Fix: xóa công thức (confirm KH trước khi chạy)
UPDATE Cat_GradePayroll
SET Formula14DayIns = NULL
WHERE Formula14DayIns IS NOT NULL AND Formula14DayIns <> ''
```

---

## PDCA

### PLAN — Kế hoạch hành động

| STT | What | Who | When | Status |
|-----|------|-----|------|--------|
| 1 | Kiểm tra Formula14DayIns Golive QPVN (query Cat_GradePayroll) | Tung.Ly | 05/05 | New |
| 2 | Confirm KH: xóa Formula14DayIns có ảnh hưởng tính lương không? | Tung.Ly | 05/05 | New |
| 3 | Raise task modify Calculate14DayFomular() bổ sung phân loại loại nghỉ | Tung.Ly | 06/05 | New |
| 4 | Phân tích lại BH T1/2026 sau fix | KH/SE | Sau fix | New |

### DO — Thực hiện

| STT | What | Who | When | Status |
|-----|------|-----|------|--------|
| 1 | Xóa Formula14DayIns trong Cat_GradePayroll (sau confirm KH) | Tung.Ly | 05/05 | New |
| 2 | Phân tích lại BH tháng bị lỗi | KH | 05/05 | New |
| 3 | Verify 2 cột hiển thị đúng | SE/QC | 05/05 | New |

### CHECK — Kiểm tra hiệu quả

| STT | What | Who | When | Status |
|-----|------|-----|------|--------|
| 1 | Màn hình Phân tích BH T1/2026: cột ốm + không lương hiển thị đúng? | SE/QC | 06/05 | New |
| 2 | UAT vs Golive kết quả match nhau? | SE/QC | 06/05 | New |
| 3 | Tính lương sau phân tích lại đúng? | SE/QC | 06/05 | New |

### ACT — Phòng ngừa tái diễn

| STT | What | Who | When | Status |
|-----|------|-----|------|--------|
| 1 | Bổ sung vào checklist onboarding KH: "Nếu dùng Formula14DayIns, TotalSick/TotalUnpaid sẽ = 0 — tư vấn trước" | Tung.Ly | 10/05 | New |
| 2 | Modify Calculate14DayFomular() để gán đủ 2 field khi dùng công thức | SE INS | T5/2026 | New |
| 3 | Thêm test case vào QC checklist INS: verify 2 cột khi có/không Formula14DayIns | QC | T5/2026 | New |

---

## BÀI HỌC

- Khi dùng `Formula14DayIns`, hệ thống chỉ phán định ≥14 ngày — **không phân loại loại nghỉ**. Đây là giới hạn thiết kế cần tư vấn KH trước khi cấu hình.
- **Golive ≠ UAT về 2 cột ngày nghỉ** → kiểm tra `Formula14DayIns` trước tiên, không phải config BH (`Sys_InsConfig`).
- Hai bài toán "phán định đủ/không đủ 14 ngày" và "đo lường loại nghỉ ốm/không lương" dùng chung điều kiện kích hoạt nhưng cần output khác nhau — cần tách biệt khi mở rộng tính năng.
