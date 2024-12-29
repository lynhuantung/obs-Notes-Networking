---
aliases: 
date: 2024-10-31
tags:
  - "#datawarehouse"
Link: "[[TungLy/1. Projects/Data-WareHouse/ELT - Airbyte/DataWareHouse]]"
---
**

### https://chatgpt.com/c/671f7764-5d38-8011-90d3-077e8aa73add

### Một số Lưu ý khi Xây dựng Data Warehouse

- ### Fact Table: Chứa dữ liệu giao dịch, ví dụ như bảng Fact_Attendance, Fact_Leave, Fact_Overtime là nơi chứa thông tin chi tiết về chấm công, nghỉ phép, làm thêm.
    
- ### Dimension Table: Chứa thông tin tham chiếu, như Dim_Employee, Dim_Department, Dim_LeaveType giúp bổ sung thông tin chi tiết cho bảng fact.
    
- ### Star Schema: Có thể thiết kế theo mô hình Star Schema để dễ dàng truy vấn và phân tích dữ liệu.
    

  

### 1. Bảng Dim_Employee (Thông tin nhân viên)

- EmployeeID (INT, Khóa chính): Mã nhân viên
    
- EmployeeCode (VARCHAR, duy nhất): Mã nhân viên (Mã riêng do doanh nghiệp sử dụng)
    
- FullName (VARCHAR): Họ và tên
    
- DepartmentID (INT, Khóa ngoại): Mã phòng ban
    
- JobTitleID (INT, Khóa ngoại): Mã chức vụ
    
- EducationLevelID (INT, Khóa ngoại): Mã trình độ học vấn
    
- HireDate (DATE): Ngày tuyển dụng
    
- TerminationDate (DATE, NULLABLE): Ngày kết thúc hợp đồng (nếu có)
    
- Status (VARCHAR): Tình trạng làm việc (Active/Inactive)
    

### 2. Bảng Dim_Department (Phòng ban)

- DepartmentID (INT, Khóa chính): Mã phòng ban
    
- DepartmentName (VARCHAR): Tên phòng ban
    
- ManagerID (INT, Khóa ngoại, NULLABLE): Mã nhân viên quản lý
    
- Status (VARCHAR): Tình trạng (Hoạt động/Đóng)
    
- EffectiveDate (DATE): Ngày bắt đầu có hiệu lực
    

### 3. Bảng Fact_Attendance (Bảng chấm công)

- AttendanceID (INT, Khóa chính): Mã chấm công
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- Date (DATE): Ngày chấm công
    
- ShiftID (INT, Khóa ngoại): Mã ca làm việc
    
- CheckInTime (TIME): Giờ vào
    
- CheckOutTime (TIME): Giờ ra
    
- WorkHours (DECIMAL): Số giờ làm việc
    
- OvertimeHours (DECIMAL): Số giờ làm thêm
    
- AttendanceStatus (VARCHAR): Tình trạng chấm công (Ví dụ: đi trễ, vắng mặt, đi làm)
    

### 4. Bảng Dim_Shift (Ca làm việc)

- ShiftID (INT, Khóa chính): Mã ca làm việc
    
- ShiftName (VARCHAR): Tên ca làm việc (Ví dụ: Ca sáng, Ca chiều)
    
- StartTime (TIME): Giờ bắt đầu
    
- EndTime (TIME): Giờ kết thúc
    
- BreakTime (DECIMAL): Thời gian nghỉ giữa ca
    

### 5. Bảng Fact_Leave (Bảng xin phép nghỉ)

- LeaveID (INT, Khóa chính): Mã nghỉ phép
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- LeaveTypeID (INT, Khóa ngoại): Mã loại nghỉ
    
- StartDate (DATE): Ngày bắt đầu nghỉ
    
- EndDate (DATE): Ngày kết thúc nghỉ
    
- LeaveDays (DECIMAL): Số ngày nghỉ
    
- LeaveStatus (VARCHAR): Tình trạng nghỉ phép (Phê duyệt/Chưa phê duyệt)
    

### 6. Bảng Dim_LeaveType (Loại nghỉ phép)

