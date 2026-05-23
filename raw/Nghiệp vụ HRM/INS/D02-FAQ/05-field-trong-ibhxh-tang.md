# D02 FAQ – Field trên lưới iBHXH Tăng không có dữ liệu

> Ngày: 2026-05-02  
> Nguồn: `Ins_InsuranceD02Services.cs` – hàm `SearchiBHXHTangD02TS_91221015`  
> Lưu ý: File này chỉ áp dụng cho **iBHXH tăng**. Giảm và điều chỉnh có schema cột khác.

---

## Nguồn dữ liệu từng nhóm field

| Nhóm field | Bảng nguồn | Ghi chú |
|---|---|---|
| Họ tên, mã NV, giới tính, ngày sinh | `Hre_Profile` | Load trực tiếp khi search |
| Số sổ BHXH | `Hre_Profile.SocialInsNo` + `Ins_ReportD02ItemV2.SocialInsNo` | 2 cột riêng |
| Chức danh | `Ins_ProfileInsuranceMonthly.JobName` | Snapshot lúc phân tích |
| Lương mới / cũ | `Ins_ReportD02ItemV2.NewBasicSalary / OldBasicSalary` | Snapshot lúc phân tích |
| Phụ cấp 1/2/3/4/bổ sung | `Ins_ReportD02ItemV2.Allowance1..4, AllowanceAdditional` | Snapshot lúc phân tích |
| Ngày bắt đầu / kết thúc | `Ins_ReportD02ItemV2.DateStart / DateEnd` | Snapshot lúc phân tích |
| Loại điều chỉnh (TM/DC...) | `IBHXHCode` từ `Ins_TypeD02` mapping | |
| Số HĐ / ngày HĐ | `Hre_Contract` qua `Ins_ProfileInsuranceMonthly.ContractID` | |
| Số phụ lục / ngày phụ lục | `Hre_ContractExtend` qua `ContractExtendID` | |
| Nơi làm việc | `Cat_WorkPlace` / `Cat_Company` theo `CompanyID` trên ProfileInsuranceMonthly | |
| Địa chỉ thường/tạm trú | `Cat_Province/District/Village` theo ID trên `Hre_Profile` | |
| CMND/CCCD, ngày cấp, nơi cấp | `Hre_Profile.IDNo/IDCard, IDDateOfIssue, PlaceOfIssueID` | |
| Nơi KCB / mã KCB | `Hre_Profile.ProvinceHospital` + `Hre_HealthInsuranceCard` | |
| Thông tin ngân hàng | `Sal_SalaryInformation` + `Cat_Bank` + `Cat_Branch` | |
| Thông tin chủ hộ / sổ hộ khẩu | `Hre_ProfileMoreInfo` qua `ProfileMoreInfoID` | |
| Mã phòng ban | `Cat_OrgStructure.Code` | |
| Chi nhánh tổ chức (E_BRANCH) | `Cat_OrgUnit` | Cấu hình per đơn vị |

---

## Checklist theo từng field hay bị hỏi

### Số sổ BHXH trống
- [ ] `Hre_Profile.SocialInsNo` đã nhập chưa
- [ ] Nếu đã nhập mà vẫn trống → phân tích lại D02

### Chức danh trống
- [ ] `Ins_ProfileInsuranceMonthly.JobName` tháng đó có giá trị không
- [ ] JobName lấy từ chứng từ BH, **không** lấy từ `Cat_JobTitle`

### Lương mới / lương cũ trống
- [ ] `Ins_ProfileInsuranceMonthly.SalaryInsurance` tháng [N] và [N-1] có không
- [ ] Chứng từ BH đã được tạo cho tháng đó chưa

### Phụ cấp trống
- [ ] `Ins_ProfileInsuranceMonthly.Allowance1..4` tháng đó
- [ ] Phụ cấp có được cấu hình đưa vào lương đóng BH không

