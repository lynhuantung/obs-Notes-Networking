---
type: source
description: "Bug tổng hợp công ATT: phép năm và ngày lễ bị tính sai, phân tích SQL và hướng xử lý lỗi chấm công."
tags:
  - att
  - bug
  - cham-cong
  - phep-nam
  - ngay-le
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 2.RESOURCE/Nghiep-vu-HRM/ATT/Issues/ATT-BUG01-tong hop cong.md
related:
  - "[[wiki/sources/NghiepVu-ATT-SAL]]"
  - "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
---

# Source: ATT-BUG01 — Sai Tổng Công Khi Phép Năm Trùng Ngày Lễ

## Tóm tắt

Bug nghiệp vụ chấm công (ATT-BUG01) phát hiện 21/09/2025: khi nhân viên đăng ký nghỉ phép năm đúng vào ngày lễ, hệ thống vừa trừ phép năm vừa tính ngày lễ → tổng công sai. Root cause: thiếu rule ưu tiên "ngày nghỉ lễ > phép năm". Fix: cập nhật store `hrm_get_TimesheetSummary`.

## Key Takeaways

- **Bug**: Phép năm trùng ngày lễ → hệ thống xử lý song song (trừ phép + tính lễ) thay vì ưu tiên lễ.
- **Nguyên nhân gốc rễ**: Store `hrm_get_TimesheetSummary` thiếu điều kiện kiểm tra ngày lễ trước khi kiểm tra phép năm — không có thứ tự ưu tiên rõ ràng giữa các loại ngày nghỉ.
- **Rule đúng**: Thứ tự ưu tiên xử lý ngày nghỉ: **Nghỉ lễ > Nghỉ bù > Nghỉ ốm > Phép năm > Nghỉ không lương**.
- **Fix**: Thêm điều kiện `IF ngày lễ → skip phép năm` trong `hrm_get_TimesheetSummary`.
- **Bài học**: Mỗi loại ngày nghỉ phải có test case đặc biệt cho trường hợp "trùng nhau" — phép năm trùng lễ, nghỉ ốm trùng lễ, nghỉ bù trùng lễ.
- **Mức độ**: High — ảnh hưởng trực tiếp đến tổng công tháng → sai lương.

## Trích dẫn quan trọng

> **Mô tả bug**: "Hệ thống vừa trừ phép năm vừa tính ngày lễ."

> **Root cause**: "Rule thiếu ưu tiên 'ngày nghỉ lễ > phép năm'."

> **Fix**: "Cập nhật store `hrm_get_TimesheetSummary`."

> **Bài học**: "Thêm test case đặc biệt cho 'phép năm trùng lễ'."

## Liên kết

- [[wiki/sources/NghiepVu-ATT-SAL]] — ATT01–05 và SAL01 nghiệp vụ tổng quan
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — CLR, MAXDOP, store issues
