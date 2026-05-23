---
type: source
code: k3f9
tags:
  - "ins"
  - "database"
  - "schema"
domain: ins
created: 2026-04-30
updated: 2026-04-30
source-file: raw/Nghiệp vụ HRM/INS/INS-Database-Tables.md
related:
  - "[[wiki/architecture/INS-Database-Schema]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/sources/INS-TaiLieuBH-01-Schema]]"
  - "[[wiki/sources/INS-Nghiep-Vu]]"
description: "Danh sách 72 bảng database phân hệ bảo hiểm HRM, mô tả vai trò các bảng trung tâm và lịch sử thay đổi schema."
---

# Source: INS – Cấu Trúc Database Phân Hệ Bảo Hiểm

## Tóm tắt

Tài liệu liệt kê đầy đủ 72 bảng database thuộc phân hệ Bảo Hiểm (INS) trong VnResource HRM Pro 8. Ghi chú rõ 2 bảng đã bị xóa (`Ins_InsuranceSalary`, `Hre_InsuranceRecord` cũ) và thay thế bằng cấu trúc mới. Tài liệu mô tả chi tiết vai trò của các bảng trung tâm như `Ins_ProfileInsuranceMonthly`, `Ins_InsuranceRecord`, `Ins_ReportD02`, `Cat_RateInsurance`. Đây là nguồn tham chiếu kỹ thuật khi debug hoặc phát triển tính năng INS.

## Key Takeaways

- **72 bảng** tham gia phân hệ INS — từ `Ins_*` (core BH) đến `Hre_*`, `Cat_*`, `Att_*`, `Sal_*` (phụ trợ)
- **Bảng đã xóa:** `Ins_InsuranceSalary` và `Hre_InsuranceRecord` (không dùng)
- **Bảng trung tâm:** `Ins_ProfileInsuranceMonthly` — kết quả trích nộp BH hàng tháng, nguồn dữ liệu cho SAL
- **D02 V2** (`Ins_ReportD02V2`, `Ins_ReportD02ItemV2`) hỗ trợ nhiều đợt trong tháng
- `Cat_ValueEntity` lưu mức trần đóng BH; `Cat_RateInsurance` lưu tỉ lệ BHXH/BHYT/BHTN
- Nghỉ 14 ngày cần đọc từ 5 bảng Att: `Att_Grade`, `Att_Workday`, `Att_Roster`, `Att_RosterGroup`, `Cat_GradeAttendance`

## Trích dẫn quan trọng

> ⚠️ **Không sử dụng:**
> - `Ins_InsuranceSalary` — đã xóa
> - `Hre_InsuranceRecord` — đã xóa

> `Ins_ProfileInsuranceMonthly` — Bảng lưu kết quả **trích nộp bảo hiểm hàng tháng** của từng nhân viên. Dùng để tính lương (Sal module lấy từ bảng này). Là kết quả đầu ra sau khi chạy phân tích bảo hiểm.

> `Ins_InsuranceSalaryPayback` — Bảng lưu dữ liệu **điều chỉnh bảo hiểm** (truy thu/thoái thu). Fields: `FromMonthEffect`, `ToMonthEffect`

## Liên kết

- [[wiki/architecture/INS-Database-Schema]] — Schema chi tiết INS
- [[wiki/architecture/INS-Architecture]] — Architecture 4 layer
- [[wiki/sources/INS-TaiLieuBH-01-Schema]] — Schema Ins_ProfileInsuranceMonthly 72+ fields
- [[wiki/sources/INS-Nghiep-Vu]] — Nghiệp vụ tham chiếu bảng
- [[wiki/sources/INS-C70-TinhLuong]] — Ins_InsuranceForPayrollMonthly
