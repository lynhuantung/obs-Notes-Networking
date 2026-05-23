---
type: source
tags:
  - bao-hiem
  - BHXH
  - thai-san
  - che-do-thai-san
  - maternity
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/NghiThaiSan.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/projects/VnPay-Project]]"
description: "Chế độ nghỉ thai sản theo Luật BHXH: 6 tháng hưởng 100%, xử lý các trường hợp đặc biệt sinh đôi, sảy thai, khai D03a."
---

# INS — Chế Độ Nghỉ Thai Sản

## Tóm tắt

Tài liệu mô tả nghiệp vụ **chế độ thai sản** theo Luật BHXH Việt Nam: lao động nữ sinh con được nghỉ **6 tháng** hưởng chế độ (100% mức lương đóng BHXH), do BHXH chi trả. Đây là chế độ có nhiều trường hợp đặc biệt: sinh đôi, sinh mổ, sảy thai, thai chết lưu — mỗi trường hợp có thời gian và mức hưởng khác nhau. Hệ thống HRM phải xử lý đúng để khai D03a và quyết toán với BHXH.

## Key Takeaways

- **Thời gian nghỉ chuẩn**: 6 tháng (trước + sau sinh), không tính ngày lễ/Tết vào thời gian nghỉ.
- **Sinh đôi trở lên**: thêm 1 tháng cho mỗi con tiếp theo.
- **Sinh mổ**: không thêm thời gian (khác quy định cũ).
- **Sảy thai / thai chết lưu**: 10–50 ngày tùy tuổi thai.
- **Mức hưởng**: 100% lương đóng BHXH × số tháng nghỉ — **cao hơn nghỉ ốm** (75%).
- **Bản ghi BH trong thai sản**: Không cắt bản ghi — nhân viên vẫn được tính là tham gia BHXH, BHYT trong suốt thời gian nghỉ.
- **Phân hệ HRM cần xử lý**:
  - Tạo đơn nghỉ thai sản với ngày bắt đầu/kết thúc
  - Tính tiền hưởng chế độ (để khai với BHXH)
  - Không trừ lương công ty trong kỳ nghỉ
  - Vẫn đóng BHYT cho nhân viên trong kỳ nghỉ thai sản

## Trích dẫn quan trọng

> Thai sản ≠ nghỉ không lương — nhân viên vẫn thuộc biên chế, bản ghi BH không ngắt.

> Hệ thống phải tách biệt: "tiền hưởng chế độ" (BHXH trả) và "lương thực nhận" (công ty trả bổ sung nếu có).

> Lỗi phổ biến: cắt bản ghi BHYT khi nhân viên nghỉ thai sản → sai, vì BHYT vẫn có hiệu lực.

## So sánh các chế độ nghỉ hưởng BHXH

| Chế độ | Thời gian | Mức hưởng | Bản ghi BH |
|--------|-----------|-----------|-----------|
| Nghỉ ốm (thông thường) | 30–60 ngày/năm | 75% | Không cắt |
| Nghỉ thai sản | 6 tháng | 100% | Không cắt |
| Tai nạn lao động | Tùy mức độ | 100% | Không cắt |
| Nghỉ không lương | Thỏa thuận | 0% | Có thể cắt |

## Liên kết

- [[wiki/sources/INS-Nghi14Ngay]] — So sánh: nghỉ ốm vs thai sản
- [[wiki/sources/INS-InsuranceRecordDayCount]] — DayCount không bị cắt trong thai sản
- [[wiki/sources/INS-InsuranceMonthJoin]] — Tháng thai sản vẫn là tháng tham gia BH
- [[wiki/sources/INS-D02-ChungTu]] — Khai báo chế độ thai sản trên chứng từ
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
