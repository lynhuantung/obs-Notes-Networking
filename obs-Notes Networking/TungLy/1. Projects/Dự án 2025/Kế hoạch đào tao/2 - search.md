![[Pasted image 20250418164100.png]]

**bài học tiếp theo là: tìm kiếm / xuất Excel / đổi cột / xóa**, mình sẽ giúp bạn soạn **cấu trúc bài học đầy đủ theo hình**, dùng để:

- Giải thích luồng xử lý,
    
- Làm slide giảng dạy,
    
- Và hướng dẫn thực hành trong mã nguồn.
    

---

## 🧭 **CẤU TRÚC BÀI HỌC – CHỨC NĂNG TÌM KIẾM / XUẤT EXCEL / ĐỔI CỘT / XÓA**

---

### 🎯 **Mục tiêu bài học**

Học viên sẽ nắm được:

- Cách hệ thống xử lý tìm kiếm, xuất Excel, đổi cột, và xóa trên giao diện danh mục.
    
- Luồng dữ liệu đi từ View → Controller → Model → API → Business → Database.
    
- Cách debug từng phần khi gặp lỗi.
    

---

### 🧩 **1. Tổng quan màn hình danh mục (theo sơ đồ)**

|Thành phần|Mô tả chức năng|
|---|---|
|`Index.cshtml`|View chính hiển thị danh sách và nút chức năng|
|`CatBankController`|Controller MVC xử lý các action: `Index`, `Info`, `Delete`|
|`CatBankDemoSearchModel`|Model nhận dữ liệu tìm kiếm từ giao diện|
|`CatBankDemoModel`|Model chứa dữ liệu binding vào View|
|`Cat_GetDataController`|Controller xử lý load dữ liệu phụ hoặc bổ trợ|
|`Cat_BankController`|Web API chính: `GET`, `POST`, `DELETE`|
|`CatBankDemoEntity`|Thực thể xử lý logic nghiệp vụ và tương tác DB|
|`CatBankInfo.cshtml`|View phụ, ví dụ khi tạo/sửa, xử lý ngôn ngữ|

---

### 🔎 **2. Chức năng 1: Tìm kiếm (Search)**

- **Bắt đầu từ giao diện (`Index.cshtml`)**: người dùng nhập điều kiện và nhấn "Tìm kiếm".
    
- **Gửi data qua AJAX → `CatBankDemoSearchModel`**: gom dữ liệu filter.
    
- **Gọi API `GET` của `Cat_BankController`** để lấy dữ liệu.
    
- **API gọi đến `CatBankDemoEntity.Search()`**, trả về danh sách.
    
- **Kết quả hiển thị lại trên `Index.cshtml` trong `Kendo Grid`.**
    

🧩 **Lưu ý khi debug**:

- Check `AJAX call` trong trình duyệt (tab Network),
    
- Kiểm tra binding search model → API có đúng không.
    
- Đặt breakpoint trong `Cat_BankController.Get()` và `Entity.Search()`.
    

---

### 📁 **3. Chức năng 2: Xuất Excel**

- **Người dùng nhấn nút Export Excel trên View.**
    
- **Gọi `CatBankController.ExportToExcel()` (MVC Controller)**.
    
- **Từ đó, có 2 cách thực hiện**:
    
    - Gọi Web API `GET` có tham số để trả về file excel.
        
    - Hoặc xử lý tại tầng Controller và dùng thư viện tạo Excel (ví dụ Aspose hoặc EPPlus).
        
- **File được trả về và tải xuống trình duyệt.**
    

🧩 **Lưu ý**:

- Đảm bảo search model cũng được truyền khi xuất Excel.
    
- Có thể tái sử dụng hàm `Search()` để lấy lại dữ liệu.
    

---

### 🧩 **4. Chức năng 3: Đổi cột (Change Columns)**

- **Giao diện `Index.cshtml` cho phép đổi cột hiển thị (show/hide).**
    
- Có thể cấu hình trong `Kendo Grid` bằng `columnMenu: true`.
    
- **Thông tin đổi cột lưu ở localStorage hoặc gửi lên server để lưu tùy người dùng.**
    
- **Không ảnh hưởng đến API hay Controller.**
    

🧩 **Mở rộng nâng cao**:

- Lưu lựa chọn cột theo từng user.
    
- Tích hợp cấu hình đổi cột riêng cho từng màn hình.
    

---

### 🗑️ **5. Chức năng 4: Xóa (Delete)**

- Người dùng nhấn nút Xóa trên giao diện → mở confirm box.
    
- Gửi request `DELETE` đến API `/api/Cat_Bank/Delete/{id}`.
    
- **API gọi đến `CatBankDemoEntity.DeleteRecord(id)` để xử lý.**
    
- Sau khi xóa xong, API trả về kết quả → View cập nhật lại danh sách.
    

🧩 **Lưu ý**:

- Kiểm tra có đang bị `isDelete = true` hay thực sự xóa cứng.
    
- Có thể cần kiểm tra điều kiện không cho xóa nếu đang được sử dụng.
    

---

### 🧪 **6. Gợi ý thực hành**

|Tác vụ|Hướng dẫn|
|---|---|
|Debug nút tìm kiếm|Mở DevTools → tab Network → check request gửi đúng chưa|
|Theo dõi flow|Đặt breakpoint tại: `CatBankController`, `Cat_BankController`, `CatBankDemoEntity`|
|Thử xóa một bản ghi|Gọi API bằng Postman hoặc từ giao diện để test|
|Thêm cột mới vào Kendo Grid|Thử thay đổi giao diện `Index.cshtml` và test đổi cột|

---

Kịch bản lời thoại trong 15 phút: [[2a - kich bản tìm kiếm]]