---
aliases: 
date: 2024-08-16
tags:
  - daily
Link: "[[SQL_Query_Performance_Improved]]"
---
store : Get_MasterDataForUser => store sau khi refactor 
```sql
CREATE PROCEDURE [dbo].[Get_MasterDataForUser__Refactor]
(
	@UserName varchar(50) = 'hanh.nguyen'
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Pre-calculate @IsCheckMasterData
    Declare @IsCheckMasterData bit = (SELECT TOP 1 1
                                      FROM Sys_AllSetting
                                      WHERE IsDelete IS NULL
                                      AND Name = 'HRM_HRE_TABSYSTEM_CATEGORYPERMISSION'
                                      AND Value1 = 'True');

    -- Consider using a temp table for the subquery in OUTER APPLY
    IF OBJECT_ID('tempdb..#MasterDataGroupItems') IS NOT NULL DROP TABLE #MasterDataGroupItems;

    SELECT mdgi.ID as ItemID, mdgi.ObjectID, mdgi.ObjectName, umd.UserID
    INTO #MasterDataGroupItems
    FROM Sys_UserMasterData umd
    JOIN Cat_MasterDataGroup mdg ON EXISTS (SELECT 1 FROM split_to_int(umd.MasterDataGroup) WHERE id = mdg.OrderNumber)
    JOIN Cat_MasterDataGroupItem mdgi ON mdgi.MasterDataGroupID = mdg.id
    WHERE mdg.IsDelete IS NULL
    AND mdgi.IsDelete IS NULL
    AND umd.IsDelete IS NULL;

    SELECT
        umd.UserID,
        maintbl.ObjectName,
        STRING_AGG(CAST(maintbl.ObjectID AS NVARCHAR(MAX)), ',') AS IDs,
        scp.Category,
        scp.IsConfig,
        ISNULL(@IsCheckMasterData, 0) AS IsCheckPermissionConfig
    FROM #MasterDataGroupItems maintbl
    JOIN Sys_CategoryPermission scp ON scp.TableName = maintbl.ObjectName
    GROUP BY umd.UserID, maintbl.ObjectName, scp.Category, scp.IsConfig;

    DROP TABLE #MasterDataGroupItems;
END
GO


```

### So sánh trước và sau khi sửa
#### Hình ảnh 
![[Pasted image 20240816174259.png]]
#### So sánh trước và sau sửa store Get_MasterDataForUser

> [!So sánh trước và sau sửa store Get_MasterDataForUser]
> ### Điểm giống nhau
> 
> - Cả hai kế hoạch đều bắt đầu với việc xác định một biến `@IsCheckMasterData` thông qua một câu truy vấn đơn giản.
> - Cả hai kế hoạch đều liên quan đến việc lấy dữ liệu từ các bảng `Sys_UserMasterData` và `Cat_MasterDataGroup`.
> 
> ### Điểm khác biệt chính
> 
> 1. **Số lượng Query và Chi phí tương đối:**
>     
>     - **File 1 (Get_MasterDataForUser.sqlplan):** Chỉ có 2 query chính với chi phí tương đối là 24% và 76%.
>     - **File 2 (test_Get_MasterDataForUser.sqlplan):** Có 3 query chính với chi phí tương đối là 11%, 71%, và 18%.
> 2. **Chi phí tổng thể:**
>     
>     - **File 1:** Query chi phí cao hơn đáng kể, với các chi phí được phân bổ trong các bước, bao gồm cả `Clustered Index Scan` và `Nested Loops`.
>     - **File 2:** Dường như chi phí đã được tối ưu hóa hơn, với việc phân bổ chi phí rõ ràng hơn, trong đó `Table Scan` xuất hiện nhiều hơn thay vì `Index Scan` như trong File 1.
> 3. **Các thao tác cụ thể:**
>     
>     - **File 1:** Có các thao tác `Clustered Index Scan`, `Stream Aggregate` và `Nested Loops`, cho thấy nó đang tìm kiếm dữ liệu trên các chỉ mục có cấu trúc cụm, và sử dụng phép nối vòng lặp tổ hợp.
>     - **File 2:** Thay vì tập trung vào `Index Scan`, nó sử dụng `Table Scan` nhiều hơn và có sự xuất hiện của `Insert` vào bảng tạm (#MasterDataGroupItems), có thể nhằm mục đích tối ưu hóa các thao tác sau đó.
> 4. **Sử dụng bảng tạm (#TempTable):**
>     
>     - **File 1:** Không thấy sự xuất hiện của bảng tạm, nên các phép nối có thể trực tiếp trên bảng chính.
>     - **File 2:** Có sử dụng bảng tạm, điều này có thể giúp tối ưu hóa các thao tác với dữ liệu lớn và phức tạp.
> 
> ### Tổng kết
> 
> - **File 1** dường như sử dụng nhiều chỉ mục và các phép nối trực tiếp trên các bảng, điều này có thể phù hợp với các truy vấn đơn giản hoặc dữ liệu không quá lớn.
> - **File 2** đã có sự cải tiến với việc sử dụng bảng tạm và có thể được thiết kế cho dữ liệu lớn hơn hoặc phức tạp hơn, với mục đích giảm tải cho các thao tác truy vấn chính.
> 