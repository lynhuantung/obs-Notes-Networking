---
type: source
code: t6mw
tags:
  - bao-hiem
  - nghi-viec
  - bao-giam-ld
  - chu-ky
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/sources/INS-FAQ-NghiViecTrongKy]]"
  - "[[wiki/sources/INS-Nghiep-Vu]]"
description: "Logic xác định tháng báo giảm lao động khi nhân viên nghỉ việc ngoài chu kỳ bảo hiểm, kèm config bổ sung."
---

# INS FAQ — NV Nghỉ Việc Ngoài Chu Kỳ Mà Vẫn Báo Giảm LĐ

## Tóm tắt

Tài liệu giải thích logic xác định tháng báo giảm lao động khi NV nghỉ việc. PE thường báo nhầm là bug vì không biết hệ thống tính từ ngày nghỉ → cuối tháng. Kèm config bổ sung "Số ngày tính NV nghỉ việc" trong Thiết lập nhân sự.

## Key Takeaways

- Hệ thống tính ngày nghỉ = từ **ngày nghỉ việc → cuối tháng**
- ≥14 ngày → báo giảm LĐ **tháng N**; <14 ngày → báo giảm LĐ **tháng N+1**
- Config **"Số ngày tính NV nghỉ việc"** (Thiết lập nhân sự): cộng thêm vào chu kỳ báo giảm → mở rộng ngưỡng
- PE hay hỏi: "NV nghỉ ngày 20 sao báo giảm tháng này?" → từ 20 → cuối tháng ≥14 ngày → đúng logic

## Trích dẫn quan trọng

> Chu kỳ giảm LĐ 16/08–15/09, NV nghỉ ngày 16/09, config = 1 ngày → báo giảm tháng 09 — vì cộng thêm 1 ngày vào chu kỳ.

## Liên kết

- [[wiki/sources/INS-FAQ-NghiViecTrongKy]] — nghỉ việc trong kỳ, 2 dòng BH
- [[wiki/sources/INS-Nghiep-Vu]] — nghiệp vụ tăng/giảm/điều chỉnh BH
