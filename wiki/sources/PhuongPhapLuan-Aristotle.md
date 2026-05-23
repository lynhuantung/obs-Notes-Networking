---
description: "Phương pháp Aristotle: tam đoạn luận kiểm tra tiền đề và logic kết luận, 4 lỗi lập luận phổ biến (Black Swan, Correlation≠Causation) áp dụng trong debug HRM."
type: source
code: s10ar
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "aristotle"
  - "syllogism"
  - "logic"
  - "critical-thinking"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/10-Aristotle-TamDoanLuan.md
related:
  - "[[wiki/concepts/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Socrates]]"
  - "[[wiki/sources/PhuongPhapLuan-FirstPrinciples]]"
---

# Aristotle — Tam đoạn luận · Bóc tách tiền đề · Kiểm tra logic

## Tóm tắt

Tam đoạn luận (Syllogism) là cấu trúc lập luận cơ bản nhất: Tiền đề lớn + Tiền đề nhỏ → Kết luận. Quy tắc vàng: kết luận chỉ đúng khi **cả hai tiền đề đều đúng**. Dùng để kiểm tra tính hợp lệ của kết luận từ AI, docs, đồng nghiệp — phát hiện Black Swan và Correlation ≠ Causation trước khi áp dụng.

## Key Takeaways

- **Quy tắc vàng**: Một tiền đề sai → kết luận sai **dù logic có vẻ chặt chẽ**
- **Black Swan**: Mọi quy tắc tổng quát đều có nguy cơ ngoại lệ — đặc biệt nguy hiểm trong production HRM
- **4 lỗi phổ biến**: Affirming the consequent / Hasty generalization / False dichotomy / Correlation ≠ Causation
- **Khi dùng**: Kiểm tra kết luận từ AI/docs, phát hiện logic sai trong bug report, RCA review

## Trích dẫn quan trọng

> Kết luận chỉ đúng khi **CẢ HAI tiền đề đều đúng** và **cấu trúc lập luận hợp lệ**.

> "Mỗi khi doanh số kem tăng, số vụ đuối nước cũng tăng" — không phải kem gây đuối nước, cả hai đều tăng vào mùa hè. *(Correlation ≠ Causation)*

## Quy trình 3 bước kiểm tra

```
Bước 1 — TÁCH: Bóc kết luận thành:
         [Tiền đề lớn: quy tắc tổng quát]
         [Tiền đề nhỏ: trường hợp cụ thể]
         [Kết luận: hệ quả]

Bước 2 — HỎI Socrates nhanh:
         "Tiền đề lớn có tuyệt đối không?"
         "Có ngoại lệ nào không?"
         "Đây là nhân quả hay tương quan?"

Bước 3 — SỬA nếu tiền đề không tuyệt đối:
         "đa số", "thường", "có khả năng", "trong điều kiện X"
```

## Ví dụ trong HRM

| Lỗi | Ví dụ HRM | Bẫy |
|-----|-----------|-----|
| **Hasty generalization** | "2 lần deploy thứ 2 bị lỗi → đừng deploy thứ 2" | Mẫu quá nhỏ |
| **Correlation ≠ Causation** | "Mỗi khi A deploy thì B lỗi → A gây lỗi B" | Có thể trùng nguyên nhân khác |
| **False dichotomy** | "Hoặc bug code, hoặc bug DB" | Bỏ sót lỗi config, network, permission |
| **Affirming the consequent** | "Đường ướt → trời mưa" | Có thể do xe tưới nước |

## Liên kết

- [[wiki/concepts/PhuongPhapLuan-Debug]] — Hệ 9 phương pháp tổng hợp
- [[wiki/sources/PhuongPhapLuan-Socrates]] — Socrates: câu hỏi kiểm tra tiền đề (dùng kèm Aristotle)
- [[wiki/sources/PhuongPhapLuan-FirstPrinciples]] — First Principles: rebuild từ facts sau khi bóc tiền đề
- [[wiki/sources/PhuongPhapLuan-Debug]] — 6 phương pháp core
