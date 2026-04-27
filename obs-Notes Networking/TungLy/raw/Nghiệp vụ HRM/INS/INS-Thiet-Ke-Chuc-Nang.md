---
type: concept
tags: [HRM, Insurance, BHXH, BHYT, BHTN, VnResource, thiet-ke-chuc-nang]
date-updated: 2026-04-26
related:
  - "[[INS-Overview]]"
  - "[[INS-Bieu-Mau]]"
  - "[[INS-Nghiep-Vu]]"
  - "[[INS-IBHXH]]"
  - "[[INS-EBHXH]]"
  - "[[INS-Database-Tables]]"
  - "[[INS-Quy-Trinh]]"
---

# Tài Liệu Thiết Kế Chức Năng — Bảo Hiểm (INS)

> **VnResource HRM Pro 8** — Phiên bản: 8.0.1.1
> Tác giả: Tung.Ly@VnResource.vn | Cập nhật: 12/05/2022

## Mục đích tài liệu

- Giúp cán bộ bảo hiểm quản lý và lưu trữ các chứng từ BHXH của nhân viên hiệu quả
- Hỗ trợ tính toán, kiểm tra các khoản chi phí bảo hiểm nhanh chóng và chính xác
- Kết xuất các mẫu báo cáo BHXH theo quy định của luật hiện hành
- Đáp ứng yêu cầu:
  - Tính BHXH theo luật lao động Việt Nam
  - Thiết lập các cấu hình để tính BHXH
  - Xử lý các chế độ bảo hiểm ốm đau, thai sản

## Từ viết tắt

| STT | Thuật ngữ | Ý nghĩa |
|-----|-----------|---------|
| 1 | HRM Pro | Giải pháp phần mềm nhân sự VnResource |
| 2 | INS | Insurance — Bảo Hiểm |
| 3 | BHXH | Bảo hiểm xã hội |
| 4 | BHYT | Bảo hiểm y tế |
| 5 | BHTN | Bảo hiểm thất nghiệp |

## Sơ đồ Mindmap Tổng Quát

Phân hệ INS gồm 4 nhánh chính:
1. **Bảo hiểm thất nghiệp** — Quản lý tham gia/ngừng BHTN
2. **Bảo hiểm ốm đau** — Xử lý chế độ ốm đau ngắn ngày/dài ngày
3. **Bảo hiểm thai sản** — Xử lý chế độ thai sản, dưỡng sức
4. **Báo cáo D02** — Lập danh sách lao động tham gia BH

## Chức năng tương ứng với nghiệp vụ

| Thời điểm | Bước thực hiện | Bảng liên quan |
|-----------|----------------|----------------|
| Khi có NV mới | Khai báo lương đóng BH & loại đóng (BHXH/BHYT/BHTN) | `Sal_InsuranceSalary` |
| Khi có NV mới | Xuất danh sách đề nghị tham gia BHXH (A01-TS) | `Hre_Profile` |
| Trước tính lương | Tính trích nộp bảo hiểm (D02) | `Ins_ProfileInsuranceMonthly`, `Ins_ReportD02`, `Ins_ReportD02Item` |
| Sau tính BH | Tính lương (lấy BH đã trích nộp) | `Sal_PayrollTable`, `Sal_PayrollTableItem` |
| Dựa ngày phát sinh | Nhập chứng từ ốm đau, thai sản, con ốm | `Ins_InsuranceRecord`, `Ins_ChildSick` |
| Sau nhập chứng từ | Xuất tờ khai ốm đau, thai sản (C70A) | `Ins_InsuranceRecord`, `Ins_ProfileInsuranceMonthly` |

## Tương quan với các phân hệ khác

| Phân hệ | Bảng liên quan | Mục đích |
|---------|----------------|----------|
| **HRE** (Nhân sự) | `Hre_Profile`, `Hre_Contract`, `Hre_WorkHistory` | Thông tin nhân viên, hợp đồng |
| **ATT** (Chấm công) | `Att_LeaveDay`, `Att_Workday`, `Att_Roster` | Ngày nghỉ >= 14 ngày, thai sản |
| **SAL** (Lương) | `Sal_InsuranceSalary`, `Sal_PayrollTable` | Lương BHXH, kết quả lương |
| **SYS** (Hệ thống) | `Sys_AsynTask`, `Sys_UserInfo` | Tác vụ bất đồng bộ |

## Mapping phiên bản V6 → V7 → V8

| V8 | V7 | V6 | Mô tả |
|----|----|----|-------|
| `Ins_ProfileInsuranceMonthly` | `Ins_ProfileInsuranceMonthly` | `Ins_ProfileInsuranceMonthly` | Trích nộp bảo hiểm |
| `Ins_InsuranceForPayrollMonthly` | — | — | Trích nộp BH chốt lương |
| `Ins_InsuranceRecord` | `Hre_InsuranceRecord` | `Hre_InsuranceRecord` | Chứng từ BH |
| `Sal_InsuranceSalary` | `Sal_BasicSalary` | `Sal_BasicSalary` | Lương BHXH |
| `Att_LeaveDay` | `Att_LeaveDay` | `Att_LeaveDay` | Nghỉ >=14 ngày, Thai sản |
| `Cat_DayOff` | `Cat_DayOff` | `Cat_DayOff` | Nghỉ lễ |
| `Cat_ExchangeRate` | `Cat_ExchangeRate` | `Cat_ExchangeRate` | Tỉ giá |
| `Hre_Contract` | `Hre_Contract` | `Hre_Contract` | Hợp đồng mới nhất |
| `Cat_ValueEntity` | `Cat_ValueEntity` | `Cat_ValueEntity` | Mức trần/lương tối thiểu |
| `Cat_RateInsurance` | `Cat_RateInsurance` | `Cat_RateInsurance` | Tỉ lệ BH |
| `Att_Workday` | Unknown | Unknown | Nghỉ >=14 ngày |
| `Hre_HDTJob` | Unknown | Unknown | HDTJob dành cho Honda |

## Liên kết

- [[INS-Bieu-Mau]] — Các biểu mẫu bảo hiểm (TK01-TS, TK02-TS, D02-TS, D03-TS, C70A)
- [[INS-Nghiep-Vu]] — Chi tiết nghiệp vụ tăng/giảm/điều chỉnh, D02
- [[INS-IBHXH]] — Nghiệp vụ IBHXH (tăng và giảm)
- [[INS-EBHXH]] — Nghiệp vụ EBHXH (tăng, giảm và điều chỉnh)
- [[INS-Database-Tables]] — Cấu trúc Database phân hệ bảo hiểm
- [[INS-Quy-Trinh]] — Quy trình chuỗi giá trị bảo hiểm
- [[INS-Overview]] — Nhật ký vấn đề phân hệ bảo hiểm
