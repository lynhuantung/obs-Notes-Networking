![](Sys_TaiLieuLDAP_03_image2.png)

<u>Document History</u>

| **Date** | **Revision** | **Description** | **Prepared by** | **Approved by** |
|:--:|:--:|----|:--:|:--:|
| 15/06/2021 | 1.0 | Create proposal | Tung.Ly@VnResource.vn |  |

<u>Contents</u>

[1. Hướng dẫn sử dụng LDAP [2](#hướng-dẫn-sử-dụng-ldap)](#hướng-dẫn-sử-dụng-ldap)

[1.1 Cấu hình web.config của main và portal [2](#cấu-hình-web.config-của-main-và-portal)](#cấu-hình-web.config-của-main-và-portal)

[1.2 Tạo cấu hình nguồn LDAP [2](#tạo-cấu-hình-nguồn-ldap)](#tạo-cấu-hình-nguồn-ldap)

[1.3 Màn Hình Lấy User Từ Ldap [3](#màn-hình-lấy-user-từ-ldap)](#màn-hình-lấy-user-từ-ldap)

[1.4 Đăng nhập với tài khoản LDAP [4](#đăng-nhập-với-tài-khoản-ldap)](#đăng-nhập-với-tài-khoản-ldap)

[2. WorkFlow [5](#workflow)](#workflow)

[2.1 Cấu Hình Ldap [5](#cấu-hình-ldap)](#cấu-hình-ldap)

[2.2 Worklow [6](#worklow)](#worklow)

# Hướng dẫn sử dụng LDAP

- Để cấu hình đăng nhập bằng LDAP, thực hiện các bước sau đây

> 1\. Cấu hình web.config của main và portal
>
> 2\. Tạo cấu hình nguồn LDAP
>
> 3\. Lấy danh sách user LDAP từ màn hình người dùng
>
> 4\. Đăng nhập tài khoản LDAP

## Cấu hình web.config của main và portal

**Keys trong webconfig project main và portal**

| Key | Ý nghĩa/ Ghi chú |
| --- | --- |
| IsLdapSignIn | Login bằng ldap |
| <add key="IsLdapSignIn" value="true"/> |  |
| LdapSignInSource | Khi có nhiều nguồn LDAP thì cấu hình vào đây các nguồn LDAP.Có thể đặt rỗng |
| <add key="LdapSignInSource" value="@abc.com.vn,"/> |  |

**LdapSignInSource: là danh sách nguồn LDAP, có thể đặt rỗng.**

![](Sys_TaiLieuLDAP_03_image3.png)

## Tạo cấu hình nguồn LDAP

Đường dẫn: Trang chủ \> Hệ thống \> Cấu hình nguồn LDAP

- Màn hình này cho phép cấu hìnhnguồn LDAP, user cấu hình phải có quyền truy cập, xem tất cả nhân viên LDAP.

- \[Optional\]:Nếu công ty có nhiều nguồn LDAP, có thể tạo nhiều nguồn LDAP. Khi cấu hình nhiều nguồn LDAP, chúng ta có thể cấu hình key LdapSignInSource với các nguồn ở bước 1.

![](Sys_TaiLieuLDAP_03_image4.png)

## Màn Hình Lấy User Từ Ldap

- Để tạo tài khoản LDAP, vào màn hình **người dùng**

- Chọn tạo mới từ tài khoản tích hợp

- Thực hiện các bước tạo tài khoản LDAP từ nguồn LDAP đã cấu hình ở bước trên. Sau đó phần quyền cho user

![](Sys_TaiLieuLDAP_03_image5.png)

- Có thể tạo tài khoản LDAP từ tạo mới người dùng. Nếu không chọn cấu hình như hình dưới sẽ hiểu là user thường.

> ![](Sys_TaiLieuLDAP_03_image6.png)

## Đăng nhập với tài khoản LDAP

- Tiến hành đăng nhập với tài khoản LDAP. Chúng ta có thể login tài khoản LDAP hoặc tài khoản thường, tùy theo khi tạo người dùng với loại LDAP hay user thường ở bước trên.

- Nếu webconfig main và portal có cấu hình key LdapSignInSource thì sẽ xuất hiện như hình dưới

![](Sys_TaiLieuLDAP_03_image7.png)

# WorkFlow

## Cấu Hình Ldap

> Thêm bảng Sys_LdapConfig

| LDAP connection setting | Description |
| --- | --- |
| Server type | The type of LDAP server you are synchronizing. Make sure to select the correct type for your LDAP server. GADS interacts with each type of server slightly differently. |
| Connection type | Choose whether to use an encrypted connection. If your LDAP server supports an SSL connection and you want to use it, choose LDAP + SSL. Otherwise, choose Standard LDAP. |
| Host name | Enter the domain name or IP address of your LDAP directory server. Examples: ad.example.com or 10.22.1.1. |
| Port | Specify the host port. The default is 389. Example: 389 |
| Authentication type | The authentication method for your LDAP server If your LDAP server allows anonymous connections and you want to connect anonymously, select Anonymous. Otherwise, select Simple. |
| Authorized user | Enter the user who will connect to the server. This user should have read and execute permissions for the whole subtree. If your LDAP directory server requires a domain for login, include the domain for the user as well. Example: admin1 |
| Password | Enter the password for the authorized user. Passwords are stored in an encrypted format. Example: swordfishX23 |
| Base DN | Enter the Base DN for the subtree to synchronize. Don't include spaces between commas. If you don’t know the Base DN, consult your LDAP administrator or check an LDAP browser. Example: ou=test,ou=sales,ou=melbourne,dc=ad,dc=example,dc=com |

## Worklow

> ![](Sys_TaiLieuLDAP_03_image8.png)
>
> ![](Sys_TaiLieuLDAP_03_image9.png)
