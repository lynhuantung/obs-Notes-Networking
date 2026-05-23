---
description: "Yêu cầu idempotent API, CorrelationId/TraceId, retry 3 loại lỗi, 4 cơ chế reprocess, kiểm thử sandbox, data quality và schema versioning cho PTSC."
type: source
code: n2d7
tags:
  - "ptsc"
  - "tich-hop"
  - "idempotent"
  - "retry"
  - "correlation-id"
domain: system
created: 2026-04-30
updated: 2026-04-30
source-file: raw/0. Daily/TaiLieuGiaiPhap/s3i-*, s3j-*, s3j1-*, s3j2-*, s3j3-*, s3k-*, s3k1-*, s3k2-*, s3k3-*, s3k4-*, s3l-*, s3m-*, s3n-*, s3o-*
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]]"
---

# Source: PTSC TaiLieuGiaiPhap — §3 Idempotent, Retry, Kiểm Thử & Vận Hành Tích Hợp

## Tóm tắt

Phần §3.7–3.x của tài liệu giải pháp PTSC quy định: (1) hiệu năng kênh tích hợp, (2) thiết kế idempotent API với CorrelationId/TraceId, (3) retry có kiểm soát (backoff + phân loại lỗi), (4) môi trường kiểm thử và reprocess, (5) cam kết open integration, (6) chất lượng dữ liệu/đối soát, (7) yêu cầu vận hành và quản lý thay đổi schema.

## Key Takeaways

- **Idempotent API:** gửi lại cùng request ID không gây trùng dữ liệu — kiểm soát qua unique identifier + trạng thái giao dịch
- **CorrelationId / TraceId:** bắt buộc trên tất cả API inbound — theo dõi end-to-end qua HRM↔ESB↔Data Platform, ghi vào log
- **Upsert semantics:** insert nếu chưa có, update nếu đã tồn tại — conflict resolution theo `updated_at` hoặc `version`
- **Retry 3 loại lỗi:** (1) Retryable kỹ thuật (timeout, 5xx, network) — linear/exponential backoff; (2) Non-retryable (4xx business error); (3) Dead Letter Queue khi vượt threshold
- **Reprocess 4 cơ chế:** Time Window, Redrive by Batch Job, Redrive by CorrelationId, Kiểm soát tái xử lý
- **Schema change management:** versioning API, backward-compatible changes, deprecation notice, migration path
- **Data quality:** reconciliation report giữa HRM và Data Platform — SLA đối soát dữ liệu

## Trích dẫn quan trọng

> Nhà cung cấp cam kết các **API và message inbound** hỗ trợ **correlationId / traceId** để theo dõi giao dịch end-to-end giữa ESB, Data Platform và Phần mềm.

> Phần mềm hỗ trợ cơ chế **upsert semantics**: insert khi bản ghi chưa tồn tại và update khi đã tồn tại, conflict resolution theo `updated_at` hoặc `version`.

> Retry áp dụng cho lỗi kỹ thuật có khả năng phục hồi. Quy định số lần retry, backoff (linear/exponential), ngưỡng timeout. Cơ chế chống gửi trùng: **idempotency key, message deduplication, kiểm soát version**.

## Liên kết

- [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] — §3 CDC, luồng dữ liệu
- [[wiki/sources/PTSC-TLG-BaoMat-IAM]] — §3 OAuth2, IAM
- [[wiki/sources/PTSC-TLG-KienTruc-NenTang]] — §4 kiến trúc hệ thống
