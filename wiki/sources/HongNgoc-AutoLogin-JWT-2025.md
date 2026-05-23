---
type: source
description: "Tài liệu auto-login JWT cho Hồng Ngọc 2025: phân tích SSO, luồng token và giải pháp đăng nhập tự động."
tags:
  - hongnoc
  - sso
  - jwt
  - danh-gia
  - auto-login
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 3.ARCHIEVED/Dự án 2025/HongNgoc-Project/Tài liệu xử lý đánh giá Hồng Ngọc.md
related:
  - "[[wiki/entities/HongNgoc]]"
  - "[[wiki/sources/HongNgoc-DanhGia-SSO]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# Source: HongNgoc — Auto-Login Đánh Giá Cũ → Mới Qua JWT (01/2025)

## Tóm tắt

Tài liệu kỹ thuật tháng 01/2025 về tính năng tự động đăng nhập từ hệ thống đánh giá cũ (v8.9.16) sang hệ thống đánh giá mới (v8.12.46) của HongNgoc. Cả hai hệ thống chạy song song trên cùng infrastructure — cần SSO nội bộ qua JWT `SSO_SecretKey`.

## Key Takeaways

- **Bối cảnh**: HongNgoc chạy 2 version đánh giá song song:
  - **Cũ**: `HONGNGOC_v8.9.16.01.07` — màn hình "Tổng hợp dữ liệu để đánh giá"
  - **Mới**: `HONGNGOC_v8.12.46.01.08` — hệ thống đánh giá mới
- **Luồng auto-login**: User đang ở đánh giá cũ → nhấn **"Đánh giá mới"** → JWT token được tạo → redirect sang đánh giá mới → tự động đăng nhập (không cần nhập lại).
- **Cấu hình web.config đánh giá CŨ** (nguồn phát token):
  ```xml
  <add key="Hrm_Main_Web_SSO" value="https://tl-main.vnrlocal.com/Home/Login" />
  <add key="SSO_SecretKey" value="HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095" />
  ```
- **Cấu hình web.config đánh giá MỚI** (nhận và xác thực token):
  ```xml
  <add key="SSO_SecretKey" value="HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095" />
  ```
  → **Key phải giống nhau** ở cả 2 phía để xác thực JWT hợp lệ.
- **Key `Hrm_Main_Web_SSO`**: Đường dẫn trang đăng nhập HRM chính — dùng khi token không hợp lệ hoặc session hết hạn.
- **Pattern tái dụng**: Bất kỳ trường hợp nào cần SSO giữa 2 sub-system HRM cùng domain → dùng `SSO_SecretKey` shared secret JWT, không cần Identity Server.
- **So sánh với FGL Survey**: FGL dùng redirect qua `SurveyAuthen/Index` (cross-domain); HongNgoc dùng JWT shared secret (same-infrastructure, khác version).

## Trích dẫn quan trọng

> **Cơ chế**: "Token JWT sẽ được gửi kèm để xác thực. Người dùng sẽ được tự động đăng nhập vào hệ thống đánh giá mới mà không cần nhập lại thông tin."

> **Điều kiện bắt buộc**: "`SSO_SecretKey` phải trùng khớp với khóa được cấu hình trong source HONGNGOC_v8.9.16.01.07."

> **Điểm vào**: "Truy cập: Trang chủ > Đánh giá > Tổng hợp dữ liệu để đánh giá → Nhấn vào nút **Đánh giá mới**."

## Liên kết

- [[wiki/entities/HongNgoc]] — Bệnh viện Hồng Ngọc entity profile
- [[wiki/sources/HongNgoc-DanhGia-SSO]] — JWT SSO cấu hình tổng quan HongNgoc (phiên trước)
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực: JWT, SSO, Identity Server
- [[wiki/sources/FGL-Survey-RedirectJWT-2024]] — Pattern redirect JWT cross-domain (so sánh)
