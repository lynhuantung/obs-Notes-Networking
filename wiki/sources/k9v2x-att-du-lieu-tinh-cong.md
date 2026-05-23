---
type: source
code: k9v2x
description: "6 nhóm dữ liệu cần để tính công ATT: chế độ công, ca làm việc, quá trình công tác, ngày nghỉ, OT, tổng hợp"
domain: att
tags:
  - att
  - tinh-cong
  - du-lieu
created: 2026-05-10
updated: 2026-05-10
related:
  - "[[wiki/sources/q7r2n-att-tinh-cong]]"
  - "[[wiki/sources/p1a3t-att-overview]]"
  - "[[wiki/sources/m4b8z-att-cong-cong-tru]]"
---

# Source: ATT – Dữ liệu cần để tính công

## Tóm tắt

Tài liệu liệt kê 6 nhóm dữ liệu cần thiết để tính công chính xác trong HRM Pro 8. Mỗi nhóm có nguồn gốc khác nhau: từ catalog cấu hình, từ lịch làm việc, từ hồ sơ nhân sự, từ phiếu đăng ký. Thiếu bất kỳ nhóm nào sẽ ảnh hưởng kết quả bảng công và tính lương downstream.

## Key Takeaways

- **Chế độ công** (Cat_GradeCfg): quy tắc tính công theo nhóm NV — HC, ca kíp, sản xuất, linh hoạt
- **Ca và lịch làm việc**: khung giờ để so sánh với dữ liệu máy chấm công thực tế
- **Quá trình công tác**: điều chuyển, thay đổi chức vụ, nghỉ việc ảnh hưởng kỳ công áp dụng
- **Ngày nghỉ**: 5 loại với logic khác nhau về hưởng lương, tính công, đóng BHXH
- **Tăng ca (OT)**: 3 hệ số (150%/200%/300%+100%), cần số giờ + hệ số + phê duyệt
- **Tổng hợp công**: đầu vào từ 5 nguồn, đầu ra là bảng công + dữ liệu lương

## Trích dẫn quan trọng

> Chế độ công quyết định: cách tính ngày công, quy định đi trễ/về sớm, cách tính OT, quy tắc nghỉ phép.

> Nghỉ thai sản: BHXH trả — không tính vào công ngày thực tế, nhưng vẫn đóng BHXH.

## Liên kết

- [[wiki/sources/q7r2n-att-tinh-cong]] — quy trình 8 bước tính công
- [[wiki/sources/m4b8z-att-cong-cong-tru]] — cách công được cộng/trừ
- [[wiki/sources/n5c1k-att-luat-ngay-nghi]] — chi tiết luật ngày nghỉ
- [[wiki/sources/w3t6p-att-luat-tang-ca]] — chi tiết hệ số OT
