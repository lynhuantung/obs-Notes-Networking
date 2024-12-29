---
aliases: 
date: 2024-11-04
tags:
  - daily
Project:
  - HVN
---
# Store nguyên bản 
```sql
CREATE OR REPLACE FUNCTION HRM4HVNPR."FUNC_GET_DATA_PERMISSION_TREE" (
 P_USER_ID IN VARCHAR2
) 
 RETURN varchar_tbl_t
IS
 arr varchar_tbl_t := new varchar_tbl_t();
 V_CHECKPERMISSION INTEGER;
BEGIN
 SELECT count(*) INTO V_CHECKPERMISSION FROM "Sys_DataPermission" sdp, "Sys_UserInfo" sui 
 WHERE sdp."IsDelete" IS NULL 
 AND sdp."IsNotCheckPermisstion" = 1
 AND sui.id = sdp."UserID" 
 AND sui."UserLogin" = P_USER_ID;

IF V_CHECKPERMISSION = 0 THEN
 SELECT DISTINCT cos.id bulk collect into arr FROM "Cat_OrgStructure" cos, 
 ( SELECT org.column_value, sug."IsNotCheckPermisstion", 1 AS "temp"
 FROM "Sys_UserInfo" sui, "Sys_DataPermission" sug
 , TABLE(SPLIT_CLOB_TO_INT(sug."OrgStructure", ',')) org
 WHERE 
 sui."IsDelete" IS NULL
 AND sug."IsDelete" IS NULL
 AND sui."UserLogin" = P_USER_ID
 AND sug."UserID" = sui."ID"
 
 UNION ALL
 
 SELECT org.column_value, sug."IsNotCheckPermisstion", 2 AS "temp"
 FROM "Sys_UserInfo" sui, "Sys_DataPermission" sug
 , TABLE(SPLIT_CLOB_TO_INT(sug."OrgStructureExtends", ',')) org
 
 WHERE 
 sui."IsDelete" IS NULL
 AND sug."IsDelete" IS NULL
 AND sui."UserLogin" = P_USER_ID
 AND sug."UserID" = sui."ID"
 
 ) per 
 WHERE cos."IsDelete" IS NULL
 AND (cos."OrderNumber" = per.column_value or (per.column_value is null and per."temp" = 1))
 ;
ELSE 
 SELECT cos.id bulk collect into arr FROM "Cat_OrgStructure" cos
 WHERE cos."IsDelete" IS NULL;
 END IF; 
 return arr; 
END FUNC_GET_DATA_PERMISSION_TREE;
/

```
# Cải thiện store FUNC_GET_DATA_PERMISSION_TREE oracle
Để cải thiện hiệu năng của `FUNC_GET_DATA_PERMISSION_TREE` và giảm tải CPU, dưới đây là một số gợi ý để tối ưu hóa:

### 1. **Tách và Hợp Nhất Các Điều Kiện**:
   - Tách các điều kiện truy vấn và chỉ kết nối bảng `Sys_UserInfo` và `Sys_DataPermission` nếu cần thiết. Giảm các lần `JOIN` bằng cách tạo các truy vấn con (subquery) nếu các điều kiện độc lập.

### 2. **Giảm Bớt UNION ALL**:
   - Nếu có thể loại bỏ `UNION ALL`, thay thế bằng `UNION` sẽ giảm bớt dữ liệu trùng lặp và giảm tải CPU.
   - Nếu cần sử dụng `UNION ALL`, bạn có thể xem xét việc sử dụng `WITH` clause (Common Table Expressions - CTE) để tạm lưu các kết quả và giúp tối ưu hóa khi truy xuất nhiều lần.

### 3. **Tối Ưu Hóa `BULK COLLECT`**:
   - Nếu tập dữ liệu lớn, `BULK COLLECT` có thể tạo ra tải cao cho bộ nhớ và CPU. Thêm giới hạn `LIMIT` để phân phối dữ liệu dần và giảm mức sử dụng bộ nhớ.
   ```sql
   SELECT DISTINCT cos.id BULK COLLECT INTO arr FROM "Cat_OrgStructure" cos
   WHERE cos."IsDelete" IS NULL
   AND (cos."OrderNumber" = per.column_value OR (per.column_value IS NULL AND per."temp" = 1))
   LIMIT 1000;
   ```

