---
title: "Log Review — Gom nhóm log WindowsService và API SC cho dự án Bitex"
date: 2026-05-04
code: 0001
domain: system
module: "Sys_LogReview / HRM.Presentation.Main"
tags:
  - "log-review"
  - "system"
  - "window-service"
  - "api-sc"
  - "bitex"
verified: yes
related:
  - "[[wiki/projects/bitex]]"
---

# Log Review — Gom nhóm log WindowsService và API SC cho dự án Bitex

## Tóm tắt

Hệ thống HRM có trang **Log Review** (`Sys_LogReviewController`) cho phép admin xem log
theo thời gian thực trên giao diện web. Tuy nhiên, mặc định chỉ load được log của
`HRM.Presentation.Main`. Dự án Bitex cần thêm khả năng xem log của **WindowsService**
(`HRM.Presentation.WindowsService`) và **API SC** (`HRM.SC.Service.Api`) cùng một nơi.

## Triệu chứng / Bối cảnh ban đầu

- Trang Log Review chỉ hiển thị các folder log của Main (`~/Log`)
- Folder `...bin\Debug\Log` và `...rvice.ApiLog` không load được khi click mở
- Sau khi expand folder external, UI báo lỗi hoặc không hiển thị sub-item

## Phân tích nguyên nhân

### Root Cause

`ReadDirectoryRoot()` trả về `FullPath` dạng **raw string** (chưa encrypt) cho các node
external (WindowsService, API SC), nhưng `ReadDirectory()` luôn gọi
`fullPath.Decrypt(PasswordFolder)` khi nhận lại từ client → decrypt sai → path không hợp lệ.

### Chuỗi nguyên nhân

```
UI không load được sub-item của external folder
  ← ReadDirectory() decrypt ra path sai
    ← FullPath trả về từ ReadDirectoryRoot() chưa được encrypt (chỉ external nodes)
      ← Main Log nodes cũng chưa encrypt ở root level
```

## Giải pháp đã áp dụng

### Fix 1 — Encrypt FullPath tại ReadDirectoryRoot()

Sửa `Sys_LogReviewController.cs` — encrypt `FullPath` cho **tất cả** entries trả về
từ `ReadDirectoryRoot()`, bao gồm cả Main Log (index==0) và external folders (index>0).

**File:** `Presentation\HRM.Presentation.Main\Controllers\Sys_LogReviewController.cs`

```csharp
// TRƯỚC — FullPath raw, chưa encrypt
entries.AddRange(dir.EnumerateFileSystemInfos()
    .Select(entry => new
    {
        FullPath = entry.FullName,   // ← raw
        ...
    })
    .Where(p2 => Directory.GetFiles(p2.FullPath, "*.json", ...).Any() ...));

entries.Add(new
{
    FullPath = dir.FullName,   // ← raw
    ...
});

// SAU — Encrypt FullPath, decrypt lại khi dùng trong Where()
entries.AddRange(dir.EnumerateFileSystemInfos()
    .Select(entry => new
    {
        FullPath = entry.FullName.Encrypt(PasswordFolder),  // ← encrypted
        ...
    })
    .Where(p2 => Directory.GetFiles(p2.FullPath.Decrypt(PasswordFolder), "*.json", ...).Any()
              || Path.GetExtension(p2.FullPath.Decrypt(PasswordFolder)) == ".json"));

entries.Add(new
{
    FullPath = dir.FullName.Encrypt(PasswordFolder),   // ← encrypted
    ...
});
```

### Fix 2 — Cấu hình LogFolders cho dự án Bitex

Để gom nhóm log của WindowsService và API SC, có 2 cách:

#### Cách A — Tự động detect (mặc định, không cần config)

`GetListRoot()` đã có logic tự tìm các đường dẫn theo thứ tự ưu tiên:

```csharp
var candidatePaths = new[]
{
    Common.GetPathWindowsService("Log"),            // Production
    Common.GetPathWindowsService(@"bin\Debug\Log"), // Debug
    Common.GetPathWindowsService(@"bin\Release\Log"),
    Common.GetPathAPICenter("Log"),
    Common.GetPathAPICenter(@"bin\Debug\Log"),
    Common.GetPathAPICenter(@"bin\Release\Log"),
};
windowServiceLog = string.Join("|", candidatePaths.Where(Directory.Exists));
```

Điều kiện: **các project phải cùng nằm trong 1 solution folder** để
`GetPathWindowsService` / `GetPathAPICenter` resolve đúng bằng cách đi lên parent directory
và tìm folder `HRM.Presentation.WindowsService` / `HRM.SC.Service.Api`.

#### Cách B — Config tường minh trong `web.config` / `appSettings`

Thêm key `LogFolders` với đường dẫn tuyệt đối hoặc tương đối, phân cách bằng `|`:

```xml
<!-- web.config hoặc appSettings của HRM.Presentation.Main -->
<add key="LogFolders"
     value="C:\Deploy\Bitex\HRM.Presentation.WindowsService\Log|C:\Deploy\Bitex\HRM.SC.Service.Api\Log" />
```

Hoặc dùng đường dẫn tương đối so với container folder:

```xml
<add key="LogFolders"
     value="HRM.Presentation.WindowsService\Log|HRM.SC.Service.Api\Log" />
```

> **Ưu tiên:** Nếu `LogFolders` có giá trị → dùng config. Nếu không → auto detect.

## Kết quả kiểm tra
![[Pasted image 20260504105543.png]]

- Verified: yes
- Folder `...bin\Debug\Log` (WindowsService) và `...rvice.ApiLog` (API SC) expand được
- Sub-item hiển thị đúng, có thể chọn file và xem nội dung
- File log rỗng (chỉ có UTF-8 BOM — 3 bytes) → hiển thị "Data Empty" là đúng hành vi

## Hướng mở rộng cho Bitex

1. **Deploy production**: Dùng Cách B (config tường minh) để trỏ đúng path deploy
2. **Multiple environments**: Có thể config khác nhau cho dev/uat/prod qua `web.config` transform
3. **Log rotation**: Hiện tại tất cả file `.json` trong thư mục đều được load — nếu log nhiều
   nên giới hạn theo ngày hoặc thêm filter date trên UI
4. **Security**: `PasswordFolder` encrypt/decrypt đảm bảo client không biết path thật —
   giữ nguyên cơ chế này cho các folder external

## Bài học / Lưu ý

- **Mọi `FullPath` trả về client phải encrypt** — không phân biệt Main Log hay External Log
- `GetPathWindowsService` / `GetPathAPICenter` dùng cơ chế traverse parent directory →
  chỉ hoạt động khi cùng solution, không dùng được khi deploy riêng lẻ → cần Cách B
- File log rỗng (chỉ BOM) là bình thường khi service chưa có lỗi → UI cần xử lý graceful
- `_cacheAssemblyPath` là static dict → path được cache suốt lifetime app pool,
  restart app pool nếu đổi cấu trúc thư mục

## Liên kết

- `Presentation\HRM.Presentation.Main\Controllers\Sys_LogReviewController.cs`
- `Infrastructure\HRM.Infrastructure.Utilities\Common.cs` — `GetPath()`, `GetPathWindowsService()`, `GetPathAPICenter()`
