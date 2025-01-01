---
aliases: 
date: 2024-11-06
tags:
  - daily
---
# **Tài Liệu Cấu Hình Phân Trang trong Airbyte**
## **1.  API Postman trả về**
- Url: https://ba.vnresource.net:1018/api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_EmployeeList&condition&page=1&pageSize=300&userName=admin
```json
{
    "data": [
        {         
			// Dữ liệu nhân viên ở đây  
        }
    ],
    "Has_More": true,
    "CurrentPage": 1
}
```
- Dưới đây là giải thích ngắn gọn về hai trường `"Has_More"` và `"CurrentPage"`:
- **`Has_More`**:    
    - Đây là một giá trị **Boolean** (`true` hoặc `false`) dùng để chỉ định liệu có **trang dữ liệu tiếp theo** hay không.
    - `"Has_More": true` nghĩa là **vẫn còn dữ liệu để lấy**, còn `"Has_More": false` nghĩa là **không còn dữ liệu**, và quá trình phân trang có thể dừng lại.
- **`CurrentPage`**:    
    - Đây là giá trị chỉ định **số thứ tự của trang hiện tại** (bắt đầu từ `1`).
    - `"CurrentPage": 1` nghĩa là dữ liệu bạn đang nhận thuộc **trang số 1**. Sau mỗi lần gọi API, giá trị này tăng lên (`2`, `3`,...) để tiếp tục lấy các trang kế tiếp.

 **Vai Trò của `Has_More` và `CurrentPage` Trong Airbyte**
- **`Has_More`** giúp **dừng quá trình phân trang** khi không còn dữ liệu.
- **`CurrentPage`** giúp Airbyte biết **đang ở trang nào** và tiếp tục **tăng lên** để gọi trang kế tiếp.
## **2. Tài liệu cấu hình phân trang trong airbyte dùng cursor**

#### **Mục Tiêu**
Mục tiêu của tài liệu này là hướng dẫn cách cấu hình phân trang cho một kết nối trong Airbyte, để giúp việc truy xuất dữ liệu từ API trở nên thuận tiện và tự động hơn. Việc phân trang sẽ giúp bạn lấy được toàn bộ dữ liệu từ API mà không cần can thiệp thủ công khi có nhiều trang dữ liệu.
![[Pasted image 20241111145914.png]]

### **1. Tổng Quan Về Phân Trang**
Phân trang trong API là quá trình chia nhỏ dữ liệu thành nhiều phần để dễ dàng quản lý và xử lý. Đặc biệt khi làm việc với dữ liệu lớn, việc phân trang giúp bạn hạn chế số lượng bản ghi mỗi lần truy xuất, giảm tải hệ thống và đảm bảo hiệu năng tốt hơn.

Trong Airbyte, phân trang được thiết lập để tự động truy cập qua từng trang của dữ liệu từ API nguồn, cho đến khi không còn trang nào để truy cập nữa.

### **2. Thiết Lập Phân Trang Trong Airbyte**

#### **2.1. Cursor Value (`Next Page Cursor`)**
- **Mục đích**: `Cursor Value` xác định số trang hiện tại và giúp tự động tăng số trang sau mỗi lần truy xuất dữ liệu.
- **Thiết lập**: 
  ```jinja
  {{ (response.CurrentPage or 1) + 1 }}
  ```
  - **Giải thích**:
    - `response.CurrentPage` là trường từ response của API, đại diện cho số trang hiện tại.
    - `response.CurrentPage or 1` nghĩa là nếu `CurrentPage` không tồn tại (trong lần gọi đầu tiên), giá trị mặc định sẽ là `1`.
    - `(response.CurrentPage or 1) + 1` tăng giá trị của `page` lên 1 cho lần gọi tiếp theo.
  
#### **2.2. Stop Condition (`Điều kiện dừng`)**
- **Mục đích**: `Stop Condition` chỉ định điều kiện để dừng quá trình phân trang, thường dựa trên việc xác định xem còn dữ liệu hay không.
- **Thiết lập**:
  ```jinja
  {{ response.Has_More == false }}
  ```
  - **Giải thích**:
    - `response.Has_More` là trường boolean trong response, cho biết có còn trang tiếp theo hay không.
    - Khi `Has_More` là `false`, nghĩa là không còn trang nào để truy cập, và quá trình phân trang sẽ dừng.

#### **2.3. Inject Cursor Value Vào URL Request**
- **Mục đích**: Để gửi giá trị `page` vào API request như một tham số truy vấn (query parameter).
- **Thiết lập**:
  - **Inject Cursor Value into outgoing HTTP Request**: Chọn `Query Parameter`.
  - **Parameter Name**: `page`.
  - **Giải thích**: Giá trị của `Cursor Value` (số trang) sẽ được tự động thêm vào URL request mỗi khi gửi yêu cầu mới đến API.

#### **2.4. Page Size**
- **Mục đích**: Thiết lập số lượng bản ghi muốn lấy mỗi lần gọi API.
- **Thiết lập**:
  - **Page Size**: `300`.
  - **Inject Page Size into outgoing HTTP Request**:
    - **Inject Into**: `Query Parameter`.
    - **Parameter Name**: `pagesize`.
  - **Giải thích**: Số lượng bản ghi mỗi lần gọi API là `300`, và giá trị `pagesize` sẽ được truyền vào URL request như một tham số truy vấn.

