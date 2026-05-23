---
type: source
code: atn02
domain: att
description: "Quy trình 8 bước tính công: đồng bộ dữ liệu → sinh bảng công → khóa công → chuyển lương."
tags:
  - att
  - tinh-cong
  - quy-trinh
  - nghiep-vu
created: 2026-05-10
updated: 2026-05-10
source-file: raw/Nghiệp vụ HRM/ATT/ATT-TinhCong.md
related:
  - "[[wiki/concepts/ATT-ChamCong]]"
  - "[[wiki/flows/Flow-TinhCong-ATT]]"
---

# Source: ATT – Quy trình tính công

## Tóm tắt

Tài liệu mô tả quy trình **"Tính công"** — nghiệp vụ tổng hợp và xử lý dữ liệu chấm công để phục vụ tính lương, xác định ngày nghỉ, ghi nhận vi phạm, và theo dõi phép còn lại. Gồm 8 bước rõ ràng từ đồng bộ đến khóa công. Liên quan 4 nhóm actor: nhân viên, quản lý, HR/C&B, bộ phận lương.

## Key Takeaways

- **8 bước tính công**: (1) Đồng bộ dữ liệu chấm công → (2) Xác định ca → (3) Tính đi trễ/về sớm/OT → (4) Tổng hợp ngày công → (5) Sinh bảng công → (6) Gửi phê duyệt → (7) HR khóa công → (8) Chuyển sang tính lương
- Đầu vào: máy chấm công, đăng ký nghỉ phép, đăng ký OT, ca làm việc, điều chỉnh công
- Đầu ra: bảng công NV, dữ liệu tính lương, báo cáo công, thống kê OT/nghỉ phép/vi phạm
- Module tính công là nơi **"nhiều rule nhất hệ thống"** — ca đêm, OT chồng giờ, nghỉ giữa kỳ, thai sản, nghỉ việc giữa tháng

## Trích dẫn quan trọng

> "Tính công" là quy trình tổng hợp và xử lý dữ liệu chấm công của nhân viên để phục vụ tính lương và quản lý nhân sự.

> Trong HRM thực tế, module tính công thường là nơi "nhiều rule nhất hệ thống", vì phải xử lý đủ loại tình huống như ca đêm, OT chồng giờ, nghỉ giữa kỳ, thai sản, nghỉ việc giữa tháng...

## Liên kết

- [[wiki/concepts/ATT-ChamCong]]
- [[wiki/flows/Flow-TinhCong-ATT]]