### Ngày bắt đầu / kết thúc trống
- [ ] Với **TM**: `DateStart` = `Hre_Contract.DateStart` → hợp đồng đã được gắn vào `ContractID` trên ProfileInsuranceMonthly chưa
- [ ] Với **DC**: `DateStart` = `MonthYearEffect` → kiểm tra field này trên ProfileInsuranceMonthly
- [ ] Cập nhật hợp đồng sau phân tích → phải phân tích lại

### Số HĐ / Số phụ lục trống
- [ ] `Ins_ProfileInsuranceMonthly.ContractID` và `ContractExtendID` có null không
- [ ] `Hre_Contract.Status = 'E_APPROVED'` chưa

### Nơi làm việc trống
- [ ] `Hre_Profile.WorkPlaceID` đã chọn chưa (Col82)
- [ ] `Ins_ProfileInsuranceMonthly.CompanyID` có giá trị không (Col87)

### Địa chỉ trống
- [ ] `Hre_Profile`: `PProvinceID, PDistrictID, VillageID` (thường trú); `TProvinceID, TDistrictID, TAVillageID` (tạm trú)
- [ ] Danh mục `Cat_Province/District/Village` có đủ bản ghi không

### Mã KCB / Nơi khám BHYT trống
- [ ] `Hre_HealthInsuranceCard` của NV có bản ghi không
- [ ] `Hre_Profile.ProvinceHospital` và `HealthTreatmentPlace` đã nhập chưa

### Thông tin ngân hàng trống
- [ ] `Sal_SalaryInformation` của NV có `BankID != null` không
- [ ] NV đã khai thông tin ngân hàng trong màn hình thông tin lương chưa

### Họ tên chủ hộ / Sổ hộ khẩu trống
- [ ] `Hre_Profile.ProfileMoreInfoID` có giá trị không
- [ ] `Hre_ProfileMoreInfo.HouseholderFullName, HouseholdBookNo` đã nhập chưa

### Mã phòng ban trống
- [ ] `Cat_OrgStructure.Code` của phòng ban đó đã nhập chưa

---

## Lưu ý quan trọng

> **Dữ liệu snapshot:** Các field từ `Ins_ReportD02ItemV2` (lương, ngày, số HĐ, phụ cấp...) là snapshot tại thời điểm phân tích. Sửa hồ sơ sau đó **không tự cập nhật** — phải **phân tích lại D02**.

> **Field từ `Hre_Profile`** (địa chỉ, CMND, SĐT, ngân hàng...) được load mới mỗi lần search — không cần phân tích lại.

---

## Query kiểm tra nhanh

```sql
-- Chứng từ BH tháng đó
SELECT ProfileID, MonthYear, SalaryInsurance, JobName, ContractID, ContractExtendID, CompanyID
FROM Ins_ProfileInsuranceMonthly
WHERE ProfileID = '<ID>' ORDER BY MonthYear DESC

-- Hợp đồng
SELECT c.ContractNo, c.DateStart, c.DateEnd, c.Status,
       ce.AnnexCode, ce.DateStart AnnexStart, ce.DateEnd AnnexEnd
FROM Hre_Contract c
LEFT JOIN Hre_ContractExtend ce ON ce.ContractID = c.ID
WHERE c.ProfileID = '<ID>' ORDER BY c.DateStart DESC

-- Ngân hàng
SELECT s.AccountNo, b.BankName, s.BankBrandName
FROM Sal_SalaryInformation s
LEFT JOIN Cat_Bank b ON b.ID = s.BankID
WHERE s.ProfileID = '<ID>'

-- ProfileMoreInfo
SELECT pmi.HouseholderFullName, pmi.HouseholdBookNo, pmi.HouseHoldCode
FROM Hre_Profile p
LEFT JOIN Hre_ProfileMoreInfo pmi ON pmi.ID = p.ProfileMoreInfoID
WHERE p.ID = '<ID>'

-- Thẻ BHYT
SELECT ProfileID, HealthTreatmentPlaceCode
FROM Hre_HealthInsuranceCard
WHERE ProfileID = '<ID>'
```
