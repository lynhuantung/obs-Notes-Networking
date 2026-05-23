---
type: source
code: a3f8
domain: attendance
description: "App gọi 2 API nối tiếp để lấy giờ rồi chấm công, gây 2N request khi N người đồng thời, fix bằng cách gộp 1 API server tự GETDATE"
tags:
  - "bug-fix"
  - "attendance"
  - "performance"
  - "mobile"
  - "api-design"
created: 2026-05-05
updated: 2026-05-05
source-file: raw/Nghiệp vụ HRM/ATT/2026-05-05-loading-cham-cong-gps-wifi-dong-thoi.md
related:
  - "[[wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading]]"
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# Source: Loading chấm công GPS/Wifi khi nhiều người dùng đồng thời

## Tóm tắt

Bug fix ngày 05/05/2026 tại chức năng chấm công GPS/Wifi trên app mobile HRM. Khi nhiều nhân viên bấm chấm công cùng lúc (giờ cao điểm 8h sáng), app bị loading kéo dài. Nguyên nhân là app thực hiện 2 API call nối tiếp — lấy giờ server trước, sau đó mới gửi dữ liệu chấm công — khiến server nhận 2N request thay vì N. Đã fix bằng cách gộp thành 1 API, server tự lấy `GETDATE()` nội bộ. Verified: hết loading.

## Key Takeaways

- **Root cause**: 2 API serial (GET giờ → POST chấm công) × N người = 2N request → nghẽn server → loading
- **Fix**: Gộp thành 1 API `Att_GetData/New_SaveTamScanLog`, server tự `GETDATE()` khi nhận request
- **`async` không giúp UX**: `async/await` giải phóng thread server nhưng mobile vẫn phải chờ response — cần giảm số round-trip mới cải thiện UX
- **Giờ chấm vẫn là giờ server**: Nghiệp vụ chống gian lận không bị ảnh hưởng
- **Pattern chung**: API nghiệp vụ nên tự xử lý dữ liệu phụ trợ (giờ, ngày...) — không để client gọi thêm round-trip thừa

## Trích dẫn quan trọng

> **Trước (2 API serial):**
> ```
> [1] GET  /Sys_GetData/GetTimeOfServer      ← sync, client chờ
> [2] POST /Att_GetData/New_SaveTamScanLog   ← mới gọi được
> ```
> N người = 2N request → nghẽn → loading

> **Sau (1 API):**
> ```
> POST /Att_GetData/New_SaveTamScanLog
>      ↳ server tự gọi GETDATE() khi xử lý
> ```
> N người = N request → thông thoáng → hết loading

> `async` giúp server scale tốt hơn dưới tải cao, nhưng **không rút ngắn thời gian mobile chờ**.
> Cái fix thật sự là giảm số round-trip từ 2 xuống 1.

## Liên kết

- [[wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading]] — Incident cùng chức năng (loading do app treo trước API, nguyên nhân khác)
- [[wiki/projects/Bitex-Project]] — Dự án Bitex-AKW
- [[wiki/concepts/HRM-Modules]] — Module ATT/Mobile
