---
Mã: 25010206-01
aliases:
date: 2026-04-27
time: 09:40
tags:
  - "#project"
  - "#phase"
phase: cài-đặt
Project: "[[Dự án Bitex]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Các giai đoạn]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]]"
---

# Giai đoạn: Thiết lập phần mềm
---

**Thời gian:** 01/07/2025 - 30/09/2025  
**Trạng thái:** ✅ Hoàn thành

## Mục tiêu
- Cài đặt & cấu hình hệ thống HRM cho Bitex + AKW
- Hoàn thành các task theo danh sách AMIS (AKW series)
- Chuẩn bị dữ liệu, môi trường sẵn sàng cho Training

## Công việc

### Triển khai kỹ thuật
- Cài đặt môi trường hệ thống (Linux + các dịch vụ liên quan)
- Tích hợp API: HRM gọi API KH để lấy/đồng bộ dữ liệu
  - Buổi trao đổi API với KH: 12/07/2025
  - Nội dung: cách hoạt động, lấy dữ liệu, mapping hệ thống
- Thực hiện task AKW series theo tracking AMIS

### Chuẩn bị cho Training (09/09/2025)
- Xử lý **7 task BUG + Modify** trước ngày 15/09/2025
- Đảm bảo hệ thống ổn định đủ để đào tạo phân hệ TRA + UNI

### Sprint cuối giai đoạn (01/11/2025)
- `Bitex-AKW31` — ưu tiên cao
- `Bitex-AKW32` — move code, nhiều sub-task ẩn, SE OT → hoàn thành sáng 05/11
- `Bitex-AKW90` — phụ thuộc AKW32, thực hiện sau

> ⚠️ **Dependency**: AKW90 → AKW32

## Rủi ro phát sinh

### ⚠️ Nguồn lực SE bị rút không thông báo (06/09/2025)
- BA bị điều chuyển sang dự án khác
- Cần bổ sung 2 SE đến hết tháng 9
- Chi tiết: [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]]

### ⚠️ Task ẩn sub-task — estimate sai (AKW32)
- 1 task thực chất bao gồm nhiều sub-task move code
- Gây chậm sprint 04/11
- Bài học: khi raise task move code → phải breakdown rõ sub-task

## Bài học
- Rút nguồn lực cần thông báo PE trước ít nhất 3 ngày
- Cần resource buffer: ai thay thế khi nhân sự bị điều chuyển
- Task move code cần estimate chi tiết hơn

---

**Liên quan:**
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Các giai đoạn]] — Tổng quan phases
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-đào tạo]] — Giai đoạn tiếp theo
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]] — Danh sách rủi ro
