---
type: source
tags:
  - vnpay
  - architecture
  - services
  - sites
  - docker
  - identity
  - "2026"
date-updated: 2026-04-25
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/concepts/Net8-Migration]]"
---

# VnPay — Kiến trúc Hệ thống HRM (Sites & Services)

**Nguồn gốc**: `BrainStorming/Ý Nghĩa các sites.md`  
**Ngày**: 18/01/2026  
**Môi trường**: UAT (vnresource.net)

---

## Tổng quan kiến trúc

Hệ thống HRM VnPay gồm **13 service/site** chạy trên Kubernetes (Traefik làm reverse proxy):

| # | Service | Domain (UAT) | Vai trò | Người dùng |
|---|---------|-------------|---------|-----------|
| 1 | **Portal** | vnpay-empportal | Cổng nhân viên: hồ sơ, công, lương, nghỉ phép | Nhân viên |
| 2 | **Main** | vnpay-main | Quản trị HRM: hồ sơ, tuyển dụng, đào tạo, báo cáo | HR, Quản lý |
| 3 | **HR API** | vnpay-hr | API nghiệp vụ nhân sự (hồ sơ, công, lương) | Portal, Main |
| 4 | **SYS API** | vnpay-sys | Bảo mật, phân quyền, cấu hình hệ thống | Nội bộ |
| 5 | **API Core** | vnpay-apiv3 | API lõi nội bộ cho Portal | Portal |
| 6 | **Integration API** | vnpay-itgapi | Tích hợp đối tác: TS24, MISA, Viettel, VnPay | Đối tác (S2S) |
| 7 | **Identity (IDS4)** | vnpay-ids4 | SSO, OAuth2, OpenID Connect, cấp token | Toàn hệ thống |
| 8 | **News** | vnpay-news | Tin tức nội bộ (WordPress) + SSO | Nhân viên, HR |
| 9 | **Survey API** | vnpay-apiSurvey | Khảo sát nội bộ (DB độc lập) | Nhân viên, HR |
| 10 | **Chat API** | vnpay-chat | Dịch vụ chat nội bộ | Nhân viên |
| 11 | **Chat FE** | vnpay-chatfe | Giao diện chat nhúng vào Portal | Nhân viên |
| 12 | **Windows Service Core** | vnpay-ws | Background jobs: sync, email, xử lý công-lương | Hệ thống |
| 13 | **Traefik** | vnpay-traefik | Reverse proxy, load balancer, TLS | IT/DevOps |

## Điểm nghẽn đã biết

- **Identity service** là điểm nghẽn khi scale — chưa thể mở nhiều pod (vấn đề tháng 11/2025)
- **API Core** bị uneven load balancing — một pod tăng đột biến trong khi pod khác idle

## Key Insights

- Kiến trúc microservices trên Kubernetes — phức tạp hơn nhiều so với HRM triển thông thường
- **Integration API** là gateway riêng cho tích hợp đối tác (MISA, Viettel, TS24…) — không dùng HR API
- Identity IDS4 là **single point of failure** quan trọng — cần HA (High Availability) khi go-live
- Windows Service Core chạy nền — quan trọng cho nghiệp vụ lương/công end-of-month
