---
type: note
tags:
  - bitex
  - build
  - convention
  - TCDA
date-updated: 2025-08-23
Project: "[[Dự án Bitex]]"
related:
  - "[[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]]"
---

# Note: Quy ước Build & Pull Request — Bitex AKW

> Nguồn: [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]]  
> Thiết lập: 23/08/2025 bởi Lý Nhuận Tùng (SE Lead)

---

## Source Code Branch

```
HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09
```

- Tách source từ 23/08/2025
- Thương bắt đầu xử lý task từ thứ 2 (25/08/2025)

---

## Quy tắc Pull Request

> Link tài liệu quy tắc PR:  
> https://amisapp.misa.vn/Notes/29873/438653?appCode=Document&companyCode=1O4AZTLN

**Yêu cầu:**
- Đặt tiêu đề PR đúng quy tắc → SE Lead mới duyệt
- Áp dụng cho tất cả SE tham gia dự án

---

## Quy ước đặt tên Build

**Format Main:**
```
/HRM8_SQL/Pass/BITEX_v8.12.48.01.09.XX.zip
```
(XX = số thứ tự build, VD: 01, 05, 06...)

**Format MyApp:**
```
/HRM8_SQL/PASS/BUILD_PortalNew/BITEX_8.12.48.01/my-app-BITEX_v8.12.48.01.XX_DDMMYYYYYYYY.zip
```

---

## Quy trình gửi Build

1. SE xong task → **build cuối giờ** hoặc khi task hoàn thành
2. Gửi path build vào nhóm chat
3. PE/QC nhận build → **up lên môi trường test**
4. Ưu tiên: **fix bug trước**, sau đó mới move code / modify

---

## Build Log

> Xem tổng hợp tại: [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong#Build-Log]]

---

## Liên kết

- [[raw/archive/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]] ← Nguồn

