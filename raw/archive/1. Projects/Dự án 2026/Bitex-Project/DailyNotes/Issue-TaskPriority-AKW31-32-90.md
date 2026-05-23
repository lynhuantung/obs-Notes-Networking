---
type: issue
tags:
  - bitex
  - task-priority
  - AKW32
  - UAT
  - issue
date-updated: 2025-11-04
Project: "[[Dự án Bitex]]"
related:
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]]"
---

# Issue: Ưu tiên Task AKW31, AKW32, AKW90 — Trước 04/11

> Phát sinh: **01/11/2025**  
> Deadline: **Trước 04/11/2025**  
> Trạng thái: ⚠️ **AKW32 block AKW90** — xong sớm nhất 05/11  
> Nguồn: [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]]

---

## 3 Task cần ưu tiên

| Task ID | Mô tả | Dependency | Deadline |
|---------|-------|-----------|---------|
| **Bitex-AKW31** | (cần trước 04/11) | — | 04/11 |
| **Bitex-AKW32** | Move code Phân ca làm việc + chỉnh sửa theo yêu cầu | — | 04/11 → thực tế 05/11 |
| **Bitex-AKW90** | (phụ thuộc AKW32) | ⛔ Phải làm **sau** AKW32 | 04/11 → thực tế sau 05/11 |

---

## Vấn đề với AKW32

**Tại sao trễ?**
- Task AKW32 thực chất yêu cầu **move 8 sub-task** trong 1 task
- Không xác định được **thứ tự** task nào trước, task nào sau
- Mô tả task **chưa đủ cơ sở** để thi công xử lý
- Cần **app team join** vào mới thực hiện được phần liên quan đến app
- → SE confirm: xong sớm nhất **sáng thứ 4 (05/11)**

---

## Nguyên tắc đúc kết

> Khi raise task "move code" nhiều phần → **phải tách thành từng task con riêng biệt**  
> Mỗi task cần có:  
> - Testcase từng phần  
> - Thứ tự thực hiện rõ ràng (task A → task B)  
> - Xác định team nào cần join (FE/BE/App)

---

## Bài học

- **1 task = 1 công việc rõ ràng** — không gom nhiều việc vào 1 task
- Task có **dependency** phải ghi rõ trong description
- Nếu task phức tạp, cần họp estimate trước khi giao SE

---

## Liên kết

- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]] ← Nguồn chat
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]] — Context deadline tháng 10
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]] — Timeline dự án

