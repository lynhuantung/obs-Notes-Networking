---
Mã: template-skill
aliases: [Mẫu Skill]
date: 2026-04-19
tags: [template, skill, ai-agent]
type: template
---

# 📋 Template — Skill

> Copy file này khi tạo skill mới. Xóa dòng này sau khi copy.

---

## 📌 PHẦN 1 — OBSIDIAN (Nháp & mạng lưới)

```yaml
---
Mã: skill-{domain}-{ten}
aliases: [{Tên hiển thị}]
date: YYYY-MM-DD
tags: [skill, {domain}, {tag-ky-thuat}]
domain: HRM | VnPay | Common
type: skill
status: draft | ready | deployed
deploy-path: .claude/skills/{ten}/SKILL.md
Related:
  - "[[AI-Agent-MOC]]"
  - "[[{Zettelkasten liên quan}]]"
---
```

### Mô tả ngắn *(dùng làm description khi deploy)*
> Một câu mô tả rõ ràng: dùng skill này khi nào, làm gì.

### Dùng khi
- Tình huống 1
- Tình huống 2

### Không dùng khi
- Tình huống 1
- Tình huống 2

### Liên kết Zettelkasten
- [[{note liên quan 1}]] — lý do liên kết
- [[{note liên quan 2}]] — lý do liên kết

---

## 📌 PHẦN 2 — PRODUCTION (Copy sang .claude/skills/{ten}/SKILL.md)

```
---
name: {ten-skill}
description: {Mô tả ngắn — Claude đọc để biết khi nào dùng}
---
```

### Core rule
*(Quy tắc bất biến — không được vi phạm)*

### When to use
*(Điều kiện trigger skill này)*

### Investigation steps / Execution steps
*(Các bước thực hiện — rõ ràng, có thứ tự)*

#### Step 1: ...
#### Step 2: ...
#### Step 3: ...

### Input contract
*(Những gì cần nhận vào — có thể partial)*

| Input | Bắt buộc | Mô tả |
|---|---|---|
| `param1` | ✅ | ... |
| `param2` | ❌ | ... |

### Output contract
*(Format output bắt buộc trả ra)*

### Common issues
*(Lỗi thường gặp + cách xử lý)*

### Project-specific guidance
*(Hướng dẫn riêng cho project HRM/VnPay...)*
