---
Mã: 25114610-01
aliases:
date: 2025-11-10
time: 11:23
Week: "46"
tags:
  - daily
Project: "[[Dự án VnPay]]"
---
### I. Các Danh mục Bắt buộc chung cho Hồ sơ 600 và 630

Liên quan : [[Đồng bộ danh mục amis BHXH]]
Cả hai nhóm hồ sơ này (600 và 630) đều liên quan đến thông tin nhân sự và địa lý, vì vậy, nhiều danh mục cơ bản cần được đồng bộ:

|Tên Danh mục cần đồng bộ|Model dữ liệu sử dụng|Mã trường yêu cầu trong hồ sơ 600/630|Nguồn API|
|:--|:--|:--|:--|
|**Quốc tịch**|`OpenNationality`|`NationalityCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/Nationalities`|
|**Dân tộc**|`OpenEthnic`|`EthnicCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/Ethnics`|
|**Tỉnh thành** (dùng cho địa chỉ)|`OpenProvincial`|Cần cho các trường mã tỉnh (ví dụ: `BirthProvincialCode`, `ResidentialProvincialCode`, `HomeProvinceCode`)|`{{BhxhURL}}/api/v1/OpenDirectorys/Provincials`|
|**Quận, huyện, xã, phường**|`OpenAdministrativeArea`|Cần cho các trường mã huyện/xã (ví dụ: `BirthDistricCode`, `ResidentialDistricCode`, `HomeDistricCode`, `HomeWardCode`)|`{{BhxhURL}}/api/v1/OpenDirectorys/AdministrativeAreas`|
|**Bộ phận/Phòng ban**|`OpenOrganizationUnit`|`OrganizationUnitID`, `OrganizationUnitName`|`{{BhxhURL}}/api/v1/OpenDirectorys/OrganizationUnits`|
|**Chức vụ/Chức danh nghề**|`OpenPossition`|`PossitionID`, `PossitionName`|`{{BhxhURL}}/api/v1/OpenDirectorys/Possitions`|
|**Phương án khai báo**|`OpenSocialInsuranceDeclaration`|`SocialInsuranceDeclarationCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/SocialInsuranceDeclarations`|
|**Các thủ tục (hồ sơ)**|`OpenSocialInsuranceForm`|Cần để kiểm tra `SocialInsuranceFormCode` (ví dụ: "600" hoặc "630")|`{{BhxhURL}}/api/v1/OpenDirectorys/SocialInsuranceForms`|

### II. Danh mục Cần thiết cho Hồ sơ 600 (Tăng/Giảm/Điều chỉnh BHXH)

Hồ sơ nhóm 600 (như 600, 601, 601a, 605) yêu cầu chi tiết về hợp đồng, nơi khám chữa bệnh và địa chỉ nhận sổ/thẻ.

|Tên Danh mục cụ thể cho 600|Model dữ liệu sử dụng|Mã trường yêu cầu trong hồ sơ 600|Nguồn API|
|:--|:--|:--|:--|
|**Nơi cấp** (Giấy tờ tùy thân)|`OpenCitizenPlace`|`CitizenIdentityPlaceCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/CitizenPlaces`|
|**Loại hợp đồng**|`OpenContractType`|`ContractCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/ContractTypes`|
|**Vị trí làm việc**|`OpenPositionJob`|`HighLevelPositionJobCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/PositionJobs`|
|**Vùng sinh sống**|`OpenResidentialArea`|`ResidentialAreaType`|`{{BhxhURL}}/api/v1/OpenDirectorys/ResidentialAreas`|
|**Tỉnh đăng ký KCB**|`OpenProvinceMedicalTreatment`|`ProvinceMedicalTreatmentCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/ProvinceMedicalTreatments`|
|**Bệnh viện**|`OpenHospital`|`HospitalCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/Hospitals`|
|**Tỷ lệ đóng**|`OpenInsuranceRate`|`ParticipationFormRate` (kiểm tra tỷ lệ)|`{{BhxhURL}}/api/v1/OpenDirectorys/InsuranceRates`|
|**Vùng lương tối thiểu**|`OpenMiniumSalary`|`MiniumSalaryCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/MiniumSalaries`|
|**Đối tượng hưởng BHYT cao hơn**|`OpenBenefitObject`|`BenefitObjectID`|`{{BhxhURL}}/api/v1/OpenDirectorys/BenefitObjects`|
|**Quan hệ với chủ hộ**|`OpenRelation`|`RelationWithHeadCode` (trong `ProfileFamilyDetail`)|`{{BhxhURL}}/api/v1/OpenDirectorys/Relations`|
|**Loại văn bản (bảng kê)**|`OpenProfileBookAttachmentType`|Cần cho `ProfileBookAttachmentName` (trong `ProfileBookAttachment`)|`{{BhxhURL}}/api/v1/OpenDirectorys/OpenProfileBookAttachmentTypes`|
|**Loại giấy tờ**|`OpenDocumentType`|`DocumentTypeID`|`{{BhxhURL}}/api/v1/OpenDirectorys/DocumentTypes`|