- LeaveTypeID (INT, Khóa chính): Mã loại nghỉ
    
- LeaveTypeName (VARCHAR): Tên loại nghỉ (Ví dụ: Nghỉ phép năm, nghỉ bệnh, nghỉ không lương)
    
- MaxLeaveDays (DECIMAL): Số ngày nghỉ tối đa
    

### 7. Bảng Fact_Overtime (Bảng làm thêm giờ)

- OvertimeID (INT, Khóa chính): Mã làm thêm
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- Date (DATE): Ngày làm thêm
    
- OvertimeHours (DECIMAL): Số giờ làm thêm
    
- OvertimeReason (VARCHAR): Lý do làm thêm
    
- ApprovalStatus (VARCHAR): Tình trạng phê duyệt (Phê duyệt/Chưa phê duyệt)
    

### 8. Bảng Fact_WorkSchedule (Lịch làm việc)

- WorkScheduleID (INT, Khóa chính): Mã lịch làm việc
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- Date (DATE): Ngày làm việc
    
- ShiftID (INT, Khóa ngoại): Mã ca làm việc
    
- AssignedBy (INT, Khóa ngoại, NULLABLE): Nhân viên phân công
    

### 9. Bảng Fact_Contract (Quản lý nhân viên hợp đồng)

- ContractID (INT, Khóa chính): Mã hợp đồng
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- ContractType (VARCHAR): Loại hợp đồng (Ví dụ: Thời vụ, Chính thức)
    
- StartDate (DATE): Ngày bắt đầu hợp đồng
    
- EndDate (DATE, NULLABLE): Ngày kết thúc hợp đồng (nếu có)
    
- Salary (DECIMAL): Mức lương
    
- ContractStatus (VARCHAR): Tình trạng hợp đồng (Có hiệu lực/Hết hiệu lực)
    

### 10. Bảng Fact_CareerProgress (Quá trình công tác)

- CareerProgressID (INT, Khóa chính): Mã quá trình công tác
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- DepartmentID (INT, Khóa ngoại): Mã phòng ban
    
- JobTitleID (INT, Khóa ngoại): Mã chức vụ
    
- EducationLevelID (INT, Khóa ngoại): Mã trình độ học vấn
    
- StartDate (DATE): Ngày bắt đầu vị trí
    
- EndDate (DATE, NULLABLE): Ngày kết thúc vị trí (nếu có)
    
- ReasonForChange (VARCHAR): Lý do thay đổi (Ví dụ: Thăng chức, Chuyển bộ phận)
    

### 11. Bảng Dim_JobTitle (Chức vụ)

- JobTitleID (INT, Khóa chính): Mã chức vụ
    
- JobTitleName (VARCHAR): Tên chức vụ (Ví dụ: Nhân viên, Trưởng phòng, Giám đốc)
    
- JobLevel (VARCHAR): Cấp bậc (Ví dụ: Nhân viên, Quản lý, Lãnh đạo)
    
- EffectiveDate (DATE): Ngày bắt đầu có hiệu lực
    

### 12. Bảng Dim_EducationLevel (Trình độ học vấn)

- EducationLevelID (INT, Khóa chính): Mã trình độ học vấn
    
- EducationLevelName (VARCHAR): Tên trình độ học vấn (Ví dụ: Trung cấp, Cao đẳng, Đại học, Thạc sĩ)
    
- Specialization (VARCHAR, NULLABLE): Chuyên ngành học (Ví dụ: Công nghệ thông tin, Quản trị kinh doanh)
    

### 13. Bảng Fact_Salary (Thông tin lương)

- SalaryID (INT, Khóa chính): Mã lương
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- PayPeriod (DATE): Kỳ trả lương (Ví dụ: Tháng, Quý)
    
- BaseSalary (DECIMAL): Lương cơ bản
    
- OvertimeAmount (DECIMAL): Số tiền làm thêm giờ
    
- Bonus (DECIMAL): Thưởng
    
- Deductions (DECIMAL): Các khoản khấu trừ (Ví dụ: Bảo hiểm, Thuế)
    
- NetSalary (DECIMAL): Lương thực lĩnh
    

