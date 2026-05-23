---
type: source
description: "Bảo mật HRM 2024: vá lỗ hổng XSS, SQL injection, broken access control theo tiêu chuẩn MISA."
tags:
  - security
  - xss
  - sql-injection
  - broken-access-control
  - bao-mat
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-Jun-23/Bảo mật HRM - Misa.md
related:
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/concepts/HRM-Code-Quality]]"
---

# Source: Daily 2024 — Security Fixes (XSS, SQLi, BAC)

## Tóm tắt

Ghi chú từ tháng 06/2024 về 3 lỗ hổng bảo mật phát hiện trong HRM khi tích hợp với MISA: XSS trên lưới hiển thị (grid), SQL Injection trong store procedures, và Broken Access Control (GetUserList, GetEnum không kiểm tra quyền). Đây là kết quả của audit bảo mật chủ động trước khi go-live.

## Key Takeaways

- **XSS trên lưới (Grid)**: Dữ liệu từ DB hiển thị trực tiếp lên grid mà không HTML encode → attacker có thể nhúng `<script>` vào tên nhân viên/ghi chú. Fix: encode output trước khi render.
- **SQL Injection trong store**: Một số store procedures nối chuỗi động (`EXEC('SELECT ... WHERE name = ''' + @param + '''`) → Fix: dùng `sp_executesql` với tham số hóa, hoặc bỏ dynamic SQL.
- **Broken Access Control**:
  - `GetUserList`: Trả về toàn bộ user khi không có quyền lọc → cần kiểm tra permission trước khi return
  - `GetEnum`: Trả về enum hệ thống khi chưa đăng nhập → cần require auth token
- **Bảo mật tự động**: Một số fix được chuẩn hóa thành middleware/attribute để áp dụng toàn hệ thống thay vì fix từng store/endpoint.
- **Liên kết với Kaizen**: SQL injection store được đưa vào danh sách Kaizen tái cấu trúc store procedures.

## Trích dẫn quan trọng

> **XSS fix pattern**: Thay vì render thẳng `data.Name`, dùng `HtmlEncode(data.Name)` hoặc escape tại tầng ORM trước khi đẩy xuống grid Kendo UI.

> **SQL Injection pattern nguy hiểm:**
> ```sql
> EXEC('SELECT * FROM Cat_Employee WHERE FullName LIKE ''' + @keyword + '''')
> ```
> Fix: Dùng `sp_executesql @sql, N'@keyword NVARCHAR(200)', @keyword = @keyword`

> **Broken Access Control GetEnum**: API `/api/enum/get-all` trả về tất cả enum kể cả khi request không có Bearer token → cần thêm `[Authorize]` attribute.

## Liên kết

- [[wiki/concepts/HRM-Security-Config]] — VnrDecrypt, AllowOrigin, permission cache
- [[wiki/concepts/HRM-Code-Quality]] — Quy tắc store, merge, enum, giao tiếp SE-BA-QC
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M + 5 Whys (bao gồm nguyên nhân bảo mật)
