---
type: source
description: "Nhật ký 2025 về Cursor AI và migration .NET 8: ghi chú hàng ngày từ Dec 2024 đến Apr 2025."
tags:
  - daily-2025
  - dotnet8
  - cursor-ai
  - migration
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 3.ARCHIEVED/Daily-2025/ (2024-Dec, 2025-Jan, Feb, Mar, Apr)
related:
  - "[[wiki/concepts/AI-DevTools]]"
  - "[[wiki/concepts/Net8-Migration]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# Source: Daily 2025 — Cursor AI, .NET 8, Inoac, VnPay

## Tóm tắt

Tổng hợp ghi chú Daily tháng 12/2024 – 04/2025: (1) Cursor AI — Memory Bank, .cursorrules, Plan/Act mode; (2) .NET 8 migration — `FormCollection` → `IFormCollection` với Extension Method; (3) Công việc thường nhật: VnPay check link, TrungDong, Inoac máy chấm công, TVC, SSO VnPay.

## Key Takeaways

### Cursor AI & Memory Bank (04/2025)
- **Memory Bank là gì**: Sau mỗi session, Cursor reset hoàn toàn → phụ thuộc 100% vào Memory Bank (6 core files: `projectbrief`, `productContext`, `systemPatterns`, `techContext`, `activeContext`, `progress`).
- **Plan Mode**: Đọc Memory Bank → kiểm tra đủ context → lập chiến lược → trình bày.
- **Act Mode**: Check Memory Bank → update docs → update `.cursorrules` → execute → document changes.
- **`.cursorrules`**: Nhật ký học tập — ghi lại patterns, thói quen người dùng, implementation paths đặc thù của project.
- **Ứng dụng HRM**: Memory Bank phù hợp với wiki HRM — mỗi project nên có `projectbrief.md` riêng để Cursor (hoặc LLM) hiểu bối cảnh ngay khi bắt đầu session mới.

### .NET 8 Migration — FormCollection (03/2025)
- **Vấn đề**: `FormCollection` bị loại bỏ trong ASP.NET Core 8 — cần thay bằng `IFormCollection`.
- **Giải pháp không phá code cũ**: Tạo Extension Method `FormCollectionExtensions.cs`:
  ```csharp
  public static string GetValue(this IFormCollection fc, string key)
      => fc.ContainsKey(key) ? fc[key].ToString() : null;
  public static IEnumerable<string> AllKeys(this IFormCollection fc)
      => fc.Keys;
  ```
- **Migration pattern**: Find & Replace toàn solution `FormCollection` → `IFormCollection`, xóa `.AttemptedValue` (không còn cần), dùng extension method mới.
- **Áp dụng VnPay**: File `SaveOrUpdate` controller dùng `FormCollection` nhiều → áp dụng pattern này trong .NET 8 migration.

### Công việc thường nhật (Jan–Feb 2025)
- **VnPay (01/2025)**: Hỗ trợ check link — lỗi do quét virus xóa DLL; SSO VnPay đang xử lý.
- **TrungDong (01/2025)**: Xử lý dự án song song với VnPay.
- **Inoac (02/2025)**: Xử lý trùng data khi tải dữ liệu máy chấm công.
- **TVC (02/2025)**: Dự án mới xuất hiện — chưa có entity.

## Trích dẫn quan trọng

> **Memory Bank triết lý**: "Memory resets completely between sessions. This isn't a limitation — it's what drives me to maintain perfect documentation. The Memory Bank is my only link to previous work."

> **FormCollection extension**:
> ```csharp
> // Trước (FormCollection):
> string tableName = formCollection.GetValue("hiddenTableName").AttemptedValue;
> // Sau (IFormCollection + extension):
> string tableName = formCollection.GetValue("hiddenTableName");
> ```

> **VnPay DLL bug**: "Lỗi do quét virus bị xóa DLL" — cần whitelist thư mục HRM trong antivirus.

## Liên kết

- [[wiki/concepts/AI-DevTools]] — Cursor AI, Memory Bank (mở rộng)
- [[wiki/concepts/Net8-Migration]] — Quá trình nâng cấp .NET Framework → .NET 8
- [[wiki/projects/VnPay-Project]] — Triển khai HRM .NET 8 VnPay
