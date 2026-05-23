---
title: "[Bitex] Chấm công GPS/WiFi bị loading — không ghi nhận được"
date: 2026-04-29
domain: attendance
module: Mobile App / Attendance GPS-WiFi
project: "[[Dự án Bitex]]"
tags:
  - incident
  - attendance
  - gps
  - wifi
  - mobile
  - bitex
  - đang-điều-tra
verified: no
status: investigating
---

# [Bitex] Chấm công GPS/WiFi bị loading — không ghi nhận được

## Tóm tắt

Dự án **Bitex** (link chính của khách hàng) phản ánh chức năng chấm công
bằng **GPS** và **WiFi** trên app mobile bị **loading mãi**, không ghi nhận
được dữ liệu chấm công. Vấn đề được phát hiện qua báo cáo của nhân viên
vào buổi sáng 28/04/2026. Hiện đang trong quá trình điều tra.

## Triệu chứng

- App hiển thị màn hình chấm công bình thường nhưng **xoay loading liên tục**,
  không chuyển sang trạng thái "đã chấm công thành công".
- Xảy ra với cả 2 phương thức: **GPS** và **WiFi**.
- Nhân viên **Ngoc Van** chấm GPS lúc **08:05, Thứ 3 28/4** — loading, không ghi nhận.
- Lần chấm VÀO cuối cùng được ghi nhận của Ngoc Van: **09:56 ngày 18/03/2026**
  → tức là **hơn 1 tháng** không có dữ liệu chấm công.
- Nhân viên **ST0043** chấm WiFi lúc **08:12** — thành công (WiFi vẫn có trường hợp OK).

## Phân tích nguyên nhân (đang điều tra)

### Điểm đã xác định

> ✅ **Vấn đề xảy ra ở phía app mobile, TRƯỚC bước gọi API.**
> Request **chưa được gửi đi** — bị chặn hoặc bị treo ở đâu đó trong
> luồng xử lý nội bộ của app (validate, permission check, build payload, v.v.)

### Giả thuyết hiện tại

- Có thể bị block tại bước **kiểm tra quyền GPS / WiFi** trên thiết bị.
- Có thể bị treo ở bước **lấy tọa độ GPS** (timeout chờ GPS lock).
- Có thể bị chặn tại **interceptor / guard nội bộ** của app trước khi dispatch request.

### Chuỗi nguyên nhân (giả thuyết)

```
Triệu chứng: Loading mãi, không ghi nhận
  ← App mobile bị treo TRƯỚC khi gọi API
    ← [Đang ghi log để xác định chính xác bước bị treo]
    ← Nghi vấn: GPS lock timeout / permission / interceptor nội bộ
```

### Việc đang làm

- [ ] Team **App Mobile** đang thêm log chi tiết để trace từng bước
      trong luồng xử lý trước khi gọi API.
- [ ] Xác định bước cụ thể app bị treo (GPS resolve / permission / payload builder...).
- [ ] So sánh case WiFi thành công vs GPS thất bại để isolate nguyên nhân.

## Giải pháp đã áp dụng

> ⏳ **Chưa có fix** — đang chờ log từ team mobile để xác định root cause.

## Kết quả kiểm tra

- Verified: **no** — đang điều tra
- WiFi: có trường hợp thành công (ST0043 08:12)
- GPS: chưa ghi nhận được trong thời gian dài (từ 18/03/2026)
- API: **không liên quan ở bước này** — request chưa tới được server

## Bài học / Lưu ý (cập nhật sau khi fix xong)

- Luồng chấm công mobile nên có **timeout từng bước** rõ ràng
  (không để loading vô hạn nếu GPS lock thất bại).
- Cần **phân biệt log rõ ràng** giữa các bước: permission → GPS resolve
  → build payload → gọi API → nhận response.
- Khi debug, ưu tiên kiểm tra phía app trước khi đổ lỗi cho API.

## Liên kết

- Dự án: Bitex (link chính của khách hàng)
- [[wiki/projects/bitex]] ← nếu có
- [[wiki/sources/attendance-gps-wifi]] ← nếu có
