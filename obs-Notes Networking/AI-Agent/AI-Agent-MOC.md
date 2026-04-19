---
Mã: ai-agent-moc
aliases: [AI Agent Hub, Skill Index]
date: 2026-04-19
tags: [moc, ai, skill, agent]
type: moc
Related:
  - "[[4-3 Cursor AI Memory Bank]]"
  - "[[4-3a Che do Plan va Act]]"
  - "[[4-4 He thong Zettelkasten]]"
---

# 🤖 AI-Agent — Map of Content

> Trung tâm nháp Skill, Agent, Knowledge — khi sẵn sàng deploy sang source code.

---

## 📐 Triết lý 2 Layer

```
LAYER 1 — Obsidian (nháp + mạng lưới)       LAYER 2 — Source code (production)
──────────────────────────────────────       ──────────────────────────────────
AI-Agent/Skills/HRM/Skill-xxx.md      →      .claude/skills/hrm-xxx/SKILL.md
AI-Agent/Agents/Agent-HRM.md          →      .claude/agents/hrm-agent.md
AI-Agent/Knowledge/                   →      ai/{domain}/knowledge/
```

---

## 🛠️ Skills

### Common *(dùng cho mọi domain)*
| Skill | Mô tả | Lệnh kích hoạt |
|---|---|---|
| [[Skills/Common/Skill-kb-learn]] | Nạp knowledge **kỹ thuật** (Redis, SQL, API...) | `"nạp vào"` / `"lưu kỹ thuật"` |
| [[Skills/HRM/Skill-nghiepvu-learn]] | Nạp knowledge **nghiệp vụ** (ATT, SAL, INS...) | `"nạp nghiệp vụ"` / `"lưu nghiệp vụ"` |

### HRM
| Skill | Mô tả | Status |
|---|---|---|
| [[Skills/HRM/Skill-config]] | Cấu hình Database | `ready` |
| [[Skills/HRM/Skill-Store-sql]] | Sinh Stored Procedure | `ready` |
| [[Skills/HRM/Skill-nghiepvu-learn]] | Nạp nghiệp vụ HRM vào mạng lưới | `ready` |

### VnPay
| Skill | Mô tả | Status |
|---|---|---|
| *(chưa có)* | | |

---

## 🤖 Agents
| Agent | Domain | Mô tả | Status |
|---|---|---|---|
| *(chưa có)* | | | |

---

## 📚 Knowledge Base

> Xem [[Knowledge/_README]] để hiểu cách nạp

| Thư mục | Nội dung | Nạp bằng |
|---|---|---|
| [[Knowledge/case-studies/]] | Cases đã giải quyết | `Skill-kb-learn` |
| [[Knowledge/patterns/]] | Patterns tái sử dụng | `Skill-kb-learn` |
| [[Knowledge/rules/]] | Quy tắc học được | `Skill-kb-learn` |

### Rules hiện có
- [[Knowledge/rules/hrm-rules.md]] — HRM rules (5 rules)

### Patterns hiện có
- [[Knowledge/patterns/infra/redis-crash-after-windows-update]] — Redis lỗi sau Windows Update

---

## 📋 Templates
| Template | Dùng để tạo |
|---|---|
| [[Skills/_template/Template-Skill]] | Skill mới |
| [[Skills/_template/Template-Agent]] | Agent mới |
| [[Skills/_template/Template-Case-Study]] | Case study thủ công |

---

## ✅ Cách dùng nhanh

### Nạp knowledge (AI tự làm)
> Chỉ cần nói: **"tôi vừa gặp vấn đề X, cần nạp vào"**
> → AI hỏi đủ thông tin → tự tạo file đúng chỗ → liên kết Zettelkasten

### Tạo Skill mới
1. Copy `Template-Skill.md` → `Skills/{Domain}/Skill-{ten}.md`
2. Điền PHẦN 1 (Obsidian) + PHẦN 2 (Production)
3. Set `status: draft` → viết → `status: ready`
4. Cập nhật bảng Skills ở trên

### Deploy sang source code
Copy **PHẦN 2** của Skill → `.claude/skills/{ten}/SKILL.md`

---

## 🔗 Liên kết Zettelkasten
- [[4-3 Cursor AI Memory Bank]] — triết lý AI nhớ context
- [[4-3a Che do Plan va Act]] — chế độ Plan/Act
- [[4-4 He thong Zettelkasten]] — hệ thống bộ nhớ ngoài
- [[2-1 Nang cap NET 8]] — context kỹ thuật HRM
- [[2-2 Toi uu SQL Server]] — context tối ưu DB
- [[2-4 Dich vu Redis]] — context Redis
