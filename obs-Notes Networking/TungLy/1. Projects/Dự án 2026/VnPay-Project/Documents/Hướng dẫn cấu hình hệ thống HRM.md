---
Mã: 
aliases: 
date: 2025-06-19
tags:
  - "#cau-hinh"
Project: "[[Dự án VnPay]]"
Liên kết:
---

# 📘 HƯỚNG DẪN TRIỂN KHAI HỆ THỐNG HRM VNPay

## 1. Thành phần đã upload lên S3

|Loại|Tên file|Ghi chú|
|---|---|---|
|**Database**|`HRMPRO12_VNPAY_20250423.rar`|File backup CSDL|
|**File cấu hình**|`IIS-DB-VnPay-config.rar`|Gồm cấu hình IIS, DB, Redis, URL các service|
|**Source HRM**|`VNPAY_v8.12.46.01.19.rar`|Mã nguồn hệ thống HRM|

---

## 2. Các bước triển khai

### 🧱 Bước 1: Khôi phục CSDL

1. Giải nén `HRMPRO12_VNPAY_20250423.rar`.
    
2. Restore database bằng SQL Server:

### ⚙️ Bước 2: Cấu hình Source HRM

1. Giải nén `VNPAY_v8.12.46.01.19.rar` vào `D:\VNPAY_HRM`.
    
2. Mở các file cấu hình trong source:  
        
    - `websettings.json` (ASP.NET Core)
    - `appsettings.json` (ASP.NET Core)
        
3. Thực hiện cấu hình theo nội dung bên dưới.


---

## 3. Hướng dẫn cấu hình hệ thống HRM

### 3.1. 🔗 Cấu hình đường dẫn (URL) các service

Thay thế các URL có sẵn bằng địa chỉ domain thực tế do khách hàng cung cấp:

|Service|URL mặc định|URL khách hàng|
|---|---|---|
|Main Web|`https://tl-main.vnrlocal.com:6501/`|`{URL_MAIN_WEB}`|
|Employee Portal|`https://tl-portal.vnrlocal.com:6502/`|`{URL_PORTAL}`|
|HR Service|`https://tl-hr.vnrlocal.com:6503/`|`{URL_HR_SERVICE}`|
|System Service|`https://tl-sys.vnrlocal.com:6504/`|`{URL_SYS_SERVICE}`|
|API Center|`https://tl-api.vnrlocal.com:6505/`|`{URL_API_CENTER}`|
|API Integration|`https://tl-api.vnrlocal.com:6506/`|`{URL_API_INTEGRATION}`|

👉 **Vị trí chỉnh sửa**:

- `WebSettings.json` hoặc `appsettings.json`
     

---

### 3.2. 💾 Cấu hình kết nối Database

**Connection string mặc định**:

```text
Data Source=103.127.207.231,2968;Initial Catalog=HRMPRO12_VNPAY;User ID=sa;Password=...;TrustServerCertificate=True;Persist Security Info=True
```

**Cần thay bằng**:

```text
{CONNECTION_STRING_KHACH_HANG}
```

👉 **Vị trí chỉnh sửa**:

- `WebSettings.json` → `<connectionStrings>`
    
- `appsettings.json` → `"ConnectionStrings": { ... }`
    

---

### 3.3. 🚀 Cấu hình Redis Connection

**Redis mặc định**:

```text
127.0.0.1:6380,syncTimeout=60000,connectRetry=3,abortConnect=false,responseTimeout=60000,connectTimeout=10000,allowAdmin=true,password=...
```

**Thay bằng**:

```text
{REDIS_CONNECTION_STRING_KHACH_HANG}
```

👉 **Vị trí chỉnh sửa**:

- `appsettings.json` → `"RedisCache"` hoặc `"Redis"`
    

---

### 3.4. 🔄 Cấu hình Redis cho Background Service

File: `appsettings.json`

Cấu hình ví dụ:

```json
"RedisDBHangFire": {
    "EndPoints": "{REDIS_ENDPOINT_KHACH_HANG}",
    "Password": "{REDIS_PASSWORD_KHACH_HANG}",
    "RedisPrefixKeyName": "RedisDB-HRM10_NetCore-HangFire"
}
```

---

## 4. ⚙️ Cấu hình IIS

1. Giải nén `IIS-DB-VnPay-config.rar`
    
2. Mở IIS Manager > Add Website:
    
    - Site name: `VNPayHRM`
        
    - Path: `D:\VNPAY_HRM`
        
    - Port: `6501`, `6502`, … tương ứng từng module
        
3. Phân quyền thư mục cho `IIS_IUSRS`, `NETWORK SERVICE`
    

---

## 5. 🧪 Kiểm tra hệ thống

- Truy cập: `http://{URL_MAIN_WEB}`
    
- Đăng nhập admin nếu có sẵn
