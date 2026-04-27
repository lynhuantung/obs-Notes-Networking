---
type: flow
domain: system
tags:
  - sys
  - ldap
  - active-directory
  - authentication
  - flow
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/sources/Sys-TaiLieuLDAP-03]]"
  - "[[wiki/sources/Daily-2024-OPA-LDAP-Permission]]"
---

# Flow: Đăng Nhập LDAP / Active Directory HRM

Quy trình cấu hình và đăng nhập LDAP trong HRM Pro 8.

---

## Luồng cấu hình LDAP (1 lần setup)

```mermaid
flowchart TD
    Start([Admin setup LDAP]) --> Step1[Bước 1: Cấu hình webconfig\nIsLdapSignIn=true\nLdapSignInSource=@domain.com]
    Step1 --> Step2[Bước 2: Tạo LDAP Source\nHệ thống > Cấu hình nguồn LDAP\nHost, Port, BaseDN, AuthType...]
    Step2 --> MultiLDAP{Nhiều nguồn\nLDAP?}
    MultiLDAP -- Có --> AddMore[Tạo thêm nguồn LDAP\nThêm domain vào LdapSignInSource]
    AddMore --> Step3
    MultiLDAP -- Không --> Step3

    Step3[Bước 3: Tạo tài khoản LDAP\nHệ thống > Người dùng\n> Tạo mới từ tài khoản tích hợp] --> SelectSource[Chọn nguồn LDAP\nTìm và chọn user từ AD]
    SelectSource --> AssignGroup[Gán nhóm quyền\ncho user LDAP]
    AssignGroup --> Done([LDAP setup hoàn tất])
```

---

## Luồng đăng nhập LDAP (runtime)

```mermaid
flowchart TD
    Login([User nhập\ntên đăng nhập]) --> CheckSource{LdapSignInSource\nđược cấu hình?}
    CheckSource -- Có --> ShowDomain[Hiển thị dropdown\nchọn nguồn LDAP]
    CheckSource -- Không --> DirectLogin[Đăng nhập trực tiếp]

    ShowDomain --> SelectDomain[User chọn domain]
    SelectDomain --> CheckUserType

    DirectLogin --> CheckUserType{User type?\nLDAP hay thường?}
    CheckUserType -- "User thường" --> LocalAuth[Xác thực local\nso sánh password hash]
    CheckUserType -- "User LDAP\n(IsCheckLDAP=true)" --> LDAPAuth

    LDAPAuth[Kết nối tới LDAP Server\nqua LdapConfigID] --> BindLDAP{Bind LDAP\nthành công?}
    BindLDAP -- Không --> AuthFail([Lỗi đăng nhập LDAP])
    BindLDAP -- Có --> CheckActive{User IsActivate\ntrong HRM?}

    LocalAuth --> CheckActive
    CheckActive -- Không --> InactiveFail([Tài khoản bị vô hiệu])
    CheckActive -- Có --> LoadPermission[Load nhóm quyền\nLoad phân quyền dữ liệu]
    LoadPermission --> CreateSession[Tạo session/token]
    CreateSession --> Home([Trang chủ])
```

---

## Cấu hình Sys_LdapConfig

| Field | Mô tả | Ví dụ |
|-------|-------|-------|
| ServerType | Loại LDAP server | Active Directory |
| ConnectionType | Standard LDAP hoặc LDAP+SSL | Standard LDAP |
| HostName | Domain hoặc IP của LDAP server | `ad.example.com` |
| Port | Cổng kết nối (default 389) | `389` |
| AuthenticationType | Anonymous hoặc Simple | Simple |
| AuthorizedUser | User có quyền đọc toàn bộ subtree | `admin1` |
| Password | Password của authorized user | (encrypted) |
| BaseDN | Base DN của subtree cần sync | `ou=sales,dc=ad,dc=example,dc=com` |

---

## Webconfig keys LDAP

```xml
<add key="IsLdapSignIn" value="true"/>
<add key="LdapSignInSource" value="@thaco.com.vn,@vinamazda.vn,"/>
```

- `IsLdapSignIn`: bật/tắt tính năng LDAP
- `LdapSignInSource`: danh sách domain phân cách bởi dấu phẩy; nếu rỗng → không hiện dropdown chọn domain

---

## Liên kết

- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực tổng thể: JWT, SSO, LDAP
- [[wiki/sources/Sys-TaiLieuLDAP-03]] — Tài liệu gốc LDAP
- [[wiki/sources/Daily-2024-OPA-LDAP-Permission]] — Cài OpenLDAP Ubuntu thực tế
- [[wiki/architecture/HRM-SysDB-Schema]] — Schema Sys_UserInfo (IsCheckLDAP, LdapConfigID)
