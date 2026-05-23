---
tags: [tailieu-giaiphap, reprocess, correlation-id, traceability]
date: 2026-04-30
section: "§3.9.3c Re-drive CorrelationID"
---

← [[s3k2-Redrive-Batch-Job]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3k4-KiemSoat-TaiXuLy]]

## 3) Re-drive theo Request ID / Correlation ID (truy vết end-to-end) 🔎

- Hỗ trợ tái xử lý theo mã giao dịch tích hợp như request_id / correlationId / traceId.

- Cho phép khoanh vùng chính xác một giao dịch hoặc một chuỗi giao dịch bị lỗi để re-drive, thay vì phải chạy lại toàn bộ dữ liệu.

Đi kèm bắt buộc:

- Ghi nhận integration log/audit log đầy đủ (thời điểm, payload metadata, trạng thái, số lần retry, kết quả).

- Hỗ trợ tra cứu và đối soát theo correlationId phục vụ vận hành, kiểm toán.