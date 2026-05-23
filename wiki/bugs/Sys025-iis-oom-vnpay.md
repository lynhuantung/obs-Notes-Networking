---
description: "Bug Sys025: IIS App Pool VnPay bị crash OutOfMemoryException lúc 8h sáng, nguyên nhân và phương án xử lý."
type: bug
code: p9xk
status: resolved
tags:
  - "bug"
  - "vnpay"
  - "iis"
  - "memory"
domain: system
created: 2026-05-01
updated: 2026-05-01
related:
  - "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
---

## Sys025 — IIS App Pool VnPay crash OutOfMemoryException lúc 8h sáng

- **Status**: `resolved`
- **Date**: 2026-05-01
- **Affected**: IIS App Pool — toàn bộ HRM VnPay (13 services), tái diễn 3 lần/tuần

### Hiện trạng

- App pool bị kill tự động, toàn bộ request trả 503 ~5–10 phút cho đến khi restart
- Luôn xảy ra lúc 8h sáng — giờ cao điểm login đồng loạt (~200+ concurrent users)
- Sau restart thủ công hoạt động bình thường

### Nguyên nhân (5 Whys)

- Tại sao (1): App pool crash? → OutOfMemoryException [fact — event log]
- Tại sao (2): Tại sao OOM lúc 8h? → Memory tích lũy qua đêm, peak login vượt ngưỡng [inference]
- Tại sao (3): Tại sao memory tích lũy? → Không có recycle định kỳ, có thể có memory leak nhỏ [inference]
- **Root**: App pool thiếu schedule recycle trước giờ peak + không có alert monitor memory ngưỡng

### Khắc phục

- Cấu hình recycle app pool lúc 3h sáng hàng ngày (IIS Manager → App Pool → Recycling → Specific time: 03:00)
- Set Private Memory Limit = 80% max RAM làm ngưỡng cảnh báo
- Cài monitor memory alert mỗi 15 phút

### Phòng tránh

- Mọi môi trường production nhiều user phải có recycle schedule — không dùng default
- Bổ sung vào `HRM-Deploy-Checklist`: verify recycle config khi triển khai môi trường mới
- Monitor memory trend proactive, không chờ user báo lỗi

### Links

- Nhật ký: [[wiki/sources/Nhat-ky-van-de-he-thong]]
- Báo cáo PDCA: [[wiki/synthesis/monthly-rca-2026-05-vnpay-iis-oom-p9xk]]
- [[wiki/projects/VnPay-Project]]
- [[wiki/concepts/HRM-IIS-Troubleshooting]]
