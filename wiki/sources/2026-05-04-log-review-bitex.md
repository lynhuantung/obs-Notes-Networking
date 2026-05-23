---
type: source
description: "Review log hệ thống Bitex sau go-live: phân tích lỗi window service và API-SC, hướng xử lý bug."
code: b4rx
domain: system
tags:
  - "log-review"
  - "system"
  - "window-service"
  - "api-sc"
  - "bitex"
  - "bug-fix"
created: 2026-05-04
updated: 2026-05-04
source-file: raw/Nghiệp vụ HRM/Sys/2026-05-04-log-review-bitex.md
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/concepts/HRM-Log-Monitoring]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
---

# Source: Log Review — Gom nhóm log WindowsService và API SC cho Bitex

## Tóm tắt

Tài liệu kỹ thuật ghi lại quá trình phân tích và fix tính năng **Log Review** (`Sys_LogReviewController`)
trong dự án Bitex (2026). Vấn đề: các folder log của `HRM.Presentation.WindowsService` và
`HRM.SC.Service.Api` không load được trên UI do bug encrypt/decrypt `FullPath`. Đã fix và
cung cấp 2 cách cấu hình gom nhóm log cho dự án Bitex (auto detect và config tường minh).

## Key Takeaways

- **Bug gốc**: `ReadDirectoryRoot()` trả về `FullPath` dạng raw string (chưa encrypt) cho external
  folders, nhưng `ReadDirectory()` luôn gọi `Decrypt()` → path sai → không load được sub-item
- **Fix**: Encrypt `FullPath` cho **tất cả** entries trong `ReadDirectoryRoot()` — cả Main Log lẫn
  external folders — và decrypt lại khi dùng trong `.Where()`
- **Cách A — Auto detect**: `GetListRoot()` tự traverse parent directory để tìm
  `HRM.Presentation.WindowsService/Log` và `HRM.SC.Service.Api/Log` — chỉ hoạt động khi
  cùng solution folder
- **Cách B — Config tường minh**: Thêm key `LogFolders` trong `web.config` với đường dẫn
  tuyệt đối/tương đối, phân cách bằng `|` — **khuyến nghị cho production Bitex**
- **File log rỗng (3 bytes = UTF-8 BOM)** là bình thường khi service không có lỗi → UI hiển thị
  "Data Empty" là đúng hành vi
- `_cacheAssemblyPath` là static dict → restart app pool nếu đổi cấu trúc thư mục

## Trích dẫn quan trọng

> **Mọi `FullPath` trả về client phải encrypt** — không phân biệt Main Log hay External Log.
> `ReadDirectory()` luôn gọi `Decrypt()` nên nếu FullPath chưa encrypt → path rác → forbidden.

> **Cách B (config tường minh) là bắt buộc cho production Bitex** vì các service deploy riêng lẻ,
> không cùng solution folder → `GetPathWindowsService()` không traverse được đúng path.

```xml
<!-- web.config HRM.Presentation.Main — Bitex production -->
<add key="LogFolders"
     value="C:\Deploy\Bitex\HRM.Presentation.WindowsService\Log|C:\Deploy\Bitex\HRM.SC.Service.Api\Log" />
```

> `_cacheAssemblyPath` là static Dictionary → path được cache suốt lifetime app pool.
> Nếu đổi cấu trúc thư mục, phải restart IIS App Pool để xóa cache.

## Liên kết

- [[wiki/projects/Bitex-Project]] — dự án Bitex-AKW, hậu go-live 2026
- [[wiki/concepts/HRM-Log-Monitoring]] — toolkit giám sát log HRM
- [[wiki/architecture/HRM-System-Architecture]] — kiến trúc tổng quan, IIS vs K8s
- File: `Presentation\HRM.Presentation.Main\Controllers\Sys_LogReviewController.cs`
- File: `Infrastructure\HRM.Infrastructure.Utilities\Common.cs`
