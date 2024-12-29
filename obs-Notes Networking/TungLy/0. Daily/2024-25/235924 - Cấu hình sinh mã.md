---
aliases: 
date: 2024-06-20
---
# Trao đổi với leader về cột code trong cấu hình sinh mã tự động

**Vấn đề: Kiểu dữ liệu cột Code trong database của cấu hình sinh mã tự động và cột code trong hợp đồng không giống nhau**

**Nội dung:**

- Cột Code trong database hiện được quy định là kiểu VARCHAR (không dấu).
- Tuy nhiên, cột mã hợp đồng trong cấu hình sinh mã tự động được lưu trữ theo kiểu VARCHAR, còn cột code trong bảng hợp đồng lại được lưu trữ theo kiểu NVARCHAR.
- Sự khác biệt này dẫn đến tình trạng hiển thị chính xác trên màn hình hợp đồng nhưng lại không chính xác trên màn hình cấu hình sinh mã tự động.

**Kết luận:**

Có hai vấn đề cần giải quyết:

1. Cột Code liệu có nên luôn được lưu trữ theo kiểu VARCHAR không?
2. Nếu cột Code là VARCHAR, liệu có nên áp dụng quy tắc không cho phép nhập tiếng Việt trên toàn bộ hệ thống hay không?


