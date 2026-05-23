---
description: "First Principles Thinking: phá vỡ giả định xuống sự thật cơ bản nhất, quy trình 4 bước Strip→Identify→Rebuild→Compare áp dụng debug HRM."
type: source
code: s9fp
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "first-principles"
  - "deconstruction"
  - "reductionism"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/09-FirstPrinciples-TuDuyNguyenBan.md
related:
  - "[[wiki/concepts/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Socrates]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
---

# Tư duy Nguyên bản — First Principles Thinking

## Tóm tắt

First Principles Thinking phá vỡ mọi giả định xuống sự thật cơ bản nhất, rồi lý luận từ đó trở lên — ngược hoàn toàn với tư duy tương tự ("X làm vậy nên tôi cũng làm vậy"). Dùng khi giải pháp cũ không hiệu quả hoặc bug không giải thích được bằng docs/kinh nghiệm. Tài liệu gồm 30 câu hỏi theo 6 nhóm.

## Key Takeaways

- **Ngược tư duy tương tự**: Không copy cách X làm — truy "tại sao X làm vậy? Nguyên lý nào dưới đó? Còn cách nào khác?"
- **30 câu hỏi** theo 6 nhóm: Bản chất → Bóc tách cấu trúc → Thí nghiệm tư duy → Tái thiết lập → Mở rộng thiết kế → Hành động độc lập
- **Khi dùng**: Giải pháp cũ không hiệu quả, bug không giải thích được bằng docs, cần tư duy đột phá
- **Rủi ro**: Dễ over-engineer — cân bằng với tư duy tương tự cho vấn đề thông thường

## Trích dẫn quan trọng

> "Tư duy từ nguyên lý đầu tiên có nghĩa là: Phá vỡ mọi thứ xuống đến sự thật cơ bản nhất, rồi lý luận từ đó trở lên." — Elon Musk (từ Aristotle)

## Quy trình debug 4 bước

```
Strip    → Bỏ toàn bộ giả định, docs cũ, kinh nghiệm tích lũy
Identify → Liệt kê facts chắc chắn đúng về hệ thống (logic/vật lý)
Rebuild  → Từ facts đó, logic dẫn đến hành vi nào?
Compare  → So sánh với hành vi thực tế đang thấy → gap = vị trí bug
```

**Ví dụ HRM**: Schedule job không chạy → Strip docs cũ → Identify cơ chế cron → Rebuild điều kiện kích hoạt → Compare thực tế → Phát hiện service account bị thu hồi quyền sau deploy.

## Liên kết

- [[wiki/concepts/PhuongPhapLuan-Debug]] — Hệ 9 phương pháp tổng hợp
- [[wiki/sources/PhuongPhapLuan-Socrates]] — Socrates: kiểm tra tiền đề trước khi rebuild
- [[wiki/sources/PhuongPhapLuan-Aristotle]] — Aristotle: cấu trúc logic tam đoạn luận
- [[wiki/sources/PhuongPhapLuan-Debug]] — 6 phương pháp core
- [[wiki/architecture/HRM-System-Architecture]] — Nền tảng kỹ thuật HRM để Identify facts
