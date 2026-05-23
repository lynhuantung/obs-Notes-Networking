---
aliases: 
date: 2024-10-31
tags:
  - "#datawarehouse"
Link: "[[raw/archive/Area/Data-WareHouse 1/ELT - Airbyte/DataWareHouse]]"
---
**

### https://chatgpt.com/c/671f7764-5d38-8011-90d3-077e8aa73add

### Má»™t sá»‘ LÆ°u Ã½ khi XÃ¢y dá»±ng Data Warehouse

- ### Fact Table: Chá»©a dá»¯ liá»‡u giao dá»‹ch, vÃ­ dá»¥ nhÆ° báº£ng Fact_Attendance, Fact_Leave, Fact_Overtime lÃ  nÆ¡i chá»©a thÃ´ng tin chi tiáº¿t vá» cháº¥m cÃ´ng, nghá»‰ phÃ©p, lÃ m thÃªm.
    
- ### Dimension Table: Chá»©a thÃ´ng tin tham chiáº¿u, nhÆ° Dim_Employee, Dim_Department, Dim_LeaveType giÃºp bá»• sung thÃ´ng tin chi tiáº¿t cho báº£ng fact.
    
- ### Star Schema: CÃ³ thá»ƒ thiáº¿t káº¿ theo mÃ´ hÃ¬nh Star Schema Ä‘á»ƒ dá»… dÃ ng truy váº¥n vÃ  phÃ¢n tÃ­ch dá»¯ liá»‡u.
    

  

### 1. Báº£ng Dim_Employee (ThÃ´ng tin nhÃ¢n viÃªn)

- EmployeeID (INT, KhÃ³a chÃ­nh): MÃ£ nhÃ¢n viÃªn
    
- EmployeeCode (VARCHAR, duy nháº¥t): MÃ£ nhÃ¢n viÃªn (MÃ£ riÃªng do doanh nghiá»‡p sá»­ dá»¥ng)
    
- FullName (VARCHAR): Há» vÃ  tÃªn
    
- DepartmentID (INT, KhÃ³a ngoáº¡i): MÃ£ phÃ²ng ban
    
- JobTitleID (INT, KhÃ³a ngoáº¡i): MÃ£ chá»©c vá»¥
    
- EducationLevelID (INT, KhÃ³a ngoáº¡i): MÃ£ trÃ¬nh Ä‘á»™ há»c váº¥n
    
- HireDate (DATE): NgÃ y tuyá»ƒn dá»¥ng
    
- TerminationDate (DATE, NULLABLE): NgÃ y káº¿t thÃºc há»£p Ä‘á»“ng (náº¿u cÃ³)
    
- Status (VARCHAR): TÃ¬nh tráº¡ng lÃ m viá»‡c (Active/Inactive)
    

### 2. Báº£ng Dim_Department (PhÃ²ng ban)

- DepartmentID (INT, KhÃ³a chÃ­nh): MÃ£ phÃ²ng ban
    
- DepartmentName (VARCHAR): TÃªn phÃ²ng ban
    
- ManagerID (INT, KhÃ³a ngoáº¡i, NULLABLE): MÃ£ nhÃ¢n viÃªn quáº£n lÃ½
    
- Status (VARCHAR): TÃ¬nh tráº¡ng (Hoáº¡t Ä‘á»™ng/ÄÃ³ng)
    
- EffectiveDate (DATE): NgÃ y báº¯t Ä‘áº§u cÃ³ hiá»‡u lá»±c
    

### 3. Báº£ng Fact_Attendance (Báº£ng cháº¥m cÃ´ng)

- AttendanceID (INT, KhÃ³a chÃ­nh): MÃ£ cháº¥m cÃ´ng
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- Date (DATE): NgÃ y cháº¥m cÃ´ng
    
- ShiftID (INT, KhÃ³a ngoáº¡i): MÃ£ ca lÃ m viá»‡c
    
- CheckInTime (TIME): Giá» vÃ o
    
- CheckOutTime (TIME): Giá» ra
    
- WorkHours (DECIMAL): Sá»‘ giá» lÃ m viá»‡c
    
- OvertimeHours (DECIMAL): Sá»‘ giá» lÃ m thÃªm
    
- AttendanceStatus (VARCHAR): TÃ¬nh tráº¡ng cháº¥m cÃ´ng (VÃ­ dá»¥: Ä‘i trá»…, váº¯ng máº·t, Ä‘i lÃ m)
    

### 4. Báº£ng Dim_Shift (Ca lÃ m viá»‡c)

- ShiftID (INT, KhÃ³a chÃ­nh): MÃ£ ca lÃ m viá»‡c
    
- ShiftName (VARCHAR): TÃªn ca lÃ m viá»‡c (VÃ­ dá»¥: Ca sÃ¡ng, Ca chiá»u)
    
- StartTime (TIME): Giá» báº¯t Ä‘áº§u
    
- EndTime (TIME): Giá» káº¿t thÃºc
    
- BreakTime (DECIMAL): Thá»i gian nghá»‰ giá»¯a ca
    

### 5. Báº£ng Fact_Leave (Báº£ng xin phÃ©p nghá»‰)

- LeaveID (INT, KhÃ³a chÃ­nh): MÃ£ nghá»‰ phÃ©p
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- LeaveTypeID (INT, KhÃ³a ngoáº¡i): MÃ£ loáº¡i nghá»‰
    
- StartDate (DATE): NgÃ y báº¯t Ä‘áº§u nghá»‰
    
