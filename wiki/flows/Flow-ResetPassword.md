---
description: "Ba luồng bảo mật HRM: đăng nhập (captcha, khóa tài khoản), đổi mật khẩu (validate độ phức tạp), quên mật khẩu (4 bước qua email)."
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

## Bối cảnh

Ba luồng bảo mật password trong HRM Pro 8: đăng nhập (với captcha, khóa tài khoản), đổi mật khẩu (validate độ phức tạp, lịch sử), và quên mật khẩu (4 bước qua email). Tất cả cấu hình qua `Sys_AllSetting`, lưu trạng thái trong `Sys_UserInfo`.

## Mermaid Flow

### Luồng 1 — Đăng nhập bảo mật

```mermaid
flowchart TD
    Login([User dang nhap]) --> Captcha{Captcha bat?}
    Captcha -- Co --> CheckCaptcha{Captcha hop le?}
    CheckCaptcha -- Khong --> LoginFail([Loi captcha])
    CheckCaptcha -- Co --> CheckLock
    Captcha -- Khong --> CheckLock
    CheckLock{Tai khoan bi khoa?} -- Co --> Locked([Thong bao khoa])
    CheckLock -- Khong --> CheckPass{Mat khau dung?}
    CheckPass -- Sai --> IncrFail[Tang dem sai]
    IncrFail --> MaxFail{Vuot so lan toi da?}
    MaxFail -- Co --> LockAcc[Khoa tai khoan tam thoi hoac vinh vien]
    MaxFail -- Khong --> LoginFail2([Thong bao sai pass])
    LockAcc --> Locked
    CheckPass -- Dung --> CheckFirstLogin{Lan dang nhap dau?}
    CheckFirstLogin -- Co --> ForceChange[Bat buoc doi mat khau]
    CheckFirstLogin -- Khong --> CheckExpired{Mat khau het han?}
    CheckExpired -- Co --> ForceChange
    CheckExpired -- Khong --> CheckExpiring{Sap het han?}
    CheckExpiring -- Co --> WarnExpire[Canh bao sap het han]
    WarnExpire --> Home([Trang chu])
    CheckExpiring -- Khong --> Home
    ForceChange --> ChangePassScreen([Man hinh doi mat khau])
```

### Luồng 2 — Đổi mật khẩu (bảo mật)

```mermaid
flowchart TD
    Start([User doi mat khau]) --> ValidLen{Du do dai toi thieu?}
    ValidLen -- Khong --> Fail([Thong bao loi do dai])
    ValidLen -- Co --> ValidUpper{Co chu hoa va chu thuong?}
    ValidUpper -- Khong --> Fail2([Loi thieu hoa/thuong])
    ValidUpper -- Co --> ValidNum{Co it nhat 1 chu so?}
    ValidNum -- Khong --> Fail3([Loi thieu so])
    ValidNum -- Co --> ValidSpecial{Co it nhat 1 ky tu dac biet?}
    ValidSpecial -- Khong --> Fail4([Loi thieu ky tu dac biet])
    ValidSpecial -- Co --> CheckHistory{Trung mat khau cu truoc do?}
    CheckHistory -- Co --> Fail5([Khong duoc dung lai pass cu])
    CheckHistory -- Khong --> Save[Luu mat khau moi: Cap nhat DateChangePassword]
    Save --> Notify[Gui mail thong bao E_NOTIFYUSERPASS]
    Notify --> Done([Hoan tat])
```

### Luồng 3 — Quên mật khẩu (4 bước)

```mermaid
flowchart TD
    Step1([Buoc 1: User nhap Username va Email]) --> CheckUser{Username ton tai?}
    CheckUser -- Khong --> ErrUser([Loi sai Username])
    CheckUser -- Co --> CheckEmail{Email khop?}
    CheckEmail -- Khong --> ErrEmail([Loi sai Email])
    CheckEmail -- Co --> CheckTemplate{Co mail template E_Confirm_Reset_Password?}
    CheckTemplate -- Khong --> ErrTemplate([Hien thi loi thieu template])
    CheckTemplate -- Co --> SendConfirm[Gui email xac nhan voi link khoi phuc]
    SendConfirm --> Step2([Buoc 2: User bam link trong email])
    Step2 --> ClickLink{User co bam link?}
    ClickLink -- Khong --> NoAction([Password KHONG doi: He thong khong gui lai])
    ClickLink -- Co --> CheckResetTemplate{Co template E_NOTIFYRESETPASSWORD?}
    CheckResetTemplate -- Khong --> ErrTemplate2([Loi thieu template reset])
    CheckResetTemplate -- Co --> GenPass[Tao mat khau moi ngau nhien]
    GenPass --> CheckUserEmail{User co email?}
    CheckUserEmail -- Khong --> GetFromProfile{Profile NV co email?}
    GetFromProfile -- Co --> SendNewPass
    GetFromProfile -- Khong --> ErrNoEmail([Loi khong co email])
    CheckUserEmail -- Co --> SendNewPass[Gui email mat khau moi]
    SendNewPass --> Step3([Buoc 3: User nhan thong bao thanh cong])
    Step3 --> Step4([Buoc 4: User kiem tra email lan 2 nhan pass moi])
```

## Diễn giải từng bước

### Luồng 1 — Đăng nhập bảo mật

1. **Captcha** (nếu bật): validate reCaptcha → fail → dừng ngay
2. **Kiểm tra khóa**: tài khoản đang bị khóa → hiển thị thông báo
3. **Xác thực mật khẩu**: sai → tăng đếm sai → vượt ngưỡng → khóa tài khoản (tạm thời hoặc vĩnh viễn tùy cấu hình)
4. **Đúng mật khẩu**: kiểm tra lần đầu đăng nhập / mật khẩu hết hạn → bắt buộc đổi
5. **Sắp hết hạn**: cảnh báo nhưng vẫn vào được trang chủ

### Luồng 2 — Đổi mật khẩu

Validate tuần tự: độ dài → có chữ hoa+thường → có số → có ký tự đặc biệt → không trùng lịch sử → lưu + gửi mail thông báo `E_NOTIFYUSERPASS`.

### Luồng 3 — Quên mật khẩu (4 bước)

- **Bước 1**: Nhập username + email → gửi link xác nhận (`E_Confirm_Reset_Password`)
- **Bước 2**: User bấm link → hệ thống tạo mật khẩu mới ngẫu nhiên
- **Bước 3**: Gửi mật khẩu mới qua email (`E_NOTIFYRESETPASSWORD`) → thông báo thành công
- **Bước 4**: User kiểm tra email lần 2 để lấy mật khẩu mới

> **Lưu ý**: Nếu user không bấm link → password **KHÔNG** đổi; hệ thống không tự gửi lại.

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

## Liên kết

- [[wiki/architecture/HRM-SysDB-Schema]] — Sys_UserInfo: DateChangePasssword, DatePasswordExpired
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc auth tổng thể
- [[wiki/sources/Sys-TaiLieuHeThong-01]] — Tài liệu gốc + Enum mail template
