---
Mã: 25031111-01
aliases: 
date: 2025-03-11
time: 17:32
Week: "11"
tags:
  - daily
Liên kết:
  - "[[Upgrade Net8 - Weekly]]"
---
**Mô hình biên dịch (Compiled Models)** trong Entity Framework Core (EF Core) được thiết kế nhằm tối ưu hóa thời gian khởi động của ứng dụng, đặc biệt với các ứng dụng có mô hình dữ liệu lớn (hàng trăm đến hàng nghìn entity và quan hệ). Dưới đây là những điểm chi tiết về tính năng này:

### 1. **Cách hoạt động**
- Khi ứng dụng thực hiện hoạt động với EF Core lần đầu tiên (như thêm dữ liệu hoặc chạy truy vấn), EF Core cần khởi tạo toàn bộ mô hình (model) dựa trên cấu hình của DbContext. Việc này có thể tiêu tốn thời gian đáng kể nếu mô hình lớn.
- Mô hình biên dịch giúp giảm thời gian khởi động này bằng cách tạo sẵn một mô hình đã được biên dịch và tối ưu hóa. Mô hình này có thể được sử dụng ngay mà không cần tái tạo.

---

### 2. **Cách tạo mô hình biên dịch**
Bạn có thể sử dụng công cụ dòng lệnh `dotnet ef` để tạo mô hình biên dịch:
- Lệnh:
  ```bash
  dotnet ef dbcontext optimize
  ```
- Các tham số:
  - `--output-dir`: Chỉ định thư mục đầu ra chứa mã của mô hình biên dịch.
  - `--namespace`: Chỉ định không gian tên (namespace) cho mô hình.

Ví dụ:
```bash
dotnet ef dbcontext optimize --output-dir HrmCompiledModels --namespace HrmCompiledModels --verbose
```

Kết quả là mã C# sẽ được tạo ra để tích hợp mô hình biên dịch vào ứng dụng.

---

### 3. **Cách sử dụng mô hình biên dịch**
Sau khi tạo xong, bạn cần tích hợp mô hình biên dịch vào DbContext bằng cách cấu hình trong phương thức `OnConfiguring` như sau:

```csharp
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    => optionsBuilder
       .UseModel(HrmCompiledModels.HrmCompiledModels.Instance)
       .UseSqlite("Data Source=test.db");
```

---

### 4. **Ưu điểm**
- **Giảm thời gian khởi động**: Đặc biệt hiệu quả với các ứng dụng có mô hình lớn.
- **Tối ưu hóa toàn bộ mô hình**: Không chỉ cải thiện thời gian tạo mà còn tối ưu hóa cấu trúc nội bộ của mô hình.

---

### 5. **Hạn chế**
- Không hỗ trợ:
  - Bộ lọc truy vấn toàn cục (Global Query Filters).
  - Proxy lazy loading và theo dõi thay đổi (Change-tracking proxies).
- Mô hình phải được tái tạo mỗi khi có thay đổi trong định nghĩa hoặc cấu hình.
- Không hỗ trợ các tùy chỉnh bằng cách triển khai `IModelCacheKeyFactory`.

---

### 6. **Khi nào nên sử dụng**
Mô hình biên dịch phù hợp với ứng dụng yêu cầu khởi động nhanh và có mô hình phức tạp. Tuy nhiên, nếu mô hình đơn giản hoặc bạn cần các tính năng như lazy loading thì tính năng này không đáng để đầu tư.



Lỗi khi 
![[Pasted image 20250313164147.png]]