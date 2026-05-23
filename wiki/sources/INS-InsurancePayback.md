---
type: source
tags:
  - bao-hiem
  - BHXH
  - insurance-logic
  - payback
  - hoan-tra
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/Ins_InsurancePayback_04.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/projects/VnPay-Project]]"
description: "Logic hoàn trả tiền bảo hiểm khi đóng sai tháng hoặc nhân viên nghỉ việc hồi tố, ảnh hưởng quyết toán lương."
---

# INS — Logic Hoàn Trả Bảo Hiểm (InsurancePayback)

## Tóm tắt

Tài liệu mô tả logic `InsurancePayback` — xử lý trường hợp **hoàn trả tiền bảo hiểm** khi đã đóng sai (đóng thừa, đóng cho tháng không hợp lệ, hoặc nhân viên nghỉ việc hồi tố). Đây là nghiệp vụ phức tạp vì liên quan đến điều chỉnh ngược nhiều tháng, đối soát với cơ quan BHXH, và ảnh hưởng đến quyết toán lương.

## Key Takeaways

- **Nguyên nhân phát sinh hoàn trả**:
  - Nhân viên nghỉ việc nhưng đã đóng BH cho tháng tiếp theo
  - Điều chỉnh mức lương đóng BH sau khi đã nộp
  - Sai tháng tham gia (do lỗi `InsuranceMonthJoin`)
  - Hợp đồng bị hủy hồi tố
- **Quy trình hoàn trả**:
  1. Phát hiện chênh lệch giữa số đã đóng và số đúng
  2. Tạo bút toán điều chỉnh âm (reversal entry)
  3. Ghi nhận vào tháng phát sinh điều chỉnh (không sửa tháng gốc)
  4. Tổng hợp vào báo cáo đối soát BHXH
- **Nguyên tắc kế toán**: Hoàn trả không được xóa dữ liệu gốc — chỉ tạo bút toán đối ứng âm.
- **Liên kết với D02**: Hoàn trả phải được phản ánh trên biểu mẫu D02 tháng điều chỉnh.
- **Rủi ro**: Hoàn trả nhiều tháng cùng lúc dễ gây sai số nếu không có transaction rollback.

## Trích dẫn quan trọng

> Hoàn trả BH = tạo bản ghi âm trong cùng kỳ lương, không sửa dữ liệu lịch sử.

> Khi nhân viên nghỉ giữa tháng: tính ngày thực tế đóng BH trong tháng, phần còn lại hoàn trả theo tỷ lệ ngày.

> Điều kiện hoàn trả hợp lệ: bản ghi gốc đã được xác nhận và đã chuyển cho BHXH — nếu chưa chuyển thì sửa trực tiếp bản ghi gốc.

## Liên kết

- [[wiki/sources/INS-InsuranceMonthJoin]] — Lỗi xác định tháng là nguyên nhân chính gây hoàn trả
- [[wiki/sources/INS-InsuranceRecordDayCount]] — Tính ngày thực tế để xác định mức hoàn trả
- [[wiki/sources/INS-D02-ChungTu]] — Hoàn trả được phản ánh trên D02
- [[wiki/sources/INS-FishBone-Analysis]] — Phân tích nguyên nhân gốc rễ của lỗi BH
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
- [[wiki/projects/VnPay-Project]] — Triển khai thực tế
