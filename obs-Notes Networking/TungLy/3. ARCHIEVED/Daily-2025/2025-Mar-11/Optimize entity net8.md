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
dotnet ef dbcontext optimize -o Models/CompiledModels -c VnrHrmDataContext -v

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


---
Để hiểu sâu hơn về mặt kỹ thuật mà vẫn giữ được sự tinh gọn, hãy coi Compiled Models như một quá trình **"Pre-calculation" (Tính toán trước)**.

Dưới đây là phân tích kỹ thuật chi tiết hơn về cơ chế này:

### 1. Cơ chế kỹ thuật: Từ "Động" sang "Tĩnh"

Trong phát triển phần mềm, việc gì làm ở **Runtime** (lúc chương trình đang chạy) cũng tốn tài nguyên hơn là làm ở **Compile-time** (lúc biên dịch).

- **Cách cũ (Dynamic Discovery):** Khi bạn gọi `new MyDbContext()`, EF Core kích hoạt một bộ máy quét khổng lồ. Nó dùng **Reflection** để "soi" từng Class, xem thuộc tính nào là `Key`, thuộc tính nào là `ForeignKey`, quan hệ 1-n hay n-n. Sau đó, nó phải giải các thuật toán phức tạp để xây dựng một cây Metadata (IModel) trong bộ nhớ. Với dự án HRM của Tùng, nếu có 500 bảng, EF Core phải thực hiện hàng nghìn phép thử-sai để khớp nối dữ liệu.
    
- **Compiled Models (Static Metadata):** Lệnh `optimize` thực chất là lấy toàn bộ kết quả của bộ máy quét nêu trên và **"đóng băng"** nó thành mã nguồn C#.
    
    - Thay vì dùng Reflection (chậm), nó dùng **Direct Access** (truy cập trực tiếp vào các biến đã định nghĩa sẵn).
        
    - Toàn bộ cấu hình Fluent API của bạn được chuyển thành các lệnh gán giá trị cứng trong các file `.cs` (như `EntityType.AddProperty`, `TableMapping.Create`).
        

---

### 2. Tại sao nó lại "nhanh"?

Sự khác biệt nằm ở 3 điểm mấu chốt:

1. **Triệt tiêu Reflection:** Reflection là một trong những tác vụ tốn kém nhất trong .NET. Compiled Models loại bỏ gần như 100% việc soi tìm Type lúc khởi động.
    
2. **Giảm cấp phát bộ nhớ (Memory Allocation):** Quá trình xây dựng Model động tạo ra rất nhiều đối tượng tạm thời. Với Model biên dịch, cấu trúc đã được định hình sẵn, giảm áp lực lên Garbage Collector (GC).
    
3. **Tối ưu hóa mã nguồn:** Mã C# được sinh ra bởi lệnh `optimize` là mã "sạch", chỉ tập trung vào việc dựng Model mà không có các logic kiểm tra điều kiện dư thừa như khi chạy động.
    

---

### 3. Bảng so sánh tốc độ và hiệu năng

Giả sử chúng ta có một hệ thống HRM lớn với khoảng **500 Entities**:

|**Tiêu chí**|**Cách cũ (Dynamic Model)**|**Compiled Models (Static)**|**Đánh giá**|
|---|---|---|---|
|**Thời gian khởi động lần đầu**|~5 - 10 giây|~0.5 - 1 giây|**Nhanh gấp 10 lần**|
|**Sử dụng CPU lúc Start**|Rất cao (để quét và tính toán)|Rất thấp|Giảm tải cho Server|
|**Chi phí bộ nhớ (RAM)**|Tốn thêm bộ nhớ đệm model|Tiết kiệm hơn|Hiệu quả hơn|
|**Độ trễ truy vấn đầu tiên**|Cao (do phải đợi build model)|Gần như tức thì|Trải nghiệm người dùng tốt|
|**Bảo trì**|Tự động cập nhật khi đổi code|Phải chạy lại lệnh `optimize`|Hơi bất tiện khi dev|
