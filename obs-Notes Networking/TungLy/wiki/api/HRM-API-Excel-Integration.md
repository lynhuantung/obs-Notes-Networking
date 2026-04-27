---
type: api
domain: system
tags:
  - api
  - excel
  - power-query
  - bearer-token
  - integration
  - sql-server
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/sources/Sys-TaiLieuGetAPIToExcel-07]]"
  - "[[wiki/sources/Daily-2024-PowerBI-Integration]]"
---

# HRM API → Excel Integration

Hướng dẫn kỹ thuật lấy dữ liệu HRM ra Excel qua 3 phương pháp.

---

## Phương pháp 1 — HRM REST API + Power Query (Bearer Token)

### Yêu cầu
- Excel 2016+ (native Power Query); phiên bản cũ cần addon
- Có tài khoản HRM với quyền truy cập API

### Bước 1 — Lấy token

**Endpoint:** `POST /Token`

```
Headers:
  Content-Type: application/x-www-form-urlencoded
  Accept: /

Body (form-encoded):
  grant_type = password
  username   = <tên đăng nhập>
  password   = <mật khẩu>
```

**Response:**
```json
{ "access_token": "eyJ...", "token_type": "bearer", "expires_in": ... }
```

### Bước 2 — Lấy dữ liệu

**Endpoint:** `GET /api/{Entity}/Get`

| Param | Mô tả |
|-------|-------|
| `PageIndex` | Trang (bắt đầu từ 1) |
| `PageSize` | Số record (thường 10000) |
| `IsCurrentUpdate` | Lọc theo cập nhật gần nhất |

**Header:** `Authorization: Bearer <access_token>`

**Ví dụ:** `GET /api/Hre_Profile/Get?PageIndex=1&PageSize=10000&IsCurrentUpdate=0`

### Power Query M Code

```
let
  url = "https://<host>/Token",
  headers = [#"Content-Type" = "application/x-www-form-urlencoded", #"Accept" = "/"],
  postData = [
    grant_type = "password",
    username = "<user>",
    password = "<pass>"
  ],
  tokenResponse = Json.Document(Web.Contents(url, [
    Headers = headers,
    Content = Text.ToBinary(Uri.BuildQueryString(postData))
  ])),
  token = tokenResponse[access_token],
  Source = Json.Document(Web.Contents(
    "https://<host>/api/Hre_Profile/Get?PageIndex=1&PageSize=10000&IsCurrentUpdate=0",
    [Timeout=#duration(0, 0, 15, 0), Headers=[Authorization="Bearer " & token]]
  ))
in
  Source
```

### Bước 3 → 6 trong Excel
1. **Data > Get Data > From Other Sources > Blank Query**
2. Mở **Advanced Editor** → nhập M code trên
3. Click **"List"** trong Power Query Editor
4. Phải chuột **"List" > To Table > OK**
5. Expand columns: chọn field cần hiển thị, bỏ prefix
6. **Close & Load** → dữ liệu ra sheet Excel
7. **Refresh** khi cần lấy dữ liệu mới nhất

---

## Phương pháp 2 — SQL Server Direct Query

**Excel > Data > Get Data > From Database > From SQL Server**

```sql
SELECT * FROM Hre_Profile WHERE IsDelete = 0
```

- Kết nối trực tiếp SQL Server với user/pass
- Phù hợp khi có quyền DB trực tiếp

---

## Phương pháp 3 — Store Procedure

```sql
exec hrm_cat_sp_get_Bank null, null, 0, 1, 2000, 'hanh.nguyen', 'id'
```

- Kết nối SQL Server → chọn **Native Database Query**
- Gọi store procedure trực tiếp
- Tham số: `null, null, CompanyID, PageIndex, PageSize, UserLogin, SortField`

---

## Use cases

| Tình huống | Phương pháp phù hợp |
|-----------|---------------------|
| Import dữ liệu có ID không có FK | API (lấy về Excel xử lý rồi import lại) |
| Báo cáo custom cho KH | SQL Direct hoặc Store |
| KH muốn tự refresh dữ liệu | API Power Query (bấm Refresh) |
| Power BI integration | API Bearer Token (tương tự) |

---

## Liên kết

- [[wiki/sources/Sys-TaiLieuGetAPIToExcel-07]] — Tài liệu gốc
- [[wiki/sources/Daily-2024-PowerBI-Integration]] — Power BI + HRM API Bearer token
