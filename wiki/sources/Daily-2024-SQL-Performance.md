---
type: source
description: "Tối ưu hiệu năng SQL HRM 2024: cải thiện stored procedure Get_MasterDataForUser và các query có vấn đề."
tags:
  - sql
  - performance
  - refactor
  - store-procedure
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-Aug-33/Cải thiện performance Get_MasterDataForUser.md, 0.Daily/2024-Aug-33/SQL_Query_Performance_Improved.md
related:
  - "[[wiki/architecture/HRM-Database-Architecture]]"
  - "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
  - "[[wiki/concepts/HRM-Code-Quality]]"
---

# Source: Daily 2024 — SQL Performance (Get_MasterDataForUser)

## Tóm tắt

Ghi chú tháng 08/2024 về refactor store `Get_MasterDataForUser` — store tổng hợp danh mục phân quyền theo user. Vấn đề gốc rễ: truy vấn cursor/loop lặp qua hàng nghìn row với nhiều JOIN phức tạp. Sau refactor với temp table `#MasterDataGroupItems` và `STRING_AGG`, CPU giảm từ 38,750ms xuống 672ms (98.3%).

## Key Takeaways

- **Vấn đề**: `Get_MasterDataForUser` dùng cursor + nhiều JOIN lồng nhau → tạo Worktable (sort spill to disk), I/O cao
- **Fix**: Tạo temp table `#MasterDataGroupItems` một lần từ join `Sys_UserMasterData → Cat_MasterDataGroup → Cat_MasterDataGroupItem`, sau đó JOIN vào temp table thay vì JOIN trực tiếp
- **`STRING_AGG`**: Thay thế STUFF/FOR XML PATH bằng `STRING_AGG(value, ',')` (SQL Server 2017+) → đơn giản hơn, nhanh hơn
- **Kết quả đo đạc** (SET STATISTICS IO, TIME ON):
  - CPU: 38,750ms → 672ms (**giảm 98.3%**)
  - Worktable reads: 3,987 → 0
  - `Cat_MasterDataGroupItem` reads: 1,540 → 77
- **Phương pháp đo**: `SET STATISTICS IO ON; SET STATISTICS TIME ON;` chạy trước/sau để so sánh
- **Nguyên tắc**: Khi JOIN nhiều lần với cùng bộ filter phức tạp → materialize vào temp table trước

## Trích dẫn quan trọng

> **Core refactor — temp table:**
> ```sql
> SELECT mdgi.ID as ItemID, mdgi.ObjectID, mdgi.ObjectName, umd.UserID
> INTO #MasterDataGroupItems
> FROM Sys_UserMasterData umd
> JOIN Cat_MasterDataGroup mdg 
>   ON EXISTS (SELECT 1 FROM split_to_int(umd.MasterDataGroup) WHERE id = mdg.OrderNumber)
> JOIN Cat_MasterDataGroupItem mdgi ON mdgi.MasterDataGroupID = mdg.id
> WHERE mdg.IsDelete IS NULL AND mdgi.IsDelete IS NULL AND umd.IsDelete IS NULL;
> 
> -- Sau đó JOIN vào #MasterDataGroupItems thay vì lặp lại 3 JOIN trên
> ```

> **Kết quả thực tế:**
> - Before: CPU time = 38,750 ms; elapsed = 41,200 ms; Worktable 3987 reads
> - After: CPU time = 672 ms; elapsed = 890 ms; Worktable 0 reads

> **STRING_AGG thay STUFF/FOR XML:**
> ```sql
> -- Cũ (STUFF):
> STUFF((SELECT ',' + CAST(ID as NVARCHAR) FROM ... FOR XML PATH('')), 1, 1, '')
> -- Mới (STRING_AGG):
> STRING_AGG(CAST(ID as NVARCHAR), ',')
> ```

## Liên kết

- [[wiki/architecture/HRM-Database-Architecture]] — Kiến trúc database: SQL Server, CLR, Memory Optimized, MAXDOP
- [[wiki/concepts/HRM-SQL-Troubleshooting]] — CLR, Memory Optimized Filegroup, MAXDOP, cache config limit
- [[wiki/sources/Nhat-ky-van-de-he-thong]] — 22 vấn đề kỹ thuật hệ thống (bao gồm SQL issues)
