---
title: "Loading chấm công GPS/Wifi khi nhiều người dùng đồng thời"
date: 2026-05-05
code: 0001
domain: attendance
module: "Att_GetData / New_SaveTamScanLog"
description: "App gọi 2 API nối tiếp để lấy giờ rồi chấm công, gây 2N request khi N người đồng thời, fix bằng cách gộp 1 API server tự GETDATE"
tags:
  - "bug-fix"
  - "attendance"
  - "performance"
  - "mobile"
verified: yes
related:
  - "[[wiki/projects/HRM-Mobile]]"
---

# Loading chấm công GPS/Wifi khi nhiều người dùng đồng thời

## Tóm tắt

App mobile chấm công GPS/Wifi bị loading kéo dài vào giờ cao điểm khi nhiều
nhân viên bấm chấm công cùng lúc. Nguyên nhân do thiết kế gọi 2 API nối tiếp,
gây tải gấp đôi lên server. Đã fix bằng cách gộp thành 1 API.

## Triệu chứng

- Nhân viên bấm "Chấm công" trên app mobile → màn hình loading kéo dài
- Xảy ra chủ yếu giờ cao điểm (8h sáng) khi nhiều người chấm cùng lúc
- Chấm công lẻ (ít người) thì không bị

## Phân tích nguyên nhân

### Root Cause

App thực hiện 2 lần gọi API nối tiếp (serial): lấy giờ server trước, sau đó
mới gửi dữ liệu chấm công. Với N người chấm đồng thời → server nhận 2N request
thay vì N → nghẽn tại bước lấy giờ → mobile phải xếp hàng chờ → loading.

### Chuỗi nguyên nhân

```
App hiển thị loading
  ← Server nghẽn, response chậm
    ← 2N request đồng thời thay vì N
      ← App gọi 2 API nối tiếp: lấy giờ + chấm công
        ← Thiết kế tách lấy giờ server ra API riêng (không cần thiết)
```

## Giải pháp đã áp dụng

Gộp 2 API thành 1. API chấm công tự lấy `GETDATE()` nội bộ phía server
khi nhận request — không cần client hỏi giờ trước.

**Trước:**
```
[1] GET  /Sys_GetData/GetTimeOfServer      ← sync, client chờ
[2] POST /Att_GetData/New_SaveTamScanLog   ← mới gọi được
```

**Sau:**
```
POST /Att_GetData/New_SaveTamScanLog
     ↳ server tự gọi GETDATE() khi xử lý
```

API: `Att_GetData/New_SaveTamScanLog` (async)

## Kết quả kiểm tra

- Verified: yes
- Sau khi gộp API, hết loading khi nhiều người chấm đồng thời
- Giờ chấm công vẫn là giờ server — không ảnh hưởng nghiệp vụ chống gian lận

## Bài học / Lưu ý

- Server nên tự xử lý dữ liệu phụ trợ (giờ, ngày...) — không để client gọi thêm round-trip không cần thiết
- `async` ở server giúp tăng throughput nhưng **không rút ngắn thời gian client chờ** — cần giảm số round-trip để cải thiện UX
- Với chức năng có nhiều người dùng đồng thời → review số lượng API call per action trước khi release

## Liên kết

- [[wiki/projects/HRM-Mobile]]
