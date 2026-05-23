---
type: source
code: j5k9w
description: "Yêu cầu bảo mật hồ sơ thầu SSI Chương 9: input validation, output encoding, authentication, session, file, DB, TLS, integration security, BVDLCN, SSDLC"
tags:
  - ssi
  - bao-mat
  - security
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
source-file: "raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/099_9.1.1 ... 145_9.14.1"
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
---

# Source: SSI — Yêu cầu Bảo mật (Chương 9)

## Tóm tắt

Chương 9 hồ sơ thầu SSI là bộ yêu cầu bảo mật toàn diện nhất trong tài liệu, gồm 47 items chia thành 14 nhóm (9.1–9.14). Bao phủ toàn bộ vòng đời bảo mật: từ input/output validation, authentication, session management, file handling, database security, TLS, đến integration security, privacy (BVDLCN) và SSDLC. Đây là tiêu chí bắt buộc — nhà thầu phải cung cấp bằng chứng đáp ứng từng mục.

## Key Takeaways

- **Server-side validation first**: mọi input (query string, cookie, HTTP header, SOAP, REST, redirect) đều validate tại server trước xử lý
- **MFA bắt buộc** toàn bộ tài khoản truy cập HRM (không có ngoại lệ)
- **Password**: bcrypt/scrypt/Argon2 (one-way hash mạnh), không dùng MD5/SHA1, che mật khẩu trên màn hình
- **Session**: lưu server-side (không cookie client), timeout không hoạt động configurable, không expose session ID trong URL
- **Audit log** bắt buộc cho mọi hành động nhạy cảm (thay đổi quyền, thêm/xóa NV, phê duyệt nghỉ việc)
- **Data masking**: CMND/CCCD, số TK ngân hàng, mức lương phải được mask/redact
- **TLS 1.2+** bắt buộc, không hỗ trợ TLS < 1.2
- **Integration**: OAuth2 hoặc mTLS cho API, Azure AD sync user disabled/delete trong 1h
- **Pháp lý**: NĐ 13/2023/NĐ-CP, Luật ANM 2025, ISO 27001
- **SSDLC + Pentest** định kỳ; SLA patch Critical ≤ 72h / High ≤ 7 ngày / Medium ≤ 30 ngày

## Chi tiết theo nhóm

### 9.1 — Input Validation
- Chuẩn hóa UTF-8, kiểm tra range/length/format/type tại server
- Phòng ngừa SQLi, XSS, Command Injection

### 9.2 — Output Encoding
- Encode dữ liệu không tin cậy trước khi render ra HTML
- Ngăn chặn Stored XSS / Reflected XSS

### 9.3 — Authentication (10 items)
- Xác thực bắt buộc server-side cho mọi trang/resource
- CAPTCHA trên form đăng nhập/đăng ký/quên mật khẩu
- Password complexity bắt buộc (mới + đặt lại)
- Xác thực trên trusted system (server), không client-side
- CSRF protection cho mọi giao dịch
- **Mật khẩu lưu bcrypt/scrypt/Argon2** (không MD5/SHA1)
- Che mật khẩu trên màn hình
- **MFA bắt buộc** tất cả tài khoản HRM
- Mật khẩu/token truyền qua kết nối mã hóa (TLS)
- Temporary password/link: dùng 1 lần, expire ngắn, thông báo người dùng

### 9.4 — Authorization & Access Control (6 items)
- Nguyên tắc đặc quyền tối thiểu (least privilege)
- Hạn chế truy cập mọi tài nguyên (file, URL, function)
- Re-authentication định kỳ cho phiên dài
- Admin UI tách biệt khỏi user UI, chỉ truy cập từ IP quản trị
- **Audit logging** mọi hành động quan trọng
- Cơ chế xác nhận (confirmation mechanism) cho thao tác nhạy cảm

### 9.5 — Session Management (4 items)
- Timeout không hoạt động configurable
- Lưu session biến server-side (không lưu cookie client)
- Cookie + session ID qua kết nối mã hóa, HttpOnly flag
- Không hiển thị session ID trong URL / log / error

