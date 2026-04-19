---
Mã: ai-agent-moc
aliases: [AI Agent Hub, Skill Index]
date: 2026-04-19
tags: [moc, ai, skill, agent]
type: moc
Related:
  - "[[4-3 Cursor AI Memory Bank]]"
  - "[[4-4 He thong Zettelkasten]]"
---

# 🤖 AI-Agent — Map of Content

> Trung tâm lưu trữ toàn bộ Skill, Agent, Prompt phục vụ tự động hóa công việc.

---

## 📐 Triết lý
- **TungLy/** = Ghi chú thuần (meeting, daily, zettelkasten) — *con người viết*
- **AI-Agent/** = Skill & Agent — *máy thực thi theo lệnh*
- Hai thế giới liên kết nhau qua wikilinks

---

## 🛠️ Skills theo Domain

### HRM
| Skill | Mô tả | Dùng khi |
|---|---|---|
| [[Skills/HRM/Skill-config]] | Cấu hình Database | Đổi môi trường DEV/UAT/PROD |
| [[Skills/HRM/Skill-Store-sql]] | Sinh Stored Procedure | Tạo store mới cho bảng |

### VnPay
| Skill | Mô tả | Dùng khi |
|---|---|---|
| *(chưa có)* | | |

### Common
| Skill | Mô tả | Dùng khi |
|---|---|---|
| *(chưa có)* | | |

---

## 🤖 Agents
*(Agent = tập hợp nhiều skill + context dự án)*

| Agent | Domain | Skills dùng |
|---|---|---|
| *(chưa có)* | | |

---

## 💬 Prompts hay dùng
*(Các prompt template tái sử dụng)*

| Prompt | Mục đích |
|---|---|
| *(chưa có)* | |

---

## 🔗 Liên kết Zettelkasten
- [[4-3 Cursor AI Memory Bank]] — triết lý AI nhớ context
- [[4-3a Che do Plan va Act]] — chế độ làm việc với AI
- [[4-4 He thong Zettelkasten]] — hệ thống ghi chú nền tảng
- [[2-1 Nang cap NET 8]] — context kỹ thuật HRM
- [[2-2 Toi uu SQL Server]] — context tối ưu DB

---

## 📋 Cách thêm Skill mới
1. Tạo file trong `Skills/{Domain}/Skill-{tên}.md`
2. Dùng frontmatter: `type: skill`, `domain: xxx`, `status: active`
3. Thêm vào bảng trên theo đúng domain
4. Liên kết với Zettelkasten node liên quan trong `Area/`
