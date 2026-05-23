---
type: source
code: ldap1
description: "Giải pháp nâng cấp xác thực AD từ LDAP (port 389) lên LDAPS (port 636 SSL) cho AVN — sửa Framework LdapHelper + thêm Connectiontype vào HRM config"
domain: system
tags:
  - avn
  - ldap
  - ldaps
  - security
  - authentication
  - bug-fix
  - framework
created: 2026-05-06
updated: 2026-05-06
source-file: raw/Nghiệp vụ HRM/SYS/ldap1-avn-nang-cap-ldap-len-ldaps-port-636-ssl-2026-05-06.md
related:
  - "[[wiki/projects/AVN-Project]]"
  - "[[wiki/sources/AVN-LDAP-BaoMat-PhanTich]]"
  - "[[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# Source: AVN — Triển khai LDAPS (port 636 SSL) — Implementation

## Tóm tắt

Tài liệu ghi nhận toàn bộ giải pháp kỹ thuật nâng cấp xác thực AD từ LDAP plain-text (port 389) sang LDAPS SSL/TLS (port 636) cho khách hàng AVN (2026-05-06). Giải pháp gồm 2 phần: **(1) sửa Framework** `VnResource.Security\LdapHelper.cs` — thêm overload `TestConnection(..., bool isLdaps)` dùng `LdapConnection` + `SecureSocketLayer`; **(2) sửa HRM source** — thêm enum `LdapConnectionTypes` (StandardLDAP / LDAPSSL), dropdown UI, field `Connectiontype` trong entity + store, và cập nhật 4 caller truyền `isLdaps`. Admin cấu hình `Connectiontype` từ UI → hệ thống tự chọn đúng protocol. Đây là **giải pháp tiếp nối** phân tích từ [[wiki/sources/AVN-LDAP-BaoMat-PhanTich]] (2026-05-04).

## Key Takeaways

- **Root cause**: `PrincipalContext` (`System.DirectoryServices.AccountManagement`) không hỗ trợ SSL — phải dùng `LdapConnection` (`System.DirectoryServices.Protocols`) cho LDAPS
- **Nguyên tắc backward-compatible**: Giữ nguyên hàm cũ 4 tham số, thêm overload mới với `bool isLdaps` — caller cũ không bị break
- **isLdaps || port == 636**: Detect LDAPS qua flag tường minh HOẶC port number — linh hoạt với port custom
- **AuthType.Negotiate trước Basic**: Negotiate hỗ trợ SAM account name (`domain\user`) — format HRM đang dùng; Basic yêu cầu UPN (`user@domain.com`)
- **VerifyServerCertificate = true**: Bypass cert validation — phù hợp internal CA doanh nghiệp, không cần import cert
- **`LdapConnectionTypes.LDAPSSL.ToString()` = `"LDAPSSL"`**: DB và code phải khớp đúng giá trị string này
- **Pattern enum HRM**: `EnumConstant.cs` → `InsertEnumTranslate.sql` → cshtml dropdown (`Enum` + `Url`)
- **Khi sửa Framework**: build DLL → copy `SharedBinaries\` → build HRM12 (thứ tự bắt buộc)

## Trích dẫn quan trọng

> **Kiến trúc tổng thể:**
> ```
> Connectiontype = "StandardLDAP" → LdapHelper.TestConnection(..., isLdaps: false)
>                                  → PrincipalContext (port 389, plain-text)
> Connectiontype = "LDAPSSL"      → LdapHelper.TestConnection(..., isLdaps: true)
>                                  → LdapConnection + SecureSocketLayer (port 636, SSL)
> ```

> **Hàm mới Framework** — overload `isLdaps`:
> ```csharp
> if (isLdaps || port == 636) {
>     // Negotiate trước → Basic fallback, cả 2 dùng SecureSocketLayer = true
> }
> return TestConnection(ContextType.Domain, host, options, userName, password); // cũ
> ```

> **Pattern caller HRM12:**
> ```csharp
> LdapHelper.TestConnection(hostName, options, userName, password,
>     objLdapConfig.Connectiontype == LdapConnectionTypes.LDAPSSL.ToString());
> ```

> ⚠️ **Confirmed (2026-05-04 → fixed 2026-05-06)**: HRM trước đây chưa có xử lý LDAPS. Nay đã implement đầy đủ ở Framework + HRM source.

## Files đã thay đổi

| File | Thay đổi |
|------|---------|
| `VnResource.Security\LdapHelper.cs` | Thêm overload `TestConnection(..., bool isLdaps)` |
| `VnResource.Security.csproj` | Thêm reference `System.DirectoryServices.Protocols` |
| `HRM.Infrastructure.Utilities\Enum\EnumConstant.cs` | Thêm enum `LdapConnectionTypes` |
| `HRM.Business.HrmSystem.Models\Sys_UserInfoEntity.cs` | Thêm `Connectiontype` vào `Sys_UserLoginEntity` |
| `HRM.Business.System.Domain\Sys_UserServices.cs` | `CheckLdapUser()` truyền `isLdaps` |
| `HomeController.cs` | `CheckLdapUser()` truyền `isLdaps` (2 chỗ) |
| `LoginController.cs` | `CheckLdapUser()` truyền `isLdaps` (2 chỗ) |
| `Sys_GetDataController.cs` | `TestConnect()` truyền `isLdaps` |
| `Sys_LdapConfigInfo.cshtml` | Dropdown Connectiontype có data |
| `InsertEnumTranslate.sql` | Thêm 2 dòng `LdapConnectionTypes` |
| Store `hrm_sys_sp_get_usersLDAPConfigBy_User` | Thêm `slc.Connectiontype` vào SELECT |

## Deploy checklist cho AVN

```
1. Build VnResource.Security.dll từ Framework-Git
2. Copy DLL vào HRM12\SharedBinaries\
3. Build + deploy HRM12 lên server AVN
4. Chạy InsertEnumTranslate.sql (2 dòng LdapConnectionTypes)
5. UPDATE Sys_LdapConfig SET Port='636', Connectiontype='LDAPSSL' WHERE ConnectName='ldap avn'
6. Test "Kiểm tra kết nối" từ UI → expect success
7. Test login tài khoản AD
```

## Liên kết

- [[wiki/projects/AVN-Project]] — Dự án AVN
- [[wiki/sources/AVN-LDAP-BaoMat-PhanTich]] — Phân tích bảo mật LDAP/LDAPS (tiền đề)
- [[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]] — Câu hỏi ban đầu: HRM hỗ trợ LDAPS chưa?
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực tổng thể
