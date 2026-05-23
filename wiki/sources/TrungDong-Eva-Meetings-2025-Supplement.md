---
description: "2 biên bản họp bổ sung TrungDong Phase II (01+03/2025): Đánh giá KPI 4 quý, Nhân Tài, chuẩn bị UAT2 với 32 modify + 10 bug."
type: source
tags:
  - trungdong
  - danh-gia
  - nhan-tai
  - uat
  - meeting
  - archived-2025
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "3. ARCHIEVED/dự án 2025/TrungDong-Project/Meeting_Notes/H-TrungDong-Eva-06012025.md + H-TrungDong-Eva-04032025.md"
related:
  - "[[wiki/projects/TrungDong-Project]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/H-TrungDong-Eva-14042025]]"
  - "[[wiki/sources/H-TrungDong-Eva-31122024]]"
---

# TrungDong — Họp Đánh Giá & Nhân Tài Phase II Bổ Sung (01 + 03/2025)

## Tóm tắt

2 biên bản họp bổ sung của dự án TrungDong Phase II (01/2025 và 03/2025), tập trung vào nghiệp vụ **Đánh giá KPI** và **Nhân Tài** chuẩn bị cho UAT2. Deadline chính: 25/03/2025 — hoàn thành 32 modify + 10 bug.

## Key Takeaways

### Đánh giá KPI (01/2025)
- **Đánh giá 4 quý**: Tổng giám đốc muốn đánh giá 1 lần cho 4 quý (không phải từng quý riêng lẻ)
- **Mức độ quan trọng**: Có thể điều chỉnh khi tạo bảng đánh giá hoặc giao mục tiêu
- **Thêm enum đánh giá**: Gọi kết quả KPI cho tiêu chí lấy dữ liệu có sẵn trên hệ thống
- **Scheduler task**: Chạy tự động thứ tự cấp đánh giá
- **Mẫu mail đánh giá 360**: Gửi đến tất cả người đánh giá

### Đánh giá & Nhân Tài (03/2025 — UAT2 prep)
**Tổng**: 18 task sau khi gộp (4 task cần trao đổi KH, còn lại làm ngay)

**Đánh giá**:
- Thêm điều kiện tìm kiếm theo phòng ban + loại tiêu chí (KPI/Competency)
- Import mục tiêu: thiếu field mức độ quan trọng + điểm
- Tạo mục tiêu: người duyệt + làm tròn
- Quy tắc: chưa thống nhất → làm sau 25/03
- Chuyển tự động năng lực → tiêu chí đánh giá: cần chốt KH

**Nhân Tài**:
- Thêm field lĩnh vực cho: vị trí chủ chốt, kinh nghiệm
- Thêm điều kiện phân tích vị trí chủ chốt theo lĩnh vực
- Phân tích đào tạo đội ngũ kế cận

## Bài học

- TrungDong Phase II có **scope lớn hơn dự kiến** (32 modify + 10 bug gộp thành 18 task) — lesson: gộp task trước UAT hiệu quả hơn theo dõi riêng lẻ
- Đánh giá KPI multi-quý là yêu cầu phổ biến — pattern tái sử dụng

## Liên kết

- [[wiki/projects/TrungDong-Project]]
- [[wiki/sources/H-TrungDong-Eva-14042025]]
- [[wiki/sources/H-TrungDong-Eva-31122024]]
- [[wiki/concepts/HRM-Modules]]
