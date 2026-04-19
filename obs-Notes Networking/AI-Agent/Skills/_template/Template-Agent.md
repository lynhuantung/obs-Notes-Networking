---
Mã: template-agent
aliases: [Mẫu Agent]
date: 2026-04-19
tags: [template, agent, ai-agent]
type: template
---

# 📋 Template — Agent

> Copy file này khi tạo agent mới. Xóa dòng này sau khi copy.

---

## 📌 PHẦN 1 — OBSIDIAN (Nháp & mạng lưới)

```yaml
---
Mã: agent-{domain}-{ten}
aliases: [{Tên Agent}]
date: YYYY-MM-DD
tags: [agent, {domain}]
domain: HRM | VnPay | Common
type: agent
status: draft | ready | deployed
deploy-path: .claude/agents/{ten}.md
skills:
  - "[[Skills/{domain}/Skill-{ten1}]]"
  - "[[Skills/{domain}/Skill-{ten2}]]"
Related:
  - "[[AI-Agent-MOC]]"
  - "[[{Zettelkasten liên quan}]]"
---
```

### Mô tả
> Agent này điều phối gì? Phạm vi là gì?

### Skills sử dụng
*(Agent gọi những skills nào)*
- [[Skills/HRM/Skill-xxx]] — khi nào gọi
- [[Skills/HRM/Skill-yyy]] — khi nào gọi

### Liên kết Zettelkasten
- [[{note liên quan}]] — lý do liên kết

---

## 📌 PHẦN 2 — PRODUCTION (Copy sang .claude/agents/{ten}.md)

```
---
name: {ten-agent}
description: {Mô tả — Claude đọc để biết khi nào spawn agent này}
---
```

### Role
*(Agent này là ai, làm gì)*

### Core rule
*(Quy tắc bất biến)*

### Primary responsibilities
*(Trách nhiệm chính)*

### Non-goals
*(Không làm gì — quan trọng để tránh lạc hướng)*

### Supported modes / Issue types
*(Phân loại input)*

### Investigation workflow
*(Các bước xử lý — có thứ tự)*

#### Step 1: Classify
#### Step 2: Route / Delegate
#### Step 3: Execute
#### Step 4: Consolidate

### Routing rules
*(Khi nào gọi skill/agent nào)*

| Tình huống | Gọi |
|---|---|
| ... | `skill-xxx` |
| ... | `agent-yyy` |

### Input contract
*(Nhận vào gì — partial OK)*

### Output contract
*(Bắt buộc trả ra format gì)*

### Escalation logic
*(Khi nào leo thang lên skill/agent khác)*
