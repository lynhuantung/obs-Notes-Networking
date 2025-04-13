---
aliases: 
date: 2025-04-02
tags:
  - "#AI"
  - "#dev"
  - "#misa"
---
# Brain storm
- 


# Chủ đề
 ![[Pasted image 20250402150329.png]]
![[Pasted image 20250402150428.png]]


![[Pasted image 20250402150649.png]]


 ![[Pasted image 20250402150747.png]]
 model AI : claude 3.7
 agent
 - rule content  : đưa file để AI đọc và làm theo rule của mình
 - 
 Memory bank
 ---
 Tuyệt vời, Tùng! Dưới đây là phần giới thiệu tổng quan và chi tiết từng thành phần của **AI Cursor** mà bạn đang quan tâm:

---

## 🧠 **AI Cursor là gì?**

AI Cursor là một công cụ lập trình tích hợp AI, thường hoạt động trên VSCode hoặc trình chỉnh sửa tương tự, cho phép bạn **làm việc cùng AI như một đồng đội lập trình thực thụ**. Nó hỗ trợ nhiều tính năng như:

- Viết code, sửa bug, sinh test case.
    
- Làm theo quy tắc riêng của bạn (Rule-based Agent).
    
- Ghi nhớ dài hạn qua **Memory Bank**.
    
- Hỗ trợ nhiều mô hình mạnh mẽ như Claude 3.5/3.7, GPT-4, v.v.
    

---

## 🔍 **Mô hình AI: Claude 3.7**

Claude 3.7 (có thể là bạn viết nhầm từ Claude 3.5 hoặc Claude Opus) là model của **Anthropic** – nổi bật với:

- Hiểu ngữ cảnh cực tốt.
    
- Dễ điều chỉnh hành vi qua rule.
    
- Xử lý file lớn (trên 100k token).
    

Trong Cursor, bạn có thể chọn model Claude để làm việc cùng file và hướng dẫn chi tiết.

---

## 🤖 **Agent trong Cursor**

### ✅ Tính năng "Agent"

Agent là AI có thể làm việc **dựa trên rule bạn cung cấp**. Bạn có thể:

- **Tạo rule bằng tiếng Việt hoặc tiếng Anh**, ví dụ:
    
    ```markdown
    Luật: Nếu tôi gửi file Python, hãy kiểm tra chuẩn PEP8 và gợi ý cải tiến code rõ ràng.
    ```
    
- **Đưa nhiều file** để AI "đọc hiểu" và phản hồi theo rule.
    
- Agent sẽ làm theo "luật chơi" bạn đặt ra → như huấn luyện một trợ lý riêng.
    

### ✨ Ứng dụng gợi ý:

- Code review theo tiêu chuẩn công ty.
    
- Viết tài liệu kỹ thuật từ mã nguồn.
    
- Diễn giải hoặc tái cấu trúc file phức tạp.
    

---

## 🧬 **Memory Bank (Ngân hàng trí nhớ)**

### ✅ Là nơi lưu:

- **Thông tin bạn đã dạy AI**
    
- **Thông tin thường dùng** như project structure, luật đặt tên, convention, coding style...
    

### Cách hoạt động:

- Bạn lưu memory dưới dạng file Markdown.
    
- AI sẽ tự động tham chiếu đến Memory Bank khi tương tác.
    
- Bạn có thể tổ chức Memory theo project hoặc role (PM, Dev, QA...)
    

---

## 📁 **Cấu trúc mẫu để bắt đầu**

```
.my-cursor/
│
├── memory/
│   └── my-project-style.md   ← rule về style đặt tên, viết code, mô tả API
│
├── agents/
│   └── doc-writer.md         ← rule: tạo tài liệu API từ code
│   └── bug-hunter.md         ← rule: tìm lỗi logic và gợi ý sửa
```

