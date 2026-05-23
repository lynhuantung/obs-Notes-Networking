---
title: "Phân tích BH tháng N+1 tự xóa dòng NV nghỉ việc đã confirmed"
date: 2026-05-05
code: ins-001
domain: ins
module: "InsuranceServices / DeleteInsuranceMonthly"
description: "Bug xóa nhầm dòng Ins_ProfileInsuranceMonthly đã E_CONFIRMED khi phân tích BH tháng N+1 do thiếu guard Status trong DeleteInsuranceMonthly"
tags:
  - "bug-fix"
  - "ins"
  - "insurance-monthly"
verified: partial
related:
  - "[[wiki/projects/bao-hiem]]"
---

# Phân tích BH tháng N+1 tự xóa dòng NV nghỉ việc đã confirmed

## Tóm tắt

Khi phân tích bảo hiểm tháng N, nếu NV nghỉ việc chưa đủ 14 ngày,
hệ thống tự động sinh thêm 1 dòng tháng N+1 với Status = E_CONFIRMED.
Khi người dùng chọn tháng N+1 và bấm phân tích lại, dòng này bị xóa
mất — vi phạm quy tắc không được xóa dữ liệu đã confirmed.

## Triệu chứng

Người dùng chọn tháng N+1, chọn NV để phân tích → NV bị mất khỏi
danh sách, dòng Ins_ProfileInsuranceMonthly có Status=E_CONFIRMED
của NV đó bị đánh dấu IsDelete = true.

## Phân tích nguyên nhân

### Root Cause

Hàm `DeleteInsuranceMonthly` được gọi đầu tiên trong flow phân tích
để dọn dữ liệu cũ, nhưng cả 2 nhánh query (có period và không có
period) đều không có điều kiện `Status != "E_CONFIRMED"` — dẫn đến
xóa cả dòng đã confirmed.

### Chuỗi nguyên nhân

```
Dòng E_CONFIRMED tháng N+1 bị xóa
  ← DeleteInsuranceMonthly chạy trước, không có guard Status
    ← Guard Status chỉ được đặt ở DeleteInsMonthlyPeriodAndMonthYear
       (hàm phụ chạy sau) — bị bỏ sót ở hàm chính
```

## Giải pháp đã áp dụng

Thêm `&& m.Status != "E_CONFIRMED"` vào cả 2 nhánh trong
`DeleteInsuranceMonthly`:

```csharp
// TRƯỚC — nhánh default (không có period)
var lstProfileMonthlyQueryable = context.Ins_ProfileInsuranceMonthly
    .Where(m => !m.IsDelete.HasValue && m.PaybackID == null
             && m.ProfileID != null
             && m.MonthYear.HasValue && m.MonthYear.Value == monthCheck
             && profileIds.Contains(m.ProfileID.Value))
    .AsEnumerable();

// SAU — nhánh default
var lstProfileMonthlyQueryable = context.Ins_ProfileInsuranceMonthly
    .Where(m => !m.IsDelete.HasValue && m.PaybackID == null
             && m.ProfileID != null
             && m.MonthYear.HasValue && m.MonthYear.Value == monthCheck
             && profileIds.Contains(m.ProfileID.Value)
             && m.Status != "E_CONFIRMED")   // ← thêm
    .AsEnumerable();

// TRƯỚC — nhánh có period
lstProfileMonthlyQueryable = context.Ins_ProfileInsuranceMonthly
    .Where(m => ... && m.Period == period);

// SAU — nhánh có period
lstProfileMonthlyQueryable = context.Ins_ProfileInsuranceMonthly
    .Where(m => ... && m.Period == period
             && m.Status != "E_CONFIRMED");  // ← thêm
```

File đã sửa:
`HRM12-GIT\Main\Source\Business\HRM.Business.Insurance.Domain\InsuranceServices.cs`

## Kết quả kiểm tra

- Verified: partial (chưa test end-to-end, chỉ review code)

## Bài học / Lưu ý

- Mọi hàm xóa / đánh dấu IsDelete trên bảng
  Ins_ProfileInsuranceMonthly đều PHẢI có guard
  `Status != "E_CONFIRMED"` — coi đây là convention bắt buộc
- Không nên chỉ bảo vệ ở hàm phụ mà bỏ sót hàm chính được gọi trước
- Khi có nhiều hàm xóa cùng bảng, cần review đồng bộ tất cả chứ
  không chỉ hàm đang focus
