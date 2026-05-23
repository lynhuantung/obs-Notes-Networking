---
type: concept
tags: [HRM, Insurance, IBHXH, D02, tang-giam, data-mapping]
date-updated: 2026-04-26
related:
  - "[[INS-Thiet-Ke-Chuc-Nang]]"
  - "[[INS-Nghiep-Vu]]"
  - "[[INS-EBHXH]]"
  - "[[INS-Bieu-Mau]]"
  - "[[INS-Database-Tables]]"
---

# Nghiệp Vụ IBHXH — Tăng và Giảm

> Nguồn: VnResource HRM Pro 8 — Tài liệu thiết kế chức năng Bảo Hiểm
> Liên kết: [[INS-Thiet-Ke-Chuc-Nang]] | [[INS-Nghiep-Vu]]

## Mã IBHXH Giảm

| Mã IBHXH | Trạng thái D02 | Diễn giải |
|----------|----------------|-----------|
| GH | E_GIAM_LD | Giảm lao động |
| GH | E_GIAM_LEAVE_PREMONTH_14WORKINGDAYS | Nghỉ việc mà trước đó nghỉ >= 14 ngày |
| GH | E_GIAM_TS_QUIT | Nghỉ việc sau khi nghỉ thai sản |
| GH | E_GIAM_QUIT_SUSPENSE | Giảm do nghỉ tạm hoãn |
| GD | E_GIAM_LD_CHANGE_INSPLACE | Giảm lao động do chuyển nơi đóng BH |
| KL | E_GIAM_LEAVE_14WORKINGDAYS | Giảm do nghỉ hơn 14 ngày |
| TS | E_GIAM_TS | Giảm thai sản |
| TS | E_GIAM_PREGNANT_14WORKINGDAYS | Giảm do nghỉ >= 14 ngày sau thai sản |
| SB | E_DieuChinhGiam | Điều chỉnh giảm |
| DC | E_GIAM_LUONG | Giảm mức đóng |
| DC | E_GIAM_LUONG_CHANGEJOBNAME | Giảm lương thay đổi chức danh |
| CD | E_CHANGEJOBNAME | Đổi chức danh |
| TU | E_GIAM_LD_BHYT | Giảm lao động trả thẻ BHYT kịp thời |
| TU | E_GIAM_LD_NOT_BHYT | Giảm lao động không trả thẻ |
| TU | E_GIAM_BHYT | Giảm BHYT |
| TU | E_GIAM_LD_BHYT_KOKIPTHOI | Giảm lao động không trả BHYT kịp thời |
| GN | E_GIAM_BHTN | Giảm BHTN |
| OF_1 | E_GIAM_BENH | Giảm bệnh |
| GL | E_GIAM_LD_CHANGE_LEGALENTITY | Giảm LĐ thay đổi pháp nhân |

---

## Mã IBHXH Tăng

| Mã IBHXH | Trạng thái D02 | Diễn giải |
|----------|----------------|-----------|
| TM | E_TANG_LD | Tăng lao động |
| TD | E_TANG_LD_CHANGE_INSPLACE | Tăng lao động do chuyển nơi đóng BH |
| ON | E_TANG_TS | Tăng thai sản |
| ON | E_TANG_BENH | Tăng bệnh |
| ON | E_TANG_LEAVE_14WORKINGDAYS | Tăng do nghỉ >= 14 ngày |
| DC | E_TANG_LUONG | Tăng mức đóng |
| DC | E_TANG_LUONG_CHANGEJOBNAME | Tăng lương thay đổi chức danh nghề |
| CD | E_CHANGEJOBNAME | Đổi chức danh |
| AD | E_DieuChinhTang | Điều chỉnh tăng |
| TT | E_TANG_BHYT | Tăng BHYT |
| TN | E_TANG_BHTN | Tăng BHTN |
| TL | E_TANG_LD_CHANGE_LEGALENTITY | Tăng LĐ thay đổi pháp nhân |

---

## Cấu trúc dữ liệu — Mẫu IBHXH Tăng

