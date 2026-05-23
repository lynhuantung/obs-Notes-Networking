---
type: source
code: q7r2n
description: "Quy trình tính công ATT 8 bước: đồng bộ máy chấm công → sinh bảng công → chuyển sang lương; đầu vào và đầu ra"
domain: att
tags:
  - att
  - tinh-cong
  - nghiep-vu
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/flows/Flow-TinhCong-ATT]]"
  - "[[wiki/sources/p1a3t-att-overview]]"
  - "[[wiki/sources/k9v2x-att-du-lieu-tinh-cong]]"
  - "[[wiki/sources/m4b8z-att-cong-cong-tru]]"
---

# Source: ATT – Quy trình tính công

## Tóm tắt

Tài liệu mô tả mục đích và quy trình 8 bước tính công trong HRM Pro 8 (tháng 5/2026). Tính công là quy trình tổng hợp dữ liệu chấm công phục vụ tính lương, tăng ca, nghỉ phép, vi phạm công. Có 5 nguồn đầu vào và 4 loại kết quả đầu ra. Liên quan đến 4 nhóm actor: nhân viên, quản lý, HR/C&B, bộ phận lương.

## Key Takeaways

- 8 bước: Đồng bộ → Xác định ca → Tính trễ/sớm/OT → Tổng hợp công → Sinh bảng công → Gửi duyệt → HR khóa → Chuyển lương
- 5 nguồn đầu vào: máy chấm công, đăng ký nghỉ, đăng ký OT, ca/lịch làm việc, điều chỉnh công
- 4 kết quả: bảng công nhân viên, dữ liệu tính lương, báo cáo công, thống kê OT/nghỉ/vi phạm
- Module ATT phức tạp nhất vì xử lý ca đêm, OT chồng giờ, thai sản, nghỉ việc giữa tháng

## Trích dẫn quan trọng

> "Tính công" là quy trình tổng hợp và xử lý dữ liệu chấm công của nhân viên để phục vụ: Tính lương, Tính giờ tăng ca, Xác định ngày nghỉ, Ghi nhận đi trễ / về sớm, Theo dõi số ngày phép còn lại, Làm căn cứ cho bảo hiểm, thuế và đánh giá nhân sự.

## Liên kết

- [[wiki/flows/Flow-TinhCong-ATT]] — sơ đồ luồng 8 bước chi tiết
- [[wiki/sources/k9v2x-att-du-lieu-tinh-cong]] — 6 loại dữ liệu đầu vào
- [[wiki/sources/m4b8z-att-cong-cong-tru]] — công cộng và công trừ
