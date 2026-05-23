---
type: source
description: "Phân tích chứng từ D02 bảo hiểm: sơ đồ Venn so sánh các loại phiếu D02 và quy trình thêm phần tử."
tags:
  - bao-hiem
  - D02
  - chung-tu
  - bieu-mau
  - venn-diagram
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/Venn_D02_SuKhacNhau.png + D02_ThemPhanTu.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-C70-TinhLuong]]"
  - "[[wiki/sources/INS-iBHXH-Analyze]]"
  - "[[wiki/sources/INS-InsurancePayback]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# INS — Chứng Từ D02 (Biểu Mẫu Tham Gia & Điều Chỉnh BHXH)

## Tóm tắt

Hai tài liệu `Venn_D02_SuKhacNhau.png` và `D02_ThemPhanTu.png` phân tích **biểu mẫu D02-TS** — chứng từ khai báo tham gia và điều chỉnh BHXH-BHYT-BHTN. D02 là chứng từ quan trọng nhất trong giao dịch với cơ quan BHXH: mọi biến động nhân sự (vào, ra, thay đổi lương BH) đều phải khai báo qua D02. Tài liệu Venn diagram so sánh sự khác nhau giữa các phiên bản/loại D02, còn `D02_ThemPhanTu` mô tả cách thêm phần tử mới vào chứng từ.

## Key Takeaways

- **D02-TS là gì**: Mẫu "Danh sách lao động tham gia BHXH, BHYT, BHTN" — nộp hàng tháng cho cơ quan BHXH.
- **Các loại biến động trên D02**:
  - Loại 1: Tham gia lần đầu (mã 01)
  - Loại 2: Điều chỉnh mức lương đóng (mã 02)
  - Loại 3: Chấm dứt đóng (nghỉ việc, hưu, ...) (mã 03)
  - Loại 4: Thay đổi thông tin khác (mã 04)
- **Venn diagram — So sánh D02 phiên bản cũ vs mới**:
  - Phần giao: các trường bắt buộc không đổi (mã NV, họ tên, mức lương, ngày tham gia)
  - Phần riêng phiên bản cũ: một số trường bị bỏ
  - Phần riêng phiên bản mới: trường mới bổ sung (mã số thuế NLĐ, loại hợp đồng, ...)
- **D02_ThemPhanTu — Thêm phần tử vào D02**:
  - Mô tả cách HRM map dữ liệu nội bộ sang từng trường của D02
  - Xử lý trường hợp phần tử optional: nếu null thì bỏ hoặc để trống tùy quy định
  - Thứ tự phần tử trong XML quan trọng — sai thứ tự → iBHXH từ chối
- **Đối soát**: Tổng tiền đóng trên D02 phải bằng tổng cột BH trên C70.

## Trích dẫn quan trọng

> D02 là "hợp đồng" giữa doanh nghiệp và BHXH — mọi sai sót phải nộp D02 điều chỉnh trong tháng phát hiện.

> Thứ tự XML trong D02 theo đúng schema của iBHXH — nếu thêm trường mới, phải đặt đúng vị trí.

> Venn diagram cho thấy: 80% trường giữ nguyên qua các phiên bản — chỉ cần xử lý phần delta khi upgrade.

## Cấu trúc D02 (trường chính)

```
D02-TS
├── Thông tin doanh nghiệp (mã đơn vị, tên, địa chỉ)
├── Kỳ khai báo (tháng/năm)
└── Danh sách NLĐ
    ├── Mã số BHXH
    ├── Họ tên
    ├── Ngày sinh
    ├── Loại biến động (01/02/03/04)
    ├── Mức lương đóng BH
    ├── Ngày bắt đầu / kết thúc
    └── Ghi chú
```

## Liên kết

- [[wiki/sources/INS-C70-TinhLuong]] — C70 và D02 phải đối soát khớp
- [[wiki/sources/INS-iBHXH-Analyze]] — D02 được upload lên iBHXH
- [[wiki/sources/INS-InsurancePayback]] — Hoàn trả → D02 điều chỉnh
- [[wiki/sources/INS-InsuranceMonthJoin]] — Ai có trong D02 tháng này
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
- [[wiki/projects/VnPay-Project]] — Triển khai thực tế
