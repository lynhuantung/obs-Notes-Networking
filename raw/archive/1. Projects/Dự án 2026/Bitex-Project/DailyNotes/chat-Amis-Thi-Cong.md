---
type: chat-log-summary
tags:
  - bitex
  - thi-cong
  - chat-log
  - TCDA
date-updated: 2025-12-18
Project: "[[Dự án Bitex]]"
related:
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-2HopDong-1DuAn]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-API-Integration]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-TaskPriority-AKW31-32-90]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-BuildLog-Convention]]"
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-TechnicalIssues-NovDec]]"
---

# Chat Log: Bitex AKW — Nhóm Thi Công (TCDA)

> **Nhóm:** Bitex AKW - Thi công / Chỉ huy thi công  
> **Thời gian:** 11/07/2025 → 18/12/2025  
> **Thành viên chính:** Trịnh Công Thức (PE), Lý Nhuận Tùng (SE Lead), Trần Duy Tùng (PM), Hoàng Thanh Tùng (SE), Trần Văn Hoài Thương (SE), Nguyễn Văn Đô (BA), Phan Thị Ngọc Tuyền (PE), Nguyễn Thị Kim Hồng (TCDA), Phạm Văn Hiển (TCDA Lead)

---

## Timeline sự kiện chính

### 🟡 Tháng 7/2025 — Khởi động

| Ngày | Sự kiện | Ghi chú |
|------|---------|---------|
| 11/07 | Thức hỏi ai là Quản lý thi công | → Tùng xác nhận |
| 11/07 | Thức yêu cầu PE cần sớm task list để upload lên | Chờ bên thi công tạo dự án trên AMIS |
| 12/07 | **Kế hoạch buổi trao đổi API với KH** | HRM gọi API của KH để lấy dữ liệu | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-API-Integration]] |
| 14/07 | Thức nhờ Hiển hỗ trợ tài liệu API, điều phối SE tham gia | Tùng off, Hiển hỗ trợ |
| 11/07 | Lan Vy tạo group Bitex-AKW thi công | |

---

### 🟡 Tháng 8/2025 — Khởi động kỹ thuật

| Ngày | Sự kiện | Ghi chú |
|------|---------|---------|
| 11/08 | **Họp GAP** với Đô (BA) + Lý Nhuận Tùng | Thứ 2, 9h, lầu 2 | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-API-Integration]] |
| 11/08 | Thức gửi link GAP sheet | https://docs.google.com/spreadsheets/d/1hK414d6CsXSsr5wmsjdxJCZHA-Q6R8TBc1jZwQtG6kk |
| 12/08 | Tuyền, Tùng (Hoàng) join nhóm | |
| 15/08 | Tùng (Hoàng) nhờ Đô ưu tiên **AKW32** (move code Phân ca làm việc) | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-TaskPriority-AKW31-32-90]] |
| 21/08 | Thức hỏi đã bổ sung SE chưa | Hiển review + thêm nguồn lực |
| 22/08 | **Tranh luận 2 hợp đồng Bitex + AKW** | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-2HopDong-1DuAn]] |
| 23/08 | Lý Nhuận Tùng **tách source** `HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09` | Thương bắt đầu xử lý task từ thứ 2 |
| 23/08 | Lý Nhuận Tùng gửi **quy tắc pull request** | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-BuildLog-Convention]] |
| 23/08 | Trần Duy Tùng add **Thương (SE)** vào dự án 23-30/08 | |
| 25/08 | **Build đầu tiên** Thương gửi | `BITEX_v8.12.48.01.09` + myapp |
| 26/08 | Thức nhắc Thương còn 5 bug nữa cần check | |

---

### 🟠 Tháng 9/2025 — Nguồn lực biến động

| Ngày | Sự kiện | Ghi chú |
|------|---------|---------|
| 04/09 | Tùng merge Bitex + AKW = 1 dự án | Đổi tên nhóm → "Bitex AKW - Chỉ huy thi công" |
| 05/09 | Thương thông báo chuyển sang QuickPack | Task pending | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]] |
| 06/09 | **Thức phát hiện BA bị rút** không thông báo | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]] |
| 06/09 | Yêu cầu 2 SE đến hết tháng 9 | Thương + 1 SE tuần 2-3/09 |
| 09/09 | Kế hoạch Training+UAT **TRA+UNI** ngày 15/09 | 7 task cần xử lý |
| 11/09 | Add **Quỳnh Như (SE)** vào dự án 11-18/09 | |
| 12/09 | Quỳnh Như thông báo chuyển sang ITL | Task pending |

---

### 🔴 Tháng 10/2025 — Deadline HRE trễ

| Ngày | Sự kiện | Ghi chú |
|------|---------|---------|
| 10/10 | **Deadline đã cam kết cho HRE** — MISSED | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]] |
| 15/10 | Thức escalate: task HRE chưa xong, PE chưa nhận cập nhật | Yêu cầu cam kết lại: HRE → 18/10, phân hệ khác → 25/10 |
| 15/10 | Thức add Kim Hồng (TCDA) vào nhóm | |

