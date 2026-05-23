---
description: "Hướng dẫn sử dụng Mockoon để tạo mock API cho dev/tester HRM: import Swagger, cấu hình route, rule điều kiện response và kịch bản test login 5 test case."
type: source
code: mk7r
tags:
  - mockoon
  - api
  - testing
  - tools
domain: system
created: 2026-05-02
updated: 2026-05-02
source-file: src/mockoon_user_guide.md
related:
  - "[[wiki/concepts/AI-DevTools]]"
  - "[[wiki/concepts/HRM-Code-Quality]]"
---

# Source: Mockoon User Guide — Hướng dẫn Mock API

## Tóm tắt

Hướng dẫn sử dụng Mockoon do Tú.Huỳnh biên soạn (02/2024, cập nhật 05/2026), dành cho Dev/Tester trong nhóm HRM. Mockoon là công cụ tạo API giả lập (mock API) chạy local, không cần backend thật. Tài liệu hướng dẫn từ import Swagger, cấu hình route, thiết lập rule điều kiện response (header/body/query), đến kịch bản test login đầy đủ với 5 test case.

## Key Takeaways

- **Import từ Swagger**: copy JSON OpenAPI v3 → Import vào Mockoon — nhanh hơn tạo tay từng route
- **3 thành phần cốt lõi**: Route (path + method) → Response (status + body) → Rule (điều kiện kích hoạt response nào)
- **Rule target**: Header / Query / Body / Params / Cookie — dùng để phân loại request trả đúng response
- **Template helpers**: `{{body 'field'}}`, `{{header 'Authorization'}}`, `{{faker 'internet.email'}}` — dùng trong body response động
- **Response mode**: Random / Sequential / Rules / Disabled — Rules mode quan trọng nhất khi test nhiều kịch bản
- **Flow chuẩn**: Swagger JSON → Import → Config Route → Set Properties → Add Rules → Run → Test Postman

## Trích dẫn quan trọng

> Flow chính: `Swagger → JSON → Import Mockoon → Config Route → Set Properties → Add Rules → Run → Test`

> Rule Properties — `Invert`: Đảo điều kiện (NOT) → bật → kích hoạt khi KHÔNG khớp. Dùng để viết rule "nếu không có Authorization thì trả 401".

> Template helpers dùng trong body: `{{getGlobalVar 'token'}}`, `{{faker 'internet.email'}}`, `{{body 'username'}}` — tạo response động không cần hardcode.

## Liên kết

- [[wiki/concepts/AI-DevTools]] — stack kỹ thuật TungLy, Cursor AI, tooling
- [[wiki/concepts/HRM-Code-Quality]] — quy tắc SE, tooling phát triển HRM
