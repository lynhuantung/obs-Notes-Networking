---
Mã: "25010313-01"
aliases: 
date: "2025-01-13"
time: "15:24"
Week: "03"
tags:
  - daily
---
### Tài liệu hướng dẫn khắc phục vấn đề chậm hệ thống

Dưới đây là các bước chi tiết để khắc phục vấn đề chậm hệ thống thông qua kiểm tra và cấu hình trên IIS và ứng dụng:

---

#### **1. Cấu hình Idle Time-out trong IIS**

- **Vấn đề**:
    - Mặc định, Application Pool trong IIS sẽ tự động dừng sau 20 phút không hoạt động, dẫn đến thời gian khởi động lại lâu khi có yêu cầu mới.
- **Hướng xử lý**:
    - Đặt giá trị **Idle Time-out (minutes)** về `0` để ngăn Application Pool tự động dừng.

**Cách thực hiện:**

1. Mở **IIS Manager**.
2. Điều hướng đến **Application Pools**.
3. Chọn Application Pool cần thay đổi, nhấp chuột phải và chọn **Advanced Settings**.
4. Tìm mục **Idle Time-out (minutes)** và thay đổi giá trị từ `20` thành `0`.
5. Nhấn **OK** để lưu cấu hình.
![[Pasted image 20250113152451.png]]

**Lưu ý:**

- Cấu hình này sẽ giúp Application Pool luôn hoạt động và sẵn sàng xử lý yêu cầu.

---

#### **2. Bỏ check "Regular Time Intervals (in minutes)"**

- **Vấn đề**:
    - IIS có cơ chế tự động tái chế Application Pool định kỳ theo thời gian cố định (mặc định là 1740 phút ~ 29 giờ). Điều này có thể gây gián đoạn tạm thời cho ứng dụng.
- **Hướng xử lý (Link : [Thay đổi cấu hình Recycling của server | VnR Docs](https://docs.vnresource.net/vi/se-docs/Performance/se-docs))**:
    - Bỏ check mục **Regular Time Intervals (in minutes)** để ngăn việc tái chế Application Pool tự động.

**Cách thực hiện:**

1. Mở **IIS Manager**.
2. Chọn Application Pool cần cấu hình, nhấp chuột phải và chọn **Recycling**.
3. Trong cửa sổ **Recycling Conditions**, bỏ check mục **Regular Time Intervals (in minutes)**.
4. Nhấn **Next** và **Finish** để hoàn tất.
![[Pasted image 20250113152517.png]]

**Lưu ý:**

- Sau khi bỏ check, Application Pool sẽ không tự động tái chế định kỳ mà chỉ tái chế dựa trên các điều kiện khác (nếu có cấu hình).

---

#### **3. Cấu hình Logging trong file webSetting.json**

- **Vấn đề**:
    - Hệ thống cần ghi log để theo dõi chi tiết các request từ **HRM.SC.Service.Api**, giúp phân tích và xử lý khi gặp vấn đề.
- **Hướng xử lý**:
    - Thêm hoặc chỉnh sửa cấu hình trong file **webSetting.json** để bật log cho các thành phần cần thiết.

**Cách thực hiện:**

1. Mở file cấu hình **webSetting.json** của ứng dụng (nằm trong thư mục cấu hình chính).    
2. Tìm hoặc thêm mục `LogFolders` với giá trị sau:
    
    ```json
    "LogFolders": "HRM.Presentation.WindowsService\\Log|HRM.SC.Service.Api\\Log"
    ```
![[Pasted image 20250113152633.png]]
3. Lưu file và khởi động lại dịch vụ hoặc ứng dụng để áp dụng cấu hình.
    

### **Tóm tắt**

- **Idle Time-out**: Đặt giá trị về `0` để duy trì Application Pool luôn hoạt động.
- **Regular Time Intervals**: Bỏ check để ngăn việc tái chế Application Pool tự động.
- **Log Request**: Bật logging trong **webSetting.json** để theo dõi các request của  HRM.SC.Service.Api.