- EndDate (DATE): NgÃ y káº¿t thÃºc nghá»‰
    
- LeaveDays (DECIMAL): Sá»‘ ngÃ y nghá»‰
    
- LeaveStatus (VARCHAR): TÃ¬nh tráº¡ng nghá»‰ phÃ©p (PhÃª duyá»‡t/ChÆ°a phÃª duyá»‡t)
    

### 6. Báº£ng Dim_LeaveType (Loáº¡i nghá»‰ phÃ©p)

- LeaveTypeID (INT, KhÃ³a chÃ­nh): MÃ£ loáº¡i nghá»‰
    
- LeaveTypeName (VARCHAR): TÃªn loáº¡i nghá»‰ (VÃ­ dá»¥: Nghá»‰ phÃ©p nÄƒm, nghá»‰ bá»‡nh, nghá»‰ khÃ´ng lÆ°Æ¡ng)
    
- MaxLeaveDays (DECIMAL): Sá»‘ ngÃ y nghá»‰ tá»‘i Ä‘a
    

### 7. Báº£ng Fact_Overtime (Báº£ng lÃ m thÃªm giá»)

- OvertimeID (INT, KhÃ³a chÃ­nh): MÃ£ lÃ m thÃªm
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- Date (DATE): NgÃ y lÃ m thÃªm
    
- OvertimeHours (DECIMAL): Sá»‘ giá» lÃ m thÃªm
    
- OvertimeReason (VARCHAR): LÃ½ do lÃ m thÃªm
    
- ApprovalStatus (VARCHAR): TÃ¬nh tráº¡ng phÃª duyá»‡t (PhÃª duyá»‡t/ChÆ°a phÃª duyá»‡t)
    

### 8. Báº£ng Fact_WorkSchedule (Lá»‹ch lÃ m viá»‡c)

- WorkScheduleID (INT, KhÃ³a chÃ­nh): MÃ£ lá»‹ch lÃ m viá»‡c
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- Date (DATE): NgÃ y lÃ m viá»‡c
    
- ShiftID (INT, KhÃ³a ngoáº¡i): MÃ£ ca lÃ m viá»‡c
    
- AssignedBy (INT, KhÃ³a ngoáº¡i, NULLABLE): NhÃ¢n viÃªn phÃ¢n cÃ´ng
    

### 9. Báº£ng Fact_Contract (Quáº£n lÃ½ nhÃ¢n viÃªn há»£p Ä‘á»“ng)

- ContractID (INT, KhÃ³a chÃ­nh): MÃ£ há»£p Ä‘á»“ng
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- ContractType (VARCHAR): Loáº¡i há»£p Ä‘á»“ng (VÃ­ dá»¥: Thá»i vá»¥, ChÃ­nh thá»©c)
    
- StartDate (DATE): NgÃ y báº¯t Ä‘áº§u há»£p Ä‘á»“ng
    
- EndDate (DATE, NULLABLE): NgÃ y káº¿t thÃºc há»£p Ä‘á»“ng (náº¿u cÃ³)
    
- Salary (DECIMAL): Má»©c lÆ°Æ¡ng
    
- ContractStatus (VARCHAR): TÃ¬nh tráº¡ng há»£p Ä‘á»“ng (CÃ³ hiá»‡u lá»±c/Háº¿t hiá»‡u lá»±c)
    

### 10. Báº£ng Fact_CareerProgress (QuÃ¡ trÃ¬nh cÃ´ng tÃ¡c)

- CareerProgressID (INT, KhÃ³a chÃ­nh): MÃ£ quÃ¡ trÃ¬nh cÃ´ng tÃ¡c
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- DepartmentID (INT, KhÃ³a ngoáº¡i): MÃ£ phÃ²ng ban
    
- JobTitleID (INT, KhÃ³a ngoáº¡i): MÃ£ chá»©c vá»¥
    
- EducationLevelID (INT, KhÃ³a ngoáº¡i): MÃ£ trÃ¬nh Ä‘á»™ há»c váº¥n
    
- StartDate (DATE): NgÃ y báº¯t Ä‘áº§u vá»‹ trÃ­
    
- EndDate (DATE, NULLABLE): NgÃ y káº¿t thÃºc vá»‹ trÃ­ (náº¿u cÃ³)
    
- ReasonForChange (VARCHAR): LÃ½ do thay Ä‘á»•i (VÃ­ dá»¥: ThÄƒng chá»©c, Chuyá»ƒn bá»™ pháº­n)
    

### 11. Báº£ng Dim_JobTitle (Chá»©c vá»¥)

- JobTitleID (INT, KhÃ³a chÃ­nh): MÃ£ chá»©c vá»¥
    
- JobTitleName (VARCHAR): TÃªn chá»©c vá»¥ (VÃ­ dá»¥: NhÃ¢n viÃªn, TrÆ°á»Ÿng phÃ²ng, GiÃ¡m Ä‘á»‘c)
    
- JobLevel (VARCHAR): Cáº¥p báº­c (VÃ­ dá»¥: NhÃ¢n viÃªn, Quáº£n lÃ½, LÃ£nh Ä‘áº¡o)
    
- EffectiveDate (DATE): NgÃ y báº¯t Ä‘áº§u cÃ³ hiá»‡u lá»±c
    

### 12. Báº£ng Dim_EducationLevel (TrÃ¬nh Ä‘á»™ há»c váº¥n)

- EducationLevelID (INT, KhÃ³a chÃ­nh): MÃ£ trÃ¬nh Ä‘á»™ há»c váº¥n
    