### 9.6 — File & Storage Security (5 items)
- Xóa mật khẩu hardcoded khỏi source
- Xác thực trước khi upload, giới hạn size, kiểm tra content type
- Không lưu file trong webroot
- Xóa cache/backup tạm của dữ liệu nhạy cảm sau phiên
- Vô hiệu hóa client cache trên trang nhạy cảm (`Cache-Control: no-store`)

### 9.7 — Error Handling & Logging (2 items)
- Custom error, không hiển thị stack trace/debug info ra ngoài
- Log lưu format có thể truy xuất, access control nghiêm ngặt

### 9.8 — Database Security (2 items)
- Kết nối DB với quyền tối thiểu, dùng parameterized query/stored proc
- **Mã hóa dữ liệu nhạy cảm** trong DB: lương, CMND/CCCD, sức khỏe

### 9.9 — Transport Security
- **TLS 1.2 bắt buộc**, reject TLS < 1.2
- Cấu hình cipher suite phù hợp

### 9.10 — Third-party / Hosting Security (2 items)
- Mô tả phương án bảo mật cloud/hosting nếu dùng
- Nhà cung cấp phải tuân thủ ISO 27001, Luật ANM 2025, Luật BVDLCN

### 9.11 — Integration Security (5 items)
- Tài liệu Integration Security Architecture Document cho từng điểm tích hợp
- Mọi API tích hợp: OAuth2 hoặc mTLS + rate limiting + input validation
- SSO Azure AD: **đồng bộ trạng thái user disabled/delete trong 1h**
- Data minimization: chỉ truyền dữ liệu tối thiểu cần thiết
- Tích hợp fail: queue an toàn, mã hóa at-rest, retry tự động, không lưu plaintext

### 9.12 — Data Privacy (3 items)
- Tuân thủ **NĐ 13/2023/NĐ-CP** (BVDLCN): cơ sở pháp lý, thông báo chủ thể
- **Data masking/redaction**: CMND/CCCD, TK ngân hàng, mức lương
- Data retention policy: thời gian lưu trữ + quy trình xóa/ẩn danh hóa

### 9.13 — API Security
- Mọi API endpoint: xác thực OAuth2 hoặc API Key + phân quyền riêng biệt, Rate Limiting

### 9.14 — SSDLC & Vulnerability Management (2 items)
- Quy trình phát triển an toàn (SSDLC), tài liệu chứng minh, Pentest
- **SLA patch lỗ hổng**: Critical ≤ 72h / High ≤ 7 ngày / Medium ≤ 30 ngày / thông báo trong 24h

## Trích dẫn quan trọng

> Hệ thống được thiết kế và triển khai theo nguyên tắc "Server-side Validation First", đảm bảo toàn bộ dữ liệu đầu vào do người dùng cung cấp đều được chuẩn hóa, kiểm tra và xác thực tại phía máy chủ trước khi được xử lý.

> Xác thực đa yếu tố (MFA) bắt buộc cho tất cả tài khoản truy cập hệ thống HRM.

> Mật khẩu được lưu trữ sử dụng hàm băm một chiều với thuật toán mạnh (bcrypt, scrypt hoặc Argon2).

> Khi tích hợp fail, dữ liệu phải được queue an toàn, mã hóa at-rest, retry tự động. Không lưu plaintext nhạy cảm trong queue.

> Nhà thầu cam kết SLA patch lỗ hổng: Critical ≤ 72 giờ, High ≤ 7 ngày, Medium ≤ 30 ngày. Thông báo trong vòng 24h kể từ khi phát hiện.

## Liên kết

- [[wiki/projects/SSI-Project]] — Project page
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Hồ sơ thầu tổng thể
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực HRM hiện tại
- [[wiki/architecture/2FA-IDS4-Architecture]] — 2FA/MFA trên IDS4
- [[wiki/concepts/HRM-Security-Config]] — Cấu hình bảo mật HRM
- [[wiki/flows/Flow-2FA-Login]] — Flow 2FA đang có
