

**Lỗi "-2146233078: The source was not found, but some or all event logs could not be searched."** có thể xuất phát từ nhiều nguyên nhân liên quan đến cấu hình và quyền trên server. Dưới đây là một số nguyên nhân phổ biến từ phía server:

### 1. Quyền hạn không đủ

Tài khoản đang chạy ứng dụng không có đủ quyền để tạo hoặc ghi vào Windows Event Log. Điều này thường xảy ra nếu tài khoản không có quyền quản trị hoặc không được cấu hình đúng.

### 2. Nguồn log sự kiện chưa được tạo

Nguồn log sự kiện mà ứng dụng của bạn đang cố ghi vào chưa được tạo. Trong một số trường hợp, việc tạo nguồn log sự kiện yêu cầu quyền quản trị.

### 3. Event Log bị khóa hoặc không thể truy cập

Một số log sự kiện như Security hoặc State có thể bị khóa và yêu cầu quyền đặc biệt để truy cập. Tài khoản của bạn có thể không có quyền truy cập vào các log này.

### 4. Cấu hình Event Log bị lỗi hoặc không chính xác

Cấu hình của Windows Event Log trên server có thể bị lỗi hoặc không chính xác, dẫn đến việc không thể tạo hoặc ghi vào nguồn log sự kiện.

### 5. Dung lượng log bị đầy

Windows Event Log có dung lượng giới hạn. Nếu log đã đầy và không được cấu hình để ghi đè các mục cũ, bạn sẽ không thể ghi thêm vào log.

### 6. Hệ thống bảo mật hoặc phần mềm chống virus

Một số phần mềm bảo mật hoặc chống virus có thể chặn quyền truy cập vào Windows Event Log.


### Cách khắc phục:

#### Xác định tài khoản người dùng IIS

Đảm bảo tài khoản ứng dụng của bạn có đủ quyền:

1. **Xác định tài khoản IIS đang sử dụng**:
    
    - Mở IIS Manager.
    - Chọn Application Pool mà ứng dụng của bạn đang sử dụng.
    - Kiểm tra cột "Identity" để xác định tài khoản mà Application Pool đang chạy.
2. **Cấp quyền cho tài khoản IIS**:
    
    - **Sử dụng Group Policy**:
        1. Mở Group Policy Editor (`gpedit.msc`) với quyền Administrator.
        2. Điều hướng tới `Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment`.
        3. Thêm tài khoản `IIS_IUSRS` hoặc tài khoản cụ thể được IIS sử dụng vào danh sách `Manage auditing and security log`.
    - **Sử dụng PowerShell**:
        
        powershell
        
        Sao chép mã
        
        `$account = "IIS APPPOOL\YourAppPoolName" # Thay thế YourAppPoolName bằng tên Application Pool của bạn $sid = (New-Object System.Security.Principal.NTAccount($account)).Translate([System.Security.Principal.SecurityIdentifier]) $sidString = $sid.Value $acl = Get-Acl -Path "HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Security" $accessRule = New-Object System.Security.AccessControl.RegistryAccessRule ($sidString, "ReadKey", "Allow") $acl.SetAccessRule($accessRule) Set-Acl -Path "HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Security" -AclObject $acl`
        

#### Tạo nguồn log sự kiện thủ công:

1. Mở PowerShell với quyền Administrator.
2. Chạy lệnh:
    
    powershell
    
    Sao chép mã
    
    `New-EventLog -LogName Application -Source "YourSourceName"`
    

#### Kiểm tra và cấu hình dung lượng log:

1. Mở Event Viewer (`eventvwr.msc`).
2. Chuột phải vào log (ví dụ: Application) -> Properties.
3. Kiểm tra dung lượng và cấu hình để ghi đè các mục cũ nếu cần thiết.