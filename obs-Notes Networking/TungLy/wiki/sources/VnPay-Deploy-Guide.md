---
type: source
tags:
  - vnpay
  - deploy
  - s3
  - iis
  - sql-server
  - "2025"
date-updated: 2026-04-25
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/sources/VnPay-System-Architecture]]"
---

# Hướng dẫn triển khai HRM VnPay

**Nguồn gốc**: `Documents/HƯỚNG DẪN TRIỂN KHAI HỆ THỐNG HRM VNPay.md`  
**Ngày**: 19/06/2025

---

## Các thành phần upload lên S3

| Loại | Tên file | Ghi chú |
|------|---------|---------|
| Database | `HRMPRO12_VNPAY_20250423.rar` | Backup CSDL SQL Server |
| Cấu hình | `IIS-DB-VnPay-config.rar` | Config IIS + DB connection |
| Source HRM | `VNPAY_v8.12.46.01.19.rar` | Source code hệ thống |

## Quy trình triển khai

1. **Khôi phục CSDL**: Giải nén → Restore qua SQL Server Management Studio
2. *(tiếp theo — xem tài liệu gốc)*

## Key Insights

- Triển khai dùng **AWS S3** để lưu artifacts (DB backup, source, config)
- Version source: `v8.12.46.01.19` — đây là phiên bản .NET 8 production
- Pattern: backup DB trước go-live, đóng gói config IIS riêng
