---
Mã: Sys022
aliases:
date: 2025-10-30
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys015 - Shrink log database về 1MB]]"
  - "[[Sys014 - Xóa memory optimized filegroup]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# SQL chậm MAXDOP 1 CPU

**Vấn đề:** SQL chạy chậm do chỉ sử dụng 1 nhân CPU (MAXDOP = 1)
- SQL Server chỉ dùng 1 CPU cho mỗi truy vấn, dẫn đến hiệu suất xử lý thấp với các truy vấn nặng.

**Hiện trạng:**
- Kiểm tra cấu hình song song hiện tại:

```sql
SELECT name, value_in_use
FROM sys.configurations
WHERE name = 'max degree of parallelism';
```

Kết quả: `max degree of parallelism = 1` → SQL chỉ chạy **1 luồng CPU** cho mỗi truy vấn.

**Nguyên nhân:**
- Tham số `MAXDOP` (**Max Degree of Parallelism**) quy định số **nhân CPU tối đa** mà **một truy vấn** được phép sử dụng cùng lúc.
- Khi đặt `MAXDOP = 1`, SQL sẽ chạy **đơn luồng** → các truy vấn tổng hợp, JOIN hoặc báo cáo lớn sẽ **chạy chậm rõ rệt** do không tận dụng được đa nhân CPU.

**Phương án:**
Tăng số luồng xử lý song song lên **8 nhân CPU**:

```sql
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'max degree of parallelism', 8; RECONFIGURE;
```

Kiểm tra lại sau khi thay đổi:

```sql
SELECT name, value_in_use
FROM sys.configurations
WHERE name = 'max degree of parallelism';
```

**Kết quả mong đợi:**
- SQL Server cho phép truy vấn nặng chạy **tối đa 8 luồng song song**.
- Thời gian xử lý báo cáo hoặc thống kê **giảm đáng kể**.
- CPU được **phân bổ đều hơn** giữa các nhân, tránh nghẽn tại 1 core.
