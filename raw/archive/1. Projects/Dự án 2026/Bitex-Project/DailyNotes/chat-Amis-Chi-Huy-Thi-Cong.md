---
Mã: Update-Daily
aliases: 
date: 2025-08-12
time: 06:40
Week: "02"
tags:
  - daily
  - chat-log
  - bitex
Project: "[[Dự án Bitex]]"
Liên kết:
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-2HopDong-1DuAn]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/5. Resources-7425]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]]"
---

# Tổng hợp Chat — Nhóm Bitex AKW Chỉ Huy Thi Công

> Nguồn: Nhóm chat AMIS **"Bitex AKW - Chỉ huy thi công"**  
> Thời gian: 11/07/2025 → 27/01/2026  
> Thành viên chính: Trịnh Công Thức (PE), Trần Duy Tùng (Quản lý), Trần Quốc Bảo, Phạm Văn Hiển, Nguyễn Thị Kim Hồng (SE Lead), Nguyễn Linh Khang, Nguyễn Thị Lan Vy

---

## 📌 Các vấn đề trọng yếu

| # | Vấn đề | Thời điểm | Trạng thái | Ghi chú |
|---|--------|-----------|------------|---------|
| 1 | 2 hợp đồng Bitex + AKW quản lý chung/tách | 22/08/2025 | ✅ Đã thống nhất | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-2HopDong-1DuAn]] |
| 2 | BA bị rút khỏi dự án, cần bổ sung SE | 06/09/2025 | ✅ Đã xử lý | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]] |
| 3 | HRE deadline bị trễ (cam kết 10/10 → trễ) | 15/10/2025 | ⚠️ Re-target 18/10 | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]] |
| 4 | Sprint 04/11: 3 task priority AKW31/32/90 | 01/11/2025 | ✅ Đã xử lý | Xem mục bên dưới |
| 5 | Lỗi gửi mail hệ thống chưa xử lý triệt để | 27/01/2026 | 🔴 Còn tồn đọng | Xem mục bên dưới |

---

## 🗓️ Timeline sự kiện theo thời gian

### 11/07/2025 — Khởi động nhóm
- **Nguyễn Thị Lan Vy** tạo group "Bitex-AKW chỉ huy thi công"
- **Thức (PE)** hỏi ai là Quản lý thi công → **Trần Duy Tùng** xác nhận
- PE cần tài liệu API sớm để đưa task list lên cho SE

### 12/07/2025 — Trao đổi API
- PE sắp có buổi trao đổi với KH về **tích hợp API**: HRM gọi API của KH để lấy dữ liệu
- Nội dung: cách hoạt động, lấy dữ liệu, mapping hệ thống
- **Phạm Văn Hiển** nhờ hỗ trợ tài liệu API và điều phối SE tham gia

### 22/08/2025 — Tranh luận tách/gộp dự án
→ Xem chi tiết: [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-2HopDong-1DuAn]]

**Kết luận cuối:**
- Trên AMIS: **1 dự án duy nhất**
- Về hạch toán: **chia đôi chi phí** theo 2 hợp đồng
- Không tách task — tránh làm 1 việc 2 lần

### 04/09/2025 — Đổi tên nhóm
- Trần Duy Tùng đổi tên → "Bitex AKW - Chỉ huy thi công"

### 06/09/2025 — BA bị rút, tranh luận nội bộ
→ Xem chi tiết: [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]]

### 09/09/2025 — Cập nhật kế hoạch Training
- Dự án sẽ đi **train + UAT phân hệ TRA + UNI** vào ngày **15/09/2025**
- Hiện có **7 task** (BUG + Modify) cần SE xử lý trước

### 10/09/2025 — Cập nhật tiến độ
- Thức nhắn trong nhóm để tránh trôi thông tin
- Cần SE phản hồi tình hình 7 task trước ngày 15/09

### 15/10/2025 — HRE Deadline bị trễ
→ Xem chi tiết: [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]

**Bối cảnh:**
- TCDA cam kết xong HRE trước **10/10** để kịp Training + UAT
- Đến **15/10** vẫn chưa xong, PE không nhận được cập nhật từ SE
- Các phân hệ khác cần xong trước **25/10**
- Target mới: HRE xong trước **18/10**

**Yêu cầu:**
- SE cập nhật tình hình thực tế
- Cam kết deadline HRE (mong đợi 18/10)
- Xác nhận các phân hệ khác có đảm bảo 25/10 không
- Cần có file Google Sheet với cột: ID task, tiêu đề task, ngày tạo, deadline SE, deadline mong đợi

**Link Google Sheet quản lý task nội bộ PE:**
https://docs.google.com/spreadsheets/d/1xDtkcnMQkD2UuD-b9xIk1SNt5xXWLTVE181XxIh4cL8/edit?gid=484313875

