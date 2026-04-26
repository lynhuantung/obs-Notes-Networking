---
type: architecture
tags:
  - database
  - sql-server
  - clr
  - memory-optimized
  - schema
  - entity-framework
date-updated: 2026-04-26
related:
  - "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
  - "[[wiki/concepts/HRM-Deploy-Checklist]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/sources/Nhat-ky-van-de-he-thong]]"
---

# HRM — Kiến Trúc Database

> **Engine**: Microsoft SQL Server 2016+  
> **Đặc điểm**: CLR Assembly, Memory Optimized Tables, Stored Procedures

---

## Tổng quan cấu trúc Database

```
SQL Server Instance
│
├── HRM_MAIN_DB  ←── Database chính
│   │
│   ├── Tables (nghiệp vụ ~200+ bảng)
│   │   ├── Rec_*   (Recruitment — Tuyển dụng)
│   │   ├── Hr_*    (HR Core — Nhân sự, hợp đồng)
│   │   ├── Att_*   (Attendance — Chấm công, ca)
│   │   ├── Pay_*   (Payroll — Lương, phụ cấp)
│   │   ├── Ins_*   (Insurance — BHXH, BHYT, BHTN)
│   │   ├── Eva_*   (Evaluation — Đánh giá KPI)
│   │   ├── Tal_*   (Talent — Đào tạo, năng lực)
│   │   └── Sys_*   (System — User, Role, Permission)
│   │
│   ├── Stored Procedures
│   │   ├── sp_Hr_*    (HR Core procedures)
│   │   ├── sp_Pay_*   (Payroll procedures)
│   │   ├── sp_Ins_*   (Insurance procedures)
│   │   └── sp_Sys_*   (System procedures)
│   │
│   ├── CLR Assembly
│   │   └── VnResource.DatabaseClr.dll
│   │       └── dbo.VnrDecrypt()   ← SHA2-512 password hash
│   │
│   └── Memory Optimized Filegroup
│       └── HRM_MemOpt (bảng tần suất cao)
│
└── Survey_DB   ←── Database phụ (khảo sát, độc lập)
    └── Tables khảo sát nội bộ
```

---

## CLR Assembly — VnrDecrypt

### Tại sao dùng CLR

HRM dùng CLR để chạy `VnrDecrypt` — hàm mã hóa mật khẩu SHA2-512 được viết bằng C#, compile thành DLL, và đăng ký vào SQL Server.

### Setup CLR (bắt buộc khi dựng server mới)

```sql
-- Bước 1: Bật CLR
EXEC sp_configure 'clr enabled', 1;
RECONFIGURE;

-- Bước 2: Set TRUSTWORTHY (load UNSAFE assembly)
ALTER DATABASE [HRM_MAIN_DB] SET TRUSTWORTHY ON;

-- Bước 3: Đổi owner về sa
EXEC sp_changedbowner 'sa';

-- Bước 4: Cấp permission cho assembly
ALTER ASSEMBLY [VnResource.DatabaseClr]
WITH PERMISSION_SET = UNSAFE;
```

### Thu hồi quyền sau setup (Least Privilege)

```sql
-- Thu hồi sysadmin
ALTER SERVER ROLE sysadmin DROP MEMBER [AppUser];

-- Chỉ giữ quyền thực thi CLR function
GRANT EXECUTE ON dbo.VnrDecrypt TO [AppUser];
```

### Kiểm tra CLR đã bật chưa

```sql
SELECT name, value_in_use
FROM sys.configurations
WHERE name = 'clr enabled';
-- Kết quả mong muốn: value_in_use = 1
```

---

## Memory Optimized Tables

### Setup Filegroup (1 lần duy nhất)

```sql
-- Bước 1: Thêm filegroup Memory Optimized
ALTER DATABASE [HRM_MAIN_DB]
ADD FILEGROUP [MemoryOptimized_FG]
CONTAINS MEMORY_OPTIMIZED_DATA;

-- Bước 2: Thêm file vào filegroup
ALTER DATABASE [HRM_MAIN_DB]
ADD FILE (
    NAME = N'MemoryOptimized_File',
    FILENAME = N'C:\SQLData\HRM_MemOpt'
)
TO FILEGROUP [MemoryOptimized_FG];
```

**Lỗi nếu thiếu**:
```
Cannot create memory optimized table
without MEMORY_OPTIMIZED_DATA filegroup
```

---

## MAXDOP — Tối ưu song song

```sql
-- Kiểm tra giá trị hiện tại
SELECT value_in_use
FROM sys.configurations
WHERE name = 'max degree of parallelism';
-- Nếu = 1 → NGUY HIỂM, query chạy đơn luồng!

-- Set giá trị phù hợp
EXEC sp_configure 'max degree of parallelism', 8;
RECONFIGURE;

-- Khuyến nghị: = số physical cores / 2, tối thiểu 4
```

---

## Entity Framework Code First (.NET 8)

### Cấu trúc Entity Project

