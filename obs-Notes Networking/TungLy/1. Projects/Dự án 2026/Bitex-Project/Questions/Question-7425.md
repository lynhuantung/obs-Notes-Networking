---
title: Câu hỏi tổng quan dự án Bitex
tags:
  - Q&A
  - "#faq"
date: 2026-04-27
Project: "[[Dự án Bitex]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/1. Goals-7425|Goals]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/2. Scope-7425|Scope]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425|Timeline]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/5. Resources-7425|Resources]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425|Risks]]"
---

### 1️⃣ **Mục tiêu chính của dự án Bitex là gì?**

- Dự án gồm 2 giai đoạn: (1) chuyển đổi .NET Framework → .NET Core và (2) triển khai HRM mới. Hai giai đoạn này có phụ thuộc nhau như thế nào?
- Mục tiêu go-live 01/12/2025 đã được thực hiện đúng hạn chưa?

### 2️⃣ **Phạm vi dự án bao gồm những phân hệ HRM nào?**

- Các module nào được triển khai: Lương, Chấm công, Bảo hiểm, Nhân sự, Đánh giá?
- Scope có bị thay đổi (scope creep) trong quá trình xây dựng không? Ai phê duyệt thay đổi?

### 3️⃣ **Những ai là người liên quan chính trong dự án Bitex?**

- Phía PE (FIT-HRM): Lý Nhuận Tùng (PM), Trịnh Công Thức (PM), Trần Văn Hoài Thương (SE). Vai trò QC ai đảm nhận?
- Phía khách hàng Bitex: ai là người đầu mối, ai phê duyệt UAT, ai chịu trách nhiệm go-live?

### 4️⃣ **Tiến độ thực tế so với kế hoạch như thế nào?**

- Giai đoạn nào bị delay? Delay bao nhiêu ngày?
- Sự kiện SE bị rút (R1) và HRE trễ deadline (R2) đã ảnh hưởng như thế nào đến tổng timeline?

### 5️⃣ **Nguồn lực có đủ để hoàn thành dự án không?**

- Sau khi SE bị rút sang dự án khác (06/09/2025), ai đã thay thế và năng lực có đảm bảo không?
- Nhân sự phía Bitex (người dùng) có tham gia đầy đủ vào UAT và đào tạo không?

### 6️⃣ **Những rủi ro nào đã xảy ra và được xử lý ra sao?**

- R5 (lỗi gửi mail hệ thống, phát sinh 27/01/2026) đã được fix triệt để chưa?
- R4 (lệch dữ liệu file offline vs Google Sheet) đã chuẩn hóa 100% về Google Sheet chưa?

### 7️⃣ **Tiêu chí đánh giá thành công của dự án Bitex là gì?**

- Hệ thống HRM vận hành ổn định sau go-live: bao nhiêu ngày không có lỗi nghiêm trọng?
- Khách hàng Bitex chính thức nghiệm thu và ký biên bản bàn giao chưa?

### 8️⃣ **Công nghệ và nền tảng sử dụng trong dự án là gì?**

- Stack: .NET Core (sau chuyển đổi từ .NET Framework), triển khai trên Linux hay Windows?
- Hệ thống có tích hợp với phần mềm kế toán, ERP hay hệ thống nội bộ nào của Bitex không?

### 9️⃣ **Dự án phụ thuộc vào yếu tố bên ngoài nào?**

- Môi trường Linux đã được IT dựng chưa (rủi ro ban đầu)? Tình trạng hiện tại?
- Có phụ thuộc vào phê duyệt từ ban lãnh đạo Bitex cho từng milestone không?

### 🔟 **Sau go-live, kế hoạch bảo trì và hỗ trợ như thế nào?**

- Có SLA hỗ trợ sau go-live không? Thời gian phản hồi lỗi là bao lâu?
- Ai là đầu mối hỗ trợ vận hành sau khi dự án kết thúc: Tùng.Ly hay Trung.Pham?

