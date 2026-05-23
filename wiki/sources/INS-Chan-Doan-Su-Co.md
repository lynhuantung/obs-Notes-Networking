---
type: source
description: "Hướng dẫn chẩn đoán sự cố bảo hiểm HRM: phân tích 4M, troubleshooting phân tích BH theo từng tập."
domain: ins
tags: [bao-hiem, chan-doan, troubleshooting, su-co, phan-tich-BH, 4M]
source-file: raw/Nghiệp vụ HRM/INS/INS-Chan-Doan-Su-Co.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-FAQ-Phan-Tich-BH]]"
  - "[[wiki/sources/INS-TruyNguyenNhan]]"
  - "[[wiki/sources/INS-Troubleshooting-5Why]]"
  - "[[wiki/architecture/INS-Architecture]]"
---

# INS — Chẩn Đoán Sự Cố Bảo Hiểm

## Tóm tắt

Tài liệu mô tả chức năng Chẩn đoán sự cố bảo hiểm trong HRM và danh sách trục trặc đã ghi nhận. Chức năng chính xử lý 3 vấn đề: (1) chưa chọn nơi đóng BH, (2) chức danh theo luật bị trống, (3) chức vụ theo luật bị trống. Danh sách trục trặc gồm 3 mục đã ghi nhận: không lấy được Tên Công Việc, không tính được số tiền đóng BH, và phân tích BH tháng N ra tháng N-1 (do timezone).

## Key Takeaways

- BH yêu cầu chức danh/chức vụ luôn là **tiếng Việt** (dùng trường "theo luật" riêng biệt)
- **3 loại trục trặc đã ghi nhận**: Tên Công Việc, Số Tiền BH, Phân tích lệch tháng (timezone)
- Trục trặc **timezone**: phân tích chọn tháng 9 ra tháng 8 — fix: đồng bộ timezone server/client + restart
- Bảng trục trặc được thiết kế để **cập nhật liên tục** từ hiện trường
- Triết lý: "Hiện trường và dữ liệu tại hiện trường là không giống nhau" — khách hàng có khả năng tìm nguyên nhân gốc cao nhất

## Trích dẫn quan trọng

> Bảo hiểm yêu cầu chức danh/chức vụ luôn là **tiếng Việt** (dùng trường "theo luật").

> Phân tích BH tháng N ra tháng N-1 — Nguyên nhân: Múi giờ (timezone) giữa máy server và máy client của Khách hàng không đồng bộ. Xử lý: Chỉnh lại múi giờ + Restart server.

## Liên kết

- [[wiki/sources/INS-FAQ-Phan-Tich-BH]] — FAQ phân tích bảo hiểm tổng quan
- [[wiki/sources/INS-TruyNguyenNhan]] — 4M Root Cause Analysis
- [[wiki/sources/INS-Troubleshooting-5Why]] — 5-Why RCA cho Tên Công Việc + Số Tiền BH
- [[wiki/architecture/INS-Architecture]] — Architecture phân hệ INS
