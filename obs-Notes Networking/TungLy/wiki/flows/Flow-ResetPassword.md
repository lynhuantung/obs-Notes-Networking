---
type: flow
domain: system
tags:
  - sys
  - password
  - reset
  - security
  - flow
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/architecture/HRM-SysDB-Schema]]"
  - "[[wiki/sources/Sys-TaiLieuHeThong-01]]"
---

# Flow: Reset Mật Khẩu & Bảo Mật Đăng Nhập HRM

Ba luồng bảo mật password trong HRM Pro 8: đăng nhập, đổi mật khẩu, và quên mật khẩu.

---

## Luồng 1 — Đăng nhập bảo mật

```mermaid
flowchart TD
    Login([User đăng nhập]) --> Captcha{Captcha\nbật?}
    Captcha -- Có --> CheckCaptcha{Captcha\nhợp lệ?}
    CheckCaptcha -- Không --> LoginFail([Lỗi captcha])
    CheckCaptcha -- Có --> CheckLock
    Captcha -- Không --> CheckLock

    CheckLock{Tài khoản\nbị khóa?} -- Có --> Locked([Thông báo khóa])
    CheckLock -- Không --> CheckPass{Mật khẩu\nđúng?}

    CheckPass -- Sai --> IncrFail[Tăng đếm sai]
    IncrFail --> MaxFail{Vượt số lần\ntối đa?}
    MaxFail -- Có --> LockAcc[Khóa tài khoản\n tạm thời/vĩnh viễn]
    MaxFail -- Không --> LoginFail2([Thông báo sai pass])
    LockAcc --> Locked

    CheckPass -- Đúng --> CheckFirstLogin{Lần đăng\nnhập đầu?}
    CheckFirstLogin -- Có --> ForceChange[Bắt buộc đổi mật khẩu]
    CheckFirstLogin -- Không --> CheckExpired{Mật khẩu\nhết hạn?}
    CheckExpired -- Có --> ForceChange
    CheckExpired -- Không --> CheckExpiring{Sắp hết\nhạn?}
    CheckExpiring -- Có --> WarnExpire[Cảnh báo sắp hết hạn]
    WarnExpire --> Home([Trang chủ])
    CheckExpiring -- Không --> Home
    ForceChange --> ChangePassScreen([Màn hình đổi mật khẩu])
```

---

## Luồng 2 — Đổi mật khẩu (bảo mật)

```mermaid
flowchart TD
    Start([User đổi mật khẩu]) --> ValidLen{Đủ độ dài\ntối thiểu?}
    ValidLen -- Không --> Fail([Thông báo lỗi độ dài])
    ValidLen -- Có --> ValidUpper{Có chữ hoa\nvà thường?}
    ValidUpper -- Không --> Fail2([Lỗi thiếu hoa/thường])
    ValidUpper -- Có --> ValidNum{Có ít nhất\n1 chữ số?}
    ValidNum -- Không --> Fail3([Lỗi thiếu số])
    ValidNum -- Có --> ValidSpecial{Có ít nhất\n1 ký tự đặc biệt?}
    ValidSpecial -- Không --> Fail4([Lỗi thiếu ký tự đặc biệt])
    ValidSpecial -- Có --> CheckHistory{Trùng mật khẩu\ncũ trước đó?}
    CheckHistory -- Có --> Fail5([Không được dùng lại pass cũ])
    CheckHistory -- Không --> Save[Lưu mật khẩu mới\nCập nhật DateChangePasssword]
    Save --> Notify[Gửi mail thông báo\nE_NOTIFYUSERPASS]
    Notify --> Done([Hoàn tất])
```

---

## Luồng 3 — Quên mật khẩu (4 bước)

```mermaid
flowchart TD
    Step1([Bước 1: User nhập\nUsername + Email]) --> CheckUser{Username\ntồn tại?}
    CheckUser -- Không --> ErrUser([Lỗi sai Username])
    CheckUser -- Có --> CheckEmail{Email\nkhớp?}
    CheckEmail -- Không --> ErrEmail([Lỗi sai Email])
    CheckEmail -- Có --> CheckTemplate{Có mail template\nE_Confirm_Reset_Password?}
    CheckTemplate -- Không --> ErrTemplate([Hiển thị lỗi\nthiếu template])
    CheckTemplate -- Có --> SendConfirm[Gửi email xác nhận\nvới link khôi phục]

    SendConfirm --> Step2([Bước 2: User bấm\nlink trong email])
    Step2 --> ClickLink{User có\nbấm link?}
    ClickLink -- Không --> NoAction([Password KHÔNG đổi\nHệ thống không gửi lại])
    ClickLink -- Có --> CheckResetTemplate{Có template\nE_NOTIFYRESETPASSWORD?}
    CheckResetTemplate -- Không --> ErrTemplate2([Lỗi thiếu template reset])
    CheckResetTemplate -- Có --> GenPass[Tạo mật khẩu mới\nngẫu nhiên]

    GenPass --> CheckUserEmail{User có\nemail?}
    CheckUserEmail -- Không --> GetFromProfile{Profile NV\ncó email?}
    GetFromProfile -- Có --> SendNewPass
    GetFromProfile -- Không --> ErrNoEmail([Lỗi: không có email])
    CheckUserEmail -- Có --> SendNewPass[Gửi email\nmật khẩu mới]

    SendNewPass --> Step3([Bước 3: User nhận\nthông báo thành công])
    Step3 --> Step4([Bước 4: User kiểm tra\nemail lần 2 nhận pass mới])
```

---

## Cấu hình bảo mật (Sys_AllSetting)

| Tham số | Mô tả |
|---------|-------|
| Captcha đăng nhập | Google reCaptcha khi đăng nhập |
| Buộc đổi pass lần đầu | User mới đăng nhập lần đầu phải đổi |
| Chu kỳ đổi pass (ngày) | Kể từ lần đổi gần nhất |
| Cảnh báo sắp hết hạn (ngày) | Thông báo trước X ngày |
| Độ dài tối thiểu | Số ký tự tối thiểu |
| Số chữ số tối thiểu | |
| Số ký tự đặc biệt tối thiểu | |
| Số lần sai → khóa | Đăng nhập sai N lần bị khóa |
| Số phút tạm khóa | Rỗng = khóa vĩnh viễn |

---

## Liên kết

- [[wiki/architecture/HRM-SysDB-Schema]] — Sys_UserInfo: DateChangePasssword, DatePasswordExpired
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc auth tổng thể
- [[wiki/sources/Sys-TaiLieuHeThong-01]] — Tài liệu gốc + Enum mail template
