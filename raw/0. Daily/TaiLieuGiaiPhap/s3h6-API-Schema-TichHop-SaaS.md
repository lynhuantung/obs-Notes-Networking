---
tags: [tailieu-giaiphap, metadata, api-schema, saas]
date: 2026-04-30
section: "§3.6.4c API Schema"
---

← [[s3h-QuanLy-Metadata-MoHinhDuLieu]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]

## 3. API Schema phục vụ tích hợp (thay thế Physical Schema với SaaS) 🔌

[Trong trường hợp không cung cấp physical schema, nhà  cung cấp API Schema chuẩn hóa tương đương:]{.mark}

// GET /api/v1/employees/{employee_id}

// Response Schema:

{

\"employee_id\": \"uuid\", // PK - ổn định

\"employee_code\": \"string\", // Mã nghiệp vụ

\"full_name\": \"string\",

\"gender\": \"MALE\|FEMALE\|OTHER\",

\"date_of_birth\": \"YYYY-MM-DD\",

\"org_id\": \"uuid\", // FK → Organization

\"position_id\": \"uuid\", // FK → Position

\"status\": \"ACTIVE\|INACTIVE\|RESIGNED\",

\"created_at\": \"ISO8601\",

\"updated_at\": \"ISO8601\", // Watermark field

\"is_deleted\": \"boolean\",

\"deleted_at\": \"ISO8601\|null\"

}

Sao chép