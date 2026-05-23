---
type: source
tags:
  - bao-hiem
  - BHXH
  - nghi-om
  - nghi14ngay
  - che-do-benh
date-ingested: 2026-04-26
date-updated: 2026-05-02
source-file: 1. Projects/Nghiệp vụ HRM/INS/Ins_Nghi14Ngay.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
description: "Nghiệp vụ nghỉ ốm 14 ngày hưởng chế độ BHXH: quy tắc tính ngày, thaytich lũy qua các tháng, phân biệt ngày BHXH và công ty chi trả."
---

# INS — Quy Tắc Nghỉ Ốm 14 Ngày (Nghỉ 14 Ngày)

## Tóm tắt

Tài liệu mô tả nghiệp vụ **nghỉ ốm hưởng chế độ BHXH** theo quy định: người lao động được hưởng chế độ ốm đau khi nghỉ tối đa **14 ngày làm việc/năm** (điều kiện thông thường) hoặc 30 ngày (bệnh dài ngày, theo danh mục Bộ Y tế). Đây là nguồn phức tạp nghiệp vụ vì phải tách biệt: ngày làm việc vs ngày lịch, ngày BHXH chi trả vs ngày công ty chi trả, và tích lũy qua các tháng.

## Key Takeaways

- **Quy định cơ bản**:
  - Đóng BH dưới 15 năm: tối đa **30 ngày**/năm (bệnh thông thường)
  - Đóng BH từ 15–30 năm: tối đa **40 ngày**/năm
  - Đóng BH trên 30 năm: tối đa **60 ngày**/năm
  - Bệnh nặng/dài ngày: tối đa **180 ngày**/năm
- **"14 ngày"** trong tên tài liệu thường đề cập đến **14 ngày làm việc** — quy đổi từ số ngày lịch phụ thuộc lịch làm việc thực tế của doanh nghiệp.
- **Mức hưởng**: 75% mức lương đóng BHXH (do BHXH chi trả, không phải công ty).
- **Ảnh hưởng đến bản ghi BH**: Thời gian nghỉ ốm hưởng chế độ **vẫn tính là thời gian tham gia BHXH** — không cắt bản ghi bảo hiểm.
- **Tách biệt với nghỉ không hưởng lương**: Nghỉ ốm hưởng BHXH ≠ nghỉ không lương — DayCount bản ghi BH không bị ảnh hưởng.
- **Tích lũy theo năm**: Hệ thống phải đếm tổng ngày nghỉ ốm trong năm để kiểm soát không vượt hạn mức.

## Phân biệt các loại nghỉ ảnh hưởng BH

| Loại nghỉ | Cắt bản ghi BH? | Ai trả lương? | Tính DayCount BH? |
|-----------|----------------|--------------|-------------------|
| Nghỉ ốm hưởng BHXH | ❌ Không | BHXH | ✅ Có |
| Nghỉ thai sản | ❌ Không | BHXH | ✅ Có |
| Nghỉ không hưởng lương | ✅ Có thể | Không ai | ❌ Tùy TH |
| Nghỉ phép năm | ❌ Không | Công ty | ✅ Có |

---

## ⚙️ Kỹ thuật — Hai chế độ đếm ngày nghỉ trong InsuranceServices.cs

> **Code review 2026-05-02** — `InsuranceServices.cs`, hàm `CheckLeave14day` + `SetLeave14Days`

### Chế độ 1: Đếm từng ngày (Day-by-Day loop)

**Điều kiện kích hoạt**: `gradePayroll.Formula14DayIns` = null/rỗng (chế độ lương KHÔNG có công thức 14 ngày)

**Cơ chế**: Vòng `for (DateTime dateCheck = beginMonth; dateCheck <= endMonth; ...)` — duyệt từng ngày trong chu kỳ, xác định:

```csharp
int sickLeaveCount = 0;    // đếm ngày nghỉ ốm
int unPaidLeaveCount = 0;  // đếm ngày nghỉ không lương

// Với mỗi ngày trong tháng:
if (lstLeaveTypeID_Sick.Contains(leaveday.LeaveDayTypeID.Value))
    sickLeaveCount++;      // loại nghỉ thuộc "nghỉ ốm"
else
    unPaidLeaveCount++;    // loại nghỉ khác = nghỉ không lương
```

**Nguồn dữ liệu theo config `HRM_INS_CONFIG_INSLEAVE14DAYTYPE`**:
- `Leaveday` → từ `Att_LeaveDay` (ngày nghỉ đã duyệt)
- `Workday` → từ `Att_Workday` (không chấm công, không có leaveday)
- `InsuranceRecord` → từ `Ins_InsuranceRecord` (chứng từ BH)

