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
date-updated: 2026-04-26
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
- Bảo hiểm xã hội (BHXH), y tế (BHYT), thất nghiệp (BHTN)
- Khai báo cơ quan bảo hiểm qua **iBHXH** (cổng điện tử)
- Xuất chứng từ **D02-TS** (tham gia/điều chỉnh), D03a (ốm đau, thai sản)
- Tổng hợp bảng lương **C70** (NLĐ + NSDLĐ đóng BH)
- Tích hợp **MISA** xuất dữ liệu kế toán BH
- **Logic cốt lõi**:
  - `InsuranceMonthJoin` — xác định tháng tham gia BH
  - `InsuranceRecordDayCount` — đếm ngày thực tế đóng BH trong tháng
  - `InsurancePayback` — hoàn trả khi đóng sai/thừa
- **Chế độ hưởng**:
  - Nghỉ ốm: 75% lương đóng BH, tối đa 30–60 ngày/năm → [[wiki/sources/INS-Nghi14Ngay]]
  - Nghỉ thai sản: 100% lương đóng BH, 6 tháng → [[wiki/sources/INS-NghiThaiSan]]
- **Nguyên tắc quan trọng**: nghỉ ốm / thai sản **KHÔNG cắt** bản ghi BH
- **Phân tích lỗi**: [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M + 5 Whys
- **Truy nguyên nhân gốc rễ**: [[wiki/sources/INS-TruyNguyenNhan]] — 4M Kaizen, CAPA matrix, 5 Whys thực chiến
- **So sánh phần mềm kê khai**: [[wiki/sources/INS-VennD02]] — D02-VNPT vs D02-Viettel vs iBHXH (TS24)
- **Nhật ký vấn đề Kaizen #08 (2017)**: [[wiki/sources/INS-Kaizen-08]] — ON-OFF thai sản, timezone bug, 5 Whys D02/C70, kế hoạch giảm bug Pareto
- **Đang dùng tại**: [[wiki/projects/VnPay-Project]]

**Ghi chú nguồn INS (2026-04-26)**:
> Toàn bộ tài liệu phân hệ BH đã được ingest từ thư mục `1. Projects/Nghiệp vụ HRM/INS/`.
> Xem: [[wiki/sources/INS-InsuranceMonthJoin]], [[wiki/sources/INS-InsurancePayback]],
> [[wiki/sources/INS-InsuranceRecordDayCount]], [[wiki/sources/INS-D02-ChungTu]],
> [[wiki/sources/INS-C70-TinhLuong]], [[wiki/sources/INS-iBHXH-Analyze]]

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

- Bảo hiểm: sai tháng tham gia, sai đếm ngày, cắt bản ghi khi nghỉ ốm → xem [[wiki/sources/INS-FishBone-Analysis]]
- Lương: công thức không đồng bộ khi thay đổi chính sách lương giữa kỳ
- Chấm công: lệch timezone khi tích hợp máy chấm công → xem [[wiki/sources/H-VnPay-Att-17042025]]
