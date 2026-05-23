---
type: source
tags: [bao-hiem, thiet-ke-chuc-nang, nghiep-vu, bieu-mau, IBHXH, EBHXH, D02, C70A, database, HRM, V8]
created: 2026-04-27
updated: 2026-04-27
domain: ins
related:
  - [[wiki/concepts/HRM-Modules]]
  - [[wiki/sources/INS-Troubleshooting-5Why]]
  - [[wiki/sources/INS-NhatKy-VanDe-2017]]
  - [[wiki/flows/Flow-BaoHiem-Monthly]]
  - [[wiki/architecture/INS-Architecture]]
description: "Tài liệu thiết kế chức năng phân hệ INS HRM v8: mindmap 4 nhánh, mapping IBHXH/EBHXH, 72 bảng schema và chuỗi giá trị INS01."
---

# INS — Tài Liệu Thiết Kế Chức Năng V8 (HRM Pro 8)

## Tóm tắt

Tài liệu thiết kế chức năng phân hệ Bảo Hiểm VnResource HRM Pro **phiên bản 8.0.1.1** (12/05/2022), tác giả: Tung.Ly. Bao gồm: sơ đồ mindmap tổng quát, nghiệp vụ tăng/giảm/điều chỉnh, biểu mẫu (TK01/TK02/D02/D03/C70A), mapping IBHXH/EBHXH, schema database 72 bảng, và quy trình chuỗi giá trị.

## Key Takeaways

### Mục đích phân hệ INS
- Quản lý và lưu trữ chứng từ BHXH nhân viên
- Tính toán, kiểm tra khoản chi phí bảo hiểm
- Kết xuất mẫu báo cáo BHXH theo luật Việt Nam
- Xử lý chế độ ốm đau, thai sản

### 4 nhánh chính phân hệ INS
1. **Bảo hiểm thất nghiệp** (BHTN) — tham gia/ngừng
2. **Bảo hiểm ốm đau** — ngắn ngày/dài ngày
3. **Bảo hiểm thai sản** — thai sản, dưỡng sức
4. **Báo cáo D02** — danh sách lao động tham gia BH

### Tương quan phân hệ

| Phân hệ | Bảng chính | Mục đích |
|---------|-----------|----------|
| **HRE** | Hre_Profile, Hre_Contract, Hre_WorkHistory | Thông tin NV, hợp đồng |
| **ATT** | Att_LeaveDay, Att_Workday, Att_Roster | Nghỉ >=14 ngày, thai sản |
| **SAL** | Sal_InsuranceSalary, Sal_PayrollTable | Lương BHXH, kết quả lương |
| **SYS** | Sys_AsynTask | Tác vụ bất đồng bộ |

### Nghiệp vụ chính

**Tăng lao động (TM)**: Phải lập D02-TS + Mẫu A01-TS cho NV mới
- Tăng kịp thời: báo cùng tháng phát sinh
- Tăng truy nộp: ghi từ tháng có phát sinh đến tháng báo

**Giảm lao động**: 4 trường hợp (kịp thời/truy giảm × có thu hồi/không thu hồi thẻ BHYT)

**Điều chỉnh mức đóng (DC)**: Ghi rõ mức lương cũ → mức lương mới

### Biểu mẫu bảo hiểm

| Mẫu | Tên | Khi nào lập |
|-----|-----|-------------|
| **TK01-TS** | Tờ khai tham gia BHXH, BHYT | NV mới tham gia lần đầu |
| **TK02-TS** | Tờ khai thay đổi thông tin | NV thay đổi địa chỉ, nơi KCB |
| **D02-TS** | Danh sách lao động tham gia BH | Tháng có phát sinh tăng/giảm/điều chỉnh |
| **D03-TS** | Danh sách chỉ tham gia BHYT | NV chỉ đóng BHYT |
| **C70A** | Đề nghị trợ cấp ốm đau, thai sản | Sau khi nhập chứng từ ốm đau/thai sản |

**Ký hiệu nghiệp vụ D02**: AD, CD, DC, DN, GH, GN, KL, OF, ON, SB, TM, TN, TS, TT, TU

### Mapping IBHXH vs EBHXH

| Điểm khác | IBHXH | EBHXH |
|-----------|-------|-------|
| Loại TL (tăng thay đổi pháp nhân) | Có | Không |
| Phần Điều chỉnh riêng | Không | Có |
| Mã GL | Có | Có (diễn giải khác) |

### Logic lấy số quyết định D02

| Loại D02 | DateStart | DecisionNo |
|----------|-----------|-----------|
| TM (tăng mới) | `Hre_Contract.DateStart` | `Hre_Contract.ContractNo` |
| DC (điều chỉnh lương) | `Hre_ContractExtend.DateStart` | `Hre_ContractExtend.AnnexCode` |
| GH (giảm hẳn) | `Hre_Profile.DateQuit` | `Hre_Profile.ResignNo` |
| ON/TD/TT/TN | `Ins_ReportD02.DateMonth` | Null |
| TS (thai sản) | `Hre_Profile.DateStartPregnant` | Null |

### Mapping phiên bản V6 → V7 → V8

| V8 | V7 | V6 | Ghi chú |
|----|----|----|---------|
| `Ins_ProfileInsuranceMonthly` | Same | Same | Trích nộp BH |
| `Ins_InsuranceForPayrollMonthly` | — | — | **Mới V8**: chốt lương |
| `Ins_InsuranceRecord` | `Hre_InsuranceRecord` | Same | Chứng từ BH |
| `Sal_InsuranceSalary` | `Sal_BasicSalary` | Same | Lương BHXH |

### Bảng đã xóa (không sử dụng)
- ~~`Ins_InsuranceSalary`~~ — đã xóa
- ~~`Hre_InsuranceRecord`~~ — đã xóa

### Quy trình INS01 (chuỗi giá trị)

```
INS01.01 — Cập nhật chứng từ BHXH
    ↓
INS01.02 — Phân tích bảo hiểm ←── HRE + ATT
    ↓
INS01.03 — Xuất báo cáo (D02, C70A, TK01/02) ──→ SAL
    ↓
INS01.04 — Nộp báo cáo cho cơ quan BHXH
```

**Thời hạn**: Nộp D02 trước ngày 20; nộp tiền BH trước ngày 30; ~3 ngày sau nộp C70A nhận C70B-HD

## Trích dẫn quan trọng

> BH yêu cầu chức danh/chức vụ luôn là **tiếng Việt** (dùng trường "theo luật")

> Tỉ lệ đóng BHXH cố định: NSDLĐ 18% + NLĐ 8% + BHYT 3%+1.5% + BHTN 1%+1% = **32.5%**

> C70A: Thông thường ~03 ngày làm việc kể từ khi nộp, doanh nghiệp nhận C70B-HD

## Liên kết

- [[wiki/flows/Flow-BaoHiem-Monthly]] — Luồng phân tích BH hàng tháng
- [[wiki/architecture/INS-Architecture]] — Kiến trúc database phân hệ INS
- [[wiki/sources/INS-Troubleshooting-5Why]] — RCA và troubleshooting
- [[wiki/sources/INS-NhatKy-VanDe-2017]] — Nhật ký bug và brainstorming 2017
- [[wiki/sources/INS-C70-TinhLuong]] — C70 tính lương chi tiết
- [[wiki/sources/INS-InsuranceRecordDayCount]] — Tính số ngày nghỉ chứng từ BH
