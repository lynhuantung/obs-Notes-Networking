---
type: concept
tags: [HRM, Insurance, database, tables, schema]
date-updated: 2026-04-26
related:
  - "[[INS-Thiet-Ke-Chuc-Nang]]"
  - "[[INS-Nghiep-Vu]]"
  - "[[INS-IBHXH]]"
  - "[[INS-EBHXH]]"
  - "[[INS-Quy-Trinh]]"
---

# Cấu Trúc Database — Phân Hệ Bảo Hiểm (INS)

> Nguồn: VnResource HRM Pro 8 — Tài liệu thiết kế chức năng Bảo Hiểm
> Liên kết: [[INS-Thiet-Ke-Chuc-Nang]]

## Bảng đã xóa (Remove)

> ⚠️ **Không sử dụng:**
> - `Ins_InsuranceSalary` — đã xóa
> - `Hre_InsuranceRecord` — đã xóa

---

## Danh sách bảng phân hệ Bảo Hiểm

| STT | Tên bảng | Mô tả |
|-----|----------|-------|
| 1 | `Ins_ProfileInsuranceMonthly` | Trích nộp bảo hiểm hàng tháng |
| 2 | `Hre_Profile` | Thông tin nhân viên |
| 3 | `Cat_OrgStructure` | Cơ cấu tổ chức |
| 4 | `Sys_AsynTask` | Tác vụ bất đồng bộ |
| 5 | `Cat_DayOff` | Ngày nghỉ lễ |
| 6 | `Sal_InsuranceSalary` | Lương BHXH (xử lý phần trăm) |
| 7 | `Hre_StopWorking` | Xử lý nghỉ tạm hoãn |
| 8 | `Cat_GradePayroll` | Chế độ lương để lấy công thức bảo hiểm |
| 9 | `Ins_InsuranceRecord` | Chứng từ bảo hiểm |
| 10 | `Cat_LeaveDayType` | Loại ngày nghỉ có InsuranceType = E_PREGNANCY_SUCKLE |
| 11 | `Att_LeaveDay` | Ngày nghỉ |
| 12 | `Cat_HDTJobType` | Loại HDTJob (Honda sử dụng) |
| 13 | `Cat_ExchangeRate` | Tỉ giá (dùng để chuyển đổi tiền tệ) |
| 14 | `Cat_ValueEntity` | Mức trần đóng BH |
| 15 | `Cat_Element` | Phần tử bảo hiểm |
| 16 | `Cat_Region` | Vùng miền |
| 17 | `Cat_RegionDetail` | Chi tiết vùng miền |
| 18 | `Cat_RateInsurance` | Tỉ lệ bảo hiểm |
| 19 | `Sal_BasicSalary` | Lấy phần tử lương cơ bản (đã approved) |
| 20 | `Cat_SalaryRank` | Lấy phần tử |
| 21 | `Cat_UnusualAllowanceCfg` | Lấy phần tử |
| 22 | `Cat_OrgStructureType` | Lấy phần tử |
| 23 | `Cat_JobTitle` | Lấy phần tử |
| 24 | `Cat_Position` | Lấy phần tử |
| 25 | `Cat_UsualAllowance` | Phụ cấp |
| 26 | `Hre_WorkHistory` | Lịch sử phòng ban, chức danh, chức vụ... |
| 27 | `Cat_GradeAttendance` | Lấy dữ liệu nghỉ 14 ngày (DS chế độ công không sử dụng In/Out) |
| 28 | `Att_Grade` | Lấy dữ liệu nghỉ 14 ngày (DS NV sử dụng chế độ công) |
| 29 | `Att_Workday` | Lấy dữ liệu nghỉ 14 ngày (DS workday không bao gồm NV có chế độ lương ko dùng máy quét thẻ) |
| 30 | `Att_Roster` | Lấy dữ liệu nghỉ 14 ngày |
| 31 | `Att_RosterGroup` | Lấy dữ liệu nghỉ 14 ngày |
| 32 | `Hre_HDTJob` | Lấy dữ liệu nghỉ 14 ngày |
| 33 | `Cat_SalaryClass` | Phần tử bảo hiểm |
| 34 | `Cat_AbilityTile` | Phần tử bảo hiểm |
| 35 | `Cat_HDTJobGroup` | Phần tử bảo hiểm |
| 36 | `Sal_Grade` | Phần tử bảo hiểm |
| 37 | `Sal_UnusualAllowance` | Phần tử bảo hiểm |
| 38 | `Ins_ReportD02` | BC D02 |
| 39 | `Ins_ReportD02Item` | BC D02 item |
| 40 | `Ins_ReportD02V2` | BC D02 V2 (nhiều đợt) |
| 41 | `Ins_ReportD02ItemV2` | BC D02 V2 item (nhiều đợt) |
| 42 | `Ins_InsuranceSalaryPayback` | Điều chỉnh bảo hiểm |
| 43 | `Ins_TypeD02` | Loại D02 |
| 44 | `Ins_InsuranceForPayrollMonthly` | Phân tích bảo hiểm chốt tính lương |
| 45 | `Hre_HealthInsuranceCard` | Thẻ BHYT |
| 46 | `Cat_HealthTreatmentPlace` | Nơi đăng ký khám bệnh |
| 47 | `Cat_ExchangeRate` | Tỉ giá |
| 48 | `Cat_InsuranceGrade` | Chế độ bảo hiểm (công thức nghỉ 14 ngày) |
| 49 | `Ins_InsuranceGrade` | Chế độ bảo hiểm NV (công thức nghỉ 14 ngày) |
| 50 | `Hre_Relatives` | Người thân |
| 51 | `Cat_Village` | Phường xã |
| 52 | `Cat_UnAllowCfgAmount` | Mức thưởng phụ cấp |
| 53 | `Hre_ContractExtend` | Số phụ lục hợp đồng |
| 54 | `Cat_Branch` | Chi nhánh |
| 55 | `Cat_EmployeeType` | Loại nhân viên |
| 56 | `Cat_WorkPlace` | Nơi làm việc |
| 57 | `Att_CutOffDuration` | Kỳ công |
| 58 | `Sys_UserInfo` | Người dùng |
| 59 | `Sal_SalaryInformation` | Thông tin lương |
| 60 | `Hre_ProfileMoreInfo` | Thông tin thêm về nhân viên |
| 61 | `Cat_NameEntity` | — |
| 62 | `Cat_Religion` | Tôn giáo |
| 63 | `Ins_ChildSick` | Con ốm |
| 64 | `Cat_EthnicGroup` | Dân tộc |
| 65 | `Cat_District` | Quận huyện |
| 66 | `Cat_Country` | Thành phố / Quốc gia |
| 67 | `Cat_CostCentre` | Chi phí |
| 68 | `Sys_FieldInfoCustomValue` | — |
| 69 | `Cat_UnitStructure` | Khối phòng ban |
| 70 | `Cat_EnumTranslate` | Dịch enum |
| 71 | `Hre_Contract` | Hợp đồng |
| 72 | `Ins_InsuranceRecord` | Chứng từ bảo hiểm |