- EducationLevelName (VARCHAR): TÃªn trÃ¬nh Ä‘á»™ há»c váº¥n (VÃ­ dá»¥: Trung cáº¥p, Cao Ä‘áº³ng, Äáº¡i há»c, Tháº¡c sÄ©)
    
- Specialization (VARCHAR, NULLABLE): ChuyÃªn ngÃ nh há»c (VÃ­ dá»¥: CÃ´ng nghá»‡ thÃ´ng tin, Quáº£n trá»‹ kinh doanh)
    

### 13. Báº£ng Fact_Salary (ThÃ´ng tin lÆ°Æ¡ng)

- SalaryID (INT, KhÃ³a chÃ­nh): MÃ£ lÆ°Æ¡ng
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- PayPeriod (DATE): Ká»³ tráº£ lÆ°Æ¡ng (VÃ­ dá»¥: ThÃ¡ng, QuÃ½)
    
- BaseSalary (DECIMAL): LÆ°Æ¡ng cÆ¡ báº£n
    
- OvertimeAmount (DECIMAL): Sá»‘ tiá»n lÃ m thÃªm giá»
    
- Bonus (DECIMAL): ThÆ°á»Ÿng
    
- Deductions (DECIMAL): CÃ¡c khoáº£n kháº¥u trá»« (VÃ­ dá»¥: Báº£o hiá»ƒm, Thuáº¿)
    
- NetSalary (DECIMAL): LÆ°Æ¡ng thá»±c lÄ©nh
    

### 14. Báº£ng Dim_BonusType (Loáº¡i thÆ°á»Ÿng)

- BonusTypeID (INT, KhÃ³a chÃ­nh): MÃ£ loáº¡i thÆ°á»Ÿng
    
- BonusTypeName (VARCHAR): TÃªn loáº¡i thÆ°á»Ÿng (VÃ­ dá»¥: ThÆ°á»Ÿng hiá»‡u suáº¥t, ThÆ°á»Ÿng dá»± Ã¡n)
    
- Description (VARCHAR, NULLABLE): MÃ´ táº£ chi tiáº¿t vá» loáº¡i thÆ°á»Ÿng
    

### 15. Báº£ng Fact_Bonus (Chi tiáº¿t thÆ°á»Ÿng)

- BonusID (INT, KhÃ³a chÃ­nh): MÃ£ thÆ°á»Ÿng
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- BonusTypeID (INT, KhÃ³a ngoáº¡i): MÃ£ loáº¡i thÆ°á»Ÿng
    
- DateAwarded (DATE): NgÃ y Ä‘Æ°á»£c thÆ°á»Ÿng
    
- Amount (DECIMAL): Sá»‘ tiá»n thÆ°á»Ÿng
    

### 16. Báº£ng Fact_MonthlySalary (LÆ°Æ¡ng thÃ¡ng)

- MonthlySalaryID (INT, KhÃ³a chÃ­nh): MÃ£ lÆ°Æ¡ng thÃ¡ng
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- Month (DATE): ThÃ¡ng tÃ­nh lÆ°Æ¡ng
    
- BaseSalary (DECIMAL): LÆ°Æ¡ng cÆ¡ báº£n
    
- OvertimeAmount (DECIMAL): Tiá»n lÃ m thÃªm giá»
    
- BonusAmount (DECIMAL): Sá»‘ tiá»n thÆ°á»Ÿng
    
- DeductionAmount (DECIMAL): CÃ¡c khoáº£n kháº¥u trá»«
    
- NetSalary (DECIMAL): LÆ°Æ¡ng thá»±c nháº­n
    
- ApprovalStatus (VARCHAR): TÃ¬nh tráº¡ng phÃª duyá»‡t (PhÃª duyá»‡t/ChÆ°a phÃª duyá»‡t)
    

### 17. Báº£ng Fact_MonthlyAttendance (CÃ´ng thÃ¡ng)

- MonthlyAttendanceID (INT, KhÃ³a chÃ­nh): MÃ£ cÃ´ng thÃ¡ng
    
- EmployeeID (INT, KhÃ³a ngoáº¡i): MÃ£ nhÃ¢n viÃªn
    
- Month (DATE): ThÃ¡ng cháº¥m cÃ´ng
    
- TotalWorkDays (DECIMAL): Tá»•ng sá»‘ ngÃ y lÃ m viá»‡c
    
- TotalLeaveDays (DECIMAL): Tá»•ng sá»‘ ngÃ y nghá»‰
    
- TotalOvertimeHours (DECIMAL): Tá»•ng sá»‘ giá» lÃ m thÃªm
    
- TotalWorkHours (DECIMAL): Tá»•ng sá»‘ giá» lÃ m viá»‡c
    

  

### Script táº¡o báº£ng dá»¯ liá»‡u

-- Táº¡o báº£ng Dim_Employee (ThÃ´ng tin nhÃ¢n viÃªn)

CREATE TABLE Dim_Employee (

Â Â Â Â EmployeeID INT PRIMARY KEY,

Â Â Â Â EmployeeCode VARCHAR(50) UNIQUE,

Â Â Â Â FullName VARCHAR(100),

Â Â Â Â DepartmentID INT,

Â Â Â Â JobTitleID INT,

Â Â Â Â EducationLevelID INT,

Â Â Â Â HireDate DATE,

Â Â Â Â TerminationDate DATE NULL,

Â Â Â Â Status VARCHAR(50)

);

  

-- Táº¡o báº£ng Dim_Department (PhÃ²ng ban)

