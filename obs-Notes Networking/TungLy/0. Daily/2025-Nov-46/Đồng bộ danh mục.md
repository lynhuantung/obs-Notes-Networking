---
Mã: "25114610-01"
aliases: 
date: "2025-11-10"
time: "18:39"
Week: "46"
tags:
  - daily
---

## ⚙️ Bước 1. Tạo bảng lưu raw JSON (1 bảng cho tất cả danh mục)

```sql
CREATE TABLE Sync_CategoryRaw (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    CategoryCode NVARCHAR(100) NOT NULL,   -- Tên danh mục (Nationality, Religion,...)
    RawData NVARCHAR(MAX) NOT NULL,        -- JSON dữ liệu trả về từ API
    SyncDate DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_Sync_Category_Code ON Sync_CategoryRaw(CategoryCode);
```

💡 Mỗi lần gọi API, chỉ cần insert nguyên JSON `Data` vào cột `RawData`.

---

## ⚙️ Bước 2. Insert nhanh dữ liệu từ API (C#)

```csharp
using var client = new HttpClient();
var categories = new[] { "Nationality", "Religion", "Position" };

foreach (var cat in categories)
{
    var json = await client.GetStringAsync($"https://api.partner.com/{cat}");
    await conn.ExecuteAsync(
        "INSERT INTO Sync_CategoryRaw (CategoryCode, RawData) VALUES (@cat, @data)",
        new { cat, data = json });
}
```

👉 Mỗi danh mục = 1 dòng JSON lớn trong bảng `Sync_CategoryRaw`.

---

## ⚙️ Bước 3. Tạo VIEW parse JSON (1 view / danh mục)

Ví dụ danh mục Quốc tịch:

```sql
CREATE VIEW vw_Nationality AS
SELECT
    JSON_VALUE(j.value, '$.NationalityID') AS NationalityID,
    JSON_VALUE(j.value, '$.NationalityCode') AS NationalityCode,
    JSON_VALUE(j.value, '$.NationalityName') AS NationalityName
FROM Sync_CategoryRaw r
CROSS APPLY OPENJSON(r.RawData, '$.Data') AS j
WHERE r.CategoryCode = 'Nationality';
```

👉 Khi query:

```sql
SELECT * FROM vw_Nationality;
```

→ sẽ thấy data sạch, có thể JOIN hoặc MERGE vào bảng HRM.

---

## ⚙️ Bước 4. Tạo procedure đồng bộ vào bảng HRM

```sql
CREATE PROCEDURE sp_Sync_Nationality
AS
BEGIN
    MERGE Cat_Nationality AS target
    USING vw_Nationality AS src
    ON target.Code = src.NationalityCode
    WHEN MATCHED THEN 
        UPDATE SET target.Name = src.NationalityName
    WHEN NOT MATCHED THEN 
        INSERT (Code, Name) VALUES (src.NationalityCode, src.NationalityName);
END
```

Rồi chỉ cần chạy:

```sql
EXEC sp_Sync_Nationality;
```

→ Danh mục sẽ được đồng bộ tự động 🚀

---

## ✅ Tổng kết giải pháp nhanh

|Thành phần|Vai trò|
|---|---|
|**Sync_CategoryRaw**|Lưu toàn bộ JSON thô từ API (trace log)|
|**vw_XXX**|Parse JSON ra cột, dễ JOIN|
|**sp_Sync_XXX**|MERGE vào bảng danh mục thật|
|**C# job**|Gọi 10 API, insert JSON vào DB|

---

### ⚡ Lợi ích

- Chỉ 1 bảng duy nhất → cực dễ bảo trì
    
- Dễ mở rộng thêm danh mục (chỉ thêm 1 VIEW + 1 PROC)
    
- Có thể chạy thủ công hoặc lập lịch bằng Windows Task
    
- Giữ nguyên dữ liệu gốc để trace
    

---
dưới đây là **bộ script hoàn chỉnh (phiên bản nhanh, tối ưu cho SQL Server 2019)**  
→ Đồng bộ danh mục theo mô hình _Airbyte-style_  
(1 bảng JSON chung → View parse → Proc MERGE vào bảng HRM).

Em làm ví dụ 3 danh mục đầu: **Nationality**, **Religion**, **Position**  
Anh chỉ cần copy chạy trực tiếp trong `HRM10` là dùng được.

---

## 🧱 1️⃣ Tạo bảng lưu JSON gốc

```sql
CREATE TABLE Sync_CategoryRaw (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    CategoryCode NVARCHAR(100) NOT NULL,   -- Ví dụ: 'Nationality', 'Religion', 'Position'
    RawData NVARCHAR(MAX) NOT NULL,        -- JSON raw từ API
    SyncDate DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_Sync_Category_Code ON Sync_CategoryRaw(CategoryCode);
```

---

## 🧩 2️⃣ Tạo VIEW phân tích JSON cho từng danh mục

### 📘 Quốc tịch (Nationality)

```sql
CREATE OR ALTER VIEW vw_Nationality AS
SELECT
    JSON_VALUE(j.value, '$.NationalityID') AS NationalityID,
    JSON_VALUE(j.value, '$.NationalityCode') AS NationalityCode,
    JSON_VALUE(j.value, '$.NationalityName') AS NationalityName,
    r.SyncDate
FROM Sync_CategoryRaw r
CROSS APPLY OPENJSON(r.RawData, '$.Data') AS j
WHERE r.CategoryCode = 'Nationality';
```

