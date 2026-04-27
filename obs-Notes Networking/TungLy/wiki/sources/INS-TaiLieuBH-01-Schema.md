---
type: source
tags: [bao-hiem, tai-lieu-bhxh, database, schema, cau-hinh, phan-tu-bh, HRM, V8, 2015]
created: 2026-04-27
updated: 2026-04-27
domain: ins
related:
  - [[wiki/sources/INS-ThietKe-V8]]
  - [[wiki/architecture/INS-Architecture]]
  - [[wiki/flows/Flow-BaoHiem-Monthly]]
  - [[wiki/concepts/HRM-Modules]]
---

# INS — Tài Liệu Bảo Hiểm 01 (Schema Database đầy đủ)

## Tóm tắt

Tài liệu bảo hiểm gốc từ năm **2015** (cập nhật đến 2026), được tổ chức thành 9 chương gồm: giới thiệu, mindmap, nghiệp vụ & biểu mẫu, chuỗi giá trị, database schema đầy đủ, UML, báo cáo động, vấn đề cấu hình, biểu đồ code. Đây là tài liệu **chi tiết nhất** về schema database phân hệ INS (72 bảng).

## Key Takeaways

### Schema chi tiết bảng trung tâm `Ins_ProfileInsuranceMonthly`
- **72+ fields** bao gồm: IsSocialInsurance, IsHealthInsurance, IsUnEmpInsurance
- Tính tiền: `AmountChargeIns = Allowance1+Allowance2+Allowance3+Allowance4 + SalaryInsurance`
- Field quan trọng: `IsDecreaseWorkingDays` (nghỉ >=14 ngày), `IsPregnant` (thai sản)
- Enum `ReductionType`: E_QUIT, E_PREGNANT, E_14_SICK, E_14_UNPAID, E_14_LEAVE
- Enum `LeaveType14Days`: E_14_LEAVE, E_14_UNPAID, E_14_SICK

### Schema `Ins_InsuranceRecord` — Chứng từ BH
- **InsuranceType enum**: E_SICK_SHORT, E_SICK_LONG, E_SICK_CHILD, E_PREGNANCY_EXAMINE, E_PREGNANCY_SUCKLE, E_PREGNANCY_PREVENTION, E_RESTORATION_PREGNANCY...
- **TypeSuckle**: E_SUCKLE_USUALLY (sinh thường), E_SUCKLE_SURGERY (sinh mổ), E_SUCKLE_TWINS (sinh đôi)
- **DocumentStatus** (dùng trong AVN): E_ATTACHFILEVALID, E_ORIGINFILEVALID, E_TEMPSAVE, E_WAITINGCONFIRM
- **Status**: E_CONFIRM, E_REJECT
- Field mới: FoetusAge, IsSurgeryOrUnder32Weeks, MotherLostDate, HealthDeclineRate (TNLĐ)

### Schema `Ins_ReportD02` / `Ins_TypeD02`
- `Ins_TypeD02` lưu ánh xạ TypeCode → StatusCode → DisplayCode
- Hỗ trợ: IsD02Ins, IsIIns, IsVIns (Viettel), IsVNPTIns — các kênh nộp D02

### Cấu hình bảo hiểm quan trọng

| Cấu hình | Kiểu | Mô tả |
|----------|------|-------|
| Chu kỳ BH | int | 16[N-1] → 15[N] |
| **Có Đếm Ngày Nghỉ** | bool | Đếm nghỉ >=14 ngày |
| **Số ngày nghỉ không đóng BH** | int | Mặc định 14 ngày |
| **Dữ liệu ngày nghỉ dựa vào** | string | E_LeaveDay / E_WorkDay / E_InsuranceRecord |
| **Phân tích BH theo đợt** | bool | Lưu vào D02V2 khi bật |
| **Xoá dữ liệu khi phân tích** | bool | Xử lý điều chỉnh BH |

### Phần tử bảo hiểm (Elements) — Tên công việc

| Mã | Tên | Nguồn |
|----|-----|-------|
| `INS_JOBNAME_JOBTITLE` | Chức Danh | `Cat_JobTitle.JobTitleNameInLaw` |
| `INS_JOBNAME_POSITION` | Chức Vụ | `Cat_Position.PositionNameInLaw` |
| `INS_SALARY_INSURANCE_ROOT` | Lương BHXH gốc | `Sal_InsuranceSalary.InsuranceAmount` |
| `INS_SALARY_INSURANCE_SENIORYEAR` | Năm thâm niên | Tháng tính BH - tháng bắt đầu đóng BH |

### Mã lỗi phân tích BH

| Mã | Lỗi | Hướng xử lý |
|----|-----|-------------|
| Err_001 | Chức danh theo luật trống | Danh mục > Chức danh |
| Err002 | Chức vụ theo luật trống | Danh mục > Chức vụ |
| Err003 | Chưa tổng hợp công | Tổng hợp công ATT trước |
| Err004 | Công thức lương BH không parse | Kiểm tra chế độ lương |
| Err006 | Currency VND/USD not found | Cat_Currency bị chỉnh, lương BHXH tham chiếu cũ |
| Err007 | Phần tử công thức không tồn tại | Kiểm tra Danh mục > Phần tử BH |
| Err008 | Nơi đóng BH trống | Màn hình chỉnh sửa NV |

### Mapping cột IBHXH Tăng (80 cột)
Bảng ánh xạ đầy đủ 80 cột từ IBHXH tăng sang database:
- Col5: `InsuranceMonthly.JobName`
- Col6: `D02.NewBasicSalary`
- Col12-13: `DateStart` / `DateEnd` (`Ins_ReportD02item`)
- Col20: Tình trạng sổ BH (SocialInsNo = null → 1, có → 2)
- Col29-31: Địa chỉ thường trú (xã/huyện/tỉnh)
- Col45-47: Số tài khoản / Ngân hàng / Chi nhánh

## Trích dẫn quan trọng

> Hai bảng đã xóa: ~~`Ins_InsuranceSalary`~~ và ~~`Hre_InsuranceRecord`~~ — không sử dụng

> `AmountChargeIns = Allowance1 + Allowance2 + Allowance3 + Allowance4 + SalaryInsurance + AmountHDTIns`

> Mã phần tử bảo hiểm **không được có khoảng trắng** trong tên

> Cat_RateInsurance: BHXH 8%+18%, BHYT 1.5%+3%, BHTN 1%+1% = tỉ lệ đóng tổng 32.5%

## Liên kết

- [[wiki/sources/INS-ThietKe-V8]] — Tài liệu thiết kế V8 (tổng quan)
- [[wiki/architecture/INS-Architecture]] — Kiến trúc database INS
- [[wiki/flows/Flow-BaoHiem-Monthly]] — Luồng phân tích BH hàng tháng
- [[wiki/sources/INS-Troubleshooting-5Why]] — RCA các lỗi phân tích BH
