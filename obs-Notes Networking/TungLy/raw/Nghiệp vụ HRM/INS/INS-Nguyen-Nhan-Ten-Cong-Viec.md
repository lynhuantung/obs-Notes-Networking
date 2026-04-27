---
type: wiki-project
tags: [bao-hiem, root-cause, ten-cong-viec, chuc-danh, HRM, 5why]
date-updated: 2026-04-26
related:
  - "[[INS-Overview]]"
  - "[[INS-Chan-Doan-Su-Co]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
---

# INS – Root Cause: Không Lấy Được "Tên Công Việc"

## Phân tích 5-Why

**Nguyên nhân trực tiếp:** Không lấy được Tên Công Việc

```
❓ Tại sao không lấy được tên công việc?
  → Do chưa có chức danh / chức vụ

❓ Tại sao đã có chức danh/chức vụ vẫn không lấy được tên công việc?
  → Do thiết lập công thức sai

❓ Thiết lập công thức đúng, nhưng vẫn không lấy được chức danh/chức vụ?
  → (chưa ghi nhận chi tiết)

❓ Tại sao đã nhập chức danh theo luật vẫn không lấy được tên công việc?
  → Do bảo hiểm sử dụng trường "chức danh theo luật" (BH yêu cầu tiếng Việt)
  → Do một số nhân viên quên nhập chức danh theo luật

❓ Tại sao nhân sự quên nhập chức danh theo luật?
  → Do chức danh/chức vụ theo luật CHƯA CÓ RÀNG BUỘC bắt buộc nhập
```

## Nguyên nhân gốc (Root Cause)

> **Chưa validate bắt buộc nhập "Chức danh theo luật" và "Chức vụ theo luật".**  
> Hai trường này thiếu ràng buộc → người dùng có thể bỏ qua mà không có cảnh báo.

## Giải pháp khuyến nghị

✅ **Validate bắt buộc nhập** "Tên chức danh theo luật" và "Tên chức vụ theo luật" tại màn hình nhập liệu nhân sự.

## Liên quan

- [[INS-Chan-Doan-Su-Co]] – Danh sách trục trặc & chức năng chẩn đoán
- [[INS-Nguyen-Nhan-So-Tien-BH]] – Root cause: không tính được số tiền BH
- [[INS-FAQ-Phan-Tich-BH]] – FAQ phát hiện trục trặc phân tích BH
- [[INS-Overview]] – Tổng quan phân hệ bảo hiểm
