---
type: issue-log
tags: [nguon-luc, SE, resource, escalation]
date-updated: 2026-04-27
Project: "[[Dự án QuickPack]]"
related:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/5. Resources-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-chi-huy-thi-cong-quickpack]]"
---

# Vấn đề: Thiếu nguồn lực SE - QPVN

> Backlink: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-chi-huy-thi-cong-quickpack|Chat chỉ huy thi công]]

## Tóm tắt

PM Hạc liên tục leo thang vấn đề thiếu SE trong suốt tháng 8-9/2025. Dù yêu cầu 3 MM/tháng nhưng thực tế cấp chưa tới 0.5 MM trong tháng 8.

---

## Timeline leo thang

| Ngày | Sự kiện | Người | Trạng thái |
|------|---------|-------|------------|
| 29/07/2025 | Hạc yêu cầu EM phân bổ nguồn lực | Hạc → Tùng.Ly | Chờ |
| 12/08/2025 | Giữa tháng 8, chưa có SE nào làm task | Hạc | 🔴 Nguy hiểm |
| 13/08/2025 | Hạc yêu cầu chính thức: cần 3 MM SE tháng 8 | Hạc → Tùng.Ly | Escalate |
| 15/08/2025 | Quốc Bảo nhắc Tùng xem xét | Bảo → Tùng | Nhắc nhở |
| 18/08/2025 | Quốc Bảo hỏi lại tình trạng điều quân | Bảo | Chưa giải quyết |
| 21/08/2025 | Tùng xác nhận: Như (15-30/8), Quan (20-27/8), Tú (19-27/8) | Tùng | Thiếu so với yêu cầu |
| 04/09/2025 | Hạc yêu cầu 3 người full tháng 9 (UAT phase) | Hạc → Tùng | Cấp bách |
| 09/09/2025 | Tùng thông báo hết hôm nay SE chuyển sang dự án khác | Tùng → Hạc | ⚠️ Rủi ro |
| 04/10/2025 | Quốc Bảo nhắc rà soát task confirm và deadline | Bảo → Hạc | Đang xử lý |
| 24-28/11/2025 | Sprint tasks lọc lại, xin thêm SE từ anh Bảo | Hạc | Giai đoạn cuối |

---

## Nguồn lực thực tế được cấp (Tháng 8/2025)

| Nhân sự | Thời gian | Ghi chú |
|---------|-----------|---------|
| Trần Thị Quỳnh Như | 15/08 → 30/08 | Người duy nhất full tháng 8 ban đầu |
| Quan | 20/08 → 27/08 | Bổ sung sau |
| Tú | 19/08 → 27/08 | Bổ sung sau |

**Yêu cầu vs Thực tế:** 3 MM yêu cầu → < 0.5 MM được cấp ban đầu

---

## Rủi ro phát sinh

- Giai đoạn UAT (09/09 bắt đầu), SE bị rút đi gây block tiến độ
- 30 task còn tồn đọng (28 SE + 2 BA) tại ngày 28/08
- Ngày 04/09: 35 task tổng (29 chờ SE resolve + 6 bug)
- Block không test tiếp được → delay UAT

---

## Bài học

> Xem thêm: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425|Rủi ro dự án]]

- Nên chốt resource commitment từ đầu tháng, không để leo thang qua nhiều tuần
- UAT phase cần SE backup song song (fix bug + develop phase tiếp theo)
- Quy định "tối thiểu 5 task mới được xin nguồn lực" → PM Hạc đã challenge quy định này
