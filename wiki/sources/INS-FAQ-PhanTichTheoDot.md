---
type: source
code: b8qz
tags:
  - bao-hiem
  - phan-tich-theo-dot
  - ins-period
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/architecture/INS-Architecture]]"
description: "Giải thích tính năng phân tích bảo hiểm theo đợt, cho phép phân tích lại nhiều lần trong cùng một tháng."
---

# INS FAQ — Phân Tích BH Theo Đợt

## Tóm tắt

Tài liệu giải thích tính năng phân tích BH theo đợt — cho phép phân tích lại nhiều lần trong cùng một tháng. Dùng khi PE thắc mắc tại sao có 2 dòng cùng tháng trong `Ins_ProfileInsuranceMonthly`.

## Key Takeaways

- **Cấu hình**: `IsUseInsAnalyzePeriod` trong Thiết lập BH — nếu OFF thì ẩn control chọn đợt
- **Đợt 1**: lưu dòng mới bình thường với `Period = 1`
- **Đợt 2+**: so sánh `SocialInsEmpAmount`, `HealthInsEmpAmount`, `UnemployEmpAmount` với dòng liền trước cùng tháng
  - Không thay đổi → chỉ update `IsDecreaseWorkingDays`, `IsPregnant`, `IsQuit`
  - Có thay đổi → lưu thêm dòng mới với `Period` mới
- PE thấy 2 dòng cùng tháng → đây là logic đúng, không phải bug

## Trích dẫn quan trọng

> 1 tháng phân tích nhiều lần — mỗi lần là 1 đợt. Dùng khi dữ liệu thay đổi giữa tháng.

> Đợt 2 không thay đổi số tiền → không lưu dòng mới, chỉ update flag — tránh dữ liệu dư thừa.

## Liên kết

- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — quy trình 5 bước phân tích BH
- [[wiki/architecture/INS-Architecture]] — schema `Ins_ProfileInsuranceMonthly` field `Period`
