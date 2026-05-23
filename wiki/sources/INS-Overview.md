---
type: source
code: v6n1
tags:
  - "ins"
  - "overview"
  - "nhat-ky-van-de"
domain: ins
created: 2026-04-30
updated: 2026-04-30
source-file: raw/Nghiệp vụ HRM/INS/INS-Overview.md
related:
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/sources/INS-Chan-Doan-Su-Co]]"
  - "[[wiki/sources/INS-FAQ-Phan-Tich-BH]]"
  - "[[wiki/sources/INS-BC-D02]]"
  - "[[wiki/sources/INS-Thai-San-On-Off]]"
  - "[[wiki/sources/INS-NhatKy-VanDe-2017]]"
description: "Index tổng hợp các vấn đề logic phân hệ bảo hiểm 2017, phân loại theo báo cáo, chẩn đoán và kế hoạch cải tiến."
---

# Source: INS – Nhật Ký Vấn Đề Phân Hệ Bảo Hiểm (Overview)

## Tóm tắt

Tài liệu nội bộ VnResource HRM Pro 2017, tác giả Tung.Ly, phiên bản 1.0 (21/08/2017). Đây là trang index tổng hợp danh mục tất cả vấn đề **logic dài và khó** trong phân hệ Bảo Hiểm, phân loại theo 3 nhóm: Báo cáo & Phân tích, Chẩn đoán & Nguyên nhân gốc, Kế hoạch & Cải tiến. Tài liệu đặt ra triết lý xử lý bug BH cốt lõi của VnResource.

## Key Takeaways

- **Mục đích:** Index vấn đề BH để giảm bug khi thay đổi yêu cầu — tư duy phòng ngừa
- **3 Mantis chính:** #57589 (D02 thai sản), #57594 (ON-OFF thai sản), #87680 (lệch tháng timezone)
- **Triết lý xử lý bug:** "Đa số vấn đề BH do thiếu dữ liệu → VNR xử lý"
- **Nguyên tắc vàng:** "Hiện trường và dữ liệu tại hiện trường là không giống nhau" — phải kéo khách hàng cùng phân tích
- **4M framework:** Con người – Máy chủ – Dữ liệu đầu vào – Phương pháp
- Tài liệu này là **gateway** dẫn đến toàn bộ hệ thống ghi chú INS

## Trích dẫn quan trọng

> "**Hiện trường và dữ liệu tại hiện trường là không giống nhau**" – cần lôi kéo khách hàng cùng suy nghĩ.

> Đa số vấn đề bảo hiểm do **thiếu dữ liệu** → VNR xử lý.

> Nhóm nguyên nhân: **Con người – Máy chủ – Dữ liệu đầu vào – Phương pháp**.

## Liên kết

- [[wiki/architecture/INS-Architecture]] — Kiến trúc đầy đủ phân hệ INS
- [[wiki/sources/INS-Chan-Doan-Su-Co]] — Chẩn đoán sự cố chi tiết
- [[wiki/sources/INS-FAQ-Phan-Tich-BH]] — FAQ phân tích BH
- [[wiki/sources/INS-BC-D02]] — Mantis #57589
- [[wiki/sources/INS-Thai-San-On-Off]] — Mantis #57594
- [[wiki/sources/INS-Phan-Tich-BH-Lech-Thang]] — Mantis #87680
- [[wiki/sources/INS-NhatKy-VanDe-2017]] — Nhật ký vấn đề INS 2017
