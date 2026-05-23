---
type: source
domain: infrastructure
tags:
  - email
  - pop3
  - authentication
  - office365
  - security
created: 2026-05-07
updated: 2026-05-07
description: Tài liệu kỹ thuật khắc phục lỗi đọc email Office 365 qua POP3 — giải pháp đã chọn là App Password
source-file: internal
related:
  - Rec_CandidateProfileService
---

# Hướng Dẫn Khắc Phục Lỗi Đọc Email Outlook/Office 365 qua POP3

---

## 1. Tóm Tắt Vấn Đề

Hệ thống đang sử dụng thư viện **OpenPop.NET** để đọc email từ máy chủ **Exchange Online (Office 365)** thông qua giao thức **POP3** với phương thức xác thực **Basic Authentication** (username + password thường).

Kể từ **tháng 10 năm 2022**, Microsoft đã chính thức **ngừng hỗ trợ Basic Authentication** trên Exchange Online. Điều này khiến hệ thống không thể kết nối và đọc email, dẫn đến tình trạng không nhận được hồ sơ ứng viên gửi qua email.

> 📌 Tham khảo chính thức: https://learn.microsoft.com/vi-vn/lifecycle/announcements/basic-auth-deprecation-exchange-online

---

## 2. Nguyên Nhân Kỹ Thuật

| Thành phần | Hiện trạng |
|---|---|
| Thư viện | OpenPop.NET |
| Giao thức | POP3 (port 995 / SSL) |
| Phương thức xác thực | Basic Authentication (username + password) |
| Hàm liên quan | `ReadPop3MailByHeaderDate` trong `Rec_CandidateProfileService.cs` |
| Trạng thái | ❌ Microsoft Exchange Online từ chối kết nối |

**Lý do Microsoft ngừng hỗ trợ Basic Auth:**
- Dễ bị tấn công brute-force, credential stuffing, phishing
- Không hỗ trợ xác thực đa yếu tố (MFA)
- Không đáp ứng tiêu chuẩn bảo mật hiện đại (OWASP, Zero Trust)

---

## 3. Giải Pháp Đã Chọn — App Password

> ✅ **Quyết định:** Sử dụng **App Password** để khắc phục ngay, không cần sửa code.
> 💡 Đã thực hiện thành công với tài khoản `tuyendung@bitex.com.vn`.

**Mô tả:** Tạo một mật khẩu riêng biệt dành cho ứng dụng bên thứ ba (hệ thống HRM), thay thế mật khẩu tài khoản thông thường. App Password hoạt động với cơ chế POP3 hiện tại — **không cần sửa code, chỉ thay đổi cấu hình password.**

---

### 3.1 Điều Kiện Tiên Quyết — Xác Nhận Trước Khi Thực Hiện

> ⚠️ **App Password chỉ giải quyết phần xác thực.** Nếu POP3 bị tắt ở cấp tổ chức hoặc mailbox, App Password cũng không giúp được. IT Admin phải xác nhận đủ 4 điều kiện sau.

| # | Điều kiện | Kiểm tra ở đâu | Trạng thái |
|---|---|---|---|
| 1 | POP3 bật ở cấp Organization | Exchange Admin Center / PowerShell | ❓ Cần xác nhận |
| 2 | POP3 bật ở cấp Mailbox | PowerShell: `Get-CASMailbox` | ❓ Cần xác nhận |
| 3 | Auth Policy không block POP3 | PowerShell: `Get-AuthenticationPolicy` | ❓ Cần xác nhận |
| 4 | App Password đã tạo | `mysignins.microsoft.com` | ✅ Đã có |

**Điều kiện 1 — POP3 bật ở cấp Organization**

IT Admin kiểm tra tại Exchange Admin Center → **Settings** → **Mail flow**, hoặc chạy PowerShell:
```powershell
Get-TransportConfig | Select-Object POP3Enabled
```
Kết quả phải là `True`. Nếu `False` → Admin bật lên trước khi tiếp tục.

**Điều kiện 2 — POP3 bật ở cấp Mailbox**

```powershell
Get-CASMailbox -Identity "tuyendung@bitex.com.vn" | Select-Object POPEnabled
```
Nếu `False` → Admin chạy lệnh bật:
```powershell
Set-CASMailbox -Identity "tuyendung@bitex.com.vn" -POPEnabled $true
```

**Điều kiện 3 — Authentication Policy không chặn POP3**

```powershell
Get-AuthenticationPolicy | Select-Object Name, AllowBasicAuthPop
```
Phải là `AllowBasicAuthPop = True`. Nếu `False` → App Password vẫn bị block dù đã tạo thành công.

