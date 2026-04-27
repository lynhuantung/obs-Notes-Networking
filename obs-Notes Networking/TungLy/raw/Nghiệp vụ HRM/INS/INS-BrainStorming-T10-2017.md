---
type: wiki-project
tags: [bao-hiem, brainstorming, ke-hoach, bug-reduction, HRM, 2017]
date-updated: 2026-04-26
related:
  - "[[INS-Overview]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
  - "[[INS-BC-D02]]"
  - "[[INS-Chan-Doan-Su-Co]]"
---

# INS – BrainStorming Mục Tiêu Tháng 10/2017

## Tổng kết tháng 09/2017

### Mục tiêu đề ra

> Giảm số lượng task **Won't Fix** từ **20 task → 10 task** (hết ngày 30/09/2017).

### Kết quả thực tế

| Tháng | Task Bug | Task Won't Fix |
|---|---|---|
| 08/2017 | 59 task | 27 task |
| 09/2017 | 21 task | **6 task** ✅ |

→ **Vượt mục tiêu**: giảm xuống còn 6 task Won't Fix (mục tiêu là 10).

---

### Cách đã giảm task bug & Won't Fix tháng 9

1. **Phân tích nguyên nhân** chi tiết từng task Won't Fix tháng 8 → đưa ra giải pháp khắc phục cho tháng 9.
2. **Thêm trợ giúp** cho màn hình Cấu hình bảo hiểm → khách hàng nắm vững cấu hình hơn.
3. **Bổ sung FAQ sự cố** khi phân tích bảo hiểm + hướng dẫn khắc phục.
4. **Hướng dẫn chi tiết** từng phần tử tính lương BH (phần dễ sai sót nhất).
5. **Hỗ trợ giảm thao tác dư thừa:**
   - Tự động chọn Tháng – Đợt ở màn hình D02, Phân tích bảo hiểm.
   - Combobox "Nơi đóng BH" chỉ hiển thị những gì khách hàng cần.
   - Tự động ẩn mẫu xuất Excel bị "Not Found" → đảm bảo 100% xuất thành công.
6. **Rà soát hàng ngày** từng màn hình phân hệ BH, khắc phục ngay vấn đề phát sinh.
7. Lên kế hoạch fix trước khi đến tay QC / khách hàng.

---

## Mục tiêu tháng 10/2017

> Giải quyết triệt để nguyên nhân bug tháng 09/2017, đồng thời hỗ trợ giảm thiểu thao tác người dùng và đưa các xử lý ở các màn hình gần nhau hơn.

### Phân bổ bug tháng 09/2017

| Màn hình | Số task |
|---|---|
| Phân tích bảo hiểm | 10 |
| Báo cáo D02 | 6 |
| Khác | 4 |

> → **Tập trung xử lý "Phân tích BH" + "Báo cáo D02"** = giải quyết **70% bug** tháng 09/2017 (nguyên lý Pareto).

### Cách giảm bug tháng 10/2017

1. **Tập trung xử lý nguyên nhân gốc** của [[INS-FAQ-Phan-Tich-BH]] và [[INS-BC-D02]].
2. Tiêu chuẩn hoá thành tài liệu riêng + bổ sung vào màn hình hướng dẫn.
3. Khi sửa màn hình → **rà soát TestCase QC liên quan** để tránh break.
4. Suy nghĩ ý tưởng **giảm thiểu thao tác người dùng**.
5. **Đưa các màn hình gần nhau hơn** (UX improvement).

---

## Liên quan

- [[INS-FAQ-Phan-Tich-BH]] – Các trục trặc phân tích BH
- [[INS-BC-D02]] – Vấn đề báo cáo D02
- [[INS-Chan-Doan-Su-Co]] – Chẩn đoán sự cố
- [[INS-Overview]] – Tổng quan phân hệ bảo hiểm