---

## Bảng trung tâm — Mô tả chi tiết

### `Ins_ProfileInsuranceMonthly`
Bảng lưu kết quả **trích nộp bảo hiểm hàng tháng** của từng nhân viên.
- Dùng để tính lương (Sal module lấy từ bảng này)
- Là kết quả đầu ra sau khi chạy phân tích bảo hiểm

### `Ins_InsuranceRecord`
Bảng lưu **chứng từ bảo hiểm** (ốm đau, thai sản, nghỉ ngắn ngày, con ốm...).
- Có Enum Status: đánh dấu chứng từ đã thanh toán hay chưa
- Liên kết: `Ins_ChildSick` (nếu loại chứng từ là con ốm)

### `Ins_ReportD02` / `Ins_ReportD02Item`
Bảng lưu báo cáo D02 và chi tiết từng dòng.
- Cho phép thêm/xóa/sửa sau khi đã tính
- Có trạng thái: Tự chỉnh, Tự tính

### `Ins_ReportD02V2` / `Ins_ReportD02ItemV2`
Phiên bản D02 hỗ trợ **nhiều đợt** trong tháng.

### `Ins_InsuranceSalaryPayback`
Bảng lưu dữ liệu **điều chỉnh bảo hiểm** (truy thu/thoái thu).
- Fields: `FromMonthEffect`, `ToMonthEffect`

### `Ins_InsuranceForPayrollMonthly`
Phân tích bảo hiểm **chốt tính lương** — dùng để lấy dữ liệu sang phân hệ Lương.

### `Hre_HealthInsuranceCard`
Lưu thông tin **thẻ BHYT** của nhân viên.

### `Cat_RateInsurance`
Lưu **tỉ lệ đóng bảo hiểm** (BHXH, BHYT, BHTN) cho từng loại.

### `Cat_ValueEntity`
Lưu **mức trần đóng BH** và lương tối thiểu theo từng thời điểm.

---

## Liên kết

- [[INS-Thiet-Ke-Chuc-Nang]] — Tổng quan
- [[INS-Nghiep-Vu]] — Nghiệp vụ tham chiếu các bảng
- [[INS-IBHXH]] — Mapping dữ liệu cột IBHXH
- [[INS-Quy-Trinh]] — Quy trình sử dụng các bảng