---

### 3.2 Hướng Dẫn Tạo App Password (Phía Khách Hàng)

**Điều kiện bắt buộc:** Tài khoản email phải đã bật **MFA** (Microsoft Authenticator App hoặc Phone).

**Bước 1 — Kiểm tra MFA đã bật chưa**
- Truy cập `https://mysignins.microsoft.com/security-info`
- Đăng nhập bằng tài khoản Office 365 cần cấu hình (ví dụ: `tuyendung@bitex.com.vn`)
- Kiểm tra phần **"Sign-in methods"**: phải có ít nhất một phương thức MFA như **Microsoft Authenticator** hoặc **Phone**
- Nếu chưa có → nhấn **"Add sign-in method"** → chọn **"Microsoft Authenticator"** và làm theo hướng dẫn

**Bước 2 — Tạo App Password**
- Tại trang **Security info**, nhấn **"Add sign-in method"**
- Chọn **"App password"** từ danh sách
- Nhập tên định danh (ví dụ: `HRM-System`) → nhấn **Next**

**Bước 3 — Lưu App Password**
- Hệ thống hiển thị dialog **"App password created"**:
  ```
  Copy and save this password somewhere safe.
  It won't be shown again.

  Password: xxxxxxxxxxxxxxxx  ← chuỗi 16 ký tự
  Password name: HRM-System
  ```
- ⚠️ **QUAN TRỌNG:** Mật khẩu này **chỉ hiển thị một lần duy nhất**. Phải copy ngay trước khi nhấn **Done**.
- Nhấn **"Copy password"** → lưu vào nơi an toàn → nhấn **Done**

**Bước 4 — Xác nhận App Password đã tồn tại**
- Tại trang **Security info** sẽ xuất hiện mục **"App password"** trong danh sách
- Trang hiển thị đủ: `Password`, `App password`, `Microsoft Authenticator` — cả 3 active

**Bước 5 — Gửi cho team kỹ thuật**
- Gửi chuỗi App Password (16 ký tự) qua kênh bảo mật (không gửi qua email thường)
- Cung cấp thêm: địa chỉ email (`tuyendung@bitex.com.vn`), tên App Password đã đặt

---

### 3.3 Cấu Hình Hệ Thống (Phía Kỹ Thuật)

- [ ] Xác nhận IT Admin đã check đủ 3 điều kiện POP3 (mục 3.1)
- [ ] Nhận App Password từ khách hàng
- [ ] Cập nhật password trong file cấu hình hệ thống (thay password cũ bằng App Password)
- [ ] Kiểm tra kết nối POP3: server `pop.outlook.com`, port `995`, SSL `true`
- [ ] Chạy test hàm `ReadPop3MailByHeaderDate` — xác nhận đọc email thành công
- [ ] Thông báo kết quả cho khách hàng

---

### 3.4 Lưu Ý Vận Hành

| Tình huống | Xử lý |
|---|---|
| Quên không copy password trước khi nhấn Done | Xóa App Password cũ → tạo lại |
| Đổi phương thức MFA hoặc tắt MFA | App Password bị vô hiệu hóa → phải tạo lại |
| Tài khoản bị lock hoặc đổi password chính | App Password vẫn còn hiệu lực (độc lập) |
| Cần thu hồi quyền truy cập | Security info → App password → **Delete** |
| POP3 đột ngột không đọc được sau khi đang chạy | Kiểm tra lại điều kiện 1–3 (mục 3.1) |

---

## 4. Kế Hoạch Dài Hạn — OAuth2 / Microsoft Graph API

> ℹ️ App Password là giải pháp **tạm thời**. Microsoft có thể tắt POP3 hoàn toàn trong tương lai. Cần lên kế hoạch migrate sang **OAuth2 + Microsoft Graph API** trong sprint tiếp theo.

**Lý do cần migrate:**
- OAuth2 là cơ chế xác thực chính thức Microsoft khuyến nghị
- Token tự hết hạn, có thể revoke — không lộ password
- Đáp ứng OWASP, đạt chuẩn pentest/security audit
- Không phụ thuộc POP3 (có thể bị tắt bất kỳ lúc nào)

**Yêu cầu khi migrate:**
- IT Admin đăng ký Azure App, cấp quyền `Mail.Read`
- Dev thay thế OpenPop bằng Microsoft Graph API (`GET /users/{email}/messages`)
- Ước tính: 1–3 ngày dev


