---
type: technical-issue
tags: [server, infrastructure, IIS, UAT, PRD]
date-updated: 2026-04-27
Project: "[[Dự án QuickPack]]"
related:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-chi-huy-thi-cong-quickpack]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-cài đặt]]"
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/Documents/Hướng dẫn cấu hình hệ thống HRM]]"
---

# Hạ tầng Server - QPVN

> Backlink: [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-chi-huy-thi-cong-quickpack|Chat chỉ huy thi công]]

---

## Cấu hình Server UAT

| Thông tin | Giá trị |
|-----------|---------|
| Loại | Server vật lý |
| Cài đặt | App + SQL chung trên cùng 1 server |
| URL UAT | https://site1.hrquickpack.vn:8002 |
| Kế hoạch PRD | Dựng server vật lý hiện tại → làm SQL Server, app server riêng |

**Câu hỏi tư vấn từ IT QPVN:** App server nên dựng VM hay vật lý?  
*(Chưa có câu trả lời được ghi lại)*

---

## Source Code / Tách Source

- **Ngày:** 11/07/2025
- PM Hạc yêu cầu tách source QPVN để dựng:
  - Link nội bộ VnR
  - Link test cho KH
- Xác nhận: tách source ITL (hoặc source khác – cần xác nhận)
- Tùng.Ly đang nghỉ phép → Hạc trao đổi với anh Hiển

---

## Sự cố kỹ thuật đã phát sinh

### 1. Lỗi API Mobile (10-11/09/2025)

```
API lỗi: https://site1.hrquickpack.vn:8002/Portal/GetConfigApp
```

**Nguyên nhân:** Thiếu file config mobile trong thư mục portal

**Files cần kiểm tra:**
```
/Apps/mobile/ConfigList.json + ConfigList_SPEC.json
/Apps/mobile/ConfigListFilter.json + ConfigListFilter_SPEC.json
/Apps/mobile/ConfigListDetail.json + ConfigListDetail_SPEC.json
/Apps/mobile/ConfigField.json + ConfigField_SPEC.json
/Apps/mobile/ConfigMappingSalary.json + ConfigMappingSalary_SPEC.json
/Apps/mobile/ConfigChart.json + ConfigChart_SPEC.json
```

**Xử lý:** Hạc xác nhận đủ file → BE check và fix

**Triệu chứng bổ sung:** Lỗi xoay xoay app chỉ xảy ra phía KH, không bị ở VnR  
→ Cần 1 SE kiểm tra và fix lỗi app phía mobile

---

### 2. Lỗi IIS Permissions (09/10/2025)

**Triệu chứng:** Ứng dụng không chạy được  
**Nguyên nhân:** Thiếu quyền `IIS_IUSRS`  
**Fix:** Phân lại quyền full cho IIS_IUSRS → chạy được

---

### 3. Redis Cache / IIS Pool (09/10/2025)

**Hành động:** Clear cache Redis + Restart application pool portal

**Thông tin đăng nhập Ultra (dùng để kiểm tra):**
- ID: `114812044`
- PW: `QuickPack@Vn`

---

## Checklist Server

- [x] Tách source QPVN (07/2025)
- [x] Dựng link UAT nội bộ
- [ ] Dựng link PRD
- [x] Kiểm tra file config mobile
- [x] Phân quyền IIS_IUSRS
