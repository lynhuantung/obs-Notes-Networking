---
Mã: "25031007-01"
aliases: 
date: "2025-03-07"
time: "13:46"
Week: "10"
tags:
  - daily
---
Trong ASP.NET Core 8, `FormCollection` đã bị loại bỏ, và bạn cần thay thế nó bằng `IFormCollection`. Nếu dự án của bạn đang sử dụng `FormCollection` ở nhiều nơi, bạn có thể áp dụng cách sửa đổi theo các bước sau để tránh sửa quá nhiều code một cách thủ công.

---

### **1. Tạo Extension Method để thay thế `FormCollection`**

Bạn có thể tạo một lớp extension giúp chuyển đổi `IFormCollection` thành một API tương tự như `FormCollection` trước đây.

#### **Tạo một lớp Extension để hỗ trợ**

Hãy tạo một file `FormCollectionExtensions.cs` trong dự án:

```csharp
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Linq;

public static class FormCollectionExtensions
{
    public static string GetValue(this IFormCollection formCollection, string key)
    {
        return formCollection.ContainsKey(key) ? formCollection[key].ToString() : null;
    }

    public static string GetKeyAt(this IFormCollection formCollection, int index)
    {
        return formCollection.Keys.ElementAtOrDefault(index);
    }

    public static IEnumerable<string> AllKeys(this IFormCollection formCollection)
    {
        return formCollection.Keys;
    }
}
```

---

### **2. Thay thế `FormCollection` bằng `IFormCollection` trong code**

Sau khi có extension trên, bạn có thể thay đổi kiểu của `formCollection` trong các phương thức đang sử dụng `FormCollection`, sau đó chỉ cần cập nhật cú pháp.

Ví dụ:

#### **Trước đây: (Sử dụng `FormCollection`)**

```csharp
public ActionResult SaveOrUpdate([FromForm] FormCollection formCollection)
{
    string tableName = formCollection.GetValue("hiddenTableName").AttemptedValue;
    string strID = formCollection.GetValue("recordID").AttemptedValue;
    
    for (int i = 0; i < formCollection.AllKeys().Count(); i++)
    {
        string key = formCollection.GetKeyAt(i);
        string value = formCollection.GetValue(key).AttemptedValue;
    }
}
```

---

#### **Sau khi sửa: (Dùng `IFormCollection` với Extension)**

```csharp
public ActionResult SaveOrUpdate([FromForm] IFormCollection formCollection)
{
    string tableName = formCollection.GetValue("hiddenTableName");
    string strID = formCollection.GetValue("recordID");
    
    foreach (var key in formCollection.AllKeys())
    {
        string value = formCollection.GetValue(key);
    }
}
```

---

### **3. Thay thế hàng loạt bằng Find & Replace**

Sau khi thay đổi hàm, bạn có thể sử dụng tính năng **Find & Replace** của Visual Studio để sửa nhanh trong toàn bộ dự án.

#### **Find & Replace trong toàn bộ Solution**

1. **Tìm:** `FormCollection`
2. **Thay thế bằng:** `IFormCollection`
3. **Tìm:** `formCollection.GetValue("key").AttemptedValue`
4. **Thay thế bằng:** `formCollection.GetValue("key")`
5. **Tìm:** `formCollection.AllKeys()`
6. **Thay thế bằng:** `formCollection.AllKeys()`
7. **Tìm:** `formCollection.GetKeyAt(index)`
8. **Thay thế bằng:** `formCollection.GetKeyAt(index)`

---

### **4. Kiểm tra lại code và build lại dự án**

Sau khi sửa xong, hãy **Build lại dự án** (`Ctrl + Shift + B`) và kiểm tra xem có lỗi nào còn lại không. Nếu có lỗi liên quan đến form data, hãy kiểm tra kỹ từng hàm để đảm bảo nó sử dụng đúng extension method.

---

### **Lợi ích của cách sửa này**

✅ **Không cần chỉnh sửa toàn bộ code bằng tay**  
✅ **Giữ nguyên logic cũ, không làm hỏng các chức năng đã hoạt động**  
✅ **Dễ bảo trì hơn trong tương lai khi ASP.NET Core tiếp tục thay đổi**

Hãy thử áp dụng cách sửa này và kiểm tra lại dự án của bạn nhé! 🚀