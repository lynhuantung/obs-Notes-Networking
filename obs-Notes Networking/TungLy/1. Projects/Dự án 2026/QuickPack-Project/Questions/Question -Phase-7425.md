---
title: Câu hỏi về giai đoạn dự án QuickPack
tags:
  - Q&A
  - "#faq"
date: 2026-04-27
Related: "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Questions/Question-7425]]"
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/3. Timeline-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase1-Chuyển Đổi sang net8-7425]]"
---

# Câu hỏi gợi ý
---
- ✅ `Tasks` → Giai đoạn nào đang có task tồn đọng nhiều nhất?
- ✅ `Timeline` → Giai đoạn nào có nguy cơ trượt milestone?
- ✅ `Resources` → Mỗi giai đoạn cần bao nhiêu SE/BA/QC?
- ✅ `Evaluation` → Giai đoạn nào cần đánh giá kết quả trước khi chuyển tiếp?

# Câu hỏi
---

### 🔵 Phase 0 — Chuyển đổi .NET Framework → .NET Core

> Tham khảo: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase1-Chuyển Đổi sang net8-7425]]

- Việc chuyển sang .NET 8 có ảnh hưởng gì đến các module HRM hiện tại không?
- QC và SE fix lỗi đến 19/04/2025 — có lỗi nào chưa được đóng không?
- Source QPVN sau khi tách có link test nội bộ VnR ổn định chưa?

### 🔵 Phase 1 — Khảo sát & Chốt SRS (02/06 – 30/06/2025)

- GAP analysis 8 phân hệ — ai thực hiện? Đã hoàn thành chưa?
- SRS link: https://drive.google.com/file/d/18jjcY5p2Ba0_uKlp_qaQneP_jUkXbCn-/view
  - SRS đã được KH sign-off chưa?
  - SRS phân hệ SAL (phức tạp nhất) đã đầy đủ chưa?
- Họp GAP với PE (17/04/2025): [[H-QuickPack-Att-17042025]] — kết luận chính là gì?

### 🔵 Phase 2 — Build Đợt 1 (15/07 – 30/08/2025): HRE, ATT, REC, UNI

- **Tiêu chí hoàn thành giai đoạn này là gì?**
  - 4 phân hệ build xong + testcase pass + handover cho UAT
- **Vấn đề phát sinh:**
  - Thiếu SE nghiêm trọng (< 0.5MM/3MM yêu cầu) — ảnh hưởng thực tế?
  - 30 tasks tồn đọng ngày 28/08 — bao nhiêu task đã resolve trước 01/09?
- **Chuyển giao sang UAT:** Bao giờ 4 phân hệ chính thức bàn giao cho UAT?

### 🔵 Phase 3 — Build Đợt 2 (15/08 – 30/09/2025): INS, SAL, TRA, KPI

- INS và KPI (không có GAP) — tiến độ có đúng hạn không?
- SAL — task chưa raise xong đến 07/10 → có ảnh hưởng đến timeline không?
- TRA — SRS phức tạp, đã có SE chuyên sâu handle chưa?
- Build Đợt 2 song song với UAT Đợt 1 — SE có bị split không?

### 🔵 Phase 4 — UAT Đợt 1 (T9/2025): HRE, ATT, REC, UNI

- 3 bug block UAT (QPVN2128/2158/2146) — đã fix trước 08/09 (ngày đào tạo) chưa?
- SE bị rút 09/09 — bao nhiêu task UAT bị ảnh hưởng?
- KH (QPVN) có phối hợp UAT đúng kế hoạch không?

### 🔵 Phase 5 — UAT Đợt 2 (T10/2025): INS, SAL, TRA, KPI

- SAL UAT — cần bao nhiêu vòng test? Ai là người dùng cuối test SAL?
- TRA UAT — luồng đào tạo theo đợt có được mô phỏng đúng không?
- Có bug nào block UAT Đợt 2 không?

### 🔵 Phase 6 — UAT All + Training End-user (01/11 – 20/11/2025)

- Update Master Data (01/11–20/11): QPVN đã assign nhân sự chưa?
- Import & Check Data: ai kiểm tra chất lượng data sau import?
- Training End-user T11: bao nhiêu ngày, bao nhiêu người, tài liệu đã xong chưa?
- Sprint cuối T11: SE tăng cường đã xin từ anh Bảo — đã được duyệt chưa?

### 🔵 Phase 7 — Golive (01/12/2025) ⭐

- Checklist Golive gồm những gì?
- Ai quyết định bấm nút Golive: VnResource hay QPVN?
- Nếu phát hiện bug critical ngày Golive — quy trình xử lý khẩn cấp là gì?
- Server PRD đã sẵn sàng chưa?

### 🔵 Phase 8 — Project Acceptance (01–02/2026)

- Tiêu chí nghiệm thu là gì? Ai ký biên bản?
- Thời gian warranty sau Golive là bao lâu?
- Bàn giao tài liệu: những loại tài liệu nào cần bàn giao cho QPVN?