```
HRM.Business.Hr.Domain/
  ├── CommonFeatures/
  ├── ContractFeatures/
  ├── ContractExtendFeatures/
  ├── DIServices/                    # DI registrations (mẫu mới)
  │   ├── IServices/Hre/
  │   └── Services/Hre/
  ├── ProfileFeatures/
  ├── RequestInfoFeatures/
  ├── StopWorkingFeatures/
  └── WorkHistoryFeatures/
```

> Service class nhóm theo **feature**, không theo layer  
> Ví dụ: `Hre_CommonServices.cs`, `Hre_ContractServices.cs`

### DIServices Pattern (mẫu mới hơn)

```csharp
// Interface
public interface IHre_XxxServiceDI {
    string DoSomething(List<Guid> ids);
}

// Implementation
public class Hre_XxxServiceDI : BaseService, IHre_XxxServiceDI {
    public string DoSomething(List<Guid> ids) { ... }
}
```

### Compiled Model (.NET 8 — bắt buộc)

```csharp
// DbContext với Compiled Model để tối ưu startup time
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
{
    optionsBuilder.UseModel(HrmCompiledModel.Instance);
    // Compiled Model giảm thời gian khởi tạo DbContext từ ~3s → ~0.3s
}
```

### Build Entity Code First

```
Quy trình (phải theo đúng thứ tự):
1. Có script DB từ team database → chạy script trước
2. Sau khi script chạy xong → mới build entity
3. Không build entity trước khi có script → conflict

Lệnh build Compiled Model:
  dotnet ef dbcontext optimize
  --output-dir CompiledModels
  --namespace HRM.Business.Data.CompiledModels
```

---

## Stored Procedure Standards

### Naming Convention

```sql
-- Prefix theo phân hệ:
sp_Hr_GetProfile          -- HR Core
sp_Pay_CalcSalary         -- Payroll
sp_Ins_GetMonthJoin       -- Insurance
sp_Att_GetShift           -- Attendance
sp_Tal_GetTraining        -- Talent
sp_Sys_GetPermission      -- System
```

### Rules

```
✅ Store phải có prefix phân hệ
✅ Viết business logic trong store (không trong application code)
✅ Hỏi người viết store trước khi chạy
❌ Không chạy store của người khác khi không hiểu
❌ Không build entity khi chưa có script DB
```

---

## Performance Monitoring

### Top queries chậm

```sql
SELECT TOP 10
    qs.total_elapsed_time / qs.execution_count AS avg_elapsed_time_us,
    qs.execution_count,
    SUBSTRING(st.text,
        (qs.statement_start_offset/2)+1,
        ((CASE qs.statement_end_offset WHEN -1 THEN DATALENGTH(st.text)
          ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)+1
    ) AS statement_text
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY avg_elapsed_time_us DESC;
```

### Memory pressure check

```sql
SELECT
    physical_memory_in_use_kb / 1024 AS mem_used_mb,
    page_fault_count,
    memory_utilization_percentage
FROM sys.dm_os_process_memory;
```

### Blocking queries

```sql
SELECT
    r.session_id,
    r.blocking_session_id,
    r.wait_type,
    r.wait_time / 1000 AS wait_sec,
    t.text AS query_text
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t
WHERE r.blocking_session_id > 0;
```

---

## Backup Strategy

### Pattern VnPay (AWS S3)

```
Hàng ngày → Backup full → Upload S3:
  s3://hrm-artifacts/vnpay/database/
    HRMPRO12_VNPAY_20260420.rar
    HRMPRO12_VNPAY_20260421.rar
    ...

Restore procedure:
  1. Download từ S3
  2. Giải nén .rar
  3. SSMS → Restore Database
  4. Re-run CLR setup (TRUSTWORTHY, VnrDecrypt)
```

### Checklist sau restore

```sql
-- Bắt buộc sau khi restore DB:
EXEC sp_configure 'clr enabled', 1; RECONFIGURE;
ALTER DATABASE [HRM_MAIN_DB] SET TRUSTWORTHY ON;
EXEC sp_changedbowner 'sa';
ALTER ASSEMBLY [VnResource.DatabaseClr] WITH PERMISSION_SET = UNSAFE;

-- Kiểm tra VnrDecrypt hoạt động:
SELECT dbo.VnrDecrypt('test_password');
-- Nếu trả về hash → CLR OK
-- Nếu lỗi → kiểm tra lại CLR setup
```

---

## Liên kết liên quan

- [[wiki/concepts/HRM-SQL-Troubleshooting]] — Lỗi SQL thường gặp + fix
- [[wiki/concepts/HRM-Deploy-Checklist]] — Checklist setup server mới
- [[wiki/sources/Nhat-ky-van-de-he-thong]] — Nhật ký lỗi hệ thống (SQL)
- [[wiki/architecture/HRM-System-Architecture]] — Tổng quan kiến trúc
- [[wiki/concepts/HRM-Security-Config]] — VnrDecrypt, sysadmin policy
