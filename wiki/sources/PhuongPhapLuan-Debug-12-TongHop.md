---
description: "Tổng hợp 12 phương pháp debug sau buổi học 03/05/2026: sơ đồ chọn phương pháp theo loại bug và template prompt dùng ngay với LLM."
type: source
code: d7rx
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "methodology"
  - "boc-tach-chuc-nang"
  - "tong-hop"
created: 2026-05-03
updated: 2026-05-03
related:
  - "[[wiki/concepts/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-BocTachChucNang]]"
  - "[[wiki/sources/INS-FishBone-Analysis]]"
---

# Source: Hệ phương pháp luận Debug — Tổng hợp 12 phương pháp

## Tóm tắt

Tài liệu tổng hợp toàn bộ 12 phương pháp debug sau buổi học 2026-05-03, bao gồm
6 phương pháp core (Sherlock → Feynman), 5 phương pháp bổ sung (Socrates → Zettelkasten),
và phương pháp nền tảng #12 Bóc tách chức năng vừa được phát triển từ thực tiễn HRM.
Điểm đặc biệt: tài liệu này ghi lại **sơ đồ chọn phương pháp theo loại bug** và
**template prompt** dùng ngay với LLM.

## Key Takeaways

- **Bước 0 bắt buộc**: Phương pháp #12 (Bóc tách chức năng) chạy TRƯỚC tất cả — xây mô hình CÂU HỎI GỐC / INPUT / LOGIC / OUTPUT / GUARD / PHẢN BIỆN trước khi chọn phương pháp debug
- **GUARD silent skip** nguy hiểm hơn exception: không lỗi, không log, chỉ đơn giản không chạy — phổ biến nhất bị bỏ qua
- **Khi bế tắc sau khi đã thử**: chuyển sang #7 Socrates (bóc giả định ngầm) hoặc #8 First Principles (rebuild từ gốc)
- **Fix cục bộ mà không biết Downstream** → bug "di chuyển" sang chỗ khác — Da Vinci (#3) giúp tìm leverage point để fix 1 chỗ, ảnh hưởng nhiều nơi
- **Sơ đồ chọn nhanh**: mỗi dấu hiệu bug map trực tiếp sang 1 phương pháp — không cần nhớ hết 12 cái, chỉ cần biết hỏi đúng câu hỏi

## Trích dẫn quan trọng

> "Gỡ lỗi = cập nhật mental models khi mô hình tâm trí không còn khớp với hiện thực hệ thống."

> "Trước khi hỏi *lỗi gì*, hãy hỏi *chức năng này tồn tại để làm gì*." — Bóc tách chức năng #12

> "GUARD silent skip là nguyên nhân phổ biến nhất bị bỏ qua — không lỗi, không log, chỉ đơn giản không chạy."

> "Phương pháp #12 là bước 0 — không bỏ qua dù bug có vẻ đơn giản."

## Sơ đồ chọn phương pháp

```
Nhận bug
  │
  ├─ Chưa hiểu chức năng?       →  #12 Bóc tách chức năng (TRƯỚC TIÊN)
  │
  ├─ Có logs rõ?                 →  #1  Sherlock Holmes
  ├─ Chỉ lỗi production?         →  #2  Einstein
  ├─ Fix xong lại lỗi chỗ khác? →  #3  Da Vinci
  ├─ Lỗi lặp lại?                →  #4  Toyota 5 Whys
  ├─ Không biết bắt đầu?         →  #5  Contact Tracing
  ├─ Hiểu mơ hồ?                 →  #6  Feynman
  │
  └─ Bế tắc sau khi đã thử?
       Giả định chưa verify?      →  #7  Socrates
       Giải pháp cũ không đúng?  →  #8  First Principles
       Kết luận hợp lý không?    →  #9  Aristotle
       Đã gặp pattern này chưa?  →  #10 SAT / wiki search
```

## Template prompt dùng ngay

```
[Bóc tách] CÂU HỎI GỐC / INPUT / GUARD của [chức năng]: ...
[Holmes]   Liệt kê nghi phạm + loại trừ bằng logs: [logs]
[Einstein] Đơn giản về 2 node: [mô tả]. Lỗi còn xảy ra không?
[Da Vinci] Vẽ dependency graph [hệ thống]. Tìm leverage point.
[Toyota]   5 Whys từ: [triệu chứng]. Hỏi ≥5 lần.
[Tracing]  Causal chain từ [lỗi] ngược về gốc. Bệnh nhân 0?
[Feynman]  Tôi giải thích: [giải thích]. Chỗ nào sai / thiếu?
```

## Liên kết

- [[wiki/concepts/PhuongPhapLuan-Debug]] — Tổng quan đầy đủ 12 phương pháp
- [[wiki/sources/PhuongPhapLuan-BocTachChucNang]] — Chi tiết phương pháp #12
- [[wiki/sources/PhuongPhapLuan-Debug]] — Source 6 phương pháp core
- [[wiki/sources/INS-FishBone-Analysis]] — Ví dụ thực chiến Toyota (#4) + Da Vinci (#3)
- [[wiki/bugs/Sys025-iis-oom-vnpay]] — Bug thực tế áp dụng Toyota PDCA
- [[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]] — Bug thực tế áp dụng Contact Tracing
