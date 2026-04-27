---
Mã:
aliases:
date: 2026-04-27
tags:
  - daily
  - "#issuelog"
  - "#issue"
Project: "[[Dự án OPA]]"
---
Vấn đề: 
BUG Schedule lấy hồ sơ ứng viên từ VNWs không tự động chạy
Nhờ SE check xem tại sao Schedule lấy hồ sơ ứng viên từ VNWs không tự động chạy từ ngày 7/4. Đến ngày 23/4 chạy manual thì mới có log


Trả lời  giải trình nguyên nhân:
Sau khi trao đổi với triển khai, mỗi lần cập nhật nhật bạn không stop window service.

Nguyên nhân: do khi cập nhật build không stop window service
Giải pháp: stop window service, và xóa window service và instal lại window service

Các Bước cập nhật build:
 + Bước 1:  stop tất cả pool của dự án.
 + Bước 2:  stop window service. 
 + Bước 3: cập nhật build