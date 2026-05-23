---
type: source
description: "Nhật ký sử dụng GitNexus hàng ngày: workflow phân tích code graph, impact, query và context lookup."
tags:
  - gitnexus
  - devtools
  - workflow
  - ai
date-ingested: 2026-04-26
category: research
project: general
date-updated: 2026-04-26
source-file: 0. Daily/2026-Apr-17/GitNexus.md
related:
- "[[wiki/concepts/AI-DevTools]]"
---

# GitNexus — Ghi Chú Sử Dụng

> File nguồn: `0. Daily/2026-Apr-17/GitNexus.md`  
> Ngày ghi: 2026-04-20 | Tag: #gitnexus

---

## Tóm tắt

Ghi chú ngắn nhắc nhở: khi tách nhánh Git mới cần chạy lại phân tích GitNexus để quét lại source code — đảm bảo knowledge graph luôn sync với nhánh hiện tại.

---

## Key Takeaways

- **Khi nào chạy**: Mỗi lần tách nhánh mới (branch) từ codebase HRM
- **Lệnh**:
  ```bash
  cd c:\Code\HRM-AGENT-AI\HRM12-GIT\Main\Source
  npx gitnexus analyze
  ```
- **Mục đích**: Quét lại source code mới để cập nhật knowledge graph — các query GitNexus sau đó sẽ phản ánh đúng code của nhánh

---

## Liên kết

- [[wiki/concepts/AI-DevTools]] — Cursor AI, Memory Bank, GitNexus trong quy trình TungLy
