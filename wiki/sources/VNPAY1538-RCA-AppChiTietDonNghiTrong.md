---
description: "RCA ticket VNPAY1538: màn hình Duyệt đọc sai Obj.Data thay vì Obj.Data.Data sau .NET 8 Global Response Filter — phân tích 5 Whys và fix."
type: source
domain: attendance
tags:
  - rca
  - nhatkyvande
  - net8-migration
  - mobile-app
  - att
  - vnpay
  - api-response
  - double-wrap
created: 2026-04-28
updated: 2026-04-28
source-file: raw/Nghiệp vụ HRM/App/VNPAY1538-RCA-AppChiTietDonNghiTrong-20260428.md
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/concepts/Net8-Migration]]"
  - "[[wiki/sources/Daily-2025-CursorAI-Net8]]"
  - "[[wiki/synthesis/monthly-rca-2026-04]]"
---

# Source: VNPAY1538 — RCA App Hiển Thị Chi Tiết Đơn Ngày Nghỉ Trống

## Tóm tắt

> Tài liệu RCA cho ticket VNPAY1538 phát sinh ngày 28/04/2026 trên Mobile App VnPay. Màn hình danh sách ngày nghỉ hiển thị đúng 2 đơn nhưng ấn vào chi tiết thì trống hoàn toàn. Nguyên nhân gốc rễ là sự **không đồng nhất cách parse API response** giữa màn hình Đăng ký (`Obj.Data.Data`) và màn hình Duyệt (`Obj.Data`) — hệ quả của việc thêm Global Response Wrapper Filter sau khi nâng cấp lên .NET 8 mà không cập nhật đồng bộ toàn bộ frontend. Ticket được ghi nhận bởi user `hangnt13@vnpay.vn` trong giai đoạn post go-live.

## Key Takeaways

- **Pattern double-wrap**: Sau .NET 8 migration, `GlobalResponseFilter` wrap thêm 1 tầng `{ Data: ... }` lên tất cả response — nếu controller đã tự wrap thì kết quả là `Obj.Data.Data` thay vì `Obj.Data`
- **Lỗi silent**: Frontend đọc `Obj.Data` vẫn nhận được giá trị (là object wrapper) nên không throw error — chỉ render trống, rất khó debug
- **Luồng list→detail là high-risk**: Màn hình danh sách và chi tiết thường gọi 2 API khác nhau — nếu 2 API có response shape khác nhau, lỗi sẽ không lộ ra ở list mà chỉ lộ ở detail
- **Short-term fix**: `const data = response.Data?.Data ?? response.Data` — fallback an toàn cho cả 2 trường hợp single/double wrap
- **Root cause thực sự**: Không có Response Shape Contract chung — mỗi màn hình tự parse độc lập, thiếu integration test cho luồng list→detail

## Trích dẫn quan trọng

> **Root Cause:** Cấu trúc API response KHÔNG đồng nhất giữa 2 màn hình: màn hình Đăng ký parse đúng `Obj.Data.Data`, màn hình Duyệt chỉ đọc `Obj.Data` → nhận được object wrapper thay vì data thực → render trống.

> **GlobalResponseFilter pattern:**
> ```csharp
> // Controller đã tự wrap:
> return Ok(new ApiResponse { Data = data });
> // Filter bọc thêm 1 tầng:
> // → { "Data": { "Data": [...] } }  ← Obj.Data.Data
> ```

> **Checklist sau .NET 8 migration:**
> - API response có `Obj.Data.Data` hay `Obj.Data`?
> - Có Global Response Wrapper Filter không?
> - Controller có tự wrap response không?
> - Frontend đang đọc đúng tầng data?
> - Có test tự động cho luồng list→detail không?

## Phân tích 5 Whys

| # | Câu hỏi | Trả lời |
|---|---------|---------|
| W1 | Tại sao màn hình trống? | Frontend không render được data |
| W2 | Tại sao không render được? | Đọc sai tầng: `Obj.Data` thay vì `Obj.Data.Data` |
| W3 | Tại sao đọc sai tầng? | Màn hình Duyệt code theo cấu trúc cũ, Đăng ký đã cập nhật |
| W4 | Tại sao không đồng nhất? | .NET 8 thêm Global Response Filter — không cập nhật frontend đồng bộ |
| W5 | Tại sao không phát hiện sớm? | Không có integration test tự động cho luồng list→detail |
| **Root** | **Nguyên nhân gốc rễ** | **Không có Response Shape Contract chung — mỗi màn hình tự parse độc lập** |

## Liên kết

- `[[wiki/projects/VnPay-Project]]` — dự án phát sinh bug
- `[[wiki/concepts/Net8-Migration]]` — context kỹ thuật của pattern double-wrap
- `[[wiki/sources/Daily-2025-CursorAI-Net8]]` — ghi chú .NET 8 migration hàng ngày
- `[[wiki/synthesis/monthly-rca-2026-04]]` — báo cáo PDCA tháng 04/2026
