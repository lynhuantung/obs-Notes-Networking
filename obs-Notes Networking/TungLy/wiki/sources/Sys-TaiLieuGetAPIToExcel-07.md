---
type: source
domain: system
tags:
  - sys
  - api
  - excel
  - power-query
  - bearer-token
  - integration
created: 2026-04-27
updated: 2026-04-27
source-file: raw/Nghiệp vụ HRM/SYS/Sys_TaiLieuGetAPIToExcel_07.md
related:
  - "[[wiki/api/HRM-API-Excel-Integration]]"
  - "[[wiki/sources/Daily-2024-PowerBI-Integration]]"
---

# Source: Lấy Dữ Liệu HRM API → Excel (07)

## Tóm tắt

Hướng dẫn kỹ thuật lấy dữ liệu HRM ra Excel qua **3 phương pháp**: (1) HRM REST API qua Power Query với Bearer token; (2) kết nối SQL Server trực tiếp; (3) gọi Store Procedure từ Excel. Viết bởi Tung.Ly vào 05/2022. Giải quyết bài toán import dữ liệu có ID nhưng không có khóa ngoại — lấy về Excel xử lý rồi import lại. Yêu cầu Excel 2016+ hoặc cài addon; sử dụng Power Query M language.

## Key Takeaways

- **3 phương pháp lấy dữ liệu vào Excel**:
  1. **HRM API + Bearer Token** (Power Query): POST `/Token` lấy `access_token` → GET `/api/Hre_Profile/Get?PageIndex=1&PageSize=10000` với `Authorization: Bearer <token>`
  2. **SQL Server Direct**: kết nối SQL Server, viết câu SELECT trực tiếp
  3. **Store Procedure**: `exec hrm_cat_sp_get_Bank null,null,0,1,2000,'hanh.nguyen','id'`
- **Power Query M code pattern**: lấy token POST → parse JSON → dùng token GET dữ liệu → `Json.Document(Web.Contents(...))` → expand columns
- **Token endpoint**: `/Token` với `grant_type=password`, `username`, `password` → trả về `access_token`
- **API data endpoint**: `/api/{Entity}/Get` với params `PageIndex`, `PageSize`, `IsCurrentUpdate`
- **Refresh**: nếu dữ liệu cũ → bấm Refresh trong Excel để gọi lại API lấy mới nhất
- **Giới hạn**: Excel 2016+ native support Power Query; phiên bản cũ hơn cần addon

## Trích dẫn quan trọng

> Giải quyết vấn đề import đối với những bảng trong database có ID nhưng không có khóa ngoại và cho phép get API (theo loại token là Bearer) từ HRM để giải quyết những vấn đề get dữ liệu theo mong muốn khách hàng.

> ```
> tokenResponse = Json.Document(Web.Contents(url, [Headers = headers, Content = Text.ToBinary(Uri.BuildQueryString(postData))])),
> token = tokenResponse[access_token],
> Source = Json.Document(Web.Contents("https://.../api/Hre_Profile/Get?...", [Headers=[Authorization="Bearer " & token]]))
> ```

> Excel cho phép kết nối SQL Server và load dữ liệu từ store procedure: `exec hrm_cat_sp_get_Bank null,null,0,1,2000,'hanh.nguyen','id'`

## Liên kết

- [[wiki/api/HRM-API-Excel-Integration]] — Tài liệu API chi tiết
- [[wiki/sources/Daily-2024-PowerBI-Integration]] — Power BI + HRM API Bearer token (tương đồng)
