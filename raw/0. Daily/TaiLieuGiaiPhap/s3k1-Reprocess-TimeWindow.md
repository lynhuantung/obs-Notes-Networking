---
tags: [tailieu-giaiphap, reprocess, time-window, backfill]
date: 2026-04-30
section: "§3.9.3a Reprocess Time Window"
---

← [[s3k-MoiTruong-KiemThu-TichHop]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3k2-Redrive-Batch-Job]]

## 1) Reprocess theo khoảng thời gian (Time Window) ⏱️

- Cho phép thực hiện backfill/replay dữ liệu trong một khoảng thời gian xác định (from/to hoặc updated_since).

- Áp dụng cho các tình huống: dữ liệu đến muộn (late arriving), gián đoạn đường truyền, lỗi tạm thời ở hệ thống đích.

Nguyên tắc đảm bảo an toàn dữ liệu:

- Dữ liệu tái đồng bộ được lọc theo watermark/timestamp (Created Date, Last Updated Date, Deleted Date nếu có).

- Có đối soát số lượng bản ghi và ghi nhận nhật ký tái xử lý.