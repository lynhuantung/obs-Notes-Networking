---
Mã:
aliases:
date: 2026-01-06
tags:
  - daily
  - "#build-version"
  - build-history
Project: "[[Dự án VnPay]]"
Liên kết:
  - https://docs.google.com/spreadsheets/d/1FHIagUNgkw-BGuXyYkdzsHm8ZqT_uw82jf9ctIvSR6U/edit?gid=717690034#gid=717690034
---

## 📦 LỊCH SỬ CẬP NHẬT BUILD HỆ THỐNG HRM – VNPAY
![[Pasted image 20260106084331.png]]

### 🔹 VNPAY_v80.0.0 – 05/01/2026

Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Fix lỗi hiển thị sai lũy kế OT.
    
- Fix lỗi trang quản lý hồ sơ nhân sự (tab cá nhân) không load được khi dữ liệu trên 50 dòng.
    

---

### 🔹 VNPAY_v79.0.3 – 02/01/2026

Cập nhật service: HRM.Service.Chat.Fe.  
Nội dung:

- Fix lỗi chưa đồng bộ user.
    

---

### 🔹 VNPAY_v79.0.1 – 29/12/2025

Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Fix lỗi tổng hợp công.
    

---

### 🔹 VNPAY_v79.0.0 – 28/12/2025

Triển khai trên môi trường UAT và Production.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Kaizen và cải thiện các API dashboard.
    

---

### 🔹 VNPAY_v78.0.0 – 26/12/2025

Triển khai trên UAT và Production.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Tự động clear cache calendar khi thực hiện tổng hợp công.
    
- Kaizen các API dashboard.
    

---

### 🔹 VNPAY_v77.0.0 – 25/12/2025

Triển khai trên môi trường UAT.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Cải thiện performance các API dashboard.
    
- Tối ưu luồng đọc Redis cache (`Sys_AllSetting`, `getLang` portal).
    

---

### 🔹 VNPAY_v75.0.0 – 23/12/2025

Triển khai trên UAT và Production.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Cải thiện hiệu năng dashboard.
    
- Fix lỗi Portal V2.
    
- Tối ưu hiệu năng đọc cache Redis `Sys_AllSetting`.
    

---

### 🔹 VNPAY_v74.0.0 – 23/12/2025

Triển khai trên UAT và Production.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Cải thiện performance các API dashboard.
    

---

### 🔹 VNPAY_v73.0.0 – 22/12/2025

Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Cải thiện performance các API dashboard (TestPermissionWithSignature, GetCutOffDurationByProfile, GetConfigConfirmPasswordPayslip).
    
- Fix lỗi chuông thông báo chat.
    

---

### 🔹 VNPAY_v72.0.0 – 20/12/2025 (triển khai 22/12/2025)

Triển khai trên UAT và Production.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore, Chat.Api, Chat.Fe.  
Nội dung:

- Nâng cấp và hoàn thiện tính năng chat.
    
- Bổ sung tính năng hiển thị version của các service trên Web Main.
    

---

### 🔹 VNPAY_v71.0.1 – 19/12/2025

Cập nhật service: EmpPortalCore.  
Nội dung:

- Bổ sung tính năng hiển thị version portal.
    

---

### 🔹 VNPAY_v71.0.0 – 18/12/2025 (triển khai 19/12/2025)

Triển khai trên UAT và Production.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Cải thiện tốc độ load dashboard portal.
    

---

### 🔹 VNPAY_v70.0.0 – 18/12/2025

Triển khai trên UAT và Production.  
Cập nhật các service: Hr.ServiceCore, Chat.Fe.  
Nội dung:

- Thay logo VNPAY.
    
- Fix xử lý phân tích kế hoạch tăng ca.
    

---

### 🔹 VNPAY_v69.0.0 – 17/12/2025 (triển khai 18/12/2025)

Triển khai trên UAT và Production.  
Cập nhật các service: MainCore, EmpPortalCore, Hr.ServiceCore, HrmSystem.ServiceCore, Identity, ApiCore.  
Nội dung:

- Fix lỗi SignalR.
    
- Bổ sung ghi log request cho Identity.  
    Ghi chú:
    
- Thêm cấu hình `"ModeProfilerLog": "ALL"` trong `appsettings.json`.
    
