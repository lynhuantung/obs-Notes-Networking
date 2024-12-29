---
aliases: 
date: 2024-09-09
tags:
  - daily
---
Để phân quyền cho một user không phải là user `sa` trong SQL Server nhưng vẫn có quyền thực hiện các thao tác như `Create/Drop Table`, `Create/Drop Procedure`, và chạy được CLR (Common Language Runtime), bạn cần thực hiện các bước sau:

![[Pasted image 20240909161923.png]]

### Bước 1: Tạo User và Map Đúng Database
1. Mở SQL Server Management Studio (SSMS).
2. Tạo một **Login** mới (hoặc sử dụng Login hiện có):
   - Vào **Security** > **Logins** > Nhấn chuột phải và chọn **New Login**.
   - Đặt tên cho Login (trong trường hợp này là `hrm`).
   - Dưới phần **Server Roles**, chọn **public** .
   
3. Map Login với database cụ thể:
   - Trong phần **User Mapping**, chọn database mà bạn muốn phân quyền (ví dụ: database `demo`).
   - Đặt user default schema là `dbo` .

### Bước 2: Phân Quyền Cho User
Trong phần **Database Role Membership** của database được map (ví dụ: `demo`), bạn cần chọn các role để cấp quyền phù hợp cho `hrm`:
- **db_owner**: Cho phép user thực hiện tất cả các hành động trên database, bao gồm tạo và xóa bảng, thủ tục lưu trữ. 
- **public**: Mặc định được chọn, cung cấp quyền cơ bản cho người dùng.

### Bước 3: Kiểm Tra Quyền Hạn
Sau khi đã cấp quyền, bạn có thể kiểm tra lại bằng cách chạy các lệnh tương ứng để xem liệu user `hrm` có thể thực hiện các thao tác mong muốn hay không:

**Giải mã lương:**
```sql
print 'CLR'
select dbo.VnrDecrypt('omBa3usCtFGyHiY6e+OaArs4lyBAY6nMRgYrMycU5Vw=')
```

**DROP TABLE:**
```sql
go
print 'DROP TABLE'
DROP TABLE IF EXISTS Employees;
```

**Create TABLE:**
```sql

go
print 'Create table'
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(18, 2)
);
```

- **Alter table:**
```sql
go
print 'Alter table'
ALTER TABLE Employees
	ADD Department NVARCHAR(50);
```

- **DROP PROCEDURE:**
```sql
Go
print 'DROP PROCEDURE'
go
DROP PROCEDURE IF EXISTS AddEmployee;
```

- **CREATE PROCEDURE:**
```sql
go
print 'CREATE PROCEDURE'
go
CREATE PROCEDURE AddEmployee
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @HireDate DATE,
    @Salary DECIMAL(18,2),
    @Department NVARCHAR(50)
AS
BEGIN
    INSERT INTO Employees (FirstName, LastName, HireDate, Salary)
    VALUES (@FirstName, @LastName, @HireDate, @Salary);
END;
```


### Bước 4: Kiểm tra kết quả
Trong phần **Messages** của SQL Server Management Studio (SSMS), có hiển thị thông báo cho thấy các thao tác đã được thực hiện thành công. Các hành động thực hiện bao gồm:
- **DROP TABLE**: Bảng đã bị xóa thành công.
- **Create table**: Tạo bảng thành công.
- **Alter table**: Bảng đã được chỉnh sửa thành công.
- **DROP PROCEDURE**: Thủ tục đã được xóa thành công.
- **CREATE PROCEDURE**: Thủ tục đã được tạo thành công.
![[Pasted image 20240909163742.png]]


