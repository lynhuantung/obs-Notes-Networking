---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, cdc, watermark]
date: 2026-04-30
section: "§3.3.1 Watermark CDC"
---

← [[s3e-CDC-TruyXuat-GiaTang]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3e2-CDC-Version-Based]]

## 1) Trích xuất delta theo mốc thời gian (Watermark/Timestamp-based CDC) ⏱️

Hệ thống cung cấp cơ chế trích xuất theo cửa sổ thời gian (Time Window) dựa trên các trường thời gian chuẩn (ví dụ: Created Date, Last Updated Date, và thông tin xóa mềm nếu áp dụng), cho phép hệ thống tích hợp lấy đúng các bản ghi phát sinh hoặc thay đổi kể từ lần đồng bộ gần nhất.

- Insert: xác định theo bản ghi có Created Date nằm trong khoảng đồng bộ.

- Update: xác định theo bản ghi có Last Updated Date lớn hơn Watermark gần nhất.

- Delete: hỗ trợ theo mô hình Soft Delete (cờ xóa và thời điểm xóa), đảm bảo downstream nhận biết bản ghi bị xóa để đồng bộ trạng thái.

Ví dụ tham số API (minh họa, có thể cấu hình theo thực tế tích hợp):

- GET /api/v1/delta?from={last_watermark}&to={now}&types=insert,update,delete

Sau khi đồng bộ thành công, hệ thống tích hợp lưu lại last_watermark để dùng cho lần chạy kế tiếp, đảm bảo cơ chế delta hoạt động liên tục và có kiểm soát.