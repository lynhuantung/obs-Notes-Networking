---
Mã: VNPAY1502
aliases:
date: 2026-03-10
tags:
  - bug
  - bug-repeat
  - vnPay
Project: "[[Dự án VnPay]]"
id: VNPAY1502
issue_type: Lỗi không tái hiện
status: Wait to PE
raised_date: 2026-02-02
expected_fix:
actual_fix:
pic_pe: Hiệp
pic_se: Thanh.Nguyen
recurrence:
---

# VNPAY1502 - Bug không tái hiện: Đăng ký tăng ca ngày lễ không lưu loại tăng ca

## Mô tả lỗi
Bug xảy ra khi **đăng ký tăng ca ngày lễ**, hệ thống không lưu đúng **loại tăng ca**.

QC không thể tái hiện lại lỗi.

## Các bước kiểm tra
1. Tổng hợp công sai  
2. Vào màn hình tăng ca kiểm tra sai loại đăng ký

## Nguyên nhân
Front end **truyền sai `durationType`**

## Phương án xử lý
Sửa **front end luôn kiểm tra khi truyền DurationType**

## Ghi chú
QC hỗ trợ vẫn chưa tái hiện được.

SE đã tìm ra nguyên nhân từ phía FE.