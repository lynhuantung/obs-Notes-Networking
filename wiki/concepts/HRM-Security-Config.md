---
description: "Cấu hình bảo mật HRM: VnrDecrypt, CLR, permissions, webconfig, LDAP, lịch sử các lỗ hổng bảo mật."
type: concept
tags:
  - hrm
  - security
  - vnrdecrypt
  - clr
  - permissions
  - webconfig
  - ldap
  - password
date-updated: 2026-04-29
related:
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-Network-Check]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
- "[[wiki/sources/Sys-TaiLieuHeThong-01]]"
- "[[wiki/sources/Sys-TaiLieuLDAP-03]]"
- "[[wiki/sources/VietCap-Security-Vulnerability-Q42025]]"
- "[[wiki/sources/VnPay-Security-Vulnerability-Oct2025]]"
- "[[wiki/sources/AVN-Security-Vulnerability-2025]]"
- "[[wiki/sources/NghiSon-Security-Vulnerability-2025]]"
- "[[wiki/sources/Daily-2024-Vietcap-SSO-Security]]"
- "[[wiki/architecture/HRM-SysDB-Schema]]"
- "[[wiki/flows/Flow-ResetPassword]]"
---

# HRM — Security Config

> Ghi chú nguyên tử: các vấn đề bảo mật và cấu hình quyền trong HRM.

## VnrDecrypt — Mật Khẩu Mã Hóa

**Không thể thay đổi sau khi đã có dữ liệu.**

- Thuật toán: SHA2-512
- Mật khẩu nhúng cứng trong DLL (`VnResource.DatabaseClr.dll`)
- Mỗi source có mật khẩu riêng (tăng bảo mật)
- Nếu đổi mật khẩu → **toàn bộ dữ liệu đã mã hóa không còn giải mã được**
- Lập trình viên cũng không biết giá trị mật khẩu → thiết kế có chủ ý

> Khách hàng hỏi "có đổi được không?" → trả lời: không, và lý do là toàn vẹn dữ liệu.

## Sysadmin — Khi Nào Cần, Khi Nào Không

**Cần sysadmin (tạm thời):**
- Cài mới hoặc nâng cấp hệ thống: bật CLR, tạo assembly, đăng ký hàm CLR
- Restore database: kích hoạt lại CLR + nạp assembly

**Không cần sysadmin (vận hành thường ngày):**
- Chỉ cần: `GRANT EXECUTE ON dbo.VnrDecrypt TO [AppUser];`

**Cam kết bảo mật với khách hàng:**
- Không cấp sysadmin cho user ứng dụng
- Chỉ cấp tạm thời cho tài khoản triển khai
- Ghi log toàn bộ thao tác → thu hồi sau khi hoàn tất
- Nguyên tắc **Least Privilege**

## AllowOrigin — CORS cho HRM

**Dùng khi:** Link HRM từ Google Chat, Slack, hoặc tool bên ngoài bị lỗi hình răng cưa

Thêm vào webconfig (Main và Portal):
```xml
<add key="AllowOrigin" value="https://www.google.com/" />
```

Hoặc webSetting.json tương đương.

## Permission Cache Không Refresh

**Dùng khi:** Phân quyền nhóm trong API Center xong nhưng hệ thống không nhận

Nguyên nhân: thiếu key `Hrm_APICenter_Web` trong `WebSettings.json` của WebMain

```json
"Hrm_APICenter_Web": "https://[link-api-center]/"
```

→ Khi có key này, hệ thống tự refresh cache quyền khi chỉnh nhóm quyền

## Lộ Quyền Dữ Liệu — Case HVN

Pattern đã gặp: Chrome với Symantec không truyền header user login → func phân quyền nhận userLogin null → trả về toàn bộ dữ liệu

**Nguyên nhân gốc:** Func phân quyền chưa xử lý case userLogin null/invalid

**Fix:**
1. Sửa func phân quyền để chặn trường hợp userLogin không hợp lệ
2. Cài Chrome với quyền **administrator** (không phải user thường)

## Webconfig Keys Quan Trọng (SYS Module)

Từ tài liệu gốc `Sys_TaiLieuHeThong_01` — các key hay dùng nhất:

