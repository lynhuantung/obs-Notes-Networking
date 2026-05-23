---
type: source
code: h2j7q
description: "Cấu hình ATT Sys_AttendanceConfig 7 tab: tính công, kết nối DB máy chấm công, OT (giới hạn/hệ số/phê duyệt), nghỉ phép, giới hạn OT, công tác, kiểm soát — 200+ keys Sys_AllSetting"
domain: att
tags:
  - att
  - config
  - sys-setting
  - nghiep-vu
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/sources/p1a3t-att-overview]]"
  - "[[wiki/sources/w3t6p-att-luat-tang-ca]]"
  - "[[wiki/sources/n5c1k-att-luat-ngay-nghi]]"
  - "[[wiki/sources/f3g6r-att-db-catgradecfg]]"
---

# Source: ATT – Thiết lập chấm công (Sys_AttendanceConfig)

## Tóm tắt

Tài liệu toàn diện về màn hình cấu hình chấm công `Sys_AttendanceConfig/Create` trong HRM Pro 8, viết tháng 5/2026 từ source code C#. Liệt kê 200+ key trong bảng `Sys_AllSetting` được nhóm theo 7 tab giao diện. Là tài liệu kỹ thuật quan trọng nhất để debug cấu hình ATT — mọi behavior bất thường của tính công đều trace về các key này.

## Key Takeaways

- **Tất cả setting lưu vào `Sys_AllSetting`** (Name = key, Value1 = giá trị), không lưu DB riêng
- **API lưu**: `POST api/Att_OvertimePermitConfig/` — service `Sys_AttOvertimePermitConfigServices`
- **Tab 1 — Tính công**: nhận diện ca tự động (`HRM_ATT_WORKDAY_SUMMARY_DETECTSHIFT=True`), xử lý MissTAM, kỳ công, GPS/Mobile, Roster
- **Tab 3 — OT**: giờ đêm 22:00–06:00 (`HRM_ATT_OT_NIGHTSHIFTFROM/TO`), giới hạn OT tối thiểu 0.5h, làm tròn 0.5h
- **Tab 4 — Nghỉ phép**: tháng reset phép `HRM_ATT_ANNUALDETAIL_MONTHRESET=3`, phương thức phép `E_PROGRESS`
- **Tab 5 — Giới hạn OT**: giới hạn ngày/tuần/tháng/năm (12h/40h/40h/200h), 3 mức cảnh báo màu
- **Công thức tổng công**: `[PaidLeaveDay]+[PaidWorkDayCount]` — key `HRM_ATT_WORKDAY_SUMMARY_FORMULATOTALATTCOMPUTEPAYROLL`
- **GPS**: E_SHOPGPS, cho phép tọa độ và MAC, trạng thái E_APPROVED khi chấm GPS thành công

## Trích dẫn quan trọng

> Key trong `Sys_AllSetting.Name` — **phân biệt hoa thường** khi query

> Một số key bị duplicate row (nhiều UserID khác nhau) — system lấy row theo UserID hoặc row đầu tiên

> Giá trị Enum thường có prefix `E_` (ví dụ `E_APPROVED`, `E_SUBMIT`, `E_BLOCK_OUT`)

> Key `_(null)_` = chưa được thiết lập (dùng giá trị default trong code)

## Liên kết

- [[wiki/sources/w3t6p-att-luat-tang-ca]] — luật OT là basis cho Tab 5 giới hạn (200h/năm)
- [[wiki/sources/n5c1k-att-luat-ngay-nghi]] — luật nghỉ phép là basis cho Tab 4
- [[wiki/sources/f3g6r-att-db-catgradecfg]] — Cat_GradeCfg cấu hình theo chế độ, Sys_AttendanceConfig cấu hình toàn hệ thống
- [[wiki/sources/2026-05-05-loading-cham-cong-gps-wifi-dong-thoi]] — bug GPS/WiFi liên quan đến cấu hình GPS trong Tab 1
