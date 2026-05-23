---
type: source
code: m3nt
tags:
  - bao-hiem
  - phan-tich-bh
  - khong-co-du-lieu
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
description: "Giải thích 2 điều kiện khiến nhân viên bị loại hoàn toàn khỏi quá trình phân tích bảo hiểm hàng tháng."
---

# INS FAQ — Tại Sao Phân Tích BH Không Có Dữ Liệu?

## Tóm tắt

Tài liệu giải thích 2 điều kiện khiến NV bị loại hoàn toàn khỏi quá trình phân tích BH. Dùng khi PE báo "phân tích xong nhưng không thấy NV X đâu". Kèm checklist hỏi PE theo thứ tự.

## Key Takeaways

- **Điều kiện 1**: `DateQuit < dateStartNewlabor` — NV nghỉ việc trước ngày bắt đầu chu kỳ BH → hệ thống bỏ qua hoàn toàn
- **Điều kiện 2**: Không có bản ghi `Sal_InsuranceSalary` (hoặc HĐ loại đóng BH nếu dùng config HĐ) → chưa được cấu hình đóng BH
- Đây là **wont fix** — logic lọc đúng, vấn đề là dữ liệu thiếu hoặc PE chưa khai báo

## Trích dẫn quan trọng

> NV nghỉ việc vài tháng trước kỳ BH → hệ thống không đưa vào danh sách phân tích — không phải bug.

## Liên kết

- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — bước 1 và bước 2 giải thích lý do lọc NV
- [[wiki/flows/Flow-BaoHiem-Monthly]] — luồng phân tích BH hàng tháng
