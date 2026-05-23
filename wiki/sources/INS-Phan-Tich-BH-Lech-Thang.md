---
type: source
domain: ins
tags: [bao-hiem, phan-tich-BH, timezone, bug, mantis-87680, lech-thang]
source-file: raw/Nghiệp vụ HRM/INS/INS-Phan-Tich-BH-Lech-Thang.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-Chan-Doan-Su-Co]]"
  - "[[wiki/sources/INS-FAQ-Phan-Tich-BH]]"
  - "[[wiki/sources/INS-Kaizen-08]]"
  - "[[wiki/architecture/INS-Architecture]]"
description: "Phân tích bug bảo hiểm lệch tháng Mantis #87680: timezone sai khiến dữ liệu tháng N ra kết quả tháng N-1."
---

# INS — Phân Tích BH Tháng N Ra Tháng N-1 (Timezone Bug)

## Tóm tắt

Tài liệu ngắn ghi nhận bug Mantis #87680: khi phân tích bảo hiểm người dùng chọn tháng 9 nhưng lưới hiển thị dữ liệu tháng 8. Nguyên nhân: timezone giữa server và client không đồng bộ. Cách xử lý: đồng bộ timezone + restart server. Đây là bug thực tế từ hiện trường, pattern hay gặp khi triển khai HRM tại khách hàng có server chạy múi giờ không chuẩn.

## Key Takeaways

- **Root cause**: timezone server ≠ timezone client → datetime shift 1 tháng
- **Fix**: (1) đồng bộ múi giờ server/client, (2) restart server sau khi chỉnh
- Mantis #87680 — đã xử lý
- Đây là 1 trong 3 trục trặc chính trong `INS-Chan-Doan-Su-Co`
- Bug dạng này hay gặp khi server không set timezone Vietnam (UTC+7)

## Trích dẫn quan trọng

> **Nguyên nhân**: Múi giờ (timezone) giữa máy server và máy client của Khách hàng không đồng bộ.
> **Xử lý**: Chỉnh lại múi giờ cho máy server và client để đồng bộ. Restart lại server sau khi chỉnh.

## Liên kết

- [[wiki/sources/INS-Chan-Doan-Su-Co]] — Danh sách trục trặc BH (mục #3 timezone bug)
- [[wiki/sources/INS-FAQ-Phan-Tich-BH]] — FAQ phân tích BH + 4M framework
- [[wiki/sources/INS-Kaizen-08]] — Kaizen #08 ghi nhận timezone bug (2017)
