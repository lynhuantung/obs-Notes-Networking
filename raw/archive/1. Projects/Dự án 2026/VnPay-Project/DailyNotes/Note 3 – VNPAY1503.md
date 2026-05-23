---
Mã: VNPAY1503
aliases:
date: 2026-03-02
time: 09:00
Week: "09"
tags:
  - bug
  - bug-repeat
  - vnPay
Project: "[[Dự án VnPay]]"

id: VNPAY1503
issue_type: Lỗi không tái hiện
status: Wait to PE
raised_date: 2026-03-02
expected_fix:
actual_fix: 2026-03-09
pic_pe: Tuấn
pic_se: Thanh.Nguyen
recurrence:
---

# VNPAY1503 - Portal hiển thị sai số lượng chờ duyệt

## Mô tả lỗi
Portal hiển thị **số lượng chờ duyệt**, nhưng khi bấm vào **không có dữ liệu**.

Sau khi vào **Main** để đếm lại thì thông báo mới biến mất.

## Các bước tái hiện
1. Tạo mới ngày nghỉ tại portal  
2. Vào dashboard portal chưa thấy số liệu mới

## Nguyên nhân
Dashboard portal **sử dụng cache số lượng chờ duyệt**

Cache chỉ refresh sau **30 phút**

## Phương án xử lý
Khi có thay đổi data liên quan:

- Clear cache dashboard
- Portal load lại dữ liệu
- Set cache mới (30 phút)

## Ghi chú
Đã fix cơ chế **clear cache khi thay đổi dữ liệu**.