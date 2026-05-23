---
description: "Dự án Bitex-AKW: triển khai HRM mới trên .NET Core cho 2 khách hàng, golive 01/12/2025, đang hậu go-live hỗ trợ vận hành."
type: wiki-project
tags:
  - bitex
  - akw
  - hrm
  - "2025"
  - "2026"
created: 2026-04-25
updated: 2026-05-04

# --- CHART FIELDS ---
status: post-golive
start-date: 2025-06-02
end-date: 2025-12-01
project-type: new-deployment
industry: retail
team-size: 8
effort-mandays: 0
modules: [HRE, ATT, TRA, UNI, Portal, APP]
related:
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/Bitex-Project-Overview]]"
  - "[[wiki/sources/Bitex-Chat-ChiHuyThiCong]]"
  - "[[wiki/sources/Bitex-TaskList-PostGoLive]]"
  - "[[wiki/flows/Flow-Bitex-Phases]]"
---

# Dự án Bitex-AKW

## Thông tin cơ bản

| Trường     | Giá trị                                        |
| ---------- | ---------------------------------------------- |
| Khách hàng | Bitex + AKW (2 hợp đồng, 1 hệ thống)           |
| Mã dự án   | AKW                                            |
| Loại dự án | Triển khai HRM mới                             |
| Timeline   | 02/06/2025 → 01/12/2025 (Golive)               |
| Trạng thái | 🔄 Hậu go-live (Hỗ trợ vận hành)               |
| Phân hệ    | HRE, ATT, TRA, UNI, Portal, APP                |
| Branch     | `HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09` |

---

## Nhân sự

| Tên                             | Vai trò                  |
| ------------------------------- | ------------------------ |
| Lý Nhuận Tùng                   | Trưởng dự án / SE Lead   |
| Trịnh Công Thức (Thức)          | PE Lead                  |
| Trần Duy Tùng                   | Quản lý thi công (TCDA)  |
| Trần Quốc Bảo                   | Quản lý (TCDA)           |
| Phạm Văn Hiển                   | Quản lý điều phối (TCDA) |
| Nguyễn Thị Kim Hồng             | SE Lead từ 11/2025       |
| Trần Văn Hoài Thương            | SE thi công              |
| Nguyễn Thị Lan Vy               | PE / Admin nhóm           |
| Phan Thị Ngọc Tuyền (Tuyết Anh) | PE hỗ trợ hậu go-live    |

---

## Đặc điểm nổi bật

### 2 hợp đồng — 1 dự án
Bitex và AKW ký hợp đồng riêng nhưng cùng 1 hệ thống HRM.  
**Quyết định**: 1 project AMIS duy nhất + hạch toán tài chính chia đôi.

### Tích hợp API real-time
HRM gọi API phía KH để lấy dữ liệu (không import file tĩnh).  
GAP Sheet: https://docs.google.com/spreadsheets/d/1hK414d6CsXSsr5wmsjdxJCZHA-Q6R8TBc1jZwQtG6kk

### Chuyển đổi .NET Core
Chuyển từ .NET Framework sang .NET Core — hoàn thành trước khi cài đặt.

---

## Timeline 5 giai đoạn

| Giai đoạn | Thời gian | Trạng thái |
|-----------|-----------|-----------|
| 1. Khảo sát & SRS | 02/06 – 30/06/2025 | ✅ Hoàn thành |
| 2. Cài đặt hệ thống | 01/07 – 30/09/2025 | ✅ Hoàn thành |
| 3. Đào tạo | 29/09 – 18/12/2025 | ✅ Hoàn thành |
| 4. UAT (2 round) | 14/10 – 23/11/2025 | ✅ Hoàn thành |
| 5. Golive & Hỗ trợ | 01/12/2025 → nay | 🔄 Đang tiếp tục |

→ Chi tiết: [[wiki/flows/Flow-Bitex-Phases]]

---

## Rủi ro thực tế phát sinh

| # | Vấn đề | Ngày | Trạng thái |
|---|--------|------|-----------|
| R1 | BA bị rút không thông báo PE | 06/09/2025 | ✅ Đã xử lý |
| R2 | HRE deadline trễ (10/10 → 18/10) | 15/10/2025 | ✅ Re-target |
| R3 | AKW32 ẩn nhiều sub-task — estimate sai | 01/11/2025 | ✅ Đã xử lý |
| R4 | Lệch dữ liệu file offline vs online | 18/12/2025 | ✅ Chốt Google Sheet |
| R5 | Lỗi gửi mail hệ thống | 27/01/2026 | 🔴 Tồn đọng |
| R6 | Cache cấu hình HttpContext → Redis | 12/02/2026 | ✅ Fixed |
| R7 | Performance cache list → dictionary | 08/04/2026 | ✅ Fixed |
| R8 | Chấm công GPS/WiFi mobile bị loading — không ghi nhận được | 28/04/2026 | ✅ Fixed (05/05/2026) — 2 API serial gộp 1 API |
| R9 | Log Review không load được log WindowsService & API SC — bug encrypt FullPath | 04/05/2026 | ✅ Fixed |

---

## Trạng thái hậu go-live (27/04/2026)

**PE Tuyết Anh** đang hỗ trợ: 81/99 tasks done (82%)

| Hạng mục | Tổng | Done | Còn lại |
|----------|------|------|---------|
| Raise Task / Test / Import / Issues / Hỗ trợ KH | 75 | 74 | 1 |
| Viết store / Xuất Word | 12 | 5 | 7 |
| Cấu hình Báo cáo | 8 | 0 | 8 |

**Ưu tiên tiếp theo**: Cấu hình báo cáo bảng công + xuất Word HĐ

---

## Bài học kinh nghiệm

1. **Thông báo rút nhân sự** ≥ 3 ngày trước
2. **Buffer deadline** SE = UAT deadline - 2~3 ngày
3. **1 nguồn dữ liệu** = Google Sheet online (không dùng file offline)
4. **Breakdown sub-task** trước estimate task phức tạp
5. **Multi-contract** = 1 project AMIS + hạch toán tài chính tách riêng
6. **SE xong ≠ Dự án đảm bảo** — chuỗi: SE → PE test → KH test → nghiệm thu

---

## Nguồn tham khảo

- [[wiki/sources/Bitex-Project-Overview]] — Goals / Scope / Timeline / Risks / Resources / Phases
- [[wiki/sources/Bitex-Chat-ChiHuyThiCong]] — Chat log nhóm "Chỉ Huy Thi Công"
- [[wiki/sources/Bitex-TaskList-PostGoLive]] — Task list hậu go-live (Tuyết Anh)
- [[wiki/flows/Flow-Bitex-Phases]] — Sơ đồ Mermaid các giai đoạn
- [[wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading]] — Incident GPS/WiFi loading (28/04/2026)
- [[wiki/sources/2026-05-04-log-review-bitex]] — Log Review gom nhóm WindowsService + API SC, fix encrypt FullPath
