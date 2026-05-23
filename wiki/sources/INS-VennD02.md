---
type: source
tags:
  - INS
  - D02
  - VNPT
  - Viettel
  - iBHXH
  - TS24
  - I-VAN
  - ke-khai-dien-tu
  - bhxh
  - so-sanh
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/Venn_D02_SuKhacNhau.md
related:
  - "[[wiki/sources/INS-iBHXH-Analyze]]"
  - "[[wiki/sources/INS-D02-ChungTu]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/projects/VnPay-Project]]"
description: "So sánh 3 phần mềm kê khai BHXH điện tử D02-VNPT, D02-Viettel, iBHXH/TS24 qua biểu đồ Venn, flowchart tư vấn và lỗi tích hợp thường gặp."
---

# INS — Sự Khác Nhau D02-VNPT / D02-Viettel / iBHXH (TS24)

## Tóm tắt

Tài liệu so sánh **3 phần mềm kê khai BHXH điện tử** phổ biến nhất tại Việt Nam qua biểu đồ Venn: D02-VNPT, D02-Viettel, và iBHXH (TS24 — phần mềm trung gian I-VAN). Cả 3 đều là **phần mềm trung gian I-VAN** (khác với iBHXH chính thức miễn phí của BHXH Việt Nam). Tài liệu bao gồm bảng so sánh chi tiết, flowchart tư vấn chọn phần mềm, quy trình nộp hồ sơ, lỗi tích hợp thường gặp, và checklist chuyển đổi phần mềm.

## Key Takeaways

- **Điểm chung cả 3**: Đều là I-VAN trung gian, hỗ trợ mẫu D02-LT, yêu cầu chữ ký số, có phí, hỗ trợ BHXH+BHYT+BHTN
- **Điểm khác biệt cốt lõi**:
  - D02-VNPT → tích hợp hệ sinh thái VNPT (hóa đơn, chữ ký số VNPT), phù hợp DN đang dùng VNPT
  - D02-Viettel → có mobile app (VssID), hỗ trợ 24/7, phù hợp DN dùng Viettel-CA
  - iBHXH (TS24) → **chuyên sâu nghiệp vụ nhất**, cập nhật biểu mẫu nhanh nhất, phù hợp DN lớn >100 lao động
- **Phân biệt quan trọng**: `iBHXH (TS24)` ≠ `iBHXH chính thức của BHXH Việt Nam` (miễn phí, kết nối trực tiếp)
- **Quy trình HRM → BHXH**: HRM tính toán → xuất D02-LT → nhập vào phần mềm kê khai → ký số → nộp qua I-VAN → BHXH tiếp nhận
- **Lỗi tích hợp phổ biến**: mã BHXH sai format, encoding XML (UTF-8 vs ANSI), tỷ lệ đóng BH sai cấu hình HRM, trùng hồ sơ tháng trước, chữ ký số hết hạn
- **Tư vấn theo quy mô**: <50 LĐ → chọn theo nhà cung cấp hiện tại; 50-200 LĐ → theo ưu tiên kỹ thuật/chi phí; >200 LĐ → iBHXH (TS24)

## Trích dẫn quan trọng

> **Ghi chú**: Cả 3 đều là phần mềm **trung gian (I-VAN)** — nghĩa là hồ sơ được gửi qua cổng I-VAN của từng nhà cung cấp trước khi đến hệ thống BHXH Việt Nam. Khác với **iBHXH chính thức** của BHXH Việt Nam (ibhxh.vss.gov.vn — miễn phí, kết nối trực tiếp).

> **Lỗi Viettel**: "Encoding XML bị sai (UTF-8 vs ANSI)" — lỗi phổ biến khi xuất file từ HRM sang D02-Viettel.

> **Lỗi TS24**: "Tỷ lệ đóng BH sai do cấu hình HRM" → Đối chiếu tỷ lệ với quy định hiện hành trước khi nộp.

> **Checklist chuyển đổi**: Luôn xuất toàn bộ lịch sử đóng BH từ phần mềm cũ, đối chiếu số liệu tháng cuối, test file XML trước khi nộp thật.

## Liên kết

- **Cổng iBHXH chi tiết**: [[wiki/sources/INS-iBHXH-Analyze]] — phân tích luồng tích hợp HRM → iBHXH
- **Chứng từ D02-TS**: [[wiki/sources/INS-D02-ChungTu]] — biểu mẫu D02 tham gia/điều chỉnh BH
- **Phân hệ Bảo Hiểm**: [[wiki/concepts/HRM-Modules]] (mục 3. Bảo Hiểm)
- **VnPay tích hợp MISA**: [[wiki/projects/VnPay-Project]] — so sánh lộ trình MISA vs iBHXH (TS24)
- **Nguồn gốc**: [[wiki/sources/INS-TruyNguyenNhan]] — phương pháp xử lý khi lỗi tích hợp xảy ra
