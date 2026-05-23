---
type: source
description: "Biên bản họn với FIT 2024: cấu hình ADFS, mail server và SSO, triển khai module INS cho FIT."
tags:
  - fit
  - adfs
  - ins
  - mail-server
  - sso
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 1.Projects/Index/FIT/H-FIT-SYS-150624.md, 1.Projects/Index/FIT/H-FIT-INS-250624.md
related:
  - "[[wiki/entities/FIT]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
---

# Source: FIT Meetings 2024 (SYS + INS)

## Tóm tắt

2 biên bản họp dự án FIT năm 2024: (1) H-FIT-SYS-150624 về cấu hình mail server theo công ty và SSO ADFS; (2) H-FIT-INS-250624 về chu kỳ BH đặc thù 15-14 và tách thiết lập BH theo chế độ. FIT là dự án nội bộ/pilot triển khai HRM với các yêu cầu đặc thù chưa có ở khách hàng khác.

## Key Takeaways

- **Mail server per company**: HRM hỗ trợ cấu hình SMTP riêng cho từng CompanyID. Hàm gửi mail kiểm tra `CompanyID` → lấy config SMTP tương ứng từ DB → gửi mail đúng domain công ty.
- **SSO ADFS (FIT)**: Key `UsingADFS_Azure: true` → ẩn form username/password trên portal → redirect thẳng sang ADFS endpoint. Phía ADFS trả về claims (UPN, email) → map vào HRM user.
- **Chu kỳ BH 15-14**: Một số cơ quan BHXH tỉnh/thành ngoài HN áp dụng chu kỳ từ ngày 15 tháng trước đến ngày 14 tháng sau. HRM cần tách `InsurancePeriodType` để hỗ trợ cả 2 chu kỳ (1-30 và 15-14).
- **Tách thiết lập BH theo chế độ**: Khi có nhiều chế độ BH trong cùng công ty (ví dụ: nhân viên chính thức vs thời vụ), cần cấu hình riêng biệt thay vì dùng 1 thiết lập chung.
- **Độ phức tạp tích hợp**: FIT là tập hợp các case đặc thù → đóng vai trò test bed cho các tính năng mới trước khi nhân rộng.

## Trích dẫn quan trọng

> **Mail server per company**: Bảng `Sys_CompanyMailConfig` lưu SMTP Host, Port, SSL, Username, Password theo CompanyID. Hàm `SendMail(companyId, ...)` query bảng này trước khi gửi.

> **Chu kỳ 15-14**: D02-TS phải điều chỉnh ngày bắt đầu/kết thúc khi tạo tờ khai cho cơ quan BH dùng chu kỳ 15-14. Ảnh hưởng đến logic `InsuranceMonthJoin` và tổng hợp C70.

> **ADFS claims mapping**: UPN từ ADFS claim → so khớp với `Email` hoặc `LoginName` trong `Sys_User` → nếu không tìm thấy → có thể tự động tạo user mới (cấu hình được).

## Liên kết

- [[wiki/entities/FIT]]
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực tổng quan
- [[wiki/sources/Daily-2024-SSO-Auth]] — Okta OIDC, Azure AD, ADFS patterns
- [[wiki/sources/INS-InsuranceMonthJoin]] — Logic xác định tháng tham gia BH (ảnh hưởng bởi chu kỳ 15-14)