### 14. Bảng Dim_BonusType (Loại thưởng)

- BonusTypeID (INT, Khóa chính): Mã loại thưởng
    
- BonusTypeName (VARCHAR): Tên loại thưởng (Ví dụ: Thưởng hiệu suất, Thưởng dự án)
    
- Description (VARCHAR, NULLABLE): Mô tả chi tiết về loại thưởng
    

### 15. Bảng Fact_Bonus (Chi tiết thưởng)

- BonusID (INT, Khóa chính): Mã thưởng
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- BonusTypeID (INT, Khóa ngoại): Mã loại thưởng
    
- DateAwarded (DATE): Ngày được thưởng
    
- Amount (DECIMAL): Số tiền thưởng
    

### 16. Bảng Fact_MonthlySalary (Lương tháng)

- MonthlySalaryID (INT, Khóa chính): Mã lương tháng
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- Month (DATE): Tháng tính lương
    
- BaseSalary (DECIMAL): Lương cơ bản
    
- OvertimeAmount (DECIMAL): Tiền làm thêm giờ
    
- BonusAmount (DECIMAL): Số tiền thưởng
    
- DeductionAmount (DECIMAL): Các khoản khấu trừ
    
- NetSalary (DECIMAL): Lương thực nhận
    
- ApprovalStatus (VARCHAR): Tình trạng phê duyệt (Phê duyệt/Chưa phê duyệt)
    

### 17. Bảng Fact_MonthlyAttendance (Công tháng)

- MonthlyAttendanceID (INT, Khóa chính): Mã công tháng
    
- EmployeeID (INT, Khóa ngoại): Mã nhân viên
    
- Month (DATE): Tháng chấm công
    
- TotalWorkDays (DECIMAL): Tổng số ngày làm việc
    
- TotalLeaveDays (DECIMAL): Tổng số ngày nghỉ
    
- TotalOvertimeHours (DECIMAL): Tổng số giờ làm thêm
    
- TotalWorkHours (DECIMAL): Tổng số giờ làm việc
    

  

### Script tạo bảng dữ liệu

-- Tạo bảng Dim_Employee (Thông tin nhân viên)

CREATE TABLE Dim_Employee (

    EmployeeID INT PRIMARY KEY,

    EmployeeCode VARCHAR(50) UNIQUE,

    FullName VARCHAR(100),

    DepartmentID INT,

    JobTitleID INT,

    EducationLevelID INT,

    HireDate DATE,

    TerminationDate DATE NULL,

    Status VARCHAR(50)

);

  

-- Tạo bảng Dim_Department (Phòng ban)

CREATE TABLE Dim_Department (

    DepartmentID INT PRIMARY KEY,

    DepartmentName VARCHAR(100),

    ManagerID INT NULL,

    Status VARCHAR(50),

    EffectiveDate DATE

);

  

-- Tạo bảng Fact_Attendance (Bảng chấm công)

CREATE TABLE Fact_Attendance (

    AttendanceID INT PRIMARY KEY,

    EmployeeID INT,

    Date DATE,

    ShiftID INT,

    CheckInTime TIME,

    CheckOutTime TIME,

    WorkHours DECIMAL(10, 2),

    OvertimeHours DECIMAL(10, 2),

    AttendanceStatus VARCHAR(50)

);

  

-- Tạo bảng Dim_Shift (Ca làm việc)

CREATE TABLE Dim_Shift (

    ShiftID INT PRIMARY KEY,

    ShiftName VARCHAR(50),

    StartTime TIME,

    EndTime TIME,

    BreakTime DECIMAL(10, 2)

);

  

-- Tạo bảng Fact_Leave (Bảng xin phép nghỉ)

CREATE TABLE Fact_Leave (

    LeaveID INT PRIMARY KEY,

    EmployeeID INT,

    LeaveTypeID INT,

    StartDate DATE,

    EndDate DATE,

    LeaveDays DECIMAL(10, 2),

    LeaveStatus VARCHAR(50)

);

  

-- Tạo bảng Dim_LeaveType (Loại nghỉ phép)

