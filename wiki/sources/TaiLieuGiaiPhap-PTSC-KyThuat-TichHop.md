---
description: "Cam kết kỹ thuật tích hợp đầy đủ PTSC: API chuẩn, ESB 2 chiều, CDC, IAM, idempotent, kiểm thử sandbox, data quality và schema versioning."
type: source
code: m3n9
tags:
  - "ptsc"
  - "integration"
  - "esb"
  - "cdc"
  - "api"
  - "idempotent"
domain: system
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/TaiLieuGiaiPhap-PTSC-PhamVi-TichHop]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# TaiLieuGiaiPhap PTSC — §3: Kỹ Thuật Tích Hợp (ESB, CDC, IAM, Idempotent, Reprocess)

> Covers: `s3-Chuan-GiaoTiep-DataPlatform-ESB`, `s3.1`, `s3.3`, `s3a–s3o` (30 files)  
> §3.1 Chuẩn giao tiếp | §3.2 Luồng 2 chiều | §3.3 CDC | §3.4 Stable PK | §3.5 IAM | §3.6 Metadata | §3.7–3.8 Hiệu năng & Idempotent | §3.9 Kiểm thử | §3.10 Cam kết mở | §3.11 Data Quality | §3.12 Vận hành | §3.13 Schema Change

## Tóm tắt

Phần §3 của tài liệu giải pháp PTSC mô tả toàn bộ yêu cầu kỹ thuật tích hợp mà VnResource HRM cam kết đáp ứng. Bao gồm chuẩn API/ESB, cơ chế CDC delta extraction, bảo mật IAM/OAuth2/mTLS, thiết kế idempotent với correlationId, môi trường kiểm thử sandbox/UAT, cơ chế reprocess/redrive, giám sát vận hành, và quản lý versioning/deprecation. Đây là cam kết kỹ thuật chi tiết nhất trong bộ tài liệu đấu  PTSC.

## Key Takeaways

### §3.1 Chuẩn giao tiếp API
- **RESTful API + OpenAPI 3.x (Swagger)**: JSON, OAuth2/API Key/JWT; đầy đủ endpoint/schema/error codes
- **Bulk Export / API Export**: thay JDBC/ODBC; hỗ trợ async export cho dữ liệu lớn; CSV, JSON (mở rộng Parquet/Avro)
- **ISO 8601 timezone**: lưu UTC, hiển thị local; áp dụng xuyên suốt API và file export
- **Pagination + filter thời gian**: limit/offset hoặc cursor; `updated_since`, `from/to`; rate limit và max page size rõ ràng

### §3.2 Luồng dữ liệu 2 chiều ESB
- **Luồng ra** (HRM → Data Platform): phát sinh sự kiện, đồng bộ CDC, Master Data, giao dịch
- **Luồng vào** (Data Platform → HRM): Master Data, danh mục chuẩn hóa, khuyến nghị phân tích
- **Inbound Channels**: REST API qua ESB/API Gateway + Messaging (Kafka/RabbitMQ)
- **Inbound API tối thiểu**: `/masterdata/organizations:upsert`, `/masterdata/positions:upsert`, `/masterdata/employees:upsert`, `/recommendations:import`
- **SaaS cam kết**: hỗ trợ inbound channels; xác thực OAuth2.0/mTLS; idempotent + chống trùng; Upsert theo unique identifier

### §3.3 CDC — Incremental Data Extraction
- **Watermark/Timestamp**: Insert (Created Date), Update (Last Updated Date > watermark), Delete (Soft Delete + cờ xóa)
- API: `GET /api/v1/delta?from={last_watermark}&to={now}&types=insert,update,delete`
- **Version-based CDC**: log thay đổi với Version monotonic + Change Type (INSERT/UPDATE/DELETE)
- API: `GET /api/v1/changelog?since_version={last_version}&entity={entity_name}`
- **Backfill/Replay**: hỗ trợ tái đồng bộ theo `from/to` hoặc `updated_since`
- **Đảm bảo chất lượng**: idempotent/deduplicate qua `change_log_id`/`correlation_id`; ordering theo Version; Retry & Error handling theo ESB policy

### §3.4 Stable Primary Key
- System ID (khóa kỹ thuật, ổn định vòng đời) vs Business Code (mã nghiệp vụ vận hành)
- Unique Identifier cho: tổ chức, nhân sự, hợp đồng, quy trình, khóa học
- Mapping ID nội bộ ↔ Master Data qua ESB/MDM

### §3.5 Bảo mật IAM
- **OAuth2.0 + OpenID Connect + mTLS** cho API tích hợp
- **IAM/SSO tương thích**: MS AD, Entra ID, Keycloak, ADFS, LDAP — qua OAuth2.0/OIDC/SAML2.0; mô hình IdP-SP
- **Scope/Role per client**: cấu hình riêng cho ETL, ESB, Data Platform; theo môi trường DEV/UAT/PROD

