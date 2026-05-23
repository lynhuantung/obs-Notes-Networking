---
description: "Cách kiểm tra kết nối mạng HRM: ping, telnet, PowerShell, webconfig khi hệ thống không truy cập được."
type: concept
tags:
  - hrm
  - network
  - powershell
  - webconfig
  - troubleshooting
date-updated: 2026-04-26
related:
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/HRM-Security-Config]]"
- "[[wiki/concepts/HRM-Deploy-Checklist]]"
- "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
---

# HRM — Network Check

> Ghi chú nguyên tử: cách kiểm tra kết nối mạng khi HRM không truy cập được.

## Test-NetConnection — 3 Tình Huống Thường Gặp

### 1. Kiểm tra DNS phân giải
```powershell
Test-NetConnection google.com
```
→ Nếu thất bại: kiểm tra cấu hình DNS, dùng DNS server khác

### 2. Kiểm tra TCP port
```powershell
Test-NetConnection google.com -Port 80
Test-NetConnection [ip-server] -Port 443
```
→ Nếu thất bại: tường lửa chặn cổng, hoặc service không lắng nghe

### 3. Kiểm tra mạng cục bộ
```powershell
Test-NetConnection
```
→ Trả về IP, Gateway, DNS hiện tại. Nếu lỗi: kiểm tra lại config mạng, khởi động lại router/modem

## Nguyên Nhân Thường Gặp Khi Không Kết Nối HRM

| Triệu chứng | Nguyên nhân khả năng | Kiểm tra |
|-------------|---------------------|----------|
| Không vào được từ browser | DNS sai / port bị chặn | `Test-NetConnection [host] -Port [port]` |
| Login được nhưng không thấy dữ liệu | Symantec/proxy chặn header | Thử Firefox, kiểm tra Network Activity |
| HRM từ Google Chat bị lỗi | CORS chưa cấu hình AllowOrigin | Xem [[wiki/concepts/HRM-Security-Config]] |
| System Service không trả về | Port bị chặn hoặc service chưa chạy | Kiểm tra IIS site + port firewall |

## webSettings.json — Các Key Quan Trọng

Các key hay bị thiếu khi cấu hình mới:
- `ConnectString` — phải khớp giữa Portal và Main
- `Hrm_APICenter_Web` — URL API Center để refresh cache quyền
- `AllowOrigin` — domain bên ngoài được phép gọi HRM
- Redis config (nếu dùng) — phải đúng endpoint

## Liên kết kích hoạt

- Lỗi mạng → check IIS site đang chạy không → [[wiki/concepts/HRM-IIS-Troubleshooting]]
- Lỗi header bị chặn → kiểm tra CORS + security → [[wiki/concepts/HRM-Security-Config]]
- Cần checklist đầy đủ khi setup server mới → [[wiki/concepts/HRM-Deploy-Checklist]]
