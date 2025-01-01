---
aliases: 
date: 2024-10-25
tags:
  - daily
Link: "[[TungLy/Area/Data-WareHouse/ITL DataWareHouse/ETL]]"
---
## Tóm tắt những việc đã làm trong Talend Open Studio
---

### 1. Mục đích của Talend Open Studio và ETL
   - **Mục đích chính**: Sử dụng Talend Open Studio để lấy dữ liệu từ các nguồn khác nhau, xử lý hoặc biến đổi nó, rồi lưu trữ vào một nơi gọi là "data warehouse" (kho dữ liệu). 

### 2. Các Bước Công Việc Đã Làm
   - **Bước 1: Cài đặt phần mềm Talend** – tải và cài đặt Talend Open Studio, một công cụ dùng để thu thập, xử lý và lưu trữ dữ liệu từ các nguồn khác nhau.
   
   - **Bước 2: Tạo các quy trình xử lý dữ liệu ETL (gọi là "job")** –  đã tạo ba quy trình chính:
     - **Quy trình 1**: Lấy dữ liệu từ một bảng duy nhất (gọi là "input") và chuyển vào data warehouse (gọi là "output").
     - **Quy trình 2**: Lấy dữ liệu từ hai bảng có mối quan hệ với nhau (ví dụ, một bảng chứa thông tin Tỉnh thành và một bảng chứa thông tin quận huyện). Sau đó, kết hợp dữ liệu của hai bảng này và lưu vào data warehouse.
     - **Quy trình 3**: Sử dụng một đoạn mã trong cơ sở dữ liệu để tạo dữ liệu (gọi là stored procedure), sau đó lưu dữ liệu đó vào data warehouse.
     ![[Pasted image 20241025170614.png]]
     ![[Pasted image 20241025170650.png]]

### 3. Tự Động Hóa Quy Trình
   - **Tạo file `.bat` để chạy tự động** – Thay vì mở Talend và chạy từng quy trình (job) bằng tay,  đã tạo một file tự động (file `.bat`). File này cho phép  nhấn đúp vào là hệ thống tự động chạy các quy trình ETL trên mà không cần mở phần mềm.

---

### Tóm lại:

Sử dụng Talend Open Studio để:
1. Lấy và kết hợp dữ liệu từ nhiều nguồn khác nhau.
2. Biến đổi và lưu trữ dữ liệu đó vào một bảng mới (data warehouse).
3. Tạo một file tự động để chạy toàn bộ quá trình chỉ với một cú nhấp chuột. 

Với quy trình này,  có thể dễ dàng quản lý và lưu trữ dữ liệu một cách nhất quán và tự động hóa để tiết kiệm thời gian.




