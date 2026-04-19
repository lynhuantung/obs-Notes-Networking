---
name: kb-learn
description: Nạp knowledge mới vào Knowledge Base. Dùng khi vừa giải xong vấn đề, phát hiện pattern mới, hoặc muốn lưu bài học. AI sẽ hỏi đủ thông tin rồi tự tạo file đúng chỗ.
---

# kb-learn — Nạp Knowledge Base

## Mục tiêu
Hỏi đủ thông tin → tự tạo file đúng chỗ → liên kết Zettelkasten → KHÔNG để người dùng làm tay.

---

## Khi nào dùng skill này
- Vừa giải xong 1 vấn đề thực tế
- Phát hiện 1 pattern lặp lại
- Muốn lưu bài học / quy tắc mới
- Bất kỳ lúc nào người dùng nói "nạp vào", "lưu lại", "ghi nhớ cái này"

---

## Quy trình xử lý

### Bước 1 — Thu thập thông tin (hỏi người dùng)

Hỏi tuần tự, KHÔNG hỏi tất cả cùng lúc:

**Câu hỏi 1**: "Vấn đề xảy ra ở domain nào?"
- HRM / VnPay / Common / Khác

**Câu hỏi 2**: "Loại knowledge này là gì?"
- **Case Study** — vừa giải xong 1 vấn đề cụ thể
- **Pattern** — vấn đề lặp lại, có thể tái sử dụng
- **Rule** — quy tắc ngắn gọn, hành động rõ ràng

**Câu hỏi 3 (tuỳ loại)**:

Nếu **Case Study**:
- Vấn đề là gì? (1-2 câu)
- Triệu chứng người dùng thấy?
- Nguyên nhân gốc rễ là gì?
- Fix đã áp dụng là gì?
- Kết quả trước/sau (nếu có)?
- Có liên quan note Zettelkasten nào không? (VD: [[2-4 Redis]])

Nếu **Pattern**:
- Pattern tên gì?
- Triệu chứng nhận ra?
- Nguyên nhân phổ biến?
- Cách fix an toàn?
- Đã gặp ở case nào?

Nếu **Rule**:
- Quy tắc là gì? (1 câu ngắn gọn, bắt đầu bằng động từ)
- Nguồn gốc từ case nào?
- Hành động cụ thể khi gặp?

### Bước 2 — Phân loại và định vị file

Dựa trên thông tin thu thập:

```
Case Study  → Knowledge/case-studies/{domain}/case-{domain}-{YYYYMMDD}-{ten-ngan}.md
Pattern SQL → Knowledge/patterns/sql/{ten-pattern}.md
Pattern API → Knowledge/patterns/api/{ten-pattern}.md
Pattern Infra → Knowledge/patterns/infra/{ten-pattern}.md
Pattern Config → Knowledge/patterns/config/{ten-pattern}.md
Rule        → Knowledge/rules/{domain}-rules.md (append vào file có sẵn)
```

### Bước 3 — Tạo file

Dùng template tương ứng, điền đầy đủ thông tin.

**Luôn bao gồm**:
- Frontmatter với tags, domain, type, date
- Liên kết Zettelkasten nếu có
- Liên kết tới case/pattern liên quan

### Bước 4 — Gợi ý lan toả

Sau khi tạo xong, hỏi:
- "Case này có thể rút ra pattern tái sử dụng không?"
- "Pattern này có đủ rõ để thêm rule không?"
- "Có note Zettelkasten nào cần cập nhật thêm liên kết không?"

---

## Templates nội tuyến

### Template: Case Study

```markdown
---
Mã: case-{domain}-{YYYYMMDD}-{ten}
date: {ngày hôm nay}
tags: [case-study, {domain}, {tag-ky-thuat}]
type: case-study
domain: {domain}
status: resolved
issue-type: {infra|sql|api|config|...}
Related:
  - "[[{Zettelkasten liên quan}]]"
  - "[[Knowledge/patterns/{pattern liên quan}]]"
---

# Case: {Tên vấn đề}

## Vấn đề
{Mô tả 1-2 câu}

## Triệu chứng
- {Người dùng thấy gì}
- {Thời điểm xảy ra}

## Môi trường
- Project: {HRM/VnPay/...}
- Server/Module: {nếu có}

## Root Cause
{Nguyên nhân gốc rễ}

## Fix đã áp dụng
{Mô tả fix}

\`\`\`{ngôn ngữ nếu có code}
// Ví dụ code nếu có
\`\`\`

## Kết quả
- Trước: {timing hoặc mô tả}
- Sau: {timing hoặc mô tả}

## Bài học
{1-2 câu insight quan trọng nhất}

## Gợi ý tách pattern
- [ ] {Tên pattern nếu có thể tái sử dụng}
```

---

### Template: Pattern

```markdown
---
Mã: pattern-{ten}
date: {ngày hôm nay}
tags: [pattern, {loai}, {domain}]
type: pattern
layer: {sql|api|infra|config|common}
status: confirmed
cases:
  - "[[Knowledge/case-studies/{case liên quan}]]"
Related:
  - "[[{Zettelkasten liên quan}]]"
---

# Pattern: {Tên pattern}

## Triệu chứng
{Mô tả triệu chứng nhận ra}

## Nguyên nhân phổ biến
{Nguyên nhân}

## Phát hiện nhanh
\`\`\`
{Lệnh hoặc dấu hiệu nhận biết}
\`\`\`

## Fix an toàn
\`\`\`
{Code hoặc bước xử lý}
\`\`\`

## Phòng ngừa
- {Checklist phòng ngừa}

## Cases liên quan
- [[Knowledge/case-studies/{case}]]
```

---

### Template: Rule (append vào rules file)

```markdown
### R-{CAT}-{NUM}: {Tên rule — bắt đầu bằng động từ}
- **Nguồn**: [[Knowledge/case-studies/{case}]]
- **Vì sao**: {Giải thích ngắn}
- **Hành động**: {Làm gì cụ thể}
- **Pattern**: [[Knowledge/patterns/{pattern}]] *(nếu có)*
```

---

## Output bắt buộc

Sau khi hoàn thành, luôn báo cáo:

```
## ✅ Knowledge đã nạp

**Loại**: Case Study / Pattern / Rule
**File tạo**: `Knowledge/.../{tên file}.md`
**Liên kết Zettelkasten**: [[note liên quan]]
**Gợi ý tiếp theo**: 
- [ ] Tách pattern: {tên} → `patterns/{loại}/`
- [ ] Thêm rule: "{rule}" → `rules/{domain}-rules.md`
- [ ] Cập nhật liên kết trong: [[Zettelkasten note]]
```

---

## Ví dụ thực tế

**User**: "tôi vừa gặp vấn đề Redis lỗi sau khi update Windows ở dự án INOAC, cần nạp vào"

**AI hỏi**:
1. Domain → HRM ✓
2. Loại → Case Study ✓
3. Chi tiết → hỏi từng câu

**AI tạo**:
- `Knowledge/case-studies/hrm/case-hrm-20260218-inoac-redis-crash.md`
- Liên kết `[[2-4 Dich vu Redis]]` và `[[1-3 Du an INOAC]]`
- Gợi ý tách pattern → `patterns/infra/redis-crash-after-windows-update.md`
- Gợi ý thêm rule → `rules/hrm-rules.md`
