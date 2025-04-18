
## 🎤 **KỊCH BẢN LỜI THOẠI – VIDEO 15 PHÚT**

---

### ⏱️ **[0:00 – 1:00]** MỞ ĐẦU

> Xin chào các bạn!  
> Chào mừng đến với video "Giới thiệu hệ thống HRM".
> 
> Trong video này, chúng ta sẽ cùng:
> 
> - Hiểu rõ kiến trúc của hệ thống phần mềm này hoạt động ra sao,
>     
> - Nắm được cách tổ chức các thư mục, các project trong source code,
>     
> - Biết cách chạy thử một màn hình danh mục,
>     
> - Và quan trọng là debug xuyên suốt từ giao diện đến database.
>     
> 
> Nếu bạn đã biết qua về MVC, Web API, SQL Server, và có làm việc với Kendo UI hay jQuery thì bạn hoàn toàn có thể theo dõi nội dung hôm nay một cách dễ dàng.
> 
> Nào, chúng ta cùng bắt đầu nhé!

---

### ⏱️ **[1:00 – 4:00]** PHẦN 1: KIẾN TRÚC HỆ THỐNG

> Đây là sơ đồ kiến trúc hệ thống của obs-Notes Networking.
> 
> Hệ thống được chia thành **4 tầng chính**:
> 
> **1. Presentation** – Đây là tầng giao diện, sử dụng ASP.NET MVC. Mọi tương tác của người dùng như nhập liệu, click, hiển thị sẽ nằm ở đây.
> 
> **2. Service** – Đây là tầng Web API. Khi giao diện gọi dữ liệu, nó sẽ gửi request đến các controller API ở tầng này.
> 
> **3. Business** – Xử lý nghiệp vụ. Mọi tính toán, logic nghiệp vụ sẽ được xử lý tại đây.
> 
> **4. Data** – Giao tiếp trực tiếp với SQL Server để lấy hoặc lưu dữ liệu.
> 
> Các tầng được kết nối tuần tự và tách biệt nhau giúp chúng ta dễ dàng bảo trì, debug, và mở rộng hệ thống sau này.

---

### ⏱️ **[4:00 – 7:00]** PHẦN 2: CẤU TRÚC SOURCE CODE

> Khi bạn mở Solution trong Visual Studio, có rất nhiều project. Nhưng trong nội dung video này, mình sẽ hướng dẫn bạn tập trung vào **4 project chính**:
> 
> - `HRM.Presentation.Main`: Đây là project web giao diện chính.
>     
> - `HRM.Presentation.EmpPortal`: Là portal dành cho nhân viên – một phần giao diện khác biệt.
>     
> - `HRM.Presentation.Hr.Service`: Đây là Web API chính dành cho nghiệp vụ nhân sự.
>     
> - `HRM.Presentation.HrmSystem.Service`: Là nơi tập trung các dịch vụ dùng chung như phân quyền, thiết lập hệ thống.
>     
> 
> Việc nắm rõ vai trò của từng project sẽ giúp bạn biết phải đặt breakpoint ở đâu, sửa lỗi ở đâu, và thêm mới tính năng nào ở đâu.

---

### ⏱️ **[7:00 – 10:00]** PHẦN 3: CẤU TRÚC MÀN HÌNH DANH MỤC

> Tiếp theo, mình sẽ nói về **cấu trúc một màn hình danh mục** – là loại màn hình được dùng rất nhiều trong hệ thống.
> 
> Một màn hình danh mục chuẩn sẽ có **4 khu vực**:
> 
> **1. Sitemap (Breadcrumb)**: Hiển thị đường dẫn, giúp người dùng biết đang ở đâu trong hệ thống.
> 
> **2. Điều kiện tìm kiếm**: Nằm ở phần trên, thường gồm ô nhập liệu, dropdown, checkbox để lọc dữ liệu trong bảng.
> 
> **3. Các nút xử lý**: Như Tạo mới, Xóa, Xuất Excel, Đổi cột,... Đây là những thao tác thường dùng.
> 
> **4. Lưới dữ liệu**: Hiển thị danh sách kết quả dựa trên điều kiện lọc. Giao diện lưới sử dụng Kendo Grid.
> 
> Với cấu trúc cố định này, bạn chỉ cần học một lần là có thể áp dụng cho rất nhiều màn hình tương tự.

---

### ⏱️ **[10:00 – 13:00]** PHẦN 4: CHẠY VÀ DEBUG MÀN HÌNH

> Sau khi đã hiểu kiến trúc và cấu trúc source, bạn có thể thử chạy một màn hình danh mục.
> 
> **Quy trình như sau**:
> 
> - **Bước 1**: Chạy project `HRM.Presentation.Main`, mở trình duyệt và truy cập vào một URL danh mục.
>     
> - **Bước 2**: Giao diện sẽ gửi yêu cầu API đến `HRM.Presentation.Hr.Service`.  
>     Bạn có thể mở file Controller tương ứng để kiểm tra.
>     
> - **Bước 3**: Trong API Controller, dữ liệu sẽ được xử lý qua tầng Business. Đây là nơi bạn nên đặt breakpoint để xem giá trị truyền vào.
>     
> - **Bước 4**: Cuối cùng, hệ thống sẽ truy xuất dữ liệu từ SQL Server qua tầng Data.
>     
> 
> Bạn có thể kiểm tra SQL được gọi ra như thế nào, có đúng logic chưa, có bị lỗi cú pháp hay thiếu điều kiện không.

---

### ⏱️ **[13:00 – 15:00]** KẾT LUẬN

> Vậy là chúng ta đã cùng nhau tìm hiểu:
> 
> - Kiến trúc 4 tầng của hệ thống ,
>     
> - Các project quan trọng cần quan tâm khi làm việc,
>     
> - Cách tổ chức và cấu trúc một màn hình danh mục,
>     
> - Và cách debug dữ liệu từ giao diện đến tầng database.
>     
> 
> Mong rằng sau video này, bạn có thể:
> 
> - Hiểu hệ thống hoạt động như thế nào,
>     
> - Biết cách đọc – sửa – mở rộng source code,
>     
> - Và tự tin khi nhận yêu cầu fix bug hay thêm chức năng.
>     
> 
> Đừng quên xem lại sơ đồ kiến trúc và slide tổng hợp ở phần mô tả.
> 
> Cảm ơn bạn đã theo dõi. Hẹn gặp lại trong video tiếp theo!

---
