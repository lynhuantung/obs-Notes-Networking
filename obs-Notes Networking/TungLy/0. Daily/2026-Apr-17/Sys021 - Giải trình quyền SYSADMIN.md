---
Mã: Sys021
aliases:
date: 2025-09-25
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys005 - Login lỗi 500 CLR]]"
  - "[[Sys020 - Mật khẩu VnrDecrypt thay đổi không]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Giải trình quyền SYSADMIN

**Vấn đề:** Giải trình việc cấp quyền SYSADMIN trong SQL Server
- Một số thao tác trong quá trình triển khai hệ thống (như bật CLR, tạo Assembly mã hóa dữ liệu, ký chứng chỉ xác thực) yêu cầu **quyền sysadmin** trong SQL Server.
- Điều này khiến khách hàng thắc mắc **vì sao phải cấp quyền sysadmin**, thay vì dùng quyền `db_owner` thông thường.

**Hiện trạng:**
- Khi triển khai hoặc restore database, hệ thống HRM có sử dụng các hàm CLR như `dbo.VnrDecrypt`.
- Các hàm này chỉ hoạt động khi cấu hình `clr enabled` được bật và assembly được nạp vào SQL Server.
- Tuy nhiên, thao tác này yêu cầu thay đổi cấu hình cấp **máy chủ (server level)**, vượt quá quyền hạn của `db_owner`.

**Nguyên nhân:**
- **SQL Server từ phiên bản 2017** trở đi bật mặc định **`clr strict security = 1`**, yêu cầu mọi assembly phải được ký chứng chỉ tin cậy hoặc được nạp bởi **sysadmin**.
- Các thao tác sau là **server-scope commands**, chỉ thực hiện được bởi **sysadmin**:
  - `sp_configure 'clr enabled'`, `RECONFIGURE`
  - `CREATE ASSEMBLY`, `CREATE ASYMMETRIC KEY`, `CREATE LOGIN FROM ASYMMETRIC KEY`

**Phương án:**

**A. Giai đoạn cần sysadmin:**
1. Khi **cài đặt mới hoặc nâng cấp hệ thống**:
   - Bật cấu hình CLR: `sp_configure 'clr enabled', 1; RECONFIGURE;`
   - Tạo/ký assembly để nạp DLL mã hóa (`VnResource.DatabaseClr.dll`).
   - Đăng ký các hàm CLR như `dbo.VnrDecrypt`.
2. Khi **restore database**: Kích hoạt lại CLR và nạp lại assembly để hàm hoạt động.

➡️ Sau khi hoàn tất, **thu hồi quyền sysadmin ngay**.

**B. Giai đoạn vận hành (user thông thường):**
- Ứng dụng chỉ cần quyền `EXECUTE` để sử dụng hàm CLR:
  ```sql
  GRANT EXECUTE ON dbo.VnrDecrypt TO [AppUser];
  ```
- Người dùng không cần sysadmin vẫn có thể gọi hàm mã hóa/giải mã trong nghiệp vụ hằng ngày.

**C. Cam kết bảo mật:**
- Không cấp quyền sysadmin cho người dùng ứng dụng.
- Chỉ cấp sysadmin tạm thời cho tài khoản triển khai.
- Ghi log toàn bộ thao tác và thu hồi sau khi hoàn tất.
- Tuân thủ nguyên tắc **"Least Privilege"** – chỉ cấp quyền tối thiểu cần thiết.
