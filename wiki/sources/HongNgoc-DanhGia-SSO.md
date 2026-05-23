---
type: source
description: "Đánh giá kỹ thuật SSO và JWT cho dự án Hồng Ngọc: các phương án triển khai và so sánh giải pháp."
tags:
  - hongnoc
  - danh-gia
  - sso
  - jwt
  - technical
  - "2025"
date-updated: 2026-04-25
date-ingested: 2026-04-25
category: guide
project: hongnoc
related:
- "[[wiki/projects/HongNgoc-Project]]"
- "[[wiki/concepts/HRM-Modules]]"
- "[[wiki/entities/HongNgoc]]"
---

# Tài liệu xử lý đánh giá Hồng Ngọc — SSO tích hợp hệ thống đánh giá mới

**Nguồn gốc**: `3. ARCHIEVED/Dự án 2025/HongNgoc-Project/Tài liệu xử lý đánh giá Hồng Ngọc.md`  
**Ngày**: 14/01/2025

---

## Tóm tắt

Tài liệu hướng dẫn cấu hình **SSO (Single Sign-On)** giữa hệ thống đánh giá cũ và mới tại Hồng Ngọc, dùng **JWT token** để tự động đăng nhập khi chuyển sang module đánh giá mới.

## Bối cảnh

Hồng Ngọc đang chạy **song song** hai phiên bản hệ thống đánh giá:
- **Cũ**: `HONGNGOC_v8.9.16.01.07`
- **Mới**: `HONGNGOC_v8.12.46.01.08`

Yêu cầu: khi user đang đăng nhập hệ thống cũ và nhấn "Đánh giá mới" → tự động đăng nhập hệ thống mới (không nhập lại password).

## Giải pháp: JWT SSO

### Cấu hình source cũ (`web.config`)

```xml
<add key="Hrm_Main_Web_SSO" value="https://tl-main.vnrlocal.com/Home/Login" />
<add key="SSO_SecretKey" value="HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095" />
```

### Cấu hình source mới (`web.config`)

```xml
<add key="SSO_SecretKey" value="HongNgocAuthSecretKey_C6F41B3E325D43C38F710005BF510095" />
```

> ⚠️ **SSO_SecretKey phải giống nhau ở cả hai source**

### Luồng hoạt động

1. User vào: **Trang chủ → Đánh giá → Tổng hợp dữ liệu để đánh giá**
2. Nhấn nút **"Đánh giá mới"**
3. Hệ thống cũ tạo JWT token với SecretKey → redirect sang hệ thống mới
4. Hệ thống mới xác thực JWT → tự động đăng nhập user

## Key Insights

- Pattern **parallel run** (chạy song song 2 phiên bản) + SSO bridge là giải pháp chuyển đổi dần dần, giảm rủi ro
- JWT SSO đơn giản: chỉ cần shared secret key trong `web.config` — không cần OAuth server
- **SecretKey phải đồng nhất** giữa hai bên — lỗi thường gặp khi cấu hình sai key
- URL `Hrm_Main_Web_SSO` trỏ đến môi trường nào (dev/prod) phải cấu hình đúng
