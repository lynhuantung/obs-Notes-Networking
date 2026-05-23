---
Mã: 25010206-01
aliases:
date: 2026-04-27
time: 09:40
tags:
  - "#project"
  - "#phase"
phase: đào-tạo
Project: "[[Dự án Bitex]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Các giai đoạn]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]"
---

# Giai đoạn: Đào tạo
---

**Thời gian:** 29/09/2025 - 18/12/2025 *(kéo dài so với kế hoạch ban đầu 13/10)*  
**Trạng thái:** ✅ Hoàn thành

## Mục tiêu
- Đào tạo người dùng KH sử dụng hệ thống HRM
- Đảm bảo KH hiểu và vận hành được các phân hệ trước UAT
- Xác nhận hệ thống đáp ứng yêu cầu thực tế

## Lịch đào tạo thực tế

| Ngày | Phân hệ | Ghi chú |
|------|---------|---------|
| 15/09/2025 | TRA + UNI | Training sớm, trước kế hoạch |
| 05/11/2025 | Các phân hệ (sau sprint AKW32) | SE OT hoàn thành task tối 04/11 |
| 19/11 – 18/12/2025 | Các phân hệ còn lại (HRE + others) | Kéo dài do HRE trễ |

## Công việc

### Chuẩn bị đào tạo
- Kiểm tra 7 task BUG + Modify trước ngày 15/09 (phân hệ TRA + UNI)
- Sprint 04/11: xử lý AKW31, AKW32, AKW90 trước buổi training
  - AKW32 phức tạp (nhiều sub-task move code) → SE OT, xong sáng 05/11
  - AKW90 phụ thuộc AKW32 (dependency)
- Kim Hồng (SE Lead) bổ sung vào dự án từ 20/11/2025

### Thực hiện đào tạo
- PE soạn kế hoạch training (phân hệ, ngày, danh sách task cần xong)
- Đào tạo người dùng cuối
- Thu thập feedback → chuyển thành GAP list cho UAT

### Quản lý task song song
- Ngày 04/11: SE OT → PE test buổi tối
- Ngày 05/11: training cả ngày → task fail → SE xử lý ngay

## Rủi ro phát sinh

### ⚠️ HRE Deadline Trễ → Training bị ảnh hưởng
- Cam kết HRE xong 10/10, thực tế trễ đến 18/10
- Đào tạo HRE phải dời sang 11-12/2025
- Chi tiết: [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]

### ⚠️ Task AKW32 — estimate sai
- 1 task nhưng ẩn nhiều sub-task move code
- Sprint 04/11 bị lệch
- Bài học: phải breakdown task move code trước khi raise

## Nhân sự hỗ trợ training
| Người | Vai trò |
|-------|---------|
| Trịnh Công Thức (PE) | Lead training, soạn kế hoạch |
| Nguyễn Thị Kim Hồng | SE Lead — xác nhận deadline task từ 20/11 |
| Nguyễn Thị Lan Vy | PE — hỗ trợ admin |

## Bài học
- Training phân hệ nhỏ sớm (TRA+UNI ngày 15/09) là quyết định đúng — phát hiện GAP sớm
- Cần kế hoạch training chi tiết: ngày, phân hệ, task cần xong trước training
- Dependency task (AKW90 → AKW32) phải được map rõ trong sprint planning
- Ngày training không nên có task fail quan trọng đang chờ xử lý

---

**Liên quan:**
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Các giai đoạn]] — Tổng quan phases
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-cài đặt]] — Giai đoạn trước
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-UAT]] — Giai đoạn tiếp theo
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]] — HRE deadline trễ
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]] — Danh sách rủi ro
