---
type: source
code: q5bw
tags:
  - bao-hiem
  - phan-tich-bh
  - quy-trinh
  - ins-service
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/sources/INS-Quy-Trinh]]"
description: "Mô tả chi tiết 5 bước tuần tự quy trình phân tích bảo hiểm hàng tháng trong hệ thống HRM, dùng để đào tạo PE."
---

# INS FAQ — Quy Trình 5 Bước Phân Tích Bảo Hiểm

## Tóm tắt

Tài liệu mô tả chi tiết 5 bước tuần tự trong quy trình phân tích bảo hiểm hàng tháng của hệ thống HRM. Được tổng hợp từ code `InsuranceServices.cs` và trao đổi trực tiếp với SE phụ trách INS (2026-05-02). Đây là tài liệu nội bộ dùng để đào tạo PE và debug khi triển khai.

## Key Takeaways

- **Bước 2** — nguồn tháng tham gia BH tùy config `HasAnalyzeContract`: dùng `Sal_InsuranceSalary` (mặc định) hoặc Hợp đồng; lấy bản ghi `DateEffect` gần nhất trước tháng kiểm tra
- **Edge case tạm hoãn**: NV có `DateComeBack` → ưu tiên lương BHXH sau ngày quay lại
- **Bước 3** — so `DateEffect` với chu kỳ `PeriodInsuranceDayDefaultFrom/To`: trong chu kỳ = đóng tháng N, ngoài = đóng tháng N+1
- **Bước 4** — nguồn ngày nghỉ đa dạng: `Att_Workday`, `Att_Leaveday`, `Ins_InsuranceRecord`, `DailyShift`; NV nghỉ việc dùng `DailyShift` vì không có tổng hợp công
- **Bước 5** — công thức tính lương BH từ `Cat_InsuranceElement`, kết quả vào `SocialInsEmpAmount`, `HealthInsEmpAmount`, `UnemployEmpAmount`

## Trích dẫn quan trọng

> Màn hình lương BHXH (`Sal_InsuranceSalary`) chỉ là trung gian để tránh performance khi truy xuất trực tiếp hợp đồng — hợp đồng có chức năng sync ngược lại lương BHXH.

> NV nghỉ việc không có trong tổng hợp công — bước 4 dùng `DailyShift` làm fallback để tính ngày nghỉ.

## Liên kết

- [[wiki/flows/Flow-BaoHiem-Monthly]] — luồng phân tích BH hàng tháng đầy đủ
- [[wiki/architecture/INS-Architecture]] — kiến trúc phân hệ INS
- [[wiki/sources/INS-Quy-Trinh]] — quy trình INS01 tổng quan
