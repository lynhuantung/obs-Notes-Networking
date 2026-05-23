---
type: source
code: m4b8z
description: "Công cộng và công trừ ATT: công thức nghiệp vụ, công đi làm, nghỉ hưởng lương, đi trễ/về sớm, nghỉ không lương"
domain: att
tags:
  - att
  - tinh-cong
  - cong-cong
  - cong-tru
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/sources/q7r2n-att-tinh-cong]]"
  - "[[wiki/sources/k9v2x-att-du-lieu-tinh-cong]]"
  - "[[wiki/architecture/ATT-Database-Schema]]"
---

# Source: ATT – Công cộng và công trừ

## Tóm tắt

Tài liệu nghiệp vụ mô tả cách tính công thực nhận của nhân viên trong HRM Pro 8. Phân biệt 3 khái niệm: công cộng (tăng tổng công), công trừ (giảm tổng công), công chuẩn (mốc đối chiếu). Là nền tảng để hiểu cột `PaidWorkDayCount` và `RealWorkDayCount` trong DB.

## Key Takeaways

- **Công thức**: Công thực nhận = (Công đi làm + Nghỉ hưởng lương) − (Công trừ + Nghỉ không lương + Vi phạm)
- **Công đi làm**: đủ ca = +1, nửa ngày = +0.5
- **Nghỉ hưởng lương**: phép năm, nghỉ lễ, nghỉ cưới, chế độ công ty — không đi làm nhưng vẫn tính công
- **Công chuẩn**: số ngày làm việc thực tế trong tháng (tháng 5 = 26, tháng 2 = 24)
- **Đi trễ**: trễ 15 phút → trừ 0.25 công; về sớm → ghi nhận KPI
- **Nghỉ không lương**: không cộng công, ảnh hưởng lương và BHXH

## Trích dẫn quan trọng

> Công thực nhận = (Công đi làm + Nghỉ hưởng lương) - (Công trừ + Nghỉ không lương + Vi phạm)

> Hệ thống so sánh Công thực tế / Công chuẩn để tính lương, thiếu công, phụ cấp chuyên cần.

## Liên kết

- [[wiki/architecture/ATT-Database-Schema]] — Att_AttendanceTable chứa PaidWorkDayCount, StdWorkDayCount
- [[wiki/sources/q7r2n-att-tinh-cong]] — quy trình sinh bảng công
- [[wiki/sources/n5c1k-att-luat-ngay-nghi]] — chi tiết các loại nghỉ hưởng lương