| Mã cột | Tên | Cách lấy dữ liệu |
|--------|-----|------------------|
| Col0 | STT | Stt |
| Col1 | Tên NV | ProfileName |
| Col2 | Số sổ BH | Profile.SocialInsNo |
| Col3 | Ngày sinh | Profile.DateOfBirth |
| Col4 | Giới tính | Profile.Gender |
| Col5 | Chức danh, chức vụ | InsuranceMonthly.JobName |
| Col6 | Lương BHXH | D02.NewBasicSalary |
| Col8 | PC1 | D02.Allowance1 |
| Col9 | PC2 | D02.Allowance2 |
| Col10 | PC3 | D02.Allowance3 |
| Col11 | PC khác | D02.AllowanceAdditional |
| Col12 | Hiệu lực HĐ/QĐ Từ Ngày | `Ins_ReportD02item.DateStart` |
| Col13 | Hiệu lực HĐ/QĐ Đến Ngày | `Ins_ReportD02item.DateEnd` |
| Col14 | Trạng thái D02 | insReportD02ItemStatus |
| Col15 | Số HĐ/QĐ Tăng | `Ins_ReportD02item.DecisionNo` |
| Col16 | Loại HĐ | insReportD02Item.DecisionType |
| Col17 | Ngày Kí HĐ | `Ins_ReportD02item.DecisionDatesigned` |
| Col18 | Tỉ lệ đóng | 32.5 (cố định) |
| Col20 | Tình trạng sổ BH | Nếu SocialInsNo = Null → 1, ngược lại → 2 |
| Col22 | Mã Tỉnh bệnh viện | Profile.ProvinceHospital |
| Col23 | Mã bệnh viện | Profile.HealthTreatmentPlaceCode |
| Col24 | Mã quốc tịch | `Hre_Profile.NationalityID => Cat_Country.Code` |
| Col25 | Dân tộc | `Hre_Profile.EthnicID => Cat_EthnicGroup.EthnicGroupName` |
| Col26 | CMND | Profile.IDNo (VN) / Profile.PassportNo (nước ngoài) |
| Col27 | Ngày cấp CMND | Profile.IDDateOfIssue (VN) / Profile.PassportDateOfIssue |
| Col45 | Số tài khoản | `Sal_SalaryInformation.AccountNo` |
| Col46 | Ngân hàng | `Cat_Bank.BankName` |
| Col47 | Chi nhánh NH | `Sal_SalaryInformation.BankBrandName` |
| Col48 | Lương BHXH | `Ins_ReportD02Item.InsuranceSalary` |
| Col49 | Phòng ban | `Cat_OrgUnit.E_BRANCH` (fallback: Cat_Orgstructure.OrgStructureName) |
| Col50 | Nơi cấp BHXH | `Hre_Profile.SocialInsIssuePlace` |
| Col51 | Nơi đăng ký khám bệnh | `Hre_Profile.HealthTreatmentPlace` |
| Col52 | Mã ngân hàng | `Sal_SalaryInformation.BankID => Cat_Bank.BankCode` |
| Col53 | Mã chi nhánh NH | `Sal_SalaryInformation.BranchID => Cat_Branch.BranchCode` |

---

## Cấu trúc dữ liệu — Mẫu IBHXH Giảm

| Mã cột | Tên | Cách lấy dữ liệu |
|--------|-----|------------------|
| Col0 | Số thứ tự | Stt |
| Col1 | Tên NV | Profile.ProfileName |
| Col2 | Số sổ BH | Profile.SocialInsNo |
| Col3 | Ngày sinh | Profile.DateOfBirth |
| Col4 | Giới tính (nữ là X) | Profile.Gender |
| Col5 | Chức danh chức vụ | InsuranceMonthly.JobName |
| Col6 | Lương BHXH | D02Item.NewBasicSalary |
| Col8 | Phụ cấp 1 | D02Item.Allowance1 |
| Col9 | PC 2 | D02Item.Allowance2 |
| Col10 | PC 3 | D02Item.Allowance3 |
| Col11 | PC thêm | D02Item.AllowanceAdditional |
| Col12 | Ngày hiệu lực HĐ (từ ngày) | `Ins_ReportD02item.DateStart` |
| Col13 | Ngày hiệu lực HĐ (Đến ngày) | `Ins_ReportD02item.DateEnd` |
| Col14 | Trạng thái D02 | D02Item.Status |
| Col15 | Số HĐ | `Ins_ReportD02item.DecisionNo` |
| Col16 | Ngày ký HĐ | `Ins_ReportD02item.DecisionDatesigned` |
| Col17 | Tỉ lệ đóng | 32.5 (cố định) |
| Col20 | Không Trả Thẻ BHYT | Nếu loại GH → 1, ngược lại null |
| Col19 | Giảm | Nếu `Hre_Profile.ReceiveHealthIns = 1` → "X", ngược lại Null |
| Col26 | Mã NV | Profile.CodeEmp |
| Col27 | Số tài khoản | `Sal_SalaryInformation.AccountNo` |
| Col28 | Ngân hàng | `Cat_Bank.BankName` |
| Col29 | Chi nhánh NH | `Sal_SalaryInformation.BankBrandName` |
| Col30 | Lương BHXH | `Hre_Profile.Sal_InsuranceSalary` |
| Col31 | Phòng ban | `Cat_OrgUnit.E_BRANCH` (fallback: Cat_Orgstructure.OrgstructureName) |
| Col32 | Nơi cấp BHXH | `Hre_Profile.SocialInsIssuePlace` |
| Col33 | Nơi ĐK khám bệnh | `Hre_Profile.HealthTreatmentPlace` |
| Col34 | Quốc tịch | `Hre_Profile.NationalityID => Cat_Country.CountryName` |

---

## Liên kết

- [[INS-Nghiep-Vu]] — Nghiệp vụ tăng/giảm tổng quan
- [[INS-EBHXH]] — Mã EBHXH (so sánh)
- [[INS-Bieu-Mau]] — Biểu mẫu D02-TS
- [[INS-Database-Tables]] — Bảng `Ins_ReportD02Item`, `Hre_Profile`
