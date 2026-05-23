---
description: "Nghiên cứu SSO cho HRM: 3 giao thức SAML/OAuth2-OIDC/LDAP, hướng dẫn Okta và kiến trúc SSO trên 3 surface Web Main, Portal, Mobile App."
type: source
code: m2ks
tags:
  - "sso"
  - "oauth2"
  - "openid"
  - "okta"
  - "saml"
  - "ldap"
  - "system"
domain: system
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/flows/Flow-LDAP-Login]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
  - "[[wiki/sources/HongNgoc-DanhGia-SSO]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# Source: SSO HRM — Giao Thức & Ứng Dụng

## Tóm tắt

Bộ 10 file nghiên cứu SSO được tạo từ tháng 12/2024 trong Area vault — ghi lại kiến thức về Single Sign-On áp dụng cho hệ thống HRM. Nội dung bao gồm: khái niệm SSO, 3 giao thức chính (SAML/OAuth2-OIDC/LDAP), hướng dẫn chi tiết tích hợp Okta (SAML2/OIDC), và kiến trúc SSO trong 3 surface HRM (Web Main, Web Portal, Mobile App). Đây là nền tảng lý thuyết bổ trợ cho các case thực tế như HongNgoc JWT SSO và VnPay Identity Server 4.

## Key Takeaways

- **3 giao thức SSO** HRM dùng: SAML (doanh nghiệp lớn), **OpenID Connect/OAuth2** (web/mobile — HRM đang dùng chính), LDAP (mạng nội bộ Active Directory)
- **Okta** là IdP phổ biến: hỗ trợ SAML2, OIDC, OAuth2 — flow: User → SP → Okta IdP → Token → SP
- **3 surface HRM cần SSO riêng**: Web Main (quản trị HR), Web Portal (nhân viên tự phục vụ), Mobile App
- **Cấu hình Okta**: Client ID + Client Secret + Issuer URL (`https://<okta_domain>/oauth2/default`) + Redirect URI
- **Lỗi phổ biến Okta**: sai Redirect URI hoặc Client Secret → không đăng nhập được; đồng hồ lệch → lỗi token
- **Bảo mật Okta**: bật MFA, IP Whitelisting, Audit Logs trong Admin Console
- Các file Microsoft, Identity, Google, SSO web main/portal/mobile là **stub chưa có nội dung** — cần bổ sung khi có case thực tế

## Trích dẫn quan trọng

> Single Sign-On (SSO) là phương thức xác thực cho phép người dùng đăng nhập một lần để truy cập vào nhiều ứng dụng mà không cần đăng nhập lại.

> HRM đang dùng giao thức OpenID ([[SSO Ứng dụng HRM]])

> OAuth 2.0/OpenID Connect (phổ biến cho ứng dụng web/mobile). SAML (dùng trong doanh nghiệp). LDAP (kết hợp với SSO trong mạng nội bộ).

## So sánh giao thức

| Giao thức | Dùng khi | Ví dụ HRM |
|-----------|----------|-----------|
| SAML 2.0 | Doanh nghiệp lớn, enterprise IdP | Colgate (Okta SAML), ADFS (FIT) |
| OpenID Connect/OAuth2 | Web/mobile hiện đại | VnPay IDS4, HongNgoc JWT |
| LDAP | Mạng nội bộ Active Directory | AVN LDAPS, các dự án on-premise |

## Liên kết

- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc 3 mô hình auth: Local, JWT SSO, IDS4
- [[wiki/flows/Flow-LDAP-Login]] — Luồng đăng nhập LDAP chi tiết
- [[wiki/sources/Daily-2024-SSO-Auth]] — SSO patterns 2024: Okta OIDC (Colgate), Azure AD, ADFS (FIT)
- [[wiki/sources/HongNgoc-DanhGia-SSO]] — Case study JWT SSO HongNgoc
- [[wiki/projects/VnPay-Project]] — Case study Identity Server 4 + OIDC
