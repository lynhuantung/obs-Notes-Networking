---
type: source
domain: ins
tags: [bao-hiem, quy-trinh, INS01, chuoi-gia-tri, workflow, data-flow, thoi-han]
source-file: raw/Nghiệp vụ HRM/INS/INS-Quy-Trinh.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[wiki/sources/INS-TaiLieuBaoHiem-01]]"
  - "[[wiki/sources/INS-Bieu-Mau]]"
  - "[[wiki/sources/INS-Nghiep-Vu]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
description: "Quy trình INS01 phân tích bảo hiểm hàng tháng: 4 bước chính, luồng dữ liệu HRE→ATT→INS→SAL và thời hạn nghiệp vụ."
---

# INS — Quy Trình Bảo Hiểm: Chuỗi Giá Trị INS01

## Tóm tắt

Tài liệu mô tả toàn bộ quy trình INS01 (phân tích bảo hiểm hàng tháng) bao gồm: 4 bước chính (cập nhật chứng từ → phân tích → xuất báo cáo → nộp cơ quan BHXH), luồng dữ liệu đầy đủ từ HRE → ATT → INS → SAL, tương quan với các bảng database, quy trình tính trích nộp chi tiết 4 bước (thu thập → xử lý logic → lưu kết quả → xuất BC), và thời hạn nghiệp vụ quan trọng (D02 trước ngày 20, tiền BH trước ngày 30).

## Key Takeaways

- **INS01 — 4 bước**: Cập nhật chứng từ BHXH → Phân tích BH → Xuất báo cáo → Nộp cơ quan BHXH
- **Luồng dữ liệu**: HRE (Hre_Profile/Contract/WorkHistory) → ATT (Att_LeaveDay/Workday) → INS → SAL (Sal_PayrollTable)
- **INS → SAL**: `Ins_ProfileInsuranceMonthly` và `Ins_InsuranceForPayrollMonthly` cung cấp dữ liệu trích nộp cho tính lương
- **Thời hạn**: D02 trước ngày **20**, tiền BH trước ngày **30**, nhận C70B-HD sau ~3 ngày nộp C70A
- Logic kiểm tra nghỉ 14 ngày dùng `Att_LeaveDay` + `Att_Workday` + `Att_Roster`
- Kết quả lưu vào 3 bảng: `Ins_ProfileInsuranceMonthly`, `Ins_ReportD02/D02Item`, `Ins_InsuranceForPayrollMonthly`

## Trích dẫn quan trọng

> INS → SAL: `Ins_ProfileInsuranceMonthly` → `Sal_PayrollTable`: Kết quả BH trích nộp dùng để **trừ lương**.

> Thời hạn: Trước ngày **20** hàng tháng — nộp tờ khai D02. Trước ngày **30** — nộp tiền BH.

## Liên kết

- [[wiki/flows/Flow-BaoHiem-Monthly]] — Luồng phân tích BH hàng tháng với INS01 chuỗi giá trị
- [[wiki/flows/Flow-TinhLuong-Monthly]] — Quy trình tính lương (INS là bước trước SAL)
- [[wiki/sources/INS-Bieu-Mau]] — Báo cáo xuất ra: D02, C70A, TK01, TK02
- [[wiki/sources/INS-Nghiep-Vu]] — Chi tiết nghiệp vụ tăng/giảm
- [[wiki/architecture/INS-Database-Schema]] — Schema đầy đủ 72 bảng INS
