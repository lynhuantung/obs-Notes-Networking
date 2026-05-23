---
Mã: 25114610-01
aliases:
date: 2025-11-10
time: 11:18
Week: "46"
tags:
  - daily
  - vnpay
  - vnPay-project
Link: https://docs.google.com/document/d/1NGQTpEMeIDiiVOVVufkWWfL9HoL4bdv68VcdZ9r0Q1A/edit?usp=sharing
---

### **I. Cơ chế chung khi lấy Danh mục**

Tất cả các API lấy danh mục đều sử dụng phương thức **GET**.
Tài liệu API: https://docs.google.com/document/d/1NGQTpEMeIDiiVOVVufkWWfL9HoL4bdv68VcdZ9r0Q1A/edit?usp=sharing

**1. Thông tin xác thực (Request header)**

Khi gửi yêu cầu (request), bạn cần cung cấp các thông tin tiêu đề sau:

|Key|Mô tả|
|:--|:--|
|`Content-Type`|Luôn là `application/json`.|
|`x-clientid`|ClientID được cấp trên ứng dụng AMIS BHXH.|
|`x-iv-token`|Chuỗi hash được sinh ra theo thuật toán **HMACSHA256**.|
|`x-transactionid`|Là **Input** dùng để tạo token. (Giá trị input này thường được định nghĩa theo từng đầu API, nhưng trong các ví dụ API lấy danh mục, nó được liệt kê là một header bắt buộc).|

**2. Chuẩn Response (ServiceResponse)**

Dữ liệu trả về (response) sẽ theo chuẩn chung, trong đó phần `Data` sẽ chứa danh sách các đối tượng danh mục (List).

|Key|Value|Mô tả|
|:--|:--|:--|
|`Success`|`true` hoặc `false`|Báo request thành công hay không.|
|`Code`|ServiceResponseCode|Mã Code báo thành công hoặc lỗi.|
|`Data`|`object`|Danh sách các đối tượng danh mục (ví dụ: `List<OpenCitizenPlace>`).|

---

### **II. Danh sách API và Mô hình Danh mục chi tiết**

Dưới đây là các API và mô hình dữ liệu (`Model`) được sử dụng để lấy các danh mục khác nhau liên quan đến nghiệp vụ BHXH:

