---
aliases: 
date: 2024-09-26
tags:
  - daily
  - "#HVN"
  - "#review_notes"
---
# Log Oracle có thông tin bất thường .
Hiện trạng log server database oracle đang tăng và có sự bất thường về ip truy cập và session. Cần tìm nguyên nhân.
Thông tin được HVN cung cấp : triển khai đồng bộ 2 database (1 database chính và 1 database dự phòng)

-----
**Trước đây:  hệ thống chỉ sử dụng một database duy nhất.**
- Log không tăng cao, hoạt động ổn định.

**Sau khi triển khai giải pháp đồng bộ real-time giữa 2 database:**
- Hai database được đồng bộ liên tục.
- Log của server bắt đầu tăng đột biến : Việc đồng bộ  sẽ yêu cầu một lượng lớn thao tác ghi và sao chép dữ liệu giữa các hệ thống. Điều này có thể tạo ra các giao dịch lớn, và tất cả các thay đổi này sẽ được ghi vào log, dẫn đến việc tăng lượng log.

**Suy đoán ban đầu**: Việc đồng bộ real-time giữa hai database có thể là nguyên nhân dẫn đến việc log tăng cao.
![[Pasted image 20240926134653.png]]
Giải thích mục 2 : source application
- Trong mục source application chứa các **session (phiên làm việc)** đang kết nối với cơ sở dữ liệu Oracle.
- Mỗi khi một người dùng, một ứng dụng, hoặc một máy chủ (node) kết nối vào cơ sở dữ liệu Oracle để thực hiện các thao tác, một **session** mới sẽ được tạo ra. Session này được gắn với một **Session ID duy nhất** và được liệt kê trong danh sách "Source Application" mà bạn thấy.
- Session này chứa thông tin về ứng dụng hoặc chương trình nào đang kết nối vào cơ sở dữ liệu (ví dụ: `hhmemberselection.platform.exe`) và từ node hay máy chủ nào (ví dụ: `node-1`, `node-2`,...).
- **Mục "Source Application"** hiển thị mỗi **session** (phiên làm việc) kết nối với cơ sở dữ liệu Oracle.
- Khi một **người dùng hoặc ứng dụng đăng nhập** vào hệ thống, một session sẽ được tạo ra và sẽ xuất hiện trong danh sách này, với thông tin về ứng dụng hoặc node nào đang kết nối.
- **Quá trình khi login hoặc tạo phiên làm việc**:    
    - Khi bạn hoặc một ứng dụng **đăng nhập vào cơ sở dữ liệu Oracle**, một **phiên làm việc** (session) được tạo ra.
    - Session này đại diện cho toàn bộ quá trình tương tác giữa người dùng/ứng dụng với cơ sở dữ liệu. Mọi hoạt động như gửi truy vấn SQL, thực hiện các giao dịch (insert, update, delete), và các thao tác khác đều diễn ra trong phiên này.
    - Sau khi phiên được tạo ra, nó sẽ hiển thị trong danh sách **"Source Application"**, nơi bạn có thể giám sát nó theo thời gian thực.
![[Pasted image 20240926120121.png]]


Định nghĩa Session trong Oracle và IIS [[Session trong Oracle và IIS]]