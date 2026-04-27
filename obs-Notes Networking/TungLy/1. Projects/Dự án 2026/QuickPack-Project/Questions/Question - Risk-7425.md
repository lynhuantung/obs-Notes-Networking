---
title: Câu hỏi về rủi ro dự án QuickPack
tags:
  - Q&A
  - "#faq"
date: 2026-04-27
Related: "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Questions/Question-7425]]"
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-nguon-luc-se-qpvn]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-server-infrastructure-qpvn]]"
---

# Câu hỏi gợi ý
---
- ✅ `Tasks` → Công việc nào đang có rủi ro block tiến độ nhất?
- ✅ `Timeline` → Rủi ro nào đang đe dọa mốc Golive 01/12/2025?
- ✅ `Resources` → Thiếu SE — rủi ro này có tái diễn không?

# Câu hỏi
---

### ⚠️ Rủi ro đã xảy ra — Cần đánh giá lại

- **🔴 Thiếu SE T8/2025 (ĐÃ XẢY RA):**
  - Yêu cầu 3MM → < 0.5MM → leo thang 3 tuần mới giải quyết
  - Bài học: Cơ chế commit resource đầu tháng là gì?
  - Có cần thay đổi quy trình duyệt nguồn lực cho các dự án UAT không?

- **🔴 SE bị rút 09/09 khi còn 35 tasks (ĐÃ XẢY RA):**
  - Tác động thực tế: bao nhiêu ngày bị delay? Task nào block luồng test?
  - Giải pháp tạm thời: xin bổ sung sau lễ — có hiệu quả không?

- **🟡 3 Bugs block UAT Đợt 1 (ĐÃ XẢY RA):**
  - QPVN2128, QPVN2158, QPVN2146 — đã fix xong trước ngày đào tạo 08/09 chưa?
  - Quy trình triage bug trong UAT có cần cải thiện không?

- **🟡 Lỗi mobile app chỉ xảy ra tại KH (ĐÃ XẢY RA):**
  - Nguyên nhân: môi trường KH khác UAT ở điểm nào?
  - SE Mobile Nhân đã xử lý xong T9/2025 chưa?

### ⚠️ Rủi ro đang hiện hữu — Cần theo dõi

- **🔴 Deadline cứng 01/12/2025:**
  - Nếu UAT All T11 phát sinh bug critical — có plan B không?
  - Sprint T11 có đủ buffer để fix bug khẩn cấp không?

- **🔴 SAL (Lương) phức tạp:**
  - Chu kỳ lương lệch — SE chuyên sâu đã được assign chưa?
  - Task SAL đã raise xong chưa? (đến 07/10 vẫn chưa raise xong)
  - Nếu SAL trễ, ảnh hưởng thế nào đến UAT Đợt 2 T10?

- **🔴 TRA (Đào tạo) phức tạp:**
  - SRS TRA đã được review kỹ chưa? Ai review?
  - Luồng đào tạo theo đợt — đã có testcase cover đủ chưa?

- **🟡 Server UAT/PRD chưa tách biệt:**
  - Kế hoạch dựng server PRD: tuần nào thực hiện?
  - Nếu PRD chưa sẵn sàng trước Golive 01/12 — rủi ro là gì?
  - Chi tiết: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-server-infrastructure-qpvn]]

- **🟡 UNI (Đồng phục) — cảnh báo tồn kho:**
  - Logic cảnh báo tồn kho đã được confirm với KH chưa?
  - Có testcase riêng cho trường hợp edge case tồn kho không?

### ⚠️ Câu hỏi phòng ngừa

- Có rủi ro nào CHƯA được ghi nhận trong [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425]] không?
- Kế hoạch leo thang (escalation path) cho T10–T11/2025 là gì?
- Nếu QPVN chậm prepare data, ai có thẩm quyền quyết định lùi milestone?
- Rủi ro về nhân sự QPVN (người dùng cuối nghỉ việc trước Golive) đã được tính đến chưa?
