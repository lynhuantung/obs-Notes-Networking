---
type: source
description: "Bảo mật HRM khách Vietcap 2024: xử lý XSS tự động, SSO Vietcap-Midea-LTG và API security."
tags:
  - security
  - xss
  - sso
  - api
  - daily
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-Jun-26/Vietcap-Midea-LTG-SSO-Hoang-Api-1.md, 0.Daily/2024-Jun-26/Xu-ly-bao-mat-tu-dong.md
related:
  - "[[wiki/sources/Daily-2024-Security-Fixes]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
---

# Source: Daily 2024 — Vietcap, Midea, LTG SSO & API Integration

## Tóm tắt

Ghi chú tháng 06-07/2024 về 3 dự án song song: (1) Vietcap — XSS filter tự động qua MVC/WebAPI middleware; (2) Midea — audit bảo mật; (3) LTG SSO — đăng nhập bằng email thay username. Thêm: API tích hợp Identity Server để lấy danh sách user tích hợp.

## Key Takeaways

- **XSS tự động (Vietcap)**: Thêm cấu hình `HasXSSConfig` → filter validate XSS tự động cho tất cả input trên Main, Portal, Hr, Sys — dùng MVC ActionFilter hoặc WebAPI DelegatingHandler để scan toàn bộ request body/query.
- **LTG SSO — đăng nhập bằng email**: LTG yêu cầu user đăng nhập bằng email thay vì username → cần map email → LoginName trong store xác thực.
- **API tích hợp Identity**: Endpoint `GET /api/Sys_Common/GetIntegratedUserList` trả về danh sách user đã tích hợp với Identity Server — dùng để sync user giữa HRM và Identity (SaaS multi-tenant).
- **Bug IsDelete login**: `hrm_sys_sp_get_usersBy_UserPass` không check `IsDelete` đúng chỗ → user bị xóa mềm vẫn đăng nhập được — cần filter `IsDelete IS NULL` cả ở `Sys_UserInfo` lẫn `Hre_Profile`.
- **Bảo mật tự động**: Pattern XSS filter cấu hình được (`HasXSSConfig`) → linh hoạt bật/tắt theo từng môi trường mà không cần sửa code.

## Trích dẫn quan trọng

> **XSS tự động**: "Validate đầu vào XSS → Xử lý filter trong MVC và Web API. Nếu có cấu hình HasXSSConfig → Xử lý validate Main, Portal, Hr, Sys."

> **API GetIntegratedUserList**: `https://tl-saas-api.vnrlocal.com/api/Sys_Common/GetIntegratedUserList` — endpoint đồng bộ user giữa HRM API và Identity Server (SaaS context).

> **Bug IsDelete**: "Nguyên nhân login không được: do IsDelete Sys_UserInfo hoặc IsDelete Hre_Profile của user đăng nhập."

## Liên kết

- [[wiki/sources/Daily-2024-Security-Fixes]] — XSS grid encode, SQL injection, Broken Access Control
- [[wiki/sources/Daily-2024-SSO-Auth]] — Okta, ADFS, Azure AD patterns
- [[wiki/sources/SaaS-VnR-Meetings-2023-2024]] — Identity Server tích hợp SaaS multi-tenant
