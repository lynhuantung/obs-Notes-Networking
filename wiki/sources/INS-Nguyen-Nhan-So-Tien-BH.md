---
type: source
code: p2w5
tags:
  - "ins"
  - "root-cause"
  - "so-tien-bh"
  - "5why"
domain: ins
created: 2026-04-30
updated: 2026-04-30
source-file: raw/Nghiệp vụ HRM/INS/INS-Nguyen-Nhan-So-Tien-BH.md
related:
  - "[[wiki/sources/INS-Chan-Doan-Su-Co]]"
  - "[[wiki/sources/INS-FAQ-Phan-Tich-BH]]"
  - "[[wiki/sources/INS-Nguyen-Nhan-Ten-Cong-Viec]]"
  - "[[wiki/sources/INS-Troubleshooting-5Why]]"
description: "RCA 5-Why lỗi không tính được số tiền đóng bảo hiểm: nguyên nhân gốc do nhap tên công thức BH bằng textbox tự do."
---

# Source: INS – Root Cause: Không Tính Được Số Tiền Đóng Bảo Hiểm

## Tóm tắt

Tài liệu phân tích 5-Why cho lỗi "không tính được số tiền đóng bảo hiểm" trong phân hệ INS. Nguyên nhân gốc là nơi nhập tên công thức BH dùng textbox tự do — không có validation, không có gợi ý — dễ gây nhập sai. Tài liệu được viết bởi Tung.Ly (VnResource 2017), là một trong hai RCA chính của phân hệ BH cùng với lỗi Tên Công Việc.

## Key Takeaways

- **Chain 5-Why:** Không có tiền BH → chưa có lương BH → phần tử công thức không tồn tại → phần tử BH không nhận diện → textbox nhập tên công thức không trực quan
- **Root cause:** TextBox nhập text tự do cho tên công thức tại màn hình "Chế độ lương" — không có autocomplete/validate
- **Fix khuyến nghị:** Thay textbox bằng **multiSelect** — chọn từ danh sách công thức có sẵn
- Phần tử BH quản lý tại: Bảo hiểm → Danh mục → **Phần tử bảo hiểm**
- Cặp RCA: lỗi này + lỗi Tên Công Việc (thiếu validate bắt buộc chức danh theo luật)

## Trích dẫn quan trọng

> **Nơi nhập công thức không trực quan → dễ dàng dẫn đến sai sót.**
> TextBox nhập text tự do cho tên công thức, người dùng có thể gõ sai mà không có gợi ý.

> ✅ **Thay textbox bằng multiSelect** để chọn công thức → loại bỏ hoàn toàn lỗi nhập sai tên công thức.

## Liên kết

- [[wiki/sources/INS-Chan-Doan-Su-Co]] — Danh sách trục trặc & chức năng chẩn đoán
- [[wiki/sources/INS-Nguyen-Nhan-Ten-Cong-Viec]] — RCA pair: không lấy được tên công việc
- [[wiki/sources/INS-FAQ-Phan-Tich-BH]] — FAQ phát hiện trục trặc phân tích BH
- [[wiki/sources/INS-Troubleshooting-5Why]] — 5-Why framework đầy đủ
