---
Mã:
aliases:
date: 2026-04-20
tags:
  - "#warmup"
  - "#iis"
  - "#StartApplication"
  - "#performance"
  - "#pvcfc_Project"
Project:
---
# Tổng hợp thay đổi — WarmupStatus & Performance Improvement

---

## Mục tiêu

1. Redis HASH `StartApplication_WarmupStatus` ghi đầy đủ **6 services** (trước chỉ có 3)
2. Ghi kèm **thời gian warmup** (vd: `2026-04-20 10:01:27 (52s)`)
3. SC.Api warmup **thực sự query DB** thay vì chỉ scan JIT controller
4. Identity giải quyết **màn hình trắng lần đầu login** sau restart

---

## 1. `HRM.Business.System.Domain\Sys_UserServices.cs`

**Thay đổi:** Thêm đo thời gian Stopwatch và ghi WarmupStatus vào Redis sau khi tất cả task warmup hoàn thành.

```csharp
// Thêm using
using System.Diagnostics;

// Trong InititalEntityFramework():
var sw = Stopwatch.StartNew();

// ... các task t0-t6 như cũ ...

Task.WhenAll(t0, t1, t2, t3, t4, t5, t6).ContinueWith(t =>
{
    sw.Stop();
    try
    {
        if (!string.IsNullOrEmpty(serviceName)
            && Constant.UseRedisSyncData && RedisCaching.TestConnect())
        {
            var duration = (int)sw.Elapsed.TotalSeconds;
            var value = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} ({duration}s)";
            RedisCaching.HashSet("StartApplication_WarmupStatus", serviceName, value);
        }
    }
    catch { }
});
```

---

## 2. Global.asax.cs — 4 services (.NET Framework)

Các file **không thay đổi logic**, chỉ đảm bảo truyền `serviceName` vào `InititalEntityFramework()` đúng. WarmupStatus được ghi tự động bên trong method đó.

|File|serviceName truyền vào|
|---|---|
|`HRM.Presentation.Main\Global.asax.cs`|`"HRM.Presentation.Main"`|
|`HRM.Presentation.EmpPortal\Global.asax.cs`|`"HRM.Presentation.EmpPortal"`|
|`HRM.Presentation.Hr.Service\Global.asax.cs`|`"HRM.Presentation.Hr.Service"`|
|`HRM.Presentation.HrmSystem.Service\Global.asax.cs`|`"HRM.Presentation.HrmSystem.Service"`|

---

## 3. File mới: `HRM.SC.Core.Business\Systems\Sys_WarmupBusinessServices.cs`

**Mục đích:** SC.Api warmup DB thực sự (giống pattern của `Sys_UserServices`).

```csharp
namespace HRM.SC.Core.Business.Systems
{
    public class Sys_WarmupBusinessServices
    {
        public void InititalEntityFramework(string serviceName = "")
        {
            var sw = Stopwatch.StartNew();

            // 6 nhóm Task.Run song song, mỗi nhóm query VnrHrmDataContext
            var t0 = Task.Run(() => { /* Sys_AllSetting, Sys_UserInfo, ... */ });
            var t1 = Task.Run(() => { /* Hre_Profile, Cat_OrgStructure, ... */ });
            // ... t2-t5 ...

            Task.WhenAll(t0, t1, t2, t3, t4, t5).ContinueWith(_ =>
            {
                sw.Stop();
                var duration = (int)sw.Elapsed.TotalSeconds;
                var value = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} ({duration}s)";
                RedisCaching.HashSet("StartApplication_WarmupStatus", serviceName, value);
            });
        }
    }
}
```

**Cũng cập nhật csproj:**

- `HRM.SC.Core.Business.csproj` → thêm `<Compile Include="Systems\Sys_WarmupBusinessServices.cs" />`

---

## 4. `HRM.SC.Service.Api\Global.asax.cs`

**Thay đổi:** Gọi `Sys_WarmupBusinessServices` thay vì chỉ scan JIT.

