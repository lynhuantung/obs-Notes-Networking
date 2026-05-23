---
type: bug
code: ins-029
module: INS
status: resolved
severity: high
description: "Phân tích BH tháng N+1 tự xóa dòng NV nghỉ việc đã E_CONFIRMED — thiếu guard Status trong DeleteInsuranceMonthly"
tags:
  - ins
  - bug-fix
  - delete-guard
  - insurance-monthly
created: 2026-05-05
updated: 2026-05-05
related:
  - "[[wiki/sources/2026-05-05-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed]]"
  - "[[wiki/bugs/Ins028-thai-san-nghi-viec-cung-thang]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
---

# Ins029 — Phân tích BH tháng N+1 tự xóa dòng NV nghỉ việc đã confirmed

## Triệu chứng

Người dùng chọn tháng N+1, chọn NV để phân tích → NV bị mất khỏi danh sách. Dòng `Ins_ProfileInsuranceMonthly` có `Status = E_CONFIRMED` của NV đó bị đánh dấu `IsDelete = true`.

**Bối cảnh**: NV nghỉ việc chưa đủ 14 ngày trong tháng N → hệ thống tự sinh dòng tháng N+1 với `Status = E_CONFIRMED`. Khi phân tích lại tháng N+1, dòng này bị xóa nhầm.

## Root Cause

`DeleteInsuranceMonthly` không có guard `Status != "E_CONFIRMED"` ở cả 2 nhánh:

```
DeleteInsuranceMonthly (hàm chính — chạy trước)
  ├── Nhánh không có period: ❌ thiếu guard Status
  └── Nhánh có period:       ❌ thiếu guard Status

DeleteInsMonthlyPeriodAndMonthYear (hàm phụ — chạy sau)
  └── ✅ có guard Status != "E_CONFIRMED"  ← bị bỏ sót ở hàm chính
```

## Fix

Thêm `&& m.Status != "E_CONFIRMED"` vào cả 2 nhánh trong `DeleteInsuranceMonthly`:

```csharp
// Nhánh default (không có period) — SAU FIX
var lstProfileMonthlyQueryable = context.Ins_ProfileInsuranceMonthly
    .Where(m => !m.IsDelete.HasValue && m.PaybackID == null
             && m.ProfileID != null
             && m.MonthYear.HasValue && m.MonthYear.Value == monthCheck
             && profileIds.Contains(m.ProfileID.Value)
             && m.Status != "E_CONFIRMED")   // ← thêm
    .AsEnumerable();

// Nhánh có period — SAU FIX
lstProfileMonthlyQueryable = context.Ins_ProfileInsuranceMonthly
    .Where(m => ... && m.Period == period
             && m.Status != "E_CONFIRMED");  // ← thêm
```

**File**: `HRM12-GIT\Main\Source\Business\HRM.Business.Insurance.Domain\InsuranceServices.cs`

## Trạng thái

- Verified: **partial** — chưa test end-to-end, chỉ review code

## Bài học

- **Convention bắt buộc**: mọi hàm xóa / đánh dấu `IsDelete` trên `Ins_ProfileInsuranceMonthly` đều phải có guard `Status != "E_CONFIRMED"`
- Khi có nhiều hàm xóa cùng bảng → review đồng bộ tất cả, không chỉ hàm đang focus
- Pattern tương tự: [[wiki/bugs/Ins028-thai-san-nghi-viec-cung-thang]] — thiếu guard `IsPregnant` trong `SetLeave14Days`