### §3.6 Metadata & Mô hình dữ liệu
- **On-premise**: ERD Logic/Physical + Data Dictionary (tên bảng, cột, kiểu, FK, ràng buộc)
- **SaaS**: Logical Schema + Data Dictionary + API Schema chuẩn hóa tương đương physical schema
- API Schema mẫu Employee: `employee_id` (UUID PK ổn định), `employee_code` (mã nghiệp vụ), `updated_at` (watermark), `is_deleted` (soft delete), `deleted_at`
- **Data Governance**: mapping trường màn hình ↔ báo cáo ↔ CSDL/API; cập nhật theo version; phục vụ Data Catalog

### §3.7–3.8 Hiệu năng & Idempotent
- **Hiệu năng**: SLA tích hợp rõ ràng; async processing cho bulk; rate limit và circuit breaker
- **Idempotent API**: gửi lại nhiều lần cùng request ID không gây trùng dữ liệu
- **CorrelationId/TraceId**: theo dõi end-to-end qua ESB, Data Platform, HRM; ghi vào log
- **Upsert semantics**: insert nếu chưa có, update nếu đã tồn tại; conflict resolution theo `updated_at` hoặc `version`
- **Retry có kiểm soát**: backoff (linear/exponential); phân loại mã lỗi retry/không retry; DLQ; không tạo trùng

### §3.9 Kiểm thử & Triển khai
- **Sandbox/UAT tenant**: API đầy đủ, cấu hình tương đương production; hỗ trợ kiểm thử OAuth2, mapping dữ liệu, hiệu năng
- **Test data + test cases chuẩn**: VnResource cung cấp trong quá trình dự án
- **Reprocess/Re-drive**: theo time window, theo batch/job, theo correlationId; không trùng dữ liệu

### §3.10 Cam kết mở — không khóa chặt tích hợp
- Không độc quyền connector; hỗ trợ chuẩn open (REST, Kafka, SFTP...)
- Tài liệu đầy đủ cho Data Platform tự vận hành sau go-live

### §3.11 Data Quality
- **Bộ quy tắc tối thiểu**: Null Check, Format Validation, Uniqueness (0% trùng khóa), FK Integrity, Code List validation
- **Ngưỡng chấp nhận**: 0% null trường định danh; < 0.1% sai format; 0% vi phạm FK bắt buộc
- **Quarantine/Holding**: tách bản ghi lỗi không làm gián đoạn luồng chính; danh sách lỗi để reprocess; retry không trùng; trạng thái (pending/fixed/reprocessed/failed)

### §3.12 Vận hành tích hợp
- **Monitoring metrics**: Transaction Volume, Error Rate, Retry Count, Lag/Latency — theo thời gian thực
- **Alerting**: ngưỡng cấu hình được; email, dashboard, webhook
- **Runbook**: hướng dẫn retry, reprocess, truy vết theo correlationId; đội kỹ thuật PTSC tự vận hành

### §3.13 Quản lý Schema/Interface Change
- **Versioning**: tất cả API/interface có version (v1, v2...); ghi trong endpoint, header, metadata
- **Backward compatible**: thay đổi không phá cấu trúc → patch cùng version; thay đổi breaking → version mới + song song trong thời gian chuyển tiếp
- **Deprecation policy**: changelog đầy đủ; thông báo trước thời gian tối thiểu do PTSC quy định; migration guide; sandbox để PTSC test trước khi chuyển đổi

## Trích dẫn quan trọng

> Phần mềm HRM (VnResource) cam kết các API và message inbound hỗ trợ **correlationId / traceId** để theo dõi giao dịch end-to-end giữa ESB, Data Platform và Phần mềm; đồng thời ghi nhận các mã này trong log xử lý nhằm phục vụ giám sát, đối soát và truy vết lỗi.

> Phần mềm (Vnresource) hỗ trợ cơ chế **truy xuất dữ liệu gia tăng (Incremental Data Extraction)** dựa trên các trường thời gian như Created Date và Last Updated Date, cho phép xác định các bản ghi phát sinh mới hoặc thay đổi trong từng khoảng thời gian phục vụ đồng bộ dữ liệu.

> Mọi interface/API và file schema được thiết kế và triển khai theo nguyên tắc có định danh phiên bản rõ ràng... VnResource cam kết ưu tiên nguyên tắc **tương thích ngược (backward compatibility)**.

> Hệ thống hỗ trợ tối thiểu các chỉ số: Số lượng giao dịch, Tỷ lệ lỗi, Số lần retry, Độ trễ đồng bộ (Lag/Latency).

## Liên kết

- [[wiki/projects/PTSC-Project]]
- [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhamVi-TichHop]] — §1–2 phạm vi và tài liệu thiết kế
- [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhiChucNang-KienTruc]] — §4 phi chức năng
- [[wiki/concepts/HRM-Modules]]