### III. Danh mục Cần thiết cho Hồ sơ 630 (Giải quyết chế độ BHXH)

Hồ sơ nhóm 630 (như 630, 630a, 630b, 630c) liên quan đến việc chi trả và giải quyết các chế độ như ốm đau, thai sản, và yêu cầu chi tiết về ngân hàng cũng như các điều kiện chế độ.

|Tên Danh mục cụ thể cho 630|Model dữ liệu sử dụng|Mã trường yêu cầu trong hồ sơ 630|Nguồn API|
|:--|:--|:--|:--|
|**Ngân hàng**|`OpenBank`|`BankCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/Banks`|
|**Chi nhánh ngân hàng**|`OpenBankBranch`|`BankBranchCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/BankBranchs`|
|**Nhóm hưởng**|`OpenBeneficiaryGroup`|`BeneficiaryGroupCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/BeneficiaryGroups`|
|**Bệnh dài ngày** (nếu là ốm đau)|`OpenLongTermDisease`|`DiseaseName`/`DiseaseCode` (Mã bệnh)|`{{BhxhURL}}/api/v1/OpenDirectorys/LongTermDiseases`|
|**Tuyến bệnh viện**|`OpenHospitalType`|`HospitalTypeCode`|`{{BhxhURL}}/api/v1/OpenDirectorys/HospitalTypes`|
|**Điều kiện khám thai** (nếu là thai sản)|`OpenPrenatalCare`|`AntenatalCareCondition`|`{{BhxhURL}}/api/v1/OpenDirectorys/PrenatalCares`|
|**Biện pháp tránh thai** (nếu là thai sản)|`OpenContraceptive`|`Contraceptive`|`{{BhxhURL}}/api/v1/OpenDirectorys/Contraceptives`|
|**Điều kiện sinh con** (nếu là thai sản)|`OpenBornKidCondition`|(Không thấy trường mã/tên tường minh trong model 630)|`{{BhxhURL}}/api/v1/OpenDirectorys/BornkidConditions`|

### Tổng kết

Để đảm bảo quy trình lập hồ sơ 600 và 630 diễn ra suôn sẻ, bạn nên ưu tiên đồng bộ **toàn bộ 28 danh mục** được liệt kê trong phần API lấy danh mục, đặc biệt là các danh mục địa lý, nhân sự, và các danh mục liên quan trực tiếp đến nghiệp vụ BHXH (như Nơi cấp, Quốc tịch, Tỉnh thành, Loại hợp đồng, Phương án khai báo, Tỉnh KCB, Bệnh viện, Ngân hàng, và Nhóm hưởng).

Việc sử dụng các mã danh mục chuẩn này là yêu cầu bắt buộc, vì nếu thông tin không khớp với danh mục chuẩn của hệ thống, hồ sơ có thể gặp lỗi nghiệp vụ với **Mã lỗi 1: Thông tin không map được theo danh mục**.

