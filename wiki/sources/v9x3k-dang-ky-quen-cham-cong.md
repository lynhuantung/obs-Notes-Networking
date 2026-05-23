---
type: source
code: v9x3k
description: "Incident đăng ký quên chấm công portal báo lỗi không rõ: ngày 08/08/2025, giờ In 08:56, lý do 'Quên chấm công 02' — cần debug"
domain: att
tags:
  - att
  - incident
  - portal
  - quen-cham-cong
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/sources/ATT-DangKy-QuenChamCong]]"
  - "[[wiki/sources/p1a3t-att-overview]]"
  - "[[wiki/bugs/_index]]"
---

# Source: Đăng ký quên chấm công – Incident

## Tóm tắt

Ghi chép sự cố người dùng đăng ký quên chấm công trên portal HRM ngày 10/05/2026. Tạo đăng ký cho ngày 08/08/2025 (giờ In 08:56, lý do "Quên chấm công 02") — ấn đăng ký hệ thống báo lỗi không rõ nội dung lỗi. Là raw incident note, chưa có root cause.

## Key Takeaways

- Bước tái hiện: Đăng nhập portal → mục đăng ký quên chấm công → ngày 08/08/2025, giờ In 08:56 → ấn đăng ký → lỗi
- Lỗi không rõ nội dung — cần check log hoặc F12 network để xem response thực tế
- Đã có source liên quan trước đó: `ATT-DangKy-QuenChamCong` (incident 2026-04-29)
- Trạng thái: **chưa root cause**

## Trích dẫn quan trọng

> Check lỗi không rõ đang báo lỗi gì

## Liên kết

- [[wiki/sources/ATT-DangKy-QuenChamCong]] — incident tương tự 2026-04-29: đăng ký quên chấm công portal báo lỗi
- [[wiki/bugs/_index]] — nếu confirmed bug cần thêm vào index
