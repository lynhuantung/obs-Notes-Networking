---
type: glossary
tags:
  - glossary
  - terminology
  - hrm
  - bao-hiem
  - viet-tat
date-updated: 2026-04-26
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
---

# HRM Glossary — Từ Điển Thuật Ngữ & Viết Tắt

> Tra cứu nhanh mọi từ viết tắt và thuật ngữ domain trong hệ sinh thái FIT-HRM.  
> Sắp xếp theo nhóm chủ đề.

---

## Bảo hiểm (Insurance)

| Từ viết tắt | Từ đầy đủ | Giải thích |
|------------|-----------|-----------|
| **BHXH** | Bảo Hiểm Xã Hội | Social Insurance — bắt buộc, NLĐ đóng 8%, NSDLĐ 17.5% |
| **BHYT** | Bảo Hiểm Y Tế | Health Insurance — NLĐ 1.5%, NSDLĐ 3% |
| **BHTN** | Bảo Hiểm Thất Nghiệp | Unemployment Insurance — NLĐ 1%, NSDLĐ 1% |
| **BH** | Bảo Hiểm | Chỉ chung BHXH+BHYT+BHTN |
| **NLĐ** | Người Lao Động | Employee — người làm công ăn lương |
| **NSDLĐ** | Người Sử Dụng Lao Động | Employer — doanh nghiệp, đơn vị |
| **iBHXH** | — | Cổng khai báo BHXH điện tử của BHXH Việt Nam (baohiemxahoi.gov.vn) |
| **D02-TS** | Mẫu D02-TS | Biểu mẫu đăng ký tham gia / điều chỉnh BH — nộp hàng tháng |
| **D03a** | Mẫu D03a | Biểu mẫu hưởng BH: ốm đau, thai sản, tai nạn LĐ |
| **C70** | Bảng tổng hợp C70 | Bảng lương BH tháng: NLĐ + NSDLĐ → đối soát D02 |
| **TS24** | — | Phần mềm kê khai BHXH điện tử (Viettel) — một trong 3 lựa chọn bên cạnh VNPT và iBHXH trực tiếp |

---

## Nhân sự & Lương (HR & Payroll)

| Từ viết tắt | Từ đầy đủ | Giải thích |
|------------|-----------|-----------|
| **HRM** | Human Resource Management | Phần mềm quản lý nhân sự — ở đây chỉ FIT-HRM |
| **FIT-HRM** | — | Tên sản phẩm HRM của VnResource / FIT Solutions |
| **KPI** | Key Performance Indicator | Chỉ số đo lường hiệu suất — dùng trong phân hệ Đánh giá |
| **OT** | Overtime | Làm thêm giờ ngoài giờ hành chính |
| **TNCN** | Thu Nhập Cá Nhân | Thuế Thu Nhập Cá Nhân (PIT — Personal Income Tax) |
| **Gross** | — | Lương trước khi trừ BH, thuế (lương trên hợp đồng) |
| **Net** | — | Lương thực nhận sau khi trừ tất cả |
| **PGD** | Phòng/Ban giao dịch | Đơn vị tổ chức cấp phòng ban |

---

## Dự án & Triển khai (Project)

| Từ viết tắt | Từ đầy đủ | Giải thích |
|------------|-----------|-----------|
| **SE** | Software Engineer | Kỹ sư phần mềm — phía VnResource triển khai |
| **BA** | Business Analyst | Phân tích nghiệp vụ — xác định yêu cầu |
| **QC** | Quality Control | Kiểm soát chất lượng — kiểm thử |
| **PM** | Project Manager | Quản lý dự án — phía VnResource hoặc KH |
| **KH** | Khách hàng | Customer — doanh nghiệp đang triển khai HRM |
| **UAT** | User Acceptance Testing | Kiểm thử nghiệm thu — khách hàng tự test |
| **Go-live** | — | Thời điểm hệ thống đưa vào sử dụng chính thức |
| **Hypercare** | — | Giai đoạn hỗ trợ chuyên sâu sau go-live (2–4 tuần) |
| **GAP** | GAP Analysis | Phân tích khoảng cách giữa yêu cầu KH và tính năng HRM |
| **BLĐ** | Ban Lãnh Đạo | Ban Giám đốc / Hội đồng quản trị phía KH |

---

## Giai đoạn triển khai (Phases)

| Phase | Tên | Nội dung chính |
|-------|-----|---------------|
| Phase 1 | Phân tích & Thiết kế | Kick-off, GAP analysis, xác nhận yêu cầu |
| Phase 2 | Phát triển & Cấu hình | Coding custom, cấu hình hệ thống, import data |
| Phase 3 | Đào tạo | Training key user và end user |
| Phase 4 | UAT | Khách hàng test, fix lỗi, re-test |
| Phase 5 | Go-live | Cutover, go-live, hypercare |

