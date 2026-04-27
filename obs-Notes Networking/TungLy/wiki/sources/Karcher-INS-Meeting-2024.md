---
type: source
tags:
  - baohiem
  - karcher
  - nghi-14-ngay
  - enum
  - meeting
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "3. ARCHIEVED/dự án 2024/Karcher/H-Karcher-INS-281124.md"
related:
  - "[[wiki/entities/Karcher]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
---

# Karcher — Họp Bảo Hiểm: Nghỉ 14 Ngày Không Module Công (11/2024)

## Tóm tắt

Biên bản họp ngắn (11/2024) về cách xử lý nghỉ 14 ngày khi khách hàng **không mua module Chấm Công**. Đây là edge case kỹ thuật quan trọng: hệ thống cần lấy số ngày nghỉ từ chứng từ thay vì từ dữ liệu công. Thành viên: TungLy, Thong.Nguyen, Na.Trinh.

## Key Takeaways

- **Vấn đề**: Phân tích nghỉ 14 ngày khi không có module Chấm Công
- **Giải pháp**: Thêm **enum công thức nghỉ 14 ngày** — lấy số ngày từ **chứng từ** thay vì từ phần tử BH/tính công
- **Nghỉ thai sản + nghỉ dài ngày**: Hệ thống đã hỗ trợ sẵn, không cần xử lý thêm

## Trích dẫn quan trọng

> "Thêm enum công thức nghỉ 14 ngày về việc lấy số ngày từ chứng từ. Phân tích nghỉ 14 ngày khi không mua module công"

## Bài học

- Khách hàng không mua module Công = nguồn dữ liệu ngày nghỉ phải chuyển sang chứng từ BH → **hỏi sớm về việc khách hàng có mua module Công không** trước khi thiết kế logic nghỉ 14 ngày
- Enum công thức nghỉ 14 ngày là extension point đã có sẵn — có thể tái sử dụng cho các KH tương tự

## Liên kết

- [[wiki/entities/Karcher]]
- [[wiki/sources/INS-Nghi14Ngay]]
- [[wiki/concepts/HRM-Modules]]
