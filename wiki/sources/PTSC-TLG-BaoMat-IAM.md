---
description: "Yêu cầu bảo mật tích hợp PTSC: OAuth2.0, OIDC, mTLS, IAM/SSO (Entra ID/AD/Keycloak/ADFS/LDAP), scope/role per client cho từng hệ thống tích hợp."
type: source
code: w4b8
tags:
  - "ptsc"
  - "bao-mat"
  - "iam"
  - "oauth2"
  - "sso"
domain: system
created: 2026-04-30
updated: 2026-04-30
source-file: raw/0. Daily/TaiLieuGiaiPhap/s3g-*, s3.3-CDC-KhoaChinh-BaoMat-IAM
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# Source: PTSC TaiLieuGiaiPhap — §3 Bảo Mật Tích Hợp & IAM

## Tóm tắt

Phần §3.5 của tài liệu giải pháp PTSC quy định yêu cầu bảo mật tích hợp: OAuth2.0/OIDC, mTLS cho API, tích hợp IAM/SSO hiện hữu (Entra ID/AD/Keycloak/ADFS/LDAP), và cấu hình scope/role per client. VnResource cam kết đáp ứng đầy đủ theo mô hình IdP–SP, hỗ trợ token-based access control cho từng hệ thống tích hợp (ETL, ESB, Data Platform).

## Key Takeaways

- **OAuth2.0 + OIDC + mTLS:** 3 cơ chế bảo mật API bắt buộc — mTLS cho môi trường yêu cầu bảo mật cao
- **IAM/SSO hiện hữu:** Entra ID, Active Directory, Keycloak, ADFS, LDAP — theo mô hình IdP–SP
- **Scope/Role per client:** mỗi integration client (ETL/ESB/Data Platform) có scope và role riêng — RBAC theo môi trường (DEV/UAT/PROD)
- **Token-based:** JWT access token cấp qua IAM provider — vòng đời token theo chính sách IAM tập trung
- Tích hợp với HRM qua cơ chế SSO đã có sẵn: Identity Server 4 (V6), JWT SSO (V8)

## Trích dẫn quan trọng

> Phần mềm (Vnresource) hỗ trợ **tích hợp với các nền tảng IAM/SSO hiện có** thông qua các chuẩn xác thực phổ biến như **OAuth2.0, OpenID Connect, SAML2.0 hoặc LDAP**, cho phép cấp **token truy cập dịch vụ (access token)**.

> Hệ thống hỗ trợ cấu hình **scope/role cho từng client tích hợp**, bao gồm giới hạn phạm vi truy cập API, giới hạn loại dữ liệu được phép truy xuất hoặc cập nhật theo từng môi trường (DEV/UAT/PROD).

## Liên kết

- [[wiki/architecture/HRM-Auth-Architecture]] — JWT SSO, Identity Server 4, RBAC
- [[wiki/sources/Daily-2024-SSO-Auth]] — SSO patterns 2024 (Okta, Azure AD, ADFS)
- [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] — §3 CDC, luồng 2 chiều
- [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] — §4 bảo mật lớp ứng dụng/DB
