---
type: source
tags:
  - bao-hiem
  - BHXH
  - nghi-om
  - nghi14ngay
  - che-do-benh
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/Ins_Nghi14Ngay.png
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/projects/VnPay-Project]]"
---

# INS — Quy Tắc Nghỉ Ốm 14 Ngày (Nghỉ 14 Ngày)

## Tóm tắt

Tài liệu mô tả nghiệp vụ **nghỉ ốm hưởng chế độ BHXH** theo quy định: người lao động được hưởng chế độ ốm đau khi nghỉ tối đa **14 ngày làm việc/năm** (điều kiện thông thường) hoặc 30 ngày (bệnh dài ngày, theo danh mục Bộ Y tế). Đây là nguồn phức tạp nghiệp vụ vì phải tách biệt: ngày làm việc vs ngày lịch, ngày BHXH chi trả vs ngày công ty chi trả, và tích lũy qua các tháng.

## Key Takeaways

- **Quy định cơ bản**:
  - Đóng BH dưới 15 năm: tối đa **30 ngày**/năm (bệnh thông thường)
  - Đóng BH từ 15–30 năm: tối đa **40 ngày**/năm
  - Đóng BH trên 30 năm: tối đa **60 ngày**/năm
  - Bệnh nặng/dài ngày: tối đa **180 ngày**/năm
- **"14 ngày"** trong tên tài liệu thường đề cập đến **14 ngày làm việc** — quy đổi từ số ngày lịch phụ thuộc lịch làm việc thực tế của doanh nghiệp.
- **Mức hưởng**: 75% mức lương đóng BHXH (do BHXH chi trả, không phải công ty).
- **Ảnh hưởng đến bản ghi BH**: Thời gian nghỉ ốm hưởng chế độ **vẫn tính là thời gian tham gia BHXH** — không cắt bản ghi bảo hiểm.
- **Tách biệt với nghỉ không hưởng lương**: Nghỉ ốm hưởng BHXH ≠ nghỉ không lương — DayCount bản ghi BH không bị ảnh hưởng.
- **Tích lũy theo năm**: Hệ thống phải đếm tổng ngày nghỉ ốm trong năm để kiểm soát không vượt hạn mức.

## Trích dẫn quan trọng

> Nghỉ ốm hưởng BHXH: bản ghi bảo hiểm không bị ngắt — nhân viên vẫn đóng BHXH bình thường, BHXH chi trả lương thay công ty.

> Lỗi phổ biến: hệ thống cắt bản ghi BH khi nhân viên nghỉ ốm → sai hoàn toàn, phải fix.

> "14 ngày làm việc" = 14 × hệ số (lịch làm việc) — không phải 14 ngày lịch.

## Phân biệt các loại nghỉ ảnh hưởng BH

| Loại nghỉ | Cắt bản ghi BH? | Ai trả lương? | Tính DayCount BH? |
|-----------|----------------|--------------|-------------------|
| Nghỉ ốm hưởng BHXH | ❌ Không | BHXH | ✅ Có |
| Nghỉ thai sản | ❌ Không | BHXH | ✅ Có |
| Nghỉ không hưởng lương | ✅ Có thể | Không ai | ❌ Tùy TH |
| Nghỉ phép năm | ❌ Không | Công ty | ✅ Có |

## Liên kết

- [[wiki/sources/INS-InsuranceRecordDayCount]] — DayCount không bị ảnh hưởng bởi nghỉ ốm hưởng BH
- [[wiki/sources/INS-NghiThaiSan]] — Chế độ tương tự nhưng khác mức hưởng và thời gian
- [[wiki/sources/INS-InsuranceMonthJoin]] — Tháng nghỉ ốm vẫn được tính là tháng tham gia BH
- [[wiki/sources/INS-FishBone-Analysis]] — Lỗi xử lý nghỉ ốm là một nhánh trong FishBone
- [[wiki/concepts/HRM-Modules]] — Tổng quan phân hệ Bảo hiểm