CREATE TABLE Dim_LeaveType (

    LeaveTypeID INT PRIMARY KEY,

    LeaveTypeName VARCHAR(50),

    MaxLeaveDays DECIMAL(10, 2)

);

  

-- Tạo bảng Fact_Overtime (Bảng làm thêm giờ)

CREATE TABLE Fact_Overtime (

    OvertimeID INT PRIMARY KEY,

    EmployeeID INT,

    Date DATE,

    OvertimeHours DECIMAL(10, 2),

    OvertimeReason VARCHAR(255),

    ApprovalStatus VARCHAR(50)

);

  

-- Tạo bảng Fact_WorkSchedule (Lịch làm việc)

CREATE TABLE Fact_WorkSchedule (

    WorkScheduleID INT PRIMARY KEY,

    EmployeeID INT,

    Date DATE,

    ShiftID INT,

    AssignedBy INT NULL

);

  

-- Tạo bảng Fact_Contract (Quản lý nhân viên hợp đồng)

CREATE TABLE Fact_Contract (

    ContractID INT PRIMARY KEY,

    EmployeeID INT,

    ContractType VARCHAR(50),

    StartDate DATE,

    EndDate DATE NULL,

    Salary DECIMAL(15, 2),

    ContractStatus VARCHAR(50)

);

  

-- Tạo bảng Fact_CareerProgress (Quá trình công tác)

CREATE TABLE Fact_CareerProgress (

    CareerProgressID INT PRIMARY KEY,

    EmployeeID INT,

    DepartmentID INT,

    JobTitleID INT,

    EducationLevelID INT,

    StartDate DATE,

    EndDate DATE NULL,

    ReasonForChange VARCHAR(255)

);

  

-- Tạo bảng Dim_JobTitle (Chức vụ)

CREATE TABLE Dim_JobTitle (

    JobTitleID INT PRIMARY KEY,

    JobTitleName VARCHAR(100),

    JobLevel VARCHAR(50),

    EffectiveDate DATE

);

  

-- Tạo bảng Dim_EducationLevel (Trình độ học vấn)

CREATE TABLE Dim_EducationLevel (

    EducationLevelID INT PRIMARY KEY,

    EducationLevelName VARCHAR(100),

    Specialization VARCHAR(255) NULL

);

  

-- Tạo bảng Fact_Salary (Thông tin lương)

CREATE TABLE Fact_Salary (

    SalaryID INT PRIMARY KEY,

    EmployeeID INT,

    PayPeriod DATE,

    BaseSalary DECIMAL(15, 2),

    OvertimeAmount DECIMAL(15, 2),

    Bonus DECIMAL(15, 2),

    Deductions DECIMAL(15, 2),

    NetSalary DECIMAL(15, 2)

);

  

-- Tạo bảng Dim_BonusType (Loại thưởng)

CREATE TABLE Dim_BonusType (

    BonusTypeID INT PRIMARY KEY,

    BonusTypeName VARCHAR(100),

    Description VARCHAR(255) NULL

);

  

-- Tạo bảng Fact_Bonus (Chi tiết thưởng)

CREATE TABLE Fact_Bonus (

    BonusID INT PRIMARY KEY,

    EmployeeID INT,

    BonusTypeID INT,

    DateAwarded DATE,

    Amount DECIMAL(15, 2)

);

  

-- Tạo bảng Fact_MonthlySalary (Lương tháng)

CREATE TABLE Fact_MonthlySalary (

    MonthlySalaryID INT PRIMARY KEY,

    EmployeeID INT,

    Month DATE,

    BaseSalary DECIMAL(15, 2),

    OvertimeAmount DECIMAL(15, 2),

    BonusAmount DECIMAL(15, 2),

    DeductionAmount DECIMAL(15, 2),

    NetSalary DECIMAL(15, 2),

    ApprovalStatus VARCHAR(50)

);

  

-- Tạo bảng Fact_MonthlyAttendance (Công tháng)

CREATE TABLE Fact_MonthlyAttendance (

    MonthlyAttendanceID INT PRIMARY KEY,

    EmployeeID INT,

    Month DATE,

    TotalWorkDays DECIMAL(10, 2),

    TotalLeaveDays DECIMAL(10, 2),

    TotalOvertimeHours DECIMAL(10, 2),

    TotalWorkHours DECIMAL(10, 2)

);

  

