---
description: "Chuẩn kỹ thuật tích hợp PTSC: REST/OpenAPI, luồng 2 chiều ESB, CDC Watermark/Version, stable primary key, metadata ERD và inbound SaaS."
type: source
code: r9m6
tags:
  - "ptsc"
  - "tich-hop"
  - "cdc"
  - "esb"
  - "data-platform"
domain: system
created: 2026-04-30
updated: 2026-04-30
source-file: raw/0. Daily/TaiLieuGiaiPhap/s3-*, s3a-*, s3b-*, s3c-*, s3d-*, s3e-*, s3e1-*, s3e2-*, s3e3-*, s3f-*, s3h-*, s3h2-*, s3h3-*, s3h6-*
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/PTSC-TLG-PhamVi]]"
  - "[[wiki/sources/PTSC-TLG-BaoMat-IAM]]"
---

# Source: PTSC TaiLieuGiaiPhap — §3 Kỹ Thuật Tích Hợp (Core)

## Tóm tắt

Phần §3 Core của tài liệu giải pháp PTSC mô tả các chuẩn kỹ thuật tích hợp HRM↔ESB↔Data Platform. Bao gồm: chuẩn REST/OpenAPI, ISO8601, luồng dữ liệu 2 chiều, CDC/Incremental extraction (Watermark + Version-based), ổn định khóa chính, metadata/ERD, và cam kết SaaS inbound. Đây là tài liệu kỹ thuật nền tảng cho toàn bộ tích hợp PTSC.

## Key Takeaways

- **Chuẩn giao tiếp:** REST/HTTPS, định dạng JSON/XML/CSV, ngày giờ ISO8601, encoding UTF-8
- **Luồng 2 chiều (Bi-directional):** HRM → ESB → Data Platform (push) và ESB → HRM (pull/webhook)
- **CDC 3 phương án:** (1) Watermark/Timestamp (`Last_Updated_Date`), (2) Version-based, (3) Change Log từ DB (Trigger/Transaction Log)
- **Incremental API:** hỗ trợ `updated_since=` + `from/to` + **backfill/replay** theo Time Window cho Late Arriving Data
- **Delta extraction:** hỗ trợ đầy đủ Insert/Update/Delete theo Watermark — không bỏ sót soft-delete
- **Stable Primary Key:** khóa chính bền vững, không thay đổi sau khi phát sinh — bắt buộc cho mapping Crosswalk
- **Inbound SaaS Commitment:** dữ liệu vào HRM qua API chuẩn, không can thiệp DB trực tiếp
- **Safe Update:** cơ chế cập nhật an toàn — validate trước khi apply, không ghi đè trạng thái cao hơn
- **Data Governance:** ERD logic, Data Dictionary, API Schema — metadata catalog đi kèm mỗi dataset

## Trích dẫn quan trọng

> Phần mềm (Vnresource) hỗ trợ cơ chế **truy xuất dữ liệu gia tăng (Incremental Data Extraction)** dựa trên các trường thời gian như **Created Date** và **Last Updated Date**.

> Phần mềm Vnresource cam kết cho phép trích xuất dữ liệu gia tăng (delta) bao gồm đầy đủ các thao tác **Insert, Update, Delete** theo mốc thời gian (Watermark/Timestamp) hoặc theo phiên bản (Version).

> Phần mềm cung cấp API tích hợp hỗ trợ truy xuất dữ liệu theo tham số **from/to** hoặc **updated_since**, giúp hệ thống tích hợp bên ngoài chủ động thực hiện đồng bộ lại dữ liệu bị thiếu.

## Liên kết

- [[wiki/sources/PTSC-TLG-PhamVi]] — §1–2 phạm vi và tài liệu
- [[wiki/sources/PTSC-TLG-BaoMat-IAM]] — §3 bảo mật OAuth2/IAM
- [[wiki/sources/PTSC-TLG-Idempotent-Operations]] — §3 idempotent, retry, kiểm thử
- [[wiki/sources/SaaS-VnR-Meetings-Detail-2023]] — nền tảng SaaS liên quan
