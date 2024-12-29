---
aliases: 
date: 2024-10-25
tags:
  - daily
  - "#Talend-Open-Studio"
Link: "[[ETL]]"
---
- Kết nối sql 
[How to Connect SQL Server with Talend Open Studio 8](https://www.youtube.com/watch?v=lP5xA4oDNP4)
- Split 1 table sang nhiều
[(1) Split a Table with Talend Open Studio - YouTube](https://www.youtube.com/watch?v=Ki9vz6cDisc)
![[Pasted image 20241025153630.png]]
- Đường dẫn chạy file : F:\ETL\TOS_BD-20211109_1610-V8.0.1\TOS_BD-20211109_1610-V8.0.1

![[Pasted image 20241025153431.png]]
Trong **Talend Open Studio**, các thành phần như `TdbInput`, `tMap`, và `tLogRow` được sử dụng để xử lý và truyền tải dữ liệu giữa các bước của quy trình ETL (Extract, Transform, Load). Đây là giải thích ngắn gọn cho từng thành phần:

1. **TdbInput_1**:
   - Đây là thành phần đầu vào kết nối với cơ sở dữ liệu (DB) để truy xuất dữ liệu. `TdbInput` lấy dữ liệu từ một bảng hoặc truy vấn SQL.
   - Ví dụ: Lấy tất cả dữ liệu từ bảng khách hàng để xử lý.

2. **tMap_1**:
   - Đây là thành phần được sử dụng để ánh xạ (mapping) và biến đổi dữ liệu. Bạn có thể kết hợp, lọc, và chuyển đổi dữ liệu từ các nguồn khác nhau.
   - Ví dụ: Ánh xạ dữ liệu từ bảng khách hàng và bảng đơn hàng để kết hợp thông tin khách hàng với các giao dịch mua hàng.

3. **tLogRow_1**:
   - Đây là thành phần dùng để in kết quả ra console hoặc log file dưới dạng bảng để kiểm tra kết quả của quá trình xử lý dữ liệu.
   - Ví dụ: In ra dữ liệu sau khi đã được chuyển đổi bởi `tMap_1` để xem xét dữ liệu trước khi tải lên.
4. tdbOutput_1:
 - **`tDBOutput`** là thành phần chịu trách nhiệm **ghi dữ liệu** vào cơ sở dữ liệu. Nó thường được sử dụng khi bạn muốn nhập dữ liệu từ một nguồn khác vào một bảng trong cơ sở dữ liệu.

Ba thành phần này thường được kết nối theo thứ tự để lấy dữ liệu từ cơ sở dữ liệu (`TdbInput`), biến đổi và xử lý nó (`tMap`), và cuối cùng hiển thị hoặc log dữ liệu (`tLogRow`).

# cấu hình db
---
encrypt=true;trustServerCertificate=true;

## Chạy scheduler task tren talend open studio
---
-  Sử dụng Talend Job Scheduler (dành cho phiên bản trả phí)
## Chạy scheduler task tren talend open studio (bản miễn phí)
---
Dựa vào ảnh bạn cung cấp, mình sẽ hướng dẫn từng bước chi tiết để xuất job trong **Talend Open Studio** dưới dạng **file .bat** (dành cho Windows). Dưới đây là các bước thực hiện:
![[Pasted image 20241025161852.png]]

### Bước 1: Mở job trong Talend Open Studio
- Mở **Talend Open Studio** và chọn job mà bạn muốn xuất (như bạn đã làm trong ảnh).
- Từ mục **Job Designs** trong **Repository** (góc trái), nhấp chuột phải vào job cần xuất, như trong ảnh, bạn đã chọn job **`demo_db_Procedure_0.1`**.

### Bước 2: Chọn **Build Job**
- Sau khi nhấp chuột phải vào job, chọn **Build Job** (như trong ảnh ở mục **2**).
  - **Lưu ý**: Tùy chọn **Build Job** sẽ tạo ra file **`.bat`** nếu bạn chọn đúng kiểu build cho Windows.

### Bước 3: Cấu hình xuất file
- Trong cửa sổ **Build Job** (hiện lên sau khi chọn Build Job), làm theo các bước sau:
  1. **Destination Folder**:
     - Ở mục **To archive file**, nhấn **Browse...** để chọn thư mục lưu file **`.bat`**. Bạn có thể chọn bất kỳ thư mục nào trên máy tính (trong ảnh bạn đang chọn thư mục trong ổ đĩa F:).
     - File sẽ được xuất thành dạng `.zip` chứa file **`.bat`** cùng các thư viện cần thiết.
  
  2. **Build Type**:
     - Ở mục **Select the build type**, chọn **Standalone Job**. Đây là tùy chọn để xuất job độc lập, cho phép chạy bên ngoài Talend.
  
  3. **Shell launcher**:
     - Ở mục **Shell launcher**, chọn **Windows** (như trong ảnh ở mục **3**). Điều này sẽ xuất job dưới dạng file **`.bat`** dành cho Windows.

  4. **Java Sources** (tùy chọn):
     - Nếu bạn không cần mã nguồn Java của job, có thể bỏ chọn mục **Java sources**.

### Bước 4: Hoàn tất xuất file `.bat`
- Sau khi bạn đã cấu hình xong, nhấp vào nút **Finish** (như trong ảnh ở dưới cùng bên phải).
- Talend sẽ tạo file **.bat** và các file cần thiết trong thư mục bạn đã chọn. File **`.bat`** sẽ nằm trong file nén **`.zip`**.

### Bước 5: Giải nén file và chạy thử file `.bat`
1. **Giải nén file**:
   - Sau khi Talend xuất file thành công, tìm file **.zip** trong thư mục mà bạn đã chọn và giải nén nó.
   - Bạn sẽ thấy file **`.bat`** cùng với các thư viện cần thiết trong thư mục **lib**.
   ![[Pasted image 20241025161947.png]]

2. **Chạy thử file `.bat`**:
   - Nhấp đúp vào file **`.bat`** để chạy job.
   - Một cửa sổ **Command Prompt** sẽ hiện lên và job của bạn sẽ bắt đầu chạy.

### Tóm tắt các bước:
1. Nhấp chuột phải vào job trong **Repository** > **Job Designs** và chọn **Build Job**.
2. Chọn thư mục lưu trữ file và chọn **Standalone Job** với **Shell launcher** là **Windows**.
3. Nhấp **Finish** để Talend xuất file `.bat`.
4. Giải nén file **.zip**, sau đó chạy file **`.bat`** để chạy job.

Sau khi hoàn tất, bạn có thể sử dụng **Task Scheduler** của Windows để lên lịch chạy tự động file **`.bat`**. 