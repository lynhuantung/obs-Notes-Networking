---
type: concept
tags:
  - hrm
  - security
  - vnrdecrypt
  - clr
  - permissions
date-updated: 2026-04-26
related:
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-Network-Check]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
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

## Liên kết kích hoạt

- Cần sysadmin cho CLR → hướng dẫn chi tiết → [[wiki/concepts/HRM-SQL-Troubleshooting]]
- AllowOrigin liên quan webconfig → [[wiki/concepts/HRM-IIS-Troubleshooting]]
- Kiểm tra kết nối mạng có bị Symantec chặn → [[wiki/concepts/HRM-Network-Check]]
