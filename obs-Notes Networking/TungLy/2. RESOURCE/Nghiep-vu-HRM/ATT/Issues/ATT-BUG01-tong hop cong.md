---
Mã: ATT-BUG01
aliases:
  - ATT-BUG01-tong hop cong
date: 2025-09-21
tags:
  - "#nghiepvu_cong"
  - "#error"
  - "#issue"
  - "#bug"
Liên quan:
---

# Sai tổng công khi nghỉ phép trùng ngày lễ – Lỗi

**Nghiệp vụ liên quan:** [[ATT01 - Tổng hợp công]] , [[ATT04 - Phép năm]]
**Ngày phát hiện:** 2025-09-21  
**Mức độ:** High  

## Mô tả
- Hệ thống vừa trừ phép năm vừa tính ngày lễ.

## Nguyên nhân
- Rule thiếu ưu tiên “ngày nghỉ lễ > phép năm”.

## Cách xử lý
- Cập nhật store `hrm_get_TimesheetSummary`.

## Bài học
- Thêm test case đặc biệt cho “phép năm trùng lễ”.

