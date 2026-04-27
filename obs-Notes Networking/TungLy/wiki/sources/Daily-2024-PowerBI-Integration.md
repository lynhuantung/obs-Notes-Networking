---
type: source
tags:
  - power-bi
  - api
  - integration
  - reporting
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-Jul-30/Power Query.md
related:
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/entities/VnPay]]"
---

# Source: Daily 2024 — Power BI + HRM API Integration

## Tóm tắt

Ghi chú tháng 07/2024 về tích hợp Power BI với HRM API thông qua Power Query. Luồng: Power Query lấy Bearer token từ API login → dùng token gọi `API_SP_GET_BANK` → expand cột động → load vào Power BI report. Đây là pattern cho phép khách hàng tự build báo cáo HR mà không cần export Excel.

## Key Takeaways

- **Luồng tích hợp**: Power Query (M language) gọi HRM API 2 bước: (1) POST login → lấy Bearer token, (2) GET/POST data API với header Authorization.
- **API endpoint**: `API_SP_GET_BANK` — store procedure wrapper endpoint trả về JSON; tên theo convention `API_SP_<StoreName>`.
- **Dynamic columns**: Kết quả API có thể có cột động (số cột thay đổi theo cấu hình) → Power Query dùng `Table.ExpandRecordColumn` với danh sách cột động từ first record.
- **Token refresh**: Bearer token có TTL → Power Query phải gọi lại login nếu token hết hạn; hiện tại chưa có auto-refresh, cần refresh manual hoặc re-run query.
- **Ứng dụng thực tế**: Báo cáo quỹ lương, headcount, overtime theo phòng ban — refresh trực tiếp từ Power BI Desktop/Service mà không cần IT xuất file.
- **Giới hạn**: Chỉ dùng GET endpoint hoặc POST với body đơn giản; không hỗ trợ pagination tự động.

## Trích dẫn quan trọng

> **Power Query M — lấy Bearer token:**
> ```powerquery
> let
>     LoginBody = "{""username"":""admin"",""password"":""xxx""}",
>     LoginResponse = Json.Document(Web.Contents("https://hrm.example.com/api/auth/login", [
>         Headers = [#"Content-Type"="application/json"],
>         Content = Text.ToBinary(LoginBody)
>     ])),
>     Token = LoginResponse[access_token]
> in Token
> ```

> **Gọi API với Bearer token:**
> ```powerquery
> let
>     Token = GetToken(),
>     Response = Json.Document(Web.Contents("https://hrm.example.com/API_SP_GET_BANK", [
>         Headers = [Authorization = "Bearer " & Token]
>     ])),
>     Data = Table.FromList(Response, Splitter.SplitByNothing())
> in Data
> ```

> **Convention đặt tên API**: `API_SP_<TênStore>` — mỗi store procedure quan trọng có thể expose qua REST endpoint cùng tên, trả về JSON array.

## Liên kết

- [[wiki/architecture/HRM-System-Architecture]] — Kiến trúc 13 services (bao gồm API layer)
- [[wiki/sources/VnPay-System-Architecture]] — 13 services/sites VnPay, Kubernetes
