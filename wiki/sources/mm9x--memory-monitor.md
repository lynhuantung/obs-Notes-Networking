---
type: source
code: mm9x
domain: system
tags:
  - system
  - memory-monitor
  - static-field
  - gc
  - net8
  - superadmin
  - observability
created: 2026-05-20
updated: 2026-05-20
description: Kiến trúc đầy đủ Sys_MemoryMonitor — giám sát static fields, GC diagnostics, multi-pod, snapshot/compare, xóa field từ xa trên HRM .NET 8.
source-file: raw/archive/Area/Hệ Thống/mm9x--memory-monitor.md
related:
  - "[[wiki/architecture/mm9x--memory-monitor]]"
  - "[[wiki/concepts/HRM-IIS-Troubleshooting]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/p9k2w-k8s-hrm-service-architecture]]"
---

# Source: Sys_MemoryMonitor — Giám sát Bộ nhớ Runtime

## Tóm tắt

Tài liệu mô tả kiến trúc kỹ thuật đầy đủ của tính năng `Sys_MemoryMonitor` — công cụ nội bộ dành riêng cho SuperAdmin để giám sát bộ nhớ runtime trên hệ thống HRM .NET 8. Hệ thống quét static fields bằng Reflection, ước tính kích thước qua JSON serialization, thu thập GC metrics qua `System.Diagnostics`, và hỗ trợ xóa field từ xa với GC.Collect forced. Được xây dựng ngày 20/05/2026 bởi TungLy như một tooling observability nội bộ, hỗ trợ môi trường k8s multi-pod.

## Key Takeaways

- **3 utility classes** độc lập trong `HRM.Infrastructure.Utilities`: `StaticFieldScanner`, `GcDiagnosticsScanner`, `StaticFieldCleaner` — zero external dependency ngoài Newtonsoft.Json
- **Multi-pod collection**: UI gọi N lần qua LB, phân biệt pod bằng `HOSTNAME` env var (k8s inject tự động) — không cần service discovery
- **Ước tính size bằng JSON serialize** (MaxDepth=3) — không chính xác tuyệt đối, chỉ dùng để so sánh tương đối
- **Snapshot/Compare + Stale detection**: field ≥ 100KB không đổi sau snapshot → đánh dấu `stale?` → dấu hiệu memory leak
- **ClearStaticField**: ưu tiên `.Clear()` cho collection (an toàn hơn `= null`), sau đó ép `GC.Collect(2, Forced)` × 2 trong background thread
- **Auth propagation khi forward**: Bearer token từ header → Session token — không expose internal endpoints ra ngoài
- **Sensitive data protection**: field/type chứa keyword `password/token/connectionstring/apikey...` → `[REDACTED]`
- **Hạn chế NET8**: `AspNetCacheItemCount` luôn = 0 vì không có `HttpRuntime.Cache` — cần `IMemoryCache` inject riêng
- **Technical debt**: `new HttpClient()` mỗi lần forward thay vì `IHttpClientFactory` — risk socket exhaustion

## Trích dẫn quan trọng

> `PodId = Environment.GetEnvironmentVariable("HOSTNAME") ?? Environment.GetEnvironmentVariable("POD_NAME") ?? Environment.MachineName;`
> — Cơ chế nhận dạng pod: k8s set HOSTNAME tự động, không cần config thêm.

> Collection: gọi `.Clear()` thay vì set null (an toàn hơn) — object bên trong được giải phóng dần qua GC mà không gây NullReferenceException cho code khác đang hold reference.

> Sau khi xóa: `GC.Collect(2, GCCollectionMode.Forced)` × 2 + `WaitForPendingFinalizers()` — delay 200ms trước để các thread đang dùng field kịp hoàn thành.

> Ngưỡng cảnh báo: Managed Heap > 500MB → warn; GC Gen2 > 50 lần → warn (object sống lâu chiếm heap); ThreadPool worker > 70% max → risk nghẽn request.

## Liên kết

- [[wiki/architecture/mm9x--memory-monitor]] — trang architecture đầy đủ
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — troubleshooting OutOfMemory IIS
- [[wiki/architecture/HRM-System-Architecture]] — kiến trúc tổng quan HRM
- [[wiki/architecture/p9k2w-k8s-hrm-service-architecture]] — kiến trúc K8s services