### 🙏 Tôn giáo (Religion)

```sql
CREATE OR ALTER VIEW vw_Religion AS
SELECT
    JSON_VALUE(j.value, '$.ReligionID') AS ReligionID,
    JSON_VALUE(j.value, '$.ReligionCode') AS ReligionCode,
    JSON_VALUE(j.value, '$.ReligionName') AS ReligionName,
    r.SyncDate
FROM Sync_CategoryRaw r
CROSS APPLY OPENJSON(r.RawData, '$.Data') AS j
WHERE r.CategoryCode = 'Religion';
```

### 👔 Chức vụ (Position)

```sql
CREATE OR ALTER VIEW vw_Position AS
SELECT
    JSON_VALUE(j.value, '$.PositionID') AS PositionID,
    JSON_VALUE(j.value, '$.PositionCode') AS PositionCode,
    JSON_VALUE(j.value, '$.PositionName') AS PositionName,
    r.SyncDate
FROM Sync_CategoryRaw r
CROSS APPLY OPENJSON(r.RawData, '$.Data') AS j
WHERE r.CategoryCode = 'Position';
```

---

## ⚙️ 3️⃣ Procedure MERGE dữ liệu vào bảng HRM

### Quốc tịch

```sql
CREATE OR ALTER PROCEDURE sp_Sync_Nationality
AS
BEGIN
    SET NOCOUNT ON;
    MERGE Cat_Nationality AS target
    USING vw_Nationality AS src
    ON target.Code = src.NationalityCode
    WHEN MATCHED THEN 
        UPDATE SET target.Name = src.NationalityName
    WHEN NOT MATCHED THEN 
        INSERT (Code, Name) VALUES (src.NationalityCode, src.NationalityName);
END
```

### Tôn giáo

```sql
CREATE OR ALTER PROCEDURE sp_Sync_Religion
AS
BEGIN
    SET NOCOUNT ON;
    MERGE Cat_Religion AS target
    USING vw_Religion AS src
    ON target.Code = src.ReligionCode
    WHEN MATCHED THEN 
        UPDATE SET target.Name = src.ReligionName
    WHEN NOT MATCHED THEN 
        INSERT (Code, Name) VALUES (src.ReligionCode, src.ReligionName);
END
```

### Chức vụ

```sql
CREATE OR ALTER PROCEDURE sp_Sync_Position
AS
BEGIN
    SET NOCOUNT ON;
    MERGE Cat_Position AS target
    USING vw_Position AS src
    ON target.Code = src.PositionCode
    WHEN MATCHED THEN 
        UPDATE SET target.Name = src.PositionName
    WHEN NOT MATCHED THEN 
        INSERT (Code, Name) VALUES (src.PositionCode, src.PositionName);
END
```

---

## 🧠 4️⃣ C# Job nhỏ để gọi API và insert JSON

```csharp
using System;
using System.Data.SqlClient;
using System.Net.Http;
using Dapper;
using System.Threading.Tasks;

class SyncJob
{
    static async Task Main()
    {
        var connectionString = "Server=.;Database=HRM10;Trusted_Connection=True;";
        var client = new HttpClient();

        var categories = new[] { "Nationality", "Religion", "Position" };

        using var conn = new SqlConnection(connectionString);

        foreach (var cat in categories)
        {
            try
            {
                var url = $"https://api.partner.com/{cat}";
                Console.WriteLine($"📥 Gọi API: {url}");

                var json = await client.GetStringAsync(url);

                await conn.ExecuteAsync(
                    "INSERT INTO Sync_CategoryRaw (CategoryCode, RawData) VALUES (@cat, @data)",
                    new { cat, data = json });

                Console.WriteLine($"✅ Lưu thành công danh mục {cat}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Lỗi {cat}: {ex.Message}");
            }
        }

        // Gọi stored procedure đồng bộ
        await conn.ExecuteAsync("EXEC sp_Sync_Nationality");
        await conn.ExecuteAsync("EXEC sp_Sync_Religion");
        await conn.ExecuteAsync("EXEC sp_Sync_Position");

        Console.WriteLine("🎯 Đồng bộ hoàn tất!");
    }
}
```

---

## 🚀 5️⃣ Cách sử dụng

1. Chạy SQL script (tạo bảng, view, proc).
    
2. Chạy chương trình C# → tự động gọi API, lưu JSON, đồng bộ.
    
3. Xem kết quả:
    
    ```sql
    SELECT * FROM Cat_Nationality;
    SELECT * FROM Cat_Religion;
    SELECT * FROM Cat_Position;
    ```
    

---

## ✅ Ưu điểm

|Đặc điểm|Mô tả|
|---|---|
|⚡ Nhanh – chỉ 1 bảng duy nhất|Không phải tạo 10 bảng tạm|
|💾 Giữ nguyên JSON|Có thể trace lại mọi lần sync|
|🔁 MERGE thông minh|Chỉ insert/update khi cần|
|🧩 Dễ mở rộng|Thêm danh mục = thêm VIEW + PROC|
|⏱️ Có thể lên lịch|Tạo Windows Task hoặc job SQL Agent|

