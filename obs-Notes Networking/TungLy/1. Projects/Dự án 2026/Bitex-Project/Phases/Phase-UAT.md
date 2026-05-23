---
Mã: 25010206-01
aliases:
date: 2026-04-27
time: 09:40
tags:
  - "#project"
  - "#phase"
phase: UAT
Project: "[[Dự án Bitex]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Các giai đoạn]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]"
---

# Giai đoạn: UAT
---

**Thời gian:** 14/10/2025 - 23/11/2025  
**Trạng thái:** ✅ Hoàn thành

## Mục tiêu
- Kiểm thử toàn diện hệ thống với người dùng KH (2 round UAT)
- Xử lý GAP và bug phát sinh
- Đảm bảo hệ thống ổn định trước Golive

## Công việc

### UAT Round 1 (14/10 – ~31/10/2025)
- Họp GAP: xác định các điểm lệch giữa phần mềm và nghiệp vụ KH
- KH kiểm tra các phân hệ đã training
- Deadline các phân hệ còn lại: **25/10/2025**
- Sprint ưu tiên: AKW31, AKW32, AKW90 (01/11/2025)

### UAT Round 2 (~01/11 – 23/11/2025)
- Fix bug/GAP từ Round 1
- PE test + config trước khi chuyển KH kiểm tra lại
- Kim Hồng (SE Lead) yêu cầu kế hoạch UAT: ngày nào, phân hệ nào, task cần xong

### Quản lý task UAT
- File tracking chuẩn: **Google Sheet online**
  - Link: https://docs.google.com/spreadsheets/d/1xDtkcnMQkD2UuD-b9xIk1SNt5xXWLTVE181XxIh4cL8
- ⚠️ Lệch dữ liệu file offline vs online (18/12/2025):
  - File offline có, online không: `Bitex-AKW151`
  - File online có, offline không: `AKW159`, `AKW192`, `AKW193`, `AKW195`, `AKW196`
  - **Quy tắc**: luôn dùng Google Sheet online là nguồn chuẩn

## Rủi ro phát sinh

### ⚠️ HRE Deadline Trễ (15/10/2025)
- TCDA cam kết HRE xong 10/10, đến 15/10 vẫn chưa xong
- PE không nhận được cập nhật từ SE
- Target mới: **18/10/2025**
- Tác động: toàn bộ lịch UAT bị đe dọa
- Chi tiết: [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]

### ⚠️ Chuỗi xử lý thực tế (nguyên tắc từ Thức)
> **"SE xong task ≠ Dự án đảm bảo"**

```
SE xong task 
  → PE test + config 
    → Chuyển KH 
      → KH kiểm tra 
        → Nghiệm thu
```
→ Deadline SE cần sớm hơn deadline UAT ít nhất **2-3 ngày** buffer

## Bài học
- Deadline SE nên có buffer 2-3 ngày cho PE test trước UAT
- Cần cột "deadline mong đợi" riêng trong tracking, không chỉ deadline SE
- SE phải thông báo sớm khi dự đoán sẽ trễ — không chờ đến ngày deadline
- Chỉ dùng **1 nguồn dữ liệu task** — Google Sheet online

---

**Liên quan:**
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Các giai đoạn]] — Tổng quan phases
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-đào tạo]] — Giai đoạn trước
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]] — Issue HRE trễ
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]] — Danh sách rủi ro
