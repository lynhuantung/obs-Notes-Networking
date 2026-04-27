---
Mã: 25010206-01
aliases:
date: 2025-04-15
date-updated: 2026-04-27
time: 09:40
Week: "16"
tags:
  - "#project"
  - "#timeline"
phase:
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/3. Timeline-7425|Timeline dự án]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/2. Scope-7425|Phạm vi dự án]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-cài đặt|Phase Cài đặt]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-UAT|Phase UAT]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425|Rủi ro dự án]]"
---

# Các Giai Đoạn — QuickPack QPVN

> **Official Golive:** 01/12/2025 ⭐ (mốc cứng, không lùi)
> **Project Acceptance:** 01–02/2026

---

## Tổng quan các giai đoạn

```
04/2025       ← Chuẩn bị, dựng hạ tầng nội bộ
06–07/2025    ← Khảo sát & chốt SRS (8 phân hệ)
15/07–30/08   ← Build Đợt 1: HRE, ATT, REC, Đồng phục/Thiết bị
15/08–30/09   ← Build Đợt 2: INS, SAL, TRA, EVA
T8–T9/2025    ← Training sơ bộ (song song Build)
T9/2025       ← UAT Đợt 1 (4 phân hệ đợt 1)
T10/2025      ← UAT Đợt 2 (4 phân hệ đợt 2)
01–20/11/2025 ← UAT tổng hợp 8 phân hệ
T11/2025      ← Training End-user
01/12/2025    ← GO-LIVE ⭐
01–02/2026    ← Project Acceptance / Nghiệm thu
```

---

## Giai đoạn 1: Khảo sát và chốt SRS

