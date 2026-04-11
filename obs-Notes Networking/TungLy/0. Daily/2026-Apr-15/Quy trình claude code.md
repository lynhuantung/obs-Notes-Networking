---
Mã:
aliases:
date: 2026-04-09
tags:
  - daily
  - "#claude-code"
Project:
---
Input
  ↓
Analyze (LLM)
  ↓
Plan
  ↓
Execute (Tools)
  ↓
Observe
  ↓
Loop (Fix nếu sai)
  ↓
Save Memory

## 🔄 Quy trình hoạt động AI Agent (chuẩn production)

### 🧠 Bước 1: Nhận input

- User gửi yêu cầu (VD: “fix bug API”, “optimize SQL”)
- Agent đọc:
    - prompt
    - context (file, log, DB…)

---

### 🧩 Bước 2: Phân tích & lập kế hoạch

- LLM (ví dụ Claude 3.7) sẽ:
    - Hiểu bài toán
    - Chia thành step nhỏ

👉 Ví dụ:

- Step 1: đọc file
- Step 2: tìm lỗi
- Step 3: đề xuất fix

---

### 🛠 Bước 3: Thực thi bằng tool

- Agent dùng tool:
    - read file
    - write code
    - run command

👉 Quan trọng:

- Không đoán → **phải đọc dữ liệu thật**

---

### 🔍 Bước 4: Quan sát kết quả

- Check:
    - code compile OK chưa
    - query chạy nhanh hơn chưa
    - có lỗi mới không

---

### 🔁 Bước 5: Tự sửa (loop)

- Nếu lỗi:
    - quay lại bước 2
- Nếu OK:
    - chuyển bước tiếp

👉 Đây là điểm “agent” khác chatbot

---

### 💾 Bước 6: Lưu memory

- Lưu:
    - kết quả tốt
    - lỗi đã gặp
- Dùng cho lần sau