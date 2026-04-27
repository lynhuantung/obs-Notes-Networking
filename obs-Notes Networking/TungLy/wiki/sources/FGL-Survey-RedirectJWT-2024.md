---
type: source
tags:
  - fgl
  - survey
  - sso
  - redirect
  - jwt
  - meeting
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 1.Projects/FGL/H-FGL-SUR-160924.md
related:
  - "[[wiki/sources/MultiProject-SYS-Meetings-2024]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/sources/Daily-2024-SSO-Auth]]"
---

# Source: FGL SUR — Tích Hợp Survey Qua Redirect JWT (16/09/2024)

## Tóm tắt

Biên bản họp FGL ngày 16/09/2024 về giải pháp tích hợp web Survey bên ngoài với HRM VnResource. Vấn đề cốt lõi: hai web khác domain không thể chia sẻ session trực tiếp. Giải pháp: dùng **redirect qua HRM trung gian + JWT token** chứa thông tin người dùng.

## Key Takeaways

- **Vấn đề**: Web survey (FGL, domain khác) cần kiểm tra user đã đăng nhập HRM chưa. Do cross-domain → không share session cookie được.
- **Giải pháp cũ (thất bại)**: Web survey gọi API HRM để check login → không hoạt động vì browser không gửi cookie HRM sang domain khác.
- **Giải pháp mới — Redirect flow**:
  1. User vào web survey → survey redirect sang HRM `/SurveyAuthen/Index`
  2. HRM kiểm tra session:
     - **Chưa đăng nhập** → redirect sang `/New_Login/New_Index`
     - **Đã đăng nhập** → tạo JWT token (CodeEmp, ProfileName, OrgstructureName) → redirect về survey kèm token
  3. Survey nhận token → xác thực → cho vào
- **URL pattern**:
  ```
  https://cs01.vnresource.net:2104/SurveyAuthen/Index
    ?surveyURL=https://fgl-survey.fashiongarments.com:3000/Login/index
    ?lang=&token=
    &urlHRM=https://cs01.vnresource.net:2104/New_Login/New_Index
  ```
- **Payload JWT**: `CodeEmp`, `ProfileName`, `OrgstructureName` — đủ để survey biết ai đang dùng.
- **Pattern tái dụng**: Bất kỳ web ngoài HRM nào cần xác thực user HRM → dùng pattern `SurveyAuthen/Index` làm gateway.
- **Khác với SSO OIDC**: Đây là SSO đơn giản qua redirect, không cần Identity Server — phù hợp cho tích hợp nhanh với web bên thứ ba.

## Trích dẫn quan trọng

> **Nguyên lý**: "Khi người dùng vào web khảo sát, sẽ được redirect sang HRM để kiểm tra đăng nhập. Nếu chưa đăng nhập: HRM chuyển hướng đến trang đăng nhập HRM. Nếu đã đăng nhập: HRM chuyển hướng lại web khảo sát kèm theo token chứa thông tin người dùng."

> **Code mẫu redirect**:
> ```js
> location.href = 'https://cs01.vnresource.net:2104/SurveyAuthen/Index'
>   + '?surveyURL=https://fgl-survey.fashiongarments.com:3000/Login/index?lang=&token='
>   + '&urlHRM=https://cs01.vnresource.net:2104/New_Login/New_Index'
> ```

## Liên kết

- [[wiki/sources/MultiProject-SYS-Meetings-2024]] — FGL survey redirect+token (phiên tổng hợp)
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực: JWT, SSO, Identity Server
- [[wiki/sources/Daily-2024-SSO-Auth]] — Okta, ADFS, Azure AD patterns so sánh
