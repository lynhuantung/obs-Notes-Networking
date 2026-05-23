---
type: concept
tags: [HRM, Insurance, quy-trinh, workflow, lean, INS01]
date-updated: 2026-04-26
related:
  - "[[INS-Thiet-Ke-Chuc-Nang]]"
  - "[[INS-Nghiep-Vu]]"
  - "[[INS-Database-Tables]]"
  - "[[INS-Bieu-Mau]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
---

# Quy Trình Bảo Hiểm — Chuỗi Giá Trị (INS)

> Nguồn: VnResource HRM Pro 8 — Tài liệu thiết kế chức năng Bảo Hiểm
> Liên kết: [[INS-Thiet-Ke-Chuc-Nang]]

## INS01 — Quy trình phân tích Bảo hiểm

```
Bắt đầu
  │
  ▼
INS01.01 — Cập nhật chứng từ BHXH
  │  (Bộ phận nhân sự nhập chứng từ vào hệ thống)
  │
  ▼
INS01.02 — Phân tích bảo hiểm          ◄── Lấy dữ liệu từ:
  │  (Chạy phân tích để tính trích nộp)      HRE (Nhân sự)
  │                                           ATT (Chấm công)
  ▼
INS01.03 — Xuất báo cáo bảo hiểm       ──► Thông tin Tính Lương → SAL
  │  (Xuất D02, C70A, TK01, TK02...)
  │
  ▼
INS01.04 — Nộp báo cáo cho cơ quan bảo hiểm
  │
  ▼
Kết thúc
```

---

## Chi tiết các bước thực hiện

| Bước | Người thực hiện | Mô tả chi tiết | Đường dẫn |
|------|----------------|----------------|-----------|
| INS01.01 | Bộ phận nhân sự | Cập nhật chứng từ BHXH vào hệ thống | Trang Chủ > Bảo Hiểm > DS Chứng Từ BHXH |
| INS01.02 | Bộ phận nhân sự | Phân tích bảo hiểm | Trang Chủ > Bảo Hiểm > Phân Tích Bảo Hiểm |
| INS01.03 | Bộ phận nhân sự | Xuất báo cáo bảo hiểm (D02, C70A...) | Trang Chủ > Bảo Hiểm > Báo Cáo |
| INS01.04 | Bộ phận nhân sự | Nộp báo cáo cho cơ quan BHXH | Ngoài hệ thống |

---

## Quy trình chuỗi giá trị toàn bộ phân hệ bảo hiểm

### Luồng dữ liệu chính

```
HRE (Nhân sự)
  Hre_Profile, Hre_Contract, Hre_WorkHistory
        │
        ▼
ATT (Chấm công)
  Att_LeaveDay, Att_Workday, Att_Roster
        │
        ▼
INS (Bảo Hiểm) ──── Ins_InsuranceRecord (chứng từ ốm đau, thai sản)
  Ins_ProfileInsuranceMonthly
  Ins_ReportD02 / Ins_ReportD02Item
        │
        ▼
SAL (Lương)
  Sal_PayrollTable, Sal_PayrollTableItem
```

---

## Tương quan với các phân hệ khác

### Nhân Sự (HRE) → INS
- `Hre_Profile`: Thông tin cơ bản nhân viên (tên, ngày sinh, CMND, địa chỉ...)
- `Hre_Contract`: Hợp đồng → lấy số quyết định khi tăng mới (TM)
- `Hre_ContractExtend`: Phụ lục HĐ → lấy số QĐ khi điều chỉnh lương (DC)
- `Hre_WorkHistory`: Lịch sử phòng ban, chức danh
- `Hre_StopWorking`: Nghỉ tạm hoãn

### Chấm Công (ATT) → INS
- `Att_LeaveDay`: Ngày nghỉ → xác định nghỉ >= 14 ngày, thai sản
- `Att_Workday`: DS ngày làm việc → kiểm tra nghỉ 14 ngày
- `Att_Roster`: Ca làm việc → kiểm tra nghỉ 14 ngày
- `Cat_DayOff`: Ngày nghỉ lễ

### INS → Lương (SAL)
- `Ins_ProfileInsuranceMonthly` → `Sal_PayrollTable`: Kết quả BH trích nộp dùng để trừ lương
- `Ins_InsuranceForPayrollMonthly`: Phân tích BH chốt lương

---

## Quy trình tính trích nộp bảo hiểm (chi tiết)

1. **Thu thập dữ liệu đầu vào:**
   - Thông tin NV từ `Hre_Profile`
   - Lương BH từ `Sal_InsuranceSalary`
   - Tỉ lệ BH từ `Cat_RateInsurance`
   - Mức trần từ `Cat_ValueEntity`
   - Ngày nghỉ từ `Att_LeaveDay`, `Att_Workday`
   - Chứng từ ốm đau từ `Ins_InsuranceRecord`

2. **Xử lý logic:**
   - Kiểm tra nghỉ >= 14 ngày (Giảm BH tháng đó)
   - Kiểm tra nghỉ thai sản (Giảm BHXH, BHTN)
   - Tính tăng/giảm lao động
   - Lấy số quyết định theo từng loại D02

3. **Lưu kết quả:**
   - `Ins_ProfileInsuranceMonthly`: Trích nộp BH tháng
   - `Ins_ReportD02` / `Ins_ReportD02Item`: D02
   - `Ins_InsuranceForPayrollMonthly`: Dữ liệu chốt lương

4. **Xuất báo cáo:**
   - D02-TS (mẫu kê khai lao động)
   - C70A (đề nghị trợ cấp ốm đau, thai sản)
   - TK01-TS, TK02-TS
   - BC Kế Toán 01, 02

---

## Thời hạn nghiệp vụ quan trọng

| Hạn | Nội dung |
|-----|---------|
| Trước ngày 20 hàng tháng | Nộp tờ khai D02 |
| Trước ngày 30 hàng tháng | Nộp tiền BH |
| ~3 ngày sau nộp C70A | Nhận C70B-HD từ cơ quan BHXH |

---

## Liên kết

- [[INS-Thiet-Ke-Chuc-Nang]] — Tổng quan tài liệu
- [[INS-Bieu-Mau]] — Biểu mẫu xuất ra (D02, C70A, TK01, TK02)
- [[INS-Nghiep-Vu]] — Chi tiết nghiệp vụ tăng/giảm
- [[INS-Database-Tables]] — Bảng dữ liệu sử dụng
- [[INS-FAQ-Phan-Tich-BH]] — FAQ phân tích bảo hiểm
- [[INS-Chan-Doan-Su-Co]] — Chẩn đoán sự cố bảo hiểm
