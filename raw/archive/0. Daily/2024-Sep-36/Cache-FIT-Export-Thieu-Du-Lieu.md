---
aliases: 
date: 2024-09-07
tags:
  - daily
---
### Kiểm tra cache dự án FIT
>[!success]+ Q&A - Cache export thỉnh thoảng không hiển thị đủ dữ liệu
>**Hỏi: Nguyên nhân cache export thỉnh thoảng không hiển thị đủ dữ liệu là gì?**
>
>**Trả lời**: 
>
> **Vấn đề**: 
> - Vào màn hình báo cáo công hàng tháng thỉnh thoảng mất 1 vài mẫu báo cáo trên dropdown.
> 
> **Hiện trạng**: 
> - Hệ thống đang sử dụng Redis cache để lưu trữ mẫu báo cáo cho cả web main và portal apiv3.Tuy nhiên, do quy trình tạo cache không đồng nhất giữa hai phần này, dẫn đến sự không thống nhất về dữ liệu mẫu báo cáo được hiển thị.
> 
> **Nguyên nhân**: 
> - Viết cache giữa main và apiv3 do 2 dev làm gây ra bất đồng bộ.
> - Web main: Khi cache được khởi tạo, toàn bộ dữ liệu mẫu báo cáo được lấy và hiển thị đầy đủ.
> - Portal APIV3: Khi cache hết hạn và được tái tạo, dữ liệu chỉ được lấy dựa trên quyền truy cập của người dùng đang đăng nhập.
> - Hậu quả là, trên web main, dropdown mẫu báo cáo không thể hiển thị tất cả các dữ liệu như mong đợi.
> 
> **Giải pháp**: 
> - Thống nhất cách lấy dữ liệu khi khởi tạo cache giữa web main và portal, Cụ thể, cả hai hệ thống nên sử dụng cùng một cơ chế lấy dữ liệu (bất kể cache được khởi tạo ở đâu hay bởi ai).

### Support
- Hỗ trợ Phúc liệt kê các quyền cần thiết cho SQL (không phải quyền sa) (30 phút)

