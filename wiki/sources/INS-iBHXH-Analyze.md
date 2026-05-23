---
type: source
tags:
  - bao-hiem
  - iBHXH
  - khai-bao-dien-tu
  - BHXH-so
  - integration
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/Ins_iBHXHAnalyze_07.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-D02-ChungTu]]"
  - "[[wiki/sources/H-VnPay-INS-05082025]]"
  - "[[wiki/projects/VnPay-Project]]"
description: "Phân tích luồng tích hợp HRM với cổng khai báo BHXH điện tử iBHXH: xuất file XML, theo dõi trạng thái, xử lý hồ sơ D02."
---

# INS — Phân Tích Hệ Thống iBHXH (Khai Báo Điện Tử)

## Tóm tắt

Tài liệu phân tích luồng tích hợp giữa HRM và hệ thống **iBHXH** (cổng khai báo BHXH điện tử của BHXH Việt Nam). iBHXH là cổng chính thức để doanh nghiệp nộp hồ sơ tham gia, điều chỉnh, và quyết toán BHXH-BHYT-BHTN. HRM cần xuất đúng định dạng XML/file theo chuẩn iBHXH để tải lên, đồng thời theo dõi trạng thái xử lý từ cổng.

## Key Takeaways

- **iBHXH là gì**: Hệ thống tiếp nhận hồ sơ BHXH điện tử — doanh nghiệp đăng ký, điều chỉnh, nộp chứng từ (D02, D03, ...) qua cổng này thay vì nộp giấy.
- **Luồng tích hợp từ HRM**:
  1. HRM tổng hợp dữ liệu BH tháng (danh sách tham gia, mức lương, biến động)
  2. HRM xuất file XML/Excel theo chuẩn iBHXH
  3. Người dùng (kế toán BH) upload lên cổng iBHXH
  4. iBHXH trả về mã tiếp nhận / kết quả duyệt
  5. HRM ghi nhận kết quả để đối soát
- **Các biểu mẫu liên quan**: D02-TS (tham gia, điều chỉnh), D03a (ốm đau, thai sản, tai nạn), D01b (lao động).
- **Rủi ro tích hợp**:
  - Định dạng file thay đổi khi iBHXH cập nhật phiên bản
  - Dữ liệu HRM không khớp với cơ sở dữ liệu BHXH (mã số BHXH, họ tên, ngày sinh)
  - Upload thành công nhưng BHXH từ chối hồ sơ → cần cơ chế theo dõi trạng thái
- **Điểm khác biệt so với MISA**: iBHXH là cổng chính thức của nhà nước, MISA là phần mềm kế toán trung gian — hai hệ thống khác nhau, có thể song song tồn tại.

## Trích dẫn quan trọng

> iBHXH không nhận file real-time — phải tổng hợp theo tháng rồi nộp 1 lần trước deadline (thường ngày 25 tháng sau).

> Lỗi phổ biến: mã số BHXH của nhân viên trên HRM khác với mã trên cổng BHXH → hồ sơ bị từ chối.

> Khi nâng cấp phiên bản iBHXH: phải cập nhật schema XML trong HRM — đây là điểm maintenance thường xuyên.

## Luồng xử lý tóm tắt

```
HRM (dữ liệu BH tháng)
  → Validate & tổng hợp
  → Sinh file XML/Excel chuẩn iBHXH
  → Upload lên cổng iBHXH
  → Nhận mã tiếp nhận
  → Theo dõi trạng thái duyệt
  → Lưu kết quả vào HRM để đối soát
```

## Liên kết

- [[wiki/sources/INS-D02-ChungTu]] — D02 là biểu mẫu chính khai lên iBHXH
- [[wiki/sources/H-VnPay-INS-05082025]] — Họp tích hợp MISA: bối cảnh tích hợp BH
- [[wiki/sources/INS-FishBone-Analysis]] — Lỗi tích hợp iBHXH có trong FishBone
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
- [[wiki/projects/VnPay-Project]] — VnPay là dự án thực tế dùng iBHXH
