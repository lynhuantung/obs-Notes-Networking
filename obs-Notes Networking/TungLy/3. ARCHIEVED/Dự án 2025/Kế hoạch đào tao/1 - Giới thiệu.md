## 🎥 **Giới thiệu hệ thống và cấu trúc thư mục source**

### 🎯 **Mục tiêu bài học**

bài này giúp người học:

- Hiểu được **kiến trúc tổng thể** của hệ thống.
    
- Nắm được **cấu trúc thư mục source code**.
    
- Biết cách **chạy một màn hình danh mục**.
    
- **Debug từ giao diện (Web MVC) đến API (Web API)**.
    

---

### 🧠 **Yêu cầu trước khi học**

Để theo kịp nội dung, bạn cần đã nắm:

- Kiến thức cơ bản về **MVC** (Model-View-Controller)
    
- Kiến thức về **Web API**
    
- Làm việc với **SQL Server**
    
- Hiểu và sử dụng **Kendo UI**, **JavaScript**, **jQuery**
    

---

### 🏗️ **1. Kiến trúc tổng thể của hệ thống**
![[Pasted image 20250418171113.png|400]]

Hệ thống được chia theo mô hình nhiều tầng, giúp dễ bảo trì và mở rộng:
![[Pasted image 20250418162928.png|500]]

| Tầng             | Vai trò                                     |
| ---------------- | ------------------------------------------- |
| **Presentation** | Giao diện người dùng (UI - Web MVC)         |
| **Service**      | Web API - tiếp nhận request và gọi Business |
| **Business**     | Xử lý logic nghiệp vụ                       |
| **Data**         | Tương tác với cơ sở dữ liệu SQL Server      |

📌 _Dữ liệu sẽ luân chuyển từ UI ➝ API ➝ Business ➝ Data._

---

### 🗂️ **2. Các project quan trọng trong solution**

Khi mở solution, bạn cần chú ý các project sau:

1. `HRM.Presentation.Main` – Giao diện chính web quản lý
    
2. `HRM.Presentation.EmpPortal` – Giao diện portal
    
3. `HRM.Presentation.Hr.Service` – Web API cho các phân hệ 
    
4. `HRM.Presentation.HrmSystem.Service` – Các dịch vụ hệ thống như người dùng, phân quyền
![[Pasted image 20250418163919.png]]

---

### 🖼️ **3. Cấu trúc một màn hình danh mục**

Một màn hình chuẩn thường có 4 phần:
![[Pasted image 20250418164613.png]]

| Phần                      | Mô tả                                                |
| ------------------------- | ---------------------------------------------------- |
| **1. Sitemap**            | Hiển thị đường dẫn – giúp người dùng biết đang ở đâu |
| **2. Điều kiện tìm kiếm** | Các input lọc dữ liệu                                |
| **3. Các nút xử lý**      | Gồm: Tạo mới, Xuất Excel, Đổi cột, Xóa               |
| **4. Lưới dữ liệu**       | Hiển thị danh sách theo dạng bảng                    |

Đây là cấu trúc chuẩn để bạn dễ dàng học một lần, áp dụng nhiều nơi khác nhau.

---

### 🧪 **4. Mục tiêu cuối cùng của bài học**

- Đăng nhập vào hệ thống
	
- Mở được một màn hình danh mục.
    
- Hiểu và theo dõi được dòng chạy: từ MVC → API → Business → Data.
    
- Biết cách gỡ lỗi (debug) xuyên suốt qua các tầng.


---
Kịch bản lời thoại trong 15 phút: [[1a - lời thoại giới thiệu]]