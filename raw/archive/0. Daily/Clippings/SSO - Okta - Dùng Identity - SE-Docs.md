---
title: "SSO - Okta - Dùng Identity - SE-Docs"
source: "https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=67897424"
created: 2026-04-28
tags:
  - "document"
like: false
---
## Mục tiêu

---

Hướng dẫn tích hợp Okta làm Single Sign-On (SSO) cho hệ thống HRM.

Phiên bản áp dụng: Xử lý cho version:

- **LOTTEMART\_v8.12.42.01.08**

## Okta là gì?

---

Okta là một **nền tảng quản lý danh tính (Identity Management Platform)** trên đám mây, giúp các tổ chức quản lý người dùng và quyền truy cập một cách an toàn. Okta cung cấp các tính năng chính như:

1. **Single Sign-On (SSO)**: Đăng nhập một lần để truy cập nhiều ứng dụng.
2. **Xác thực Đa Yếu Tố (MFA)**: Bảo mật đăng nhập bằng nhiều lớp xác thực.
3. **User Lifecycle Management**: Tự động hóa việc thêm, xóa, và quản lý người dùng.
4. **API Access Management**: Bảo mật API với OAuth 2.0.
5. **Bảo mật Hybrid và Cloud**: Kết nối và quản lý ứng dụng tại chỗ (on-premises) lẫn ứng dụng đám mây.

Okta hoạt động độc lập và có thể tích hợp với hàng ngàn ứng dụng qua các giao thức tiêu chuẩn như OAuth, OpenID Connect, và SAML.

## Tạo tài khoản Okta developer

---

Tài khoản **Okta Developer** được tạo ra để các lập trình viên và tổ chức có thể phát triển, thử nghiệm, và tích hợp các tính năng quản lý danh tính vào ứng dụng của mình.

