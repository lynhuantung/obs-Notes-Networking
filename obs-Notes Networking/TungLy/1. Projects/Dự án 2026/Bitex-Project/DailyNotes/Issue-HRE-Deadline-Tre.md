---
type: issue
tags:
  - bitex
  - deadline
  - HRE
  - issue
date-updated: 2025-10-15
Project: "[[Dự án Bitex]]"
related:
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Chi-Huy-Thi-Cong]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-UAT]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]]"
---

# Issue: HRE Deadline Bị Trễ — Tháng 10/2025

> Phát sinh: **15/10/2025**  
> Trạng thái: ⚠️ **Re-target 18/10** (tại thời điểm chat)  
> Nguồn: [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Chi-Huy-Thi-Cong]]

---

## Timeline sự kiện

| Ngày | Sự kiện |
|------|---------|
| Trước 10/10 | TCDA cam kết xong tất cả task HRE |
| 10/10 | **Deadline đã cam kết** — mục đích: kịp Training + UAT |
| 15/10 | PE nhận ra task HRE **vẫn chưa hoàn thành** |
| 15/10 | PE chưa nhận được bất kỳ cập nhật nào từ phía SE |
| 15/10 | Thức (PE) escalate lên nhóm, yêu cầu SE cam kết lại |
| 18/10 | **Target mới** cho task HRE |
| 25/10 | Deadline các phân hệ còn lại |

---

## Nguyên nhân phân tích

1. **SE không thông báo** khi sắp trễ deadline
2. **Thiếu cơ chế cảnh báo sớm** khi task bị block hoặc chậm
3. Một số task (AKW32) thực chất bao gồm **nhiều sub-task move code** — phức tạp hơn dự kiến khi raise
4. Nguồn lực SE **bị phân tán** sang dự án khác trước đó (xem [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]])

---

## Tác động

- Toàn bộ lịch **Training + UAT** bị đe dọa
- PE không có thời gian test trước khi đi đào tạo
- Ảnh hưởng **uy tín với KH** khi không đảm bảo cam kết

---

## Yêu cầu PE gửi SE (15/10/2025)

1. Cung cấp **file Google Sheet** có các cột: ID task, Tiêu đề task, Ngày tạo, Deadline SE
2. **Cập nhật tình hình thực tế** từng task HRE
3. **Cam kết deadline mới** cho HRE: mong đợi **18/10/2025**
4. Xác nhận khả năng đáp ứng **25/10** cho các phân hệ khác

**Link Google Sheet PE:**  
https://docs.google.com/spreadsheets/d/1xDtkcnMQkD2UuD-b9xIk1SNt5xXWLTVE181XxIh4cL8/edit?gid=484313875

**File đính kèm:**  
- `Bitex AKW - 20250408.02_HDPM_Danh sách công việc dự án.xlsx`

---

## Nguyên tắc quan trọng (từ Thức)

> **"SE xong task ≠ Dự án đảm bảo"**

Chuỗi xử lý thực tế:
```
SE xong task 
  → PE test + config 
    → Chuyển KH 
      → KH kiểm tra 
        → Nghiệm thu
```
SE chỉ là bước đầu. Cần buffer time cho các bước sau.

---

## Bài học

- Deadline nên có **buffer thêm 2-3 ngày** cho vòng test của PE
- Cần **cột deadline mong đợi** riêng trong tracking tool, không chỉ deadline SE
- SE cần **thông báo sớm** khi dự đoán sẽ trễ (không chờ đến ngày deadline)
- Khi raise task, cần **estimate chính xác hơn** — 1 task có thể ẩn nhiều sub-task

---

## Liên kết

- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Chi-Huy-Thi-Cong]] ← Nguồn chat
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]] — Nguồn lực bị thiếu
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]] — Timeline dự án
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/Phases/Phase-UAT]] — Kế hoạch UAT
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]] — Rủi ro tiến độ
