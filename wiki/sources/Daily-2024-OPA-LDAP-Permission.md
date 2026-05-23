---
type: source
description: "Ghi chú OPA, LDAP và phân quyền HRM tháng 8/2024: cache permission, debug và cấu hình xác thực."
tags:
  - opa
  - ldap
  - phan-quyen
  - cache
  - daily
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-Aug-31, 0.Daily/2024-Aug-32, 0.Daily/2024-Aug-33, 0.Daily/2024-Aug-34
related:
  - "[[wiki/sources/Daily-2024-Cache-Redis]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# Source: Daily 2024 — OPA, LDAP & Phân Quyền Nâng Cao

## Tóm tắt

Tổng hợp ghi chú Daily tháng 08/2024 về 3 chủ đề liên quan: (1) Dự án OPA — xử lý cache phân quyền chưa clear được API v3; (2) LDAP — cài đặt OpenLDAP trên Ubuntu, update LDAPDatasource cho user; (3) Phân quyền nghiệp vụ — thiết kế `sp_GetPermissionNew` theo EntityType để tách phân quyền NV/ứng viên/kiêm nhiệm/định biên/hợp đồng.

## Key Takeaways

### OPA — Cache phân quyền API v3
- **Vấn đề**: OPA dùng API v3 nhưng clear cache phân quyền chỉ chạy trên 4 pools chính (main/portal/hr/sys), bỏ qua **apiV3** → quyền danh mục không cập nhật sau khi sửa.
- **Fix**: Thêm clear cache gọi đến endpoint `/apiv3/api/cache/clear` — đồng bộ với 5-pool pattern đã thiết lập.
- **Debug flowchart**: Vẽ flowchart debug không cần pull DB về — kiểm tra cache tầng middleware trước khi hit DB.

### LDAP — OpenLDAP & KOG update
- **OpenLDAP cài trên Ubuntu**: `sudo apt install slapd ldap-utils` → `sudo dpkg-reconfigure slapd` → cấu hình DNS domain, org name, admin password.
- **Cấu trúc LDAP**: `ou=users,dc=example,dc=com` + `ou=groups,dc=example,dc=com` → add user qua LDIF file.
- **TLS/SSL**: `ldaps://` + cert OpenSSL → cấu hình `olcTLSCACertificateFile` trong slapd.
- **KOG update LDAP cho user**: SQL update `Sys_UserInfo` bật `IsCheckLDAP=1` + gán `LDAPDatasource` và `LdapConfigID` → sau khi update, user phải đăng nhập bằng tài khoản LDAP.
  ```sql
  UPDATE Sys_UserInfo
  SET IsCheckLDAP = 1, LDAPDatasource='10.0.0.13:389', LdapConfigID='...'
  WHERE IsDelete IS NULL AND LdapConfigID IS NULL
  ```
- **Lỗi login LDAP**: Nguyên nhân phổ biến: `IsDelete` trong `Sys_UserInfo` hoặc `Hre_Profile` — store `hrm_sys_sp_get_usersBy_UserPass` cần kiểm tra.

### Phân quyền theo EntityType
- **Vấn đề hiện tại**: Hàm phân quyền chung bị gọi cho nhiều nghiệp vụ khác nhau → khi sửa ảnh hưởng toàn hệ thống.
- **Giải pháp**: `sp_GetPermissionNew(@UserLogin, @TableName, @EntityType)` — rẽ nhánh theo EntityType:
  - `'Profile'` → phân quyền nhân viên (toàn hệ thống)
  - `'Candidate'` → phân quyền ứng viên
  - `'ConcurrentJob'` → phân quyền kiêm nhiệm
  - `'Contract'` → phân quyền hợp đồng
  - `'Staffing'` → phân quyền định biên (phòng ban, chức vụ → list staffing IDs)
- **Lợi ích**: Tách biệt trách nhiệm, dễ bảo trì, tối ưu hiệu suất (chỉ check quyền phạm vi cần thiết).
- **Pattern `Get_Data_Permission_New`** (đã dùng trong LTG): Gọi store vào temp table permission, JOIN vào query chính:
  ```sql
  DECLARE @tblPermission TABLE (id uniqueidentifier primary key)
  INSERT INTO @tblPermission EXEC Get_Data_Permission_New @Username, 'Ins_ProfileInsuranceMonthly';
  -- ... JOIN @tblPermission fcP ON fcP.Id = hp.ID
  ```

## Trích dẫn quan trọng

> **Câu hỏi Socrates về phân quyền**: "Đặt ra câu hỏi là có cần thiết phát sinh những nghiệp vụ phân quyền đó không? Những xử lý đó là phân quyền hay là nghiệp vụ? Hay do store phân quyền đang nhiều chỗ gọi, nên đang quy vào sửa vào đó để sau này khỏi sửa?"

> **Phân loại phân quyền**: Phân quyền nhân viên = hàm CHUNG (toàn hệ thống). Phân quyền ứng viên/kiêm nhiệm/định biên/hợp đồng = hàm NGHIỆP VỤ RIÊNG.

> **LDAP IsDelete bug**: "Nguyên nhân login không được: do IsDelete Sys_UserInfo hoặc IsDelete Hre_Profile của user đăng nhập. Bắt nguồn từ store hrm_sys_sp_get_usersBy_UserPass."

## Liên kết

- [[wiki/sources/Daily-2024-Cache-Redis]] — 5-pool cache clear + Task.Run HttpContext fix
- [[wiki/sources/LTG-SYS-Meetings-2024]] — Get_Data_PermissionConCurrent_New (kiêm nhiệm)
- [[wiki/concepts/HRM-Security-Config]] — VnrDecrypt, AllowOrigin, permission cache
- [[wiki/architecture/HRM-Auth-Architecture]] — LDAP trong kiến trúc xác thực tổng quan
