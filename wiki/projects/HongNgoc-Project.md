---
description: "Dự án HongNgoc (2025): nâng cấp phân hệ Đánh giá chạy song song 2 phiên bản với SSO JWT bridge, archived."
type: wiki-project
tags:
  - hongnoc
  - hrm
  - evaluation
  - sso
  - jwt
  - "2025"
date-updated: 2026-04-26
related:
- "[[wiki/entities/HongNgoc]]"
- "[[wiki/concepts/HRM-Modules]]"

# --- CHART FIELDS ---
status: archived
start-date: 2025-01-01
end-date: 2025-06-30
project-type: upgrade
industry: other
team-size: 2
effort-mandays: 0
modules:
  - evaluation
---

# Dự án HongNgoc

## Thông tin cơ bản

| Trường     | Giá trị                                  |     |
| ---------- | ---------------------------------------- | --- |
| Khách hàng | [[wiki/entities/HongNgoc]]               |     |
| Loại dự án | Nâng cấp phân hệ Đánh giá (v cũ → v mới) |     |
| Năm        | 2025 (archived)                          |     |
| Trạng thái | Archived                                 |     |

## Giải pháp kỹ thuật chính

Khách hàng chạy **song song** hai phiên bản hệ thống đánh giá trong quá trình chuyển đổi:

| Version | Source |
|---------|--------|
| Cũ | `HONGNGOC_v8.9.16.01.07` |
| Mới | `HONGNGOC_v8.12.46.01.08` |

**SSO JWT Bridge**: khi user đang dùng hệ thống cũ và chuyển sang Đánh giá mới → tự động đăng nhập bằng JWT token (shared secret key).

Xem chi tiết cấu hình: [[wiki/sources/HongNgoc-DanhGia-SSO]]

## Lessons Learned

- **Pattern parallel run + SSO** là giải pháp chuyển đổi hệ thống an toàn — giảm rủi ro so với cutover hoàn toàn
- JWT SSO với shared secret key đơn giản, không cần OAuth server
- ⚠️ `SSO_SecretKey` phải **giống nhau tuyệt đối** ở cả hai web.config — sai key là lỗi phổ biến
- URL `Hrm_Main_Web_SSO` phải trỏ đúng môi trường (dev vs prod)

## Cross-links

- [[wiki/concepts/HRM-Modules]] — phân hệ Đánh giá
- [[wiki/sources/HongNgoc-DanhGia-SSO]] — hướng dẫn cấu hình SSO
