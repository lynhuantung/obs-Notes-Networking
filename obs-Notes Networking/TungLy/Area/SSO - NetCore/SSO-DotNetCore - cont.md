---
Mã: "25020603-01"
aliases: 
date: "2025-02-03"
time: "10:06"
Week: "06"
tags:
  - daily
---
Để triển khai **SSO (Single Sign-On)** giữa Identity Provider (IdP) của bạn và Web API trong .NET Core 8 và test bằng Postman, bạn có thể làm theo các bước sau:

---

### **1. Thiết lập Identity Provider (IdP)**
Giả sử bạn dùng **Duende IdentityServer** (hoặc **IdentityServer4**) làm IdP.  
**Cài đặt:**
```bash
dotnet add package Duende.IdentityServer
```

**Cấu hình IdP trong `Program.cs`:**
```csharp
using Duende.IdentityServer.Models;

var builder = WebApplication.CreateBuilder(args);

// Thêm IdentityServer
builder.Services.AddIdentityServer()
    .AddInMemoryApiResources(new[]
    {
        new ApiResource("my_api", "My Web API") // Định nghĩa API Resource
    })
    .AddInMemoryClients(new[]
    {
        new Client
        {
            ClientId = "postman_client",
            ClientSecrets = { new Secret("secret".Sha256()) },
            AllowedGrantTypes = GrantTypes.ClientCredentials, // Hoặc GrantTypes.Code, GrantTypes.ResourceOwnerPassword
            AllowedScopes = { "my_api" } // Scope được phép truy cập
        }
    })
    .AddDeveloperSigningCredential(); // Chỉ dùng cho môi trường dev

var app = builder.Build();
app.UseIdentityServer();
app.Run();
```

---

### **2. Thiết lập Web API (Protected Resource)**
Web API cần xác thực token từ IdP.  
**Cài đặt:**
```bash
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer
```

**Cấu hình Web API trong `Program.cs`:**
```csharp
var builder = WebApplication.CreateBuilder(args);

// Thêm JWT Authentication
builder.Services.AddAuthentication("Bearer")
    .AddJwtBearer("Bearer", options =>
    {
        options.Authority = "https://localhost:5001"; // Địa chỉ IdP
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateAudience = true,
            ValidAudience = "my_api" // Phải khớp với ApiResource trong IdP
        };
    });

builder.Services.AddControllers();
var app = builder.Build();

app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();
```

---

### **3. Test SSO bằng Postman**
#### **Bước 1: Lấy token từ IdP**
- **Endpoint:** `POST https://localhost:5001/connect/token`
- **Cấu hình request trong Postman:**
  - **Body (x-www-form-urlencoded):**
    - `grant_type`: `client_credentials` (hoặc `password`, `authorization_code` tùy flow)
    - `client_id`: `postman_client`
    - `client_secret`: `secret`
    - `scope`: `my_api`
  - **Ví dụ với Client Credentials Flow:**
    ```text
    grant_type=client_credentials&client_id=postman_client&client_secret=secret&scope=my_api
    ```

  ![Postman Token Request](https://i.imgur.com/8QZJY7p.png)

- **Kết quả:** Nhận token (access_token) từ IdP.

#### **Bước 2: Gọi Web API với token**
- **Endpoint:** `GET https://localhost:5002/api/protected` (địa chỉ Web API)
- **Header:**
  - `Authorization`: `Bearer <access_token>`

  ![Postman API Request](https://i.imgur.com/4nWjv3G.png)

- **Kết quả:** API trả về dữ liệu nếu token hợp lệ.

---

### **4. Các Flow Phổ Biến**
- **Client Credentials Flow:** Dùng cho machine-to-machine (không có user).
- **Authorization Code Flow:** Dùng cho ứng dụng web có giao diện người dùng.
- **Resource Owner Password Flow:** Dùng cho trusted clients (ví dụ: ứng dụng mobile).

---

### **5. Xử lý Lỗi Thường Gặp**
1. **Lỗi 401 Unauthorized:**
   - Token hết hạn, sai scope, hoặc không đúng audience.
   - Kiểm tra token trên [jwt.io](https://jwt.io) để xác thực thông tin.
2. **Lỗi Kết Nối với IdP:**
   - Đảm bảo IdP và API chạy trên các port khác nhau (ví dụ: IdP ở `5001`, API ở `5002`).
   - Kiểm tra CORS nếu cần.

---

### **6. Ví dụ Code cho API Controller**
```csharp
[ApiController]
[Route("api/[controller]")]
[Authorize] // Yêu cầu xác thực
public class ProtectedController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        return Ok("Bạn đã truy cập thành công!");
    }
}
```

---

### **Tóm tắt Quy Trình**
1. IdP cấp token khi client xác thực.
2. Web API xác thực token từ IdP.
3. Postman dùng token để gọi API.

Hãy chắc chắn cả IdP và Web API đã chạy trước khi test. Bạn có thể tùy chỉnh flow và scope tùy theo yêu cầu dự án!