---
type: source
code: ins-001
description: "Bug DeleteInsuranceMonthly xóa nhầm dòng E_CONFIRMED tháng N+1 khi phân tích lại — thiếu guard Status"
domain: ins
tags:
  - bug-fix
  - ins
  - insurance-monthly
  - delete-guard
created: 2026-05-05
updated: 2026-05-05
source-file: raw/Nghiệp vụ HRM/INS/2026-05-05-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed.md
related:
  - "[[wiki/bugs/Ins029-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
  - "[[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]]"
---

# Source: Phân tích BH tháng N+1 tự xóa dòng NV nghỉ việc đã confirmed

## Tóm tắt

Khi phân tích BH tháng N với NV nghỉ việc chưa đủ 14 ngày, hệ thống tự sinh thêm dòng tháng N+1 với `Status = E_CONFIRMED`. Khi người dùng chọn tháng N+1 và bấm phân tích lại, dòng này bị xóa mất — vi phạm quy tắc bất biến "không xóa dữ liệu đã confirmed". Root cause: `DeleteInsuranceMonthly` không có guard `Status != "E_CONFIRMED"` ở cả 2 nhánh query (có period và không có period). Fix: thêm điều kiện guard vào cả 2 nhánh trong `InsuranceServices.cs`.

## Key Takeaways

- `DeleteInsuranceMonthly` là hàm dọn dữ liệu cũ chạy **trước tiên** trong flow phân tích — nếu thiếu guard thì xóa hết kể cả dòng confirmed
- Guard `Status != "E_CONFIRMED"` **chỉ có ở hàm phụ** `DeleteInsMonthlyPeriodAndMonthYear` mà không có ở hàm chính — bị bỏ sót
- Convention bắt buộc: **mọi hàm xóa / đánh dấu IsDelete trên `Ins_ProfileInsuranceMonthly`** đều phải có guard này
- Khi có nhiều hàm xóa cùng bảng, phải review đồng bộ tất cả — không chỉ hàm đang focus
- Verified: **partial** — chưa test end-to-end, chỉ review code

## Trích dẫn quan trọng

> Hàm `DeleteInsuranceMonthly` được gọi đầu tiên trong flow phân tích để dọn dữ liệu cũ, nhưng cả 2 nhánh query (có period và không có period) đều không có điều kiện `Status != "E_CONFIRMED"` — dẫn đến xóa cả dòng đã confirmed.

> Mọi hàm xóa / đánh dấu IsDelete trên bảng `Ins_ProfileInsuranceMonthly` đều PHẢI có guard `Status != "E_CONFIRMED"` — coi đây là convention bắt buộc.

> Không nên chỉ bảo vệ ở hàm phụ mà bỏ sót hàm chính được gọi trước.

## Chuỗi nguyên nhân

```
Dòng E_CONFIRMED tháng N+1 bị xóa
  ← DeleteInsuranceMonthly chạy trước, không có guard Status
    ← Guard Status chỉ được đặt ở DeleteInsMonthlyPeriodAndMonthYear
       (hàm phụ chạy sau) — bị bỏ sót ở hàm chính
```

## Fix áp dụng

Thêm `&& m.Status != "E_CONFIRMED"` vào **cả 2 nhánh** trong `DeleteInsuranceMonthly`:

- Nhánh default (không có period): thêm điều kiện vào `.Where(...)`
- Nhánh có period: thêm điều kiện vào `.Where(...)`

File: `HRM12-GIT\Main\Source\Business\HRM.Business.Insurance.Domain\InsuranceServices.cs`

## Liên kết

- [[wiki/bugs/Ins029-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed]] — Bug detail
- [[wiki/architecture/INS-Architecture]] — Architecture phân hệ INS, bảng Ins_ProfileInsuranceMonthly
- [[wiki/flows/Flow-BaoHiem-Monthly]] — Luồng phân tích BH hàng tháng
- [[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]] — Bug tương tự: thiếu guard `IsPregnant` trong SetLeave14Days
