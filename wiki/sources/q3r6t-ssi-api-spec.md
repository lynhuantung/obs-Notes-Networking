---
type: source
code: q3r6t
description: "Đặc tả 24 API endpoints HRM cho SSI: 14 GET lấy dữ liệu + 10 POST/PUT cập nhật, bao gồm org, nhân viên, lương, công, KPI, tuyển dụng"
tags:
  - ssi
  - api
  - integration
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
source-file: "raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/023_6.1.1 ... 050_6.3.10"
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]"
---

# Source: SSI — API Spec (Chương 6)

## Tóm tắt

Chương 6 hồ sơ thầu SSI mô tả đặc tả API tích hợp hai chiều giữa VnResource HRM và hệ thống nội bộ SSI. Gồm 3 phần: yêu cầu chung về API (6.1), các API GET lấy dữ liệu từ HRM (6.2 — 14 endpoints), và các API POST/PUT cập nhật dữ liệu vào HRM (6.3 — 10 endpoints). Mọi API đều yêu cầu API Key quản lý tập trung, bảo mật OAuth2/TLS, và tài liệu Swagger.

## Key Takeaways

- **Quản lý API Key**: Generate/sửa/xóa tập trung, phân quyền theo Scope/IP Whitelist/Rate Limiting
- **Chuẩn API**: OpenAPI/Swagger, OAuth2, TLS, response time < ngưỡng định nghĩa
- **14 GET APIs**: lấy dữ liệu từ HRM sang hệ thống SSI (org, nhân viên, lương, công, phép...)
- **10 POST/PUT APIs**: SSI đẩy dữ liệu vào HRM (nghỉ phép, thông tin cá nhân, kết quả HQCV, đề xuất tuyển dụng...)
- **Phiếu lương mã hóa** (6.2.7): API trả về dữ liệu có mã hóa thông tin lương
- **ESOP** (6.2.13): API lấy thông tin ESOP khi nhân viên thôi việc — cần xác nhận module tồn tại

## Yêu cầu chung API (6.1)

| Mục | Yêu cầu |
|-----|---------|
| 6.1.1 | Quản lý API Key: Generate/sửa/xóa, IP Whitelist, Rate Limiting, theo dõi tích hợp real-time |
| 6.1.2 | Bảo mật: OAuth2, mã hóa dữ liệu, xác thực; tuân thủ OWASP API Security |
| 6.1.3 | Hiệu suất cao: response time nhanh, xử lý tải lớn |
| 6.1.4 | Tài liệu chi tiết: Swagger/OpenAPI, hướng dẫn tích hợp |

## GET APIs — Lấy dữ liệu từ HRM (6.2)

| # | Mã | Endpoint | Mô tả |
|---|-----|----------|-------|
| 1 | 6.2.1 | `GET /api/Profile/GetOrgStructure` | Cơ cấu tổ chức phân cấp (phòng ban, công ty, chi nhánh) |
| 2 | 6.2.1 | `GET /api/Profile/headcount-summary` | Thống kê nhân sự toàn cây tổ chức |
| 3 | 6.2.1 | `/api/Hre_Profile/GetHeadOrgStructure` | Người quản lý đơn vị |
| 4 | 6.2.2 | `GET /api/Profile/GetProfiles` | Thông tin nhân viên theo mã/username/toàn bộ |
| 5 | 6.2.3 | API ứng viên | Thông tin ứng viên theo mã/username/toàn bộ |
| 6 | 6.2.4 | API chức danh | Danh sách chức danh/cấp bậc/vị trí |
| 7 | 6.2.5 | API bảng công | Bảng công theo ngày (từ–đến), mã NV/username/phòng ban |
| 8 | 6.2.6 | API chi phí lương | Chi phí lương, các khoản trích, cấu phần BH |
| 9 | 6.2.7 | API phiếu lương | Phiếu lương theo kỳ, mã NV/username — **có mã hóa thông tin** |
| 10 | 6.2.8 | API cấu hình ca | Cấu hình công/ca/holiday |
| 11 | 6.2.9 | API loại nghỉ | Cấu hình danh sách loại nghỉ phép/chế độ/công tác |
| 12 | 6.2.10 | API danh sách nghỉ | Danh sách nghỉ phép/công tác/OT theo công ty/đơn vị/NV |
| 13 | 6.2.11 | API quỹ phép | Quỹ phép còn lại cho nghỉ phép/chế độ |
| 14 | 6.2.12 | API quyết toán thôi việc | Các chi phí chi trả khi nhân sự thôi việc |
| 15 | 6.2.13 | API ESOP | ESOP của nhân sự khi thôi việc, QĐ/phiếu chuyển nhượng |
| 16 | 6.2.14 | API hạn mức tuyển dụng | Hạn mức tuyển dụng còn lại theo công ty/phòng ban/vị trí |

## POST/PUT APIs — Cập nhật dữ liệu vào HRM (6.3)

| # | Mã | Mô tả |
|---|-----|-------|
| 1 | 6.3.1 | Cập nhật thông tin nghỉ phép cho nhân viên |
| 2 | 6.3.2 | Cập nhật thông tin cá nhân nhân viên (theo mã/username) |
| 3 | 6.3.3 | Cập nhật ủy quyền quyết toán thuế cho công ty |
| 4 | 6.3.4 | Cập nhật kết quả đánh giá HQCV (theo mã NV/username/phòng ban) |
| 5 | 6.3.5 | Nhận kết quả đánh giá HQCV từ SSI |
| 6 | 6.3.6 | Nhận kết quả học tập/giảng dạy (danh sách khóa học hoàn thành) |
| 7 | 6.3.7 | Nhận kết quả các đợt thi độc lập (điểm tổng hợp kỳ thi, phân bậc) |
| 8 | 6.3.8 | Nhận kết quả hoàn thành KPI Đào tạo (số giờ học/giảng đã hoàn thành) |
| 9 | 6.3.9 | Cập nhật đề xuất tuyển dụng sang HRM (vị trí, số lượng) |
| 10 | 6.3.10 | Sẵn sàng tích hợp API nội bộ SSI để xuất chứng từ kế toán |

## Trích dẫn quan trọng

> Hệ thống đáp ứng đầy đủ và toàn diện yêu cầu của hồ sơ thầu. Với giao diện quản lý API Key tập trung hỗ trợ Generate, Sửa, Xóa kết hợp cơ chế phân quyền chi tiết theo Scope/IP Whitelist/Rate Limiting và hệ thống giám sát tích hợp theo thời gian thực, chúng tôi cam kết đảm bảo mọi kết nối API với hệ thống của SSI đều được kiểm soát an toàn, minh bạch và có thể truy vết đầy đủ.

> API được chuẩn hóa theo OpenAPI/Swagger giúp dễ dàng tích hợp với hệ thống bên ngoài.

## Liên kết

- [[wiki/projects/SSI-Project]] — Project page
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Hồ sơ thầu tổng thể
- [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] — Integration Architecture diagram
- [[wiki/flows/r5n8q-flow-integration-thirdparty]] — Luồng third-party gọi HRM API (pattern tương tự)
