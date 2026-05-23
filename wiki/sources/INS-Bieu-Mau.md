---
type: source
description: "Tổng hợp các biểu mẫu bảo hiểm HRM: D02, TK01, TK02, C70A, BHXH, BHYT, BHTN và mối liên hệ."
domain: ins
tags: [bao-hiem, bieu-mau, D02, TK01, TK02, C70A, BHXH, BHYT, BHTN]
source-file: raw/Nghiệp vụ HRM/INS/INS-Bieu-Mau.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-TaiLieuBaoHiem-01]]"
  - "[[wiki/sources/INS-ThietKe-V8]]"
  - "[[wiki/sources/INS-D02-ChungTu]]"
  - "[[wiki/sources/INS-C70-TinhLuong]]"
  - "[[wiki/architecture/INS-Architecture]]"
---

# INS — Các Biểu Mẫu Bảo Hiểm (TK01, TK02, D02, C70A)

## Tóm tắt

Tài liệu chi tiết 5 biểu mẫu chính của phân hệ Bảo hiểm HRM: TK01-TS (tờ khai tham gia BHXH/BHYT lần đầu), TK02-TS (thay đổi thông tin), D02-TS (danh sách lao động tăng/giảm hàng tháng), D03-TS (chỉ tham gia BHYT), và C70A (đề nghị giải quyết trợ cấp ốm đau/thai sản). Bao gồm đầy đủ enum xuất báo cáo, bảng ký hiệu D02 (14 mã: AD, CD, DC, GH, KL, OF, ON, TS...), bảng mã điều kiện C70A (22 trường hợp), và BC Kế Toán 01/02.

## Key Takeaways

- **TK01-TS**: 14 enum xuất báo cáo — họ tên, giới tính, dân tộc, địa chỉ, mã BHXH, CMND, nơi KCB...
- **D02-TS**: 14 ký hiệu nghiệp vụ (TM/ON/DC/GH/KL/TS/SB...) — phân biệt tăng/giảm/điều chỉnh/khác
- **D02 cột tiêu chí**: 9 cột chính bao gồm STT, họ tên, số định danh, tiền lương, CV, TN VK, PC khác, từ tháng, ghi chú
- **C70A**: Căn cứ đề nghị trợ cấp ốm đau/thai sản/dưỡng sức — 22 mã điều kiện (SC, SCO2, BDN, ĐV, TS, NCN...)
- Thời hạn quan trọng: **~3 ngày làm việc** sau nộp C70A nhận C70B-HD từ cơ quan BHXH
- **BC Kế Toán 01** (chưa điều chỉnh) vs **BC Kế Toán 02** (đã điều chỉnh)

## Trích dẫn quan trọng

> **Cơ sở lập C70A**: Giấy chứng nhận nghỉ việc hưởng BHXH; Giấy khám chữa bệnh của con; Bản sao sổ y bạ của con, phiếu hội chẩn; Giấy khám thai, bản sao giấy chứng sinh; Bản sao giấy khai sinh, giấy ra viện; Quyết định công nhận việc nuôi con nuôi.

> **Trạng thái D02 — Loại Khác**: Nghỉ luôn sau thai sản, Nghỉ 14 ngày sau thai sản, Nghỉ Việc Mà Tháng Trước Nghỉ >= 14 Ngày, Giảm/Tăng LĐ Do Đổi Nơi Đóng BH.

> Thông thường **~3 ngày làm việc** sau khi nộp C70A, doanh nghiệp nhận được **C70B-HD**.

## Liên kết

- [[wiki/sources/INS-D02-ChungTu]] — Biểu mẫu D02-TS chi tiết + Venn so sánh phiên bản
- [[wiki/sources/INS-C70-TinhLuong]] — Bảng tổng hợp lương C70 đối soát D02
- [[wiki/sources/INS-TaiLieuBaoHiem-01]] — Tài liệu toàn diện INS v8
- [[wiki/sources/INS-ThietKe-V8]] — Thiết kế chức năng INS V8
- [[wiki/architecture/INS-Architecture]] — Architecture phân hệ INS