CREATE TABLE Dim_Department (

Â Â Â Â DepartmentID INT PRIMARY KEY,

Â Â Â Â DepartmentName VARCHAR(100),

Â Â Â Â ManagerID INT NULL,

Â Â Â Â Status VARCHAR(50),

Â Â Â Â EffectiveDate DATE

);

  

-- Táº¡o báº£ng Fact_Attendance (Báº£ng cháº¥m cÃ´ng)

CREATE TABLE Fact_Attendance (

Â Â Â Â AttendanceID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â Date DATE,

Â Â Â Â ShiftID INT,

Â Â Â Â CheckInTime TIME,

Â Â Â Â CheckOutTime TIME,

Â Â Â Â WorkHours DECIMAL(10, 2),

Â Â Â Â OvertimeHours DECIMAL(10, 2),

Â Â Â Â AttendanceStatus VARCHAR(50)

);

  

-- Táº¡o báº£ng Dim_Shift (Ca lÃ m viá»‡c)

CREATE TABLE Dim_Shift (

Â Â Â Â ShiftID INT PRIMARY KEY,

Â Â Â Â ShiftName VARCHAR(50),

Â Â Â Â StartTime TIME,

Â Â Â Â EndTime TIME,

Â Â Â Â BreakTime DECIMAL(10, 2)

);

  

-- Táº¡o báº£ng Fact_Leave (Báº£ng xin phÃ©p nghá»‰)

CREATE TABLE Fact_Leave (

Â Â Â Â LeaveID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â LeaveTypeID INT,

Â Â Â Â StartDate DATE,

Â Â Â Â EndDate DATE,

Â Â Â Â LeaveDays DECIMAL(10, 2),

Â Â Â Â LeaveStatus VARCHAR(50)

);

  

-- Táº¡o báº£ng Dim_LeaveType (Loáº¡i nghá»‰ phÃ©p)

CREATE TABLE Dim_LeaveType (

Â Â Â Â LeaveTypeID INT PRIMARY KEY,

Â Â Â Â LeaveTypeName VARCHAR(50),

Â Â Â Â MaxLeaveDays DECIMAL(10, 2)

);

  

-- Táº¡o báº£ng Fact_Overtime (Báº£ng lÃ m thÃªm giá»)

CREATE TABLE Fact_Overtime (

Â Â Â Â OvertimeID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â Date DATE,

Â Â Â Â OvertimeHours DECIMAL(10, 2),

Â Â Â Â OvertimeReason VARCHAR(255),

Â Â Â Â ApprovalStatus VARCHAR(50)

);

  

-- Táº¡o báº£ng Fact_WorkSchedule (Lá»‹ch lÃ m viá»‡c)

CREATE TABLE Fact_WorkSchedule (

Â Â Â Â WorkScheduleID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â Date DATE,

Â Â Â Â ShiftID INT,

Â Â Â Â AssignedBy INT NULL

);

  

-- Táº¡o báº£ng Fact_Contract (Quáº£n lÃ½ nhÃ¢n viÃªn há»£p Ä‘á»“ng)

CREATE TABLE Fact_Contract (

Â Â Â Â ContractID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â ContractType VARCHAR(50),

Â Â Â Â StartDate DATE,

Â Â Â Â EndDate DATE NULL,

Â Â Â Â Salary DECIMAL(15, 2),

Â Â Â Â ContractStatus VARCHAR(50)

);

  

-- Táº¡o báº£ng Fact_CareerProgress (QuÃ¡ trÃ¬nh cÃ´ng tÃ¡c)

CREATE TABLE Fact_CareerProgress (

Â Â Â Â CareerProgressID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â DepartmentID INT,

Â Â Â Â JobTitleID INT,

Â Â Â Â EducationLevelID INT,

Â Â Â Â StartDate DATE,

Â Â Â Â EndDate DATE NULL,

Â Â Â Â ReasonForChange VARCHAR(255)

);

  

-- Táº¡o báº£ng Dim_JobTitle (Chá»©c vá»¥)

CREATE TABLE Dim_JobTitle (

Â Â Â Â JobTitleID INT PRIMARY KEY,

Â Â Â Â JobTitleName VARCHAR(100),

Â Â Â Â JobLevel VARCHAR(50),

Â Â Â Â EffectiveDate DATE

);

  

-- Táº¡o báº£ng Dim_EducationLevel (TrÃ¬nh Ä‘á»™ há»c váº¥n)

CREATE TABLE Dim_EducationLevel (

Â Â Â Â EducationLevelID INT PRIMARY KEY,

Â Â Â Â EducationLevelName VARCHAR(100),

Â Â Â Â Specialization VARCHAR(255) NULL

);

  

-- Táº¡o báº£ng Fact_Salary (ThÃ´ng tin lÆ°Æ¡ng)

CREATE TABLE Fact_Salary (

Â Â Â Â SalaryID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â PayPeriod DATE,

Â Â Â Â BaseSalary DECIMAL(15, 2),

Â Â Â Â OvertimeAmount DECIMAL(15, 2),

Â Â Â Â Bonus DECIMAL(15, 2),

Â Â Â Â Deductions DECIMAL(15, 2),

Â Â Â Â NetSalary DECIMAL(15, 2)

);

  

-- Táº¡o báº£ng Dim_BonusType (Loáº¡i thÆ°á»Ÿng)

CREATE TABLE Dim_BonusType (

Â Â Â Â BonusTypeID INT PRIMARY KEY,

Â Â Â Â BonusTypeName VARCHAR(100),

Â Â Â Â Description VARCHAR(255) NULL

);

  

