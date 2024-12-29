---
aliases: 
date: 2024-06-11
---
LTG- XÓA DATA TRONG DB VÀ KHÓA NGOẠI LIÊN QUAN.
### Vấn đề xóa 1 dòng dữ liệu khỏi database
1. Xóa hẳn khỏi db  
	- Khi xóa hẳn 1 dòng dữ liệu khỏi database thì sẽ tự xóa những bảng liên quan. Sẽ gây ra trường hợp xóa những bảng cần thiết mà người dùng không xác định được.
1. Xóa hẳn bảng chính, bạn phụ thì update cột khóa ngoài thì null  
	- Xóa hẳn bảng chính thì những bảng phụ phải update cột khóa ngoài là null. Gây vấn đề rác dữ liệu (những dữ liệu bảng phụ sẽ không dùng)
2. Update isDelete bảng chính và những bảng liên quan
	- Set trạng thái IsDelete cho bảng chính và bảng liên quan, thì giống như xóa hẳn nhưng vẫn lưu lại ở database, sẽ truy ra được



>
>## Xóa Dữ liệu khỏi Database
> 
> ### Nội dung
> 
> Có ba phương pháp để xóa dữ liệu khỏi database:
> 
> 1. **Xóa hẳn khỏi database:** Xóa hoàn toàn dữ liệu của một hàng khỏi database, cũng xóa cả những dữ liệu liên quan ở các bảng khác. Phương pháp này có thể gây mất dữ liệu quan trọng.
> 2. **Xóa bảng chính và cập nhật bảng phụ:** Xóa bảng chính và đặt cột khóa ngoài ở các bảng phụ thành `NULL`. Phương pháp này tạo ra dữ liệu rác ở các bảng phụ.
> 3. **Cập nhật trường `isDelete`:** Đặt trường `isDelete` trong bảng chính và các bảng liên quan thành `true`. Phương pháp này giống như xóa dữ liệu nhưng vẫn lưu lại trong database, cho phép truy xuất trong tương lai.
> 
> ### Kết luận
> 
> Việc lựa chọn phương pháp xóa dữ liệu phụ thuộc vào nhu cầu cụ thể và hệ thống liên quan. Nên cân nhắc kỹ lưỡng hậu quả của từng phương pháp trước khi áp dụng.
> 
> ### Links
> 
> * [[Quản lý dữ liệu rác]]
> * [[Trường delete flag]]
> 
> ### Tags
> 
> #xóa-dữ-liệu #database #isDelete


### 1. Xóa hẳn khỏi database

- **Ưu điểm:**
    
    - Giảm kích thước của database.
    - Dễ dàng trong việc quản lý dữ liệu, không có dữ liệu dư thừa.
- **Nhược điểm:**
    
    - Mất dữ liệu hoàn toàn, không thể khôi phục nếu cần.
    - Có nguy cơ xóa dữ liệu liên quan trong các bảng khác nếu không cấu hình đúng các ràng buộc khóa ngoại (foreign key).
- **Giải pháp:**
    
    - Thiết lập backup thường xuyên để có thể khôi phục dữ liệu khi cần.

### 2. Xóa hẳn bảng chính, update cột khóa ngoại thành NULL

- **Ưu điểm:**
    
    - Giảm kích thước của bảng chính.
    - Các bảng phụ vẫn giữ lại dữ liệu nhưng khóa ngoại trở thành NULL.
- **Nhược điểm:**
    
    - Tạo ra dữ liệu rác trong các bảng phụ, có thể gây ra vấn đề trong việc truy vấn dữ liệu.
    - Khó khăn trong việc duy trì tính toàn vẹn dữ liệu.
- **Giải pháp:**
    
    - Thêm một bước dọn dẹp định kỳ để kiểm tra và xóa các dòng dữ liệu trong bảng phụ mà khóa ngoại là NULL và không còn cần thiết.
    - Cần thiết lập các quy tắc nghiêm ngặt về việc xóa và quản lý dữ liệu để tránh tình trạng dữ liệu rác.

### 3. Update isDelete cho bảng chính và những bảng liên quan

- **Ưu điểm:**
    
    - Dữ liệu không bị mất hoàn toàn, có thể dễ dàng khôi phục lại khi cần.
    - Giữ lại toàn bộ thông tin liên quan trong các bảng khác, đảm bảo tính toàn vẹn dữ liệu.
- **Nhược điểm:**
    
    - Tăng kích thước của database do dữ liệu "đã xóa" vẫn tồn tại.
    - Cần điều chỉnh các truy vấn để lọc dữ liệu theo trạng thái isDelete.

### Đề xuất tổng thể

Phương án 3 (Update isDelete cho bảng chính và những bảng liên quan) có vẻ là lựa chọn tốt nhất trong trường hợp xóa vì những lý do sau:

- Giữ lại được toàn bộ dữ liệu, cho phép khôi phục và tra cứu khi cần thiết.
- Dễ dàng quản lý và duy trì tính toàn vẹn của dữ liệu.
- Tránh được các vấn đề về dữ liệu rác và mất mát dữ liệu quan trọng.


Xóa dữ liệu khỏi db : [[7360 - Xóa Data khỏi db]]
### Xử lý xóa khỏi db
- Chức năng xóa dữ liệu bảng chọn và những bảng tham chiếu đến khỏi database
```csharp
var cnn = "Server=172.21.35.3,1968;Database=HRM8_SQL_SE_TESTBUILD;User Id=sa;Password=TGn<@7qY;";  
    List<string> guidList = new List<string>();  
    Guid newGuid = Guid.NewGuid();  
    //guidList.Add("A8884F0E-47B7-46DA-8642-003515DA5A09");  
  
    guidList.Add("A14FB0DD-C964-40FA-83C8-0199F3EF3A12");  
     
    var m = new FkDataUtil() {  
        ConnectionString = "Server=172.21.35.3,1968;Database=HRM8_SQL_SE_TESTBUILD;User Id=sa;Password=TGn<@7qY;",  
        TableName = "Cat_NameEntity"  
    };//.GetSchemaJson();  
    var n = await m.QueryFkData(guidList);  
  
    var dd = n.GetPropertyValue("commands") as List<KeyValuePair<string, List<CommandModel>>>;  
  
  
    dd.ForEach(async x =>  
    {  
        x.Value.ForEach(async y =>  
        {  
            await FkDataUtil.ExecuteCommand(cnn, y.CommandText, y.Params);  
        });  
    });
```
