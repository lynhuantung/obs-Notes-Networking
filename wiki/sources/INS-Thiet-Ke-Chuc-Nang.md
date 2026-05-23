---
type: source
code: n2f7
tags:
  - "ins"
  - "thiet-ke-chuc-nang"
  - "bao-hiem"
  - "database"
domain: ins
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
  - "[[wiki/sources/INS-TaiLieuBaoHiem-01]]"
  - "[[wiki/sources/INS-Database-Tables]]"
description: "Tài liệu thiết kế chức năng phân hệ bảo hiểm HRM v8.0.1.1: sơ đồ 4 nhánh, mapping chức năng-DB và tương quan các phân hệ."
---

# INS-Thiet-Ke-Chuc-Nang — Tài Liệu Thiết Kế Chức Năng Bảo Hiểm v8.0.1.1

> Nguồn: `raw/Nghiệp vụ HRM/INS/INS-Thiet-Ke-Chuc-Nang.md`  
> Tác giả: Tung.Ly@VnResource.vn | Phiên bản: HRM Pro 8.0.1.1 | Cập nhật: 12/05/2022

## Tóm tắt

Tài liệu thiết kế chức năng chính thức phân hệ Bảo Hiểm (INS) của VnResource HRM Pro 8. Mô tả mục đích hệ thống, từ viết tắt, sơ đồ mindmap 4 nhánh chính (BHTN/ốm đau/thai sản/D02), bảng mapping chức năng-bảng DB, tương quan với các phân hệ HRE/ATT/SAL/SYS, và bảng mapping phiên bản V6→V7→V8. Đây là tài liệu tham chiếu nền tảng cho toàn bộ phân hệ INS.

## Key Takeaways

- **4 nhánh chính INS**: Bảo hiểm thất nghiệp | Bảo hiểm ốm đau | Bảo hiểm thai sản | Báo cáo D02
- **Luồng thời gian xử lý** (theo trình tự nghiệp vụ):
  1. NV mới → khai báo lương đóng BH (`Sal_InsuranceSalary`) + xuất A01-TS (`Hre_Profile`)
  2. Trước tính lương → tính trích nộp D02 (`Ins_ProfileInsuranceMonthly`, `Ins_ReportD02`)
  3. Sau tính BH → tính lương (`Sal_PayrollTable`)
  4. Phát sinh chứng từ → nhập ốm đau/thai sản (`Ins_InsuranceRecord`, `Ins_ChildSick`)
  5. Sau chứng từ → xuất C70A (`Ins_InsuranceRecord`, `Ins_ProfileInsuranceMonthly`)
- **Tương quan phân hệ**:
  - **HRE**: `Hre_Profile`, `Hre_Contract`, `Hre_WorkHistory` — thông tin nhân viên, hợp đồng
  - **ATT**: `Att_LeaveDay`, `Att_Workday`, `Att_Roster` — nghỉ ≥14 ngày, thai sản
  - **SAL**: `Sal_InsuranceSalary`, `Sal_PayrollTable` — lương BHXH, kết quả lương
  - **SYS**: `Sys_AsynTask`, `Sys_UserInfo` — tác vụ bất đồng bộ
- **Mapping V6→V8**: `Ins_InsuranceRecord` (V8) ← `Hre_InsuranceRecord` (V6/V7); `Sal_InsuranceSalary` ← `Sal_BasicSalary`; `Ins_InsuranceForPayrollMonthly` mới hoàn toàn ở V8
- **Bảng trung tâm**: `Ins_ProfileInsuranceMonthly` — tồn tại xuyên suốt V6/V7/V8, là bảng trích nộp BH hàng tháng

## Trích dẫn quan trọng

> Giúp cán bộ bảo hiểm **quản lý và lưu trữ các chứng từ BHXH** của nhân viên hiệu quả, hỗ trợ tính toán, kiểm tra các khoản chi phí bảo hiểm nhanh chóng và chính xác.

> Phân hệ INS đáp ứng yêu cầu: **Tính BHXH theo luật lao động Việt Nam** | Thiết lập các cấu hình để tính BHXH | Xử lý các chế độ bảo hiểm ốm đau, thai sản.

> `Ins_InsuranceForPayrollMonthly` — bảng **mới hoàn toàn** ở V8 (không có trong V7/V6): trích nộp BH chốt lương.

## Liên kết

- [[wiki/architecture/INS-Architecture]] — kiến trúc đầy đủ phân hệ INS
- [[wiki/architecture/INS-Database-Schema]] — schema database INS
- [[wiki/sources/INS-TaiLieuBaoHiem-01]] — tài liệu toàn diện INS v8.0.1.x
- [[wiki/sources/INS-Database-Tables]] — 72 bảng database INS
- [[wiki/sources/INS-Bieu-Mau]] — biểu mẫu TK01/TK02/D02-TS/C70A
- [[wiki/sources/INS-Nghiep-Vu]] — nghiệp vụ tăng/giảm/điều chỉnh BH
- [[wiki/sources/INS-Quy-Trinh]] — quy trình INS01 chuỗi giá trị
