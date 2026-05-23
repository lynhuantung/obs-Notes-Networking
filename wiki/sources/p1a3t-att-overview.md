---
type: source
code: p1a3t
description: "Tổng quan phân hệ chấm công ATT: mục đích, từ viết tắt, 7 chủ đề con — gateway vào toàn bộ tài liệu ATT"
domain: att
tags:
  - att
  - nghiep-vu
  - overview
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/architecture/ATT-Database-Schema]]"
  - "[[wiki/flows/Flow-TinhCong-ATT]]"
  - "[[wiki/sources/NghiepVu-ATT-SAL]]"
---

# Source: ATT – Tổng quan phân hệ chấm công

## Tóm tắt

Tài liệu tổng quan phân hệ ATT (Attendance – Chấm công) trong HRM Pro 8, chuẩn bị bởi nhóm nội bộ VnResource tháng 5/2026. Là gateway index trỏ sang 7 chủ đề con: quy trình tính công, dữ liệu tính công, công cộng/trừ, luật ngày công, luật tăng ca, luật ngày nghỉ, DB schema. Không có nội dung nghiệp vụ trực tiếp — chỉ là bản đồ điều hướng.

## Key Takeaways

- ATT là phân hệ "nhiều rule nhất hệ thống" vì phải xử lý đủ loại tình huống thực tế
- Cấu trúc tài liệu gồm 7 node chính: TinhCong, DuLieuTinhCong, CongCongCongTru, LuatNgayCong, LuatTangCa, LuatNgayNghi, DB-Overview
- Hai từ viết tắt quan trọng: HRM Pro (giải pháp phần mềm VnResource), ATT (Attendance)

## Trích dẫn quan trọng

> Module tính công thường là nơi "nhiều rule nhất hệ thống", vì phải xử lý đủ loại tình huống: ca đêm, OT chồng giờ, nghỉ giữa kỳ, thai sản, nghỉ việc giữa tháng...

## Liên kết

- [[wiki/concepts/HRM-Modules]] — ATT là 1 trong 6 phân hệ chính
- [[wiki/architecture/ATT-Database-Schema]] — schema 5 bảng DB chấm công
- [[wiki/flows/Flow-TinhCong-ATT]] — luồng 8 bước tính công
- [[wiki/sources/NghiepVu-ATT-SAL]] — nguồn cũ ATT01–05 nghiệp vụ chấm công
