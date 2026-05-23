---
type: source
description: "Họn HVN 2024 về khóa đối tượng ký công: yêu cầu nghiệp vụ, màn hình HRM và các vấn đề liên quan."
tags:
  - hvn
  - sys
  - khoa-doi-tuong
  - ky-cong
  - meeting
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 1.Projects/HVN/H-HVN-SYS-060924.md
related:
  - "[[wiki/sources/MultiProject-SYS-Meetings-2024]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# Source: HVN SYS — Khóa Đối Tượng Theo Loại Kỳ Công (06/09/2024)

## Tóm tắt

Biên bản họp dự án HVN (Honda Vietnam) ngày 06/09/2024 về vấn đề khóa đối tượng khi một tháng có **2 kỳ công** (ví dụ: kỳ 1–15 và kỳ 16–31). Giải pháp cuối: NV → Nhóm NV → Loại kỳ công → lọc danh sách khóa đối tượng. Đây là case đặc thù chưa có trong MultiProject-SYS source.

## Key Takeaways

- **Vấn đề**: HVN tính lương 2 kỳ/tháng. Màn hình khóa đối tượng hiện chưa phân biệt kỳ công → khóa nhầm đối tượng hoặc không lọc đúng.
- **Giải pháp v1 (BA TiếnĐặng — 06/09)**: Thêm loại kỳ công vào **Nhóm nhân viên** (`Hre_Profile`) → khi kiểm tra khóa: NV → Nhóm NV → Loại kỳ công → lọc danh sách.
- **Giải pháp v2 (đổi 20/09)**: Khi load kỳ công trong màn hình khóa đối tượng → **load loại NV** tương ứng → lọc theo: NV → Loại NV → Loại kỳ công.
- **Áp dụng toàn module**: Hàm `saveChange` và hàm kiểm tra khóa đối tượng đều phải **truyền thêm tham số loại kỳ công**. Các module công, tăng ca, lương đều bị ảnh hưởng.
- **PIC**: Dung.Hoang xử lý màn hình khóa + nghiệp vụ công/lương; TiếnĐặng thêm loại kỳ công vào nhóm NV.
- **Pattern chung**: Bất kỳ tính năng nào có kỳ công → cần check xem khách hàng có dùng 1 kỳ hay 2 kỳ/tháng không.

## Trích dẫn quan trọng

> **Giải pháp v2 (chốt 20/09)**: "Trong màn hình khóa đối tượng, khi load kỳ công sẽ load loại NV. Khi kiểm tra khóa đối tượng sẽ dựa vào nhân viên → loại nhân viên → loại kỳ công → để lọc lại danh sách khóa đối tượng."

> **Scope ảnh hưởng**: "Công – Tăng ca: truyền thêm loại kỳ công xuống. Lương: [tương tự]."

## Liên kết

- [[wiki/sources/MultiProject-SYS-Meetings-2024]] — Taisun/FGL/HVN/Toyota/AMIS: khóa đối tượng, phân quyền tự động (phiên tổng hợp)
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ: ATT, SAL, SYS
