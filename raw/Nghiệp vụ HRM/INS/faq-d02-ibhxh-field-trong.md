# FAQ D02 iBHXH – Tại sao field trên lưới không có dữ liệu

> ⚠️ **Khi nhận câu hỏi về D02, hỏi trước: loại báo cáo nào?**
> D02 TS | D02 V2 | **iBHXH** (tăng/giảm/điều chỉnh) | VietTel | VNPT
> → File này chỉ áp dụng cho **iBHXH tăng** (`SearchiBHXHTangD02TS`). Giảm và điều chỉnh có cột khác.

> Nguồn: `Ins_InsuranceD02Services.cs` – hàm `SearchiBHXHTangD02TS_91221015`  
> Ngày: 2026-05-02  
> Đối tượng: Nghiệp vụ / kế toán BHXH

---

## Danh sách field trên lưới D02 iBHXH và nguồn dữ liệu

| Field hiển thị | Nguồn lấy | Ghi chú |
|---|---|---|
| Họ tên (Col1) | `Ins_ReportD02ItemV2.ProfileName` | Lấy từ lúc phân tích |
| Số sổ BHXH (Col2 / Col80) | `Ins_ReportD02ItemV2.SocialInsNo` / `Hre_Profile.SocialInsNo` | 2 cột riêng |
| Ngày sinh (Col3) | `Hre_Profile.DateOfBirth` | |
| Giới tính nữ (Col4) | `Hre_Profile.Gender` | Chỉ hiện "X" nếu là nữ |
| Chức danh (Col5) | `Ins_ReportD02ItemV2.JobName` | Lấy từ `Ins_ProfileInsuranceMonthly.JobName` |
| Lương mới (Col6) | `Ins_ReportD02ItemV2.NewBasicSalary` | |
| Lương cũ (Col78) | `Ins_ReportD02ItemV2.OldBasicSalary` | |
| Phụ cấp 1,2,3 (Col8,9,10) | `Ins_ReportD02ItemV2.Allowance1/2/3` | |
| Phụ cấp bổ sung (Col11) | `Ins_ReportD02ItemV2.AllowanceAdditional` | |
| Phụ cấp 4 (Col81) | `Ins_ReportD02ItemV2.Allowance4` | |
| Ngày bắt đầu (Col12) | `Ins_ReportD02ItemV2.DateStart` | Ngày bắt đầu HĐ / tháng hiệu lực |
| Ngày kết thúc (Col13) | `Ins_ReportD02ItemV2.DateEnd` | Ngày kết thúc HĐ / tháng kết thúc |
| Loại điều chỉnh (Col14) | `insReportD02ItemStatus` (IBHXHCode) | TM, TD, ON, DC... |
| Số QĐLĐ / Số HĐ (Col15) | `Ins_ReportD02ItemV2.DecisionNo` | |
| Loại QĐ (Col16) | `Ins_ReportD02ItemV2.DecisionType` | |
| Ngày ký QĐ (Col17) | `Ins_ReportD02ItemV2.DecisionDatesigned` | |
| Tỉ lệ đóng BH (Col18) | `Cat_RateInsurance` (tính từ 3 loại rate) | |
| Nơi khám BHYT (Col22) | `Hre_Profile.ProvinceHospital` | |
| Mã KCB (Col23) | `Hre_HealthInsuranceCard.HealthTreatmentPlaceCode` | |
| Mã quốc tịch (Col24) | `Cat_Country.Code` | |
| Dân tộc (Col25) | `Cat_EthnicGroup.EthnicGroupName` | |
| CMND/CCCD (Col26) | `Hre_Profile.IDNo` hoặc `IDCard` | Ưu tiên IDCard nếu có |
| Ngày cấp CMND (Col27) | `Hre_Profile.IDDateOfIssue` | |
| Tỉnh cấp CMND (Col28) | `Cat_Province` theo `PlaceOfIssueID` | |
| Địa chỉ thường trú: Phường/Xã, Q/H, T/TP (Col29-32) | `Cat_Village/District/Province` theo `VillageID, PDistrictID, PProvinceID` | |
| Địa chỉ tạm trú (Col36-39, 55-57, 110-...) | `Hre_Profile.TAddress`, `TAVillageID`, `TDistrictID`, `TProvinceID` | |
| SĐT (Col40) | `Hre_Profile.HomePhone` | |
| Email (Col41) | `Hre_Profile.Email` | |
| Mã nhân viên (Col44) | `Hre_Profile.CodeEmp` | |
| Số tài khoản ngân hàng (Col45) | `Sal_SalaryInformation.AccountNo` | |
| Tên ngân hàng (Col46) | `Cat_Bank.BankName` | |
| Chi nhánh ngân hàng (Col47) | `Sal_SalaryInformation.BankBrandName` | |
| Lương đóng BH (Col48, ẩn) | `Ins_ReportD02ItemV2.InsuranceSalary` | |
| Chi nhánh tổ chức (Col49) | `Cat_OrgUnit.E_BRANCH` | |
| Nơi cấp sổ BHXH (Col50) | `Hre_Profile.SocialInsIssuePlace` | |
| Nơi KCB đầy đủ (Col51) | `Hre_Profile.HealthTreatmentPlace` | |
| Số phụ lục (Col89) | `Hre_ContractExtend.AnnexCode` | Lấy từ `ContractExtendID` trong ProfileInsuranceMonthly |
| Ngày bắt đầu / kết thúc phụ lục (Col90-91) | `Hre_ContractExtend.DateStart/DateEnd` | |
| Số hợp đồng (Col92) | `Hre_Contract.ContractNo` | |
| Ngày bắt đầu / kết thúc HĐ (Col93-94) | `Hre_Contract.DateStart/DateEnd` | |
| Họ tên chủ hộ (Col64) | `Hre_ProfileMoreInfo.HouseholderFullName` | |
| SĐT chủ hộ (Col65) | `Hre_ProfileMoreInfo.Telephone` | |
| Số sổ hộ khẩu (Col66) | `Hre_ProfileMoreInfo.HouseholdBookNo` | |
| Mã phòng ban (Col109) | `Cat_OrgStructure.Code` | |
| Nơi làm việc (Col87) | `Cat_Company.CompanyName` theo `CompanyID` trên ProfileInsuranceMonthly | |
| Địa chỉ nơi làm việc (Col88) | `Cat_Company.AddressVN` | |

