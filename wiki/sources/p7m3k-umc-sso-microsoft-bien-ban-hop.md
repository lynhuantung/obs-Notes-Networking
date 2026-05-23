---
type: source
code: p7m3k
description: "Biên bản họp UMC 14/05/2026 — thống nhất SSO Microsoft OAuth2/OIDC cho HRM, UMC cung cấp thông tin Azure App Registration"
domain: system
tags:
  - umc
  - sso
  - microsoft
  - oauth2
  - oidc
  - meeting
created: 2026-05-14
updated: 2026-05-14
source-file: "raw/archive/1. Projects/Dự án 2026/UMC-Project/Meeting_Notes/H-UMC-SSO-14052026.md"
related:
  - "[[wiki/projects/UMC-Project]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/flows/p7m3k-flow-sso-microsoft-umc]]"
---

# Source: Biên bản họp UMC — Luồng SSO Microsoft HRM (14/05/2026)

## Tóm tắt

Cuộc họp ngày 14/05/2026 giữa VNR và khách hàng UMC nhằm làm rõ luồng SSO Microsoft cho hệ thống HRM. Hai bên thống nhất sử dụng OAuth2/OIDC thông qua Azure AD. Phía UMC (anh LaiNguyenTuanAnh phụ trách, anh PhamNgocDao hỗ trợ) sẽ tạo Azure App Registration và cung cấp Client ID + Secret cho VNR cấu hình. Sau khi nhận đủ thông tin, VNR thiết lập kết nối SSO và bàn giao.

## Key Takeaways

- Protocol: **OAuth2 + OIDC** — không phải SAML hay JWT SSO đơn thuần
- Tenant mode: `common` → không giới hạn tenant, bất kỳ Microsoft account đều vào được
- HRM có **lớp chặn 403** nếu email user không tồn tại trong hệ thống — đây là guard sau xác thực
- Luồng cấu hình: **UMC tạo Azure App Registration** → lấy Client ID + Secret → gửi VNR → VNR cấu hình vào Identity module
- PIC phía UMC: **LaiNguyenTuanAnh** (phụ trách) + **PhamNgocDao** (hỗ trợ), cả hai thuộc Phòng CNTT

## Trích dẫn quan trọng

> Phía khách hàng: tạo Azure App Registration → lấy **Client ID** + **Client Secret** → gửi cho HRM. Phía HRM: cấu hình trong **Identity module** (client_id, client_secret, tenant)

> Tenant mode: dùng `common` → không giới hạn tenant, bất kỳ Microsoft account nào đều có thể đăng nhập. Lớp bảo vệ của HRM: sau khi xác thực thành công với Azure, HRM kiểm tra email user có tồn tại trong hệ thống HRM không — ❌ Không tồn tại → trả về **403 Forbidden**

> **Action**: LaiNguyenTuanAnh + PhamNgocDao (UMC/CNTT) cung cấp thông tin theo yêu cầu trong email VNR gửi. VNR thiết lập kết nối SSO cho hệ thống phần mềm Nhân sự và bàn giao.

## Liên kết

- [[wiki/projects/UMC-Project]] — Dự án UMC tổng thể
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực HRM (OAuth2/OIDC IDS4)
- [[wiki/flows/p7m3k-flow-sso-microsoft-umc]] — Luồng SSO Microsoft chi tiết cho UMC
