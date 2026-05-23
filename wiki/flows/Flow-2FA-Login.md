---
description: "Luồng thiết lập và đăng nhập 2FA bằng TOTP (Google Authenticator) trên IdentityServer4 HRM, bao gồm quản lý Recovery Code."
type: flow
domain: system
tags:
  - 2fa
  - otp
  - totp
  - identity-server
  - bao-mat
created: 2026-05-04
updated: 2026-05-04
related:
  - "[[wiki/sources/2fa-ids4-solution]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/architecture/2FA-IDS4-Architecture]]"
  - "[[wiki/flows/Flow-ResetPassword]]"
  - "[[wiki/flows/Flow-LDAP-Login]]"
---

# Flow — 2FA Login & Setup (IdentityServer4)

> **Loại**: System Flow  
> **Trigger**: User đăng nhập / User kích hoạt 2FA lần đầu  
> **Phân hệ liên quan**: SYS — IdentityServer4, HRM Portal

---

## Tổng quan

Hai flow chính:
1. **Setup 2FA** — User kích hoạt 2FA lần đầu: quét QR → nhận Recovery Code
2. **Login với 2FA** — Đăng nhập bình thường khi 2FA đã bật: password → OTP → JWT

---

## Flow 1 — Thiết lập 2FA lần đầu

```mermaid
flowchart TD
    A([User truy cập]) --> B[HRM Portal → Cấu hình tài khoản → Bảo mật → 2FA]
    B --> C[Cài Google Authenticator / Microsoft Authenticator]
    C --> D[Hệ thống sinh QR Code + Secret Key]
    D --> E{User chọn cách liên kết}
    E -- Quét QR --> F[Mở app → Scan QR]
    E -- Nhập thủ công --> G[Mở app → Nhập Secret Key]
    F --> H[App sinh OTP 6 chữ số / 30s]
    G --> H
    H --> I[User nhập OTP vào hệ thống để xác minh]
    I --> J{OTP hợp lệ?}
    J -- Không --> K[Báo lỗi → Thử lại]
    K --> I
    J -- Có --> L[2FA kích hoạt thành công]
    L --> M[Hệ thống trả Recovery Code]
    M --> N[User lưu Recovery Code offline]
```

---

## Flow 2 — Đăng nhập với 2FA đã bật

```mermaid
sequenceDiagram
    participant U as User
    participant UI as HRM Portal
    participant IDS as IdentityServer4
    participant GA as Google Authenticator

    U->>UI: Nhập username / password
    UI->>IDS: Gửi request login
    IDS->>IDS: Validate password (VnrDecrypt / LDAP)

    alt Password sai
        IDS-->>UI: 401 Unauthorized
        UI-->>U: Báo lỗi đăng nhập
    end

    alt 2FA Disabled
        IDS-->>UI: Cấp JWT trực tiếp
        UI-->>U: Đăng nhập thành công
    end

    alt 2FA Enabled
        IDS-->>U: Yêu cầu nhập OTP
        U->>GA: Mở app lấy mã OTP
        GA-->>U: Mã 6 chữ số (hết hạn 30s)
        U->>IDS: Nhập OTP
        IDS->>IDS: Validate TOTP (HMAC-SHA1, clock drift ±30–60s)

        alt OTP sai / hết hạn
            IDS-->>U: Báo lỗi OTP
            Note over IDS: Rate Limit đang đếm
        end

        alt OTP hợp lệ
            IDS-->>UI: Cấp Access Token (JWT)
            UI-->>U: Đăng nhập thành công
        end
    end
```

---

## Flow 3 — Đăng nhập bằng Recovery Code (mất thiết bị)

```mermaid
flowchart TD
    A([Mất điện thoại / không có app]) --> B[Màn hình nhập OTP]
    B --> C[Chọn: Dùng Recovery Code]
    C --> D[Nhập 1 Recovery Code đã lưu]
    D --> E{Recovery Code hợp lệ?}
    E -- Không --> F[Báo lỗi]
    E -- Có --> G[Đăng nhập thành công]
    G --> H[Recovery Code đó bị vô hiệu hóa vĩnh viễn]
    H --> I[⚠️ Còn lại N-1 Recovery Code]
```

---

## Flow 4 — Quản lý 2FA (Vô hiệu hóa / Reset)

```mermaid
flowchart TD
    A([Admin hoặc User]) --> B{Loại thao tác}

    B -- Vô hiệu hóa --> C[Đăng nhập hợp lệ]
    C --> D[Nhập OTP hoặc Recovery Code]
    D --> E{Xác thực OK?}
    E -- Có --> F[2FA bị tắt]
    E -- Không --> G[Từ chối]

    B -- Reset 2FA --> H{Ai reset?}
    H -- Admin reset user --> I[Admin vào trang quản lý user → Reset 2FA]
    I --> J[User phải setup lại từ đầu lần sau login]
    H -- User đổi thiết bị --> K[Security Settings → Regenerate Recovery Code / Reset device]

    B -- Tạo lại Recovery Code --> L[Security Settings → Regenerate Recovery Code]
    L --> M[Recovery Code cũ bị hủy toàn bộ]
    M --> N[Nhận bộ Recovery Code mới]
```

---

## Điều kiện áp dụng 2FA

| Trường hợp | 2FA |
|---|---|
| User thường | Optional |
| Admin | Bắt buộc |
| Truy cập từ IP lạ | Bắt buộc |
| Thiết bị mới | Bắt buộc |

---

## Điểm rủi ro

| Rủi ro | Tác động | Phòng tránh |
|--------|---------|------------|
| Lộ QR code khi setup | Kẻ tấn công clone được OTP | Không log / mask QR trên server |
| OTP brute force | Bypass 2FA | Rate Limit — giới hạn số lần nhập sai |
| Lệch giờ server vs thiết bị | OTP luôn invalid | Sync NTP server; clock drift ±30–60s |
| Mất điện thoại | Không đăng nhập được | Recovery Code — lưu offline |
| User bypass policy | Admin không bật bắt buộc | Enforce 2FA policy theo role |
| Recovery Code lộ | Truy cập trái phép | Không hiển thị lại; lưu offline an toàn |

---

## Liên kết

- [[wiki/sources/2fa-ids4-solution]] — Tài liệu giải pháp đầy đủ
- [[wiki/architecture/2FA-IDS4-Architecture]] — Kiến trúc component 2FA
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực HRM tổng quan
- [[wiki/flows/Flow-ResetPassword]] — Flow reset mật khẩu (security liên quan)
- [[wiki/flows/Flow-LDAP-Login]] — Flow đăng nhập LDAP
