---
type: project
description: "Triển khai SSO Microsoft OAuth2/OIDC cho HRM tại UMC — cấu hình Azure App Registration, Identity IDS4"
tags:
  - umc
  - sso
  - microsoft
  - oauth2
created: 2026-05-14
updated: 2026-05-14
related:
  - "[[wiki/sources/p7m3k-umc-sso-microsoft-bien-ban-hop]]"
  - "[[wiki/flows/p7m3k-flow-sso-microsoft-umc]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# Dự án UMC

## Tổng quan

Triển khai kết nối SSO Microsoft Azure AD cho hệ thống HRM tại UMC. Sử dụng OAuth2/OIDC thông qua Identity Server 4 (IDS4). Phía UMC tạo Azure App Registration và cung cấp credentials cho VNR cấu hình.

## Trạng thái

| Hạng mục | Trạng thái |
|----------|-----------|
| Họp xác nhận luồng SSO | ✅ Hoàn thành (14/05/2026) |
| UMC cung cấp Client ID + Secret | ⏳ Đang chờ |
| VNR cấu hình Identity module | ⏳ Chờ thông tin từ UMC |
| Test + bàn giao | ⏳ Chưa bắt đầu |

## Thông tin kỹ thuật

- **Protocol**: OAuth2 + OIDC
- **Identity Provider**: Microsoft Azure AD
- **Tenant**: `common` (không giới hạn tenant)
- **Guard**: HRM kiểm tra email trong `Sys_UserInfo` → 403 nếu không tồn tại
- **Cấu hình phía HRM**: Identity module (client_id, client_secret, tenant)

## Nhân sự

| Người | Vai trò | Tổ chức |
|-------|---------|---------|
| LaiNguyenTuanAnh | Phụ trách chính | UMC / Phòng CNTT |
| PhamNgocDao | Hỗ trợ | UMC / Phòng CNTT |
| hong.nguyen | Tham dự | VNR |
| hai.nguyen | Tham dự | VNR |
| phuc.nguyen-pe | Tham dự | VNR |
| tungly | Tham dự | VNR |

## Meetings

- [[wiki/sources/p7m3k-umc-sso-microsoft-bien-ban-hop]] — Họp 14/05/2026: thống nhất luồng SSO Microsoft

## Luồng xử lý

- [[wiki/flows/p7m3k-flow-sso-microsoft-umc]] — Luồng SSO Microsoft OAuth2/OIDC cho UMC

## Liên kết kỹ thuật

- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc IDS4 OAuth2/OIDC đầy đủ