### 1. Thông tin cơ bản về tổ chức

- Khối/Đơn vị (DivisionName): VARCHAR
    

- Tên khối hoặc đơn vị trong công ty mà nhân viên thuộc về. Khối/Đơn vị là cấp quản lý cao nhất, chia các bộ phận thành từng khối lớn, ví dụ: "Khối Kinh doanh", "Khối Tài chính".
    

- Phòng ban (DepartmentName): VARCHAR
    

- Tên phòng ban thuộc khối/đơn vị. Mỗi khối thường sẽ có nhiều phòng ban để thực hiện các chức năng khác nhau, ví dụ: "Phòng Marketing", "Phòng Kế toán".
    

- Bộ phận (SectionName): VARCHAR
    

- Tên bộ phận thuộc phòng ban, thể hiện các đơn vị nhỏ hơn phòng ban và có trách nhiệm cụ thể, ví dụ: "Bộ phận Sáng tạo", "Bộ phận Thanh toán".
    

- Nhóm (UnitName): VARCHAR
    

- Tên nhóm thuộc bộ phận, thường là các nhóm nhỏ làm việc trực tiếp để thực hiện dự án hoặc nhiệm vụ cụ thể, ví dụ: "Nhóm Thiết kế website", "Nhóm Kế toán công nợ".
    

### 2. Thông tin nhân sự

- Loại nhân viên (EmploymentType): VARCHAR
    

- Loại hợp đồng lao động của nhân viên, ví dụ như "Toàn thời gian", "Bán thời gian", "Thử việc". Trường này giúp phân loại loại hình lao động và chính sách lương thưởng.
    

- Nơi làm việc (WorkPlaceName): VARCHAR
    

- Địa điểm làm việc của nhân viên, có thể là tên văn phòng hoặc chi nhánh công ty, ví dụ: "Chi nhánh Hà Nội", "Trụ sở chính".
    

- Công ty (CompanyName): VARCHAR
    

- Tên công ty hoặc chi nhánh nơi nhân viên đang làm việc, giúp xác định công ty mẹ hoặc công ty con trong tập đoàn.
    

- Chức vụ (PositionName): VARCHAR
    

- Vị trí công tác cụ thể mà nhân viên đảm nhiệm, ví dụ: "Trưởng phòng", "Nhân viên".
    

- Chức danh (JobTitleName): VARCHAR
    

- Tên chức danh của nhân viên, thể hiện trách nhiệm nghề nghiệp, ví dụ: "Chuyên viên tài chính", "Nhân viên phát triển phần mềm".
    

### 3. Thông tin cá nhân

- Ngày vào làm (DateHire): DATE
    

- Ngày tháng năm nhân viên bắt đầu làm việc tại công ty. Thông tin này quan trọng để tính toán thâm niên và quyền lợi liên quan.
    

- Ngày kết thúc thử việc (DateEndProbation): DATE
    

- Ngày kết thúc giai đoạn thử việc của nhân viên. Sau thời điểm này, hợp đồng lao động chính thức sẽ được ký kết.
    

- Ngày sinh (DateOfBirth): DATE
    

- Ngày tháng năm sinh của nhân viên, giúp xác định tuổi, quyền lợi bảo hiểm và các chính sách liên quan đến độ tuổi.
    

- Tuổi (EmpYearsOld): INT
    

- Tuổi hiện tại của nhân viên, tính từ ngày sinh. Thông tin này có thể tự động tính toán dựa trên DateOfBirth.
    

- Nơi sinh (PlaceOfBirth): VARCHAR
    

- Địa điểm nơi nhân viên sinh ra, giúp hoàn thiện hồ sơ nhân viên.
    

- Giới tính (Gender): VARCHAR
    

- Giới tính của nhân viên, ví dụ: "Nam", "Nữ", "Khác". Thông tin này cần thiết cho các chính sách nhân sự và bảo hiểm.
    

### 4. Thông tin giấy tờ cá nhân

