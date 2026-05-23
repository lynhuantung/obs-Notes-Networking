---
title: Câu hỏi về phạm vi dự án QuickPack
tags:
  - Q&A
  - "#faq"
date: 2026-04-27
Related: "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Questions/Question-7425]]"
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/2. Scope-7425]]"
---

# Câu hỏi gợi ý
---
- ✅ `Tasks` → Công việc nào thuộc phạm vi VnResource? Công việc nào thuộc phạm vi QPVN?
- ✅ `Goals` → 8 phân hệ trong scope có đủ để đáp ứng nghiệp vụ QPVN không?
- ✅ `Phase` → Đợt 1 và Đợt 2 phân chia phân hệ có hợp lý không?

# Câu hỏi
---

### 📋 Về phân chia phạm vi

- **Tại sao chia thành 2 đợt build?**
  - Đợt 1 (HRE/ATT/REC/UNI) và Đợt 2 (INS/SAL/TRA/KPI) — cơ sở phân chia là gì?
  - Có phân hệ nào nên đổi đợt để giảm rủi ro không?

- **Ranh giới trách nhiệm VnResource vs QPVN Task:**
  - VnResource: Build, Testcase, Special Cases, Training End-user
  - QPVN: Prepare Data to Migrate (song song 2 đợt)
  - Ai chịu trách nhiệm nếu data migrate bị sai?

### 📋 Về các phân hệ phức tạp

- **SAL — Lương sản phẩm lệch chu kỳ:**
  - Chu kỳ lương tại QPVN khác với chuẩn hệ thống như thế nào?
  - Đã có giải pháp kỹ thuật cụ thể chưa? SRS đã confirm chưa?
  - Cần bao nhiêu SE để build SAL đúng hạn T9/2025?

- **TRA — Đào tạo nhân viên mới theo đợt:**
  - "Theo đợt" nghĩa là gì trong nghiệp vụ QPVN? Có bao nhiêu đợt/năm?
  - Luồng nghiệp vụ TRA phức tạp cụ thể ở điểm nào?

- **UNI — Đồng phục/Thiết bị:**
  - Logic cảnh báo tồn kho hoạt động như thế nào?
  - Số lượng sắp cấp được tính theo quy tắc gì?

### 📋 Về nội dung ngoài phạm vi

- Các module nào KHÔNG nằm trong scope của dự án này?
- Nếu QPVN yêu cầu thêm tính năng ngoài 8 phân hệ, quy trình xử lý thế nào?
- Tích hợp với hệ thống khác (chấm công phần cứng, payroll bên ngoài…) có trong scope không?

### 📋 Về Prepare Data to Migrate

- QPVN cần chuẩn bị những loại data gì cho Đợt 1 (27/07–30/08)?
- QPVN cần chuẩn bị những loại data gì cho Đợt 2 (15/08–30/09)?
- Ai bên QPVN chịu trách nhiệm chuẩn bị data? Đã assign chưa?
- Nếu data không sẵn sàng đúng hạn, ảnh hưởng thế nào đến UAT?
