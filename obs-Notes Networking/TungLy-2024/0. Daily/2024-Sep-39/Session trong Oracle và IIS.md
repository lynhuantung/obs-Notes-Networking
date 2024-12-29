---
aliases: 
date: 2024-09-30
tags:
  - daily
  - "#HVN"
---
## Session trong Oracle

**Định nghĩa:**

Trong Oracle, một session là một kết nối trong bộ nhớ giữa client và Oracle Server. Nó đại diện cho một phiên cài đặt của Oracle cho phép người dùng thực hiện các thao tác trên cơ sở dữ liệu.

**Thành phần:**

* **ID Session:** Một số duy nhất được gán cho mỗi session.
* **Quá trình Back-end (PGA):** Một vùng bộ nhớ chứa thông tin truy cập riêng cho session.
* **Quá trình SGA:** Một vùng bộ nhớ được chia sẻ giữa tất cả các session đang hoạt động.
* **Khu vực Biến cục (UGA):** Vùng bộ nhớ dùng để lưu trữ các biến cục bộ cho session.

**Chức năng:**

* **Thực thi truy vấn:** Session thực hiện các lệnh SQL và truy vấn cơ sở dữ liệu.
* **Quản lý bộ đệm:** Session quản lý bộ đệm truy vấn, tăng hiệu suất bằng cách lưu trữ dữ liệu được truy xuất gần đây.
* **Kiểm soát quyền truy cập:** Session xác minh quyền của người dùng và chỉ cho phép họ thực hiện các thao tác được cấp phép.
* **Quản lý khóa:** Session quản lý chế độ khóa và khóa giúp đảm bảo tính toàn vẹn dữ liệu.

## Session trong IIS

**Định nghĩa:**

Trong Internet Information Services (IIS), một session là một phiên tạm thời giữa trình duyệt web và máy chủ IIS. Nó được sử dụng để lưu trữ thông tin cụ thể cho người dùng, chẳng hạn như sở thích, ID người dùng và trạng thái rổ hàng.

**Thành phần:**

* **ID Session:** Một mã duy nhất được gán cho mỗi session.
* **Bộ đệm:** Bộ đệm được sử dụng để lưu trữ dữ liệu session.
* **Thời gian chờ:** Thời gian sau đó session sẽ hết hạn nếu không có hoạt động.
* **Công nghệ lưu trữ:** IIS có thể lưu trữ dữ liệu session bằng các công nghệ sau:
    * InProc
    * StateServer
    * SQL Server

## Liên quan giữa Session trong Oracle và IIS

**Không liên quan:**

Các khái niệm về session trong Oracle và IIS không có liên quan trực tiếp với nhau. Chúng là các cơ chế hoàn toàn riêng biệt thực hiện các chức năng khác nhau trong các hệ thống khác nhau.

**Tuy nhiên, có một số điểm tương đồng:**

* Cả hai đều dùng để lưu trữ thông tin cụ thể cho người dùng trong một thời gian xác định.
* Cả hai đều có thể được lưu trong bộ đệm để cải thiện hiệu suất.
