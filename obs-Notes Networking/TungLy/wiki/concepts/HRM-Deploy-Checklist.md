---
type: concept
tags:
  - hrm
  - deploy
  - checklist
  - iis
  - sql-server
  - se-process
date-updated: 2026-04-26
related:
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
- "[[wiki/concepts/HRM-Code-Quality]]"
- "[[wiki/concepts/HRM-Network-Check]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
- "[[wiki/sources/Nhat-ky-van-de-nghiep-vu]]"
---

# HRM — Deploy Checklist

> Ghi chú nguyên tử: checklist triển khai FIT-HRM trên server mới và checklist upbuild. Tổng hợp từ các lỗi lặp lại nhiều nhất.

## Checklist — Dựng Server Mới

### IIS
- [ ] Copy **source pass** (không copy source đã dựng từ link nhà)
- [ ] Tạo IIS site + pool mới
- [ ] Phân quyền IIS_IUSRS cho 4 thư mục: Main, Hr.Service, HrmSystem.Service, EmpPortal
- [ ] Kiểm tra `Anonymous Authentication` → edit → chọn **Application Pool Identity**
- [ ] Webconfig đúng phiên bản build (không dùng webconfig cũ)
- [ ] Thêm key cần thiết: `ConnectString`, `Hrm_APICenter_Web`, `AllowOrigin` (nếu cần)
- [ ] Cấu hình `maxRequestLength` (tối đa 20MB)

### SQL Server
- [ ] Bật CLR: `sp_configure 'clr enabled', 1; RECONFIGURE;`
- [ ] Set TRUSTWORTHY ON cho DB
- [ ] `EXEC sp_changedbowner 'sa'`
- [ ] `ALTER ASSEMBLY [VnResource.DatabaseClr] WITH PERMISSION_SET = UNSAFE;`
- [ ] Kiểm tra `MAXDOP` — nếu = 1, tăng lên 8 hoặc phù hợp
- [ ] Thu hồi sysadmin sau khi hoàn tất

### Kiểm tra Sau Dựng
- [ ] Login được Main
- [ ] Login được Portal
- [ ] Version hiển thị đúng
- [ ] Log Request hoạt động (có Visual C++ 2010–2022)
- [ ] Event Viewer không có lỗi đỏ

## Checklist — Upbuild

- [ ] **Stop** tất cả pool và site trước
- [ ] Backup folder `RequestInformation` ra ngoài source (4 folder)
- [ ] Xóa `PrecompiledApp.config`
- [ ] Xóa tất cả thư mục `bin`
- [ ] Giải nén build mới (dùng tool tự động nếu có)
- [ ] Start lại pool và site
- [ ] Kiểm tra log request ghi bình thường

## Checklist — DB mới (không phải restore)

- [ ] Chạy full script theo thứ tự (không chạy từng phần bằng tay)
- [ ] Không build entity trước khi có script → tránh conflict entity vs script
- [ ] Xác nhận với người viết script trước khi chạy

## Lỗi Thường Gặp Và Trang Tra Cứu

| Lỗi | Tra cứu |
|-----|---------|
| Login 500 / CLR | [[wiki/concepts/HRM-SQL-Troubleshooting]] |
| 403.14 / IIS pool | [[wiki/concepts/HRM-IIS-Troubleshooting]] |
| Log request không ghi | [[wiki/concepts/HRM-Log-Monitoring]] |
| Không vào mạng / port | [[wiki/concepts/HRM-Network-Check]] |
| CORS / AllowOrigin | [[wiki/concepts/HRM-Security-Config]] |
| Store/script bị thiếu | [[wiki/concepts/HRM-Code-Quality]] |

## Liên kết kích hoạt

- Đây là trang tổng hợp — mọi vấn đề cụ thể đều link đến concept chuyên sâu hơn
- Quy trình code kéo theo → [[wiki/concepts/HRM-Code-Quality]]
