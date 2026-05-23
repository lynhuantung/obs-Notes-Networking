---
type: source
code: d02f
tags:
  - ins
  - d02
  - ibhxh
  - faq
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
source-file: raw/Nghiệp vụ HRM/INS/D02-FAQ/
related:
  - "[[wiki/sources/INS-D02-ChungTu]]"
  - "[[wiki/sources/INS-IBHXH]]"
  - "[[wiki/sources/INS-VennD02]]"
  - "[[wiki/sources/INS-FAQ-KhongCoDuLieu]]"
  - "[[wiki/flows/Flow-KhaiBaoiBHXH]]"
  - "[[wiki/concepts/HRM-Modules]]"
description: "Bộ câu hỏi thường gặp về D02, xử lý lỗi khai báo iBHXH và troubleshooting quy trình tăng giảm lao động trong hệ thống HRM."
---

# Source: INS D02 FAQ – Bộ câu hỏi thường gặp

## Tóm tắt

Bộ tài liệu FAQ D02 gồm 6 file, được xây dựng từ phân tích trực tiếp mã nguồn `Ins_InsuranceD02Services.cs` (HRM12-GIT). Tài liệu bao gồm quy tắc hỏi ngược khi nhận báo lỗi, so sánh 6 loại báo cáo D02 (TS / V2 / iBHXH tăng-giảm / VietTel / VNPT), checklist chẩn đoán không có dữ liệu, nguyên nhân sai loại iBHXH (TM/TD/ON/DC...), và checklist field trống trên lưới iBHXH tăng. Tài liệu dành cho nghiệp vụ / kế toán BHXH, không yêu cầu đọc code.

## Key Takeaways

- **Hỏi loại báo cáo trước**: D02 TS dùng bảng `Ins_ReportD02Item`, các loại còn lại dùng `Ins_ReportD02ItemV2` — debug sai bảng là mất thời gian
- **5 câu hỏi ngược** khi nhận báo lỗi: loại BC / mã NV / tháng+kỳ / mong muốn gì / gần đây có sửa thiết lập BH không
- **Câu 5 hay bị bỏ qua nhất**: sửa `Ins_TypeD02.IsIIns/IsVIns` hoặc đổi ngày chu kỳ ảnh hưởng toàn bộ kết quả phân tích
- **Sơ đồ 3 tầng chẩn đoán không có data**: [A] chưa phân tích → [B] phân tích nhưng không sinh item → [C] có item nhưng bị filter khi search
- **iBHXH vs VietTel**: `IsIIns` ≠ `IsVIns` — hai flag độc lập, bật cho cái này không tự động bật cái kia
- **TM ưu tiên cao nhất**: nếu NV có hợp đồng BHXH mới trong chu kỳ → `isPriorityIncrease = true` → bỏ qua toàn bộ check lương (DC)
- **Dữ liệu snapshot**: lương, ngày HĐ, phụ cấp trên lưới là snapshot lúc phân tích — sửa hồ sơ sau phải phân tích lại
- **Field từ `Hre_Profile`** (địa chỉ, CMND, ngân hàng...) load mới mỗi lần search — không cần phân tích lại

## Trích dẫn quan trọng

> Câu 5 quan trọng: sửa `Ins_TypeD02.IsIIns/IsVIns`, đổi ngày chu kỳ (`PeriodInsuranceDayPreMonth`...) ảnh hưởng trực tiếp đến việc sinh và hiển thị D02. Hay bị bỏ qua nhất.

> TM ưu tiên cao hơn DC — nếu đủ điều kiện TM thì không sinh DC. Logic: NV có hợp đồng BHXH đầu tiên nằm trong chu kỳ tăng lao động → `isPriorityIncrease = true` → bỏ qua toàn bộ check lương.

> Dữ liệu snapshot: Các field từ `Ins_ReportD02ItemV2` (lương, ngày, số HĐ, phụ cấp...) là snapshot tại thời điểm phân tích. Sửa hồ sơ sau đó không tự cập nhật — phải phân tích lại D02.

## Cấu trúc bộ tài liệu

| File | Nội dung |
|---|---|
| `00-huong-dan-hoi-nguoc.md` | Quy tắc hỏi ngược + index 6 file |
| `01-loai-bao-cao.md` | So sánh 6 loại D02, hàm Search, bảng nguồn, IsIIns/IsVIns |
| `02-khong-co-du-lieu-chung.md` | Sơ đồ [A][B][C] + checklist filter search |
| `03-khong-co-du-lieu-theo-loai.md` | Checklist riêng từng loại + query thiết lập BH |
| `04-sai-loai-ibhxh.md` | Bảng mapping TM/TD/ON/DC... + 5 trường hợp sai loại |
| `05-field-trong-ibhxh-tang.md` | Nguồn từng field lưới iBHXH tăng + checklist field trống |

## Liên kết

- [[wiki/sources/INS-D02-ChungTu]] — biểu mẫu D02-TS gốc, 14 ký hiệu
- [[wiki/sources/INS-IBHXH]] — bảng mã đầy đủ iBHXH tăng/giảm Col0–Col53
- [[wiki/sources/INS-VennD02]] — so sánh D02-VNPT / D02-VietTel / iBHXH
- [[wiki/sources/INS-FAQ-KhongCoDuLieu]] — FAQ phân tích BH không có dữ liệu (góc độ khác)
- [[wiki/flows/Flow-KhaiBaoiBHXH]] — quy trình khai báo iBHXH đầu đến cuối
- [[wiki/architecture/INS-Architecture]] — kiến trúc phân hệ INS
