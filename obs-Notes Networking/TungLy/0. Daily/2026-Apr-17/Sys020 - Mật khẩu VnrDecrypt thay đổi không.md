---
Mã: Sys020
aliases:
date: 2025-09-25
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys005 - Login lỗi 500 CLR]]"
  - "[[Sys021 - Giải trình quyền SYSADMIN]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Mật khẩu VnrDecrypt thay đổi được không

**Vấn đề:** Mật khẩu giải mã (VnrDecrypt) có thể thay đổi hay không
- Khách hàng hỏi mật khẩu giải mã có thể thay đổi được không?
- Ví dụ: `select dbo.VnrDecrypt('spdIziW5u8AeB2Ed8nG/fA==')`

**Hiện trạng:**
- Hệ thống đang mã hoá dữ liệu bằng thuật toán SHA2-512.
- Một mật khẩu cố định được nhúng trong DLL framework, lập trình viên cũng không biết giá trị này.
- Ngoài ra, mỗi source có một mật khẩu riêng để tăng cường bảo mật.
- Khi build ra assembly và tạo function cho sql sử dụng, mật khẩu cố định được dùng cho việc giải mã.

**Nguyên nhân:**
- Mật khẩu được gắn cứng trong DLL và đi theo từng source.
- Nếu thay đổi mật khẩu thì toàn bộ dữ liệu đã mã hoá trước đó sẽ không còn giải mã được, dẫn đến mất toàn vẹn dữ liệu.

**Phương án:**
**Giữ nguyên thiết kế hiện tại**
- **Mô tả:** Mật khẩu giải mã được nhúng cứng trong DLL và source.
- **Ưu điểm:** Bảo mật cao, ít rủi ro thay đổi.
- **Nhược điểm:** Không thể thay đổi mật khẩu sau khi dữ liệu đã mã hoá.
