---
aliases: 
date: 2024-10-28
tags:
  - "#airbyte"
  - "#builder-airbyte"
---
![[Pasted image 20241028100747.png]]

Để sử dụng phần Builder của Airbyte để gọi API và thực hiện quy trình ETL, bạn có thể làm theo các bước dưới đây:

### 1. **Truy cập Airbyte và vào mục “Builder”**
   - Trên giao diện chính của Airbyte, chọn **Builder** từ thanh điều hướng bên trái. Builder trong Airbyte là một công cụ cho phép tạo nguồn dữ liệu tuỳ chỉnh, đặc biệt hữu ích khi bạn muốn lấy dữ liệu từ một API mà Airbyte chưa hỗ trợ sẵn.

### 2. **Khởi tạo nguồn dữ liệu mới**
   - Nhấp vào **Create New Connector** để tạo nguồn dữ liệu API mới.
   - Đặt tên cho Connector, ví dụ: “Custom API Connector”.
   - Chọn loại giao thức kết nối là **HTTP API**.

### 3. **Thiết lập các thông tin API cơ bản**
   - **Base URL**: Nhập URL cơ bản của API (ví dụ: `https://jsonplaceholder.typicode.com/posts`).
   - **Authentication**: Cấu hình thông tin xác thực nếu API yêu cầu. Airbyte hỗ trợ các kiểu xác thực như:
      - **API Key**: Bạn có thể thêm trực tiếp API Key vào phần Headers.
      - **Bearer Token**: Tương tự như trên, bạn chỉ cần nhập token.
      - **OAuth**: Nếu API hỗ trợ OAuth, bạn sẽ cần thêm chi tiết Client ID, Client Secret, và thiết lập luồng xác thực.
   - **Headers và Query Parameters**: Nếu API của bạn yêu cầu một số Headers hoặc Query Parameters cụ thể, bạn có thể thêm chúng ở đây. Chẳng hạn, nếu cần gửi dữ liệu dạng JSON, hãy thêm `Content-Type: application/json`.

### 4. **Cấu hình điểm cuối (API Endpoints)**
   - Sau khi thiết lập thông tin cơ bản, thêm các **Endpoints** mà bạn muốn gọi.
   - Nhấp vào **Add Stream** để thêm một điểm cuối mới.
      - **Stream Name**: Đặt tên cho điểm cuối này (ví dụ: `getUsers`).
      - **Path**: Đặt đường dẫn endpoint sau phần Base URL (ví dụ: `/users`).
      - **HTTP Method**: Chọn phương thức HTTP (GET, POST, PUT, DELETE) phù hợp với API.
      - **Pagination**: Nếu API hỗ trợ phân trang, hãy cấu hình phần này. Airbyte có sẵn các phương thức phân trang phổ biến như `offset` và `page`.
      - **Rate Limiting**: Đặt giới hạn tốc độ gọi API nếu cần, tránh trường hợp API bị quá tải và bị từ chối truy cập.

### 5. **Mapping dữ liệu JSON Schema**
   - Airbyte sẽ yêu cầu định dạng và kiểu dữ liệu mà bạn mong muốn cho mỗi stream. Bạn có thể chỉ định từng trường và kiểu dữ liệu tương ứng trong **JSON Schema** (vd: string, integer, array, object).
   - Nếu API của bạn trả về các trường không cố định, bạn có thể sử dụng **Dynamic Schema Detection** để xử lý dữ liệu một cách linh hoạt hơn.

### 6. **Kiểm tra và xác minh nguồn**
   - Sau khi cấu hình xong, hãy kiểm tra kết nối bằng cách nhấp vào **Test Connection**. Nếu mọi thứ ổn, Airbyte sẽ xác minh rằng nguồn dữ liệu của bạn đang hoạt động.
   - Nếu kết nối không thành công, hãy kiểm tra lại URL, Header, và các tham số xác thực để đảm bảo chúng được thiết lập chính xác.
![[Pasted image 20241028101058.png]]

### 7. **Lên lịch để chạy ETL**
   - Sau khi xác minh nguồn thành công, bạn có thể thêm kết nối này vào một **Destination** trong Airbyte và thiết lập **Sync Schedule** để đồng bộ dữ liệu theo lịch trình mà bạn muốn (vd: hàng giờ, hàng ngày).
   - Bạn có thể chọn nhiều Destination khác nhau như SQL Server, BigQuery, PostgreSQL hoặc một số dịch vụ lưu trữ đám mây khác.

### 8. **Giám sát và kiểm tra dữ liệu**
   - Sau khi bắt đầu quá trình đồng bộ, theo dõi kết quả trong bảng điều khiển của Airbyte. Nếu có bất kỳ lỗi nào, Airbyte sẽ hiển thị thông tin lỗi chi tiết để bạn có thể khắc phục nhanh chóng.