-- Táº¡o báº£ng Fact_Bonus (Chi tiáº¿t thÆ°á»Ÿng)

CREATE TABLE Fact_Bonus (

Â Â Â Â BonusID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â BonusTypeID INT,

Â Â Â Â DateAwarded DATE,

Â Â Â Â Amount DECIMAL(15, 2)

);

  

-- Táº¡o báº£ng Fact_MonthlySalary (LÆ°Æ¡ng thÃ¡ng)

CREATE TABLE Fact_MonthlySalary (

Â Â Â Â MonthlySalaryID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â Month DATE,

Â Â Â Â BaseSalary DECIMAL(15, 2),

Â Â Â Â OvertimeAmount DECIMAL(15, 2),

Â Â Â Â BonusAmount DECIMAL(15, 2),

Â Â Â Â DeductionAmount DECIMAL(15, 2),

Â Â Â Â NetSalary DECIMAL(15, 2),

Â Â Â Â ApprovalStatus VARCHAR(50)

);

  

-- Táº¡o báº£ng Fact_MonthlyAttendance (CÃ´ng thÃ¡ng)

CREATE TABLE Fact_MonthlyAttendance (

Â Â Â Â MonthlyAttendanceID INT PRIMARY KEY,

Â Â Â Â EmployeeID INT,

Â Â Â Â Month DATE,

Â Â Â Â TotalWorkDays DECIMAL(10, 2),

Â Â Â Â TotalLeaveDays DECIMAL(10, 2),

Â Â Â Â TotalOvertimeHours DECIMAL(10, 2),

Â Â Â Â TotalWorkHours DECIMAL(10, 2)

);

  

### 1. ThÃ´ng tin cÆ¡ báº£n vá» tá»• chá»©c

- Khá»‘i/ÄÆ¡n vá»‹ (DivisionName): VARCHAR
    

- TÃªn khá»‘i hoáº·c Ä‘Æ¡n vá»‹ trong cÃ´ng ty mÃ  nhÃ¢n viÃªn thuá»™c vá». Khá»‘i/ÄÆ¡n vá»‹ lÃ  cáº¥p quáº£n lÃ½ cao nháº¥t, chia cÃ¡c bá»™ pháº­n thÃ nh tá»«ng khá»‘i lá»›n, vÃ­ dá»¥: "Khá»‘i Kinh doanh", "Khá»‘i TÃ i chÃ­nh".
    

- PhÃ²ng ban (DepartmentName): VARCHAR
    

- TÃªn phÃ²ng ban thuá»™c khá»‘i/Ä‘Æ¡n vá»‹. Má»—i khá»‘i thÆ°á»ng sáº½ cÃ³ nhiá»u phÃ²ng ban Ä‘á»ƒ thá»±c hiá»‡n cÃ¡c chá»©c nÄƒng khÃ¡c nhau, vÃ­ dá»¥: "PhÃ²ng Marketing", "PhÃ²ng Káº¿ toÃ¡n".
    

- Bá»™ pháº­n (SectionName): VARCHAR
    

- TÃªn bá»™ pháº­n thuá»™c phÃ²ng ban, thá»ƒ hiá»‡n cÃ¡c Ä‘Æ¡n vá»‹ nhá» hÆ¡n phÃ²ng ban vÃ  cÃ³ trÃ¡ch nhiá»‡m cá»¥ thá»ƒ, vÃ­ dá»¥: "Bá»™ pháº­n SÃ¡ng táº¡o", "Bá»™ pháº­n Thanh toÃ¡n".
    

- NhÃ³m (UnitName): VARCHAR
    

- TÃªn nhÃ³m thuá»™c bá»™ pháº­n, thÆ°á»ng lÃ  cÃ¡c nhÃ³m nhá» lÃ m viá»‡c trá»±c tiáº¿p Ä‘á»ƒ thá»±c hiá»‡n dá»± Ã¡n hoáº·c nhiá»‡m vá»¥ cá»¥ thá»ƒ, vÃ­ dá»¥: "NhÃ³m Thiáº¿t káº¿ website", "NhÃ³m Káº¿ toÃ¡n cÃ´ng ná»£".
    

### 2. ThÃ´ng tin nhÃ¢n sá»±

- Loáº¡i nhÃ¢n viÃªn (EmploymentType): VARCHAR
    

- Loáº¡i há»£p Ä‘á»“ng lao Ä‘á»™ng cá»§a nhÃ¢n viÃªn, vÃ­ dá»¥ nhÆ° "ToÃ n thá»i gian", "BÃ¡n thá»i gian", "Thá»­ viá»‡c". TrÆ°á»ng nÃ y giÃºp phÃ¢n loáº¡i loáº¡i hÃ¬nh lao Ä‘á»™ng vÃ  chÃ­nh sÃ¡ch lÆ°Æ¡ng thÆ°á»Ÿng.
    

- NÆ¡i lÃ m viá»‡c (WorkPlaceName): VARCHAR
    

- Äá»‹a Ä‘iá»ƒm lÃ m viá»‡c cá»§a nhÃ¢n viÃªn, cÃ³ thá»ƒ lÃ  tÃªn vÄƒn phÃ²ng hoáº·c chi nhÃ¡nh cÃ´ng ty, vÃ­ dá»¥: "Chi nhÃ¡nh HÃ  Ná»™i", "Trá»¥ sá»Ÿ chÃ­nh".
    

- CÃ´ng ty (CompanyName): VARCHAR
    