### **3. Ví Dụ Cấu Hình**
#### **3.1. Ví Dụ URL API**
- **URL Gốc**: 
  ```
  https://ba.vnresource.net:1018/api/Hre_Profile/GetListDataCustomByStore?storeName=hrm_dwh_sp_get_EmployeeList&Authorization=Bearer+****&pagesize=300&page=1
  ```
- **Giải thích**:
  - `page=1`: Đây là số trang hiện tại. Airbyte sẽ tự động thay đổi giá trị `page` thành `2`, `3`,... sau mỗi lần truy cập.
  - `pagesize=300`: Số lượng bản ghi mỗi trang là `300`.

#### **3.2. Response API Mẫu**
```json
{
  "data": [
    // Dữ liệu nhân viên ở đây
  ],
  "Has_More": true,
  "CurrentPage": 1  
}
```
- **Has_More**: Cho biết có trang tiếp theo hay không (`true` nghĩa là còn trang, `false` là không còn).
- **CurrentPage**: Trường cho biết số trang hiện tại.

### **4. Cách Thiết Lập Trong Airbyte**
1. **Bước 1**: Tạo **New Source** trong Airbyte và cung cấp URL API gốc.
2. **Bước 2**: Thiết lập **Pagination**:
   - **Cursor Value**: `{{ (response.CurrentPage or 1) + 1 }}`
   - **Stop Condition**: `{{ response.Has_More == false }}`
   - **Inject Cursor Value**:
     - **Inject Into**: `Query Parameter`
     - **Parameter Name**: `page`
   - **Page Size**:
     - Thiết lập `300`
     - **Inject Page Size**:
       - **Inject Into**: `Query Parameter`
       - **Parameter Name**: `pagesize`
3. **Bước 3**: Kiểm tra với nút **Test** để đảm bảo việc cấu hình thành công.
4. **Bước 4**: **Release new version** để lưu lại cấu hình.

### **5. Kết Quả**
- Sau khi cấu hình thành công, Airbyte sẽ tự động gọi API và tăng `page` sau mỗi lần lấy dữ liệu, cho đến khi trường `Has_More` trở thành `false`.
- Việc cấu hình này đảm bảo tất cả dữ liệu từ API được thu thập mà không cần phải can thiệp thủ công vào quá trình phân trang.

### **6. Lưu Ý**
- Đảm bảo rằng response của API luôn trả về đúng định dạng với các trường như `Has_More` và `CurrentPage` để việc phân trang hoạt động đúng.
- Nếu gặp lỗi, hãy kiểm tra logs của Airbyte và đảm bảo rằng token `Authorization` là hợp lệ và không bị hết hạn.

### **7. Kết Luận**
Việc thiết lập phân trang trong Airbyte giúp bạn tự động hóa quá trình lấy dữ liệu từ API có nhiều trang, đặc biệt hữu ích với những API có giới hạn số lượng bản ghi mỗi lần truy xuất. Với cấu hình phù hợp, quá trình này sẽ giúp bạn tiết kiệm thời gian và giảm thiểu lỗi trong việc lấy dữ liệu thủ công.

### **8. Kết Quả**
- Kết quả sau khi airbyte đồng bộ. Kết quả ra 5 dòng, mỗi dòng thể hiện mỗi lần gọi api
![[Pasted image 20241111162656.png]]


### **Incremental Sync** [[TungLy/Area/Data-WareHouse/ELT - Airbyte/Incremental Sync]]

# Tóm tắt
---
- Để phân trang api khi tạo builder thì cần thêm 2 field trong response trả về của API ( Has_More, currentPage), bên dưới là giải thích ý nghĩa:
```json
{
    "data": [
        {         
			// Dữ liệu nhân viên ở đây  
        }
    ],
    "Has_More": true,
    "CurrentPage": 1
}
```

- **`Has_More`**: 
  - Đây là một giá trị **Boolean** (`true` hoặc `false`) dùng để chỉ định liệu có **trang dữ liệu tiếp theo** hay không.
  - `"Has_More": true` nghĩa là **vẫn còn dữ liệu để lấy**, còn `"Has_More": false` nghĩa là **không còn dữ liệu**, và quá trình phân trang có thể dừng lại.

- **`CurrentPage`**:
  - Đây là giá trị chỉ định **số thứ tự của trang hiện tại** (bắt đầu từ `1`).
  - `"CurrentPage": 1` nghĩa là dữ liệu bạn đang nhận thuộc **trang số 1**. Sau mỗi lần gọi API, giá trị này tăng lên (`2`, `3`,...) để tiếp tục lấy các trang kế tiếp.

### **Vai Trò của `Has_More` và `CurrentPage` Trong Airbyte**
- **`Has_More`** giúp **dừng quá trình phân trang** khi không còn dữ liệu.
- **`CurrentPage`** giúp Airbyte biết **đang ở trang nào** và tiếp tục **tăng lên** để gọi trang kế tiếp.

Tóm lại, `"Has_More"` và `"CurrentPage"` phối hợp với nhau để giúp Airbyte tự động hóa quá trình lấy dữ liệu từ nhiều trang cho đến khi hết dữ liệu. 



