---
type: wiki-entity
tags:
  - bitex
  - akw
  - retail
created: 2026-05-14
updated: 2026-05-14
description: "Bitex + AKW — 2 hợp đồng 1 hệ thống HRM, golive 01/12/2025, đang hậu go-live hỗ trợ vận hành."
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/sources/Bitex-Project-Overview]]"
---

# Bitex (AKW)

> **Loại**: khach-hang
> **Lĩnh vực**: Bán lẻ / Phân phối

---

## Thông tin chung

| Thông tin | Chi tiết |
|-----------|---------|
| Tên đầy đủ | Bitex + AKW (2 công ty, 1 hệ thống HRM) |
| Mã dự án | AKW |
| Lĩnh vực | Bán lẻ / Phân phối |
| Trạng thái | Post-golive — hỗ trợ vận hành |
| Golive | 01/12/2025 |

---

## Dự án liên quan

- [[wiki/projects/Bitex-Project]] — Chi tiết triển khai: 5 giai đoạn, 9 rủi ro, bài học kinh nghiệm

---

## Đặc điểm triển khai

- **2 hợp đồng — 1 hệ thống**: Bitex và AKW ký riêng, dùng chung 1 project AMIS
- **Phân hệ**: HRE, ATT, TRA, UNI, Portal, APP
- **Tích hợp**: API real-time (HRM gọi API phía KH lấy dữ liệu)
- **Nền tảng**: .NET Core (chuyển từ .NET Framework trước khi cài đặt)
- **Branch**: `HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09`

---

## Trạng thái hậu go-live (05/2026)

- SE Lead: Nguyễn Thị Kim Hồng (từ 11/2025)
- PE hỗ trợ: Phan Thị Ngọc Tuyền (Tuyết Anh) — 81/99 tasks (82%)
- Còn lại: 8 cấu hình báo cáo + 7 store/Word

---

## Ghi chú

- Lỗi gửi mail hệ thống (R5) vẫn tồn đọng từ 27/01/2026
- Incident GPS/WiFi chấm công mobile đã fix 05/05/2026

---

## Liên kết

- [[wiki/projects/Bitex-Project]] — Project page đầy đủ
- [[wiki/sources/Bitex-Project-Overview]] — Overview goals/scope/timeline
- [[wiki/sources/2026-05-04-log-review-bitex]] — Log Review incident
- [[wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading]] — GPS/WiFi incident
