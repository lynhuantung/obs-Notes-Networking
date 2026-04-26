---
type: concept
tags:
  - hrm
  - modules
  - phan-he
  - fit-hrm
related:
  - "[[TungLy/wiki/projects/VnPay-Project|VnPay-Project]]"
  - "[[TungLy/wiki/projects/TrungDong-Project|TrungDong-Project]]"
  - "[[TungLy/wiki/projects/HongNgoc-Project|HongNgoc-Project]]"
date-updated: 2026-04-25
---
# HRM Modules — Các Phân Hệ FIT-HRM
## Tổng quan

FIT-HRM bao gồm 6 phân hệ chính. Mỗi dự án triển khai có thể chọn subset tùy nhu cầu khách hàng.

## Danh sách phân hệ

### 1. Nhân Sự (HR Core)
- Quản lý hồ sơ nhân viên
- Hợp đồng lao động
- Cơ cấu tổ chức (org chart)
- Onboarding / Offboarding

### 2. Lương (Payroll)
- Tính lương theo ca, bậc, hệ số
- Công thức lương linh hoạt
- Phụ cấp, khấu trừ
- Kết xuất báo cáo lương
- **Đang dùng tại**: [[wiki/projects/TrungDong-Project]]

### 3. Bảo Hiểm (Insurance)
- Bảo hiểm xã hội (BHXH)
- Bảo hiểm y tế (BHYT)
- Bảo hiểm thất nghiệp (BHTN)
- Khai báo cơ quan bảo hiểm

### 4. Chấm Công (Attendance / Timekeeping)
- Quản lý ca làm việc
- Tích hợp máy chấm công
- Xử lý ngoại lệ (đi muộn, về sớm, OT)
- Tổng hợp công

### 5. Đánh Giá (Performance Evaluation)
- Thiết lập KPI / tiêu chí đánh giá
- Chu kỳ đánh giá (360°, trực tiếp)
- Kết quả đánh giá → link với lương, thăng tiến
- **Đang dùng tại**: [[wiki/projects/TrungDong-Project]], [[wiki/projects/HongNgoc-Project]]

### 6. Nhân Tài (Talent Management)
- Lập kế hoạch đào tạo
- Quản lý năng lực (competency)
- Succession planning
- Career path

## Patterns theo loại doanh nghiệp

| Loại doanh nghiệp | Phân hệ thường triển khai |
|------------------|--------------------------|
| Sản xuất | Nhân sự + Lương + Chấm công + Bảo hiểm |
| Tài chính / Fintech | Nhân sự + Lương + Đánh giá |
| Y tế | Nhân sự + Đánh giá |
| Dịch vụ | Toàn bộ 6 phân hệ |

## Common Issues

*(Cần ingest thêm lessons learned để điền vào đây)*
