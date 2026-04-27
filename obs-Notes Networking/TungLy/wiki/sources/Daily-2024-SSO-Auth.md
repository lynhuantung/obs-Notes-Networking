---
type: source
tags:
  - sso
  - auth
  - okta
  - adfs
  - azure-ad
  - security
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 0.Daily/2024-May-22, 0.Daily/2024-Jun-23, 0.Daily/2024-Jul-31
related:
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/entities/VnPay]]"
---

# Source: Daily 2024 — SSO & Authentication Patterns

## Tóm tắt

Tổng hợp ghi chú hàng ngày năm 2024 về triển khai SSO cho HRM VnResource: Okta OIDC (Colgate), Azure AD OIDC, ADFS (FIT project), và LDAP. Bao gồm code mẫu C# OWIN Startup.cs, cấu hình auth.config, và logic ẩn/hiện username/password portal theo provider.

## Key Takeaways

- **Okta OIDC (Colgate)**: Dùng OWIN middleware `UseOpenIdConnectAuthentication`. Entity `ApplicationUser` lưu UserID, Email, DisplayName sau xác thực thành công vào DB.
- **Azure AD OIDC**: Cấu hình trong `auth.config` với provider `AzureOpenIdConnect`. Colgate là khách hàng dùng Azure AD.
- **ADFS (FIT project)**: Key `UsingADFS_Azure: true` trong webSettings.json → ẩn username/password form trên portal. Cấu hình `ProviderConfiguration` trong auth.config cho ADFS endpoint.
- **Luồng chung SSO**: Redirect → Identity Provider → callback → tạo/map user HRM → set session cookie → vào app.
- **Tách biệt auth.config**: Mỗi khách hàng có auth.config riêng với provider khác nhau (LDAP, ADFS, Azure, Okta).
- **Portal ẩn login form**: Khi `UsingADFS_Azure: true` → chuyển hướng thẳng sang SSO provider, không hiện form username/password.

## Trích dẫn quan trọng

> **Okta OIDC Startup.cs (OWIN):**
> ```csharp
> app.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions {
>     ClientId = ConfigurationManager.AppSettings["okta:ClientId"],
>     Authority = ConfigurationManager.AppSettings["okta:OrgUri"],
>     RedirectUri = ConfigurationManager.AppSettings["okta:RedirectUri"],
>     Scope = "openid profile email",
>     ResponseType = "code",
>     TokenValidationParameters = new TokenValidationParameters {
>         NameClaimType = "name"
>     },
>     Notifications = new OpenIdConnectAuthenticationNotifications {
>         AuthorizationCodeReceived = async n => {
>             // Exchange code for token, create ApplicationUser, lưu DB
>         }
>     }
> });
> ```

> **ADFS webSettings.json key:**
> ```json
> { "UsingADFS_Azure": true }
> ```
> Khi true → portal HRM ẩn form username/password, redirect thẳng sang ADFS/Azure endpoint.

> **auth.config cho Azure OIDC:**
> ```xml
> <add key="ProviderConfiguration" value="AzureOpenIdConnect" />
> <add key="AzureAD:TenantId" value="..." />
> <add key="AzureAD:ClientId" value="..." />
> ```

## Liên kết

- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực tổng quan (JWT, Identity Server 4, SSO)
- [[wiki/concepts/HRM-Security-Config]] — VnrDecrypt, AllowOrigin, permission cache
- [[wiki/sources/HongNgoc-DanhGia-SSO]] — JWT SSO cho HongNgoc (pattern khác: JWT trực tiếp, không qua Identity Server)
