---
aliases:
  - Tích hợp Okta vào HRM
date: 28/05/2024
tags:
  - Okta
  - "#colgate"
permalink: "[[20240528_00]]"
---

Để tích hợp Okta vào ứng dụng C# của bạn, bạn có thể sử dụng Okta để xử lý xác thực người dùng và sau đó lưu trữ thông tin người dùng vào cơ sở dữ liệu bằng Entity Framework. Dưới đây là một hướng dẫn cơ bản để bạn có thể làm theo:

### Bước 1: Cấu hình Okta

1. **Tạo một ứng dụng trong Okta**:
    
    - Đăng nhập vào bảng điều khiển quản trị Okta.
    - Tạo một ứng dụng mới và chọn "Web" và "OpenID Connect".
    - Cấu hình URL chuyển hướng (redirect URL) để trỏ tới ứng dụng của bạn (ví dụ: `http://localhost:5000/authorization-code/callback`).
2. **Lấy các thông tin cần thiết**:
    
    - Client ID
    - Client Secret
    - Okta Domain (ví dụ: `dev-123456.okta.com`)

### Bước 2: Thêm các thư viện cần thiết

Bạn sẽ cần thêm các gói thư viện sau vào dự án của bạn:

- `Microsoft.Owin.Security.OpenIdConnect`
- `Microsoft.Owin.Security.Cookies`
- `Microsoft.Owin.Host.SystemWeb`
- `Microsoft.Owin`

Bạn có thể thêm chúng qua NuGet Package Manager:

shell

Sao chép mã

`Install-Package Microsoft.Owin.Security.OpenIdConnect Install-Package Microsoft.Owin.Security.Cookies Install-Package Microsoft.Owin.Host.SystemWeb Install-Package Microsoft.Owin`

### Bước 3: Cấu hình xác thực OWIN

Trong dự án của bạn, thêm lớp `Startup.cs` để cấu hình OWIN middleware cho xác thực Okta:

```csharp
using Microsoft.Owin; 
using Microsoft.Owin.Security.Cookies; 
using Microsoft.Owin.Security.OpenIdConnect; 
using Owin;
using System; 
using System.Threading.Tasks; 

[assembly: OwinStartup(typeof(YourNamespace.Startup))] 
 namespace YourNamespace 
{
    public class Startup
    { 
        public void Configuration(IAppBuilder app)
        { 
            app.UseCookieAuthentication(new CookieAuthenticationOptions { AuthenticationType = "Cookies" }); 
            app.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions 
            {
                ClientId = "YOUR_CLIENT_ID",
                ClientSecret = "YOUR_CLIENT_SECRET", 
                Authority = "https://YOUR_OKTA_DOMAIN/oauth2/default",
                RedirectUri = "http://localhost:5000/authorization-code/callback", 
                ResponseType = "code", Scope = "openid profile email",
                PostLogoutRedirectUri = "http://localhost:5000/", 
                SignInAsAuthenticationType = "Cookies", 
                UseTokenLifetime = false, 
                Notifications = new OpenIdConnectAuthenticationNotifications 
                { 
                    AuthenticationFailed = context => 
                    { 
                        context.HandleResponse(); 
                        context.Response.Redirect("/Home/Error"); 
                        return Task.FromResult(0); 
                    } 
                } 
            }); 
        } 
    }
}
```

### Bước 4: Cấu hình các Controller và Views

Trong controller, bạn có thể kiểm tra trạng thái xác thực của người dùng và lấy thông tin người dùng từ Okta.

csharp

Sao chép mã

```csharp
using System.Web.Mvc;  
namespace YourNamespace.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult Login()
        {
            if (!Request.IsAuthenticated) { HttpContext.GetOwinContext().Authentication.Challenge(); return new HttpUnauthorizedResult(); }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Logout() { HttpContext.GetOwinContext().Authentication.SignOut(); return RedirectToAction("Index", "Home"); }
        public ActionResult Profile() 
        { 
            var claimsIdentity = User.Identity as System.Security.Claims.ClaimsIdentity; 
            if (claimsIdentity != null)
            { 
                var email = claimsIdentity.FindFirst(System.Security.Claims.ClaimTypes.Email)?.Value;
                var name = claimsIdentity.FindFirst(System.Security.Claims.ClaimTypes.Name)?.Value;
                ViewBag.Email = email; ViewBag.Name = name; 
            } 
            return View();
        }
    }
}
```

### Bước 5: Lưu trữ thông tin người dùng vào cơ sở dữ liệu bằng Entity Framework

1. **Tạo các lớp Entity**:


```csharp
public class ApplicationUser 
{  
	public int Id { get; set; }   
	public string OktaId { get; set; }  
	public string Email { get; set; }  
	public string Name { get; set; } 
}
```

2. **Cấu hình DbContext**:



```csharp
using System.Data.Entity; 
public class ApplicationDbContext : DbContext 
{     
	public DbSet<ApplicationUser> Users { get; set; } 
}
```

3. **Lưu thông tin người dùng sau khi xác thực thành công**:


```csharp
using System.Web.Mvc; using System.Linq;  
namespace YourNamespace.Controllers
{
    public class AccountController : Controller 
    { 
        private ApplicationDbContext _context; 
        public AccountController()
        { 
            _context = new ApplicationDbContext(); } 
        public ActionResult Login() 
        { 
            if (!Request.IsAuthenticated) 
            {
                HttpContext.GetOwinContext().Authentication.Challenge();
                return new HttpUnauthorizedResult();
            } 
            var claimsIdentity = User.Identity as System.Security.Claims.ClaimsIdentity;
            if (claimsIdentity != null) 
            {
                var oktaId = claimsIdentity.FindFirst("sub")?.Value;
                var email = claimsIdentity.FindFirst(System.Security.Claims.ClaimTypes.Email)?.Value;
                var name = claimsIdentity.FindFirst(System.Security.Claims.ClaimTypes.Name)?.Value; 
                var user = _context.Users.SingleOrDefault(u => u.OktaId == oktaId); 
                if (user == null) 
                {
                    user = new ApplicationUser { OktaId = oktaId, Email = email, Name = name };
                    _context.Users.Add(user); 
                    _context.SaveChanges();
                }
            } 
            return RedirectToAction("Index", "Home"); 
        } 
        
        public ActionResult Logout() 
        { 
            HttpContext.GetOwinContext().Authentication.SignOut();
            return RedirectToAction("Index", "Home"); 
        }
        public ActionResult Profile() 
        { 
            var claimsIdentity = User.Identity as System.Security.Claims.ClaimsIdentity; 
            if (claimsIdentity != null) 
            { 
                var email = claimsIdentity.FindFirst(System.Security.Claims.ClaimTypes.Email)?.Value;
                var name = claimsIdentity.FindFirst(System.Security.Claims.ClaimTypes.Name)?.Value;
                ViewBag.Email = email; ViewBag.Name = name;
            } 
            return View();
        }
    }
}
```

Với các bước trên, bạn đã tích hợp Okta vào ứng dụng C# của mình và sử dụng Entity Framework để lưu trữ thông tin người dùng vào cơ sở dữ liệu. Hãy đảm bảo rằng bạn đã thay thế các thông tin như `YOUR_CLIENT_ID`, `YOUR_CLIENT_SECRET`, và `YOUR_OKTA_DOMAIN` bằng thông tin thực tế từ Okta của bạn.