### 01/11/2025 — Sprint 04/11: 3 task priority

**3 task cần có trước ngày 04/11:**
- `Bitex-AKW31`
- `Bitex-AKW32` ← move code, phụ thuộc nhiều task → SE xác nhận xong sớm nhất **sáng 05/11**
- `Bitex-AKW90` ← phải làm SAU `AKW32`

> ⚠️ **Dependency**: AKW90 → AKW32 (phải xong AKW32 mới làm AKW90 được)

**Kế hoạch thực thi:**
- Ngày 04/11: SE OT, task xong → PE test **vào buổi tối**
- Ngày 05/11: Dự án đi đào tạo cả ngày → task fail cần SE xử lý ngay
- Nguồn lực test: cần PE kiểm tra luôn, không đợi tối mới check
- Trần Duy Tùng truyền thông mục tiêu cho toàn team thi công

**Vấn đề phát sinh:** AKW32 là 1 task nhưng thực chất bao gồm **nhiều sub-task move code** → SE cần thời gian dài hơn dự kiến

### 19/11/2025 → 18/12/2025 — Giai đoạn Training

**20/11/2025:**
- Phạm Văn Hiển bổ sung Nguyễn Thị Kim Hồng vào dự án
- Kim Hồng xác nhận deadline hỗ trợ
- PE gửi mail danh sách task → Thức gửi lại trên group

**18/12/2025:**
- Kim Hồng yêu cầu PE share kế hoạch UAT: ngày nào, phân hệ nào, bao nhiêu task cần xong
- Phát hiện **lệch dữ liệu giữa file offline và online**:
  - File offline có, online không: `Bitex-AKW151`
  - File online có, offline không: `Bitex-AKW159`, `AKW192`, `AKW193`, `AKW195`, `AKW196`
- **Kết luận**: Lấy theo **file online** (Google Sheet) là chuẩn nhất

### 23-26/12/2025 — Review kế hoạch cuối năm
- Thức nhắc 2 anh sắp xếp nguồn lực theo timeline hợp đồng đã ký
- Mail tham chiếu: `[VNR] Thành lập đội thi công dự án Bitex-AKW`
- Tùng hỏi xem nội dung kế hoạch/MasterPlan
- **Lưu ý quan trọng từ Thức**: "SE xong task ≠ dự án đảm bảo"
  - SE xong → PE test, config → chuyển KH → KH kiểm tra
  - SE chỉ là bước đầu trong chuỗi

### 25-26/12/2025 — Trao đổi nguồn lực cuối năm
- Thức hỏi kế hoạch sắp xếp lại nguồn lực thi công
- Tùng hỏi MasterPlan dự án
- Chưa có thay đổi với plan đang thống nhất với KH

### 27/01/2026 — Lỗi gửi mail hệ thống

> 🔴 **Issue tồn đọng**

- Dự án vướng vấn đề **gửi mail của hệ thống**
- Đã raise task nhưng kết quả xử lý **chưa triệt để**
- Ảnh hưởng nhiều đến vận hành hệ thống
- Nhờ **Trung.Pham** check và xử lý
- Nhờ **Lý Nhuận Tùng + Trần Duy Tùng** hỗ trợ

---

## 👥 Nhân sự tham gia

| Tên | Vai trò | Ghi chú |
|-----|---------|---------|
| Trịnh Công Thức | PE Lead | Phụ trách task list, training plan, giao tiếp KH |
| Trần Duy Tùng | Quản lý thi công (TCDA) | Ra quyết định nguồn lực, OT |
| Trần Quốc Bảo | Quản lý (TCDA) | Trao đổi trực tiếp khi TDT vắng |
| Phạm Văn Hiển | Quản lý (TCDA) | Điều phối API, bổ sung nhân sự |
| Nguyễn Thị Kim Hồng | SE Lead (TCDA) | Quản lý task SE, xác nhận deadline từ 11/2025 |
| Lý Nhuận Tùng | TCDA | Hỗ trợ push SE xử lý task fail |
| Nguyễn Thị Lan Vy | PE | Tạo group, admin |
| Nguyễn Linh Khang | TCDA | Add nhân sự vào group |

---

## 🔗 Backlinks

- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-2HopDong-1DuAn]] — Vấn đề 2 hợp đồng 1 dự án
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]] — HRE deadline trễ tháng 10
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]] — Nguồn lực SE bị thiếu
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]] — Cập nhật rủi ro dự án
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/5. Resources-7425]] — Nguồn lực dự án
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]] — Timeline dự án
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-UAT]] — Giai đoạn UAT

