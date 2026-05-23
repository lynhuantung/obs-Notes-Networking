---
aliases: 
date: 2024-11-15
permalink: 
tags:
  - "#plan"
  - "#kehoach"
Link kế hoạch: 
Related: "[[0.KeHoach]]"
---
Các mục tiêu, timeline, và các nội dung thảo luận theo mốc thời gian của dự án triển khai HRM lên SaaS, được sắp xếp rõ ràng hơn để dễ theo dõi:

---

### **Mục Tiêu Dự Án**
1. **Triển khai Kubernetes (K8s)**:
   - Đảm bảo môi trường ổn định, linh hoạt và có thể mở rộng.
2. **Triển khai HRM lên SaaS**:
   - Kế hoạch triển khai HRM lên nền tảng SaaS.
   - Thực hiện cấu hình để 1 source có thể kết nối với nhiều database theo từng tenant.
   - Độc lập hóa các dịch vụ HRM để tăng hiệu suất.
3. **Triển khai Docker**:
   - Đóng gói và triển khai ứng dụng để dễ dàng mở rộng và quản lý.
4. **DevOps**:
   - Thiết lập các quy trình DevOps để tự động hóa và quản lý hệ thống hiệu quả.

---

### **Timeline Triển Khai**
| Ngày | Công Việc |
| --- | --- |
| **15/08** | Login chuyển đổi giữa nhiều database |
| **19/08** | Login chuyển đổi database kết hợp với gọi API để lấy database phù hợp |
| **25/08** | Upload/Import/Export/webSetting lên MinIO |
| **30/08** | Cài đặt K8s và dựng source test HRM hoàn chỉnh |
| **15/09** | Thiết lập Multi-Tenant và Redis cache |
| **30/09** | Thiết lập Docker |
| **15/10** | Tích hợp VnR HRM vào chợ ứng dụng MISA |
| **05/11** | Xử lý cài đặt ứng dụng và thiết lập dữ liệu cho khách hàng |

---

### **Biên Bản Họp Theo Mốc Thời Gian**

1. **Nội dung chốt 15/07**:
   - Tìm hiểu kiến trúc Kubernetes và Docker (Pod, Docker, Node).
   - Xác định flow đăng ký HRM từ chợ phần mềm MISA.

2. **Nội dung chốt 22/07**:
   - Dựng web trên Kubernetes.
   - Triển khai Docker cho web MVC và SQL.

3. **Nội dung chốt 29/07**:
   - Thuê máy ảo và hướng dẫn cài đặt Kubernetes.
   - Xử lý upload MinIO, kiểm tra các file dùng chung như `lang`, `field_info`.

4. **Nội dung chốt 05/08**:
   - Xây dựng kịch bản vận hành SaaS.
   - Thiết lập Storage trên MinIO.
   - Cấu hình cho phép 1 ứng dụng kết nối nhiều database.

5. **Nội dung chốt 10/08**:
   - Thiết kế giao diện quản lý tenant.
   - Thiết kế giao diện quản lý user thuộc từng tenant.

6. **Nội dung chốt 12/08**:
   - Xử lý các vấn đề liên quan đến storage.
   - Hoàn thiện kịch bản vận hành SaaS.

7. **Nội dung chốt 19/08**:
   - Làm tài liệu về storage và Kubernetes.

8. **Nội dung chốt 26/08**:
   - Upload dữ liệu lên storage MinIO.
   - Yêu cầu cần người hỗ trợ cho Kubernetes.

9. **Nội dung chốt 18/09**:
   - Xử lý các tính năng quản lý multi-tenant.
   - Thiết lập Redis cache.
   - Lên lộ trình và các mốc thời gian quan trọng.

10. **Nội dung chốt 23/09**:
    - Xử lý Window Service và ghi log.
    - Dựng link SaaS trên server demo.

11. **Nội dung chốt 30/09**:
    - Kiến trúc K8s từ anh Hiếu.Lê và lên kế hoạch triển khai.
    - Xử lý nhận diện (identity) mới.

12. **Nội dung chốt 07/10**:
    - Xử lý K8s.
    - Giao diện quản lý nhận diện và tenant.

13. **Nội dung DevOps chốt 14/10**:
    - Lên kế hoạch DevOps.
    - Xử lý vấn đề license cho multi-tenant.

14. **Nội dung DevOps chốt 21/10**:
    - Thiết lập hệ thống giám sát (Monitor) và ghi log trên cloud.

15. **Nội dung DevOps chốt 28/10**:
    - Bàn luận các nội dung bổ sung cần thiết.

---

### **Kế Hoạch Tổng Quan**
1. **Triển khai Kubernetes và Docker**:
   - Dựng môi trường với Kubernetes để quản lý container.
   - Sử dụng Docker để đóng gói ứng dụng, đảm bảo dễ dàng mở rộng và quản lý.

2. **Phát triển SaaS**:
   - Tạo hệ thống quản lý multi-tenant cho HRM.
   - Tối ưu hiệu suất với Redis cache và MinIO cho storage.

3. **DevOps**:
   - Tự động hóa các quy trình triển khai và bảo trì.
   - Thiết lập hệ thống giám sát và ghi log để dễ dàng kiểm tra và bảo trì.