---

### 🟠 Tháng 11/2025 — UAT + Bug fix

| Ngày | Sự kiện | Ghi chú |
|------|---------|---------|
| 01/11 | Thức gửi mail danh sách task cho Hiển điều phối | |
| 01/11 | **3 task ưu tiên trước 04/11**: AKW31, AKW32, AKW90 | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-TaskPriority-AKW31-32-90]] |
| 01/11 | AKW32 block AKW90, xong sớm nhất sáng thứ 4 (05/11) | |
| 19/11 | Hiển nhờ Kim Hồng confirm deadline hỗ trợ dự án | |
| 20/11 | Kim Hồng chưa nhận danh sách PE, yêu cầu Thức gửi lại | |
| 27/11 | **Bug: Các trường ẩn/hiện, bắt buộc bị reset** | SE thi công báo không fix gì → escalate | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-TechnicalIssues-NovDec]] |
| 27/11 | **Task 146** deadline 27/11 chưa xong, task 145 deadline 28/11 | → Lại Huy Hà fix |
| 28/11 | FIELD_INFO_SPEC.XML gây lỗi trùng key | Tạm bỏ file ra ngoài | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-TechnicalIssues-NovDec]] |

---

### 🟢 Tháng 12/2025 — UAT cuối kỳ

| Ngày | Sự kiện | Ghi chú |
|------|---------|---------|
| 01/12 | Task USP: Thức báo chưa đánh USP → Lý Nhuận Tùng review | |
| 03/12 | Tùng (Hoàng) upbuild mới, nhờ Hiếu test trước UAT Tuyển dụng | **Mai bắt đầu UAT tuyển dụng** |
| 05/12 | Lỗi file lang khi upbuild | Code để "lỡ cỡ" | → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-TechnicalIssues-NovDec]] |
| 06/12 | **Task AKW164** bị lỗi lại sau khi đã fix, test pass | |
| 18/12 | Kim Hồng nhờ Thức share kế hoạch UAT chi tiết | |

---

## Nhân vật & Vai trò

| Người | Vai trò | Ghi chú |
|-------|---------|---------|
| Trịnh Công Thức | PE Lead | Đầu mối phía tư vấn |
| Lý Nhuận Tùng | SE Lead (TCDA) | Review code, pull request |
| Trần Duy Tùng | PM | Điều phối tổng thể |
| Phạm Văn Hiển | TCDA Lead | Điều phối nguồn lực SE |
| Nguyễn Thị Kim Hồng | TCDA | Bám sát task, deadline |
| Trần Văn Hoài Thương | SE | 23/08 – 05/09, build chính |
| Hoàng Thanh Tùng | SE | Aug → Dec |
| Lại Huy Hà | SE | Nov → Dec, task 145-146 |
| Nguyễn Văn Đô | BA | GAP analysis, tài liệu SE |
| Phan Thị Ngọc Tuyền | PE/QC | Test, raise bug |
| Trần Thị Quỳnh Như | SE (temp) | 11-18/09, sau chuyển ITL |
| Đoàn Trung Hiếu | QC/Test | Dec, UAT support |

---

## Issues phát sinh → Ghi chú riêng

| Issue | Ngày | File |
|-------|------|------|
| 2 hợp đồng Bitex + AKW trên 1 dự án | 22/08/2025 | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-2HopDong-1DuAn]] |
| Nguồn lực SE bị thiếu, BA bị rút | 06/09/2025 | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-NguonLuc-SE]] |
| HRE deadline trễ 10/10 | 15/10/2025 | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-HRE-Deadline-Tre]] |
| API integration với KH | 12/07/2025 | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-API-Integration]] |
| Task AKW31/32/90 ưu tiên | 01/11/2025 | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-TaskPriority-AKW31-32-90]] |
| Lỗi kỹ thuật tháng 11-12 | 11-12/2025 | [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-TechnicalIssues-NovDec]] |

---

## Build Log (source BITEX_v8.12.48.01.09)

> Quy tắc đặt tên build: → [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-BuildLog-Convention]]

| Ngày | Build Main | Build MyApp |
|------|-----------|-------------|
| 25/08 | `.09.zip` | `my-app-..._250820251612.zip` |
| 27/08 | `.09.01.zip` | — |
| 28/08 | `.09.05.zip` | — |
| 29/08 | `.09.06.zip` | — |
| 03/09 | `.09.07.zip` | — |
| 03/09 | `.09.08.zip` | — |
| 05/09 | `.09.10.zip` | `my-app-..._050920250848.zip` |
| 11/09 | `.09.11.zip` | — |

---

## Liên kết dự án

- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/0.Index -7425]] — Index dự án
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/3. Timeline-7425]] — Timeline
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/5. Resources-7425]] — Nguồn lực
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/6. Risks-7425]] — Rủi ro
- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Chi-Huy-Thi-Cong]] — Chat nhóm Chi huy thi công

