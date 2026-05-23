---
type: source
description: "Ghi chú hàng ngày 2024 về cache Redis và phân quyền danh mục: bug, fix IIS và migration setup Redis."
tags:
  - cache
  - redis
  - performance
  - bug-fix
  - iis
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-Aug-32/Cache-Phan-Quyen-Danh-Muc-Loi.md, 0.Daily/2024-Aug-34/Migration-Redis-Setup-Task.md
related:
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/concepts/HRM-SQL-Troubleshooting]]"
---

# Source: Daily 2024 — Cache & Redis Migration

## Tóm tắt

Ghi chú tháng 08/2024 về 2 vấn đề cache quan trọng trong HRM: (1) Bug phân quyền danh mục không đồng bộ do IIS có 4 pools mỗi pool có cache riêng, cộng với bug `Task.Run` không lấy được `HttpContext` header; (2) Migration từ memory cache lên Redis distributed cache (4h task). Đây là nền tảng cho kiến trúc cache 5 pools trên VnPay.

## Key Takeaways

- **Root cause cache lỗi**: IIS chạy 4 worker processes (4 Application Pools) → mỗi pool có MemoryCache riêng → clear cache trên 1 pool không ảnh hưởng 3 pools còn lại → user thấy quyền khác nhau tùy request routing.
- **Bug `Task.Run` + HttpContext**: Khi gọi `Task.Run(() => ClearCache())`, thread mới không có `HttpContext.Current` → không lấy được header `Authorization` / `UserID` → cache clear sai scope.
  - **Fix**: Capture context trước khi vào Task:
    ```csharp
    var context = HttpContext.Current;
    Task.Run(() => {
        HttpContext.Current = context;
        ClearCacheAction();
    });
    ```
- **5 pools VnPay**: main / portal / hr / sys / apiV3 → phải clear đồng thời cả 5 pools khi có thay đổi quyền.
- **Redis migration (4h task)**: Chuyển từ `MemoryCache` (per-process) sang `IDistributedCache` (Redis 7.2.5) → shared across tất cả IIS pools và K8s pods.
- **Redis 7.2.5**: Cài đặt trên Windows Server, connection string qua `StackExchange.Redis`.
- **Kiến trúc sau migration**: Redis làm distributed cache tầng giữa → IIS pools chỉ dùng local L1 cache ngắn hạn, Redis làm L2.

## Trích dẫn quan trọng

> **Bug Task.Run không lấy HttpContext:**
> ```csharp
> // SAI — context = null trong thread mới
> Task.Run(() => {
>     var userId = HttpContext.Current.Request.Headers["X-UserId"]; // NullReferenceException
> });
>
> // ĐÚNG — capture trước
> var context = HttpContext.Current;
> Task.Run(() => {
>     HttpContext.Current = context;
>     var userId = context.Request.Headers["X-UserId"]; // OK
> });
> ```

> **5-pool clear pattern**: Khi cập nhật quyền user, gọi API clear cache đến tất cả 5 endpoints:
> - `POST /main/api/cache/clear`
> - `POST /portal/api/cache/clear`
> - `POST /hr/api/cache/clear`
> - `POST /sys/api/cache/clear`
> - `POST /apiv3/api/cache/clear`

> **Redis migration estimate**: 4h — bao gồm setup Redis server, refactor `IMemoryCache` → `IDistributedCache`, test với 5 pools đồng thời.

## Liên kết

- [[wiki/architecture/HRM-System-Architecture]] — 13 services VnPay, kiến trúc tổng quan
- [[wiki/architecture/HRM-Deployment-Architecture]] — IIS config, K8s, multi-tenant
- [[wiki/sources/WarmupStatus-Performance-2026]] — WarmupStatus 6 services (kế thừa từ kiến trúc cache này)
- [[wiki/sources/VnPay-Performance-Incident]] — Sự cố nghẽn 200 users tháng 11/2025
