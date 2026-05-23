---
type: source
domain: ins
tags:
  - bao-hiem
  - HRM
  - INS
  - VnResource
created: 2015-02-21
updated: 2026-04-27
khach-hang: VnResource (nội bộ)
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX]]"
source: "[[1. Projects/Nghiệp vụ HRM/INS/Ins_TaiLieuBaoHiem_01]]"
---
# INS — Cấu Trúc Database Phân Hệ BH

> **Domain**: Bảo hiểm (BHXH / BHYT / BHTN)
> **Khách hàng**: VnResource (nội bộ)
> **Ngày ghi**: 21/02/2015
> **Nội dung**: Schema 18+ bảng: Ins_ProfileInsuranceMonthly, Ins_InsuranceRecord, D02, D02Item, InsuranceSalaryPayback...

---

## Không sử dụng bảng : \"~~Ins_InsuranceSalary~~\",\"~~Hre_InsuranceRecord~~\"

## ~~Ins_InsuranceSalary (Remove)~~

## ~~Hre_InsuranceRecord (Remove)~~

## Ins_ProfileInsuranceMonthly

| **Ins_ProfileInsuranceMonthly** **(Phân Tích Bảo Hiểm)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | **ID** | **uniqueidentifier** |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | *MonthYear* | DateTime |  | Tháng Năm |
|  | SocialInsPlaceID | uniqueidentifier | Cat_Province | Nơi Đóng BH |
|  | IsSocialInsurance | bit |  | Đóng BHXH |
|  | IsHealthInsurance | bit |  | Đóng BHYT |
|  | IsUnEmpInsurance | bit |  | Đóng BHTN |
|  | MoneySocialInsurance | double |  | Tiền BHXH |
|  | MoneyHealthInsurance | double |  | Tiền BHYT |
|  | MoneyUnEmpInsurance | double |  | Tiền BHTN |
|  | SalaryInsurance | float |  | Lương BHXH |
|  | Allowance1 | double |  | PC1 |
|  | Allowance2 | double |  | PC2 |
|  | Allowance3 | double |  | PC3 |
|  | Allowance4 | double |  | PC4 |
|  | AllowanceAdditional | double |  | Phụ cấp thêm |
|  | AmountChargeIns | double |  | Tổng số tiền |
|  | SocialInsEmpRate | double |  |  |
|  | HealthInsEmpRate | double |  |  |
|  | UnemployEmpRate | double |  |  |
|  | SocialInsComRate | double |  |  |
|  | HealthInsComRate | double |  |  |
|  | UnemployComRate | double |  |  |
|  | SocialInsEmpAmount | double |  |  |
|  | HealthInsEmpAmount | double |  |  |
|  | UnemployEmpAmount | double |  |  |
|  | SocialInsComAmount | double |  |  |
|  | HealthInsComAmount | double |  |  |
|  | UnemployComAmount | double |  |  |
|  | JobName | Nvarchar(200) |  | Chức Danh , hoặc tên công việc |
|  | SalaryUnEmpInsurance | double |  | Lương BHTN |
|  | SalaryHealthInsurance | double |  | Lương BHTN |
|  | ~~TypeGetData~~ | Nvarchar(100) |  | GETTEMP,GETFINAL |
|  | ~~WorkPlaceID~~ | ~~uniqueidentifier~~ | Cat_WorkPlace | Không dùng field này |
|  | IsDecreaseWorkingDays | bit |  | Có Nghỉ \>= 14 ngày |
|  | AmountHDTIns | double |  | Tiền HDTJob(Honda) |
|  | HDTGroupCode | Nvarchar(100) |  | Mã HDTJob(Honda) |
|  | IsPregnant | bit |  | Có Thai Sản |
|  | MonthYearEffect | DateTime |  | Tháng truy lĩnh |
|  | IsPayback | Bit |  | Có Điều Chỉnh |
|  | PaybackID | uniqueidentifier |  |  |
|  | CostCentreID | Uniqueidentifier | Cat_CostCentre | Hre_WorkHistory.CostCentreID |
|  | JobTitleID | Uniqueidentifier | Cat_JobTitle | Hre_WorkHistory.JobTitleID |
|  | PositionID | Uniqueidentifier | Cat_Position | Hre_WorkHistory.PositionID |
|  | SalaryClassID | Uniqueidentifier | Cat_SalaryClass | Hre_WorkHistory.SalaryClassID |
|  | PayrollGroupID | Uniqueidentifier | Cat_PayrollGroup | Hre_WorkHistory.PayrollGroupID |
|  | SalGradeID | Uniqueidentifier | Cat_GradeCfg | Dựa vào lịch sử NV |
|  | AttGradeID | Uniqueidentifier | Cat_GradeAttendance | Dựa vào lịch sử NV |
|  | CostActivityID | Uniqueidentifier | Cat_CostActivity | Hre_WorkHistory.CostActivityID |
|  | EmployeeGroupID | Uniqueidentifier | Cat_NameEntity | Hre_WorkHistory.EmployeeGroupID |
|  | LaborType | Nvarchar(200) |  | Hre_WorkHistory.LaborType |
|  | EmployeeTypeID | uniqueidentifier | Cat_EmployeeType | Hre_WorkHistory.EmployeeTypeID |
|  | IsQuit | Bit |  | Có Nghỉ Việc |
|  | TypeHDTIns | varchar(50) |  | Loại HDT |
|  | SortID | int |  |  |
|  | OrgStructureID | Uniqueidentifier | Cat_OrgStructure | Hre_WorkHistory.OrganizationStructureID |
|  | E_MoneySocialInsurance | Varchar(2000) |  | Tiền BHXH |
|  | E_MoneyUnEmpInsurance | Varchar(2000) |  | Tiền BHTN |
|  | E_MoneyHealthInsurance | Varchar(2000) |  | Tiền BHYT |
|  | E_SalaryInsurance | Varchar(2000) |  | Lương BHXH |
|  | E_SocialInsEmpAmount | Varchar(2000) |  | Tiền BHXH NV đóng |
|  | E_HealthInsEmpAmount | Varchar(2000) |  | Tiền BHYT NV đóng |
|  | E_UnemployEmpAmount | Varchar(2000) |  | Tiền BHTN NV đóng |
|  | E_SocialInsComAmount | Varchar(2000) |  | Tiền BHXH cty đóng |
|  | E_HealthInsComAmount | Varchar(2000) |  | Tiền BHYT cty đóng |
|  | E_UnemployComAmount | Varchar(2000) |  | Tiền BHTN cty đóng |
|  | E_SalaryUnEmpInsurance | Varchar(2000) |  | Lương BHTN |
|  | E_SalaryHealthInsurance | Varchar(2000) |  | Lương BHYT |
|  | SalaryRate | Float |  |  |
|  | UsualAllowanceType1 | uniqueidentifier |  | Loại phụ cấp 1 |
|  | UsualAllowanceType2 | uniqueidentifier |  | Loại phụ cấp 2 |
|  | UsualAllowanceType3 | uniqueidentifier |  | Loại phụ cấp 3 |
|  | UsualAllowanceType4 | uniqueidentifier |  | Loại phụ cấp 4 |
|  | AbilityTileID | uniqueidentifier | Cat_AbilityTile | Cat_AbilityTile.ID |
|  | CompanyID | uniqueidentifier | Cat_Company | Cat_Company.ID |
|  | PayrollCategoryID | uniqueidentifier | Cat_PayrollCategory | Cat_PayrollCategory.ID |
|  | UnitStructureID | uniqueidentifier | Cat_UnitStructure | Hre_WorkHistory.UnitStructureID |
|  | Period | Int |  | Đợt phân tích |
|  | LeaveDayType | Varchar(50) |  | Các Loại ngày nghỉ trong cat_LeaveDayType cách nhau bởi dấu phẩy (vd: ABS,LT09091) |
|  | LeaveType14Days | Varchar(50) |  | Loại nghỉ 14 ngày (enum LeaveType14Days) , nghỉ ốm, nghỉ không lương, nghỉ 14 ngày |
|  | RegionID | uniqueidentifier | Cat_Region | Vùng miền |
|  | ContractID | uniqueidentifier | Hre_Contract | Hợp đồng (lấy từ lương BHXH \[Sal_InsuranceSalary\] |
|  | ContractExtendID | uniqueidentifier | Hre_ContractExtend | Phụ lục hợp đồng (lấy từ lương BHXH \[Sal_InsuranceSalary\] |
|  | AreaPostJobWorkID | uniqueidentifier | Cat_NameEntity | Vùng làm việc |
|  | Status | varchar(50) |  | Trạng thái xác nhận: E_CONFIRMED |
|  | EmploymentType | varchar(100) |  | Hình thức lao động |
|  | DistributionChannelID | uniqueidentifier | Cat_NameEntity | Kênh phân phối |
|  | MarketDomainID | uniqueidentifier | Cat_NameEntity |  |
|  | RegionMarketID | uniqueidentifier | Cat_NameEntity | Vùng thị trường |
|  | MarketAreaID | uniqueidentifier | Cat_NameEntity |  |
|  | OriginalDistributorID | uniqueidentifier | Cat_NameEntity |  |
|  | OtherDistributors | varchar(500) |  |  |
|  | ShopID | uniqueidentifier | Cat_Shop |  |
|  | UsualAllowanceGroupID | uniqueidentifier | Cat_UsualAllowanceGroup | Nhóm phụ cấp |
|  | SalaryPaidByTheFormOf | Varchar(50) |  | Tính lương theo hình thức |
|  | CoefficientOfWorkmanship | float |  | Hệ số tay nghề |
|  | ReductionType | Varchar(50) |  | Loại giảm 14 ngày |
|  | SMCompRate | float |  | ốm đau,TS NSDLĐ đóng (%) |
|  | SMCompAmount | float |  | Tiền ốm đau,TS NSDLĐ |
|  | OADCompRate | float |  | TNLĐ,BNN NSDLĐ đóng (%) |
|  | OADCompAmount | float |  | Tiền TNLĐ,BNN NSDLĐ đóng |
|  | PSCompRate | float |  | Hưu trí ,Tử tuất NSDLĐ đóng (%) |
|  | PSCompAmount | float |  | Tiến hưu trí,Tử tuất NSDLĐ đóng |
|  | E_SMCompAmount | Varchar(2000) |  | Tiền ốm đau,TS NSDLĐ(mã hóa) |
|  | E_OADCompAmount | Varchar(2000) |  | Tiền TNLĐ,BNN NSDLĐ đóng (mã hóa) |
|  | E_PSCompAmount | Varchar(2000) |  | Tiến hưu trí,Tử tuất NSDLĐ đóng (mã hóa) |
|  | TotalSickleaveDays | int |  | Tổng số ngày nghỉ ốm (trong nghỉ 14 ngày) |
|  | TotalUnpaidLeaveDays | int |  | Tổng số ngày nghỉ không lương (trong nghỉ 14 ngày) |
|  | WorkingDays | float |  |  |
|  | BaseInsuranceSalary | float |  | Lương BHXH gốc |
|  | E_BaseInsuranceSalary | Varchar(1000) |  | Lương BHXH gốc |
| Qui Tắc: - AmountChargeIns =Allowance1+Allowance2+Allowance3+Allowance4+ (*SalaryInsurance+AmountHDTIns*) - TypeHDTIns : enum (E_TYPE4,E_TYPE5) - LeaveType14Days: enum (LeaveType14Days.E_14_LEAVE, LeaveType14Days.E_14_UNPAID, LeaveType14Days.E_14_SICK) - ReductionType : enum (E_QUIT, E_PREGNANT, E_14_SICK, E_14_UNPAID, E_14_LEAVE) |  |  |  |  |

##  Sal_InsuranceSalary

| **Sal_InsuranceSalary** **(Lương BHXH)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
| # | ID | uniqueidentifier |  |  |
| # | ProfileID | uniqueidentifier | Hre_Profile |  |
| # | DateEffect | DateTime |  | Ngày Hiệu Lực (bắt buộc) |
| # | InsuranceAmount | double |  | Số Lương |
| # | CurrencyID | uniqueidentifier | Cat_Currency | Tiền tệ |
| # | IsSocialIns | Bit |  | Đóng BHXH |
| # | IsMedicalIns | Bit |  | Đóng BHYT |
| # | IsUnimploymentIns | Bit |  | Đóng BHTN |
|  | DecisionNo | nvarchar(100) |  |  |
|  | Note | nvarchar(200) |  |  |
|  | InsuranceRate | float |  |  |
|  | Allowance1 | Float |  |  |
|  | Allowance2 | Float |  |  |
|  | Allowance3 | Float |  |  |
|  | Allowance4 | float |  |  |
|  | RankID | uniqueidentifier | Cat_SalaryClass |  |
|  | RankDetailID | uniqueidentifier | Cat_SalaryRank |  |
|  | E_InsuranceAmount | varchar(2000) |  |  |
|  | OrgStructureID | uniqueidentifier | Cat_OrgStructure |  |
|  | PositionID | uniqueidentifier | Cat_Position |  |
|  | JobTitleID | uniqueidentifier | Cat_JobTitle |  |
|  | EmployeeTypeID | uniqueidentifier | Cat_EmployeeType |  |
|  | PayrollGroupID | uniqueidentifier | Cat_PayrollGroup |  |
|  | CostCentreID | uniqueidentifier | Cat_CostCentre |  |
|  | WorkPlaceID | uniqueidentifier | Cat_WorkPlace |  |
|  | SalaryClassID | uniqueidentifier | Cat_SalaryClass |  |
|  | EmployeeGroupID | uniqueidentifier | Cat_NameEntity |  |
|  | CostActivityID | uniqueidentifier | Cat_CostActivity |  |
|  | LaborType | nvarchar(100) |  |  |
|  | AbilityTileID | uniqueidentifier | Cat_AbilityTile |  |
|  | CompanyID | uniqueidentifier | Cat_Company |  |
|  | PayrollCategoryID | uniqueidentifier | Cat_PayrollCategory |  |
|  | UnitStructureID | uniqueidentifier | Cat_UnitStructure |  |
|  | ContractID | uniqueidentifier | Hre_Contract |  |
|  | ContractExtendID | uniqueidentifier | Hre_ContractExtend |  |
|  | AreaPostJobWorkID | uniqueidentifier | Cat_NameEntity |  |
|  | AllowanceID1 | uniqueidentifier | Cat_UsualAllowance |  |
|  | AllowanceID2 | uniqueidentifier | Cat_UsualAllowance |  |
|  | AllowanceID3 | uniqueidentifier | Cat_UsualAllowance |  |
|  | AllowanceID4 | uniqueidentifier | Cat_UsualAllowance |  |
|  | CurrencyID1 | uniqueidentifier | Cat_Currency |  |
|  | CurrencyID2 | uniqueidentifier | Cat_Currency |  |
|  | CurrencyID3 | uniqueidentifier | Cat_Currency |  |
|  | CurrencyID4 | uniqueidentifier | Cat_Currency |  |
|  | E_Allowance1 | varchar(2000) |  |  |
|  | E_Allowance2 | varchar(2000) |  |  |
|  | E_Allowance3 | varchar(2000) |  |  |
|  | E_Allowance4 | varchar(2000) |  |  |
|  | EmploymentType | varchar(100) |  |  |
|  | DistributionChannelID | uniqueidentifier | Cat_NameEntity |  |
|  | MarketDomainID | uniqueidentifier | Cat_NameEntity |  |
|  | RegionMarketID | uniqueidentifier | Cat_NameEntity |  |
|  | MarketAreaID | uniqueidentifier | Cat_NameEntity |  |
|  | OriginalDistributorID | uniqueidentifier | Cat_NameEntity |  |
|  | OtherDistributors | nvarchar(1000) |  |  |
|  | ShopID | uniqueidentifier | Cat_Shop |  |
|  | UsualAllowanceGroupID | uniqueidentifier | Cat_UsualAllowanceGroup |  |
|  | SalaryPaidByTheFormOf | varchar(50) |  |  |
|  | CoefficientOfWorkmanship | float |  |  |
|  | IsPayback | bit |  |  |

##  Ins_InsuranceRecord

| **Ins_InsuranceRecord** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | InsuranceType | Nvarchar(50) |  | Enum (Loại Chứng Từ) |
|  | RecordDate | DateTime |  | Ngày nhận Chứng Từ |
|  | DateStart | DateTime |  | Bắt Đầu chứng từ |
|  | DateEnd | DateTime |  | Kết Thúc chứng từ |
|  | DateSuckle | DateTime |  | Ngày Sinh Con |
|  | TypeSuckle | Nvarchar(50) |  | Enum (Loại Sinh Con) |
|  | TypeSick | Nvarchar(50) |  | Loại Bệnh |
|  | DateStartWorking | DateTime |  | Ngày đi làm lại |
|  | DayCount | double |  | Số ngày nghỉ |
|  | DayCountOld | double |  |  |
|  | LeaveInYear | double |  | Lũy kế từ đầu năm |
|  | Status | Nvarchar(50) |  | Trạng thái |
|  | Comment | Nvarchar(1000) |  |  |
|  | RelativesID | uniqueidentifier | Hre_Relatives | Người thân |
|  | ChildSickID | uniqueidentifier | Ins_ChildSick |  |
|  | TypeData | Nvarchar(100) |  | Nơi dưỡng sức |
|  | FileAttachment | nvarchar(2000) |  |  |
|  | IsPaymented | bit |  | Thanh toán |
|  | **SortID** | **int** |  |  |
|  | Amount | Float |  | Số tiền (C70A Chuyển qua) |
|  | TreatmentLine | Nvarchar(200) |  | Tuyến điều trị |
|  | InsRecordCode | Nvarchar(100) |  | Mã chứng từ |
|  | OrgStructureID | uniqueidentifier | Cat_OrgStructure |  |
|  | PositionID | uniqueidentifier | Cat_Position |  |
|  | JobTitleID | uniqueidentifier | Cat_JobTitle |  |
|  | EmployeeTypeID | uniqueidentifier | Cat_EmployeeType |  |
|  | PayrollGroupID | uniqueidentifier | Cat_PayrollGroup |  |
|  | CostCentreID | uniqueidentifier | Cat_CostCentre |  |
|  | WorkPlaceID | uniqueidentifier | Cat_WorkPlace |  |
|  | SalaryClassID | uniqueidentifier | Cat_SalaryClass |  |
|  | EmployeeGroupID | uniqueidentifier | Cat_NameEntity |  |
|  | CostActivityID | uniqueidentifier | Cat_CostActivity |  |
|  | LaborType | Nvarchar(100) |  |  |
|  | AbilityTileID | uniqueidentifier | Cat_AbilityTile |  |
|  | CompanyID | uniqueidentifier | Cat_Company |  |
|  | PayrollCategoryID | uniqueidentifier | Cat_PayrollCategory |  |
|  | UnitStructureID | uniqueidentifier | Cat_UnitStructure |  |
|  | DateSettlement | Datetime |  | Ngày đề nghị |
|  | DateDelivery | Datetime |  | Ngày BH trả kết quả |
|  | DatePayment | Datetime |  | Ngày thanh toán |
|  | Settlement | int |  | Lần đề nghị |
|  | MonthYearSettlement | Datetime |  | Tháng đề nghị |
|  | InsuranceStatus | Nvarchar (100) |  | Tình trạng C70A |
|  | InsuranceTime | DateTime |  | Thời điểm |
|  | EmploymentType | varchar(100) |  |  |
|  | DistributionChannelID | uniqueidentifier | Cat_NameEntity |  |
|  | MarketDomainID | uniqueidentifier | Cat_NameEntity |  |
|  | RegionMarketID | uniqueidentifier | Cat_NameEntity |  |
|  | MarketAreaID | uniqueidentifier | Cat_NameEntity |  |
|  | OriginalDistributorID | uniqueidentifier | Cat_NameEntity |  |
|  | OtherDistributors | nvarchar(1000) |  |  |
|  | ShopID | uniqueidentifier | Cat_Shop |  |
|  | SickID | uniqueidentifier | Cat_Sick |  |
|  | TreatmentLineID | uniqueidentifier | Cat_NameEntity |  |
|  | UsualAllowanceGroupID | uniqueidentifier | Cat_UsualAllowanceGroup |  |
|  | SalaryPaidByTheFormOf | Varchar(50) |  |  |
|  | CoefficientOfWorkmanship | float |  |  |
|  | IDNoOfWife | Nvarchar(50) |  | CMND/TCC của vợ |
|  | SeriNo | Nvarchar(50) |  | Số seri |
|  | FoetusAge | int |  | Tuổi thai |
|  | DocumentLink | Nvarchar(500) |  | Đường dẫn tài liệu |
|  | BaseInsurancePayment | float |  | Lương thánh toán bảo hiểm |
|  | WorkingCondition | Nvarchar(100) |  | ĐIều kiện làm việc |
|  | WeeklyDayOff | Nvarchar(200) |  | Ngày nghỉ hàng tuần |
|  | IsMaternityLeave | bit |  | Nghỉ dưỡng thai |
|  | AdditionalSettlement | int |  | Lần bổ sung |
|  | AdditionalMonthYearSettlement | date |  | Tháng bổ sung |
|  | PaymentMethod | Nvarchar(100) |  | Hình thức nhận |
|  | NumberOfChildSick | int |  | Số con ốm |
|  | AntenatalCareCondition | nvarchar(100) |  | Điều kiện khám thai |
|  | ChildbirthCondition | nvarchar(100) |  | Điều kiện sinh con |
|  | ChildrenNumber | int |  | Số con |
|  | ChildLostDate | datetime |  | Ngày con chết |
|  | NumberOfLostChild | int |  | Số con chết |
|  | AdoptionDate | date |  | Ngày nhận nuôi con |
|  | SurrogacyAdoptionDate | date |  | Ngày nhận con (Mang thai hộ) |
|  | MotherSocialInsuranceNumer | Nvarchar(200) |  | Mã số BHXH của mẹ |
|  | MotherHealthInsuranceCardNumber | Nvarchar(200) |  | Số thẻ BHYT của mẹ |
|  | MotherIDNumber | Nvarchar(200) |  | Số CMND của mẹ |
|  | SurrogacyType | Nvarchar(200) |  | Mang thai hộ |
|  | IsSurgeryOrUnder32Weeks | bit |  | Phẫu thuật hoặc thai dưới 32 tuần |
|  | MotherLostDate | date |  | Ngày mẹ chết |
|  | ConclusionDate | date |  | Ngày kết luận mẹ không đủ điều kiện chăm con |
|  | MedicalExaminationFees | float |  | Phí giám định y khoa |
|  | NurturerSocialInsuranceNumer | Nvarchar(200) |  | Mã số BHXH của người nuôi dưỡng |
|  | IsFatherTakeCareOfChild | bit |  | Cha nghỉ chăm con |
|  | AdjustmentReason | Nvarchar(1000) |  | Lý do đề nghị điều chỉnh |
|  | HealthDeclineRate | float |  | Tỉ lệ suy giảm |
|  | DiagnosticDate | date |  | Ngày giám định |
|  | AccountNumber | Nvarchar(200) |  | Số tài khoản |
|  | BankID | uniqueidentifier |  | Ngân hàng |
|  | BranchID | uniqueidentifier |  | Chi nhánh |
|  | IDNo | Nvarchar(100) |  | Số CMND/CCCD |
|  | InsuranceCode | Nvarchar(100) |  | Mã số BHXH |
|  | ChildHealthInsNo | Nvarchar(100) |  | Số thẻ BHYT của con |
|  | SickName | Nvarchar(200) |  | Bệnh |
|  | ChildInsuranceCode | Nvarchar(100) |  | Mã số BHXH của con |
| [~~ ~~]{.mark} | [~~ChildDateOfBirth~~]{.mark} | [~~date~~]{.mark} | **[~~ ~~]{.mark}** | **[~~ ~~]{.mark}** |
| [~~ ~~]{.mark} | [~~ChillDateOfBirth~~]{.mark} | [~~date~~]{.mark} | **[~~ ~~]{.mark}** | **[~~ ~~]{.mark}** |
|  | RejectReason | Nvarchar(1000) |  | Lý do từ chối |
|  | DocumentStatus | varchar(32) |  | Trạng thái chứng từ |
|  | UserSubmit | uniqueidentifier | Hre_Profile | Người đăng ký |
|  | DatePregnancy | date |  | Ngày mang thai |
|  | ActualAmount | float |  | Số tiền BHXH thanh toán |
| **InsuranceType**: [E_SICK_SHORT]{.mark}, [E_SICK_LONG]{.mark}, [E_SICK_CHILD]{.mark},[E_PREGNANCY_EXAMINE]{.mark},[E_PREGNANCY_LOSTE_PREGNANCY_SUCKLE]{.mark},[E_PREGNANCY_PREVENTION]{.mark} ,[E_RESTORATION_PREGNANCY]{.mark} ,.... Tham khảo thêm trong file excel dưới đây: ![](Ins_TaiLieuBaoHiem_01_image27.emf) **TypeSuckle (loại sinh con**): [E_SUCKLE_USUALLY]{.mark} (sinh thường), [E_SUCKLE_SURGERY]{.mark}(sinh mổ),[E_SUCKLE_TWINS]{.mark}(sinh đôi) **DocumentStatus (Trạng thái chứng từ, dùng trong dự án AVN**): E_ATTACHFILEVALID (\"HS Đính kèm hợp lệ\") E_ATTACHFILEINVALID (\"HS Đính kèm không hợp lệ\") E_ORIGINFILEVALID (\"HS gốc hợp lệ\") E_ORIGINFILEINVALID (\"HS gốc không hợp lệ\") E_TEMPSAVE (\"Lưu tạm\") E_WAITINGCONFIRM (\"Chờ xác nhận\") **Status (Trạng thái**): E_CONFIRM (\"Xác nhận\") E_REJECT (\"Từ chối\") **PaymentStatus (Trang thái thanh toán, sử dụng enum PaymentStatusV2):** E_Paid (\"Đã thanh toán\") E_Unpaid (\"Chưa thanh toán\") E_NoPaid (\"Không thanh toán\") |  |  |  |  |

##  Ins_ReportD02

| **Ins_ReportD02** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ReportD02Name | Nvarchar(100) |  | "Kỳ Tạm Thời - 05/2016" |
|  | DateReport | DateTime |  | Ngày lập báo cáo |
|  | DateMonth | DateTime |  | Tháng kiểm tra |
|  | DateStart | DateTime |  | 16 tháng \[N-1\] |
|  | DateEnd | DateTime |  | 15 tháng \[N\] |
|  | SociaInsCountPro | Int |  |  |
|  | SociaInsTotalSalary | double |  |  |
|  | HealthInsCountPro | Int |  |  |
|  | HealthInsTotalSalary | double |  |  |
|  | UnEmpInsCountPro | Int |  |  |
|  | UnEmpInsTotalSalary | double |  |  |
|  | MaxSalary | double |  |  |
|  | MinSalary | double |  |  |
|  | DateOfEffectMax | DateTime |  |  |
|  | DateOfEffectMin | DateTime |  |  |
|  | Type | Nvarchar(50) |  | GETTEMP |
|  | ~~PayBackID~~ | ~~uniqueidentifier~~ | ~~InsuranceSalaryPayback~~ | Không sử dụng field này |
| Note: ReportD02Name là "Kỳ Tạm Thời" + DateMonth |  |  |  |  |

##  Ins_ReportD02Item

| **Ins_ReportD02Item** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ReportD02ID | uniqueidentifier | Ins_ReportD02 |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | OldBasicSalary | Double |  | Lương Tháng Trước |
|  | NewBasicSalary | Double |  | Lương BHXH Và Phụ Cấp |
|  | RateSocialIns | Double |  |  |
|  | RateHealthIns | Double |  |  |
|  | RateUnEmpIns | Double |  |  |
|  | NotCardHealth | Bit |  |  |
|  | Status | Nvarchar(100) |  | E_TANG_LD,... |
|  | Type | Nvarchar(100) |  | E_TANG,E_GIAM... |
|  | MonthFrom | DateTime |  | 16 Tháng \[N-1\] |
|  | MonthTo | DateTime |  | 15 Tháng \[N\] |
|  | MonthConvertRecord | DateTime |  |  |
|  | ItemOrder | Int |  |  |
|  | Comment | Nvarchar(1000) |  | Mô tả trạng thái |
|  | IsUserCreate | Bit |  |  |
|  | JobName | Nvarchar(200) |  | Tên Công Việc |
|  | Allowance1 | Double |  | PC1 trong lương CB |
|  | Allowance2 | Double |  | PC2 trong lương CB |
|  | Allowance3 | Double |  | PC3 trong lương CB |
|  | AllowanceAdditional | Double |  | PC4 trong lương CB |
|  | WorkPlaceID | uniqueidentifier | Cat_WorkPlace | Nơi làm việc |
|  | SocialInsPlaceID | uniqueidentifier | Cat_Province | Nơi Đóng BH |
|  | IsPayBack | Bit |  | Có Điều Chỉnh |
|  | PayBackID | uniqueidentifier | Ins_InsuranceSalaryPayback | Điều Chỉnh BH |
|  | **SortID** | **int** |  |  |
|  | E_OldBasicSalary | Varchar(2000) |  |  |
|  | E_NewBasicSalary | Varchar(2000) |  |  |
|  | DateStart | DateTime |  | Từ ngày (IBHXH) |
|  | DateEnd | DateTime |  | Đến ngày (HĐ) (IBHXH) |
|  | DecisionNo | Nvarchar (100) |  | Số HĐ, mã PLHĐ (IBHXH) |
|  | DecisionType | Nvarchar (1000) |  | Loại HĐ hoặc loại phụ lục HĐ(IBHXH) |
|  | DecisionDatesigned | DateTime |  | Ngày ký HĐ hoặc ngày ký phụ lục HĐ(IBHXH) |
|  | InsuranceSalary | Double |  | Lương BHXH gốc (chưa cắt mức trần) |
|  | Allowance4 | Double |  |  |
|  | LeaveDayType | Varchar(50) |  | DS Loại ngày nghỉ |
|  | OldAllowance1 | Double |  |  |
|  | OldAllowance2 | Double |  |  |
|  | OldAllowance3 | Double |  |  |
|  | OldAllowance4 | Double |  |  |
|  | OldAllowanceAdditional | Double |  |  |
|  | RegionID | uniqueidentifier | Cat_Region | Vùng miền |
|  | EmploymentType | Varchar (100) |  |  |
|  | DistributionChannelID | Uniqueidentifier | Cat_NameEntity |  |
|  | MarketDomainID | Uniqueidentifier | Cat_NameEntity |  |
|  | RegionMarketID | Uniqueidentifier | Cat_NameEntity |  |
|  | MarketAreaID | Uniqueidentifier | Cat_NameEntity |  |
|  | OriginalDistributorID | Uniqueidentifier | Cat_NameEntity |  |
|  | OtherDistributors | Nvarchar (1000) |  |  |
|  | OrgStructureID | Uniqueidentifier | Cat_OrgStructure |  |
|  | PositionID | Uniqueidentifier | Cat_Position |  |
|  | JobTitleID | Uniqueidentifier | Cat_JobTitle |  |
|  | EmployeeTypeID | Uniqueidentifier | Cat_EmployeeType |  |
|  | PayrollGroupID | Uniqueidentifier | Cat_PayrollGroup |  |
|  | CostCentreID | Uniqueidentifier | Cat_CostCentre |  |
|  | SalaryClassID | Uniqueidentifier | Cat_SalaryClass |  |
|  | EmployeeGroupID | Uniqueidentifier | Cat_NameEntity |  |
|  | CostActivityID | Uniqueidentifier | Cat_CostActivity |  |
|  | AbilityTileID | Uniqueidentifier |  |  |
|  | CompanyID | Uniqueidentifier | Cat_Company |  |
|  | PayrollCategoryID | Uniqueidentifier | Cat_PayrollCategory |  |
|  | UnitStructureID | Uniqueidentifier | Cat_UnitStructure |  |
|  | LaborType | Uniqueidentifier |  |  |
|  | ShopID | uniqueidentifier | Cat_Shop |  |
|  | UsualAllowanceGroupID | Uniqueidentifier | Cat_UsualAllowanceGroup |  |
|  | SalaryPaidByTheFormOf | Varchar (50) |  |  |
|  | CoefficientOfWorkmanship | float |  |  |
|  | SubmitDate | DateTime |  |  |
|  | IsSubmitted | Bit |  |  |
|  | InsuranceAmount | float |  |  |
|  | DateStartHarmful | DateTime |  |  |
|  | DateEndHarmful | DateTime |  |  |
|  | InsAmountNotAllowance | float |  |  |
| --- | --- | --- 
## Ins_ReportD02V2 (D02 nhiều đợt)

| **Ins_ReportD02V2** **(D02 Nhiều Đợt)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ReportD02Name | Nvarchar(100) |  | "Kỳ 1 - 05/2016" |
|  | DateReport | DateTime |  | Ngày lập báo cáo |
|  | DateMonth | DateTime |  | Tháng kiểm tra |
|  | DateStart | DateTime |  | 16 tháng \[N-1\] |
|  | DateEnd | DateTime |  | 15 tháng \[N\] |
|  | SociaInsCountPro | Int |  | Tổng NV đóng BHXH |
|  | SociaInsTotalSalary | double |  | Tổng Lương NV (BHXH) |
|  | HealthInsCountPro | Int |  | Tổng NV đóng BHYT |
|  | HealthInsTotalSalary | double |  | Tổng Lương NV (BHYT) |
|  | UnEmpInsCountPro | Int |  | Tổng NV đóng BHTN |
|  | UnEmpInsTotalSalary | double |  | Tổng Lương NV (BHTN) |
|  | MaxSalary | double |  | Lương lớn nhất |
|  | MinSalary | double |  | Lương thấp nhất |
|  | DateOfEffectMax | DateTime |  |  |
|  | DateOfEffectMin | DateTime |  |  |
|  | Type | Nvarchar(50) |  | GETTEMP |
|  | Perior | int |  | 1 đến 10 (kỳ) |
| Note: ReportD02Name là "Kỳ Tạm Thời" + DateMonth |  |  |  |  |

## Ins_ReportD02ItemV2 (D02 nhiều đợt)

| **Ins_ReportD02ItemV2** **(D02 Nhiều Đợt)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ReportD02ID | uniqueidentifier | Ins_ReportD02V2 |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | OldBasicSalary | Double |  | Lương Tháng Trước |
|  | NewBasicSalary | Double |  | Lương BHXH Và Phụ Cấp |
|  | RateSocialIns | Double |  |  |
|  | RateHealthIns | Double |  |  |
|  | RateUnEmpIns | Double |  |  |
|  | NotCardHealth | Bit |  |  |
|  | Status | Nvarchar(100) |  | E_TANG_LD,... |
|  | Type | Nvarchar(100) |  | E_TANG,E_GIAM... |
|  | MonthFrom | DateTime |  | 16 Tháng \[N-1\] |
|  | MonthTo | DateTime |  | 110 Tháng \[N\] |
|  | MonthConvertRecord | DateTime |  |  |
|  | ItemOrder | Int |  |  |
|  | Comment | Nvarchar(1000) |  | Mô tả trạng thái |
|  | IsUserCreate | Bit |  |  |
|  | JobName | Nvarchar(400) |  | Tên Công Việc |
|  | Allowance1 | Double |  | PC1 trong lương CB |
|  | Allowance2 | Double |  | PC2 trong lương CB |
|  | Allowance3 | Double |  | PC3 trong lương CB |
|  | AllowanceAdditional | Double |  | PC4 trong lương CB |
|  | SocialInsPlaceID | uniqueidentifier | Cat_Province | Nơi Đóng BH |
|  | IsPayBack | Bit |  | Có Điều Chỉnh |
|  | PayBackID | uniqueidentifier | Ins_InsuranceSalaryPayback | Điều Chỉnh BH |
|  | DateStart | DateTime |  | Từ ngày (IBHXH) |
|  | DateEnd | DateTime |  | Đến ngày (HĐ) (IBHXH) |
|  | DecisionNo | Nvarchar (100) |  | Số HĐ, mã PLHĐ (IBHXH) |
|  | DecisionType | Nvarchar (1000) |  | Loại HĐ hoặc loại phụ lục HĐ(IBHXH) |
|  | DecisionDatesigned | DateTime |  | Ngày ký HĐ hoặc ngày ký phụ lục HĐ(IBHXH) |
|  | InsuranceSalary | Double |  | Lương BHXH gốc (chưa cắt mức trần) |
|  | E_OldBasicSalary | Varchar(2000) |  |  |
|  | E_NewBasicSalary | Varchar(2000) |  |  |
|  | Allowance4 | Double |  |  |
|  | LeaveDayType | Varchar(50) |  | Loại ngày nghỉ |
|  | OldAllowance1 | Double |  |  |
|  | OldAllowance2 | Double |  |  |
|  | OldAllowance3 | Double |  |  |
|  | OldAllowance4 | Double |  |  |
|  | OldAllowanceAdditional | Double |  |  |
|  | RegionID | uniqueidentifier | Cat_Region | Vùng miền |
|  | EmploymentType | Varchar (100) |  |  |
|  | DistributionChannelID | Uniqueidentifier | Cat_NameEntity |  |
|  | MarketDomainID | Uniqueidentifier | Cat_NameEntity |  |
|  | RegionMarketID | Uniqueidentifier | Cat_NameEntity |  |
|  | MarketAreaID | Uniqueidentifier | Cat_NameEntity |  |
|  | OriginalDistributorID | Uniqueidentifier | Cat_NameEntity |  |
|  | OtherDistributors | Nvarchar (1000) |  |  |
|  | OrgStructureID | Uniqueidentifier | Cat_OrgStructure |  |
|  | PositionID | Uniqueidentifier | Cat_Position |  |
|  | JobTitleID | Uniqueidentifier | Cat_JobTitle |  |
|  | EmployeeTypeID | Uniqueidentifier | Cat_EmployeeType |  |
|  | PayrollGroupID | Uniqueidentifier | Cat_PayrollGroup |  |
|  | CostCentreID | Uniqueidentifier | Cat_CostCentre |  |
|  | SalaryClassID | Uniqueidentifier | Cat_SalaryClass |  |
|  | EmployeeGroupID | Uniqueidentifier | Cat_NameEntity |  |
|  | CostActivityID | Uniqueidentifier | Cat_CostActivity |  |
|  | AbilityTileID | Uniqueidentifier |  |  |
|  | CompanyID | Uniqueidentifier | Cat_Company |  |
|  | PayrollCategoryID | Uniqueidentifier | Cat_PayrollCategory |  |
|  | UnitStructureID | Uniqueidentifier | Cat_UnitStructure |  |
|  | LaborType | Uniqueidentifier |  |  |
|  | ShopID | uniqueidentifier | Cat_Shop |  |
|  | UsualAllowanceGroupID | Uniqueidentifier | Cat_UsualAllowanceGroup |  |
|  | SalaryPaidByTheFormOf | Varchar (50) |  |  |
|  | CoefficientOfWorkmanship | float |  |  |
|  | SubmitDate | DateTime |  |  |
|  | IsSubmitted | Bit |  |  |
|  | InsuranceAmount | float |  |  |
|  | DateStartHarmful | DateTime |  |  |
|  | DateEndHarmful | DateTime |  |  |
| - LeaveDayType: loại ngày nghỉ cách nhau dấu "," |  |  |  |  |

## Ins_InsuranceSalaryPayback

| **Ins_InsuranceSalaryPayback** **(Điều Chỉnh Bảo Hiểm)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | MonthYear | DateTime |  | Tháng chọn |
|  | FromMonthEffect | DateTime |  | Tháng Điều Chỉnh |
|  | ToMonthEffect | DateTime |  | Tháng Điều Chỉnh |
|  | InsSalary | Double |  | Lương BH đã đóng |
|  | InsSalaryPayBack | Double |  | Lương BH Điều Chỉnh |
|  | InsSalaryAdjust | Double |  | Lương chênh lệch |
|  | AmoutHDTIns | Double |  | Tiền HDTJob |
|  | AmoutHDTInsPayBack | Double |  | Tiền HDTJob Điều Chỉnh |
|  | JobtitleName | Nvarchar(1500) |  | Tên công việc |
|  | IsSocialIns | Bit |  |  |
|  | IsMedicalIns | Bit |  |  |
|  | IsUnemploymentIns | Bit |  |  |
|  | SocialInsEmpRate | double |  |  |
|  | HealthInsEmpRate | double |  |  |
|  | UnemployEmpRate | double |  |  |
|  | SocialInsComRate | double |  |  |
|  | HealthInsComRate | double |  |  |
|  | UnemployComRate | double |  |  |
|  | Note | Nvarchar(40000) |  |  |
|  | TypeID | uniqueidentifier | Ins_TypeD02 | Trạng thái |
|  | Comment | Nvarchar(3000) |  |  |
|  | IsCallPayBack | Bit |  | Có điều chỉnh |
|  | SocialInsPlaceID | uniqueidentifier | Cat_Province | Nơi đóng BH |
|  | CommentReduce | VARCHAR(50) |  |  |
|  | PaybackID | uniqueidentifier | Ins_InsuranceSalaryPayback |  |
| --- | --- | --- 
## Ins_TypeD02

| **Ins_TypeD02** **Trạng Thái D02** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | TypeCode | Nvarchar(3000) |  | E_TANG |
|  | TypeName | Nvarchar(8000) |  | Tăng |
|  | StatusCode | Nvarchar(3000) |  | E_TANG_LD |
|  | StatusName | Nvarchar(8000) |  | Tăng Lao Động |
|  | Comment | Nvarchar(8000) |  | Tăng Lao Động |
|  | Note | Nvarchar(8000) |  |  |
|  | CommentCode | Nvarchar(150) |  | E_TANG_LD |
|  | DisplayCode | Nvarchar(50) |  | Mã Phương án |
|  | DisplayName | Nvarchar(100) |  | Tên phương án |
|  | IsNotPayback | Bit |  | Không tính payback |
|  | IsD02Ins | Bit |  | D02 |
|  | IsIIns | Bit |  | I - BHXH |
|  | IsVIns | Bit |  | Viettel - BHXH |
|  | IsVNPTIns | Bit |  | VNPT - BHXH |
|  | IsEIns | bit |  |  |
| --- | --- | --- 
##  Cat_ValueEntity

| **Cat_ValueEntity** **Mức Trần BHXH / Lương Tối Thiểu** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | Type | nvarchar(60) |  | Loại (Enum) : Mức Trần , Lương Tối Thiểu |
|  | ValueEntityName | nvarchar(200) |  | Tên |
|  | Value | float |  | Số tiền |
|  | DateOfEffect | datetime |  | Ngày hiệu lực |
|  | Value2 | float |  |  |
|  | Value3 | float |  |  |
|  | ValueString | nvarchar(1000) |  |  |
|  | ValueString2 | nvarchar(1000) |  |  |
|  | ValueString3 | nvarchar(1000) |  |  |
|  | Comment | nvarchar(1000) |  |  |
|  | CurrencyID | uniqueidentifier | Cat_Currency |  |
| Type : E_INSURANCE_CAPE_AMOUNT (Mức Trần BHXH) , [E_MINIMUM_SALARY]{.mark} (Lương Tối Thiểu) |  |  |  |  |
| --- | --- | --- 
##  Cat_RateInsurance

| **Cat_RateInsurance** **Tỉ Lệ Bảo Hiểm** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | HealthInsCompRate | float |  | 3%(BHYT NSDLĐ Đóng) |
|  | HealthInsEmpRate | float |  | 0.15%(BHYT NLĐ Đóng) |
|  | SocialInsCompRate | float |  | 18%(BHXH NSDLĐ Đóng) |
|  | SocialInsEmpRate | float |  | 8%(BHXH NLĐ Đóng) |
|  | UnemployInsCompRate | float |  | 1%(BHTN NSDLĐ Đóng) |
|  | UnemployInsEmpRate | float |  | 1% |
|  | ApplyFrom | datetime |  |  |
|  | SMCompRate | float |  | Ốm đau,TS NSDLĐ đóng (%) |
|  | OADCompRate | float |  | TNLĐ,BNN NSDLĐ đóng (%) |
|  | PSCompRate | float |  | Hưu trí,Tử tuất NSDLĐ đóng (%) |
| --- | --- | --- 
##  Ins_InsuranceForPayrollMonthly

| **Ins_InsuranceForPayrollMonthly** **Bảo hiểm -- Tính Chốt Lương** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
| Nơi Đóng BH | SocialInsPlaceID | uniqueidentifier | Cat_Province |  |
|  | MonthYear | DateTime |  | Tháng Năm |
|  | IsSocialInsurance | bit |  | Đóng BHXH |
|  | IsHealthInsurance | bit |  | Đóng BHYT |
|  | IsUnEmpInsurance | bit |  | Đóng BHTN |
|  | IsDecreaseWorkingDays | bit |  | Có Nghỉ \>= 14 ngày |
|  | IsPregnant | bit |  | Có Thai Sản |
|  | MoneySocialInsurance | double |  | Tiền BHXH |
|  | MoneyHealthInsurance | double |  | Tiền BHYT |
|  | MoneyUnEmpInsurance | double |  | Tiền BHTN |
|  | SalaryInsurance | double |  | Lương BHXH |
|  | SalaryUnEmpInsurance | double |  | Lương BHTN |
|  | SalaryHealthInsurance | double |  | Lương BHTN |
|  | Allowance1 | double |  |  |
|  | Allowance2 | double |  |  |
|  | Allowance3 | double |  |  |
|  | Allowance4 | double |  |  |
|  | AllowanceAdditional | double |  |  |
|  | AmountChargeIns | double |  | Tổng số tiền |
|  | SocialInsEmpRate | double |  |  |
|  | HealthInsEmpRate | double |  |  |
|  | UnemployEmpRate | double |  |  |
|  | SocialInsComRate | double |  |  |
|  | HealthInsComRate | double |  |  |
|  | UnemployComRate | double |  |  |
|  | SocialInsEmpAmount | double |  | Tiền BHXH NV Đóng |
|  | HealthInsEmpAmount | double |  | Tiền BHYT NV Đóng |
|  | UnemployEmpAmount | double |  | Tiền BHTN NV Đóng |
|  | SocialInsComAmount | double |  | Tiền BHXH Cty Đóng |
|  | HealthInsComAmount | double |  | Tiền BHYT Cty Đóng |
|  | UnemployComAmount | double |  | Tiền BHTN Cty Đóng |
|  | JobName | Nvarchar(400) |  | Chức Danh , hoặc tên công việc |
|  | TypeGetData | Nvarchar(200) |  | GETTEMP,GETFINAL |
|  | AmountHDTIns | double |  | Tiền HDTJob |
|  | HDTGroupCode | Nvarchar(200) |  | Mã HDTJob |
|  | MonthYearEffect | DateTime |  | Tháng truy lĩnh |
|  | IsPayback | Bit |  | Có Điều Chỉnh |
|  | PaybackID | uniqueidentifier |  |  |
|  | WorkPlaceID | uniqueidentifier | Cat_WorkPlace |  |
|  | CostCentreID | Uniqueidentifier | Cat_CostCentre |  |
|  | OrgStructureID | Uniqueidentifier | Cat_OrgStructure |  |
|  | JobTitleID | Uniqueidentifier | Cat_JobTitle |  |
|  | PositionID | Uniqueidentifier | Cat_Position |  |
|  | SalaryClassID | Uniqueidentifier | Cat_SalaryClass |  |
|  | PayrollGroupID | Uniqueidentifier | Cat_PayrollGroup |  |
|  | SalGradeID | Uniqueidentifier | Cat_GradeCfg |  |
|  | AttGradeID | Uniqueidentifier | Cat_GradeAttendance |  |
|  | CostActivityID | Uniqueidentifier | Cat_CostActivity |  |
|  | EmployeeGroupID | Uniqueidentifier | Cat_NameEntity |  |
|  | LaborType | Nvarchar(100) |  |  |
|  | EmployeeTypeID | uniqueidentifier | Cat_EmployeeType |  |
|  | IsQuit | Bit |  | Có Nghỉ Việc |
|  | TypeHDTIns | varchar(50) |  | Loại HDT |
|  | E_MoneySocialInsurance | varchar(200) |  |  |
|  | E_MoneyUnEmpInsurance | varchar(200) |  |  |
|  | E_MoneyHealthInsurance | varchar(200) |  |  |
|  | E_SalaryInsurance | varchar(200) |  |  |
|  | E_SocialInsEmpAmount | varchar(200) |  |  |
|  | E_HealthInsEmpAmount | varchar(200) |  |  |
|  | E_UnemployEmpAmount | varchar(200) |  |  |
|  | E_SocialInsComAmount | varchar(200) |  |  |
|  | E_HealthInsComAmount | varchar(200) |  |  |
|  | E_UnemployComAmount | varchar(200) |  |  |
|  | E_SalaryUnEmpInsurance | varchar(200) |  |  |
|  | E_SalaryHealthInsurance | varchar(200) |  |  |
| Dùng để tính lương • TypeHDTIns : enum (E_TYPE4,E_TYPE5) |  |  |  |  |

## Hre_HealthInsuranceCard 

| **Hre_HealthInsuranceCard** **(Thẻ BHYT)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | HealthInsNo | NVarchar(100) |  | Số Sổ BHYT |
|  | HealthInsIssueDate | DateTime |  | Ngày Cấp BHYT |
|  | HealthInsExpiredDate | DateTime |  | Ngày Hết Hạn BHYT |
|  | HealthTreatmentPlace | Nvarchar(200) |  | Nơi Đăng Ký Khám Bệnh |
|  | HealthTreatmentPlaceCode | NVarchar(100) |  | Mã Bệnh Viện Đăng Ký Khám |
|  | IsPeriodicExamination | bit |  | Khám Sức Khỏe Định Kỳ |
|  | ReceiveHealthIns | bit |  | Đã Trả Thẻ BHYT |
|  | ReceiveHealthInsDate | DateTime |  | Ngày Trả Thẻ BHYT |
|  | IsRegisterHealthIns | bit |  | Tham Gia BHYT |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | ProvinceHospital | Nvarchar(300) |  |  |
|  | HealthTreatmentPlaceID | uniqueidentifier | Cat_HealthTreatmentPlace |  |
|  | FiveConsecutiveYearsFrom | DateTime |  |  |
| --- | --- | --- 
##  Cat_HealthTreatmentPlace 

| **Cat_HealthTreatmentPlace** **(Nơi Khám Chữa Bệnh)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | HealthTreatmentCode | Varchar(20) |  | Mã KCB |
|  | HealthTreatmentProvinceCode | Nvarchar(40) |  | Mã tỉnh bệnh viện KCB |
|  | HealthTreatmentName | Nvarchar(400) |  | Tên cơ sở KCB |
|  | HealthTreatmentAddress | Varchar(1000) |  | Địa chỉ KCB |
|  | Notes | Nvarchar(1000) |  | Ghi chú |
| --- | --- | --- 
## Cat_InsuranceGrade 

- Mục đích : dùng tính nghỉ 14 ngày bằng công thức và tính lương dựa vào
  các tỉ lệ

| **Cat_InsuranceGrade** **(Chế độ bảo hiểm)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | Code | nvarchar(100) |  |  |
|  | InsuranceGradeName | Nvarchar(200) |  | Tên chế độ bảo hiểm |
|  | Description | Nvarchar(400) |  | Mô tả |
|  | FileAttach | Nvarchar(8000) |  | File đính kèm |
|  | MinSalary | Float |  | Lương tối thiểu |
|  | MaxSalary | Float |  | Lương tối đa |
|  | HealthInsCompRate | Float |  | BHYT NSDLD đóng (%) |
|  | HealthInsEmpRate | Float |  | BHYT NLD đóng (%) |
|  | SocialInsCompRate | Float |  | BHXH NSDLD đóng (%) |
|  | SocialInsEmpRate | Float |  | BHXH NLD đóng (%) |
|  | UnemployInsCompRate | Float |  | BHTN NSDLD đóng (%) |
|  | UnemployInsEmpRate | Float |  | BHTN NLD đóng (%) |
|  | FormulaDecreasedWorkingDay | Varchar(200) |  | Công thức tính số ngày nghỉ không đóng bảo hiểm |
|  | CountLeaveIns | Int |  | Số ngày nghỉ không đóng BH (nghỉ 14 ngày) |
|  | SMCompRate | Float |  |  |
|  | OADCompRate | Float |  |  |
|  | PSCompRate | Float |  |  |
|  | FormulaWorkingDay | Varchar(4000) |  |  |
| --- | --- | --- 
## Ins_InsuranceGrade 

Mục đích: thiết lập chế độ bảo hiểm cho nhân

- Khi trích nộp bảo hiểm sẽ chia 2 loại, loại có chế độ bảo hiểm sẽ dùng
  công thức để tính nghỉ 14 ngày(dựa vào bảng công để thiết lập công
  thức), ngược lại tính nghỉ 14 ngày dựa vào xử lý ngày công

| **Ins_InsuranceGrade** **(Chế độ bảo hiểm cho nhân viên)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | InsuranceGradeID | uniqueidentifier | Cat_InsuranceGrade |  |
|  | MonthOfEffect | datetime |  |  |
| --- | --- | --- 
## Cat_InsuranceRecordType

| **Cat_InsuranceRecordType** **(Loại chứng từ)** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | Code | varchar(50) |  |  |
|  | InsuranceType | nvarchar(200) |  | Loại chứng từ |
|  | NumberOfWarnDays | int |  |  |
|  | Note | nvarchar(400) |  | Ghi chú |
|  | IsBlock | bit |  |  |
|  | InsuranceRecordTypeGroup1 | varchar(50) |  | Nhóm chứng từ 1 |
|  | InsuranceRecordTypeGroup2 | varchar(50) |  | Nhóm chứng từ 2 |
|  | InsuranceRecordTypeGroup3 | varchar(50) |  | Nhóm chứng từ 3 |
|  | IsUse | bit |  | Có sử dụng |
|  | OrderNumber | int |  | Số thứ tự |
|  | IsIncludeHolidaysdayoff | bit |  | Có tính ngày nghỉ lễ, tết, off |
|  | MethodGroupCode | nvarchar(100) |  |  |
|  | MethodCode | nvarchar(100) |  |  |
|  | IsMethod | bit |  | Định nghĩa đây là Loại chứng từ con (Cây chứng từ) |
|  | InsuranceRecordTypeGroup4 | nvarchar(100) |  | Nhóm chứng từ 4 |
|  | ParentID | uniqueidentifier |  | ID Chứng từ cha |
| --- | --- | --- 
## Ins_ChangeInsInfoRegister

| **Ins_ChangeInsInfoRegister** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | RegisterType | varchar(32) |  |  |
|  | InsuranceCode | nvarchar(200) |  |  |
|  | ProfileName | nvarchar(400) |  |  |
|  | DayOfBirth | datetime |  |  |
|  | Gender | varchar(32) |  |  |
|  | NationalityID | uniqueidentifier | Cat_Country |  |
|  | EthnicID | uniqueidentifier | Cat_EthnicGroup |  |
|  | PProvinceID | uniqueidentifier | Cat_Province |  |
|  | PDistrictID | uniqueidentifier | Cat_District |  |
|  | PVillageID | uniqueidentifier | Cat_Village |  |
|  | RProvinceID | uniqueidentifier | Cat_Province |  |
|  | RDistrictID | uniqueidentifier | Cat_District |  |
|  | RVillageID | uniqueidentifier | Cat_Village |  |
|  | RAdress | nvarchar(400) |  |  |
|  | DocumentType | varchar(50) |  |  |
|  | IDNo | nvarchar(200) |  |  |
|  | PhoneNumber | nvarchar(200) |  |  |
|  | HealthTreatmentPlaceID | uniqueidentifier | Cat_HealthTreatmentPlace |  |
|  | ChangeContent | nvarchar(400) |  |  |
|  | AttachedDocuments | nvarchar(4000) |  |  |
|  | Is1TimeSocialInsPayment | bit |  |  |
|  | IsUnEmploymentPayment | bit |  |  |
|  | Status | varchar(32) |  |  |
|  | Note | nvarchar(2000) |  |  |
|  | FileAttach | varchar(1000) |  |  |
|  | UserSubmitID | uniqueidentifier | Hre_Profile |  |
| --- | --- | --- 
## Ins_ChildSick

| **Ins_ChildSick** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | ChildSickName | varchar(32) |  |  |
|  | Gender | nvarchar(200) |  |  |
|  | DateOfBirth | nvarchar(400) |  |  |
|  | RelativeID | varchar(50) |  |  |
|  | HealthInsNo | nvarchar(200) |  |  |
|  | HealthInsIssueDate | uniqueidentifier | Cat_HealthTreatmentPlace |  |
| --- | --- | --- 
## Ins_Claim

| **Ins_Claim** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | DateFrom | datetime |  |  |
|  | DateTo | datetime |  |  |
|  | VoluntaryInsTypeID | uniqueidentifier | Cat_VoluntaryInsType |  |
|  | InsuranceRecordTypeID | uniqueidentifier | Cat_InsuranceRecordType |  |
|  | EmpPaid | float |  |  |
|  | Claim | float |  |  |
|  | InsPaid | float |  |  |
|  | FileAttachment | varchar(4000) |  |  |
|  | InsuranceRecordType | varchar(50) |  |  |
| --- | --- | --- 
## Ins_HealthCard

| **Ins_HealthCard** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileId | uniqueidentifier | Hre_Profile |  |
|  | DateStart | datetime |  |  |
|  | DateEnd | datetime |  |  |
|  | HealthNo | nvarchar(100) |  |  |
|  | HospitalCode | nvarchar(100) |  |  |
|  | HospitalName | nvarchar(300) |  |  |
|  | IsReturn | bit |  |  |
|  | DateReturn | datetime |  |  |
| --- | --- | --- 
## Ins_InsuranceConfig

| **Ins_InsuranceConfig** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | InsuranceConfigName | nvarchar(200) |  |  |
|  | IsSocialIns | bit |  |  |
|  | IsMedicalIns | bit |  |  |
|  | IsUnimploymentIns | bit |  |  |
|  | Days | int |  |  |
|  | Description | nvarchar(200) |  |  |
| --- | --- | --- 
## Ins_InsuranceInfo

| **Ins_InsuranceInfo** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | ProfileName | nvarchar(400) |  |  |
|  | DateOfBirth | datetime |  |  |
|  | Gender | varchar(32) |  |  |
|  | NationalityID | uniqueidentifier | Cat_Country |  |
|  | EthnicID | uniqueidentifier | Cat_EthnicGroup |  |
|  | PProvinceID | uniqueidentifier | Cat_Province |  |
|  | PDistrictID | uniqueidentifier | Cat_District |  |
|  | PVillageID | uniqueidentifier | Cat_Village |  |
|  | RProvinceID | uniqueidentifier | Cat_Province |  |
|  | RDistrictID | uniqueidentifier | Cat_District |  |
|  | RVillageID | uniqueidentifier | Cat_Village |  |
|  | RAdress | nvarchar(1000) |  |  |
|  | DocumentType | varchar(32) |  |  |
|  | IDNo | nvarchar(200) |  |  |
|  | PhoneNumber | nvarchar(200) |  |  |
|  | SocialInsNo | nvarchar(200) |  |  |
|  | InsuranceCode | nvarchar(200) |  |  |
|  | InsuranceCodeOld | nvarchar(200) |  |  |
|  | SocialInsIssueDate | datetime |  |  |
|  | SocialInsIssuePlace | nvarchar(400) |  |  |
|  | SocialInsPlaceID | uniqueidentifier | Cat_Province |  |
|  | SocialInsBookStatus | varchar |  |  |
|  | SocialInsDateReg | datetime |  |  |
|  | SocialInsSubmitBookStatus | nvarchar(64) |  |  |
|  | SocialInsSubmitBookDate | datetime |  |  |
|  | SocialInsReserveDate | datetime |  |  |
|  | SocialInsAppointmentDate | datetime |  |  |
|  | SocialInsNote | nvarchar(400) |  |  |
|  | ReceiveSocialInsDate | datetime |  |  |
|  | IsReceiveSocialIns | bit |  |  |
|  | SocialInsDeliveryDate | datetime |  |  |
|  | HealthInsNo | nvarchar(400) |  |  |
|  | HealthInsIssueDate | datetime |  |  |
|  | HealthInsExpiredDate | datetime |  |  |
|  | HealthTreatmentPlaceID | uniqueidentifier | Cat_HealthTreatmentPlace |  |
|  | HealthTreatmentPlace | nvarchar(400) |  |  |
|  | ProvinceHospital | nvarchar(400) |  |  |
|  | HealthTreatmentPlaceCode | nvarchar(400) |  |  |
|  | FiveConsecutiveYearsFrom | datetime |  |  |
|  | IsPeriodicExamination | bit |  |  |
|  | UnEmpInsDateReg | datetime |  |  |
|  | UnEmpInsCountMonthOld | int |  |  |
|  | FileStore | nvarchar(4000) |  |  |
|  | Note | nvarchar(400) |  |  |
|  | FileAttach | nvarchar(4000) |  |  |
|  | IsTradeUnionist | bit |  |  |
|  | TradeUnionistPositionID | uniqueidentifier | Cat_TradeUnionistPosition |  |
|  | TradeUnionistEnrolledDate | datetime |  |  |
|  | TradeUnionistEndDate | datetime |  |  |
| --- | --- | --- 
## Ins_LeaveDayIns

| **Ins_LeaveDayIns** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | LeaveDayID | uniqueidentifier |  |  |
|  | ProfileID | uniqueidentifier | Hre_Profile |  |
|  | LeaveDayTypeID | uniqueidentifier | Cat_LeaveDayType |  |
|  | UserApproveID | uniqueidentifier | Sys_UserInfo |  |
|  | UserApproveID2 | uniqueidentifier | Sys_UserInfo |  |
|  | InsuranceRecordID | uniqueidentifier | Ins_InsuranceRecord |  |
|  | DateStart | datetime |  |  |
|  | DateEnd | datetime |  |  |
|  | Status | varchar(50) |  |  |
|  | CommentApprove | nvarchar(1000) |  |  |
|  | Comment | nvarchar(1000) |  |  |
|  | DeclineReason | nvarchar(100) |  |  |
|  | UserRegister | nvarchar(100) |  |  |
|  | DateRegister | datetime |  |  |
|  | UserApprove | nvarchar(100) |  |  |
|  | DateApprove | datetime |  |  |
|  | Duration | float |  |  |
|  | TotalDuration | float |  |  |
|  | DurationType | nvarchar(100) |  |  |
|  | PayMethod | nvarchar(100) |  |  |
| --- | --- | --- 
## Ins_NormsVoluntaryIns

| **Ins_NormsVoluntaryIns** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | VoluntaryInsTypeID | uniqueidentifier | Cat_VoluntaryInsType |  |
|  | OrgStructureID | uniqueidentifier | Cat_OrgStructure |  |
|  | JobTitleID | uniqueidentifier | Cat_JobTitle |  |
|  | PositionID | uniqueidentifier | Cat_Position |  |
|  | AbilityTileInPositionID | uniqueidentifier | Cat_AbilityTile |  |
|  | ContractTypeID | uniqueidentifier | Cat_ContractType |  |
|  | PaidByEmployee | float |  |  |
|  | PaidByCompany | float |  |  |
| --- | --- | --- 
## Ins_PaidInsurance

| **Ins_PaidInsurance** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | MonthYear | datetime |  |  |
|  | SalaryInsurance | float |  |  |
|  | SalaryHealthInsurance | float |  |  |
|  | SalaryUnEmpInsurance | float |  |  |
|  | Note | nvarchar(1000) |  |  |
|  | Period | int |  |  |
|  | OrgStructureID | uniqueidentifier | Cat_OrgStructure |  |
|  | SocialInsPlaceID | uniqueidentifier | Cat_Province |  |
| --- | --- | --- 
## Ins_VoluntaryInsInfo

| **Ins_VoluntaryInsInfo** |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Tên hiển thị** | **Tên field** | **Kiểu dữ liệu** | **Khoá Ngoại** | **Diễn giải** |
|  | ID | uniqueidentifier |  |  |
|  | ProfieldID | uniqueidentifier |  |  |
|  | VoluntaryInsCompanyID | uniqueidentifier | Cat_VoluntaryInsCompany |  |
|  | VoluntaryInsTypeID | uniqueidentifier | Cat_VoluntaryInsType |  |
|  | ComPaid | float |  |  |
|  | EmpPaid | float |  |  |
|  | StartDate | datetime |  |  |
|  | EndDate | datetime |  |  |
|  | IssuedDate | datetime |  |  |
|  | CardNo | varchar(250) |  |  |
|  | Note | nvarchar(1000) |  |  |
|  | Month | int |  |  |
|  | MonthlyPaid | float |  |  |
|  | RelativeID | uniqueidentifier | Hre_Relatives |  |
|  | TotalPaid | float |  |  |
|  | UnitTime | varchar(50) |  |  |
|  | ValueTime | float |  |  |
|  | PaidStatus | varchar |  |  |
|  | ComPaidCurrencyID | uniqueidentifier | Cat_Currency |  |
|  | EmpPaidCurrencyID | uniqueidentifier | Cat_Currency |  |
|  | TotalPaidCurrencyID | uniqueidentifier | Cat_Currency |  |
|  | MonthlyPaidCurrencyID | uniqueidentifier | Cat_Currency |  |
| --- | --- | --- 
---

## Lỗi thường gặp / Bug đã gặp

| Triệu chứng | Root cause | Cách fix |
|-------------|-----------|---------|
| | | |

---

## Văn bản pháp lý / Căn cứ

- **Luật / Nghị định**: Luật BHXH 2014 (sửa đổi 2019)
- **Thông tư**:
- **Hiệu lực từ**: 

---

## Ghi chú thêm / Lessons Learned

- 

---

## Liên kết

- [[wiki/sources/INS-C70-TinhLuong]]
- [[wiki/sources/INS-InsuranceMonthJoin]]
- [[wiki/flows/Flow-KhaiBaoiBHXH]]

---
## 🔗 Xem thêm

[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX|⬆ INDEX — Tài Liệu Bảo Hiểm 01]]

- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/01-gioi-thieu|Giới Thiệu & Từ Viết Tắt]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/02-mindmap|Sơ Đồ Mindmap]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/03-nghiep-vu-bieu-mau|Nghiệp Vụ & Biểu Mẫu BH]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/04-chuoi-gia-tri|Chuỗi Giá Trị (Lean Production)]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/06-uml|Mô Hình UML & Activity Diagram]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/07-bao-cao-dong|Báo Cáo Động]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/08-van-de-bh|Vấn Đề Bảo Hiểm & Cấu Hình]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/09-bieu-do-code|Biểu Đồ Code (Kỹ Thuật)]]