- TÃªn cÃ´ng ty hoáº·c chi nhÃ¡nh nÆ¡i nhÃ¢n viÃªn Ä‘ang lÃ m viá»‡c, giÃºp xÃ¡c Ä‘á»‹nh cÃ´ng ty máº¹ hoáº·c cÃ´ng ty con trong táº­p Ä‘oÃ n.
    

- Chá»©c vá»¥ (PositionName): VARCHAR
    

- Vá»‹ trÃ­ cÃ´ng tÃ¡c cá»¥ thá»ƒ mÃ  nhÃ¢n viÃªn Ä‘áº£m nhiá»‡m, vÃ­ dá»¥: "TrÆ°á»Ÿng phÃ²ng", "NhÃ¢n viÃªn".
    

- Chá»©c danh (JobTitleName): VARCHAR
    

- TÃªn chá»©c danh cá»§a nhÃ¢n viÃªn, thá»ƒ hiá»‡n trÃ¡ch nhiá»‡m nghá» nghiá»‡p, vÃ­ dá»¥: "ChuyÃªn viÃªn tÃ i chÃ­nh", "NhÃ¢n viÃªn phÃ¡t triá»ƒn pháº§n má»m".
    

### 3. ThÃ´ng tin cÃ¡ nhÃ¢n

- NgÃ y vÃ o lÃ m (DateHire): DATE
    

- NgÃ y thÃ¡ng nÄƒm nhÃ¢n viÃªn báº¯t Ä‘áº§u lÃ m viá»‡c táº¡i cÃ´ng ty. ThÃ´ng tin nÃ y quan trá»ng Ä‘á»ƒ tÃ­nh toÃ¡n thÃ¢m niÃªn vÃ  quyá»n lá»£i liÃªn quan.
    

- NgÃ y káº¿t thÃºc thá»­ viá»‡c (DateEndProbation): DATE
    

- NgÃ y káº¿t thÃºc giai Ä‘oáº¡n thá»­ viá»‡c cá»§a nhÃ¢n viÃªn. Sau thá»i Ä‘iá»ƒm nÃ y, há»£p Ä‘á»“ng lao Ä‘á»™ng chÃ­nh thá»©c sáº½ Ä‘Æ°á»£c kÃ½ káº¿t.
    

- NgÃ y sinh (DateOfBirth): DATE
    

- NgÃ y thÃ¡ng nÄƒm sinh cá»§a nhÃ¢n viÃªn, giÃºp xÃ¡c Ä‘á»‹nh tuá»•i, quyá»n lá»£i báº£o hiá»ƒm vÃ  cÃ¡c chÃ­nh sÃ¡ch liÃªn quan Ä‘áº¿n Ä‘á»™ tuá»•i.
    

- Tuá»•i (EmpYearsOld): INT
    

- Tuá»•i hiá»‡n táº¡i cá»§a nhÃ¢n viÃªn, tÃ­nh tá»« ngÃ y sinh. ThÃ´ng tin nÃ y cÃ³ thá»ƒ tá»± Ä‘á»™ng tÃ­nh toÃ¡n dá»±a trÃªn DateOfBirth.
    

- NÆ¡i sinh (PlaceOfBirth): VARCHAR
    

- Äá»‹a Ä‘iá»ƒm nÆ¡i nhÃ¢n viÃªn sinh ra, giÃºp hoÃ n thiá»‡n há»“ sÆ¡ nhÃ¢n viÃªn.
    

- Giá»›i tÃ­nh (Gender): VARCHAR
    

- Giá»›i tÃ­nh cá»§a nhÃ¢n viÃªn, vÃ­ dá»¥: "Nam", "Ná»¯", "KhÃ¡c". ThÃ´ng tin nÃ y cáº§n thiáº¿t cho cÃ¡c chÃ­nh sÃ¡ch nhÃ¢n sá»± vÃ  báº£o hiá»ƒm.
    

### 4. ThÃ´ng tin giáº¥y tá» cÃ¡ nhÃ¢n

- Sá»‘ CCCD (IDCard): VARCHAR
    

- Sá»‘ cÄƒn cÆ°á»›c cÃ´ng dÃ¢n cá»§a nhÃ¢n viÃªn, giÃºp nháº­n diá»‡n danh tÃ­nh vÃ  xÃ¡c nháº­n thÃ´ng tin cÃ¡ nhÃ¢n.
    

- NgÃ y cáº¥p CCCD (IDCardDateOfIssue): DATE
    

- NgÃ y cáº¥p cÄƒn cÆ°á»›c cÃ´ng dÃ¢n, Ä‘á»ƒ biáº¿t thá»i Ä‘iá»ƒm giáº¥y tá» Ä‘Æ°á»£c cáº¥p.
    

- NÆ¡i cáº¥p CCCD (IDCardPlaceOfIssue): VARCHAR
    

- NÆ¡i cáº¥p cÄƒn cÆ°á»›c cÃ´ng dÃ¢n, thÆ°á»ng lÃ  tÃªn cÆ¡ quan cÃ´ng an.
    

- Sá»‘ há»™ chiáº¿u (PassportNo): VARCHAR
    

- Sá»‘ há»™ chiáº¿u cá»§a nhÃ¢n viÃªn, dÃ nh cho cÃ¡c nhÃ¢n viÃªn cÃ³ nhu cáº§u Ä‘i cÃ´ng tÃ¡c quá»‘c táº¿.
    

- NgÃ y cáº¥p há»™ chiáº¿u (PassportDateOfIssue): DATE
    

