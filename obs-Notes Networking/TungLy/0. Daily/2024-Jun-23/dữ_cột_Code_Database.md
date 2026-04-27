
**Lập chỉ mục:**
- Kế hoạch
- Tài liệu
- Chức năng
	- Truy vết [[TungLy/1. Projects/Index/ChucNang/TruyVet/0.Truy vết|0.Truy vết]]
	- Chức năng bảo hiểm [[Truy vết/Thành Phần BH/Bảo hiểm|Bảo hiểm]]
- Meeting
- Dự án
- Nhật ký vấn đề


Hãy viết lại đoạn văn bên dưới xúc tích dễ hiểu:
"
hi anh/em Leaders,anh có 1 vấn đề là từ trước đến giờ, mình có quy định cột Code trong database là kiểu vachar (không dấu)Hiện tại : bên cấu hình sinh mã tự động có cột mã hợp động lưu kiểu dữ liệu là varchar, tuy nhiên trong bảng hợp động thì lưu cột code là nvarchar, dẫn đến trường hợp màn hình hợp đồng hiển thị đúng, còn màn hinh cấu hình sinh mã tự động sai.

Từ vấn đề trên có 2 ý:
- Cột code có quy định chung là luôn là kiểu varchar không?
- Về validate chung toàn hệ thống, nếu cột code là varchar thì mình không cho phép nhập tiếng việt.
"

>[!summary]+ Tóm tắt
>**Tiêu đề: Kiểu dữ liệu cột Code trong database**
> 
> **Nội dung:**
> 
> * Cột Code trong database hiện được quy định là kiểu VARCHAR (không dấu).
> * Tuy nhiên, cột mã hợp đồng trong cấu hình sinh mã tự động được lưu trữ theo kiểu VARCHAR, còn cột code trong bảng hợp đồng lại được lưu trữ theo kiểu NVARCHAR.
> * Sự khác biệt này dẫn đến tình trạng hiển thị chính xác trên màn hình hợp đồng nhưng lại không chính xác trên màn hình cấu hình sinh mã tự động.
> 
> **Kết luận:**
> 
> Có hai vấn đề cần giải quyết:
> 
> 1. Cột Code liệu có nên luôn được lưu trữ theo kiểu VARCHAR không?
> 2. Nếu cột Code là VARCHAR, liệu có nên áp dụng quy tắc không cho phép nhập tiếng Việt trên toàn bộ hệ thống hay không?
> 
> **Links:**
> 
> * [[Quy định về kiểu dữ liệu cột Code]]
> * [[Validate chung toàn hệ thống]]
> 
> **Tags:**
> 
> * #database
> * #kiểu-dữ-liệu
> * #VARCHAR
> * #NVARCHAR
> * #validate
 

