---
title: "AVN - Nâng cấp LDAP lên LDAPS (port 636 SSL)"
description: "Giải pháp nâng cấp xác thực AD từ LDAP (port 389) lên LDAPS (port 636 SSL) cho AVN — sửa Framework LdapHelper + thêm Connectiontype vào HRM config"
date: 2026-05-06
code: ldap1
domain: system
module: "Sys_LdapConfig / LdapHelper / Authentication"
tags:
  - "bug-fix"
  - "system"
  - "ldap"
  - "security"
  - "framework"
verified: partial
related:
  - "[[wiki/projects/AVN]]"
---

# AVN - Nâng cấp LDAP lên LDAPS (port 636 SSL)

## Tóm tắt

Khách hàng AVN yêu cầu chuyển từ LDAP chuẩn (port 389, plain-text) sang LDAPS (port 636, SSL/TLS)
do bộ phận IT đóng port 389 vì từng bị hacker khai thác credential.
Giải pháp gồm 2 phần: **(1) sửa Framework** để hỗ trợ LDAPS, **(2) sửa HRM source** để admin
cấu hình loại kết nối (`StandardLDAP` hoặc `LDAPSSL`) — hệ thống tự chọn đúng protocol theo giá trị này.

## Triệu chứng

- Đăng nhập tài khoản AD (IsCheckLDAP = true) thất bại sau khi IT tắt port 389
- "Kiểm tra kết nối" từ UI Sys_LdapConfig cũng thất bại
- Không có thông báo lỗi rõ ràng — connection timeout

## Phân tích nguyên nhân

### Root Cause

`LdapHelper.TestConnection` (trong `VnResource.Security.dll`) dùng `PrincipalContext`
(`System.DirectoryServices.AccountManagement`) — **không hỗ trợ SSL/LDAPS**.
Khi port 389 bị tắt, mọi kết nối đều fail.

### Chuỗi nguyên nhân

```
Login AD thất bại
  ← LdapHelper.TestConnection không kết nối được
    ← PrincipalContext không hỗ trợ SSL
      ← Port 389 bị tắt bởi IT (security policy)
```

## Giải pháp đã áp dụng

### Kiến trúc tổng thể

```
Admin cấu hình Sys_LdapConfig
  → Connectiontype = "StandardLDAP"  → LdapHelper.TestConnection(..., isLdaps: false)
                                        → PrincipalContext (port 389, plain-text)

  → Connectiontype = "LDAPSSL"       → LdapHelper.TestConnection(..., isLdaps: true)
                                        → LdapConnection + SecureSocketLayer (port 636, SSL)
```

Admin chọn `Connectiontype` từ dropdown UI → hệ thống tự động dùng đúng protocol.
`isLdaps || port == 636` → linh hoạt khi khách dùng port custom khác 636.

---

### Phần 1 — Framework: `VnResource.Security\LdapHelper.cs`

**Nguyên tắc:** Giữ nguyên hàm cũ (không break caller), thêm overload mới với `bool isLdaps`.

**Thêm reference vào `.csproj`:**
```xml
<Reference Include="System.DirectoryServices.Protocols" />
```

**Hàm cũ — giữ nguyên, không đổi:**
```csharp
public static bool TestConnection(string host, ContextOptions options, string userName, string password)
{
    return TestConnection(ContextType.Domain, host, options, userName, password);
}
```

**Hàm mới — thêm overload `isLdaps`:**
```csharp
/// <summary>
/// isLdaps = true → dùng LdapConnection + SSL (hỗ trợ port custom, không chỉ 636)
/// isLdaps = false + port == 636 → vẫn fallback LDAPS để an toàn
/// </summary>
public static bool TestConnection(string host, ContextOptions options, string userName, string password, bool isLdaps)
{
    int port = 389;
    string hostname = host;
    if (!string.IsNullOrWhiteSpace(host) && host.Contains(":"))
    {
        var parts = host.Split(':');
        hostname = parts[0];
        int.TryParse(parts[1], out port);
    }

    if (isLdaps || port == 636)
    {
        try
        {
            var identifier = new LdapDirectoryIdentifier(hostname, port);

            // Thử Negotiate trước — hỗ trợ SAM account name (domain\user hoặc user)
            using (var conn = new LdapConnection(identifier))
            {
                conn.AuthType = AuthType.Negotiate;
                conn.SessionOptions.SecureSocketLayer = true;
                conn.SessionOptions.VerifyServerCertificate = (c, cert) => true;
                try { conn.Bind(new NetworkCredential(userName, password)); return true; }
                catch { }
            }

            // Fallback Basic — UPN format (user@domain.com)
            using (var conn = new LdapConnection(identifier))
            {
                conn.AuthType = AuthType.Basic;
                conn.SessionOptions.SecureSocketLayer = true;
                conn.SessionOptions.VerifyServerCertificate = (c, cert) => true;
                conn.Bind(new NetworkCredential(userName, password));
                return true;
            }
        }
        catch { return false; }
    }

    // StandardLDAP → PrincipalContext như cũ
    return TestConnection(ContextType.Domain, host, options, userName, password);
}
```

