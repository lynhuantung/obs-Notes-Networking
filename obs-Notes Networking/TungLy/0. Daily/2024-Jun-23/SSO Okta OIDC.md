---
aliases: 
date: 2024-06-02
permalink: "[[Tích hợp Okta vào HRM]]"
---


Họp Colgate
- Đăng nhập SSO ([SSO - Azure AD | VnR Docs (vnresource.net)](https://docs.vnresource.net/vi/se-docs/Security/sso_azuread))
- OAuth2
	- TenantId
	- ClientID
	- SecretID
	- ProviderName: AzureOpenIdConnect
- Đăng nhập Okta
- Thông tin VnR cần:
	- 

Các bước :
### Đăng nhập SSO bằng Azure:
	 Bước 1:  Đăng ký app từ tài khoản azure
	 Bước 2:  Cấu hình quyền Microsoft Graph trên app vừa tạo
	 Bước 3: Cấp quyền cho app
	Bước 4: cung cấp cho VnR các thông tin (Sử dụng providerName là openIdConnect):
	- TenantId: 
	- ClientID:
	- SecretID:	





```json
{{
  "UseExternalLogin": true,
  "BaseUrl": "https://tl-main.dev.local",
  "RedirectSignIn": "/Home/ExternalLoginRedirect",
  "SignInUrl": "/Home/Login",
  "SignOutUrl": "/Home/Logout",
  "RedirectSignoutFromIdp": "/Home/ExternalLogoutFromIdp",
  "ProviderConfiguration": [
    {
      "Id": "Provider-01",
      "Enabled": true,
      "ProviderName": "AzureOpenIdConnect",
      "DisplayName": "Vnr SSO Main - TL",
      "Tenant": "common",
      "ClientId": "95617df1-1cdb-4c18-a679-d6b3c4f81475"
    }
  ]
  }
```


 Câu hỏi: đăng nhập sso, để đăng nhập okta , cần những thông tin gì? và tôi muốn dùng openidconnect

>[!gemini]+ **Đăng nhập Okta SSO bằng OpenID Connect**
>
>
>**Tiêu đề: Đăng nhập Okta SSO bằng OpenID Connect**
> 
> **Nội dung:**
> 
> Để đăng nhập vào Okta SSO bằng OpenID Connect, bạn cần cung cấp các thông tin sau:
> 
> * Client ID: Mã định danh của ứng dụng của bạn được đăng ký với Okta
> * Client Secret: Mật khẩu của ứng dụng của bạn
> * URL chuyển hướng: URL mà người dùng sẽ được chuyển hướng đến sau khi xác thực
> 
> Ngoài ra, bạn cần thực hiện các bước sau:
> 
> 1. Thiết lập ứng dụng của bạn với Okta và bật xác thực OpenID Connect.
> 2. Lấy Client ID và Client Secret của ứng dụng của bạn.
> 3. Đặt URL chuyển hướng cho ứng dụng của bạn trong cài đặt Okta.
> 4. Trong mã ứng dụng của bạn, sử dụng thông tin này để khởi tạo một đối tượng IdTokenVerifier và xác nhận mã thông báo ID được trả lại từ Okta.
> 
> **Links:**
> 
> * [Tài liệu OpenID Connect của Okta](https://developer.okta.com/docs/concepts/oidc)
> * [Hướng dẫn đăng nhập SSO bằng OpenID Connect của Okta](https://help.okta.com/oie/en-us/Content/Topics/Security/configure-sso/Configure_SSO_with_OpenID_Connect.htm)
> 
> **Keywords:**
> 
> * Đăng nhập SSO
> * Okta
> * OpenID Connect
> * Mã thông báo ID
> * Xác thực
> 
> **Tags:**
> 
> * Xác thực
> * Single Sign-On
> * Okta
> * OpenID

Tôi sắp có cuộc họp về tích hợp đăng nhập sso với okta, tôi cần hỏi những câu hỏi nào và trình bày mô hình nào



