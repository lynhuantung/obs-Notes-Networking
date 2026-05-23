---
Mã:
aliases:
date: 2025-06-19
tags:
  - document
Project: "[[Dự án VnPay]]"
Liên kết:
---
Docker là nền tảng container hóa giúp đóng gói, triển khai ứng dụng dễ dàng, linh hoạt trên nhiều môi trường, tối ưu hiệu suất, tăng khả năng mở rộng và quản lý tài nguyên.

# Tài liệu Hướng dẫn Cài đặt Docker

## 1. TỔNG QUAN TÀI LIỆU

### 1.1 GIỚI THIỆU

Tài liệu này cung cấp hướng dẫn chi tiết về quy trình cài đặt nền tảng Docker. Docker là một nền tảng mở cho các nhà phát triển và quản trị viên hệ thống để xây dựng, chạy và chia sẻ các ứng dụng với container. Bằng cách sử dụng container, người dùng có thể đóng gói một ứng dụng cùng với tất cả các thư viện, công cụ hệ thống, mã và thời gian chạy cần thiết, đảm bảo ứng dụng chạy nhất quán trên mọi môi trường.

Thông tin chung và sản phẩm Docker có thể tham khảo tại: [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)

### 1.2 MỤC ĐÍCH TÀI LIỆU

Mục đích của tài liệu này là cung cấp các bước hướng dẫn cụ thể để người dùng có thể tự cài đặt thành công Docker trên hệ điều hành Ubuntu (Linux).

## 2. HƯỚNG DẪN CHI TIẾT

### 2.1 Nội dung

Phần này trình bày các bước chi tiết để cài đặt Docker trên hệ điều hành Ubuntu. Người dùng cần thực hiện lần lượt các lệnh sau trong Terminal:

**Các bước cài đặt:**

1. Cập nhật danh sách gói hiện có và cài đặt các gói cần thiết để cho phép `apt` sử dụng repository qua HTTPS:
    
    ```bash
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release
    ```
    
2. Tạo thư mục cho GPG keyrings nếu chưa tồn tại:
    
    ```bash
    sudo mkdir -p /etc/apt/keyrings
    ```
    
3. Tải xuống GPG key chính thức của Docker và thêm vào hệ thống:
    
    ```bash
    curl -fsSL [https://download.docker.com/linux/ubuntu/gpg](https://download.docker.com/linux/ubuntu/gpg) | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    ```
    
4. Thiết lập repository của Docker:
    
    ```bash
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      [https://download.docker.com/linux/ubuntu](https://download.docker.com/linux/ubuntu) $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
    
5. Cập nhật lại danh sách gói sau khi đã thêm repository của Docker:
    
    ```bash
    sudo apt update
    ```
    
6. Cài đặt Docker Engine, containerd và Docker Compose plugin:
    
    ```bash
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```
    

**Kiểm tra cài đặt:**

Sau khi hoàn tất các bước trên, bạn có thể kiểm tra phiên bản Docker đã cài đặt để xác nhận quá trình thành công:

```bash
docker --version
```