1. Truy cập [Okta Developer](https://developer.okta.com/).
2. Nhấn **Sign Up** và điền thông tin để tạo tài khoản Developer (hoặc signIn Google).
3. Sau khi đăng ký thành công, đăng nhập vào dashboard của Okta.

![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-13-56.png?version=1&modificationDate=1748502852082&api=v2)

## Xử lý lỗi (nếu có)

- Lỗi: You are not allowed to access this app. To request access, contact an admin ([link hướng dẫn fix](https://support.okta.com/help/s/question/0D54z0000AFqVLgCQN/you-are-not-allowed-to-access-this-app-to-request-access-contact-an-admin?language=en_US))

**![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-27-43.png?version=1&modificationDate=1748502852073&api=v2)**

- Giải quyết:
	- Đăng nhập vào **Okta Admin Console**.
		- Chọn mục **Security > API**.
		- Trong tab **Authorization Servers**, bạn sẽ thấy danh sách các Authorization Servers, bao gồm:
		- **Default Authorization Server** (thường là mặc định).
				- Các server tùy chỉnh nếu bạn đã cấu hình.

![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-32-5.png?version=1&modificationDate=1748502852065&api=v2)

- - Edit rule

![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-32-58.png?version=1&modificationDate=1748502852053&api=v2)

## Hướng dẫn người dùng cách thực thi URL để tiến hành xác thực đăng nhập thông qua Okta

---

**Mục tiêu**

- Hướng dẫn người dùng cách thực thi URL để tiến hành xác thực đăng nhập thông qua **Okta** và chuyển hướng đến HRM

### URL

```
https://sso.colpal.com/oauth2/default/v1/authorize?client_id=0oa1e1d4his6LZxah358&response_type=code&scope=openid%20profile%20email&redirect_uri=https%3A%2F%2Fhrmportal.as.win.colpal.com%3A3850%2FHome%2FExternalLoginRedirect%2F&state=abc123xyz&prompt=login
```

### Tham Số URL

|  |  |  |
| --- | --- | --- |
| `client_id` | 0oa1e1d4his6LZxah356 | ID của ứng dụng đã đăng ký trên **Okta**. |
| `response_type` | code | Yêu cầu trả về **authorization code** để trao đổi token. |
| `scope` | openid profile email | Phạm vi quyền truy cập (scope) yêu cầu bao gồm `openid`, thông tin `profile` và `email`. |
| `redirect_uri` | https://hrmportal.as.win.colpal.com:3850/Home/ExternalLoginRedirect/ | Đường dẫn để Okta chuyển hướng sau khi xác thực thành công.  URL mã hóa: https%3A%2F% [2Fhrmportal.as.win.colpal.com](http://2fhrmportal.as.win.colpal.com/) %3A3850%2FHome%2FExternalLoginRedirect%2F  Có thể vào web mã hóa url để mã hóa `redirect_uri`: [https://www.urlencoder.io/](https://www.urlencoder.io/) |
| `state` | abc123xyz | Chuỗi trạng thái ngẫu nhiên dùng để bảo vệ chống **CSRF**. |
| prompt | login | Có 2 options: login hoặc none  - Nếu giá trị là login => hệ thống sẽ không nhớ thông tin mật khẩu - Nếu giá trị là none => hệ thống sẽ nhớ thông tin mật khẩu |

---

## Các bước Thực Hiện:

**Bước 1: Đăng nhập Okta**

**Bước 2: Chuyển hướng thành công vào HRM**

## Tạo ứng dụng trên Okta (Web Main)

---

Mục đích: Giúp quản lý Đăng nhập (SSO), Hỗ trợ người dùng đăng nhập một lần cho nhiều ứng dụng.

## Bước 1: Tạo ứng dụng trên Okta

- ****\[Main\_url\]**: url của web main vd: [http://localhost:6100/](https://tl-main.dev.local/)**

**![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-1-42.png?version=1&modificationDate=1748502852113&api=v2)**

1. Trong dashboard của Okta, vào mục **Applications** > **Create App Integration**.
2. Chọn **OIDC - OpenID Connect** và **Web Application**. Nhấn **Next**.
3. Điền các thông tin cần thiết:

![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-2-16.png?version=1&modificationDate=1748502852102&api=v2)

- - **App integration name**: HRM SSO.
		- Đây là tên định danh của ứng dụng trên Okta. Nó giúp bạn quản lý và nhận diện ứng dụng dễ dàng trong dashboard của Okta.
1. - **Sign-in redirect URIs**:gi/Home/ExternalLoginRedirect/.
		- Đây là URL mà Okta sẽ chuyển hướng người dùng sau khi xác thực thành công. Trong môi trường thực tế, bạn cần thay URL này thành địa chỉ của hệ thống HRM triển khai.
		- **Sign-out redirect URIs**: \[Main\_url\] [/Home/ExternalLogoutFromIdp/](http://localhost:6100/Home/ExternalLogoutFromIdp/).
		- Đây là URL mà người dùng sẽ được chuyển hướng tới sau khi đăng xuất khỏi hệ thống. URL này thường dẫn về trang chính của ứng dụng hoặc một trang đăng xuất cụ thể.
		- **Trusted Origins**:
		- Đây là danh sách các URL được Okta tin cậy để thực hiện các yêu cầu liên quan đến API và xác thực. `Base URI` xác định nguồn gốc hợp lệ của ứng dụng để ngăn chặn các yêu cầu từ nguồn không đáng tin cậy.
				- **Base URIs**: **\[Main\_url\]**
2. Cấu hình quyền truy cập (Access):
	- Chọn **Any user in your organization**.
3. Đảm bảo chọn các grant type: **Authorization Code** và **Refresh Token** như trong hình.
4. Nhấn **Save**.

## Bước 2: Lấy thông tin cấu hình từ ứng dụng

1. Sau khi tạo ứng dụng, bạn sẽ được cung cấp:

![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-2-34.png?version=1&modificationDate=1748502852092&api=v2)

- - **Client ID**: Đây là mã định danh của ứng dụng (ví dụ: 0oalhp1z8bgr9wp3u5d7).
		- **Client Secret**: Mã bảo mật của ứng dụng (ví dụ: 53vKiSTZEFWr2JLFjkc1STtyUhsH6t40vAYN8uxxrlabRWkl-R36i26mx7Lgaaq0).
		- **Issuer (Authority URL)**: URL tương ứng với domain Okta của bạn (ví dụ: [https://dev-23053758.okta.com/oauth2/default](https://dev-23053758.okta.com/oauth2/default)). Thông tin authority URL như bên dưới:

![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-12-1_9-43-2.png?version=1&modificationDate=1748502851999&api=v2)

## Bước 3: Kiểm tra đăng nhập trên HRM

1. Chạy ứng dụng HRM trên localhost.
2. Truy cập trang đăng nhập và kiểm tra nút **Sign in with Okta**.

**![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-11-30_11-36-51.png?version=1&modificationDate=1748502852046&api=v2)**

**![](https://confluence.vnresource.net:18001/download/attachments/67897424/image-2024-12-1_9-39-21.png?version=1&modificationDate=1748502852023&api=v2)**

1. Thực hiện đăng nhập bằng tài khoản Okta. Nếu thành công, hệ thống sẽ chuyển hướng về \[Main\_url\] [/Home/ExternalLoginRedirect/](http://localhost:6100/Home/ExternalLoginRedirect/).

## Cấu hình cho bản build có Identity

---

```
"AuthOktaAccount": {
  "Enable": true,
  "DisplayName": "Đăng nhập bằng Okta",
  "Authority": "https://dev-23053758.okta.com/oauth2/default",
  "PostLogoutRedirectUri": "https://tl-ids4.vnrlocal.com/Account/Logout",
  "ClientId": "0oalhp1z8bgr9wp3u5d7",
  "ClientSecret": "6D9abCHBxW7txkzE_KGNA0KjJ6NRWO2Q_CY3o1HzF6LH7agltivAeoy6u8nSgA66"
},
```

## Tài liệu tham khảo

---

- [Okta Developer Documentation](https://developer.okta.com/docs/)