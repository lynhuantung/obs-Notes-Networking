---
type: source
code: p9vk
tags:
  - bao-hiem
  - luong-bhxh
  - cong-thuc
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/sources/INS-Nguyen-Nhan-So-Tien-BH]]"
description: "Nguyên nhân và checklist xử lý khi lương BHXH bằng 0 sau phân tích bảo hiểm, đa phần do dữ liệu đầu vào sai."
---

# INS FAQ — Tại Sao Lương BHXH = 0?

## Tóm tắt

Tài liệu giải thích nguyên nhân và checklist xử lý khi phân tích BH ra lương BHXH = 0. Đây là lỗi thường gặp khi triển khai mới, đa phần do dữ liệu đầu vào chứ không phải lỗi code.

## Key Takeaways

- **Nguyên nhân đa phần**: `InsuranceAmount` trong `Sal_InsuranceSalary` = 0 hoặc null — dữ liệu PE nhập sai
- **Nguyên nhân ít gặp**: công thức `Cat_InsuranceElement` tính ra 0 — biến trong công thức không có giá trị
- **Wont fix** — kiểm tra dữ liệu trước khi nghi ngờ code
- Checklist: (1) xem số tiền trong màn hình Lương BHXH; (2) xem công thức và kiểm tra biến

## Trích dẫn quan trọng

> Đa phần là dữ liệu sai — kiểm tra màn hình lương BHXH và công thức trước khi báo bug.

## Liên kết

- [[wiki/sources/INS-Nguyen-Nhan-So-Tien-BH]] — RCA chi tiết lỗi không tính được số tiền BH
- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — bước 5 tính lương BH
