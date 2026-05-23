---
tags: [tailieu-giaiphap, reprocess, batch, re-drive]
date: 2026-04-30
section: "§3.9.3b Re-drive Batch"
---

← [[s3k1-Reprocess-TimeWindow]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3k3-Redrive-CorrelationId]]

## 2) Re-drive theo Batch / Job đồng bộ 🗂️

- Hỗ trợ chạy lại job đồng bộ theo lô: theo ngày, theo entity (nhân sự, tổ chức, hồ sơ...), theo kịch bản tích hợp.

- Cho phép cấu hình:

  - phạm vi dữ liệu,

  - tần suất chạy,

  - giới hạn tải (throttling) để tránh ảnh hưởng hệ thống vận hành.

Kết quả: phù hợp xử lý sự cố diện rộng, cần khôi phục dữ liệu theo lô có kiểm soát.