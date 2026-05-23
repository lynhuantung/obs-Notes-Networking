---
type: source
code: n8d4m
description: "Luật ngày công theo Bộ luật Lao động: không quá 8h/ngày, 48h/tuần; giờ ban đêm 22:00–06:00; công việc đặc biệt nguy hiểm 6h/ngày"
domain: att
tags:
  - att
  - luat
  - ngay-cong
  - lao-dong
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/sources/p1a3t-att-overview]]"
  - "[[wiki/sources/n5c1k-att-luat-ngay-nghi]]"
  - "[[wiki/sources/w3t6p-att-luat-tang-ca]]"
---

# Source: ATT – Luật ngày công

## Tóm tắt

Tài liệu tóm tắt quy định pháp lý về thời gian làm việc bình thường theo Bộ luật Lao động Việt Nam, làm cơ sở cấu hình HRM Pro 8. Hai nội dung chính: giới hạn giờ làm ngày/tuần và định nghĩa giờ làm ban đêm. Ngắn gọn — đây là nền tảng cho cấu hình `HRM_ATT_OT_NIGHTSHIFTFROM/TO` và `HourOnWorkDate` trong Cat_GradeCfg.

## Key Takeaways

- **Giới hạn chuẩn**: không quá 8h/ngày và 48h/tuần
- **Tính theo tuần**: tối đa 10h/ngày nhưng vẫn không quá 48h/tuần
- **Công việc đặc biệt nặng nhọc, độc hại, nguy hiểm**: không quá 6h/ngày
- **Giờ ban đêm**: 22:00 đến 06:00 sáng hôm sau (áp dụng hệ số OT đêm)

## Trích dẫn quan trọng

> Không quá **8 giờ/ngày** và **48 giờ/tuần**. Nếu tính theo tuần: không quá **10 giờ/ngày**, nhưng vẫn không quá 48 giờ/tuần.

> Giờ làm việc ban đêm được tính từ **22:00 đến 06:00** sáng hôm sau.

## Liên kết

- [[wiki/sources/w3t6p-att-luat-tang-ca]] — hệ số OT đêm (210%/270%/390%)
- [[wiki/sources/n5c1k-att-luat-ngay-nghi]] — nghỉ giữa giờ, chuyển ca
- [[wiki/sources/h2j7q-att-sys-attendance-config]] — key `HRM_ATT_OT_NIGHTSHIFTFROM/TO` cấu hình giờ đêm
