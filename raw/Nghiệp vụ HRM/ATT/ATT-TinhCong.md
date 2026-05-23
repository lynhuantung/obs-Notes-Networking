---
title: "ATT – Quy trình tính công"
date: 2026-05-09
code: att-tinh-cong
domain: att
module: Attendance
tags:
  - att
  - tinh-cong
  - nghiep-vu
verified: yes
related:
  - "[[ATT-Overview]]"
  - "[[ATT-DuLieuTinhCong]]"
  - "[[ATT-CongCongCongTru]]"
---

# ATT – Quy trình tính công

## Mục đích

"Tính công" là quy trình tổng hợp và xử lý dữ liệu chấm công của nhân viên để phục vụ:

- Tính lương
- Tính giờ tăng ca
- Xác định ngày nghỉ
- Ghi nhận đi trễ / về sớm
- Theo dõi số ngày phép còn lại
- Làm căn cứ cho bảo hiểm, thuế và đánh giá nhân sự

## Dữ liệu đầu vào

| Nguồn | Mô tả |
|-------|-------|
| Máy chấm công | Dữ liệu in/out thực tế |
| Đăng ký nghỉ phép | Nghỉ phép đã được duyệt |
| Đăng ký tăng ca | OT đã được duyệt |
| Ca làm việc / lịch làm việc | Quy định giờ vào/ra |
| Điều chỉnh công | Từ HR hoặc quản lý |

## Quy trình xử lý (8 bước)

| Bước | Mô tả |
|------|-------|
| 1 | Đồng bộ dữ liệu chấm công |
| 2 | Xác định ca làm việc |
| 3 | Tính đi trễ, về sớm, tăng ca |
| 4 | Tổng hợp ngày công |
| 5 | Sinh bảng công |
| 6 | Gửi phê duyệt |
| 7 | HR khóa công |
| 8 | Chuyển dữ liệu sang tính lương |

## Kết quả đầu ra

- Bảng công nhân viên
- Dữ liệu tính lương
- Báo cáo công
- Thống kê tăng ca, nghỉ phép, vi phạm công

## Các bên tham gia

- Nhân viên
- Quản lý trực tiếp
- HR / C&B
- Bộ phận tính lương

## Ghi chú thực tế

Module tính công thường là nơi **"nhiều rule nhất hệ thống"**, vì phải xử lý đủ loại tình huống: ca đêm, OT chồng giờ, nghỉ giữa kỳ, thai sản, nghỉ việc giữa tháng...
