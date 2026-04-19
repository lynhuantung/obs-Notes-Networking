---
Mã: skill-hrm-store-sql
aliases: [Sinh Stored Procedure HRM]
date: 2026-04-19
tags: [skill, hrm, sql, stored-procedure]
domain: HRM
type: skill
status: active
Related:
  - "[[AI-Agent-MOC]]"
  - "[[2-2 Toi uu SQL Server]]"
  - "[[2-2a Index bang Hre_Profile]]"
---

# Skill: SQL Store Generator

> **Dùng khi**: Cần sinh stored procedure chuẩn HRM cho một bảng mới (paging + filter + totalrow).

---

## Mô tả
Tự động sinh stored procedure theo chuẩn HRM từ tên bảng — đúng format, đúng alias, đúng block.

---

## Input cần thiết
| Tham số | Ví dụ |
|---|---|
| `TableName` | `Cat_Bank` |
| `Columns` | Danh sách cột cần filter (text columns) |

---

## Output sinh ra
```sql
-- Store name: hrm_cat_sp_get_Cat_Bank
-- Alias: cb (lấy chữ cái đầu mỗi phần)

CREATE PROCEDURE hrm_cat_sp_get_Cat_Bank
    @PageIndex INT,
    @PageSize  INT,
    @ColumnName NVARCHAR(255) = NULL,
    @TotalRow INT OUTPUT
AS
BEGIN
    --beginselect--
    SELECT cb.*
    FROM Cat_Bank cb
    --beginwhere--
    WHERE 1=1
    AND (
        cb.ColumnName LIKE '%' + ISNULL(@ColumnName, cb.ColumnName) + '%'
        OR cb.ColumnName IS NULL
    )
    --beginorder--
    ORDER BY cb.Id
    OFFSET (@PageIndex - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY

    SELECT @TotalRow = COUNT(*) FROM Cat_Bank WHERE 1=1
END
```

---

## Quy tắc đặt tên
| Thành phần | Quy tắc | Ví dụ |
|---|---|---|
| Store name | `hrm_{prefix}_sp_get_{TableName}` | `hrm_cat_sp_get_Cat_Bank` |
| Alias | Chữ cái đầu mỗi phần (lowercase) | `Cat_Bank` → `cb` |
| Prefix | Theo module (cat/hre/att/sal/ins) | `cat` |

---

## Liên kết
- [[Skill-config]] — skill liên quan cùng domain HRM
- [[2-2 Toi uu SQL Server]] — context tối ưu SQL
- [[2-2a Index bang Hre_Profile]] — ví dụ thực tế index
