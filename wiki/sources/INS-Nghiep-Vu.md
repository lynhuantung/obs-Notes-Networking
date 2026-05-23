---
type: source
domain: ins
tags: [bao-hiem, nghiep-vu, tang-giam, D02, logic-so-quyet-dinh, BHXH, BHYT, BHTN]
source-file: raw/Nghiệp vụ HRM/INS/INS-Nghiep-Vu.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-TaiLieuBaoHiem-01]]"
  - "[[wiki/sources/INS-ThietKe-V8]]"
  - "[[wiki/sources/INS-Bieu-Mau]]"
  - "[[wiki/sources/INS-EBHXH]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
description: "Nghiệp vụ tăng/giảm/điều chỉnh bảo hiểm HRM: logic số quyết định 10 loại D02 và nguồn dữ liệu tương ứng trong database."
---

# INS — Nghiệp Vụ Tăng / Giảm / Điều Chỉnh Bảo Hiểm

## Tóm tắt

Tài liệu mô tả chi tiết 4 nhóm nghiệp vụ chính của phân hệ INS: (1) Tăng lao động — 3 trường hợp (tăng mới, tăng sau thai sản/ốm, tăng BHTN), (2) Tăng mức đóng — 3 trường hợp (kịp thời, truy nộp, điều chuyển), (3) Giảm — 4 trường hợp (kịp thời/truy giảm với/không thu hồi thẻ BHYT). Phần quan trọng nhất là bảng **Logic lấy số quyết định** cho 10 loại D02 — chỉ rõ nguồn dữ liệu từ bảng nào trong DB (Hre_Contract, Hre_ContractExtend, Hre_Profile, Ins_InsuranceSalaryPayback...).

## Key Takeaways

- **Tăng mới (TM)**: lấy số QĐ từ `Hre_Contract.ContractNo` và `DateSigned`
- **Điều chỉnh lương (DC)**: lấy số QĐ từ `Hre_ContractExtend.AnnexCode` và `AppendixContractTypeID`
- **Giảm hẳn (GH)**: lấy từ `Hre_Profile.ResignNo` và `DateQuitSign`
- **Thai sản (TS)**: `Hre_Profile.DateStartPregnant` → `DateEndPregnant`
- **Truy thu/Bổ sung (AD/SB)**: từ `Ins_InsuranceSalaryPayback.FromMonthEffect` → `ToMonthEffect`
- Phân biệt tăng **kịp thời** vs **bổ sung tháng trước** — cách xác định DateStart/DateEnd khác nhau
- Nghiệp vụ điều chỉnh giảm BHYT (TU) có nhiều nhánh: trả thẻ kịp thời / không trả / không kịp thời

## Trích dẫn quan trọng

> Tăng lao động có đóng bổ sung tháng trước: Đơn vị phát sinh tăng LĐ tháng 01/2014 nhưng báo tháng 02/2014 → Thời gian từ-đến: 01/2014 → 02/2014.

> **Logic số quyết định TM**: `Hre_Contract.ContractNo` | `Hre_Contract.ContractTypeID` | `Hre_Contract.DateSigned`

## Liên kết

- [[wiki/sources/INS-Bieu-Mau]] — Biểu mẫu D02-TS, C70A, TK01/TK02
- [[wiki/sources/INS-EBHXH]] — Bảng mã EBHXH tăng/giảm/điều chỉnh
- [[wiki/architecture/INS-Database-Schema]] — Schema bảng Ins_ProfileInsuranceMonthly
- [[wiki/sources/INS-TaiLieuBaoHiem-01]] — Tài liệu toàn diện INS v8
