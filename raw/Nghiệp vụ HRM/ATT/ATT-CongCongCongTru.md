---
title: "ATT – Công cộng và công trừ"
date: 2026-05-09
code: att-cong-cong-tru
domain: att
module: Attendance
tags:
  - att
  - tinh-cong
  - cong-cong
  - cong-tru
verified: yes
related:
  - "[[ATT-Overview]]"
  - "[[ATT-TinhCong]]"
  - "[[ATT-DuLieuTinhCong]]"
---

# ATT – Công cộng và công trừ

## Tổng quan

Nghiệp vụ tính công xác định:

- **Công cộng** – được cộng vào tổng ngày công
- **Công trừ** – làm giảm số công hoặc ảnh hưởng lương
- **Công chuẩn** – mốc đối chiếu của kỳ lương

## Công thức nghiệp vụ

```
Công thực nhận = (Công đi làm + Nghỉ hưởng lương) - (Công trừ + Nghỉ không lương + Vi phạm)
```

## Công cộng

### Ngày công đi làm thực tế

| Trạng thái | Kết quả |
|-----------|---------|
| Đi làm đủ ca | +1 công |
| Làm nửa ngày | +0.5 công |

### Ngày nghỉ hưởng lương

Bao gồm: nghỉ phép năm, nghỉ lễ, nghỉ cưới, nghỉ theo chế độ công ty.

> Không đi làm nhưng vẫn tính công, vẫn tính lương.

## Công trừ

### Công chuẩn

| Tháng | Công chuẩn |
|-------|-----------|
| Tháng 5 | 26 công |
| Tháng 2 | 24 công |

Hệ thống so sánh **Công thực tế / Công chuẩn** để tính lương, thiếu công, phụ cấp chuyên cần.

### Đi trễ / về sớm

| Vi phạm | Xử lý |
|---------|-------|
| Trễ 15 phút | Trừ 0.25 công |
| Về sớm | Ghi nhận KPI |

Hệ thống có thể: trừ phút công, trừ giờ công, ghi nhận vi phạm.

### Nghỉ không lương

- Không phép / hết phép / nghỉ riêng không hưởng lương
- Không cộng công, có thể bị trừ lương, có thể ảnh hưởng BHXH

> Ví dụ: nghỉ không lương 2 ngày → trừ 2 công

## Kết quả sau tính công

Hệ thống sinh ra:

- Bảng công tổng hợp
- Dữ liệu tính lương
- Báo cáo công
- Thống kê vi phạm