- Số CCCD (IDCard): VARCHAR
    

- Số căn cước công dân của nhân viên, giúp nhận diện danh tính và xác nhận thông tin cá nhân.
    

- Ngày cấp CCCD (IDCardDateOfIssue): DATE
    

- Ngày cấp căn cước công dân, để biết thời điểm giấy tờ được cấp.
    

- Nơi cấp CCCD (IDCardPlaceOfIssue): VARCHAR
    

- Nơi cấp căn cước công dân, thường là tên cơ quan công an.
    

- Số hộ chiếu (PassportNo): VARCHAR
    

- Số hộ chiếu của nhân viên, dành cho các nhân viên có nhu cầu đi công tác quốc tế.
    

- Ngày cấp hộ chiếu (PassportDateOfIssue): DATE
    

- Ngày cấp hộ chiếu của nhân viên.
    

- Ngày hết hạn hộ chiếu (PassportDateOfExpiry): DATE
    

- Ngày mà hộ chiếu hết hiệu lực. Thông tin này giúp nhân viên biết khi nào cần gia hạn.
    

- Nơi cấp hộ chiếu (PassportPlaceOfIssue): VARCHAR
    

- Nơi cấp hộ chiếu, giúp xác định cơ quan hoặc quốc gia cấp hộ chiếu.
    

### 5. Thông tin bổ sung

- Dân tộc (EthnicGroupName): VARCHAR
    

- Dân tộc của nhân viên, thông tin này được sử dụng cho mục đích thống kê và chính sách đa dạng.
    

- Tôn giáo (ReligionName): VARCHAR
    

- Tôn giáo mà nhân viên theo, hỗ trợ cho các chính sách tôn giáo và văn hóa tại công ty.
    

- Địa chỉ thường trú (P_Address): VARCHAR
    

- Địa chỉ thường trú, là nơi ở cố định đã đăng ký của nhân viên.
    

- Địa chỉ tạm trú (T_Address): VARCHAR
    

- Địa chỉ tạm trú, nơi nhân viên đang sinh sống trong thời gian làm việc.
    

- Trình độ văn hóa (TrinhDoVanHoa): VARCHAR
    

- Trình độ học vấn của nhân viên, ví dụ: "Trung học phổ thông", "Đại học", giúp đánh giá năng lực và yêu cầu đào tạo.
    

### 6. Liên hệ

- Số điện thoại (Cellphone): VARCHAR
    

- Số điện thoại di động của nhân viên, để liên lạc khi cần thiết.
    

- Email công ty (Email): VARCHAR
    

- Địa chỉ email công ty cấp cho nhân viên, dùng để trao đổi công việc nội bộ.
    

- Email cá nhân (Email2): VARCHAR
    

- Địa chỉ email cá nhân của nhân viên, dùng để liên lạc trong trường hợp cần thiết ngoài công việc.
    

### 7. Thông tin lương và phụ cấp

- Lương cơ bản (GrossAmount): DECIMAL
    

- Mức lương cơ bản mà nhân viên nhận được hàng tháng, chưa bao gồm các khoản phụ cấp hay thưởng.
    

- Phụ cấp 1 (TCTN): DECIMAL
    

- Thông tin về phụ cấp loại 1, có thể là phụ cấp trách nhiệm hoặc hỗ trợ công việc.
    

- Phụ cấp 2 (EHS): DECIMAL
    

- Thông tin về phụ cấp loại 2, ví dụ như phụ cấp an toàn lao động.
    

- Phụ cấp 3 (PCCC): DECIMAL
    

- Thông tin về phụ cấp loại 3, như phụ cấp phòng cháy chữa cháy.
    

### 8. Thâm niên và kinh nghiệm làm việc

- Tổng số tháng làm việc (TotalWorkingMonth): INT
    

- Tổng số tháng mà nhân viên đã làm việc tại công ty, bao gồm cả thời gian thử việc.
    

- Số năm thâm niên (ServiceYear): INT
    

- Số năm làm việc chính thức, không bao gồm thời gian thử việc hoặc làm việc bán thời gian.
    

- Số ngày thâm niên (ServiceMonth): INT
    

