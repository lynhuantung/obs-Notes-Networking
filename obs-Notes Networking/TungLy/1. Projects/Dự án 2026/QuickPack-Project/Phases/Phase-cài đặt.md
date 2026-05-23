---
Mã: 25010206-01
aliases:
date: 2025-04-15
date-updated: 2026-04-27
time: 09:40
Week: "16"
tags:
  - "#project"
  - "#build"
phase: Build
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Các giai đoạn|Các giai đoạn]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/2. Scope-7425|Phạm vi dự án]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-gap-phan-he|GAP Phân hệ]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/task-tracking-phan-he-qpvn|Task Tracking Phân hệ]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-nguon-luc-se-qpvn|Issue nguồn lực SE]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-server-infrastructure-qpvn|Issue Server hạ tầng]]"
---

# Giai đoạn: Xây dựng hệ thống (Build)

**Thời gian tổng thể:** 15/07/2025 – 30/09/2025

---

## Đợt 1 — Build (15/07 – 30/08/2025)

### Phân hệ
| Phân hệ | Mô tả | GAP | Trạng thái |
|---------|-------|-----|-----------|
| **HRE** | Hồ sơ nhân sự | Có GAP — đã raise task | Build T7–T8 |
| **ATT** | Chấm công | Có GAP — đã raise task | Build T7–T8 |
| **REC** | Tuyển dụng | Có GAP — đã raise task | Build T7–T8 |
| **Đồng phục/Thiết bị** | Quản lý đồng phục & thiết bị | **PHỨC TẠP** — cảnh báo tồn kho, số lượng sắp cấp | Build T7–T8 |

### GAP chi tiết Đợt 1

**HRE:**
- HRE02.02.02 — Quy trình đăng ký bổ sung/thay đổi người thân & NPT
- HRE02.02.04 — Quy trình đăng ký bổ sung/thay đổi trình độ chuyên môn
- HRE02.02.05 — Quy trình đăng ký bổ sung/thay đổi thông tin tài khoản
- Nghỉ phép: 4 cấp → 5 cấp; Nghỉ việc: 4 cấp → 6 cấp; Tuyển dụng: 8 cấp (sửa nhiều dữ liệu)

**ATT:**
- Raise task: Nguyễn Quốc Nhựt (07/08/2025)
- Tài liệu giải pháp: Thông viết, Tùng Lý điều phối

**Đồng phục/Thiết bị:**
- Họp GAP: 04/08/2025 (10h00–11h30)
- Tham gia: Lý Nhuận Tùng, Trịnh Trần Thế Thông, Trần Phước Hạc
- Biên bản họp đã gửi và add vào AMIS
- Xem: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Meeting_Notes/H-QuickPack-FAC-01082025|Họp FAC 01/08/2025]]

### Công việc dùng chung Đợt 1
- Prepare Data to Migrate: 27/07 – 30/08 ← **QPVN Task**
- Testcase / Special Cases
- Dựng môi trường Linux cho test

### Tình trạng cuối Đợt 1 (tháng 8/2025)
| Ngày | SE tasks | BA tasks | Tổng | Ghi chú |
|------|----------|----------|------|---------|
| 28/08 | 28 | 2 | **30** | SE đã rút, không có người xử lý |
| 29/08 | 29 | — | **35** | +6 bug cần fix |
| 04/09 | 29 resolve + 6 bug | — | **35** | Block luồng test |

**3 Bug block UAT** (cần xử lý trước 08/09):
- QPVN2128, QPVN2158, QPVN2146

---

## Đợt 2 — Build (15/08 – 30/09/2025)

### Phân hệ
| Phân hệ | Mô tả | GAP | Trạng thái |
|---------|-------|-----|-----------|
| **INS** | Bảo hiểm | ✅ Không có GAP | Build T8–T9 |
| **SAL** | Lương sản phẩm | **PHỨC TẠP** — lương sản phẩm lệch chu kỳ lương chính | Build T8–T9 |
| **TRA** | Đào tạo | **PHỨC TẠP** — đào tạo nhân viên mới theo đợt | Build T8–T9 |
| **EVA** | Đánh giá | ✅ Không có GAP | Build T8–T9 |