- **Thời gian:** 02/06/2025 – 30/06/2025
- **Nhiệm vụ chính:**
  - Phân tích GAP 8 phân hệ (HRE, ATT, REC, Đồng phục, INS, SAL, TRA, EVA)
  - Hoàn thành tài liệu SRS đầy đủ trước 29/07/2025
  - Tách source QPVN, dựng link nội bộ VnR + link test cho KH
  - Link SRS: [Drive](https://drive.google.com/file/d/18jjcY5p2Ba0_uKlp_qaQneP_jUkXbCn-/view?usp=sharing)
- **Kết quả:**
  - ✅ SRS hoàn thành, GAP được xác định cho từng phân hệ
  - GAP phức tạp: Đồng phục/Thiết bị (cảnh báo tồn kho), SAL (lệch chu kỳ), TRA (đào tạo theo đợt)
  - INS, EVA: Không có GAP
- **Rủi ro:**
  - Vấn đề chuyển đổi định dạng ngày tháng khi migrate .NET Framework → .NET 8 (phát sinh 13/06/2025)

---

## Giai đoạn 2: Xây dựng hệ thống → [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-cài đặt|Phase-cài đặt]]

**Thời gian tổng thể:** 15/07/2025 – 30/09/2025

### Đợt 1 — Build (15/07 – 30/08/2025)
| Phân hệ | Mô tả | GAP |
|---------|-------|-----|
| HRE | Hồ sơ nhân sự | Có GAP – đã raise task |
| ATT | Chấm công | Có GAP – đã raise task |
| REC | Tuyển dụng | Có GAP – đã raise task |
| Đồng phục/Thiết bị | Quản lý đồng phục & thiết bị | **GAP PHỨC TẠP** – cảnh báo tồn kho |

- Tình trạng cuối T8: 35 tasks (29 SE + 6 bug), SE bị rút → escalate lên anh Bảo
- SE bổ sung: Như (15–30/08), Quan (20–27/08), Tú (19–27/08)

### Đợt 2 — Build (15/08 – 30/09/2025)
| Phân hệ | Mô tả | GAP |
|---------|-------|-----|
| INS | Bảo hiểm | ✅ Không có GAP |
| SAL | Lương sản phẩm | **GAP PHỨC TẠP** – lệch chu kỳ lương chính |
| TRA | Đào tạo nhân viên mới | **GAP PHỨC TẠP** – đào tạo theo đợt |
| EVA | Đánh giá | ✅ Không có GAP |

- **Nhiệm vụ dùng chung cả 2 đợt:**
  - Prepare Data to Migrate: Đợt 1 (27/07–30/08), Đợt 2 (15/08–30/09) ← QPVN Task
  - Testcase / Special Cases sau mỗi đợt build

- **Rủi ro:**
  - 🔴 Thiếu SE tháng 8: yêu cầu 3MM, cấp < 0.5MM → xảy ra thực tế
  - 🔴 SE bị rút giữa giai đoạn (09/09, còn 35 tasks open)
  - 🟡 Bug block luồng test: QPVN2128, QPVN2158, QPVN2146

---

## Giai đoạn 3: Đào tạo

- **Đợt 1 – Training sơ bộ:** T8–T9/2025 (song song UAT Đợt 1)
  - Hoàn tất trước: 29/09/2025
  - Đào tạo 4 phân hệ đợt 1 (HRE, ATT, REC, Đồng phục)
- **Đợt 2 – Training End-user:** T11/2025
  - Đào tạo toàn bộ 8 phân hệ cho người dùng cuối QPVN
- **Rủi ro:**
  - Bug chưa được fix khi bắt đầu đào tạo (08/09 bắt đầu training KH, còn 3 bug block)

---

## Giai đoạn 4: UAT → [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-UAT|Phase-UAT]]

- **Thời gian:** T9 – T11/2025
- **Kế hoạch:**

| Đợt | Thời gian | Phân hệ |
|-----|-----------|---------|
| UAT Đợt 1 | T9/2025 | HRE, ATT, REC, Đồng phục/Thiết bị |
| UAT Đợt 2 | T10/2025 | INS, SAL, TRA, EVA |
| UAT tổng hợp | 01–20/11/2025 | 8 phân hệ kết hợp |

- **Nhiệm vụ:**
  - Update Master Data: 01/11 – 20/11
  - Import & Check Data: T11
  - SE fix bug song song trong suốt giai đoạn UAT
  - Test Case Sheet: https://docs.google.com/spreadsheets/d/11g103d8kEB7cSc2MjnejOSMHo7mrrn37xBwPlqJ3-f8
- **Rủi ro:**
  - 🔴 SAL & TRA phức tạp, cần SE chuyên sâu
  - 🟡 Server UAT/PRD chưa tách biệt → cần dựng server PRD riêng
  - 🟡 Bug phát sinh không chốt được số lượng trước

---

## Giai đoạn 5: Go-live

- **Official Golive:** 01/12/2025 ⭐ (mốc cứng, không lùi)
- **Nhiệm vụ:**
  - Cutover data từ UAT sang Production
  - Deploy build lên môi trường Production
  - Hỗ trợ vận hành ngày đầu (hypercare)
- **Rủi ro:**
  - 🔴 Deadline cứng — UAT cần hoàn tất trước 20/11/2025
  - Sprint T11: SE tăng cường tuần 24–28/11/2025

---

## Giai đoạn 6: Project Acceptance / Nghiệm thu

- **Thời gian:** 01/2026 – 02/2026
- **Nhiệm vụ:**
  - Confirm các tasks còn tồn đọng sau Golive
  - Build Management T01/2026: version `QPVN_v8.12.48.01.43` (19/01/2026)
  - Sửa chức năng tổng hợp ngày công (23/01/2026)
  - Ký biên bản nghiệm thu
- **Rủi ro:**
  - Các task phát sinh hậu Golive cần SE xử lý song song

---

## Milestone tổng hợp

| Ngày | Milestone | Giai đoạn | Phụ trách |
|------|-----------|-----------|-----------|
| 29/07/2025 | Hoàn tất SRS | Khảo sát | VnResource |
| 30/08/2025 | Hoàn tất Build Đợt 1 | Build | VnResource |
| 29/09/2025 | Hoàn tất Training sơ bộ | Đào tạo | Tùng.Ly |
| 30/09/2025 | Hoàn tất Build Đợt 2 | Build | VnResource |
| 20/11/2025 | Hoàn tất Update Master Data | UAT | QPVN |
| **01/12/2025** | **Official Golive ⭐** | **Go-live** | **VnResource & QPVN** |
| 01/2026 | Project Acceptance | Nghiệm thu | VnResource |

---

> Xem thêm: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/6. Risks-7425|Rủi ro theo giai đoạn]] | [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/note-gap-phan-he|GAP Phân hệ]] | [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/task-tracking-phan-he-qpvn|Task Tracking Phân hệ]]
