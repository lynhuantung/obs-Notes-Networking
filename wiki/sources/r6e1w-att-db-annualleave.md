---
type: source
code: r6e1w
description: "Schema Att_AnnualLeave: bảng tổng hợp phép năm theo nhân viên/năm — InitAnlValue, phép bệnh, phép chuyển từ năm trước, ngày hết hạn"
domain: att
tags:
  - att
  - database
  - schema
  - phep-nam
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/architecture/ATT-Database-Schema]]"
  - "[[wiki/sources/b5f9g-att-db-overview]]"
  - "[[wiki/sources/t4u8v-att-db-annualdetail]]"
  - "[[wiki/sources/n5c1k-att-luat-ngay-nghi]]"
---

# Source: ATT – DB Att_AnnualLeave (Phép năm)

## Tóm tắt

Schema bảng `Att_AnnualLeave` — lưu tổng hợp phép năm của từng nhân viên theo năm trong HRM Pro 8. Là nguồn dữ liệu gốc để tính số ngày phép còn lại, phân tích phép theo tháng qua Att_AnnualDetail. Quan hệ 1-N với AnnualDetail.

## Key Takeaways

- PK: ID (uniqueidentifier); FK: ProfileID → Hre_Profile
- Lưu phép theo năm: InitAnlValue (phép năm khởi tạo), InitSickValue (phép bệnh)
- Hỗ trợ chuyển phép năm trước: AnlValueLastYear, ExpireAnlValueLastYear, SurplusAnllastYear
- Có trường phép đặc biệt: InitMensesValue (kinh nguyệt), InitAdditionalValue (bổ sung)
- AnlMonthReset / MonthResetAnlOfBeforeYear: cấu hình tháng reset phép (liên kết `HRM_ATT_ANNUALDETAIL_MONTHRESET`)
- Quan hệ: Att_AnnualLeave (1) → (N) Att_AnnualDetail

## Trích dẫn quan trọng

> Bảng lưu tổng hợp phép năm của từng nhân viên theo năm. Là nguồn dữ liệu gốc để tính số ngày phép còn lại.

## Liên kết

- [[wiki/architecture/ATT-Database-Schema]] — diagram tổng thể
- [[wiki/sources/t4u8v-att-db-annualdetail]] — chi tiết phép từng tháng
