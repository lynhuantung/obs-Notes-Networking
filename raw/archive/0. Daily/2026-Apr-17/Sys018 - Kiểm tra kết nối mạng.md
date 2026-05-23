---
Mã: Sys018
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys001 - Lỗi 405 network webconfig]]"
  - "[[Sys004 - Link ngoài bị chặn HRM]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Kiểm tra kết nối mạng

**Vấn đề:** Kiểm tra kết nối mạng

**Hiện trạng:**
Người dùng đang gặp các vấn đề liên quan đến kết nối mạng, ví dụ như:
- Không truy cập được vào website hoặc máy chủ từ xa.
- Không kết nối được đến dịch vụ cụ thể (như ứng dụng web, cơ sở dữ liệu).
- Khó khăn trong việc phân giải tên miền hoặc truy cập dịch vụ mạng qua cổng nhất định.

**Nguyên nhân:**
Các nguyên nhân phổ biến:
- **DNS phân giải sai hoặc không thể phân giải.** Ví dụ: Máy không thể phân giải tên miền thành địa chỉ IP.
- **Cổng TCP không mở hoặc bị tường lửa chặn.** Ví dụ: Kết nối đến dịch vụ qua cổng 80 hoặc 443 bị chặn.
- **Cấu hình mạng hoặc Gateway không chính xác.** Ví dụ: Sai địa chỉ IP, Gateway.

**Phương án:**
Sử dụng `Test-NetConnection` để xác minh kết nối mạng:

#### Ví dụ 1: Kiểm tra phân giải DNS
```powershell
Test-NetConnection google.com
```
Nếu phân giải DNS thành công, hệ thống trả về địa chỉ IP của `google.com`. Nếu thất bại, cần kiểm tra cấu hình DNS hoặc sử dụng máy chủ DNS khác.

#### Ví dụ 2: Kiểm tra kết nối TCP đến dịch vụ qua cổng cụ thể
```powershell
Test-NetConnection google.com -Port 80
```
Nếu kết nối thành công, cổng 80 đang hoạt động bình thường. Nếu thất bại, có thể do tường lửa chặn cổng hoặc dịch vụ không khả dụng.

#### Ví dụ 3: Kiểm tra kết nối mạng cục bộ
```powershell
Test-NetConnection
```
Trả về thông tin về trạng thái mạng hiện tại (IP, Gateway, DNS). Nếu phát hiện lỗi, kiểm tra lại cấu hình mạng hoặc khởi động lại thiết bị mạng.
