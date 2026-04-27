---
type: wiki-project
tags: [bao-hiem, phan-tich-BH, timezone, bug, HRM]
date-updated: 2026-04-26
related:
  - "[[INS-Overview]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
  - "[[INS-Chan-Doan-Su-Co]]"
mantis-id: "87680"
---

# INS – Phân Tích BH Tháng N Ra Tháng N-1 Trên Lưới

## Mô tả

Khi thực hiện **phân tích bảo hiểm**, người dùng chọn **tháng 9** nhưng kết quả trả về lại hiển thị dữ liệu của **tháng 8**.

## Thông tin

| Trường | Giá trị |
|---|---|
| Mantis ID | 87680 |

## Nguyên nhân

**Múi giờ (timezone) giữa máy server và máy client của Khách hàng không đồng bộ.**

## Xử lý

1. Chỉnh lại **múi giờ** cho máy server và client để đồng bộ với nhau.
2. **Restart lại server** sau khi chỉnh.

## Liên quan

- [[INS-FAQ-Phan-Tich-BH]] – Các góc nhìn phát hiện trục trặc phân tích BH
- [[INS-Chan-Doan-Su-Co]] – Chẩn đoán sự cố bảo hiểm
- [[INS-Overview]] – Tổng quan phân hệ bảo hiểm
