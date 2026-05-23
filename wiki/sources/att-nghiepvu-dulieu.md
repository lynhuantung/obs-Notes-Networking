---
type: source
code: atn03
domain: att
description: "6 nhóm dữ liệu cần để tính công: chế độ công, ca làm việc, quá trình công tác, ngày nghỉ, OT, tổng hợp."
tags:
  - att
  - tinh-cong
  - du-lieu
  - ca-lam-viec
  - ot
created: 2026-05-10
updated: 2026-05-10
source-file: raw/Nghiệp vụ HRM/ATT/ATT-DuLieuTinhCong.md
related:
  - "[[wiki/concepts/ATT-ChamCong]]"
  - "[[wiki/sources/att-nghiepvu-tinhcong]]"
---

# Source: ATT – Dữ liệu cần để tính công

## Tóm tắt

Tài liệu liệt kê 6 nhóm dữ liệu đầu vào cần thiết để thực hiện tính công chính xác trong HRM. Mỗi nhóm ảnh hưởng khác nhau đến kết quả bảng công, lương và bảo hiểm.

## Key Takeaways

- **Chế độ công (GradeCfg)**: quy tắc tính công áp dụng cho NV/nhóm NV — quyết định cách tính OT, nghỉ phép, đi trễ/về sớm. Có 4 loại: HC, ca kíp, sản xuất, linh hoạt
- **Ca làm việc**: khung giờ vào/ra (HC 08:00–17:00, Ca1 06:00–14:00, Ca2 14:00–22:00) — dùng để so sánh với giờ chấm công thực tế
- **Quá trình công tác**: điều chuyển phòng ban, thay đổi chức vụ, nghỉ việc/tạm hoãn → ảnh hưởng kỳ công áp dụng
- **Ngày nghỉ**: phân biệt hưởng lương/tính công/đóng BH khác nhau theo loại nghỉ
- **OT**: cần số giờ, hệ số áp dụng, phê duyệt OT — 150%/200%/300% theo loại ngày
- **Tổng hợp công**: kết hợp máy chấm công + lịch làm + nghỉ phép + OT + điều chỉnh → sinh bảng công + dữ liệu lương

## Trích dẫn quan trọng

> Chế độ công quyết định: cách tính ngày công, quy định đi trễ/về sớm, cách tính OT, quy tắc nghỉ phép.

> Thông tin quá trình công tác ảnh hưởng đến: quy tắc tính công, kỳ công áp dụng, chính sách lương và phụ cấp.

## Liên kết

- [[wiki/concepts/ATT-ChamCong]]
- [[wiki/sources/att-nghiepvu-tinhcong]]
- [[wiki/sources/att-db-catgradecfg]]