- Số ngày thâm niên, để đánh giá thời gian làm việc chi tiết hơn.
    

- Ngày bắt đầu thâm niên (ServiceDate): DATE
    

- Ngày bắt đầu được tính thâm niên, dùng để xác định các quyền lợi liên quan đến thâm niên, như thưởng hay chế độ nghỉ phép.
    

SELECT JSON_VALUE(Hre_Profile.value, '$.DivisionName') AS DivisionName, JSON_VALUE(Hre_Profile.value, '$.DepartmentName') AS DepartmentName, JSON_VALUE(Hre_Profile.value, '$.SectionName') AS SectionName, JSON_VALUE(Hre_Profile.value, '$.UnitName') AS UnitName, JSON_VALUE(Hre_Profile.value, '$.EmploymentType') AS EmploymentType, JSON_VALUE(Hre_Profile.value, '$.WorkPlaceName') AS WorkPlaceName, JSON_VALUE(Hre_Profile.value, '$.CompanyName') AS CompanyName, JSON_VALUE(Hre_Profile.value, '$.PositionName') AS PositionName, JSON_VALUE(Hre_Profile.value, '$.JobTitleName') AS JobTitleName, JSON_VALUE(Hre_Profile.value, '$.DateHire') AS DateHire, JSON_VALUE(Hre_Profile.value, '$.DateEndProbation') AS DateEndProbation, JSON_VALUE(Hre_Profile.value, '$.DateOfBirth') AS DateOfBirth, JSON_VALUE(Hre_Profile.value, '$.EmpYearsOld') AS EmpYearsOld, JSON_VALUE(Hre_Profile.value, '$.PlaceOfBirth') AS PlaceOfBirth, JSON_VALUE(Hre_Profile.value, '$.Gender') AS Gender, JSON_VALUE(Hre_Profile.value, '$.IDCard') AS IDCard, JSON_VALUE(Hre_Profile.value, '$.IDCardDateOfIssue') AS IDCardDateOfIssue, JSON_VALUE(Hre_Profile.value, '$.IDCardPlaceOfIssue') AS IDCardPlaceOfIssue, JSON_VALUE(Hre_Profile.value, '$.PassportNo') AS PassportNo, JSON_VALUE(Hre_Profile.value, '$.PassportDateOfIssue') AS PassportDateOfIssue, JSON_VALUE(Hre_Profile.value, '$.PassportDateOfExpiry') AS PassportDateOfExpiry, JSON_VALUE(Hre_Profile.value, '$.PassportPlaceOfIssue') AS PassportPlaceOfIssue, JSON_VALUE(Hre_Profile.value, '$.EthnicGroupName') AS EthnicGroupName, JSON_VALUE(Hre_Profile.value, '$.ReligionName') AS ReligionName, JSON_VALUE(Hre_Profile.value, '$.P_Address') AS P_Address, JSON_VALUE(Hre_Profile.value, '$.T_Address') AS T_Address, JSON_VALUE(Hre_Profile.value, '$.TrinhDoVanHoa') AS TrinhDoVanHoa, JSON_VALUE(Hre_Profile.value, '$.Cellphone') AS Cellphone, JSON_VALUE(Hre_Profile.value, '$.Email') AS Email, JSON_VALUE(Hre_Profile.value, '$.Email2') AS Email2, JSON_VALUE(Hre_Profile.value, '$.GrossAmount') AS GrossAmount, JSON_VALUE(Hre_Profile.value, '$.TCTN') AS TCTN, JSON_VALUE(Hre_Profile.value, '$.EHS') AS EHS, JSON_VALUE(Hre_Profile.value, '$.PCCC') AS PCCC, JSON_VALUE(Hre_Profile.value, '$.TotalWorkingMonth') AS TotalWorkingMonth, JSON_VALUE(Hre_Profile.value, '$.ServiceYear') AS ServiceYear, JSON_VALUE(Hre_Profile.value, '$.ServiceMonth') AS ServiceMonth, JSON_VALUE(Hre_Profile.value, '$.ServiceDate') AS ServiceDate FROM Hre_Profile;

**