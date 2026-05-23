---
Mã: 
aliases: 
date: 2025-06-19
tags:
  - "#huong-dan"
Project: "[[Dự án QuickPack]]"
Liên kết:
---
# 🛠️ HƯỚNG DẪN TRIỂN KHAI HỆ THỐNG HRM QuickPack

## 1. Thành phần đã upload lên S3

|Loại|Tên file|Ghi chú|
|---|---|---|
|**Database**|`HRMPRO12_QuickPack_20250423.rar`|File backup CSDL|
|**File cấu hình**|`IIS-DB-QuickPack-config.rar`|Bao gồm cấu hình IIS, DB connection|
|**Source HRM**|`QuickPack_v8.12.46.01.19.rar`|Source code hệ thống HRM|

---

## 2. Các bước triển khai

### 🧱 Bước 1: Khôi phục CSDL

1. Giải nén file `HRMPRO12_QuickPack_20250423.rar`.
    
2. Mở SQL Server Management Studio và tiến hành restore database   


---

### ⚙️ Bước 2: Cấu hình Source HRM

1. Giải nén `QuickPack_v8.12.46.01.19.rar` vào thư mục ví dụ: `D:\QuickPack_HRM`.
    
2. Mở file `Web.config` hoặc `appsettings.json` tùy dự án:
    
    - Cập nhật chuỗi kết nối CSDL.
        
    - Điều chỉnh các key như API endpoint, license key nếu có.
        
3. Cài đặt các gói cần thiết nếu là .NET Core:
    
    ```bash
    dotnet restore
    ```
    

---

### 🌐 Bước 3: Cấu hình IIS

1. Giải nén `IIS-DB-QuickPack-config.rar`.
    
2. Mở `IIS Manager` > Add Website:
    
    - Site name: `QuickPackHRM`
        
    - Physical path: `D:\QuickPack_HRM`
        
    - Binding: Port 8080 hoặc theo yêu cầu.
        
3. Phân quyền folder chạy IIS:
    
    - Gán quyền `IIS_IUSRS` và `NETWORK SERVICE` full control thư mục source.
        

---

### 🧪 Bước 4: Kiểm tra chạy hệ thống

- Truy cập trình duyệt: `http://localhost:8080`
    
- Đăng nhập bằng tài khoản admin mặc định nếu có, ví dụ:
    
    ```
    User: admin
    Pass: Admin@123
    ```
    
- Kiểm tra logs, kết nối DB, file upload.
    

---

## 3. Ghi chú thêm

- Cần cài đặt .NET Framework/.NET Core phù hợp với source.
    
- Nếu có dùng Redis, RabbitMQ, cần cấu hình thêm theo file hướng dẫn đính kèm.
    

---

Bạn muốn thêm phần nào (cấu hình job, cấu hình mail, hướng dẫn deploy cloud)? Mình có thể bổ sung cụ thể.