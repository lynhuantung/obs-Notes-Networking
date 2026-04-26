---
type: concept
tags:
  - ai
  - dev-tool
  - cursor
  - llm
  - productivity
date-updated: 2026-04-25
related:
- "[[wiki/sources/AI-Cursor-MemoryBank]]"
---

# AI Dev Tools — Công cụ AI cho Lập trình

## Cursor AI

IDE tích hợp AI (GPT-4, Claude, Gemini) dành cho lập trình viên. Xem chi tiết: [[wiki/sources/AI-Cursor-MemoryBank]]

**Điểm mấu chốt**: Cursor Memory Bank = cùng triết lý với LLM Wiki — persistent knowledge giữa các session AI.

## Liên hệ với LLM Wiki

| Cursor Memory Bank | LLM Wiki |
|--------------------|----------|
| projectbrief.md | wiki/overview.md |
| activeContext.md | wiki/log.md (recent) |
| systemPatterns.md | wiki/concepts/ |
| progress.md | wiki/projects/ (trạng thái) |
| .cursorrules | CLAUDE.md (schema + rules) |

**Insight**: Hai hệ thống giải quyết cùng vấn đề — LLM mất context giữa các session, cần persistent knowledge base bên ngoài.

## Stack kỹ thuật của TungLy

Dựa trên tài liệu bài giảng và dự án:
- **.NET MVC / .NET Core 8** — nền tảng chính
- **Kendo UI** — UI grid/component
- **JWT** — authentication
- **Docker / Kubernetes** — infrastructure (VnPay)
- **Redis Sentinel** — caching HA
- **MongoDB** — database phụ
- **Hangfire** — background jobs
- **Prometheus + Grafana** — monitoring