Xem chi tiết: [[wiki/concepts/Project-Phases]]

---

## Kỹ thuật HRM (Technical)

| Thuật ngữ | Giải thích |
|-----------|-----------|
| **CLR** | Common Language Runtime — cho phép chạy .NET code trong SQL Server |
| **VnrDecrypt** | Hàm CLR mã hóa/giải mã mật khẩu (SHA2-512) của VnResource |
| **IIS** | Internet Information Services — web server Windows |
| **App Pool** | Application Pool — môi trường chạy isolated cho từng site IIS |
| **IIS_IUSRS** | Group Windows dùng cho IIS worker process — cần phân quyền thư mục |
| **MAXDOP** | Max Degree of Parallelism — số CPU cores SQL Server dùng song song |
| **TRUSTWORTHY** | SQL Server DB property — cần ON để load CLR UNSAFE assembly |
| **Warmup** | Quá trình "khởi động" service sau restart — load cache, compile JIT |
| **Redis** | In-memory cache database — HRM dùng để cache quyền, warmup status |
| **Kubernetes (K8s)** | Hệ thống orchestration container — VnPay dùng |
| **Traefik** | Reverse proxy / load balancer — routing trong K8s của VnPay |
| **IDS4** | IdentityServer4 — framework OAuth2/OpenID Connect, SSO |
| **JWT** | JSON Web Token — format token xác thực stateless |
| **SSO** | Single Sign-On — đăng nhập 1 lần, dùng được nhiều hệ thống |
| **CORS** | Cross-Origin Resource Sharing — cơ chế bảo mật trình duyệt |
| **AllowOrigin** | Config key trong HRM — cho phép CORS từ domain cụ thể |
| **ConnectString** | Config key — chuỗi kết nối SQL Server |
| **Hrm_APICenter_Web** | Config key — URL API Center, cần để refresh permission cache |

---

## Tên Hệ thống & Sản phẩm

| Tên | Giải thích |
|-----|-----------|
| **FIT-HRM** | Sản phẩm HRM của công ty (VnResource / FIT Solutions) |
| **VnResource** | Tên công ty phát triển / triển khai HRM |
| **MISA** | Phần mềm kế toán — tích hợp với HRM để xuất dữ liệu lương, BH |
| **iBHXH** | Cổng khai báo BHXH điện tử Nhà nước |
| **TS24 / VNPT** | Phần mềm kê khai BHXH thứ 3 (trung gian giữa HRM và iBHXH) |
| **Active Directory (AD)** | Hệ thống quản lý tài khoản Windows — KH lớn thường có |
| **AWS S3** | Amazon Simple Storage Service — HRM dùng lưu artifacts deploy |
| **Event Viewer** | Tool Windows xem logs hệ thống và ứng dụng |
| **SSMS** | SQL Server Management Studio — tool quản lý SQL Server |
| **Log Request** | Tính năng HRM ghi log request HTTP — dùng để debug |

---

## Mã lỗi & Trạng thái

| Mã | Nơi xuất hiện | Ý nghĩa |
|----|--------------|---------|
| **500** | HTTP | Internal Server Error — lỗi code phía server |
| **403** | HTTP | Forbidden — không có quyền truy cập |
| **403.14** | IIS | Directory listing bị tắt + không có default document |
| **404** | HTTP | Not Found — URL không tồn tại |
| **405** | HTTP | Method Not Allowed — sai HTTP method (GET vs POST) |
| **OutOfMemory** | IIS | App Pool hết memory → recycle pool |

---

## Phân hệ HRM (Modules)

| Phân hệ | Tên tiếng Anh | Viết tắt thường dùng |
|---------|--------------|---------------------|
| Nhân sự | HR Core | HR |
| Lương | Payroll | PAY |
| Bảo hiểm | Insurance | INS |
| Chấm công | Attendance / Timekeeping | ATT |
| Đánh giá | Performance Evaluation | EVA |
| Nhân tài | Talent Management | TAL |
| Tuyển dụng | Recruitment | REC |

Xem chi tiết: [[wiki/concepts/HRM-Modules]]

---

## Liên kết liên quan

- [[wiki/concepts/HRM-Modules]] — Tổng quan 6 phân hệ chính
- [[wiki/architecture/HRM-System-Architecture]] — Kiến trúc 13 services
- [[wiki/concepts/Project-Phases]] — Các giai đoạn triển khai
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — Lỗi IIS và mã lỗi
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — Lỗi SQL Server
