---
date: 2024-08-31
author: TÚ.HUỲNH
tags: [mockoon, mock-api, testing, daily]
---

# Daily Note — 31/08/2024: Mockoon User Guide

## Context

Ghi lại buổi hướng dẫn sử dụng **Mockoon** để giả lập API trong quá trình phát triển và test HRM.

---

## Summary

Mockoon cho phép tạo mock API nhanh từ Swagger/OpenAPI, config rule response theo header/body/query, và test các kịch bản mà không cần backend thật.

---

## Key Takeaways

- Import Swagger JSON → Mockoon tự tạo route từ `paths`
- Mỗi route có nhiều **response**, kích hoạt bằng **rules** (header, body, query...)
- Rule `Authorization = null` → trả 401; có token → 200
- Dùng **template helpers** (`{{body 'field'}}`, `{{faker '...'}}`...) để dynamic response
- Hỗ trợ regex validation cho email, phone, GUID, length

---

## 1. Giới thiệu

Mockoon là công cụ tạo API giả lập (mock API) giúp:
- Test nhanh không cần backend thật
- Phát hiện lỗi sớm
- Tăng tốc development

---

## 2. Đối tượng sử dụng

### Tester
- Test nhiều kịch bản
- Kiểm tra lỗi bất thường

### Dev / Triển khai
- Test sớm khi chưa có API thật
- Giảm phụ thuộc hệ thống ngoài

---

## 3. Import môi trường từ Swagger

### Bước:
1. Mở Swagger API
2. Copy file JSON
3. Vào Mockoon:
   - Import / Export
   - Import Swagger (OpenAPI v3)
4. Chọn file JSON

---

## 4. Edit JSON Swagger

- Giữ lại API cần dùng trong `paths`
- Xóa API không cần thiết

---

## 5. Cấu hình API

### Step 1: Tạo route
- Add route
- Mặc định có response 200

### Step 2: Thêm response 401
- Duplicate response
- Đổi status = 401

### Step 3: Thêm rule
- Header: Authorization
- Condition: null

---

## 6. Properties của Route

Mỗi route trong Mockoon có các property sau:

### Route Properties

| Property | Mô tả | Ví dụ |
|----------|-------|-------|
| `Method` | HTTP method | GET, POST, PUT, DELETE |
| `Path` | Đường dẫn endpoint | `/api/login` |
| `Documentation` | Ghi chú nội dung route | "API đăng nhập" |
| `Response mode` | Cách chọn response | Random / Sequential / Rules / Disabled |

### Response Properties

| Property | Mô tả | Ví dụ |
|----------|-------|-------|
| `Label` | Tên response | "Success 200", "Unauthorized 401" |
| `Status code` | HTTP status trả về | 200, 400, 401, 404, 500 |
| `Headers` | Response headers | `Content-Type: application/json` |
| `Body` | Nội dung response (JSON/Text/File) | `{"success": true}` |
| `Latency` | Độ trễ giả lập (ms) | 500 |
| `Send file` | Trả về file thay vì body text | `response.json` |

### Rule Properties

| Property | Mô tả | Ví dụ |
|----------|-------|-------|
| `Target` | Vị trí kiểm tra | `Header`, `Query`, `Body`, `Params`, `Cookie` |
| `Modifier` | Tên field cần kiểm tra | `Authorization`, `username`, `token` |
| `Operator` | Loại so sánh | `equals`, `regex`, `null`, `empty_array` |
| `Value` | Giá trị so sánh | `Bearer abc`, `^[A-Za-z]+$` |
| `Invert` | Đảo điều kiện (NOT) | bật → kích hoạt khi KHÔNG khớp |

### Environment Properties

| Property | Mô tả | Ví dụ |
|----------|-------|-------|
| `Name` | Tên môi trường | "HRM Dev", "HRM UAT" |
| `Port` | Port server lắng nghe | 3001 |
| `Host` | Host binding | `localhost`, `0.0.0.0` |
| `TLS` | Bật HTTPS | bật / tắt |
| `Prefix` | Tiền tố chung cho tất cả route | `/api/v1` |

### Template Helpers

```
{{body 'username'}}
{{queryParam 'page'}}
{{header 'Authorization'}}
{{routeParam 'id'}}
{{faker 'internet.email'}}
{{getGlobalVar 'token'}}
{{setGlobalVar 'token' 'abc123'}}
```

---

## 7. Chạy server

- Cấu hình:
  - Host: localhost
  - Port: tùy chọn
  - TLS nếu cần HTTPS
- Nhấn Run

### Test Postman:
- Không có Authorization → 401
- Có Authorization → 200

---

## 8. Rules validation

| Loại | Regex |
|------|-------|
| Length | `^[0-9a-zA-Z]{3,7}$` |
| Email | `^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$` |
| Phone | `^\+?[1-9][0-9]{7,14}$` |
| GUID | `^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |

---

## 9. Kịch bản Login

### Request
```json
{
  "username": "abc",
  "password": "123"
}
```

### Response 200
```json
{
  "success": true,
  "message": "Đăng nhập thành công"
}
```

### Response 401
```json
{
  "success": false,
  "message": "Sai tài khoản hoặc mật khẩu"
}
```

### Response 400
```json
{
  "success": false,
  "message": "Vui lòng nhập đầy đủ thông tin"
}
```

---

## 10. Test Cases

| TC | Mô tả | Input | Output |
|----|-------|-------|--------|
| TC01 | Login đúng | user/pass đúng | 200 |
| TC02 | Sai username | user sai | 401 |
| TC03 | Sai password | pass sai | 401 |
| TC04 | Empty username | `""` | 400 |
| TC05 | Empty password | `""` | 400 |

---

## Tổng kết

```
Swagger → JSON → Import Mockoon → Config Route → Set Properties → Add Rules → Run → Test
```
