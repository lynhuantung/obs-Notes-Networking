---
description: "Biên bản họp phân tích bảo hiểm TBV (09/2024): trích nộp BH, chế độ ốm đau/thai sản, tích hợp AMIS tờ khai D02 — trường hợp BH nâng cao nhất."
type: source
tags:
  - baohiem
  - tbv
  - meeting
  - misa-amis
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "3. ARCHIEVED/dự án 2024/TBV/H-TBV-INS-160924.md"
related:
  - "[[wiki/entities/TBV]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/H-VnPay-INS-05082025]]"
---

# TBV — Họp Phân Tích Bảo Hiểm (09/2024)

## Tóm tắt

Biên bản họp phân tích bảo hiểm dự án TBV (09/2024), tập trung vào 3 nhóm vấn đề: (1) quản lý trích nộp BH, (2) thanh toán chế độ ốm đau/thai sản, (3) tích hợp AMIS. Đây là một trong những tài liệu **chi tiết nhất về nghiệp vụ BH nâng cao** trong vault. Thành viên: TungLy, MinhNguyendat, NganNguyen, ThongTrinh, Thao.

## Key Takeaways

### Quản lý trích nộp BH
- **Không đủ lương trích nộp**: Cho NV chọn phương án (trừ toàn bộ vào tháng sau)
- **Nghỉ không lương full tháng**: Vẫn đóng BHYT (4.5% NLĐ)
- **Xác nhận chốt dòng BH**: Sau khi phân tích xong, chốt dòng → không chỉnh sửa lại được
- **Nơi đóng BH mặc định**: Thiết lập mặc định theo huyện/quận (VD: BHXH huyện Long Thành)

### Thanh toán chế độ Ốm đau – Thai sản
- **Cảnh báo nghỉ dài ngày**: > 180 ngày
- **Cảnh báo khám thai**: > 5 lần/thai kỳ
- **Nhập số tiền thanh toán**: Từ cơ quan BH trả về
- **Không thay đổi ngày nghỉ** khi thay đổi loại chứng từ
- Có thể đổi loại chứng từ (ốm ngắn ngày → dài ngày)

### Xuất báo cáo BH
- NV giảm ốm/không lương đi làm lại: báo tăng trước → sau đó báo giảm để duy trì thẻ BHYT

### Tích hợp AMIS
- Đang tích hợp tờ khai **D02 (tăng/giảm/điều chỉnh)** qua AMIS
- **01-HSB chưa tích hợp** — vẫn cần trao đổi thêm

## Trích dẫn quan trọng

> "Nhân viên nghỉ không lương full tháng vẫn đóng BHYT (4.5% NLĐ)"

> "Đang tích hợp tờ khai 600 (Tăng/giảm/điều chỉnh), nhưng không thấy tích hợp 01-HSB"

> "Cảnh báo nghỉ dài ngày nếu lớn hơn 180 ngày. Cảnh báo khám thai 5 lần trên 1 thai kỳ"

## Bài học

- TBV có **nhiều nghiệp vụ BH nâng cao nhất** so với các dự án cùng thời kỳ — có thể dùng làm checklist cho dự án mới
- 01-HSB là điểm tích hợp AMIS còn tồn đọng — pattern lặp lại ở nhiều dự án (VnPay-INS, TBV)
- Xác nhận chốt dòng BH là tính năng phòng ngừa data integrity — nên check khi khách hàng có nhiều người phụ trách BH

## Liên kết

- [[wiki/entities/TBV]]
- [[wiki/sources/INS-Nghi14Ngay]]
- [[wiki/sources/INS-NghiThaiSan]]
- [[wiki/sources/H-VnPay-INS-05082025]]
- [[wiki/concepts/HRM-Modules]]