| Key | Ý nghĩa | Ví dụ |
|-----|---------|-------|
| `IsLdapSignIn` | Bật đăng nhập LDAP | `false` |
| `LdapSignInSource` | Domain LDAP cho phép | `@thaco.com.vn,` |
| `SessionTimeOut` | Timeout session (phút) | `1000` (main), `15` (portal) |
| `TimeExpireToken` | Timeout token (phút) | `3` |
| `ModeProfilerLog` | Ghi log request | `ALL` / `None` / `Error` |
| `IsEncryptData` | Mã hóa dữ liệu truyền | `True` |
| `UseRedisServer` | Dùng Redis cache | `true` |
| `AllowAnonymousRequest` | Cho phép request không auth | (thường `false`) |
| `IsAudit` | Bật audit trail | `False` |
| `reCaptchaPublicKey` / `reCaptchaPrivateKey` | Google reCaptcha keys | |
| `Format_Decimal_Number` | Số lẻ thập phân | `2` |
| `Format_Decimal_Money` | Số lẻ tiền tệ | `2` |

## Bảo Mật Password (9 tham số cấu hình)

| Tham số | Mô tả |
|---------|-------|
| Captcha đăng nhập | Google reCaptcha bắt buộc |
| Buộc đổi pass lần đầu | User mới phải đổi ngay |
| Chu kỳ đổi pass (ngày) | Tính từ lần đổi gần nhất |
| Cảnh báo sắp hết hạn | Thông báo trước X ngày |
| Độ dài tối thiểu | ≥ 8 ký tự |
| Số chữ số tối thiểu | ≥ 1 ký tự số |
| Số ký tự đặc biệt tối thiểu | ≥ 1 ký tự đặc biệt |
| Số lần sai → khóa | Sai 5 lần → khóa |
| Số phút tạm khóa | Rỗng = khóa vĩnh viễn |

> **Force reset toàn bộ user**: UPDATE `DateChangePasssword` + `DatePasswordExpired` về ngày quá khứ trong `Sys_UserInfo`.

## Lỗ Hổng Bảo Mật Đã Ghi Nhận — VietCap Q4/2025

> Nguồn: [[wiki/sources/VietCap-Security-Vulnerability-Q42025]]

| Nhóm | Lỗ hổng tiêu biểu | Fix |
|---|---|---|
| **JS Library** | Lodash 4.17.15 (CVE-2021-23337/28500/8203) | Nâng lên 4.17.21 |
| **JS Library** | Highcharts v8.2.2 (CVE-2021-29489) | Nâng lên v12.4.0 |
| **CSP** | Header Not Set, Wildcard, unsafe-inline script/style, No Fallback | Cấu hình CSP đầy đủ trên IIS |
| **CORS** | Access-Control-Allow-Origin: * (CWE-264) | Whitelist domain cụ thể |
| **CSRF** | Absence of Anti-CSRF Tokens (CWE-352) | CSRF token các form quan trọng |
| **Clickjacking** | Missing frame-ancestors (CWE-1021) | CSP: frame-ancestors 'self' |
| **Redis RCE** | CVE-2025-49844 — Lua use-after-free 🔴🔴 Critical | Nâng Redis ≥ v8.2.2 |

**Nguyên tắc từ đợt kiểm tra:**
- CSP cần được cấu hình **đầy đủ baseline** từ lúc deploy — không để ZAP phát hiện sau.
- Theo dõi CVE chủ động cho infrastructure (Redis, IIS) — không chờ khách hàng báo.
- Phân biệt "Bỏ qua có chủ đích" (accept risk) vs "chưa xử lý" khi ghi nhận trạng thái lỗ hổng.

## Lỗ Hổng Bảo Mật Đã Ghi Nhận — AVN 2025

> Nguồn: [[wiki/sources/AVN-Security-Vulnerability-2025]]

| Nhóm | Lỗ hổng tiêu biểu | Fix |
|---|---|---|
| **Hardcoded Secrets** | DB password, Azure Key, Service Account Key (CWE-798) ×3 | Xóa khỏi code/comment, dùng Secret Manager |
| **TLS/SSL** | Giao thức yếu CWE-327 + Không xác thực cert CWE-295 (×2 lần) | Chỉ dùng TLS 1.2+, bật cert validation |
| **AES Encryption** | Padding scheme không an toàn CWE-329 | Thay `AesManaged()` → `Aes.Create()` |
| **KDF Hashing** | Iterations thấp CWE-916 | Chấp nhận ngoại lệ — ràng buộc tương thích |
| **CSP** | CSP không chặt chẽ CWE-1021 | Thêm nonce/strict-dynamic, kiểm soát nguồn JS |

