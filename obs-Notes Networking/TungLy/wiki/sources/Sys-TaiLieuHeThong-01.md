---
type: source
domain: system
tags:
  - sys
  - db-schema
  - security
  - webconfig
  - permission
  - password
created: 2026-04-27
updated: 2026-04-27
source-file: raw/Nghiệp vụ HRM/SYS/Sys_TaiLieuHeThong_01.md
related:
  - "[[wiki/architecture/HRM-SysDB-Schema]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/flows/Flow-ResetPassword]]"
  - "[[wiki/flows/Flow-PhanQuyen-HeThong]]"
---

# Source: Tài Liệu Hệ Thống HRM — Module SYS (01)

## Tóm tắt

Tài liệu kỹ thuật đầy đủ nhất về **Module Hệ Thống (SYS)** của VnResource HRM Pro 8, được tạo từ 05/2016 và cập nhật 02/2018 bởi Tung.Ly và Ngan.Nguyen. Mô tả cấu trúc 8 bảng DB cốt lõi (`Sys_UserInfo`, `Sys_Resource`, `Sys_Group`, `Sys_GroupPermission2`, `Sys_DataPermission`, `Sys_AllSetting`, `Sys_UserApprove`…), UML class/use-case/activity diagram, toàn bộ webconfig keys (~50+ keys), và quy trình bảo mật đăng nhập/đổi mật khẩu/quên mật khẩu. Là tài liệu gốc thiết kế hệ thống phân quyền HRM từ thời .NET Framework, vẫn còn nguyên giá trị tham chiếu về cấu trúc DB và logic nghiệp vụ phân quyền.

## Key Takeaways

- **8 bảng DB SYS cốt lõi**: `Sys_UserInfo` (user + LDAP config), `Sys_Resource`/`Sys_ResourceAll` (tài nguyên), `Sys_Group`/`Sys_GroupPermission2` (nhóm quyền + PrivilegeNumber: View/Create/Edit/Delete/Export…), `Sys_DataPermission` (phân quyền dữ liệu theo OrgStructure/WorkPlace/EmployeeType), `Sys_AllSetting` (cấu hình module), `Sys_UserApprove` (phê duyệt)
- **PrivilegeNumber (int)** trong `Sys_GroupPermission2` mã hóa bitwise 8 quyền: View, Create, Edit, Delete, Export, Import, Create Template, Change Column
- **Sys_DataPermission** lưu phân quyền dữ liệu nhân viên theo phòng ban (`OrgStructure`), nơi làm việc (`WorkPlace`), loại nhân viên (`EmployeeType`), vị trí, bậc lương, nhóm lương, loại hợp đồng — rất chi tiết
- **50+ webconfig keys** — quan trọng nhất: `IsLdapSignIn`, `SessionTimeOut`, `TimeExpireToken`, `ModeProfilerLog` (ALL/None/Error), `IsEncryptData`, `UseRedisServer`, `AllowAnonymousRequest`
- **Bảo mật password**: cấu hình 9 tham số (captcha, buộc đổi lần đầu, chu kỳ đổi, độ phức tạp, số lần sai/khóa); force reset toàn bộ user bằng cách UPDATE `DateChangePasssword` + `DatePasswordExpired` về ngày cũ
- **Quên mật khẩu**: 4 bước (nhập username → xác nhận link email → nhận pass mới); cần tạo 2 mail template: `E_Confirm_Reset_Password` + `E_NOTIFYRESETPASSWORD`
- **Enum mail**: 3 loại enum (`E_NOTIFYRESETPASSWORD`, `E_Confirm_Reset_Password`, `E_NOTIFYUSERPASS`) với các biến `E_UserInfoName`, `E_UserLogin`, `E_Password`, `E_ConfirmedMailLink`
- **Superadmin**: có thể đặt đại diện superadmin qua keys `UserName`/`Password`/`UserLoginName`/`UserId` trong webconfig (dùng cho system service)

## Trích dẫn quan trọng

> **PrivilegeNumber**: int — Quyền View, Create, Edit, Delete, Export, Import, Create Template, Change Column
> *(Sys_GroupPermission2)*

> **Sys_DataPermission.OrgStructure**: varchar(8000) — orderNumber
> *(lưu danh sách orderNumber phòng ban dạng chuỗi, không phải FK trực tiếp)*

> **ModeProfilerLog**: Ghi log request — ALL: ghi tất cả request | None (mặc định): tắt | Error: chỉ ghi request lỗi (status ≠ 200)

> **Force reset password toàn bộ user**: Sử dụng thêm cấu hình đổi mật khẩu theo chu kỳ → Update toàn bộ dữ liệu 2 cột `DateChangePasssword` và `DatePasswordExpired` về giá trị ngày nhỏ hơn ngày hiện tại.

> **Khi không nhấn link xác nhận từ email**: hệ thống sẽ không gửi lại email reset password. Password sẽ không được khôi phục.

## Liên kết

- [[wiki/architecture/HRM-SysDB-Schema]] — Schema chi tiết 8 bảng SYS
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực, LDAP, JWT
- [[wiki/concepts/HRM-Security-Config]] — Webconfig keys, bảo mật hệ thống
- [[wiki/flows/Flow-ResetPassword]] — Quy trình quên/reset mật khẩu
- [[wiki/flows/Flow-PhanQuyen-HeThong]] — Quy trình phân quyền SYS
