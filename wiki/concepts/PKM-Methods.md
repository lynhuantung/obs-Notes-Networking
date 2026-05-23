---
description: "Các phương pháp quản lý tri thức cá nhân (PARA, Zettelkasten, Second Brain) làm nền tảng xây dựng wiki HRM."
type: concept
tags:
  - pkm
  - learning
  - second-brain
  - obsidian
  - knowledge-management
date-updated: 2026-04-27
related:
  - "[[wiki/concepts/AI-DevTools]]"
  - "[[wiki/concepts/Vault-Structure]]"
---

# Concept: PKM Methods (Personal Knowledge Management)

## Tổng quan

Tổng hợp các phương pháp quản lý tri thức cá nhân được TungLy nghiên cứu và áp dụng: PARA, Zettelkasten, Truy Vấn Socrates, Second Brain. Đây là nền tảng nhận thức luận cho việc xây dựng wiki HRM này.

---

## 1. Phương pháp PARA (Tiago Forte)

**PARA = Projects + Areas + Resources + Archives**

| Yếu tố | Định nghĩa | Áp dụng trong vault TungLy |
|--------|-----------|---------------------------|
| **Projects** | Công việc có deadline cụ thể | `1. Projects/` — dự án đang triển khai |
| **Areas** | Lĩnh vực cần duy trì liên tục | `Area/` — chuyên môn HRM, kỹ thuật .NET |
| **Resources** | Tài liệu tham khảo theo chủ đề | `2. RESOURCE/` — nghiệp vụ, kỹ thuật |
| **Archives** | Tài liệu không còn dùng | `3. ARCHIEVED/` — dự án đã xong |

**Lợi ích chính**: Phân loại rõ ràng → tìm kiếm nhanh → không bị overwhelm bởi lượng tài liệu lớn.

---

## 2. Zettelkasten (Niklas Luhmann)

**Nguyên tắc cốt lõi**:
1. **Atomic Notes**: Mỗi ghi chú = 1 ý tưởng duy nhất — cô đọng, tự nó phải dễ hiểu
2. **Unique ID**: Mỗi ghi chú có mã định danh (trong Obsidian: tên file = ID)
3. **Linking**: Ghi chú liên kết với nhau → mạng lưới tri thức phi tuyến tính
4. **Structure Notes**: Trang tổng hợp link đến nhiều atomic notes
5. **Elaboration**: Viết bằng lời của mình — không sao chép, buộc phải hiểu thật sự

**Quy trình làm việc**:

| Bước | Loại ghi chú | Mô tả |
|------|-------------|-------|
| Thu thập | Fleeting notes | Ghi chú thoáng qua, nhanh |
| Xử lý | Literature notes | Ghi chú từ tài liệu, nguồn tham chiếu |
| Phát triển | Permanent notes | Ý tưởng viết bằng lời mình, tự đứng được |
| Kết nối | Linking | **Bước quan trọng nhất** — liên kết permanent notes |

**Mạng lưới tri thức** (Emergence): Khi đủ lớn → nhận diện mẫu hình lặp lại, quan điểm đối lập, khoảng trống → đặt câu hỏi mới tự động

**Áp dụng trong wiki HRM**:
- `wiki/sources/` = atomic notes (mỗi source = 1 tài liệu gốc)
- `wiki/concepts/` = structure notes (tổng hợp nhiều sources)
- `[[wiki/...]]` = linking (Obsidian wiki-links)
- `wiki/synthesis/` = emergent notes (insight từ nhiều sources)

---

## 3. Truy Vấn Socrates

**2 chặn của phương pháp**:

**Chặn 1 — Phá vỡ quan điểm cũ**:
- "Điều này có luôn luôn đúng không?"
- "Có ngoại lệ nào không?"
- Mục tiêu: Bộc lộ giả định ẩn, lung lay niềm tin cứng nhắc

**Chặn 2 — Dẫn dắt hình thành quan điểm mới**:
- "Ai có góc nhìn khác không?"
- "Đâu là sự khác biệt giữa X và Y?"
- Trả lời câu hỏi bằng một câu hỏi khác → người học tự tìm ra câu trả lời

> *"Câu trả lời của chính người đặt ra câu hỏi mới là câu trả lời thực sự có ý nghĩa với họ."*

**Ứng dụng**: Wiki này dùng Socratic questioning ở cuối mỗi ingest session — 3 câu hỏi bắt buộc (Bản chất / Giả định ngầm / Kết nối).

---

## 4. Microservice Integration Decision Framework

Từ `2. RESOURCE/Học Hỏi/Phát Triển Micro Service.md` — framework so sánh khi tích hợp module ngoài vào microservice:

| Tiêu chí | Mua source | Thuê bên viết | Outsource framework mình |
|---------|-----------|--------------|--------------------------|
| Chi phí ban đầu | Thấp | Trung bình | Cao |
| Chi phí bảo trì | Cao | Trung bình | **Thấp** |
| Bảo trì dễ dàng | Khó | Trung bình | **Dễ** |
| Tùy biến sau này | Thấp | Trung bình | **Cao** |
| Rủi ro bảo mật | Cao | Trung bình | **Thấp** |

**Kết luận**: Khi tích hợp SSO (Okta, ADFS, Azure) vào HRM → luôn ưu tiên outsource theo framework VnResource (tình huống 3) thay vì mua source lạ — đảm bảo bảo trì nội bộ lâu dài.

---

## 5. Confluence vs Wiki.js

Tài liệu nội bộ cân nhắc chọn công cụ tài liệu hóa:

| Tiêu chí | Confluence (Jira) | Wiki.js |
|---------|------------------|---------|
| Tích hợp Jira | ✅ Native | ❌ Phải custom |
| Tìm kiếm | ✅ Mạnh | ✅ Tốt |
| Chi phí | 💲 Cao (theo user) | 💚 Open source |
| Editor | WYSIWYG | Markdown/WYSIWYG |
| Self-hosted | Có thể | ✅ Dễ hơn |

**Quyết định VnResource**: Dùng Confluence (vì đã có Jira) — tích hợp issue tracking + documentation trong một nơi.

---

## Liên kết

- [[wiki/concepts/AI-DevTools]] — Cursor AI, Memory Bank, LLM Wiki
- [[wiki/concepts/Vault-Structure]] — Cấu trúc vault TungLy (triển khai PARA)
- [[wiki/sources/AI-Cursor-MemoryBank]] — Cursor AI và Memory Bank patterns