**Điểm nổi bật**: CWE-295 xuất hiện 2 lần trên 2 module (Hệ thống + UHelp SSF) → lỗi hệ thống, không phải lỗi đơn điểm.

## Lỗ Hổng Bảo Mật Đã Ghi Nhận — VnPay Pentest 10/2025

> Nguồn: [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]]

**24 lỗ hổng** — đợt pentest do VnPay thực hiện 13/10/2025 trên toàn hệ thống HRM.

| Nhóm | Lỗ hổng tiêu biểu | Mức độ | Fix |
|---|---|---|---|
| **Phân quyền** | CWE-269 Privilege Escalation — phân quyền client-side (testpermission) | 🔴 Critical | Thêm chữ ký vào key quyền response |
| **Access Control** | CWE-284 Account Takeover qua Sys_User API | 🔴 Critical | Kiểm tra key quyền màn hình Sys_User |
| **SQL Injection** | CWE-89 — PivotTable API cho phép query tùy ý | 🔴 Critical | Chỉ cho phép tên stored, chỉ super-admin, blacklist keyword |
| **Access Control** | CWE-284 Broken Access Control — 28 API Portal (OT, nghỉ phép, chấm công...) | 🔴 High | Xác thực token + validate ProfileID + check userapprove |
| **Session** | CWE-613 Token không hủy sau logout | 🟡 Medium | Add token vào blacklist sau logout |
| **Session** | CWE-613 Token TTL quá dài (2 tháng) | 🟡 Medium | Giảm TTL về 1 ngày |
| **XSS** | CWE-79 Stored XSS — Kendo UI (Portal + Main BO) | Medium/High | Validate XSS trước khi lưu server |
| **DoS** | CWE-770 pagesize không giới hạn | 🔴 High | Giới hạn tối đa 50 record |
| **Info Disclosure** | CWE-212 Lộ password user trong response GetUserList | 🟡 Medium | Lược bỏ field nhạy cảm |
| **Business Logic** | CWE-840 Nhầm tài khoản khi login bằng email | 🔴 High | Sửa stored phân biệt login theo userlogin hay email |
| **IDOR** | CWE-639 Authorization Bypass qua ID do user kiểm soát | 🟡 Medium | Validate ID theo quyền user |
| **Mobile** | CWE-926 Thiếu check root device | 🟢 Low | Bổ sung cơ chế root detection |
| **Còn tồn đọng** | CWE-598 GET /identityHub?access_token=* — Identity Server | 🟡 Medium | 🟡 **Đang xử lý** |

**Bài học từ đợt này:**
- Phân quyền **PHẢI** thực hiện phía server — không bao giờ tin tưởng response client để kiểm soát quyền.
- Token sau logout phải vào **blacklist** ngay lập tức.
- API download file và cache check cần xác thực — không để anonymous access.
- So sánh với VietCap Q4/2025: VnPay tập trung vào access control/logic; VietCap tập trung vào CSP/CORS/thư viện JS.

## Lỗ Hổng Bảo Mật Đã Ghi Nhận — NghiSon 2025

> Nguồn: [[wiki/sources/NghiSon-Security-Vulnerability-2025]]

| Lỗ hổng | Mã | Fix |
|---|---|---|
| Redis Lua Use-After-Free RCE 🔴🔴 | CVE-2025-49844 | Nâng Redis ≥ v8.2.2 |

**Lưu ý**: Cùng CVE-2025-49844 với VietCap (phát hiện cách nhau 3 ngày, đều do khách hàng báo) → cần audit Redis trên tất cả dự án.

## Liên kết kích hoạt

- Checklist xử lý vấn đề phân quyền (7 bước, debug theo triệu chứng) → [[wiki/sources/CheckList-PhanQuyen-HRM]]
- Cần sysadmin cho CLR → hướng dẫn chi tiết → [[wiki/concepts/HRM-SQL-Troubleshooting]]
- AllowOrigin liên quan webconfig → [[wiki/concepts/HRM-IIS-Troubleshooting]]
- Kiểm tra kết nối mạng có bị Symantec chặn → [[wiki/concepts/HRM-Network-Check]]
- LDAP config chi tiết → [[wiki/flows/Flow-LDAP-Login]]
- Reset password workflow → [[wiki/flows/Flow-ResetPassword]]
- DB schema bảo mật → [[wiki/architecture/HRM-SysDB-Schema]]
