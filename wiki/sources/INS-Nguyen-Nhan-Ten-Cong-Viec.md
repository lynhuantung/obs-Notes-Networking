---
type: source
code: h8t4
tags:
  - "ins"
  - "root-cause"
  - "ten-cong-viec"
  - "5why"
domain: ins
created: 2026-04-30
updated: 2026-04-30
source-file: raw/Nghiệp vụ HRM/INS/INS-Nguyen-Nhan-Ten-Cong-Viec.md
related:
  - "[[wiki/sources/INS-Chan-Doan-Su-Co]]"
  - "[[wiki/sources/INS-FAQ-Phan-Tich-BH]]"
  - "[[wiki/sources/INS-Nguyen-Nhan-So-Tien-BH]]"
  - "[[wiki/sources/INS-Troubleshooting-5Why]]"
description: "RCA 5-Why lỗi không lấy được tên công việc trên D02: nguyên nhân trường chức danh theo luật thiếu ràng buộc bắt buộc nhập."
---

# Source: INS – Root Cause: Không Lấy Được Tên Công Việc

## Tóm tắt

Tài liệu phân tích 5-Why cho lỗi "không lấy được tên công việc" trên D02 trong phân hệ INS. Nguyên nhân gốc là trường "Chức danh theo luật" và "Chức vụ theo luật" thiếu ràng buộc bắt buộc nhập — người dùng có thể bỏ qua mà không bị cảnh báo. Đây là một trong hai RCA kinh điển của phân hệ BH (cùng với lỗi Số Tiền BH).

## Key Takeaways

- **Chain 5-Why:** Không có tên công việc → chưa có chức danh/chức vụ → thiết lập công thức sai hoặc thiếu → chức danh **theo luật** chưa nhập → không có validate bắt buộc
- **Root cause:** Trường "Chức danh theo luật" và "Chức vụ theo luật" **không có ràng buộc bắt buộc nhập**
- BH yêu cầu **tiếng Việt** cho tên công việc — lấy từ `InsuranceMonthly.JobName` → nguồn là chức danh theo luật
- **Fix khuyến nghị:** Validate bắt buộc nhập 2 trường tại màn hình nhân sự
- Cặp RCA: lỗi này + lỗi Số Tiền BH (textbox công thức không trực quan)

## Trích dẫn quan trọng

> **Chưa validate bắt buộc nhập "Chức danh theo luật" và "Chức vụ theo luật".**
> Hai trường này thiếu ràng buộc → người dùng có thể bỏ qua mà không có cảnh báo.

> ✅ **Validate bắt buộc nhập** "Tên chức danh theo luật" và "Tên chức vụ theo luật" tại màn hình nhập liệu nhân sự.

## Liên kết

- [[wiki/sources/INS-Chan-Doan-Su-Co]] — Danh sách trục trặc & chức năng chẩn đoán
- [[wiki/sources/INS-Nguyen-Nhan-So-Tien-BH]] — RCA pair: không tính được số tiền BH
- [[wiki/sources/INS-FAQ-Phan-Tich-BH]] — FAQ phát hiện trục trặc phân tích BH
- [[wiki/sources/INS-Troubleshooting-5Why]] — 5-Why framework đầy đủ
