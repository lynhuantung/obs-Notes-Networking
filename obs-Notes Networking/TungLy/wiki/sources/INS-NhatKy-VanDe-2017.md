---
type: source
tags: [bao-hiem, bug, thai-san, D02, C70, BC, timezone, brainstorming, 2017]
created: 2026-04-27
updated: 2026-04-27
domain: ins
related:
  - [[wiki/concepts/HRM-Modules]]
  - [[wiki/sources/INS-FishBone-Analysis]]
  - [[wiki/sources/INS-C70-TinhLuong]]
  - [[wiki/sources/INS-Kaizen-08]]
---

# INS — Nhật Ký Vấn Đề Phân Hệ Bảo Hiểm (2017)

## Tóm tắt

Nhật ký ghi lại các vấn đề kỹ thuật **khó và logic dài** trong phân hệ Bảo Hiểm của VnResource HRM Pro, phiên bản 1.0 (08/2017). Tác giả: Tung.Ly. Bao gồm 3 bug mantis cụ thể và kế hoạch cải tiến tháng 10/2017.

## Key Takeaways

### Nguyên tắc tổng quát
- Đa số vấn đề bảo hiểm do **thiếu dữ liệu** → VNR xử lý phía server
- **"Hiện trường và dữ liệu tại hiện trường là không giống nhau"** — cần lôi kéo khách hàng cùng suy nghĩ
- Nhóm nguyên nhân 4M: **Con người – Máy chủ – Dữ liệu đầu vào – Phương pháp**

### Bug 1 — BC D02 không hiển thị điều chỉnh lương khi nghỉ thai sản (Mantis 57589)
- **Triệu chứng**: Khi NV nghỉ thai sản hoặc nghỉ ≥ 14 ngày → hệ thống không hiển thị phần điều chỉnh lương lên báo cáo D02
- **Ảnh hưởng**: Các khách hàng có sử dụng báo cáo D02

### Bug 2 — Nguyên tắc ON-OFF Thai Sản (Mantis 57594)
- **ON** (được đóng BH tháng N): ngày bắt đầu thai sản rơi vào ngày 15 tháng N-1 → ngày 14 tháng N
- **OFF** (không đóng BH tháng N): ngày kết thúc thai sản rơi vào ngày 15 tháng N-1 → ngày 14 tháng N

### Bug 3 — Phân tích BH tháng N ra tháng N-1 (Mantis 87680)
- **Triệu chứng**: Chọn tháng 9 nhưng kết quả trả về dữ liệu tháng 8
- **Nguyên nhân gốc**: **Múi giờ (timezone) giữa server và client không đồng bộ**
- **Xử lý**: Chỉnh múi giờ server/client đồng bộ → Restart server

### Kế hoạch BrainStorming tháng 10/2017
- Tháng 8/2017: 59 task bug, 27 Won't Fix
- Tháng 9/2017: **21 task bug, 6 Won't Fix** ✅ (mục tiêu 10, đạt 6)
- **Pareto principle**: Phân tích BH (10 task) + Báo cáo D02 (6 task) = **70% bug** → tập trung xử lý 2 màn hình này
- Cách giảm bug tháng 9: Phân tích nguyên nhân gốc, thêm trợ giúp cấu hình BH, FAQ sự cố, hướng dẫn phần tử lương BH, UX improvements

## Trích dẫn quan trọng

> "Hiện trường và dữ liệu tại hiện trường là không giống nhau." — nguyên tắc cốt lõi khi debug BH

> Giảm Won't Fix từ 27 (tháng 8) → 6 (tháng 9) bằng cách tập trung phân tích nguyên nhân gốc

> Nguyên lý Pareto: xử lý triệt để 2 màn hình "Phân tích BH" và "Báo cáo D02" = giải quyết 70% bug

## Liên kết

- [[wiki/sources/INS-Troubleshooting-5Why]] — Root cause 5-Why chi tiết
- [[wiki/sources/INS-ThietKe-V8]] — Tài liệu thiết kế chức năng INS V8
- [[wiki/sources/INS-FishBone-Analysis]] — Fishbone diagram phân hệ BH
- [[wiki/sources/INS-Kaizen-08]] — Kaizen cải tiến phân hệ BH
- [[wiki/sources/INS-C70-TinhLuong]] — Chi tiết tính lương C70