|API lấy danh mục|URL (GET)|Mô hình Dữ liệu (Model)|Các trường dữ liệu chính trong Model|Nguồn|
|:--|:--|:--|:--|:--|
|**Nơi cấp** (Citizen Places)|`{{BhxhURL}}/api/v1/OpenDirectorys/CitizenPlaces`|`OpenCitizenPlace`|ProvincialID, ProvincialCode, ProvincialName||
|**Quốc tịch** (Nationalities)|`{{BhxhURL}}/api/v1/OpenDirectorys/Nationalities`|`OpenNationality`|NationalityID, NationalityCode, NationalityName||
|**Dân tộc** (Ethnics)|`{{BhxhURL}}/api/v1/OpenDirectorys/Ethnics`|`OpenEthnic`|EthnicID, EthnicCode, EthnicName||
|**Vùng sinh sống** (Residential Areas)|`{{BhxhURL}}/api/v1/OpenDirectorys/ResidentialAreas`|`OpenResidentialArea`|ResidentialAreaType, ResidentialAreaName, ResidentialAreaExplain||
|**Tỉnh thành** (Provincials)|`{{BhxhURL}}/api/v1/OpenDirectorys/Provincials`|`OpenProvincial`|ProvincialID, ProvincialCode, ProvincialName||
|**Quận, huyện, xã, phường** (Administrative Areas)|`{{BhxhURL}}/api/v1/OpenDirectorys/AdministrativeAreas`|`OpenAdministrativeArea`|AdministrativeAreaID, AdministrativeAreaCode, ParentCode, Name||
|**Bộ phận phòng ban** (Organization Units)|`{{BhxhURL}}/api/v1/OpenDirectorys/OrganizationUnits`|`OpenOrganizationUnit`|OrganizationUnitID (guid), OrganizationUnitCode, OrganizationUnitName||
|**Chức vụ, chức danh nghề** (Possitions)|`{{BhxhURL}}/api/v1/OpenDirectorys/Possitions`|`OpenPossition`|PossitionID (guid), PossitionCode, PossitionName||
|**Loại hợp đồng** (Contract Types)|`{{BhxhURL}}/api/v1/OpenDirectorys/ContractTypes`|`OpenContractType`|ContractId, ContractCode, ContractName||
|**Vị trí làm việc** (Position Jobs)|`{{BhxhURL}}/api/v1/OpenDirectorys/PositionJobs`|`OpenPositionJob`|PositionJobId, PositionJobCode, PositionJobName||
|**Phương án khai báo** (Social Insurance Declarations)|`{{BhxhURL}}/api/v1/OpenDirectorys/SocialInsuranceDeclarations`|`OpenSocialInsuranceDeclaration`|SocialInsuranceDeclarationID, SocialInsuranceDeclarationCode, SocialInsuranceDeclarationName, SocialInsuranceFormID||
|**Tỉnh đăng ký KCB** (Province Medical Treatments)|`{{BhxhURL}}/api/v1/OpenDirectorys/ProvinceMedicalTreatments`|`OpenProvinceMedicalTreatment`|ProvincialID, ProvincialCode, ProvincialName||
|**Bệnh viện** (Hospitals)|`{{BhxhURL}}/api/v1/OpenDirectorys/Hospitals`|`OpenHospital`|HospitalID (guid), HospitalCode, HospitalName, ProvincialCode||
|**Tỷ lệ đóng** (Insurance Rates)|`{{BhxhURL}}/api/v1/OpenDirectorys/InsuranceRates`|`OpenInsuranceRate` (hoặc trả về List)|ParticipationFormID (guid), ParticipationFormCode, ParticipationFormName, Rate (decimal)||
|**Vùng lương tối thiểu** (Minium Salaries)|`{{BhxhURL}}/api/v1/OpenDirectorys/MiniumSalaries`|`OpenMiniumSalary`|MiniumSalaryID, AreaCode, AreaName, MiniumSalary (decimal)||
|**Đối tượng hưởng BHYT cao hơn** (Benefit Objects)|`{{BhxhURL}}/api/v1/OpenDirectorys/BenefitObjects`|`OpenBenefitObject`|ID, Name (Mã đối tượng hưởng), Level, StateSupportRate||
|**Quan hệ với chủ hộ** (Relations)|`{{BhxhURL}}/api/v1/OpenDirectorys/Relations`|`OpenRelation`|RelationID, RelationCode, RelationName||
|**Tên, loại văn bản (bảng kê)** (Profile Book Attachment Types)|`{{BhxhURL}}/api/v1/OpenDirectorys/OpenProfileBookAttachmentTypes`|`OpenProfileBookAttachmentType`|AttachmentCode, AttachmentName||
|**Bệnh dài ngày** (Long Term Diseases)|`{{BhxhURL}}/api/v1/OpenDirectorys/LongTermDiseases`|`OpenLongTermDisease`|LongTermDiseaseID, LongTermDiseaseName||
|**Nhóm hưởng** (Beneficiary Groups)|`{{BhxhURL}}/api/v1/OpenDirectorys/BeneficiaryGroups`|`OpenBeneficiaryGroup`|BeneficiaryGroupID, BeneficiaryGroupCode, BeneficiaryGroupName, InsuranceTermsCode||
|**Tuyến bệnh viện** (Hospital Types)|`{{BhxhURL}}/api/v1/OpenDirectorys/HospitalTypes`|`OpenHospitalType`|HospitalTypeID, HospitalTypeCode, HospitalTypeName||
|**Ngân hàng** (Banks)|`{{BhxhURL}}/api/v1/OpenDirectorys/Banks`|`OpenBank`|BankID, BankCode, BankName||
|**Chi nhánh ngân hàng** (Bank Branches)|`{{BhxhURL}}/api/v1/OpenDirectorys/BankBranchs`|`OpenBankBranch`|BankBranchID (guid), BankBranchCode, BankBranchName, ProvincialCode||
|**Loại giấy tờ** (Document Types)|`{{BhxhURL}}/api/v1/OpenDirectorys/DocumentTypes`|`OpenDocumentType`|DocumentTypeID, DocumentTypeName||
|**Điều kiện khám thai** (Prenatal Cares)|`{{BhxhURL}}/api/v1/OpenDirectorys/PrenatalCares`|`OpenPrenatalCare`|PrenatalCareCode, PrenatalCareName||
|**Biện pháp tránh thai** (Contraceptives)|`{{BhxhURL}}/api/v1/OpenDirectorys/Contraceptives`|`OpenContraceptive`|ContraceptiveCode, ContraceptiveName||
|**Điều kiện sinh con** (Born Kid Conditions)|`{{BhxhURL}}/api/v1/OpenDirectorys/BornkidConditions`|`OpenBornKidCondition`|BornKidConditionCode, BornKidConditionName||
|**Các thủ tục (hồ sơ)** (Social Insurance Forms)|`{{BhxhURL}}/api/v1/OpenDirectorys/SocialInsuranceForms`|`OpenSocialInsuranceForm`|SocialInsuranceFormID, SocialInsuranceFormCode, SocialInsuranceFormName||

Các danh mục này cung cấp các giá trị chuẩn hóa cần thiết để điền vào các trường dữ liệu trong các nghiệp vụ điện tử, ví dụ như **tạo hồ sơ điện tử nhóm 600, 601, 601a, 605** hay **nhóm 630**. Chẳng hạn, khi tạo hồ sơ, bạn sẽ cần các mã từ các danh mục này như `NationalityCode` (Mã quốc tịch) hay `ProvinceMedicalTreatmentCode` (Mã tỉnh đăng ký khám chữa bệnh).

Việc đồng bộ và sử dụng các mã danh mục này giúp đảm bảo tính hợp lệ của dữ liệu trước khi gửi sang cơ quan BHXH, tránh các lỗi nghiệp vụ như **"Thông tin không map được theo danh mục"** (lỗi Code 1).