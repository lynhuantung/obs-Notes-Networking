---
aliases: 
date: 2024-09-26
tags:
  - daily
  - "#HVN"
Link: "[[Vấn đề Server HVN]]"
---

![[Pasted image 20240926134653.png]]
![[Pasted image 20240926120121.png]]
### Mục 1 : Tại sao DB HVN-HRD03-PRD  lại chọc đến nhiều IP hơn so với con HRV-HDR01-PRD
- Trong hệ thống , có nhiều **máy chủ** hoặc **node** khác nhau có thể kết nối đến cơ sở dữ liệu. Mỗi máy chủ có thể có địa chỉ IP riêng. 
### Mục 2: Source application là gì
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
