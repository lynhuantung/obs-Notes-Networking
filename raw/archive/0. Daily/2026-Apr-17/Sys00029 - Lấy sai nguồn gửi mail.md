---
Mã: Sys00029
aliases:
date: 2024-04-05
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00005 - Không login được]]"
  - "[[Sys00007 - Webconfig thiếu key]]"
---
# Lấy sai nguồn gửi mail

**Vấn đề:** Không lấy đúng nguồn gửi mail từ thiết lập tuyển dụng
Hiện trạng: lấy sai nguồn mail server
Nghiệp vụ lấy thông tin server mail đang gặp khó khăn. Khi thiết lập tuyển dụng không có cấu hình server mail, hệ thống tự động sử dụng server mail của cấu hình chung.

**Lý Do:**
- Tại sao 1: Không thể lấy được cấu hình từ thiết lập tuyển dụng.
- Tại sao 2: Hệ thống không thể lấy được cấu hình tuyển dụng vì sử dụng dữ liệu từ cache. Tuy nhiên, cache chỉ lưu trữ tối đa 10,000 dòng cấu hình (trước đây không dự đoán số lượng key cấu hình hơn 10,000 dòng), trong khi có tổng cộng 12,000 dòng cấu hình trong database. Điều này dẫn đến việc một số cấu hình không được lấy đầy đủ

**Nguyên nhân gốc:**
Vấn đề chính bắt nguồn từ việc cache cấu hình không thể lưu trữ đủ thông tin.
Ghi chú thêm: Phần giải thích nguyên nhân chỉ là suy đoán khả năng lỗi 90%, vì hiện tại không thể tái hiện được. Do đó, thông tin được đưa ra chỉ là dự đoán và cần phải được kiểm chứng lại để xác định tính chính xác.

**Cách phòng tránh:**
Đề xuất sửa đổi quy trình lưu trữ để lấy toàn bộ danh sách key cấu hình từ database và lưu vào cache.

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00029 | SE | 05/04/2024 |
