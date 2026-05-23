---
type: wiki-project
tags: [bao-hiem, root-cause, so-tien-BH, cong-thuc, HRM, 5why]
date-updated: 2026-04-26
related:
  - "[[INS-Overview]]"
  - "[[INS-Chan-Doan-Su-Co]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
  - "[[INS-Nguyen-Nhan-Ten-Cong-Viec]]"
---

# INS – Root Cause: Không Tính Được "Số Tiền Đóng Bảo Hiểm"

## Phân tích 5-Why

**Nguyên nhân trực tiếp:** Không tính được tiền đóng bảo hiểm

```
❓ Tại sao không tính được tiền đóng bảo hiểm?
  → Do chưa có lương đóng BH

❓ Tại sao đã có lương đóng BH vẫn không tính được số tiền?
  → (chưa ghi nhận chi tiết)

❓ Tại sao những phần tử đã có nhưng vẫn không tính được?
  → Do những phần tử trong công thức tính lương KHÔNG TỒN TẠI

❓ Tại sao đã thiết lập đúng ở phần tử bảo hiểm vẫn không tính được?
  → Do phần tử bên công/lương không được bảo hiểm nhận diện
  → Phần tử bảo hiểm được quản lý tại: Bảo hiểm >> Danh mục >> Phần tử bảo hiểm
  → Do "chế độ lương" có textbox nhập tên công thức bằng text thủ công (không trực quan)
     → dễ dẫn đến nhập sai tên công thức
```

## Nguyên nhân gốc (Root Cause)

> **Nơi nhập công thức không trực quan → dễ dàng dẫn đến sai sót.**  
> TextBox nhập text tự do cho tên công thức, người dùng có thể gõ sai mà không có gợi ý.

## Giải pháp khuyến nghị

✅ **Thay textbox bằng multiSelect** để chọn công thức → loại bỏ hoàn toàn lỗi nhập sai tên công thức.

## Vị trí cấu hình liên quan

| Màn hình | Đường dẫn |
|---|---|
| Phần tử bảo hiểm | Bảo hiểm → Danh mục → Phần tử bảo hiểm |
| Chế độ lương | Module lương (textbox nhập tên công thức) |

## Liên quan

- [[INS-Chan-Doan-Su-Co]] – Danh sách trục trặc & chức năng chẩn đoán
- [[INS-Nguyen-Nhan-Ten-Cong-Viec]] – Root cause: không lấy được tên công việc
- [[INS-FAQ-Phan-Tich-BH]] – FAQ phát hiện trục trặc phân tích BH
- [[INS-Overview]] – Tổng quan phân hệ bảo hiểm
