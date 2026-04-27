---
title: Câu hỏi về đánh giá sau dự án QuickPack
tags:
  - Q&A
  - "#faq"
date: 2026-04-27
Related: "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Questions/Question-7425]]"
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/4. Evaluation-7425]]"
---

# Câu hỏi gợi ý
---
- ✅ `Goals` → Mục tiêu Golive 01/12/2025 có đạt được không?
- ✅ `Risks` → Những rủi ro nào đã xảy ra, đã xử lý hiệu quả chưa?
- ✅ `Scope` → 8 phân hệ có hoàn thành đúng phạm vi không?
- ✅ `Timeline` → Có hoàn thành đúng tiến độ không?
- ✅ `Resources` → Nguồn lực SE/BA/QC có đủ và hiệu quả không?
- ✅ `Tasks` → Công việc đã hoàn thành đúng kế hoạch chưa?

# Câu hỏi
---

### 🏆 Đánh giá Mục tiêu (Goals)

- **Golive 01/12/2025 có đạt đúng hạn không?**
  - Nếu có: điều gì giúp dự án về đúng deadline?
  - Nếu trễ: trễ bao nhiêu ngày? Nguyên nhân chính là gì?

- **8 phân hệ có được build và UAT đầy đủ không?**
  - Phân hệ nào gặp vấn đề nhiều nhất: SAL? TRA? UNI?
  - Có phân hệ nào phải defer sang sau Golive không?

- **Chuyển đổi .NET 8 có ảnh hưởng tiêu cực nào đến tiến độ không?**

### 🏆 Đánh giá Phạm vi (Scope)

- Có yêu cầu nào phát sinh ngoài 8 phân hệ ban đầu không?
- Change request nào tốn nhiều effort nhất?
- QPVN có hài lòng với phạm vi đã thực hiện không?

### 🏆 Đánh giá Tiến độ (Timeline)

- Milestone nào bị trễ nhất? Trễ bao nhiêu ngày?
- Giai đoạn nào thực hiện tốt nhất (đúng/trước hạn)?
- Lý do chính gây trễ: thiếu SE? Data migrate chậm? Bug phức tạp?

### 🏆 Đánh giá Nguồn lực (Resources)

- **Vấn đề thiếu SE T8/2025:**
  - Tác động thực tế đến dự án là bao nhiêu ngày delay?
  - Nếu SE được cấp đủ từ đầu, tiến độ Build Đợt 1 tốt hơn bao nhiêu?

- **SE bị rút 09/09:**
  - Số ngày delay do việc này là bao nhiêu?
  - Cơ chế nào nên được thiết lập để tránh tái diễn?

- **Hiệu quả nhân sự tổng thể:**
  - BA raise task kịp thời không? (SAL chưa raise xong đến 07/10)
  - QC có đủ thời gian test không?

### 🏆 Đánh giá Rủi ro (Risks)

- **Rủi ro nào đã xảy ra, đã dự báo từ trước?**
  - Thiếu SE: đã dự báo → ứng phó còn chậm (3 tuần leo thang)
  - Bug block UAT: đã dự báo → ưu tiên fix kịp

- **Rủi ro nào xảy ra bất ngờ (không có trong danh sách rủi ro)?**
  - Lỗi mobile app chỉ tái hiện tại KH
  - …?

- **Hiệu quả của biện pháp ứng phó rủi ro:**
  - Leo thang lên anh Bảo/Hiển: có hiệu quả không? Thời gian giải quyết?
  - Cơ chế escalation có cần cải thiện không?

### 🏆 Bài học kinh nghiệm (Lessons Learned)

- **Về quản lý nguồn lực:**
  - Cần chốt resource commitment vào ngày bao nhiêu mỗi tháng?
  - Quy trình rút SE giữa dự án UAT cần được kiểm soát như thế nào?

- **Về quản lý task:**
  - BA cần raise task trước ngày mấy để SE có đủ thời gian?
  - Làm thế nào để tránh 35 tasks tồn đọng vào ngày cuối tháng?

- **Về quản lý phân hệ phức tạp:**
  - SAL và TRA cần bắt đầu phân tích sớm hơn bao nhiêu tuần?
  - Cần bao nhiêu SE chuyên sâu cho các phân hệ phức tạp?

- **Về phối hợp với KH:**
  - QPVN có phối hợp prepare data đúng hạn không?
  - Cơ chế báo cáo tiến độ với KH có hiệu quả không?

### 🏆 Câu hỏi định hướng cho dự án tiếp theo

- Có nên áp dụng mô hình 2-đợt build cho dự án HRM tương tự không?
- Bao nhiêu MM SE là đủ cho mỗi đợt build 4 phân hệ HRM?
- Nên bắt đầu raise task BA sớm hơn mấy tuần so với dự án này?
