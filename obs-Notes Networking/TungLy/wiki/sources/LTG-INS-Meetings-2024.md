---
type: source
tags:
  - baohiem
  - ltg
  - meeting
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "1. Projects/LTG/H-LTG-INS-080724.md + H-LTG-INS-250724.md"
related:
  - "[[wiki/entities/LTG]]"
  - "[[wiki/projects/LTG-Project]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceRecordDayCount]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
---

# LTG — Họp Bảo Hiểm (07/2024)

## Tóm tắt

2 biên bản họp về bảo hiểm trong dự án LTG Phase 3 (post-UAT), tháng 07/2024. Tập trung vào 2 vấn đề: (1) logic đồng bộ chứng từ BHXH, (2) cách tính ngày nghỉ hàng tuần/ngày lễ riêng theo yêu cầu LTG.

**Họp 08/07/2024** — TungLy, ThongTrinh, MinhNguyendat, Thao.Phan
**Họp 25/07/2024** — TungLy, TienDang, MinhNguyendat

## Key Takeaways

- **Đồng bộ nút Duyệt chứng từ BHXH**: Khi nhấn Duyệt phải lấy dữ liệu đầy đủ từ bảng Ngày nghỉ chờ CT BHXH + bảng lưu tạm chứng từ → đẩy sang bảng Chứng từ BHXH
- **Nghỉ 14 ngày đặc thù**: Ca làm việc LTG = 12 ngày/tháng (24h/ngày) → không bao giờ đủ 14 ngày nghỉ theo cách tính chuẩn → **giải pháp**: tính số ngày đi làm từ phần tử bảo hiểm (tính công trước)
- **Ngày nghỉ không dùng Cat_DayOff**: LTG yêu cầu ngày nghỉ hàng tuần = Thứ 7 + Chủ nhật (cố định), ngày lễ không lấy từ danh mục `Cat_DayOff` chuẩn
- **Thai sản**: Load ngày dự sinh từ quá trình thai sản vào loại chứng từ sẩy thai — đã đáp ứng
- **Pending**: Khi NV kế thừa bị kỷ luật, cảnh báo L&D → chưa có giải pháp, cần chốt với Bao.Tran và Hoàng.Huynh

## Trích dẫn quan trọng

> "Nghỉ 14 ngày: 1 ngày làm 24 tiếng => 1 tháng chỉ làm 12 ngày => không bao giờ nghỉ hơn 14 ngày. Giải pháp: tính số ngày đi làm từ phần tử bảo hiểm (tính công trước)"

> "Ngày nghỉ hàng tuần: Thứ 7, Chủ Nhật. Ngày nghỉ lễ: không dựa vào Cat_DayOff"

## Bài học

- Ca làm việc đặc thù (24h/ngày, 12 ngày/tháng) làm sai hoàn toàn logic nghỉ 14 ngày tiêu chuẩn → **cần xác nhận ca làm việc sớm với mỗi khách hàng BH**
- Ngày nghỉ lễ theo Cat_DayOff là giả định ngầm của HRM — LTG là trường hợp ngoại lệ cần config riêng

## Liên kết

- [[wiki/entities/LTG]]
- [[wiki/sources/INS-Nghi14Ngay]] — nghiệp vụ 14 ngày chuẩn
- [[wiki/sources/INS-InsuranceRecordDayCount]] — cách đếm ngày bản ghi BH
- [[wiki/concepts/HRM-Modules]]
