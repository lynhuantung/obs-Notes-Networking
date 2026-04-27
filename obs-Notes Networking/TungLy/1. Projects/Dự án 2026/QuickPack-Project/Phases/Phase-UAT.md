---
Mã: 25010206-01
aliases:
date: 2025-04-15
date-updated: 2026-04-27
time: 09:40
Week: "16"
tags:
  - "#project"
  - "#UAT"
phase: UAT
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Các giai đoạn|Các giai đoạn]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-cài đặt|Phase Cài đặt]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/5. Resources-7425|Nguồn lực dự án]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-test-case|Test Case]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-gap-phan-he|GAP Phân hệ]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-sprint-tasks-q4-2025|Sprint Tasks Q4/2025]]"
---

# Giai đoạn: UAT

**Thời gian:** T9/2025 – 20/11/2025
**Deadline hoàn tất UAT:** 20/11/2025 (để chuẩn bị Golive 01/12)

---

## Kế hoạch UAT (3 đợt)

| Đợt | Thời gian | Phân hệ | Ghi chú |
|-----|-----------|---------|---------|
| **UAT Đợt 1** | T9/2025 | HRE, ATT, REC, Đồng phục/Thiết bị | Song song Training sơ bộ |
| **UAT Đợt 2** | T10/2025 | INS, SAL, TRA, EVA | SAL & TRA phức tạp |
| **UAT Tổng hợp** | 01–20/11/2025 | 8 phân hệ kết hợp | KH UAT toàn diện |

---

## Chi tiết từng đợt

### UAT Đợt 1 — T9/2025 (HRE, ATT, REC, Đồng phục)

- [ ] HRE: Kiểm thử hồ sơ nhân sự, quy trình cập nhật thông tin người thân/NPT/tài khoản
- [ ] ATT: Kiểm thử chấm công theo GAP đã raise
- [ ] REC: Kiểm thử tuyển dụng (8 cấp)
- [ ] Đồng phục/Thiết bị: Kiểm thử cảnh báo tồn kho & số lượng sắp cấp
- [ ] SE fix bug song song trong suốt đợt 1
- [ ] 3 Bug block cần fix trước 08/09: QPVN2128, QPVN2158, QPVN2146

> ⚠️ Lỗi mobile app chỉ xảy ra tại KH (T9/2025) → Điều SE mobile kiểm tra tại chỗ

### UAT Đợt 2 — T10/2025 (INS, SAL, TRA, EVA)

- [ ] INS: Kiểm thử bảo hiểm (không có GAP, test standard)
- [ ] SAL: Kiểm thử lương sản phẩm — lưu ý lệch chu kỳ lương chính
- [ ] TRA: Kiểm thử đào tạo nhân viên mới theo đợt
- [ ] EVA: Kiểm thử đánh giá (không có GAP, test standard)
- [ ] SE fix bug song song trong suốt đợt 2

### UAT Tổng hợp — 01–20/11/2025 (8 phân hệ)

- [ ] Update Master Data: 01/11 – 20/11 ← **QPVN Task**
- [ ] Import & Check Data: T11
- [ ] KH thực hiện UAT kết hợp toàn bộ 8 phân hệ
- [ ] VnResource hỗ trợ & fix bug song song
- [ ] Sprint 24–28/11: SE dự án confirm lại tasks tồn đọng
- [ ] Xin thêm SE tăng cường từ anh Bảo (Sprint T11)

---

## Tài nguyên Test

- **Test Case Sheet:** https://docs.google.com/spreadsheets/d/11g103d8kEB7cSc2MjnejOSMHo7mrrn37xBwPlqJ3-f8
- [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-test-case|Ghi chú Test Case]] — quy trình, deadline từng phân hệ
- [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-sprint-tasks-q4-2025|Sprint Tasks Q4/2025]] — build management, tasks T11/2025

---

## Build Management trong UAT

Quy trình build song song với UAT:
```
1. SE raise yêu cầu build → @Nguyễn Ngọc Hải
2. Nguyễn Ngọc Hải bấm build Main (~1 tiếng)
3. SE upload my-app (portal)
4. QC (Lê Thị Kim Tuyền) test trên link test
```

**Build T01/2026 (hậu Golive):**
| Ngày | Phiên bản | Ghi chú |
|------|-----------|---------|
| 19/01/2026 | `QPVN_v8.12.48.01.43` | Build Main + Portal |
| 20/01/2026 | Build Main | Theo yêu cầu Nhựt |
| 23/01/2026 | Build Main | Task AMIS #3701466 |
| 26/01/2026 | Build full mới nhất | Phương Thảo yêu cầu |

---

## Rủi ro & Ứng phó

| Rủi ro | Mức độ | Ứng phó |
|--------|--------|---------|
| SAL module phức tạp (lệch chu kỳ) | 🔴 Cao | Cần SE chuyên sâu, raise task sớm |
| TRA module phức tạp (đào tạo theo đợt) | 🔴 Cao | Review SRS kỹ trước UAT |
| Bug phát sinh trong UAT không chốt số trước | 🟡 TB | Team test & raise; SE fix song song |
| SE rút giữa giai đoạn UAT | 🔴 Cao | Xin SE tăng cường, sprint quản lý chặt |
| Server UAT/PRD chưa tách biệt | 🟡 TB | Dựng server PRD riêng trước Golive |
| Lỗi mobile app tại KH | 🟡 TB | Điều SE mobile kiểm tra tại chỗ |
| UAT chưa xong trước 01/12 | 🔴 Cao | Sprint T11 tăng tốc, SE bổ sung |

---

## Điều kiện kết thúc UAT

- [ ] Toàn bộ test case của 8 phân hệ đã pass
- [ ] Không còn bug severity P1/P2 open
- [ ] Master Data đã được import và kiểm tra đầy đủ
- [ ] KH ký biên bản xác nhận UAT
- [ ] Môi trường Production sẵn sàng cho Golive

---

## Meeting Notes liên quan

- [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Meeting_Notes/H-QuickPack-FAC-01082025|Meeting FAC — 01/08/2025]]
- [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Meeting_Notes/H-QuickPack-REC-09082025|Meeting REC — 09/08/2025]]

---

> ← [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-cài đặt|Phase Cài đặt]] | [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Các giai đoạn|Quay lại Các giai đoạn]]
