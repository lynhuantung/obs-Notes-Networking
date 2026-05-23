---
type: source
description: "Nghiệp vụ và sự cố đăng ký quên chấm công qua portal HRM, quy trình xử lý và các bug liên quan."
domain: attendance
tags: [att, cham-cong, quen-cham-cong, portal, bug, incident]
source-file: raw/Nghiệp vụ HRM/ATT/Đăng ký quên chấm công.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/NghiepVu-ATT-SAL]]"
---

# ATT — Đăng Ký Quên Chấm Công (Incident Note)

## Tóm tắt

Ghi chú sự cố ngắn (06/01/2025): user đăng ký quên chấm công trên portal với ngày công 08/08/2025, thêm giờ In 08:56, lý do "Quên chấm công 02" — hệ thống báo lỗi khi ấn Đăng ký. Lỗi cụ thể chưa được ghi nhận rõ trong tài liệu gốc, cần điều tra thêm. Đây là note incident thực tế từ hiện trường, không phải tài liệu hướng dẫn.

## Key Takeaways

- Chức năng **đăng ký quên chấm công** trên portal: user chọn ngày, thêm giờ In, nhập lý do
- Lỗi xảy ra ở bước ấn **Đăng ký** — hệ thống báo lỗi nhưng không rõ nội dung lỗi
- Sự cố ghi nhận ngày 06/01/2025, ngày công test là 08/08/2025
- Cần check log hệ thống để xác định nguyên nhân cụ thể

## Trích dẫn quan trọng

> Tạo đăng ký quên chấm công với các thông tin sau: ngày công 08/08/2025, chọn thêm giờ In lúc 08:56, lý do "Quên chấm công 02" — Ấn đăng ký: Hệ thống báo lỗi — Check lỗi không rõ đang báo lỗi gì.

## Liên kết

- [[wiki/sources/NghiepVu-ATT-SAL]] — Nghiệp vụ chấm công tổng quan (ATT01–05)
- [[wiki/concepts/HRM-Modules]] — Tổng quan các phân hệ HRM
- [[wiki/concepts/HRM-Log-Monitoring]] — Toolkit chẩn đoán log
