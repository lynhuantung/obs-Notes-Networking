---
type: source
description: "Sự cố ứng dụng mobile Bitex bị loading khi chấm công GPS/WiFi, ghi nhận triệu chứng và đang điều tra nguyên nhân."
domain: attendance
tags:
  - incident
  - bitex
  - gps
  - wifi
  - mobile
  - attendance
  - đang-điều-tra
created: 2026-04-29
updated: 2026-04-29
source-file: raw/0. Daily/Issues_Logs/2026-04-29-bitex-cham-cong-gps-wifi-loading.md
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# Source: [Bitex] Chấm công GPS/WiFi bị loading — không ghi nhận được

## Tóm tắt

Incident ghi nhận ngày 28–29/04/2026 tại dự án **Bitex-AKW** (hậu go-live): chức năng chấm công bằng **GPS** và **WiFi** trên app mobile bị **loading liên tục**, không ghi nhận được dữ liệu. Điều tra ban đầu xác định vấn đề xảy ra **phía app mobile, trước khi request gọi đến API** — tức là request chưa được gửi đi. Team App Mobile đang thêm log để trace từng bước.

## Key Takeaways

- App bị treo ở đâu đó **trước bước gọi API** — không phải lỗi API/server.
- GPS gần như không ghi nhận từ **18/03/2026** (hơn 1 tháng); WiFi vẫn có case thành công.
- Nghi vấn: **GPS lock timeout**, **permission check**, hoặc **interceptor nội bộ** của app.
- Cần timeout từng bước rõ ràng trong luồng chấm công mobile (không để loading vô hạn).
- Khi debug mobile: trace **permission → GPS resolve → build payload** trước khi nhìn vào API.

## Trích dẫn quan trọng

> ✅ **Vấn đề xảy ra ở phía app mobile, TRƯỚC bước gọi API.**
> Request chưa được gửi đi — bị chặn hoặc bị treo ở đâu đó trong
> luồng xử lý nội bộ của app (validate, permission check, build payload, v.v.)

> Lần chấm VÀO cuối cùng được ghi nhận của Ngoc Van: **09:56 ngày 18/03/2026**
> → tức là hơn 1 tháng không có dữ liệu chấm công.

> Nhân viên ST0043 chấm WiFi lúc 08:12 — thành công (WiFi vẫn có trường hợp OK).

## Liên kết

- [[wiki/projects/Bitex-Project]] — Dự án Bitex-AKW tổng quan
- [[wiki/concepts/HRM-Modules]] — Module APP/ATT liên quan
- [[wiki/sources/2026-05-05-loading-cham-cong-gps-wifi-dong-thoi]] — Bug fix liên quan: loading do 2 API serial (đã fix 05/05/2026)
