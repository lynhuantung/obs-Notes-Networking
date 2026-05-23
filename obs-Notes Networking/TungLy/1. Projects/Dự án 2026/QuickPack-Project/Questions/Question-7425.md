---
title: Câu hỏi tổng quan dự án QuickPack
tags:
  - Q&A
  - "#faq"
date: 2026-04-27
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/1. Goals-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/2. Scope-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/3. Timeline-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/5. Resources-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425]]"
---

### 1️⃣ **Mục tiêu chính của dự án QuickPack là gì?**

- Triển khai hệ thống HRM (FIT-HRM) cho QuickPack Việt Nam (QPVN) gồm 8 phân hệ: HRE, ATT, REC, UNI, INS, SAL, TRA, KPI
- Chuyển đổi từ .NET Framework sang .NET Core (thực hiện từ Q1/2025)
- Official Golive: **01/12/2025** (mốc cứng, không lùi)
- Project Acceptance: 01–02/2026

### 2️⃣ **Phạm vi của dự án là gì?**

- **Đợt 1 (15/07–30/08/2025):** HRE, ATT, REC, UNI — do VnResource thực hiện
- **Đợt 2 (15/08–30/09/2025):** INS, SAL, TRA, KPI — do VnResource thực hiện
- **QPVN Task:** Chuẩn bị & migrate dữ liệu song song 2 đợt
- **Ngoài phạm vi:** Các phân hệ không thuộc 8 phân hệ trên

### 3️⃣ **Những ai là người liên quan chính trong dự án?**

| Vai trò | Người | Trách nhiệm |
|---------|-------|-------------|
| EM | Lý Nhuận Tùng | Điều phối nguồn lực, quyết định kỹ thuật |
| PM/Lead (VnR) | Trần Duy Tùng | Assign SE, leo thang nội bộ |
| PM (KH) | Trần Phước Hạc | Quản lý phía KH, raise task, UAT |
| Director | Trần Quốc Bảo | Giám sát, leo thang cấp cao |
| Director | Phạm Văn Hiển | Backup khi Tùng vắng |

### 4️⃣ **Thời gian thực hiện dự án như thế nào?**

| Giai đoạn | Thời gian |
|-----------|-----------|
| Khảo sát & chốt SRS | 02/06 – 30/06/2025 |
| Build Đợt 1 | 15/07 – 30/08/2025 |
| Build Đợt 2 | 15/08 – 30/09/2025 |
| UAT Đợt 1 | T9/2025 |
| UAT Đợt 2 | T10/2025 |
| UAT All (8 phân hệ) | 01/11 – 20/11/2025 |
| **Official Golive** ⭐ | **01/12/2025** |
| Project Acceptance | 01–02/2026 |

### 5️⃣ **Các nguồn lực cần thiết là gì?**

- **SE:** Yêu cầu 3 MM/tháng T8–T9/2025 (thực tế cấp < 0.5 MM ban đầu T8)
- **BA/PE:** Nguyễn Thị Kim Hồng (T10+), Trịnh Trần Thế Thông (T8+)
- **QC:** Trần Phan Minh Trí (T8+)
- **SE Mobile:** Nhân (T9/2025 — kiểm tra lỗi app tại KH)

### 6️⃣ **Những rủi ro nào đã xảy ra hoặc có thể xảy ra?**

- 🔴 **Thiếu SE tháng 8:** Yêu cầu 3MM → cấp < 0.5MM → leo thang lên Director
- 🔴 **SE bị rút giữa UAT:** 09/09 rút khi còn 35 tasks tồn đọng
- 🔴 **Deadline cứng 01/12/2025** không lùi được
- 🟡 **Bug block UAT:** QPVN2128/2158/2146 — block luồng đào tạo KH
- 🟡 **SAL phức tạp:** Lương sản phẩm lệch chu kỳ
- 🟡 **Server UAT/PRD chưa tách biệt**

### 7️⃣ **Các tiêu chí đánh giá thành công là gì?**

- Golive đúng hạn **01/12/2025**
- 8 phân hệ UAT pass, KH ký biên bản nghiệm thu T1–T2/2026
- End-user được đào tạo đầy đủ T11/2025
- Dữ liệu migrate chính xác, không thiếu sót

### 8️⃣ **Công nghệ và phương pháp được sử dụng?**

- **Nền tảng:** FIT-HRM (chuyển sang .NET Core / .NET 8)
- **Phương pháp:** Build theo đợt (Đợt 1 → UAT → Đợt 2 → UAT → UAT All)
- **Server:** Tách biệt UAT và PRD (đang trong quá trình dựng)
- **Mobile App:** Kiểm tra lỗi tại KH bởi SE Mobile

### 9️⃣ **Dự án có phụ thuộc vào bên thứ ba hoặc yếu tố nào không?**

- **QPVN:** Phải chuẩn bị & migrate data đúng hạn (song song 2 đợt build)
- **IT (KH):** Dựng môi trường Linux cho server
- **Director VnR:** Phê duyệt và cấp nguồn lực SE kịp thời

### 🔟 **Sau khi Golive, dự án được duy trì thế nào?**

- **Project Acceptance:** 01–02/2026 (KH ký nghiệm thu)
- **Bảo trì:** Theo điều khoản hợp đồng sau nghiệm thu
- **Bài học:** Cần chốt resource commitment từ đầu tháng, UAT cần SE backup song song
