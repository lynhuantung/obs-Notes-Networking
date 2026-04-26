---
type: source
tags:
  - warmup
  - iis
  - redis
  - performance
  - pvcfc
  - net8
date-ingested: 2026-04-26
category: incident
project: vnpay
date-updated: 2026-04-26
source-file: 0. Daily/2026-Apr-17/WarmupStatus Khi Restart Pools IIS.md
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
- "[[wiki/concepts/Net8-Migration]]"
---

# WarmupStatus & Performance Improvement — IIS Pool Restart

> File nguồn: `0. Daily/2026-Apr-17/WarmupStatus Khi Restart Pools IIS.md`  
> Ngày ghi: 2026-04-20 | Tag: #pvcfc_Project, #warmup, #iis

---

## Tóm tắt

Tài liệu mô tả thay đổi code nhằm **theo dõi và cải thiện hiệu suất warmup** sau khi restart IIS pools trong hệ thống HRM đa-service. Trước đây chỉ ghi 3/6 service vào Redis HASH `StartApplication_WarmupStatus`; sau thay đổi ghi đủ **6 services** kèm **thời gian warmup** (giây). Ngoài ra SC.Api và Identity cũng được cải thiện: SC.Api warmup DB thực sự thay vì chỉ scan JIT; Identity pre-compile Razor Login view để giải quyết màn hình trắng lần đầu sau restart.

---

## Key Takeaways

- **Redis HASH key**: `StartApplication_WarmupStatus` — 6 field tương ứng 6 services, value dạng `"2026-04-20 10:00:15 (48s)"`
- **6 services theo dõi**:
  - `HRM.Presentation.Main`
  - `HRM.Presentation.EmpPortal`
  - `HRM.Presentation.Hr.Service`
  - `HRM.Presentation.HrmSystem.Service`
  - `HRM.SC.Service.Api`
  - `HRM.SC.Service.Identity`
- **Pattern warmup chuẩn**: `Stopwatch.StartNew()` → các `Task.Run()` song song (t0–t6) → `Task.WhenAll()` → ghi Redis
- **SC.Api thay đổi**: tạo class mới `Sys_WarmupBusinessServices` trong `HRM.SC.Core.Business` → query VnrHrmDataContext thực sự
- **Identity thay đổi**:
  - Thêm `StackExchange.Redis` package
  - Thêm `RedisCaching.cs` wrapper
  - `StartupWarmupService.cs`: warmup DB + Razor view song song; Razor view warmup bằng `HttpClient.GetAsync(loginUrl)` → giải quyết màn hình trắng lần đầu login
- **File cần update csproj**: `HRM.SC.Core.Business.csproj`, `HRM.SC.Service.Api.csproj`

---

## Trích dẫn quan trọng

> **Pattern ghi WarmupStatus vào Redis:**
> ```csharp
> var duration = (int)sw.Elapsed.TotalSeconds;
> var value = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} ({duration}s)";
> RedisCaching.HashSet("StartApplication_WarmupStatus", serviceName, value);
> ```

> **WarmupRazorViewAsync — giải quyết màn hình trắng:**
> ```csharp
> var loginUrl = $"{address}/Account/Login";
> var client = _httpClientFactory.CreateClient("warmup");
> client.Timeout = TimeSpan.FromSeconds(30);
> await client.GetAsync(loginUrl);
> ```

> **Kết quả mẫu sau warmup đủ 6 services:**
> ```
> HRM.Presentation.Main       : 2026-04-20 10:00:15 (48s)
> HRM.SC.Service.Identity     : 2026-04-20 10:00:35 (38s)
> HRM.SC.Service.Api          : 2026-04-20 10:00:40 (42s)
> ```

---

## Liên kết

- [[wiki/projects/VnPay-Project]] — Context dự án (nhiều services, Kubernetes)
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — Lỗi IIS pool liên quan
- [[wiki/concepts/Net8-Migration]] — Ngữ cảnh .NET 8 migration
