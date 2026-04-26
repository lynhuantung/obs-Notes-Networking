---
type: source
tags:
  - bao-hiem
  - BHXH
  - insurance-logic
  - month-join
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/Ins_InsuranceMonthJoin_02.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/sources/INS-InsurancePayback]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# INS — Logic Xác Định Tháng Tham Gia Bảo Hiểm (InsuranceMonthJoin)

## Tóm tắt

Tài liệu mô tả logic nghiệp vụ của hàm/module `InsuranceMonthJoin` — xác định **tháng nào nhân viên tham gia bảo hiểm** dựa trên ngày bắt đầu và kết thúc hợp đồng/bản ghi bảo hiểm. Đây là bước tiền xử lý quan trọng trước khi tính lương BHXH, BHYT, BHTN hằng tháng. Sai logic ở bước này dẫn đến tính sai tiền đóng và tiền trích.

## Key Takeaways

- **Quy tắc cắt tháng**: Tháng tham gia được xác định bởi ngày bắt đầu bản ghi bảo hiểm — nếu bắt đầu từ ngày 1 đến ngày cuối tháng, tháng đó được tính là tháng đóng.
- **Trường hợp biên**: Nhân viên vào/ra giữa tháng → cần xác định ngưỡng (ví dụ: vào trước ngày 15 thì tính cả tháng, sau ngày 15 thì tính từ tháng sau).
- **Trường hợp nhiều bản ghi**: Một nhân viên có thể có nhiều bản ghi bảo hiểm trong một tháng (điều chỉnh, tái ký hợp đồng) → cần merge hoặc ưu tiên bản ghi nào.
- **Liên kết với `InsuranceRecordDayCount`**: Sau khi xác định tháng, hàm đếm ngày bản ghi trong tháng đó được gọi để tính toán số ngày thực tế đóng BH.
- **Output**: Danh sách `(employeeId, month, recordId)` để pass sang module tính lương BH.

## Trích dẫn quan trọng

> Logic chính: nếu `StartDate <= ngày cuối tháng` và `EndDate >= ngày đầu tháng` → bản ghi được tính cho tháng đó.

> Trường hợp đặc biệt: nhân viên nghỉ và quay lại trong cùng một tháng → hai bản ghi riêng, cần tổng hợp.

> Tháng tham gia ≠ tháng phát sinh lương — cần phân biệt rõ để tránh double-count.

## Liên kết

- [[wiki/sources/INS-InsuranceRecordDayCount]] — Bước tiếp theo: đếm ngày trong tháng
- [[wiki/sources/INS-InsurancePayback]] — Logic hoàn trả khi tháng tham gia sai
- [[wiki/sources/INS-Nghi14Ngay]] — Nghỉ ốm 14 ngày ảnh hưởng đến tháng tính BH
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
- [[wiki/projects/VnPay-Project]] — Triển khai thực tế