### GAP chi tiết Đợt 2

**SAL:** Cơ chế lương sản phẩm với chu kỳ lệch so với lương chính — cần logic tính toán riêng, chưa raise xong task (tính đến 07/10/2025)

**TRA:** Quy trình đào tạo nhân viên mới theo đợt — phức tạp về luồng phê duyệt và theo dõi tiến độ đào tạo

### Công việc dùng chung Đợt 2
- Prepare Data to Migrate: 15/08 – 30/09 ← **QPVN Task**
- Testcase / Special Cases

---

## Task chốt tổng hợp (07/10/2025)

**Người raise:** Nguyễn Thị Kim Hồng (PE/BA)

| Phân hệ | Trạng thái task |
|---------|----------------|
| HRE | ✅ Task đã confirm |
| ATT | ✅ Task đã confirm |
| REC | ✅ Task đã confirm |
| TRA | ✅ Task đã confirm |
| INS | ✅ Không có GAP |
| EVA | ✅ Không có GAP |
| SAL | ⏳ Chưa raise xong, bổ sung sau |
| Đồng phục | ✅ Đã họp GAP, raise task |

---

## Nguồn lực SE

### Vấn đề thiếu SE (08/2025) — ĐÃ XẢY RA
- Yêu cầu: **3 manmonth SE** cho T8/2025
- Thực tế được cấp: **< 0.5 manmonth**
- Action: Leo thang lên anh Bảo → anh Hiển → anh Tùng sắp xếp

### SE được bổ sung
| SE | Thời gian | Ghi chú |
|----|-----------|---------|
| Như | 15/08 – 30/08 | |
| Quan | 20/08 – 27/08 | |
| Tú | 19/08 – 27/08 | |

---

## Hạ tầng & Môi trường

- Dựng link nội bộ VnR + link test cho KH: T4–T6/2025
- Dựng link net8 cho PE: 23/04/2025 ✅
- Dựng link QC test IIS: 17/02/2025 ✅
- Build Docker image QuickPack: 23/04/2025 ✅
- Ghi log request: 23/04/2025 ✅
- Chưa có môi trường Linux → Nhờ IT dựng

> Xem thêm: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/issue-server-infrastructure-qpvn|Issue Server hạ tầng]]

---

## Rủi ro giai đoạn Build

| Rủi ro | Mức độ | Thực tế | Ứng phó |
|--------|--------|---------|---------|
| Thiếu SE T8/2025 | 🔴 Cao | Xảy ra: cấp < 0.5MM vs yêu cầu 3MM | Leo thang, bổ sung SE |
| SE bị rút giữa giai đoạn | 🔴 Cao | SE rút 09/09, còn 35 tasks | Xin bổ sung sau lễ |
| Bug block luồng UAT | 🟡 TB | QPVN2128/2158/2146 | Ưu tiên fix trước đào tạo |
| SAL phức tạp (lệch chu kỳ) | 🔴 Cao | Chưa raise xong task | Cần SE chuyên sâu |
| TRA phức tạp (đào tạo theo đợt) | 🔴 Cao | | Cần review SRS kỹ |
| Lỗi .NET Framework → .NET 8 | 🟡 TB | Vấn đề định dạng ngày tháng 13/06 | Dùng System.Text.Json |

---

## Meetings liên quan

- [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Meeting_Notes/H-QuickPack-FAC-01082025|Họp GAP Đồng phục — 01/08/2025]]
- [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Meeting_Notes/H-QuickPack-REC-09082025|Họp REC — 09/08/2025]]

---

> ← [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Các giai đoạn|Quay lại Các giai đoạn]] | Tiếp theo: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-UAT|Phase UAT →]]
