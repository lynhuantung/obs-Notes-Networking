---
description: "Bug vNPAY1538: API response double-wrap Obj.Data.Data sau migration .NET 8, màn hình chi tiết đơn nghỉ tráng trên mobile — phân tích kỹ thuật."
type: source
domain: system
tags: [net8-migration, api-response, double-wrap, mobile-app, att, vnpay, bug]
source-file: raw/vNPAY1538-ObjDataData-Net8-Bug.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/concepts/Net8-Migration]]"
  - "[[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]]"
  - "[[wiki/sources/Daily-2025-CursorAI-Net8]]"
---

# vNPAY1538 — Lỗi Obj.Data.Data sau .NET 8 Migration

## Tóm tắt

Tài liệu phân tích kỹ thuật bug vNPAY1538 trên dự án VnPay: màn hình mobile App hiển thị danh sách 2 đơn nghỉ đúng, nhưng ấn vào chi tiết bất kỳ đơn nào thì trống. Root cause là cấu trúc API response không đồng nhất sau khi migration .NET Framework → .NET 8 — màn hình Duyệt chỉ đọc `Obj.Data` trong khi API trả về `Obj.Data.Data` (double-wrap). File này là bản phân tích kỹ thuật chi tiết, bổ sung cho RCA `VNPAY1538-RCA-AppChiTietDonNghiTrong`.

## Key Takeaways

- **Double-wrap** xảy ra khi controller tự wrap + Global Response Filter wrap thêm 1 lần nữa
- **3 pattern** gây ra `Obj.Data.Data` sau .NET 8: (1) Filter + Controller đều wrap, (2) migration tool xử lý không đồng nhất, (3) `System.Text.Json` serialize strict hơn `Newtonsoft.Json`
- **Fix nhanh (frontend)**: `const data = response.Data?.Data ?? response.Data` — xử lý được cả single/double-wrap
- **Fix chuẩn (backend)**: thống nhất tất cả endpoint cùng module trả về cùng cấu trúc response
- Sau .NET 8 migration tại VnPay (01/02–31/03/2025), luồng **list → detail** dễ bị lỗi nhất do 2 API endpoint khác nhau có thể dùng Global Filter khác nhau
- **Checklist phòng ngừa**: kiểm tra Global Response Wrapper, controller có tự wrap không, frontend đọc đúng tầng data

## Trích dẫn quan trọng

> Sau khi VnPay chuyển .NET Framework → .NET 8 (01/02–31/03/2025), các lỗi dạng này xuất hiện do: Migration tool xử lý không đồng nhất giữa các controller, thêm Global Response Filter mới trong .NET 8 pipeline, System.Text.Json serialize strict hơn làm lộ ra các double-wrap.

> Fix Frontend (nhanh — ít rủi ro): `const data = response.Data?.Data ?? response.Data;`

> QA: Khi test mobile app sau migration, test luồng **list → detail** bắt buộc — đây là luồng dễ bị lỗi nhất do 2 API khác nhau.

## Liên kết

- [[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]] — RCA chính thức cùng ticket
- [[wiki/concepts/Net8-Migration]] — Quá trình nâng cấp .NET Framework → .NET 8
- [[wiki/projects/VnPay-Project]] — Dự án VnPay HRM .NET 8
- [[wiki/sources/Daily-2025-CursorAI-Net8]] — Daily notes .NET 8 migration VnPay
