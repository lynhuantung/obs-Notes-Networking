---
Mã: template-case-study
aliases: [Mẫu Case Study]
date: 2026-04-19
tags: [template, case-study, ai-agent]
type: template
---

# 📋 Template — Case Study

> Lưu lại sau mỗi case giải quyết xong. Là bộ nhớ dài hạn cho AI.

---

```yaml
---
Mã: case-{domain}-{YYYYMMDD}-{ten-ngan}
date: YYYY-MM-DD
tags: [case-study, {domain}, {tag}]
domain: HRM | VnPay
type: case-study
status: resolved | in-progress
issue-mode: screen-load | action-processing | db | config
Related:
  - "[[Skills/{domain}/Skill-{lien-quan}]]"
  - "[[Knowledge/patterns/{pattern-phat-hien}]]"
---
```

## Vấn đề
*(Mô tả ngắn gọn — 1-2 câu)*

## Triệu chứng
- User thấy gì:
- Thời gian đo được:
- Tần suất xảy ra:

## Entry point
*(Bắt đầu điều tra từ đâu)*

## Root cause
*(Nguyên nhân gốc rễ — sau khi đã xác định)*

## Evidence
| Loại | Chi tiết |
|---|---|
| Profiler/Log | ... |
| Timing trước | ... |
| Timing sau | ... |

## Fix đã áp dụng
*(Mô tả fix + tại sao an toàn)*

```csharp
// BEFORE
...

// AFTER
...
```

## Kết quả
- Trước: Xms
- Sau: Xms
- Cải thiện: X%

## Bài học
*(Insight quan trọng để tái sử dụng)*

## Pattern phát hiện
*(Link tới pattern nếu có thể tái sử dụng)*
- [[Knowledge/patterns/{pattern}]]
