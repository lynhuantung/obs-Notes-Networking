---
Mã:
aliases:
date: 2026-03-05
tags:
  - daily
  - "#hrm6"
  - "#troubleshooting"
  - "#nhatkyvande"
Project:
---
**Hiện trạng**  
Chức năng chạy tác vụ Attendance trên server mới không thực thi được `AttendanceConsole.exe` khi gọi bằng `Process.Start()`, trong khi server cũ vẫn chạy bình thường.

**Nguyên nhân**  
File `AttendanceConsole.exe` khi copy lên server đang ở trạng thái **bị Windows chặn (Blocked)**.  
Windows có cơ chế bảo mật: nếu file `.exe` được tải về hoặc copy từ máy khác, hệ điều hành có thể đánh dấu file là **không tin cậy**, khiến file không được phép chạy, đặc biệt khi được gọi từ IIS.

**Giải pháp**  
Mở **Properties** của file `AttendanceConsole.exe` → tại phần **Security** chọn **Unblock** → **Apply**.  
Sau khi bỏ trạng thái **Blocked**, chương trình có thể được IIS gọi và tác vụ chạy bình thường.