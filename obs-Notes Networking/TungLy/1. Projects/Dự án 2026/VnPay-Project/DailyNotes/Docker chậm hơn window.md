---
Mã: Update-Daily
aliases:
date: 2026-01-14
tags:
  - daily
Project: "[[Dự án VnPay]]"
Liên kết:
---
# Vì sao chạy Docker thường chậm hơn chạy trực tiếp trên Windows?

1. Tài nguyên bị giới hạn
Docker thường chỉ được cấp một phần CPU và bộ nhớ, nên khi nhiều người dùng cùng lúc, ứng dụng xử lý chậm hơn.

2. Đường đi của request dài hơn
Chạy trực tiếp trên Windows thì request đi thẳng.
Chạy trong Docker thì phải qua thêm vài “lớp trung gian”, nên mỗi lần gọi API hay Redis đều bị trễ hơn một chút.

3. Đọc/ghi file chậm hơn
Việc ghi log hay xuất báo cáo trong Docker chậm hơn so với ghi trực tiếp trên máy, khiến API phải chờ lâu mới xong.

4. Ứng dụng chưa được cấu hình phù hợp
Nếu không cấu hình thêm, ứng dụng có thể sử dụng ít tài nguyên hơn khả năng thực tế, nên dễ bị nghẽn khi có nhiều request.

5. Kết nối tới Redis hoặc database chậm hơn
Việc kết nối trong Docker tốn thêm thời gian, nếu làm lặp lại nhiều lần thì độ trễ sẽ càng rõ.

Tóm lại 
Docker chậm hơn Windows vì ít tài nguyên hơn, đường đi phức tạp hơn khi chạy trong Docker.


=============================================
Muốn Docker chạy nhanh hơn Windows, cần:

- Cấp đủ tài nguyên
- Giảm đường đi network
- Hạn chế ghi file trong request
- Cấu hình ứng dụng cho chạy thật
- Dùng lại kết nối Redis/DB