---

## Checklist kiểm tra khi field bị trống

### 1. Số sổ BHXH trống
- [ ] Kiểm tra `Hre_Profile.SocialInsNo` đã nhập chưa
- [ ] Kiểm tra `Ins_ReportD02ItemV2.SocialInsNo` – nếu đã phân tích mà vẫn trống thì cần **phân tích lại D02** sau khi cập nhật hồ sơ

---

### 2. Chức danh (JobName) trống
- [ ] Kiểm tra `Ins_ProfileInsuranceMonthly.JobName` của tháng đó có giá trị không
- [ ] Lưu ý: `JobName` được lấy từ `ProfileInsuranceMonthly`, **không lấy trực tiếp** từ `Cat_JobTitle` — cần kiểm tra dữ liệu chứng từ BH tháng đó

---

### 3. Lương mới / lương cũ trống
- [ ] `NewBasicSalary` / `OldBasicSalary` trong `Ins_ReportD02ItemV2` — được gán khi phân tích D02
- [ ] Nếu trống: kiểm tra `Ins_ProfileInsuranceMonthly.SalaryInsurance` của tháng [N] và tháng [N-1] có dữ liệu không
- [ ] Kiểm tra chứng từ bảo hiểm (`Ins_InsuranceRecord`) tháng đó đã được tạo chưa

---

### 4. Phụ cấp (Allowance 1/2/3/4, AllowanceAdditional) trống
- [ ] Kiểm tra `Ins_ProfileInsuranceMonthly.Allowance1/2/3/4/AllowanceAdditional` tháng đó
- [ ] Nếu phụ cấp không cấu hình đưa vào lương đóng BH thì sẽ không có giá trị

---

### 5. Ngày bắt đầu / kết thúc trống
- [ ] `DateStart` / `DateEnd` trong `Ins_ReportD02ItemV2` — được set khi phân tích
- [ ] Với loại **TM (tăng mới lao động)**: `DateStart` = ngày bắt đầu hợp đồng BHXH → kiểm tra `Hre_Contract.DateStart`
- [ ] Với loại **DC (điều chỉnh lương)**: `DateStart` = `MonthYearEffect` của `Ins_ProfileInsuranceMonthly`
- [ ] Phân tích lại D02 nếu hợp đồng vừa được cập nhật

---

### 6. Số hợp đồng / Số phụ lục trống
- [ ] Kiểm tra `Ins_ProfileInsuranceMonthly.ContractID` và `ContractExtendID` có giá trị không
- [ ] Nếu null: NV chưa được gắn hợp đồng vào chứng từ BH tháng đó
- [ ] Kiểm tra `Hre_Contract` – hợp đồng đã được duyệt (`Status = 'E_APPROVED'`) chưa
- [ ] Kiểm tra `Hre_ContractExtend` – phụ lục có đúng `ContractID` và `DateStart` không

---

### 7. Nơi làm việc (WorkPlace / CompanyWorkPlace) trống
- [ ] **Col82 (WorkPlaceName)**: lấy từ `Cat_WorkPlace` theo `WorkPlaceID` trên `Hre_Profile` — kiểm tra hồ sơ có chọn nơi làm việc chưa
- [ ] **Col87 (CompanyWorkPlace)**: lấy từ `Cat_Company.CompanyName` theo `CompanyID` trên `Ins_ProfileInsuranceMonthly` — kiểm tra chứng từ BH có `CompanyID` không

---

