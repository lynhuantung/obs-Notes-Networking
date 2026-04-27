---
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
date-updated: 2026-04-27
related:
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-Network-Check]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
- "[[wiki/sources/Sys-TaiLieuHeThong-01]]"
- "[[wiki/sources/Sys-TaiLieuLDAP-03]]"
- "[[wiki/architecture/HRM-SysDB-Schema]]"
- "[[wiki/flows/Flow-ResetPassword]]"
---

# HRM — Security Config

> Ghi chú nguyên tử: các vấn đề bảo mật và cấu hình quyền trong FIT-HRM.

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

## Liên kết kích hoạt

- Cần sysadmin cho CLR → hướng dẫn chi tiết → [[wiki/concepts/HRM-SQL-Troubleshooting]]
- AllowOrigin liên quan webconfig → [[wiki/concepts/HRM-IIS-Troubleshooting]]
- Kiểm tra kết nối mạng có bị Symantec chặn → [[wiki/concepts/HRM-Network-Check]]
- LDAP config chi tiết → [[wiki/flows/Flow-LDAP-Login]]
- Reset password workflow → [[wiki/flows/Flow-ResetPassword]]
- DB schema bảo mật → [[wiki/architecture/HRM-SysDB-Schema]]
