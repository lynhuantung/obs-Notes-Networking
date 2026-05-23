---
tags: [tailieu-giaiphap, retry, idempotent, deduplicate]
date: 2026-04-30
section: "§3.8.4b Idempotent/Deduplicate"
---

← [[s3j1-Retry-Backoff-GioiHan]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3j3-PhanLoai-Loi-Retry]]

## 2) Cơ chế tránh trùng dữ liệu khi Retry (Idempotent/Deduplicate) 🛡️

Để đảm bảo "retry không gây ghi trùng", giải pháp áp dụng tối thiểu các biện pháp sau:

- Idempotency key / request_id cho từng request/API hoặc message.

- Unique constraint theo khóa định danh thống nhất (ví dụ: entity_id, document_id, work_order_id) kết hợp request_id.

- Bảng nhật ký xử lý tích hợp (integration log / inbox pattern) ghi nhận trạng thái:

  - RECEIVED → PROCESSING → DONE hoặc FAILED

- Với message queue/Kafka: dùng dedup theo message key + offset tracking, đảm bảo "đã xử lý rồi thì không xử lý lại".

Kết quả: dù ESB hoặc hệ thống nguồn gửi lại cùng giao dịch, Phần mềm vẫn không phát sinh bản ghi trùng và không thực thi nghiệp vụ lặp.