### 8. Địa chỉ thường trú / tạm trú trống
- [ ] Kiểm tra `Hre_Profile`: `PProvinceID`, `PDistrictID`, `VillageID` (thường trú); `TProvinceID`, `TDistrictID`, `TAVillageID` (tạm trú)
- [ ] Đối chiếu với `Cat_Province`, `Cat_District`, `Cat_Village` — nếu ID có nhưng không tìm thấy trong danh mục thì danh mục bị thiếu

---

### 9. Mã KCB / Nơi khám BHYT trống
- [ ] **Col23**: lấy từ `Hre_HealthInsuranceCard.HealthTreatmentPlaceCode` — kiểm tra bảng thẻ BHYT của NV
- [ ] **Col22 (ProvinceHospital)**: lấy từ `Hre_Profile.ProvinceHospital`
- [ ] **Col51 (HealthTreatmentPlace)**: lấy từ `Hre_Profile.HealthTreatmentPlace`
- [ ] Nếu cả 3 đều trống: NV chưa nhập thông tin nơi KCB trên hồ sơ

---

### 10. Thông tin ngân hàng (số TK, tên NH, chi nhánh) trống
- [ ] Kiểm tra `Sal_SalaryInformation` của NV có bản ghi với `BankID != null` không
- [ ] Kiểm tra `Cat_Bank.BankName` và `Cat_Branch` có tồn tại không
- [ ] NV có thể chưa khai thông tin ngân hàng trong màn hình thông tin lương

---

### 11. Họ tên chủ hộ / Số sổ hộ khẩu trống (Col64-66)
- [ ] Kiểm tra `Hre_ProfileMoreInfo` của NV: `HouseholderFullName`, `Telephone`, `HouseholdBookNo`
- [ ] `Hre_Profile.ProfileMoreInfoID` có giá trị không — nếu null thì bảng ProfileMoreInfo chưa được tạo cho NV

---

### 12. Mã phòng ban (OrgStructureCode) trống
- [ ] Kiểm tra `Cat_OrgStructure.Code` — phòng ban đó có nhập mã chưa
- [ ] Kiểm tra `Ins_ProfileInsuranceMonthly.OrgStructureID` tháng đó có khác null không

---

### 13. Chi nhánh tổ chức (E_BRANCH) trống (Col49)
- [ ] Kiểm tra bảng `Cat_OrgUnit` — record tương ứng với `OrgStructureID` của NV có trường `E_BRANCH` không
- [ ] `Cat_OrgUnit` là bảng cấu hình riêng per-đơn-vị (VietTel, VNPT...) — đơn vị thường không cần trường này

---

## Lưu ý chung

1. **Phân tích lại D02** sau khi sửa dữ liệu hồ sơ — dữ liệu trên lưới là snapshot tại thời điểm phân tích, không tự cập nhật.
2. Các field lấy từ `Ins_ReportD02ItemV2` (lương, ngày, số HĐ...) chỉ thay đổi khi **phân tích lại**.
3. Các field lấy trực tiếp từ `Hre_Profile` (địa chỉ, CMND, SĐT...) có thể được load mới khi search lại mà **không cần phân tích lại**.
4. Nếu field trống do thiếu danh mục (`Cat_Province`, `Cat_Bank`...) → cần bổ sung danh mục, sau đó phân tích lại.

---

## Query kiểm tra nhanh

```sql
-- 1. Kiểm tra chứng từ BH tháng đó có đủ dữ liệu không
SELECT ProfileID, MonthYear, SalaryInsurance, JobName, ContractID, ContractExtendID, CompanyID, OrgStructureID
FROM Ins_ProfileInsuranceMonthly
WHERE ProfileID = '<ProfileID>'
ORDER BY MonthYear DESC

-- 2. Kiểm tra thông tin hợp đồng
SELECT c.ID, c.ContractNo, c.DateStart, c.DateEnd, c.Status,
       ce.AnnexCode, ce.DateStart AS AnnexStart, ce.DateEnd AS AnnexEnd
FROM Hre_Contract c
LEFT JOIN Hre_ContractExtend ce ON ce.ContractID = c.ID
WHERE c.ProfileID = '<ProfileID>'
ORDER BY c.DateStart DESC

-- 3. Kiểm tra thông tin ngân hàng
SELECT s.ProfileID, s.AccountNo, b.BankName, s.BankBrandName
FROM Sal_SalaryInformation s
LEFT JOIN Cat_Bank b ON b.ID = s.BankID
WHERE s.ProfileID = '<ProfileID>'

-- 4. Kiểm tra ProfileMoreInfo
SELECT pmi.HouseholderFullName, pmi.Telephone, pmi.HouseholdBookNo, pmi.HouseHoldCode
FROM Hre_Profile p
LEFT JOIN Hre_ProfileMoreInfo pmi ON pmi.ID = p.ProfileMoreInfoID
WHERE p.ID = '<ProfileID>'

-- 5. Kiểm tra thẻ BHYT
SELECT ProfileID, HealthTreatmentPlaceCode
FROM Hre_HealthInsuranceCard
WHERE ProfileID = '<ProfileID>'
```
