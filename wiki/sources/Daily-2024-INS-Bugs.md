---
type: source
description: "Tổng hợp bug INS năm 2024: hotfix C70 nghỉ việc ốm dài ngày và lỗi LDAP liên quan module bảo hiểm."
tags:
  - ins
  - bug-fix
  - bao-hiem
  - c70
  - 14-ngay
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-Jun-23/Hotfix C70 nghỉ việc ốm dài ngày.md, 0.Daily/2024-Aug-33/VDSC-Confluence-LDAP-Lỗi INS-FIT.md
related:
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-C70-TinhLuong]]"
  - "[[wiki/concepts/HRM-Log-Monitoring]]"
---

# Source: Daily 2024 — INS Bugs (C70, 14 ngày)

## Tóm tắt

Tổng hợp 2 bug bảo hiểm phát hiện và fix trong 2024: (1) Hotfix C70 tính tiền sai khi nhân viên nghỉ ốm dài ngày (Mantis 0180126); (2) Bug `INS_14DAYS_LEAVEDAYTYPE_COUNT` tại VDSC — biến `leavedayTypeCount` không reset giữa các vòng lặp → đếm sai số ngày nghỉ phép theo loại.

## Key Takeaways

- **C70 hotfix (Mantis 0180126)**: Khi NV nghỉ ốm dài ngày, C70 tính sai cột tiền bảo hiểm. Root cause: logic tính tháng tham gia BH không xử lý đúng trường hợp nghỉ xuyên tháng. Fix: điều chỉnh logic `InsuranceMonthJoin` cho case nghỉ ốm > 1 tháng.
- **Bug `leavedayTypeCount` (VDSC)**: Store tính 14 ngày nghỉ ốm hưởng BHXH dùng biến `@leavedayTypeCount` để đếm số ngày theo loại phép. Biến không reset về 0 sau mỗi iteration → tích lũy sai qua các bản ghi → nhân viên bị tính sai 14 ngày.
  - **Fix**: Thêm `SET @leavedayTypeCount = 0` ở đầu mỗi vòng lặp (cursor/while).
- **Pattern chung**: Biến accumulator trong cursor SQL → phải reset sau mỗi row.
- **VDSC context**: Khách hàng VDSC (Viet Dragon Securities) dùng LDAP authentication kết hợp với HRM → log lỗi qua Confluence.
- **Mantis tracking**: Lỗi BH quan trọng đều có Mantis ticket → dùng số Mantis để trace history fix.

## Trích dẫn quan trọng

> **Bug leavedayTypeCount — pattern lỗi:**
> ```sql
> DECLARE @leavedayTypeCount INT = 0
> -- Cursor lặp qua từng bản ghi nghỉ phép
> FETCH NEXT FROM cur INTO @leaveType, @leaveDays
> WHILE @@FETCH_STATUS = 0
> BEGIN
>     -- BUG: @leavedayTypeCount không reset → tích lũy qua các row
>     SET @leavedayTypeCount = @leavedayTypeCount + @leaveDays
>     -- ... logic tính 14 ngày
>     FETCH NEXT FROM cur INTO @leaveType, @leaveDays
> END
> ```

> **Fix:**
> ```sql
> WHILE @@FETCH_STATUS = 0
> BEGIN
>     SET @leavedayTypeCount = 0  -- ← THÊM DÒNG NÀY reset trước mỗi iteration
>     SET @leavedayTypeCount = @leavedayTypeCount + @leaveDays
>     FETCH NEXT FROM cur INTO @leaveType, @leaveDays
> END
> ```

> **C70 hotfix scope**: Chỉ ảnh hưởng case nghỉ ốm dài ngày (> 1 tháng liên tục). Nghỉ ốm ngắn trong tháng không bị ảnh hưởng.

## Liên kết

- [[wiki/sources/INS-Nghi14Ngay]] — Quy tắc nghỉ 14 ngày hưởng BHXH (nghiệp vụ đầy đủ)
- [[wiki/sources/INS-C70-TinhLuong]] — Bảng C70: cột BH NLĐ + NSDLĐ, đối soát D02
- [[wiki/sources/INS-InsuranceMonthJoin]] — Logic xác định tháng tham gia BH
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone phân tích nguyên nhân gốc rễ lỗi BH