```csharp
Start(() =>
{
    var service = new HRM.SC.Core.Business.Systems.Sys_WarmupBusinessServices();
    service.InititalEntityFramework("HRM.SC.Service.Api");
});
```

**Cũng cập nhật csproj:**

- `HRM.SC.Service.Api.csproj` → thêm ProjectReference đến `HRM.SC.Core.Business`

```xml
<ProjectReference Include="..\..\Projects\HRM.ServiceCenter\Cores\HRM.SC.Core.Business\HRM.SC.Core.Business.csproj">
  <Project>{3F4D1778-1243-4A7C-AD26-644F7C1B9221}</Project>
  <Name>HRM.SC.Core.Business</Name>
</ProjectReference>
```

---

## 5. `HRM.SC.Service.Identity` — 2 file thay đổi

### 5a. Package mới trong `.csproj`

```xml
<PackageReference Include="Newtonsoft.Json" Version="13.0.3" />
<PackageReference Include="StackExchange.Redis" Version="2.6.122" />
```

### 5b. File mới: `Infrastructure\RedisCaching.cs`

Wrapper Redis cho .NET Core (dùng `StackExchange.Redis`), expose:

- `HashSetAsync(string key, string field, string value)`
- `TestConnect()`
- `UseRedisSyncData` (đọc từ config)

### 5c. `Infrastructure\StartupWarmupService.cs` — sửa lớn

**Thêm dependency injection:**

```csharp
private readonly IHttpClientFactory _httpClientFactory;
private readonly IServer _server;
```

**Warmup song song DB + Razor view:**

```csharp
private void OnApplicationStarted()
{
    _ = Task.Run(async () =>
    {
        var sw = Stopwatch.StartNew();
        await Task.WhenAll(
            WarmupDatabaseAsync(),
            WarmupRazorViewAsync()   // ← MỚI: pre-compile Razor Login view
        );
        sw.Stop();
        await LogWarmupCompleteAsync((int)sw.Elapsed.TotalSeconds);
    });
}
```

**WarmupDatabaseAsync — SPs chạy song song:**

```csharp
var t1 = WarmupSpGetUsersAuthAsync();
var t2 = WarmupSpGetUsersAuthByUserLoginAsync();
var t3 = WarmupSystemConfigAsync();
var t4 = WarmupPersistedGrantsAsync();
await Task.WhenAll(t1, t2, t3, t4);  // ← trước đây sequential
```

**WarmupRazorViewAsync — tự gọi HTTP GET login page:**

```csharp
private async Task WarmupRazorViewAsync()
{
    var feature = _server.Features.Get<IServerAddressesFeature>();
    var address = feature?.Addresses?.FirstOrDefault(...);
    var loginUrl = $"{address}/Account/Login";
    var client = _httpClientFactory.CreateClient("warmup");
    client.Timeout = TimeSpan.FromSeconds(30);
    await client.GetAsync(loginUrl);
}
```

**LogWarmupCompleteAsync — ghi thời gian:**

```csharp
var value = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} ({durationSeconds}s)";
await _redisCaching.HashSetAsync("StartApplication_WarmupStatus", "HRM.SC.Service.Identity", value);
```

---

## Kết quả sau khi áp dụng

Redis HASH `StartApplication_WarmupStatus` sẽ có đủ 6 field:

|Field|Value mẫu|
|---|---|
|`HRM.Presentation.Main`|`2026-04-20 10:00:15 (48s)`|
|`HRM.Presentation.EmpPortal`|`2026-04-20 10:00:52 (55s)`|
|`HRM.Presentation.Hr.Service`|`2026-04-20 10:01:10 (60s)`|
|`HRM.Presentation.HrmSystem.Service`|`2026-04-20 10:01:05 (58s)`|
|`HRM.SC.Service.Api`|`2026-04-20 10:00:40 (42s)`|
|`HRM.SC.Service.Identity`|`2026-04-20 10:00:35 (38s)`|
