---
type: source
domain: ins
tags: [bao-hiem, thai-san, on-off, nguyen-tac, mantis-57594, D02]
source-file: raw/Nghiệp vụ HRM/INS/INS-Thai-San-On-Off.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-BC-D02]]"
  - "[[wiki/sources/INS-Kaizen-08]]"
  - "[[wiki/sources/INS-NhatKy-VanDe-2017]]"
  - "[[wiki/architecture/INS-Architecture]]"
description: "Nguyên tắc ON/OFF thai sản Mantis #57594: pivot ngày 14/15 quyết định đóng/không đóng BH tháng N khi nghỉ thai sản."
---

# INS — Nguyên Tắc ON/OFF Thai Sản (Mantis #57594)

## Tóm tắt

Tài liệu ghi nhận nguyên tắc tính ON/OFF thai sản khi đóng bảo hiểm — Mantis #57594. Quy tắc: **ON** (được đóng BH tháng N) nếu ngày bắt đầu thai sản trong khoảng ngày 15 tháng N-1 đến ngày 14 tháng N; **OFF** (không đóng BH tháng N) nếu ngày kết thúc thai sản trong cùng khoảng đó. Ảnh hưởng tất cả khách hàng dùng báo cáo D02. Phần lý do và xử lý chi tiết chưa được điền trong tài liệu gốc.

## Key Takeaways

- **Rule ON**: ngày bắt đầu thai sản ∈ [ngày 15 tháng N-1, ngày 14 tháng N] → được đóng BH tháng N
- **Rule OFF**: ngày kết thúc thai sản ∈ [ngày 15 tháng N-1, ngày 14 tháng N] → không đóng BH tháng N
- Pivot ngày **14/15** là ranh giới quyết định — đây là đặc thù nghiệp vụ BH Việt Nam
- Mantis #57594, ảnh hưởng rộng — toàn bộ khách hàng dùng D02
- Liên quan chặt với Mantis #57589 (bug D02 không hiển thị điều chỉnh lương khi nghỉ thai sản)
- Xem chi tiết hơn trong `INS-NghiThaiSan` và `INS-Kaizen-08`

## Trích dẫn quan trọng

> **ON** – Được đóng BH tháng N nếu ngày bắt đầu thai sản ∈ [ngày 15 tháng N-1 → ngày 14 tháng N]

> **OFF** – Không đóng BH tháng N nếu ngày kết thúc thai sản ∈ [ngày 15 tháng N-1 → ngày 14 tháng N]

## Liên kết

- [[wiki/sources/INS-NghiThaiSan]] — Chế độ thai sản đầy đủ: 6 tháng, 100% lương, không cắt bản ghi
- [[wiki/sources/INS-BC-D02]] — Bug D02 liên quan (Mantis #57589)
- [[wiki/sources/INS-Kaizen-08]] — Kaizen #08 ghi nhận ON-OFF thai sản 2017
- [[wiki/sources/INS-NhatKy-VanDe-2017]] — Nhật ký D02 thai sản 2017
