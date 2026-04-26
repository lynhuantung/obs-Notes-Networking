---
type: source
tags:
  - ai
  - cursor
  - dev-tool
  - memory-bank
  - "2025"
date-updated: 2026-04-25
date-ingested: 2026-04-25
category: research
project: general
related:
- "[[wiki/concepts/AI-DevTools]]"
---

# AI Cursor — Tổng quan & Memory Bank

**Nguồn gốc**: `3. ARCHIEVED/Daily-2025/2025-Apr-14/AI Cursor.md`  
**Ngày**: 04/04/2025

---

## Cursor AI là gì

**Cursor** là AI dev tool kết hợp code editor + trợ lý AI, dùng GPT-4 / Claude 3 / Gemini Pro. Tích hợp sẵn vào IDE, hỗ trợ:

| Tính năng | Mô tả |
|-----------|-------|
| Chat context-aware | Hiểu toàn bộ repo, trả lời câu hỏi sâu |
| Autocomplete | Gợi ý code theo ngữ cảnh, nhiều ngôn ngữ |
| Explain / Debug | Giải thích code, tìm bug, refactor |
| Natural Language Search | "Where is login API?" → tìm đúng file |
| Command Edit | "Make async" → AI tự sửa |
| Generate Docs | Sinh README, docstring, API docs |
| Git Integration | Đọc commit history, gợi ý commit message |

## Memory Bank — Cơ chế ghi nhớ dự án

Cursor reset hoàn toàn sau mỗi phiên → phụ thuộc **100% vào Memory Bank** (thư mục file markdown):

```
projectbrief.md   → mục tiêu, phạm vi
productContext.md → tại sao dự án tồn tại
systemPatterns.md → kiến trúc, design patterns
techContext.md    → tech stack, constraints
activeContext.md  → việc đang làm, quyết định hiện tại
progress.md       → done / todo / known issues
```

**.cursorrules** = nhật ký học tập: thói quen user, naming convention, luồng xử lý đặc thù.

## Key Insights

- Cursor Memory Bank **về bản chất giống LLM Wiki** — persistent knowledge base để AI hoạt động qua nhiều session
- Hai chế độ: **Plan Mode** (lập kế hoạch) và **Act Mode** (thực thi)
- Cập nhật Memory Bank khi: phát hiện pattern mới, thay đổi lớn, user yêu cầu "update memory bank"