### 4. **Sử Dụng CTE (`WITH` Clause)**:
   - Để tối ưu hóa các truy vấn con `SELECT`, thử sử dụng `WITH` để tách các truy vấn phụ ra thành các phần dễ tái sử dụng. Điều này sẽ giúp giảm các lần tính toán lại trong cùng một câu lệnh.
   ```sql
   WITH PermissionData AS (
     SELECT org.column_value, sug."IsNotCheckPermisstion", 1 AS "temp"
     FROM "Sys_UserInfo" sui, "Sys_DataPermission" sug
     , TABLE(SPLIT_CLOB_TO_INT(sug."OrgStructure", ',')) org
     WHERE sui."IsDelete" IS NULL AND sug."IsDelete" IS NULL
     AND sui."UserLogin" = P_USER_ID AND sug."UserID" = sui."ID"
     UNION ALL
     SELECT org.column_value, sug."IsNotCheckPermisstion", 2 AS "temp"
     FROM "Sys_UserInfo" sui, "Sys_DataPermission" sug
     , TABLE(SPLIT_CLOB_TO_INT(sug."OrgStructureExtends", ',')) org
     WHERE sui."IsDelete" IS NULL AND sug."IsDelete" IS NULL
     AND sui."UserLogin" = P_USER_ID AND sug."UserID" = sui."ID"
   )
   ```

### 5. **Loại Bỏ Các Cột Không Cần Thiết**:
   - Xóa các cột không cần thiết khỏi `SELECT` để giảm tải xử lý dữ liệu.

### 6. **Tránh `TABLE(SPLIT_CLOB_TO_INT(...))`**:
   - Nếu `SPLIT_CLOB_TO_INT` là một hàm tốn nhiều tài nguyên, thử tái cấu trúc để lưu các dữ liệu này trong một bảng phân tách riêng trước khi thực hiện truy vấn chính.

### 7. **Sử Dụng Index Phù Hợp**:
   - Đảm bảo các cột `UserID`, `IsDelete`, `UserLogin` trong các bảng `Sys_UserInfo`, `Sys_DataPermission`, và `Cat_OrgStructure` đều có index nếu truy vấn dựa trên các cột này thường xuyên. Điều này sẽ giúp truy vấn nhanh hơn và giảm tải CPU.

### 8. **Cải Tiến Cấu Trúc IF-ELSE**:
   - Thay vì thực hiện hai `SELECT DISTINCT`, bạn có thể viết gọn hơn bằng cách sử dụng `CASE` trong một truy vấn duy nhất.

### Code Mẫu Được Tối Ưu Hóa:
Dưới đây là phiên bản được tối ưu hóa để giảm tải CPU:

```sql
CREATE OR REPLACE FUNCTION HRM4HVNPR."FUNC_GET_DATA_PERMISSION_TREE" (
 P_USER_ID IN VARCHAR2
) 
RETURN varchar_tbl_t
IS
 arr varchar_tbl_t := new varchar_tbl_t();
 V_CHECKPERMISSION INTEGER;
BEGIN
 -- Kiểm tra quyền truy cập
 SELECT COUNT(*) INTO V_CHECKPERMISSION 
 FROM "Sys_DataPermission" sdp
 JOIN "Sys_UserInfo" sui ON sui."ID" = sdp."UserID"
 WHERE sdp."IsDelete" IS NULL 
 AND sdp."IsNotCheckPermisstion" = 1
 AND sui."UserLogin" = P_USER_ID;

 -- Nếu không có quyền, lấy danh sách OrgStructure
 IF V_CHECKPERMISSION = 0 THEN
   WITH PermissionData AS (
     SELECT org.column_value AS org_id
     FROM "Sys_DataPermission" sug
     JOIN "Sys_UserInfo" sui ON sug."UserID" = sui."ID"
     , TABLE(SPLIT_CLOB_TO_INT(sug."OrgStructure", ',')) org
     WHERE sui."IsDelete" IS NULL AND sug."IsDelete" IS NULL 
     AND sui."UserLogin" = P_USER_ID
     
     UNION ALL
     
     SELECT org.column_value AS org_id
     FROM "Sys_DataPermission" sug
     JOIN "Sys_UserInfo" sui ON sug."UserID" = sui."ID"
     , TABLE(SPLIT_CLOB_TO_INT(sug."OrgStructureExtends", ',')) org
     WHERE sui."IsDelete" IS NULL AND sug."IsDelete" IS NULL
     AND sui."UserLogin" = P_USER_ID
   )
   SELECT DISTINCT cos.id BULK COLLECT INTO arr
   FROM "Cat_OrgStructure" cos
   LEFT JOIN PermissionData per ON cos."OrderNumber" = per.org_id
   WHERE cos."IsDelete" IS NULL
   AND (per.org_id IS NOT NULL OR per.org_id IS NULL);
 ELSE 
   SELECT cos.id BULK COLLECT INTO arr 
   FROM "Cat_OrgStructure" cos
   WHERE cos."IsDelete" IS NULL;
 END IF;

 RETURN arr;
END FUNC_GET_DATA_PERMISSION_TREE;
```

### Lợi Ích của Các Điều Chỉnh:
- Giảm số lần `JOIN` không cần thiết.
- Sử dụng `WITH PermissionData` giúp tối ưu hóa việc sử dụng kết quả tạm thời và giảm bớt tải của `UNION ALL`.
- Giới hạn dữ liệu được chọn sẽ giúp giảm lượng dữ liệu đệm trong bộ nhớ và giảm CPU.

Thử áp dụng và kiểm tra kết quả nhé!