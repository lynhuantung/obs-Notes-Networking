---
title: Giải quyết performance store Get_MasterDataForUser - SE-Docs - Confluence
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=30966789
created: 2026-01-25
tags:
  - clippings
  - document
like: false
---
## Cải Thiện Hiệu Suất Stored Procedure Get\_MasterDataForUser

## 1\. Giới Thiệu

Stored procedure `Get_MasterDataForUser` đã được tối ưu hóa nhằm cải thiện hiệu suất truy vấn dữ liệu. Dưới đây là chi tiết về quá trình refactor và so sánh trước và sau khi sửa.

- Excution Plan của store
![[Pasted image 20260125075319.png]]


## 2\. Stored Procedure Sau Khi Refactor

```
CREATE PROCEDURE [dbo].[Get_MasterDataForUser]
(
    @UserName varchar (50) = 'hanh.nguyen'
)
AS
BEGIN

    SET NOCOUNT ON;
        
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
        maintbl.UserID,
        maintbl.ObjectName,
        STRING_AGG(CAST(maintbl.ObjectID AS NVARCHAR(MAX)), ',') AS IDs,
        scp.Category,
        scp.IsConfig,
        ISNULL(@IsCheckMasterData, 0) AS IsCheckPermissionConfig
    FROM #MasterDataGroupItems maintbl
    JOIN Sys_CategoryPermission scp ON scp.TableName = maintbl.ObjectName
    GROUP BY maintbl.UserID, maintbl.ObjectName, scp.Category, scp.IsConfig;

    DROP TABLE #MasterDataGroupItems;
END
GO --END--
```

## 3\. So Sánh Trước và Sau Khi Sửa

### 3.1. Điểm Giống Nhau

- Cả hai phiên bản đều bắt đầu bằng việc xác định biến `@IsCheckMasterData` thông qua một câu truy vấn đơn giản.
- Cả hai đều liên quan đến việc lấy dữ liệu từ các bảng `Sys_UserMasterData` và `Cat_MasterDataGroup`.

### 3.2. Điểm Khác Biệt Chính

- **Số lượng Query và Chi phí tương đối:**
	- *File 1 (Get\_MasterDataForUser.sqlplan):*Chỉ có 2 query chính với chi phí tương đối là 24% và 76%.
	- *File 2 (test\_Get\_MasterDataForUser.sqlplan):*Có 3 query chính với chi phí tương đối là 11%, 71%, và 18%.
- **Chi phí tổng thể:**
	- *File 1:*Chi phí cao hơn đáng kể, bao gồm cả `ClusteredIndexScan` và `NestedLoops`.
	- *File 2:*Chi phí đã được tối ưu hóa hơn, với việc phân bổ chi phí rõ ràng,`TableScan` xuất hiện nhiều hơn thay vì `IndexScan`.
- **Các thao tác cụ thể:**
	- *File 1:*Sử dụng `ClusteredIndexScan`,`StreamAggregate`, và `NestedLoops`.
	- *File 2:*Sử dụng `TableScan` nhiều hơn và có sự xuất hiện của `Insert` vào bảng tạm (`#MasterDataGroupItems`).
- **Sử dụng bảng tạm (`#TempTable`):**
	- *File 1:*Không sử dụng bảng tạm, các phép nối có thể trực tiếp trên bảng chính.
	- *File 2:*Sử dụng bảng tạm để tối ưu hóa các thao tác với dữ liệu lớn và phức tạp.

## 4\. Tổng Kết

- *File 1* sử dụng nhiều chỉ mục và phép nối trực tiếp trên các bảng, phù hợp với truy vấn đơn giản hoặc dữ liệu không quá lớn.
- *File 2* có sự cải tiến với việc sử dụng bảng tạm, được thiết kế cho dữ liệu lớn hơn hoặc phức tạp hơn, giúp giảm tải cho các thao tác truy vấn chính.

  

  

  

---

Với cấu trúc này, tài liệu dễ đọc hơn, các phần chính được phân chia rõ ràng và dễ dàng theo dõi.