---
Mã: 
Path: C:\Code\HRM8-FrontEnd
tags:
  - "#learning"
---
Cấu trúc thư mục @projects - đây là nơi chứa các micro-frontend của hệ thống HRM:

1. **Các Module Nghiệp vụ (Business Modules)**:

- **human-resources/**: Module Quản lý nhân sự
  - Quản lý thông tin nhân viên
  - Quản lý hồ sơ nhân sự
  - Cơ cấu tổ chức

- **attendance/**: Module Chấm công
  - Quản lý ca làm việc
  - Chấm công
  - Quản lý nghỉ phép

- **salary/**: Module Tính lương
  - Tính lương
  - Phụ cấp
  - Báo cáo lương

- **recruitment/**: Module Tuyển dụng
  - Quản lý tin tuyển dụng
  - Quản lý ứng viên
  - Quy trình tuyển dụng

- **insurance/**: Module Bảo hiểm
  - Bảo hiểm xã hội
  - Bảo hiểm y tế
  - Các loại bảo hiểm khác

- **training/**: Module Đào tạo
  - Quản lý khóa học
  - Đào tạo nhân viên
  - Đánh giá sau đào tạo

- **canteen/**: Module Quản lý căn tin
  - Quản lý suất ăn
  - Đặt món
  - Thanh toán

2. **Các Module Hệ thống (System Modules)**:

- **tenant-management/**: Quản lý tenant
  - Quản lý khách hàng doanh nghiệp
  - Cấu hình tenant
  - Phân quyền tenant

- **tenant-portal/**: Portal cho tenant
  - Giao diện người dùng tenant
  - Tùy chỉnh tenant
  - Dashboard tenant

3. **Các Module Shared (Dùng chung)**:

- **shared-core/**: 
  - Core services
  - Utilities
  - Constants
  - Guards
  - Interceptors

- **shared-components/**: 
  - UI components dùng chung
  - Forms
  - Tables
  - Modals

- **shared-module/**: 
  - Các module dùng chung
  - Directives
  - Pipes
  - Validators

- **shared-resources/**: 
  - Assets dùng chung
  - Translations
  - Icons
  - Styles

4. **Cấu trúc điển hình của mỗi module**:
```
module-name/
├── src/
│   ├── app/
│   │   ├── components/
│   │   ├── services/
│   │   ├── models/
│   │   ├── store/
│   │   └── pages/
│   ├── assets/
│   ├── environments/
│   └── styles/
├── webpack.config.js
└── package.json
```

5. **Đặc điểm kiến trúc**:

- **Micro Frontend Architecture**:
  - Mỗi module là một ứng dụng độc lập
  - Có thể phát triển và triển khai riêng biệt
  - Sử dụng Module Federation để tích hợp

- **Shared Resources**:
  - Tối ưu việc tái sử dụng code
  - Đảm bảo consistency giữa các module
  - Giảm duplicate code

- **Độc lập về dữ liệu**:
  - Mỗi module có thể có database riêng
  - Giao tiếp qua API Gateway
  - Có thể scale riêng từng module

Bạn muốn tìm hiểu chi tiết về module nào cụ thể không? Tôi có thể giúp bạn đi sâu vào cấu trúc và cách hoạt động của từng module.
