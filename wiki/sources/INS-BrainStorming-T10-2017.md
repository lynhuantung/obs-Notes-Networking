---
type: source
description: "Brainstorming giảm bug INS táng 10/2017: phân tích Pareto, Kaizen và kế hoạch cải tiến bảo hiểm."
domain: ins
tags: [bao-hiem, brainstorming, ke-hoach, bug-reduction, pareto, kaizen, 2017]
source-file: raw/Nghiệp vụ HRM/INS/INS-BrainStorming-T10-2017.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-Kaizen-08]]"
  - "[[wiki/sources/INS-NhatKy-VanDe-2017]]"
  - "[[wiki/sources/INS-FishBone-Analysis]]"
  - "[[wiki/concepts/Kaizen-Methodology]]"
  - "[[wiki/architecture/INS-Architecture]]"
---

# INS — BrainStorming Mục Tiêu Tháng 10/2017 — Giảm Bug Pareto

## Tóm tắt

Tài liệu ghi lại kết quả tháng 09/2017 và kế hoạch tháng 10/2017 của team phân hệ INS. Tháng 9 vượt mục tiêu: giảm task Won't Fix từ 27 (tháng 8) xuống còn 6 (mục tiêu 10). Kế hoạch tháng 10 áp dụng nguyên lý Pareto: 70% bug tập trung ở 2 màn hình (Phân tích BH: 10 task + Báo cáo D02: 6 task), tập trung fix nguyên nhân gốc 2 màn hình này thay vì xử lý dàn trải.

## Key Takeaways

- **Kết quả T9/2017**: 21 task bug, 6 task Won't Fix (từ 59 task / 27 Won't Fix tháng 8) — vượt mục tiêu
- **7 cách đã giảm bug T9**: phân tích nguyên nhân, thêm trợ giúp UI, bổ sung FAQ, hướng dẫn phần tử BH, tự động chọn Tháng-Đợt, rà soát hàng ngày, lên kế hoạch fix trước QC
- **Nguyên lý Pareto INS**: 2 màn hình (Phân tích BH + Báo cáo D02) = **70% bug T9/2017**
- **Kế hoạch T10**: fix nguyên nhân gốc FAQ + BC-D02, tiêu chuẩn hoá tài liệu, rà soát TestCase QC, giảm thao tác dư thừa (UX)
- Tư duy này là nền tảng của approach Kaizen #08 trong `INS-Kaizen-08`

## Trích dẫn quan trọng

> Tập trung xử lý "Phân tích BH" + "Báo cáo D02" = giải quyết **70% bug** tháng 09/2017 (nguyên lý Pareto).

> Lên kế hoạch fix trước khi đến tay QC / khách hàng.

## Liên kết

- [[wiki/sources/INS-Kaizen-08]] — Nhật ký vấn đề BH (Kaizen #08, 2017) chi tiết
- [[wiki/sources/INS-NhatKy-VanDe-2017]] — Nhật ký vấn đề INS 2017 tổng hợp
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone + 5 Whys phân tích nguyên nhân
- [[wiki/concepts/Kaizen-Methodology]] — Phương pháp Kaizen: 5S, 4 cách cải tiến
