---
type: wiki-entity
tags:
  - khach-hang
  - noi-bo
  - fit-project
date-updated: 2026-04-27
related:
  - "[[wiki/sources/FIT-Meetings-2024]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
---

# Entity: FIT (FIT Project — Internal)

| Thuộc tính | Giá trị |
|-----------|---------|
| Loại | Dự án nội bộ / Khách hàng nội bộ |
| Trạng thái | Archived (2024) |
| Phân hệ chính | SYS (SSO ADFS), INS (chu kỳ BH đặc thù) |
| Thời gian | 2024 |

## Đặc điểm nổi bật

- **SSO ADFS**: Dùng Azure AD/ADFS cho xác thực — key `UsingADFS_Azure: true` trong webSettings.json ẩn form login portal
- **Chu kỳ BH 15-14**: Cơ quan BHXH ngoài Hà Nội dùng chu kỳ đóng BH từ ngày 15 tháng này đến ngày 14 tháng sau (thay vì 1-30 chuẩn) → tách thiết lập BH theo chế độ
- **Mail server per company**: Cấu hình server gửi mail theo từng CompanyID — hàm gửi mail kiểm tra CompanyID trước khi chọn SMTP config

## Liên kết

- [[wiki/sources/FIT-Meetings-2024]]
- [[wiki/sources/Daily-2024-SSO-Auth]]
- [[wiki/architecture/HRM-Auth-Architecture]]
