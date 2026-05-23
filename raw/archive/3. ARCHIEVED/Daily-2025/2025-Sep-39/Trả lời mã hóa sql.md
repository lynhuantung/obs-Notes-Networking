---
Mã: 25093925-01
aliases:
date: 2025-09-25
time: 10:19
Week: "39"
tags:
  - daily
  - "#security"
---
```sql
select dbo.VnrDecrypt('spdIziW5u8AeB2Ed8nG/fA==')
```


**Câu hỏi**: Nếu vậy phần pass giải mã bên mình thay đổi được không anh?
**Trả lời**: Không thay đổi được, Pass giải mã được nhúng sẵn trong DLL và mỗi source có pass riêng. Nếu thay đổi pass thì dữ liệu đã mã hoá trước đó sẽ không giải mã được nữa → mất toàn vẹn. Muốn đổi thì phải re-encrypt lại toàn bộ dữ liệu trong db.
    

-- Thông tin thêm ---

Hệ thống đang mã hoá dữ liệu bằng thuật toán SHA2-512.

Một mật khẩu cố định được nhúng sẵn trong DLL framework (ngay cả lập trình viên cũng không biết).

Ngoài ra, mỗi source có một mật khẩu riêng để tăng cường bảo mật.

Khi build ra assembly đưa vào sql, mật khẩu cố định này được dùng cho việc giải mã.

  
Lưu ý: mật khẩu giải mã đã gắn cứng trong DLL và mỗi source có pass riêng. Nếu thay đổi pass thì toàn bộ dữ liệu đã mã hoá trước đó sẽ không còn giải mã được, dẫn đến mất toàn vẹn dữ liệu.