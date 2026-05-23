---
type: source
code: w3t6p
description: "Luật tăng ca (OT) theo Bộ luật Lao động: 6 điều kiện, hệ số 150%/200%/300%+100%, OT đêm 210%/270%/390%, giới hạn 200h/năm"
domain: att
tags:
  - att
  - luat
  - tang-ca
  - OT
  - lao-dong
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/sources/p1a3t-att-overview]]"
  - "[[wiki/sources/n8d4m-att-luat-ngay-cong]]"
  - "[[wiki/sources/n5c1k-att-luat-ngay-nghi]]"
  - "[[wiki/sources/h2j7q-att-sys-attendance-config]]"
---

# Source: ATT – Luật tăng ca (OT)

## Tóm tắt

Tài liệu quy định pháp lý về làm thêm giờ (OT) theo Bộ luật Lao động Việt Nam, làm cơ sở cấu hình module OT trong HRM Pro 8. Gồm định nghĩa, 6 điều kiện áp dụng, và bảng hệ số 6 loại OT (ngày thường/nghỉ/lễ × ngày/đêm). Đây là basis cho key `HRM_ATT_OT_OTPERMIT_LIMITHOUR_BYYEAR` (200h) và bảng Cat_OvertimeType.

## Key Takeaways

- **Định nghĩa**: làm ngoài giờ bình thường theo luật/thỏa ước/nội quy
- **6 điều kiện**: đồng ý NLĐ, ≤50% ngày, ≤12h/ngày tổng, ≤30h/tháng, ≤200h/năm (300h đặc biệt), nghỉ bù sau đợt OT
- **Hệ số OT ngày**: thường 150%, nghỉ (CN) 200%, lễ 300%+100%
- **Hệ số OT đêm**: thường 210%, nghỉ (CN) 270%, lễ 390%+100%
- **Giới hạn 200h/năm** là ngưỡng pháp lý quan trọng — hệ thống cần cảnh báo/chặn khi vượt

## Trích dẫn quan trọng

> Làm thêm giờ là khoảng thời gian làm việc ngoài thời giờ làm việc bình thường được quy định trong pháp luật, thỏa ước lao động tập thể hoặc nội quy lao động.

> Không quá **200 giờ/năm** (trường hợp đặc biệt: 300 giờ/năm)

## Liên kết

- [[wiki/sources/h2j7q-att-sys-attendance-config]] — Tab 5 giới hạn OT: `LIMITHOUR_BYYEAR=200`, `LIMITHOUR_BYMONTH=40`
- [[wiki/sources/k9v2x-att-du-lieu-tinh-cong]] — OT là 1 trong 6 loại dữ liệu tính công
- [[wiki/architecture/ATT-Database-Schema]] — Cat_OvertimeType, Att_AttendanceTableItem OT fields
