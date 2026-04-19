---  
description: Use this skill to generate SQL Server stored procedures (paging + filter) based on a given table name following HRM standard template.  
---  
  
## Core Domain: SQL Store Generator (Sinh Stored Procedure)  
  
The SQL Store Generator Domain is responsible for automatically generating standard stored procedures for querying data in HRM system.  
  
This ensures:  
- Consistent query structure across all modules  
- Support paging, filtering, and total row count  
- Easy integration with UI (Kendo Grid, API, etc.)  
  
---  
  
## Key Components  
  
### 1. Stored Procedure Template (Tâm điểm sinh store)  
- Chuẩn cấu trúc store theo hệ thống HRM:  
  - Paging (`PageIndex`, `PageSize`)  
  - Filter (`LIKE + ISNULL`)  
  - TotalRow  
  - Alias bảng  
- Có các block chuẩn:

--beginselect--  
--beginwhere--  
--beginorder--

  
---  
  
### 2. Table Mapping (Tên bảng & alias)  
- Input: tên bảng (VD: `Cat_Bank`)  
- Alias:  
- Lấy chữ cái đầu mỗi phần → `cb`  
- Store name:

hrm_cat_sp_get_{TableName}

  
---  
  
### 3. Dynamic Filter Generator  
- Sinh điều kiện WHERE dựa trên các cột text  
- Format chuẩn:  
  
```sql  
AND (  
  alias.ColumnName LIKE '%' + ISNULL(@ColumnName, alias.ColumnName) + '%'  
  OR alias.ColumnName IS NULL  
)