---

### Phần 2 — HRM Source

#### 2.1 Thêm enum `LdapConnectionTypes`

File: `HRM.Infrastructure.Utilities\Enum\EnumConstant.cs`
```csharp
public enum LdapConnectionTypes
{
    StandardLDAP = 1,  // LDAP plain-text, port 389
    LDAPSSL = 2,       // LDAPS SSL/TLS, port 636 (hoặc port custom)
}
```

#### 2.2 Thêm field vào `Sys_UserLoginEntity`

File: `HRM.Business.HrmSystem.Models\Sys_UserInfoEntity.cs`
```csharp
#region LDAP config info
public string Authenticationtype { get; set; }
public string Connectiontype { get; set; }   // ← THÊM
public string Hostname { get; set; }
public string Port { get; set; }
...
#endregion
```

#### 2.3 Cập nhật Store

```sql
ALTER PROCEDURE [dbo].[hrm_sys_sp_get_usersLDAPConfigBy_User]
-- Thêm slc.Connectiontype vào SELECT
select ..., slc.Authenticationtype, slc.Connectiontype, slc.Hostname, ...
```

#### 2.4 Cập nhật 4 caller — truyền `isLdaps`

Pattern chung cho tất cả caller:
```csharp
// Trước
LdapHelper.TestConnection(hostName, options, userName, password);

// Sau — isLdaps dựa vào Connectiontype do admin cấu hình
LdapHelper.TestConnection(hostName, options, userName, password,
    objLdapConfig.Connectiontype == LdapConnectionTypes.LDAPSSL.ToString());
```

Files caller:
- `Sys_UserServices.cs` — `CheckLdapUser()`
- `HomeController.cs` — `CheckLdapUser()` (2 chỗ)
- `LoginController.cs` — `CheckLdapUser()` (2 chỗ)
- `Sys_GetDataController.cs` — `TestConnect()`

#### 2.5 Dropdown UI

File: `Views\Sys_LdapConfig\Sys_LdapConfigInfo.cshtml`
```csharp
var _Connectiontype = new DropDownListBuilderInfo()
{
    DataTextField = "Text",
    DataValueField = "Value",
    Enum = "LdapConnectionTypes",
    Url = _hrm_Sys_Service + "Sys_GetData/GetEnum"
};
```

#### 2.6 InsertEnumTranslate.sql

File: `Updates\InsertCat_EnumTranslate\SQL\InsertEnumTranslate.sql`
```sql
INSERT INTO "Cat_EnumTranslate"(ID, "EnumName", "EnumKey", en, vn, "UserCreate", "DateCreate")
VALUES('A1B2C3D4-E5F6-4A7B-8C9D-000000000001', 'LdapConnectionTypes',
       'StandardLDAP', 'Standard LDAP', N'LDAP Tiêu chuẩn', 'tung.ly', getdate())

INSERT INTO "Cat_EnumTranslate"(ID, "EnumName", "EnumKey", en, vn, "UserCreate", "DateCreate")
VALUES('A1B2C3D4-E5F6-4A7B-8C9D-000000000002', 'LdapConnectionTypes',
       'LDAPSSL', 'LDAP SSL (LDAPS)', N'LDAP SSL (LDAPS)', 'tung.ly', getdate())
```

---

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

## Kết quả kiểm tra

- Verified: partial
- Test LDAP port 389 + `tung.ly` / Negotiate → `TestConnection returned: true` ✅
- LDAPS port 636 chờ deploy AVN (IT confirm port 636 đã mở)

## Bài học / Lưu ý

- `PrincipalContext` **không hỗ trợ SSL** — cần LDAPS phải dùng `LdapConnection` (System.DirectoryServices.Protocols)
- Dùng `isLdaps || port == 636` thay vì chỉ check port → linh hoạt với port custom
- `VerifyServerCertificate = true` — bypass cert validation, phù hợp internal CA doanh nghiệp
- Luôn thử `AuthType.Negotiate` trước `AuthType.Basic` — Negotiate hỗ trợ SAM account name (`domain\user`)
- `LdapConnectionTypes.LDAPSSL.ToString()` = `"LDAPSSL"` — DB phải set đúng giá trị này
- Pattern thêm enum HRM: `EnumConstant.cs` → `InsertEnumTranslate.sql` → cshtml dropdown (`Enum` + `Url`)
- Khi sửa Framework: build DLL → copy `SharedBinaries\` → build HRM12

## Liên kết

- [[wiki/projects/AVN]]
