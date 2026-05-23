---
description: "Hướng dẫn tích hợp LDAP/Active Directory vào HRM: 4 bước cấu hình, bảng Sys_LdapConfig, multi-source LDAP và kết hợp user LDAP+thường."
type: source
domain: system
tags:
  - sys
  - ldap
  - authentication
  - active-directory
  - sso
created: 2026-04-27
updated: 2026-04-27
source-file: raw/Nghiệp vụ HRM/SYS/Sys_TaiLieuLDAP_03.md
related:
  - "[[wiki/flows/Flow-LDAP-Login]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/sources/Sys-TaiLieuHeThong-01]]"
---

# Source: Tài Liệu LDAP HRM — Module SYS (03)

## Tóm tắt

Tài liệu hướng dẫn tích hợp **LDAP/Active Directory** vào HRM Pro, viết bởi Tung.Ly vào 06/2021. Mô tả 4 bước cấu hình (webconfig → tạo LDAP source → lấy user từ LDAP → đăng nhập), cấu trúc bảng `Sys_LdapConfig` với các field kết nối (server, port, BaseDN, auth type), và workflow xác thực đăng nhập LDAP. Hỗ trợ multi-source LDAP (nhiều domain), kết hợp user LDAP và user thường cùng lúc.

## Key Takeaways

- **4 bước cấu hình LDAP**: (1) bật `IsLdapSignIn=true` + cấu hình `LdapSignInSource` trong webconfig main & portal; (2) tạo LDAP source config tại *Hệ thống > Cấu hình nguồn LDAP*; (3) tạo tài khoản LDAP từ màn hình *Người dùng > Tạo mới từ tài khoản tích hợp*; (4) đăng nhập
- **Bảng `Sys_LdapConfig`**: lưu cấu hình kết nối LDAP — `ServerType`, `ConnectionType` (Standard/SSL), `HostName`, `Port` (default 389), `AuthenticationType` (Anonymous/Simple), `AuthorizedUser`, `Password`, `BaseDN`
- **LdapSignInSource**: danh sách domain LDAP phân cách bởi dấu phẩy (vd: `@abc.com.vn,`). Nếu rỗng → tất cả user đều có thể chọn nguồn LDAP
- **Multi-source**: hỗ trợ nhiều nguồn LDAP, từng user được liên kết với 1 `LdapConfigID` cụ thể (FK trong `Sys_UserInfo`)
- **Kết hợp user LDAP + user thường**: khi tạo user, nếu không chọn cấu hình LDAP → hiểu là user thường; cả 2 loại có thể tồn tại song song

## Trích dẫn quan trọng

> **LdapSignInSource**: khi có nhiều nguồn LDAP thì cấu hình vào đây các nguồn LDAP. Có thể đặt rỗng.

> **BaseDN**: Enter the Base DN for the subtree to synchronize. Don't include spaces between commas. Example: `ou=test,ou=sales,ou=melbourne,dc=ad,dc=example,dc=com`

> Có thể tạo tài khoản LDAP từ tạo mới người dùng. Nếu không chọn cấu hình như hình dưới sẽ hiểu là user thường.

## Liên kết

- [[wiki/flows/Flow-LDAP-Login]] — Workflow đăng nhập LDAP step-by-step
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực tổng thể
- [[wiki/concepts/HRM-Security-Config]] — Webconfig keys liên quan LDAP
- [[wiki/sources/Sys-TaiLieuHeThong-01]] — Schema Sys_UserInfo (IsCheckLDAP, LdapConfigID)
- [[wiki/sources/Daily-2024-OPA-LDAP-Permission]] — Cài OpenLDAP trên Ubuntu thực tế
