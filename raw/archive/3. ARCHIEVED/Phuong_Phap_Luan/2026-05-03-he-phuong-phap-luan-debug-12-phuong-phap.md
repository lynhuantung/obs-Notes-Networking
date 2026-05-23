---
title: "Hệ phương pháp luận Debug — 12 phương pháp"
date: 2026-05-03
code: d7rx
domain: system
module: "methodology / debug"
tags:
  - "phuong-phap-luan"
  - "debug"
  - "methodology"
  - "boc-tach-chuc-nang"
verified: yes
related:
  - "[[wiki/concepts/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-BocTachChucNang]]"
---

# Hệ phương pháp luận Debug — 12 phương pháp

## Tóm tắt

Tổng hợp toàn bộ 12 phương pháp debug từ hệ LLM Wiki, bao gồm 6 phương pháp core,
5 phương pháp bổ sung, và phương pháp nền tảng #12 Bóc tách chức năng vừa được
ingest 2026-05-03. Tài liệu này ghi lại kết quả học và sơ đồ chọn phương pháp
theo loại bug.

## Nguyên lý nền tảng

> Gỡ lỗi = cập nhật mental models khi mô hình tâm trí không còn khớp với
> hiện thực hệ thống.

## Bước 0 — Trước khi chọn phương pháp

**#12 Bóc tách chức năng** — chạy TRƯỚC TẤT CẢ khi chưa biết bug ở đâu.

```
CÂU HỎI GỐC → INPUT → LOGIC → OUTPUT → GUARD → PHẢN BIỆN
```

> GUARD silent skip là nguyên nhân phổ biến nhất bị bỏ qua —
> không lỗi, không log, chỉ đơn giản không chạy.

## 6 Phương pháp Core

| # | Phương pháp | Dùng khi |
|---|------------|---------|
| 1 | **Sherlock Holmes** — Liệt kê giả thuyết, loại trừ bằng bằng chứng | Có logs rõ, triệu chứng cụ thể |
| 2 | **Einstein** — Đơn giản hóa về 2 node, thí nghiệm tư duy | Chỉ lỗi production, không tái hiện local |
| 3 | **Da Vinci** — Vẽ dependency diagram, tìm leverage point | Fix chỗ này, chỗ khác lại lỗi |
| 4 | **Toyota 5 Whys + PDCA** — Hỏi "tại sao" ≥5 lần, sửa gốc rễ | Lỗi lặp lại hàng tháng |
| 5 | **Contact Tracing** — Lần ngược causal chain, tìm "bệnh nhân 0" | HTTP 500, lỗi qua nhiều tầng |
| 6 | **Feynman** — Giải thích đơn giản nhất, chỗ vấp = bug ẩn | Hiểu mơ hồ, handover, review |

## 5 Phương pháp bổ sung

| # | Phương pháp | Dùng khi |
|---|------------|---------|
| 7  | **Socrates** — 35 câu hỏi bóc giả định ẩn | AI/docs đưa kết luận tự tin |
| 8  | **First Principles** — Strip → Identify → Rebuild → Compare | Giải pháp cũ không còn đúng |
| 9  | **Aristotle Syllogism** — Tam đoạn luận, Black Swan | Kiểm tra kết luận có hợp lý không |
| 10 | **SAT Lan truyền** — Kích hoạt nút → lan truyền wiki | Tìm pattern bug tương tự đã gặp |
| 11 | **Zettelkasten** — Atomic notes + linking | Quản lý tri thức debug dài hạn |

## Sơ đồ chọn nhanh

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

## Bài học / Lưu ý

- Phương pháp #12 là bước 0 — không bỏ qua dù bug có vẻ đơn giản
- GUARD silent skip nguy hiểm hơn exception vì không để lại dấu vết
- Khi bế tắc: thử #7 Socrates để bóc giả định ngầm trước khi đọc thêm code
- Fix cục bộ mà không biết Downstream → bug "di chuyển" sang chỗ khác

## Liên kết

- [[wiki/concepts/PhuongPhapLuan-Debug]] — Tổng quan đầy đủ 12 phương pháp
- [[wiki/sources/PhuongPhapLuan-BocTachChucNang]] — Chi tiết phương pháp #12
- [[wiki/sources/PhuongPhapLuan-Debug]] — Source 6 phương pháp core
- [[wiki/sources/INS-FishBone-Analysis]] — Ví dụ thực chiến Toyota + Da Vinci
