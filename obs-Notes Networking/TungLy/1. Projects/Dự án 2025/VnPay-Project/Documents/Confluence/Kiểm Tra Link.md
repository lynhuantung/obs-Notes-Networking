---
Mã:
aliases:
date: 2025-06-19
tags:
  - document
Project: "[[Dự án VnPay]]"
Liên kết:
---
Tài liệu này hướng dẫn cách kiểm tra kết nối đến một đường dẫn (URL)

# **1. TỔNG QUAN TÀI LIỆU**

## **1.1 GIỚI THIỆU**

Tài liệu này hướng dẫn cách kiểm tra kết nối đến một đường dẫn (URL) trong quá trình phát triển và vận hành ứng dụng. Việc kiểm tra bao gồm các bước cơ bản từ kết nối HTTP/HTTPS đến kiểm tra kết nối mạng và cổng.

## **1.2 MỤC ĐÍCH TÀI LIỆU**

- Hỗ trợ lập trình viên và đội ngũ vận hành nhanh chóng xác định nguyên nhân sự cố kết nối.
    
- Chuẩn hóa quy trình kiểm tra sự cố liên quan đến truy cập dịch vụ nội bộ hoặc bên ngoài.
    
- Làm cơ sở để phát hiện các vấn đề mạng, DNS, firewall hoặc server backend.
    

---

# **2. HƯỚNG DẪN CHI TIẾT**

## **2.1 Các bước kiểm tra kết nối**

### **Bước 1 – Kiểm tra HTTP/HTTPS bằng `curl`**

  

**Command Prompt**

curl -I https://hrm-vnr-uat-news.backendofficetest.vn

  

  

- ✅ **Mục đích**: Kiểm tra phản hồi HTTP status code, headers.
    
- ✅ **Kết quả mong muốn**: 200, 301, 302.
    
- ❌ **Lỗi phổ biến**: Connection timeout, SSL error, connection refused.
    

---

### **Bước 2 – Kiểm tra phản hồi IP bằng `ping`**

  

**Command Prompt**

ping hrm-vnr-uat-news.backendofficetest.vn

  

- ✅ **Mục đích**: Kiểm tra tên miền có phân giải DNS và có phản hồi ICMP không.
    
- ✅ **Kết quả mong muốn**: Có dòng `Reply from...`.
    
- ❌ **Lỗi phổ biến**: Request timed out, unknown host.
    

---

### **Bước 3 – Kiểm tra đường đi mạng bằng `tracert`**

  

**Command Prompt**

tracert hrm-vnr-uat-news.backendofficetest.vn

  

- ✅ **Mục đích**: Kiểm tra các hop trung gian đến đích.
    
- ✅ **Kết quả mong muốn**: Đến đúng IP cuối cùng không bị timeout.
    
- ❌ **Lỗi phổ biến**: Timeout ở nhiều điểm, chỉ ra đoạn mạng bị gián đoạn.
    

---

### **Bước 4 – Kiểm tra port bị chặn bằng `telnet`**

  

**Command Prompt**

telnet hrm-vnr-uat-news.backendofficetest.vn 443

  

- ✅ **Mục đích**: Kiểm tra port 443 có mở không.
    
- ✅ **Kết quả mong muốn**: Màn hình trống (kết nối thành công).
    
- ❌ **Lỗi phổ biến**: Could not open connection to the host.
    

