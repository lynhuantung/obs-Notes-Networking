---
title: "AVN — LDAP không bảo mật: phân tích nguyên nhân và hướng xử lý"
date: 2026-05-04
project: AVN
domain: system
module: Authentication / LDAP
tags: [ldap, ldaps, avn, security, authentication, incident]
status: confirmed
verified: yes
---

# AVN — LDAP không bảo mật: phân tích nguyên nhân và hướng xử lý

## Bối cảnh

Trong triển khai dự án AVN, IT khách hàng phát hiện LDAP đang dùng
**không đảm bảo bảo mật** và yêu cầu tắt. Tài liệu này ghi nhận nguyên nhân
kỹ thuật, hiện trạng HRM, và hướng xử lý.

## Nguyên nhân kỹ thuật

### Standard LDAP (port 389) truyền credentials plain text

- Flow đăng nhập LDAP của HRM: [[wiki/flows/Flow-LDAP-Login]]
- Khi user đăng nhập HRM qua LDAP, password gửi qua mạng **không mã hóa**
- Bất kỳ ai sniff traffic nội bộ (LAN/WAN) đều đọc được credentials
- Đây là **vấn đề của protocol LDAP thuần** — không phải lỗi code HRM

### So sánh LDAP vs LDAPS

| | Standard LDAP | LDAPS |
|---|---|---|
| Port | 389 | 636 |
| Mã hóa | ❌ Plain text | ✅ TLS/SSL |
| Chuẩn ngành hiện tại | Legacy | Recommended |
| HRM hỗ trợ | ✅ Hoạt động | ❌ Chưa có — xem bên dưới |

### Tại sao khách hàng tắt LDAP

- IT AVN áp dụng security policy: không cho phép port 389 (plain text) trong mạng doanh nghiệp
- Tắt LDAP là biện pháp xử lý tạm thời trong khi chờ giải pháp thay thế

## Hiện trạng HRM — LDAPS chưa được hỗ trợ

> ⚠️ **Confirmed (2026-05-04)**: HRM hiện tại **chưa có xử lý LDAPS** ở cả code lẫn UI.

- **Code**: chưa có xử lý SSL/TLS trong phần khởi tạo `LdapConnection`
- **Màn hình "Nguồn LDAP"** (`Sys_LdapConfig`): chưa có field/option cấu hình SSL —
  không có port 636, không có upload certificate, không có toggle LDAPS
- Mặc dù DB có thể có field `ConnectionType`, UI và code backend
  **chưa implement** phần LDAPS thực tế
- Xem chi tiết flow cấu hình và đăng nhập: [[wiki/flows/Flow-LDAP-Login]]

## Hướng xử lý

### Ngắn hạn (hiện tại — AVN đã tắt LDAP)
- Đề xuất khách hàng chuyển sang **SSO (ADFS / OIDC)** nếu hạ tầng có sẵn
- Đây là hướng thay thế không cần LDAP, bảo mật hơn về lâu dài

### Trung hạn (develop LDAPS)
- [ ] Raise task phát triển tính năng LDAPS:
  - Thêm field cấu hình SSL vào màn hình Nguồn LDAP (port, certificate)
  - Sửa code `LdapConnection` để hỗ trợ SSL/TLS (port 636)
- [ ] Xin tài khoản test LDAPS từ IT AVN để verify sau khi dev xong
- [ ] Test trên Ultra Server của khách hàng

### Dài hạn
- [ ] Đặt LDAPS làm mặc định trong tài liệu hướng dẫn cài đặt LDAP HRM
- [ ] Cảnh báo trong UI khi admin chọn Standard LDAP

## Trạng thái

- LDAP đã bị tắt tại AVN — **confirmed**
- LDAPS: **chưa có** — cần phát triển mới hoàn toàn

## Liên kết

- [[wiki/projects/AVN-Project]]
- [[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]]
- [[wiki/sources/Sys-TaiLieuLDAP-03]]
- [[wiki/flows/Flow-LDAP-Login]]
- [[wiki/architecture/HRM-Auth-Architecture]]
