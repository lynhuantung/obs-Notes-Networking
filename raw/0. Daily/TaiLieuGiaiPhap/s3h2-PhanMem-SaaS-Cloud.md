---
tags: [tailieu-giaiphap, metadata, saas, api-schema]
date: 2026-04-30
section: "§3.6.1b SaaS model"
---

← [[s3h-QuanLy-Metadata-MoHinhDuLieu]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3h3-QuanTri-KienTruc-DuLieu]]

## 2. Phần mềm SaaS/Cloud ☁️

Trong trường hợp không cung cấp physical schema, nhà  cam kết cung cấp tương đương:

### 2.1. Logical Schema + Data Dictionary

- Mô tả đầy đủ các đối tượng dữ liệu logic (entities, attributes, relationships) trong phạm vi tích hợp.

- Cung cấp Data Dictionary gồm: tên trường, ý nghĩa, kiểu dữ liệu, nullability, code list, trường phục vụ delta/CDC.

### 2.2. API Schema / Mapping Spec

Cung cấp API Schema chuẩn hóa tương đương physical schema, phục vụ data catalog và integration:

> // Ví dụ: GET /api/v1/employees/{employee_id}
>
> {
>
> \"employee_id\": \"uuid\", // PK -- ổn định
>
> \"employee_code\": \"string\", // Mã nghiệp vụ
>
> \"full_name\": \"string\",
>
> \"status\": \"ACTIVE\|INACTIVE\|RESIGNED\",
>
> \"org_id\": \"uuid\", // FK → Organization
>
> \"created_at\": \"ISO8601\", // Phục vụ Insert delta
>
> \"updated_at\": \"ISO8601\", // Phục vụ Watermark/CDC
>
> \"is_deleted\": \"boolean\",
>
> \"deleted_at\": \"ISO8601 \| null\" // Phục vụ Delete delta
>
> }

Sao chép

### 2.3. Mapping Spec phục vụ Data Catalog/Integration