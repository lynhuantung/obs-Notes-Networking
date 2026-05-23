---
type: source
description: "Giải pháp triển khai xác thực hai yếu tố (2FA/TOTP/OTP) cho IdentityServer4 trong hệ thống HRM bảo mật."
code: b3f9
domain: system
tags:
  - 2fa
  - identity-server
  - bao-mat
  - otp
  - totp
created: 2026-05-04
updated: 2026-05-04
source-file: "raw/Nghiệp vụ HRM/SYS/2fa-ids4-solution.md"
related:
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/architecture/2FA-IDS4-Architecture]]"
  - "[[wiki/flows/Flow-2FA-Login]]"
  - "[[wiki/flows/Flow-LDAP-Login]]"
  - "[[wiki/flows/Flow-ResetPassword]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
---

# Source: Giải Pháp 2FA – IdentityServer4

## Tóm tắt

Tài liệu mô tả giải pháp xác thực hai yếu tố (2FA) tích hợp vào **IdentityServer4 (IDS4)** của hệ thống HRM VnResource. Giải pháp dùng chuẩn **TOTP** (HMAC-SHA1, chu kỳ 30s, 6 chữ số) kết hợp Google Authenticator hoặc Microsoft Authenticator. Tài liệu bao gồm toàn bộ vòng đời: thiết lập, đăng nhập, recovery code, vô hiệu hóa, reset, và các biện pháp bảo mật kỹ thuật (rate limit, NTP sync, audit log). Áp dụng cho hệ thống HRM, tài chính, dữ liệu nhạy cảm — bắt buộc với Admin và truy cập từ IP/thiết bị lạ.

## Key Takeaways

- **TOTP** là cơ chế OTP — mã 6 chữ số, hết hạn sau 30s, dùng HMAC-SHA1
- **Factor 1** = password (something you know), **Factor 2** = OTP từ app (something you have)
- Thiết lập qua QR Code / Secret Key quét vào Google Authenticator → nhận Recovery Code
- **Recovery Code** dùng 1 lần, không hiển thị lại → phải lưu offline
- Admin bắt buộc bật 2FA; truy cập IP lạ / thiết bị mới cũng bắt buộc
- Backend: Secret Key lưu DB encrypted, Clock Drift chấp nhận ±30–60s, Rate Limit chống brute force
- IDS4 cấp JWT sau xác thực — **không lưu OTP trong token**
- Rủi ro chính: lộ QR code, lệch giờ server (NTP), mất thiết bị → giải pháp tương ứng có sẵn

## Trích dẫn quan trọng

> Sử dụng chuẩn: **TOTP (Time-based One-Time Password)** — Thuật toán: HMAC-SHA1 — Chu kỳ mã: 30 giây — Độ dài: 6 chữ số

> Admin — Bắt buộc | Truy cập từ IP lạ — Bắt buộc | Thiết bị mới — Bắt buộc | User thường — Optional

> Recovery Code: Số lượng N mã — Sử dụng 1 lần/mã — Không hiển thị lại → Lưu offline, không chia sẻ

> Gợi ý enterprise: Tách 2FA thành service riêng (Auth Service) — Redis cache OTP attempt — Audit trail + alert real-time

## Liên kết

- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực HRM tổng quan (IDS4, JWT SSO, LDAP)
- [[wiki/architecture/2FA-IDS4-Architecture]] — Kiến trúc component 2FA chi tiết
- [[wiki/flows/Flow-2FA-Login]] — Luồng đăng nhập và thiết lập 2FA
- [[wiki/flows/Flow-LDAP-Login]] — Luồng đăng nhập LDAP (auth liên quan)
- [[wiki/flows/Flow-ResetPassword]] — Luồng reset mật khẩu (security liên quan)
- [[wiki/concepts/HRM-Security-Config]] — Cấu hình bảo mật HRM (VnrDecrypt, CORS, policy)
