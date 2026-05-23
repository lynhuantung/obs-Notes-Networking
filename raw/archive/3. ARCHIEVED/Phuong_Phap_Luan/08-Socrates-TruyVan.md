---
type: source
domain: system
tags:
  - "phuong-phap-luan"
  - "debug"
  - "socrates"
  - "critical-thinking"
  - "questioning"
created: 2026-05-02
updated: 2026-05-02
source-file: raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/08-Socrates-TruyVan.md
related:
  - "[[wiki/concepts/PKM-Methods]]"
  - "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
---

# Phương pháp Socrates — Truy vấn · Làm rõ · Phát hiện sai sót

> **Nhóm**: Phương pháp luận Debug  
> **Phù hợp**: Khi cần kiểm tra giả định, phát hiện lỗi logic ẩn, làm rõ khái niệm mơ hồ

---

## Nguyên tắc cốt lõi

> "Tôi biết rằng tôi không biết gì." — Socrates

Phương pháp Socrates không cung cấp câu trả lời — nó **đặt câu hỏi liên tiếp** để:
1. Bóc tách giả định ẩn dưới một phát biểu
2. Phát hiện mâu thuẫn logic mà người nói chưa nhận ra
3. Dẫn người học đến sự hiểu biết thực sự thay vì chấp nhận bề mặt

**Ứng dụng debug**: Khi AI (hoặc đồng nghiệp) đưa ra kết luận tự tin — hãy chạy truy vấn Socrates trước khi tin.

---

## Hệ thống 35 câu hỏi truy vấn Socrates

### 📘 A. Làm rõ khái niệm và ý định

1. Tác giả / hệ thống thực sự đang cố nói điều gì ở đây?
2. Tôi có đang hiểu đúng khái niệm X mà tác giả dùng không?
3. Tác giả đang định nghĩa từ X theo ngữ cảnh cụ thể nào? Có thể hiểu theo nghĩa khác không?
4. Tôi có đồng ý với cách sử dụng thuật ngữ không?
5. Có thể diễn đạt luận điểm đó đơn giản hơn mà không làm sai ý không?

### 🧱 B. Phân tích luận điểm và lập luận

6. Những luận điểm chính là gì? Có cấu trúc logic chặt chẽ không?
7. Có những bước nhảy logic nào giữa các ý không?
8. Tác giả sử dụng loại suy hoặc ví dụ nào? Những ví dụ đó có đủ mạnh không?
9. Luận điểm này dựa trên dữ liệu hay ý kiến cá nhân?
10. Nếu dữ liệu được sử dụng, nguồn có đáng tin cậy? Có sai số không?

### 🧠 C. Phát hiện giả định ngầm và tiền đề

11. Có giả định ngầm nào chưa được kiểm chứng không?
12. Điều gì sẽ xảy ra nếu giả định X là sai?
13. Tác giả đang ngầm cho rằng điều gì là "đúng"? Tôi có đồng tình không?
14. Nếu thay giả định A bằng giả định B, toàn bộ lập luận có thay đổi không?
15. Giả định này mang tính phổ quát hay chỉ đúng trong một ngữ cảnh cụ thể?

### 🔄 D. So sánh góc nhìn và lập trường khác

16. Có quan điểm nào khác mà tài liệu không đề cập tới không?
17. Tôi có từng nghe ai lập luận ngược lại điều này chưa?
18. Nếu tôi là người phản đối, tôi sẽ phản biện ra sao?
19. Văn hóa, thời gian, hoặc bối cảnh có ảnh hưởng đến quan điểm không?
20. Nếu thay tác giả bằng người thuộc nền văn hóa khác, nội dung có thay đổi không?

### 🧭 E. Khám phá hệ quả và giả định kéo theo

21. Nếu lập luận này đúng, điều gì xảy ra tiếp theo trong thực tế?
22. Có tác động tiêu cực tiềm ẩn từ việc áp dụng ý tưởng này không?
23. Nếu toàn bộ tổ chức tin điều này, chuyện gì sẽ xảy ra?
24. Có luận điểm nào dẫn đến mâu thuẫn hoặc nghịch lý nội tại không?
25. Lập luận này sẽ ảnh hưởng như thế nào đến các lĩnh vực khác?

### 🎯 F. Phản tư về chính bản thân mình

26. Tôi có đang gán quá nhiều kỳ vọng vào kết quả / tài liệu này không?
27. Điều này có khiến tôi thay đổi suy nghĩ ban đầu không? Vì sao?
28. Phần nào khiến tôi cảm thấy khó chịu hoặc nghi ngờ? Điều đó nói gì về tôi?
29. Có phần nào tôi bỏ qua mà lẽ ra nên xem kỹ hơn?
30. Tôi có đang đọc / nghe để hiểu thật sự, hay chỉ để xác nhận niềm tin sẵn có?

### 🧰 G. Mở rộng việc đặt câu hỏi

31. Câu hỏi nào chưa được đặt ra trong tài liệu / cuộc trò chuyện này?
32. Nếu buộc phải phản đối, tôi sẽ dùng chiến lược nào?
33. Tôi có thể kiểm tra lại bằng cách thu thập dữ liệu phản ví dụ không?
34. Tôi sẽ đặt thêm câu hỏi gì nếu được phỏng vấn chính tác giả / hệ thống?
35. Tôi có thể dùng câu hỏi nào để kiểm tra độ chính xác của từng phần?

---

## Ứng dụng với AI / LLM output

AI trả lời rất tự tin — nhưng chỉ cần tiền đề sai là kết luận sai theo.

**Quy trình kiểm tra nhanh:**
1. Tách câu trả lời thành: tiền đề lớn – tiền đề nhỏ – kết luận
2. Hỏi Socrates nhanh: **"Có chắc không?", "Có ngoại lệ không?", "Bạn biết hết chưa?"**
3. Nếu tiền đề không tuyệt đối → sửa sang ngôn ngữ xác suất: *đa số, thường, có khả năng*

---

## Ưu / Nhược điểm

| Ưu điểm | Nhược điểm |
|---------|-----------|
| Phát hiện giả định ẩn | Mất thời gian nếu áp dụng tất cả 35 câu |
| Tránh tin mù quáng vào AI/expert | Cần kiên nhẫn và dũng cảm tự chất vấn |
| Rèn tư duy phản biện | Đôi khi không có câu trả lời rõ ràng |

---

## Liên kết
- `10-Aristotle-TamDoanLuan.md` — Cấu trúc tam đoạn luận (tiền đề lớn/nhỏ/kết luận)
- `09-FirstPrinciples-TuDuyNguyenBan.md` — Truy về nguyên lý gốc
- `01-Sherlock-Holmes.md` — Loại trừ có hệ thống
