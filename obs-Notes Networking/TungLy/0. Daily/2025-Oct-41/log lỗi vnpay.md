---
Mã: 25104107-01
aliases:
date: 2025-10-07
time: 08:36
Week: "41"
tags:
  - daily
  - vnpay
---

## 📊 **PHÂN TÍCH CHI TIẾT CÁC LỖI LEVEL: ERROR**

Dựa trên phân tích log, tôi đã xác định được các vấn đề chính và mức độ nghiêm trọng:

### 🔴 **1. LỖI NGHIÊM TRỌNG NHẤT - Stored Procedure `hrm_hre_sp_get_ProfileWorkListPortalV3`**

**📈 Thống kê lỗi:**
- **Tổng số lỗi:** 19 lần trong 1 giờ
- **Tần suất:** Khoảng 3-4 lần mỗi 10 phút
- **Người dùng bị ảnh hưởng:** 12 user khác nhau

**🔍 Chi tiết lỗi:**
```
System.ArgumentNullException: Value cannot be null. (Parameter 'source')
StoreName: exec hrm_hre_sp_get_ProfileWorkListPortalV3
Status: Error, Lỗi trong câu truy vấn
```

**👥 Danh sách user bị ảnh hưởng:**
1. `quyendtt@vnpay.vn` - 10:20:53
2. `duongpt1@vnpay.vn` - 10:20:52  
3. `datpq@vnpay.vn` - 10:20:49
4. `cuongnt@vnpay.vn` - 10:20:47
5. `linhnd2@vnpay.vn` - 10:20:47
6. `hoann@vnpay.vn` - 10:20:44
7. `anhnd13@vnpay.vn` - 10:20:41
8. `vilt@vnpay.vn` - 10:20:39
9. `antm@vnpay.vn` - 10:20:36
10. `dungttk@vnpay.vn` - 10:20:35
11. `longnt6@vnpay.vn` - 10:19:00

### 🔴 **2. LỖI CẤU HÌNH LOG4NET - SQLite Database**

**📈 Thống kê lỗi:**
- **Tổng số lỗi:** 6 lần
- **Thời gian:** 10:19:42, 10:19:58, 10:20:29

**🔍 Chi tiết lỗi:**
```
System.ArgumentException: Data Source cannot be empty. Use :memory: to open an in-memory database
log4net:ERROR [SqliteAppender] ErrorCode: GenericFailure. 
Could not open database connection []. 
Connection string context [Unable to resolve connection string from ConnectionString, ConnectionStrings, or AppSettings.].
```

### 🔴 **3. LỖI FILE PERMISSION**

**📈 Thống kê lỗi:**
- **Tổng số lỗi:** 4 lần
- **Vấn đề:** Không có quyền ghi file

**🔍 Chi tiết lỗi:**
```
log4net:ERROR [CustomRollingFileAppender] ErrorCode: GenericFailure. 
Unable to acquire lock on file /app/. Access to the path '/app/' is denied.
```

### 🔴 **4. LỖI BUSINESS LOGIC - System.Exception: NULL**

**📈 Thống kê lỗi:**
- **Tổng số lỗi:** 49 lần trong main log
- **Tổng số lỗi:** 49 lần trong system log
- **Tần suất:** Rất cao, liên tục

## 🎯 **KHUYẾN NGHỊ KHẮC PHỤC THEO ĐỘ ƯU TIÊN**

### **🚨 ƯU TIÊN CAO NHẤT - Stored Procedure**

**Nguyên nhân:** Parameter `source` bị null khi gọi stored procedure `hrm_hre_sp_get_ProfileWorkListPortalV3`

**Giải pháp:**
1. **Kiểm tra validation đầu vào** trong `BaseService.ActionData`
2. **Thêm null check** trước khi gọi stored procedure
3. **Xem xét cấu hình parameter mặc định** cho stored procedure
4. **Kiểm tra business logic** của chức năng Profile Work List Portal

### **🚨 ƯU TIÊN CAO - SQLite Configuration**

**Giải pháp:**
1. **Cấu hình connection string** trong `appsettings.json`:
```json
{
  "ConnectionStrings": {
    "Log4netConnection": "Data Source=/app/logs/log4net.db;Version=3;"
  }
}
```

2. **Kiểm tra log4net.config** có đúng connection string không

### **🚨 ƯU TIÊN TRUNG BÌNH - File Permission**

**Giải pháp:**
1. **Cấp quyền ghi** cho thư mục `/app/`
2. **Kiểm tra Docker container** có đúng user permission không
3. **Cấu hình lại log path** nếu cần thiết

### **📊 TÁC ĐỘNG NGHIỆP VỤ**

- **12 user bị ảnh hưởng** không thể truy cập Profile Work List Portal
- **Chức năng HRM core** bị gián đoạn
- **Log system** không hoạt động đúng cách

Bạn có muốn tôi đi sâu vào phân tích bất kỳ vấn đề nào không?