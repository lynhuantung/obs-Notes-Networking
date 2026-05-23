---
description: "Phương pháp thứ 12 trong hệ debug: bóc tách chức năng qua mô hình INPUT/LOGIC/OUTPUT/GUARD trước khi điều tra, đặc biệt phát hiện silent skip."
type: source
code: b4xt
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "boc-tach-chuc-nang"
  - "input-output-guard"
  - "phan-bien"
created: 2026-05-03
updated: 2026-05-03
related:
  - "[[wiki/concepts/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-Debug]]"
  - "[[wiki/sources/PhuongPhapLuan-FirstPrinciples]]"
  - "[[wiki/concepts/PKM-Methods]]"
---

# Source: Bóc tách chức năng — Tư duy nguyên bản trước khi debug

## Tóm tắt

Phương pháp thứ 12 trong hệ phương pháp luận debug — đặt **trước** tất cả phương pháp khác. Thay vì bắt đầu từ triệu chứng, phương pháp này bắt đầu từ bản chất chức năng: xây dựng mô hình INPUT / LOGIC / OUTPUT / GUARD trong đầu trước khi điều tra. Được phát triển từ thực tiễn debug HRM, đặc biệt hiệu quả với module xa lạ hoặc bug mô tả mơ hồ. Nguồn gốc từ cuộc trao đổi 2026-05-03 về kỹ thuật debug logic.

## Key Takeaways

- **Bước 0 bắt buộc**: Bóc tách chức năng trước khi chọn phương pháp debug — không có bản đồ này, mọi giả thuyết đều là đoán mò
- **GUARD là bước quan trọng nhất**: Silent skip (không lỗi, không log) là nguyên nhân phổ biến nhất bị bỏ qua khi debug
- **Phản biện câu 3 & 4** thường phát hiện root cause mà không cần đọc code: "output đúng trông như thế nào?" và "giả định nào chưa verify?"
- **Khác biệt với 6 phương pháp kia**: Holmes/Einstein/Toyota đều bắt đầu từ triệu chứng — phương pháp này bắt đầu từ **bản chất chức năng**
- **Ảnh hưởng đến (Downstream)**: biết output đi đâu giúp tránh fix nhầm chỗ — bug "di chuyển" khi fix cục bộ
- **Nhiều bug không phải code sai** mà là giả định sai về chức năng — quy trình onboarding thiếu bước gắn chế độ BH là điển hình

## Template cốt lõi

```
🔬 BÓC TÁCH CHỨC NĂNG: [keyword / tên chức năng]
────────────────────────
❓ CÂU HỎI GỐC
   Chức năng này tồn tại để giải quyết bài toán gì?
   Nếu bỏ nó đi, hệ thống thiếu điều gì?

⚙️ INPUT — Cần gì để chạy?
   Dữ liệu:   [bảng / trường / giá trị bắt buộc]
   Điều kiện: [trạng thái hệ thống phải thỏa mãn]
   Trigger:   [ai/gì kích hoạt — manual / schedule / event / màn hình nào]

🔄 LOGIC — Biến đổi như thế nào?
   Thực thi:  [SP / service / công thức core]
   Quy tắc:   [rule bất biến trong logic này]

📤 OUTPUT — Sinh ra cái gì?
   Ghi vào:      [bảng / trường nào thay đổi]
   Ảnh hưởng đến:[chức năng nào phụ thuộc output này]

🚫 GUARD — Khi nào KHÔNG chạy?
   Skip khi:  [điều kiện bị bỏ qua / silent — không báo lỗi]
   Fail khi:  [điều kiện báo lỗi rõ ràng]

🤔 PHẢN BIỆN
   - Nếu input đúng mà output sai → logic sai ở đâu?
   - Nếu logic đúng mà vẫn sai → guard có đang skip nhầm không?
   - Ta có thực sự biết output "đúng" trông như thế nào không?
   - Giả định nào đang được coi là hiển nhiên nhưng chưa verify?
────────────────────────
```

## Trích dẫn quan trọng

> "Trước khi hỏi *lỗi gì*, hãy hỏi *chức năng này tồn tại để làm gì*."

> "Nhiều bug không phải code sai — mà là giả định sai về chức năng."

> "GUARD silent skip là nguyên nhân phổ biến nhất bị bỏ qua: không lỗi, không log, chỉ đơn giản là không chạy."

> "'Không ra dữ liệu' = 0 dòng hay dòng có giá trị 0? Hai trường hợp này có root cause hoàn toàn khác nhau."

## Khi nào dùng

```
Nhận bug → hỏi ngay:
  ├─ Chưa từng đụng module này?          → Bóc tách TRƯỚC
  ├─ Mô tả mơ hồ "không ra dữ liệu"?    → Bóc tách TRƯỚC
  ├─ Không biết bắt đầu debug từ đâu?   → Bóc tách TRƯỚC
  └─ Sau khi bóc tách xong → chọn phương pháp tiếp theo:
       Có logs cụ thể    → Sherlock Holmes
       Lỗi nhiều tầng    → Contact Tracing
       Lỗi lặp lại       → Toyota 5 Whys
       Chỉ lỗi production → Einstein
```

## Liên kết

- [[wiki/concepts/PhuongPhapLuan-Debug]] — Tổng quan hệ phương pháp luận
- [[wiki/sources/PhuongPhapLuan-Debug]] — Source 6 phương pháp core
- [[wiki/sources/PhuongPhapLuan-FirstPrinciples]] — First Principles: Strip→Identify→Rebuild→Compare
- [[wiki/sources/INS-Chan-Doan-Su-Co]] — Ví dụ thực tế HRM: chẩn đoán sự cố BH
- [[wiki/bugs/Ins027-phan-tich-bh-expression-expected-phan-tu-bh]] — Bug thực tế áp dụng GUARD analysis
