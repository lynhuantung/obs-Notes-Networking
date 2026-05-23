---
Mã: note-gap-phan-he
aliases:
date: 2025-08-11
tags:
  - gap
  - analysis
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-thi-cong-quickpack|← Index Chat Thi Công]]"
  - "[[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-UAT|Phase UAT]]"
  - "[[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/3. Timeline-7425|Timeline dự án]]"
---

# GAP Phân Hệ — QuickPack QPVN

> Nguồn: Chat thi công ngày 11/08/2025 (Trần Phước Hạc gửi team)
> Xem thêm: [[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-thi-cong-quickpack|Index Chat Thi Công]]

---

## 8 Phân hệ dự án

| Phân hệ | Mô tả | GAP | UAT đợt |
|---------|-------|-----|---------|
| HRE | Hồ sơ nhân viên | Có GAP | Đợt 1 (T9) |
| ATT | Chấm công | Có GAP | Đợt 1 (T9) |
| REC | Tuyển dụng | Có GAP | Đợt 1 (T9) |
| Đồng phục/Thiết bị | Quản lý đồng phục, thiết bị | **GAP PHỨC TẠP**: Cảnh báo tồn kho & số lượng sắp cấp | Đợt 1 (T9) |
| INS | Bảo hiểm | Không có GAP | Đợt 2 (T10) |
| SAL | Lương | **GAP PHỨC TẠP**: Lương sản phẩm (lệch chu kỳ lương chính) | Đợt 2 (T10) |
| TRA | Đào tạo | **GAP PHỨC TẠP**: Quy trình đào tạo nhân viên mới theo đợt | Đợt 2 (T10) |
| EVA | Đánh giá | Không có GAP | Đợt 2 (T10) |

---

## Timeline phát triển theo giai đoạn

```
T8/2025  → Phát triển GAP: HRE, ATT, REC, Đồng phục/thiết bị
T9/2025  → SE fix bug song song; UAT đợt 1 (4 phân hệ trên)
           → Phát triển GAP: INS, SAL, TRA, EVA
T10/2025 → SE fix bug song song; UAT đợt 2 (4 phân hệ)
T11/2025 → KH UAT kết hợp 8 phân hệ
01/12/25 → GO-LIVE
```

---

## GAP HRE — Chi tiết

Phân hệ HRE có các quy trình cần bổ sung:
- HRE02.02.02 — Quy trình đăng ký bổ sung/thay đổi người thân & NPT
- HRE02.02.04 — Quy trình đăng ký bổ sung/thay đổi trình độ chuyên môn
- HRE02.02.05 — Quy trình đăng ký bổ sung/thay đổi thông tin tài khoản

> Nguồn: Phan Thị Phương Thảo feedback trong quá trình review test case (08/08/2025)

---

## GAP ATT — Chi tiết

- Raise task về GAP phân hệ chấm công: Nguyễn Quốc Nhựt (07/08/2025)
- Anh Thông viết tài liệu giải pháp, anh Tùng Lý điều phối

---

## GAP Đồng phục/Thiết bị — Chi tiết

- Họp gap ngày 04/08/2025 (10h00 - 11h30)
- Người tham gia: Lý Nhuận Tùng, Trịnh Trần Thế Thông, Trần Phước Hạc
- Biên bản họp đã gửi và add vào AMIS

---

## Vấn đề nguồn lực SE

> ⚠️ **Rủi ro nghiêm trọng** (14/08/2025)

- PM yêu cầu: **3 manmonth SE** cho tháng 8/2025
- Thực tế được cấp: **< 0.5 manmonth**
- Hậu quả: Tất cả tasks đều chờ một mình Như làm → không kịp tiến độ
- Action: Anh Bảo yêu cầu anh Tùng sắp xếp người → đã sắp xếp ngày 15/08

**SE được bổ sung:**
| SE | Thời gian | Ghi chú |
|----|-----------|---------|
| Như | 15/08 - 30/08 | |
| Quan | 20/08 - 27/08 | |
| Tú | 19/08 - 27/08 | |

> Xem thêm: [[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/5. Resources-7425|Nguồn lực dự án]]

---

## Links tài nguyên

- SRS dự án: https://drive.google.com/file/d/18jjcY5p2Ba0_uKlp_qaQneP_jUkXbCn-/view?usp=sharing
- Test Case: https://docs.google.com/spreadsheets/d/11g103d8kEB7cSc2MjnejOSMHo7mrrn37xBwPlqJ3-f8

