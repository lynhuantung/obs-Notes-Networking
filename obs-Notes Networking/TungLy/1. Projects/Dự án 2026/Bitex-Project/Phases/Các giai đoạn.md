---
Mã: 25010206-01
aliases:
date: 2026-04-27
time: 09:40
Week: "16"
tags:
  - "#project"
  - "#phases"
phase:
Project: "[[Dự án Bitex]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]]"
---

## Chi tiết timeline theo giai đoạn

### **Giai đoạn 1: Khảo sát và chốt SRS** → [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-khảo sát|Phase-khảo sát]]
- **Thời gian:** 02/06/2025 - 30/06/2025
- **Nhiệm vụ chính:**
	- Khảo sát nghiệp vụ KH, chốt tài liệu SRS
	- Trao đổi tích hợp API: HRM gọi API KH để lấy dữ liệu (12/07/2025)
	- PE cần tài liệu API sớm để raise task list lên SE
- **Rủi ro:**
	- Chưa có môi trường dựng Linux
	- Tài liệu API từ KH có thể trễ

---

### **Giai đoạn 2: Xây dựng hệ thống (Cài đặt)** → [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-cài đặt|Phase-cài đặt]]
- **Thời gian:** 01/07/2025 - 30/09/2025
- **Nhiệm vụ chính:**
	- Cài đặt & cấu hình hệ thống HRM
	- Thực hiện các task theo danh sách AMIS (AKW series)
	- Xử lý 7 task BUG + Modify chuẩn bị cho Training (09/09/2025)
- **Rủi ro:**
	- ⚠️ BA bị rút sang dự án khác không thông báo (06/09/2025) → [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE|Issue-NguonLuc-SE]]
	- SE bị phân tán nguồn lực, cần bổ sung 2 SE đến hết tháng 9

---

### **Giai đoạn 3: Đào tạo** → [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-đào tạo|Phase-đào tạo]]
- **Thời gian:** 29/09/2025 - 18/12/2025 *(kéo dài so với kế hoạch ban đầu 13/10)*
- **Nhiệm vụ chính:**
	- Training phân hệ TRA + UNI: 15/09/2025 (sớm hơn kế hoạch)
	- Training các phân hệ còn lại: 19/11 - 18/12/2025
	- Sprint 04/11: OT xử lý task AKW31/32/90 trước buổi training
- **Rủi ro:**
	- HRE deadline trễ → ảnh hưởng chuẩn bị cho training → [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre|Issue-HRE-Deadline-Tre]]
	- Task AKW32 ẩn nhiều sub-task, phức tạp hơn dự kiến

---

### **Giai đoạn 4: UAT (2 round)** → [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-UAT|Phase-UAT]]
- **Thời gian:** 14/10/2025 - 23/11/2025
- **Nhiệm vụ chính:**
	- UAT Round 1 & Round 2 các phân hệ
	- Xử lý GAP, bug phát sinh từ UAT
	- Deadline các phân hệ còn lại: 25/10/2025
- **Rủi ro:**
	- ⚠️ HRE xong trễ (10/10 → 18/10) ảnh hưởng UAT schedule
	- Lệch dữ liệu file offline vs online (18/12) → dùng Google Sheet online là chuẩn
	- SE xong task ≠ dự án đảm bảo → cần buffer cho PE test + config

---

### **Giai đoạn 5: Golive**
- **Thời gian:** 01/12/2025
- **Nhiệm vụ chính:**
	- Go-live hệ thống HRM
	- Hỗ trợ vận hành sau go-live
- **Rủi ro:**
	- 🔴 Lỗi gửi mail hệ thống tồn đọng (27/01/2026) — cần Trung.Pham + Lý Nhuận Tùng theo dõi
	- Lỗi loading app do cache cấu hình (12/02/2026) → đã xử lý bằng Redis
	- Vấn đề performance (08/04/2026) → cache list → dictionary, clear cache approve

---

## Tổng quan trạng thái (tính đến 27/04/2026)

| Giai đoạn | Thời gian | Trạng thái |
|-----------|-----------|------------|
| Khảo sát & SRS | 02/06 – 30/06/2025 | ✅ Hoàn thành |
| Cài đặt hệ thống | 01/07 – 30/09/2025 | ✅ Hoàn thành |
| Đào tạo | 29/09 – 18/12/2025 | ✅ Hoàn thành |
| UAT | 14/10 – 23/11/2025 | ✅ Hoàn thành |
| Golive & Hậu kỳ | 01/12/2025 → nay | 🔄 Đang hỗ trợ vận hành |
