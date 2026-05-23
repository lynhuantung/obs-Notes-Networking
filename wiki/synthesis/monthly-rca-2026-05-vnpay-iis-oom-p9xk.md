---
description: "Báo cáo RCA tháng 05/2026: sự cố IIS App Pool OOM VnPay, nguyên nhân, PDCA và kế hoạch phòng ngừa."
type: synthesis
code: p9xk
tags:
  - "rca"
  - "monthly-report"
  - "pdca"
  - "vnpay"
  - "iis"
created: 2026-05-01
updated: 2026-05-01
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
  - "[[wiki/bugs/Sys025-iis-oom-vnpay]]"
  - "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
---

# Báo Cáo Tóm Tắt Mục Tiêu Tháng 05/2026 — IIS App Pool OOM VnPay

## Mô Tả Vấn Đề

- IIS App Pool hệ thống HRM VnPay bị crash với lỗi OutOfMemoryException, tái diễn 3 lần trong tuần đầu tháng 05/2026, luôn xảy ra lúc 8h sáng — giờ cao điểm login đồng loạt.

## Hiện Trạng

| Chỉ số | Tháng 04/2026 | Tháng 05/2026 | Thay đổi |
|--------|--------------|--------------|---------|
| Sự cố IIS OOM | 0 | 3 lần | +3 |
| Thời gian downtime/lần | — | ~5–10 phút | mới phát sinh |
| Biện pháp hiện tại | — | Restart thủ công | tạm thời |

## Mục Tiêu

Mục tiêu tháng 05/2026: **giảm sự cố IIS OOM VnPay từ 3 lần xuống 0** đến hết ngày 15/05/2026 bằng cách cấu hình recycle và monitor.

## Root Cause (Phân Tích Pareto)

Nhóm nguyên nhân chiếm nhiều nhất:

1. **App pool không được recycle định kỳ** — ~60% — Memory tích lũy qua đêm không được giải phóng, đến 8h sáng peak login là vượt ngưỡng
2. **Thiếu monitoring memory trend** — ~40% — Không có alert khi memory tiệm cận giới hạn, chỉ phát hiện khi đã crash

→ **Tập trung xử lý nhóm 1+2 để giải quyết 100% vấn đề.**

**Phân tích 5 Whys:**

- Tại sao (1): App pool crash? → OutOfMemoryException lúc 8h sáng [fact — event log]
- Tại sao (2): Tại sao OOM lúc 8h? → Memory đã tích lũy qua đêm, peak login đồng loạt đẩy vượt ngưỡng [inference]
- Tại sao (3): Tại sao memory tích lũy? → Không có recycle định kỳ, có thể có memory leak nhỏ trong session/cache [inference]
- Tại sao (4): Tại sao không phát hiện sớm? → Không có monitor memory trend, không có alert ngưỡng [fact]
- **Root cause**: App pool thiếu schedule recycle trước giờ peak + không có cảnh báo memory ngưỡng

## Plan — Kế Hoạch

| What | Who | Notes | When | Status |
|------|-----|-------|------|--------|
| Cấu hình recycle app pool lúc 3h sáng hàng ngày | SE | IIS Manager → App Pool → Recycling → Specific time: 03:00 | 02/05 | New |
| Set Private Memory Limit phù hợp | SE | Dựa theo baseline memory bình thường, set limit = 80% max RAM | 02/05 | New |
| Cài đặt monitor memory alert | SE | Event Viewer rule hoặc script check memory mỗi 15 phút | 05/05 | New |
| Kiểm tra memory leak trong warmup/session | SE | Profiler hoặc theo dõi memory growth sau restart | 08/05 | New |

## Check — Hiệu Quả Giải Pháp

| What | Who | Notes | When | Status |
|------|-----|-------|------|--------|
| Restart app pool thủ công | SE | Biện pháp tạm thời — đã ổn định sau mỗi lần restart | 01/05 | Done |

## Act — Follow Up

| What | Who | Notes | When | Status |
|------|-----|-------|------|--------|
| Theo dõi memory trend sau khi cấu hình recycle | SE | Nếu vẫn còn leak → cần profile code warmup | 15/05 | Doing |
| Cập nhật HRM-Deploy-Checklist với bước verify recycle config | SE | Tránh bỏ sót khi triển khai môi trường mới | 15/05 | Doing |

## Bài Học Tháng Này

- IIS App Pool trên môi trường production nhiều user (VnPay ~200+ concurrent) **bắt buộc phải có recycle schedule** — không thể dùng default không recycle
- 8h sáng là giờ peak login → mọi resource đều cần được giải phóng trước thời điểm này
- Memory leak nhỏ không gây vấn đề trên môi trường ít user nhưng **bộc lộ rõ trên scale lớn**
- Cần monitor proactive, không chờ user báo lỗi mới phát hiện