- NgÃ y cáº¥p há»™ chiáº¿u cá»§a nhÃ¢n viÃªn.
    

- NgÃ y háº¿t háº¡n há»™ chiáº¿u (PassportDateOfExpiry): DATE
    

- NgÃ y mÃ  há»™ chiáº¿u háº¿t hiá»‡u lá»±c. ThÃ´ng tin nÃ y giÃºp nhÃ¢n viÃªn biáº¿t khi nÃ o cáº§n gia háº¡n.
    

- NÆ¡i cáº¥p há»™ chiáº¿u (PassportPlaceOfIssue): VARCHAR
    

- NÆ¡i cáº¥p há»™ chiáº¿u, giÃºp xÃ¡c Ä‘á»‹nh cÆ¡ quan hoáº·c quá»‘c gia cáº¥p há»™ chiáº¿u.
    

### 5. ThÃ´ng tin bá»• sung

- DÃ¢n tá»™c (EthnicGroupName): VARCHAR
    

- DÃ¢n tá»™c cá»§a nhÃ¢n viÃªn, thÃ´ng tin nÃ y Ä‘Æ°á»£c sá»­ dá»¥ng cho má»¥c Ä‘Ã­ch thá»‘ng kÃª vÃ  chÃ­nh sÃ¡ch Ä‘a dáº¡ng.
    

- TÃ´n giÃ¡o (ReligionName): VARCHAR
    

- TÃ´n giÃ¡o mÃ  nhÃ¢n viÃªn theo, há»— trá»£ cho cÃ¡c chÃ­nh sÃ¡ch tÃ´n giÃ¡o vÃ  vÄƒn hÃ³a táº¡i cÃ´ng ty.
    

- Äá»‹a chá»‰ thÆ°á»ng trÃº (P_Address): VARCHAR
    

- Äá»‹a chá»‰ thÆ°á»ng trÃº, lÃ  nÆ¡i á»Ÿ cá»‘ Ä‘á»‹nh Ä‘Ã£ Ä‘Äƒng kÃ½ cá»§a nhÃ¢n viÃªn.
    

- Äá»‹a chá»‰ táº¡m trÃº (T_Address): VARCHAR
    

- Äá»‹a chá»‰ táº¡m trÃº, nÆ¡i nhÃ¢n viÃªn Ä‘ang sinh sá»‘ng trong thá»i gian lÃ m viá»‡c.
    

- TrÃ¬nh Ä‘á»™ vÄƒn hÃ³a (TrinhDoVanHoa): VARCHAR
    

- TrÃ¬nh Ä‘á»™ há»c váº¥n cá»§a nhÃ¢n viÃªn, vÃ­ dá»¥: "Trung há»c phá»• thÃ´ng", "Äáº¡i há»c", giÃºp Ä‘Ã¡nh giÃ¡ nÄƒng lá»±c vÃ  yÃªu cáº§u Ä‘Ã o táº¡o.
    

### 6. LiÃªn há»‡

- Sá»‘ Ä‘iá»‡n thoáº¡i (Cellphone): VARCHAR
    

- Sá»‘ Ä‘iá»‡n thoáº¡i di Ä‘á»™ng cá»§a nhÃ¢n viÃªn, Ä‘á»ƒ liÃªn láº¡c khi cáº§n thiáº¿t.
    

- Email cÃ´ng ty (Email): VARCHAR
    

- Äá»‹a chá»‰ email cÃ´ng ty cáº¥p cho nhÃ¢n viÃªn, dÃ¹ng Ä‘á»ƒ trao Ä‘á»•i cÃ´ng viá»‡c ná»™i bá»™.
    

- Email cÃ¡ nhÃ¢n (Email2): VARCHAR
    

- Äá»‹a chá»‰ email cÃ¡ nhÃ¢n cá»§a nhÃ¢n viÃªn, dÃ¹ng Ä‘á»ƒ liÃªn láº¡c trong trÆ°á»ng há»£p cáº§n thiáº¿t ngoÃ i cÃ´ng viá»‡c.
    

### 7. ThÃ´ng tin lÆ°Æ¡ng vÃ  phá»¥ cáº¥p

- LÆ°Æ¡ng cÆ¡ báº£n (GrossAmount): DECIMAL
    

- Má»©c lÆ°Æ¡ng cÆ¡ báº£n mÃ  nhÃ¢n viÃªn nháº­n Ä‘Æ°á»£c hÃ ng thÃ¡ng, chÆ°a bao gá»“m cÃ¡c khoáº£n phá»¥ cáº¥p hay thÆ°á»Ÿng.
    

- Phá»¥ cáº¥p 1 (TCTN): DECIMAL
    

- ThÃ´ng tin vá» phá»¥ cáº¥p loáº¡i 1, cÃ³ thá»ƒ lÃ  phá»¥ cáº¥p trÃ¡ch nhiá»‡m hoáº·c há»— trá»£ cÃ´ng viá»‡c.
    

- Phá»¥ cáº¥p 2 (EHS): DECIMAL
    

- ThÃ´ng tin vá» phá»¥ cáº¥p loáº¡i 2, vÃ­ dá»¥ nhÆ° phá»¥ cáº¥p an toÃ n lao Ä‘á»™ng.
    

- Phá»¥ cáº¥p 3 (PCCC): DECIMAL
    

- ThÃ´ng tin vá» phá»¥ cáº¥p loáº¡i 3, nhÆ° phá»¥ cáº¥p phÃ²ng chÃ¡y chá»¯a chÃ¡y.
    