**Output**: `totalSickleaveDays`, `totalUnpaidLeaveDays` được gán vào `profile.TotalSickleaveDays` / `profile.TotalUnpaidLeaveDays` → **hiển thị được trên màn hình Phân tích BH**

---

### Chế độ 2: Dùng công thức (Formula-based)

**Điều kiện kích hoạt**: `gradePayroll.Formula14DayIns` ≠ null (chế độ lương CÓ cấu hình công thức 14 ngày)

**Cơ chế**: Gọi `Calculate14DayFomular(...)` — tính số ngày nghỉ dựa trên bảng tính công (`Att_AttendanceTable`). Kết quả trả về là **tổng số ngày nghỉ** (kiểu số), đủ để phán định ≥14 ngày hay không.

**Hạn chế quan trọng**:
- Công thức chỉ tính **tổng ngày nghỉ** — **KHÔNG phân biệt** nghỉ ốm vs nghỉ không lương
- Không có phần tử BH riêng để lưu `totalSickleaveDays` / `totalUnpaidLeaveDays` theo từng loại
- Phần tử công thức chỉ cho kết quả `countLeave` (số nguyên): 0 = không đủ 14 ngày, 1 = đủ 14 ngày

**Kết quả**: `TotalSickleaveDays` = 0, `TotalUnpaidLeaveDays` = 0 → **cột này trống trên màn hình** (đây là behavior đúng, không phải bug code)

---

### ⚠️ Root Cause — INS_BUG_QPVN2596

| Yếu tố | Giá trị |
|--------|---------|
| **Môi trường** | Golive lỗi, UAT/nhà không lỗi |
| **Nguyên nhân** | Golive dùng **chế độ lương có `Formula14DayIns`** → rơi vào Chế độ 2 → không có `totalSickleaveDays` / `totalUnpaidLeaveDays` |
| **UAT/nhà** | Chế độ lương KHÔNG có `Formula14DayIns` → rơi vào Chế độ 1 → đếm được từng ngày |
| **Fix** | Nếu cần hiển thị tổng ngày nghỉ ốm/không lương: **xóa `Formula14DayIns` trong chế độ lương** để hệ thống dùng Chế độ 1; hoặc chấp nhận limitation của công thức |

---

### Bài học thiết kế (từ code review)

> **Khi dùng công thức nghỉ 14 ngày (`Formula14DayIns`)**: hệ thống chỉ biết NV có nghỉ ≥14 ngày hay không — **không xác định được loại nghỉ** (ốm/không lương). Đây là trade-off khi linh hoạt hóa qua công thức.

> **Quy tắc kiểm tra môi trường**: Nếu Golive ≠ UAT về hiển thị nghỉ 14 ngày → **đầu tiên kiểm tra config chế độ lương** (`Cat_GradePayroll.Formula14DayIns`) giữa 2 môi trường, không phải kiểm tra config BH.

> **Phần tử BH**: `TotalSickleaveDays` / `TotalUnpaidLeaveDays` chỉ được gán giá trị khi đi qua vòng for day-by-day. Nếu dùng công thức → hai trường này luôn = 0.

## Trích dẫn quan trọng

> Nghỉ ốm hưởng BHXH: bản ghi bảo hiểm không bị ngắt — nhân viên vẫn đóng BHXH bình thường, BHXH chi trả lương thay công ty.

> Lỗi phổ biến: hệ thống cắt bản ghi BH khi nhân viên nghỉ ốm → sai hoàn toàn, phải fix.

> "14 ngày làm việc" = 14 × hệ số (lịch làm việc) — không phải 14 ngày lịch.

## Liên kết

- [[wiki/sources/INS-InsuranceRecordDayCount]] — DayCount không bị ảnh hưởng bởi nghỉ ốm hưởng BH
- [[wiki/sources/INS-NghiThaiSan]] — Chế độ tương tự nhưng khác mức hưởng và thời gian
- [[wiki/sources/INS-InsuranceMonthJoin]] — Tháng nghỉ ốm vẫn được tính là tháng tham gia BH
- [[wiki/sources/INS-FishBone-Analysis]] — Lỗi xử lý nghỉ ốm là một nhánh trong FishBone
- [[wiki/sources/INS-Config-FAQ]] — Config `Formula14DayIns` trong chế độ lương, `HRM_INS_CONFIG_INSLEAVE14DAYTYPE`
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
