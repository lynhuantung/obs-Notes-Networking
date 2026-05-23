---
tags: [tailieu-giaiphap, retry, backoff, dlq]
date: 2026-04-30
section: "§3.8.4a Retry Backoff"
---

← [[s3j-API-Idempotent-CorrelationId]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3j2-Idempotent-Deduplicate]]

## 1) Cơ chế Retry có kiểm soát (Backoff) và giới hạn thử lại 🔁

Cơ chế retry được thiết kế theo nguyên tắc:

- Exponential backoff (tăng dần thời gian chờ): ví dụ 1s → 2s → 5s → 10s → 30s.

- Có giới hạn số lần retry (ví dụ tối đa 5 lần) và timeout tổng theo chính sách vận hành.

- Có jitter (ngẫu nhiên nhỏ) để tránh "thác lũ retry" khi lỗi diện rộng.

- Khi vượt ngưỡng retry, giao dịch được đưa vào hàng đợi lỗi (DLQ/Error Queue) để xử lý thủ công hoặc reprocess có kiểm soát.

- Toàn bộ retry được ghi nhận audit log, kèm correlationId/traceId để truy vết end-to-end.