### 8. ThÃ¢m niÃªn vÃ  kinh nghiá»‡m lÃ m viá»‡c

- Tá»•ng sá»‘ thÃ¡ng lÃ m viá»‡c (TotalWorkingMonth): INT
    

- Tá»•ng sá»‘ thÃ¡ng mÃ  nhÃ¢n viÃªn Ä‘Ã£ lÃ m viá»‡c táº¡i cÃ´ng ty, bao gá»“m cáº£ thá»i gian thá»­ viá»‡c.
    

- Sá»‘ nÄƒm thÃ¢m niÃªn (ServiceYear): INT
    

- Sá»‘ nÄƒm lÃ m viá»‡c chÃ­nh thá»©c, khÃ´ng bao gá»“m thá»i gian thá»­ viá»‡c hoáº·c lÃ m viá»‡c bÃ¡n thá»i gian.
    

- Sá»‘ ngÃ y thÃ¢m niÃªn (ServiceMonth): INT
    

- Sá»‘ ngÃ y thÃ¢m niÃªn, Ä‘á»ƒ Ä‘Ã¡nh giÃ¡ thá»i gian lÃ m viá»‡c chi tiáº¿t hÆ¡n.
    

- NgÃ y báº¯t Ä‘áº§u thÃ¢m niÃªn (ServiceDate): DATE
    

- NgÃ y báº¯t Ä‘áº§u Ä‘Æ°á»£c tÃ­nh thÃ¢m niÃªn, dÃ¹ng Ä‘á»ƒ xÃ¡c Ä‘á»‹nh cÃ¡c quyá»n lá»£i liÃªn quan Ä‘áº¿n thÃ¢m niÃªn, nhÆ° thÆ°á»Ÿng hay cháº¿ Ä‘á»™ nghá»‰ phÃ©p.
    

SELECT JSON_VALUE(Hre_Profile.value, '$.DivisionName') AS DivisionName, JSON_VALUE(Hre_Profile.value, '$.DepartmentName') AS DepartmentName, JSON_VALUE(Hre_Profile.value, '$.SectionName') AS SectionName, JSON_VALUE(Hre_Profile.value, '$.UnitName') AS UnitName, JSON_VALUE(Hre_Profile.value, '$.EmploymentType') AS EmploymentType, JSON_VALUE(Hre_Profile.value, '$.WorkPlaceName') AS WorkPlaceName, JSON_VALUE(Hre_Profile.value, '$.CompanyName') AS CompanyName, JSON_VALUE(Hre_Profile.value, '$.PositionName') AS PositionName, JSON_VALUE(Hre_Profile.value, '$.JobTitleName') AS JobTitleName, JSON_VALUE(Hre_Profile.value, '$.DateHire') AS DateHire, JSON_VALUE(Hre_Profile.value, '$.DateEndProbation') AS DateEndProbation, JSON_VALUE(Hre_Profile.value, '$.DateOfBirth') AS DateOfBirth, JSON_VALUE(Hre_Profile.value, '$.EmpYearsOld') AS EmpYearsOld, JSON_VALUE(Hre_Profile.value, '$.PlaceOfBirth') AS PlaceOfBirth, JSON_VALUE(Hre_Profile.value, '$.Gender') AS Gender, JSON_VALUE(Hre_Profile.value, '$.IDCard') AS IDCard, JSON_VALUE(Hre_Profile.value, '$.IDCardDateOfIssue') AS IDCardDateOfIssue, JSON_VALUE(Hre_Profile.value, '$.IDCardPlaceOfIssue') AS IDCardPlaceOfIssue, JSON_VALUE(Hre_Profile.value, '$.PassportNo') AS PassportNo, JSON_VALUE(Hre_Profile.value, '$.PassportDateOfIssue') AS PassportDateOfIssue, JSON_VALUE(Hre_Profile.value, '$.PassportDateOfExpiry') AS PassportDateOfExpiry, JSON_VALUE(Hre_Profile.value, '$.PassportPlaceOfIssue') AS PassportPlaceOfIssue, JSON_VALUE(Hre_Profile.value, '$.EthnicGroupName') AS EthnicGroupName, JSON_VALUE(Hre_Profile.value, '$.ReligionName') AS ReligionName, JSON_VALUE(Hre_Profile.value, '$.P_Address') AS P_Address, JSON_VALUE(Hre_Profile.value, '$.T_Address') AS T_Address, JSON_VALUE(Hre_Profile.value, '$.TrinhDoVanHoa') AS TrinhDoVanHoa, JSON_VALUE(Hre_Profile.value, '$.Cellphone') AS Cellphone, JSON_VALUE(Hre_Profile.value, '$.Email') AS Email, JSON_VALUE(Hre_Profile.value, '$.Email2') AS Email2, JSON_VALUE(Hre_Profile.value, '$.GrossAmount') AS GrossAmount, JSON_VALUE(Hre_Profile.value, '$.TCTN') AS TCTN, JSON_VALUE(Hre_Profile.value, '$.EHS') AS EHS, JSON_VALUE(Hre_Profile.value, '$.PCCC') AS PCCC, JSON_VALUE(Hre_Profile.value, '$.TotalWorkingMonth') AS TotalWorkingMonth, JSON_VALUE(Hre_Profile.value, '$.ServiceYear') AS ServiceYear, JSON_VALUE(Hre_Profile.value, '$.ServiceMonth') AS ServiceMonth, JSON_VALUE(Hre_Profile.value, '$.ServiceDate') AS ServiceDate FROM Hre_Profile;

**
