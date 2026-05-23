---
type: source
description: "Lỗi Expression Expected khi phân tích công thức bảo hiểm INS, phân tích nguyên nhân và hướng fix phần tử BH."
code: m3pw
tags:
  - bug-fix
  - ins
  - phan-tich-bh
  - cong-thuc
  - phan-tu-bh
  - expression-expected
domain: ins
created: 2026-05-02
updated: 2026-05-02
source-file: raw/Nghiệp vụ HRM/INS/2026-05-02-ins-loi-phan-tich-bh-expression-expected-phan-tu-bh.md
related:
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/sources/INS-FAQ-4GocNhinTrucTrac]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/sources/INS-Troubleshooting-5Why]]"
---

# INS — Lỗi Phân Tích BH: Expression Expected (Phần Tử BH Thiếu)

## Tóm tắt

Ghi chép bug phân tích bảo hiểm ngày 02/05/2026: khi phân tích BH tháng 12/2025 cho NV mã 0015 (nghỉ việc 09/12/2025), hệ thống báo lỗi `Insurance Formular working days Error : Expression expected` thay vì ra kết quả giảm BH. Nguyên nhân là công thức tính ngày làm việc trong chế độ BH tham chiếu đến phần tử bảo hiểm không tồn tại hoặc chuỗi công thức rỗng. Fix: bổ sung phần tử BH còn thiếu + sửa công thức → phân tích ra đúng NV 0015 không đóng BH tháng 12/2025.

## Key Takeaways

- **Triệu chứng chính**: `ElementList : ,` (rỗng) + `Formular :` (rỗng) trong thông báo lỗi
- **Root cause**: Phần tử BH được dùng trong công thức ngày công (working days) bị xóa hoặc chưa tạo trong `Danh mục > Phần tử bảo hiểm`
- **Chuỗi nguyên nhân**: Lỗi "Expression expected" ← Formular rỗng ← Phần tử BH thiếu ← Chế độ BH/lương cấu hình sai tên phần tử
- **Fix 3 bước**: (1) Kiểm tra Danh mục Phần tử BH → (2) Đối chiếu tên phần tử trong công thức → (3) Phân tích lại
- **Dấu hiệu nhận biết nhanh**: `ElementList : ,` = không có phần tử nào load được → nguyên nhân chắc chắn là thiếu phần tử BH
- **Không phải lỗi dữ liệu NV**: NV có đầy đủ lương BHXH, hợp đồng vẫn báo lỗi → nguyên nhân nằm ở cấu hình danh mục, không phải hồ sơ
- **Verified**: phân tích sau fix → NV 0015 `IsQuit=true` tháng 12, không đóng BH đúng

## Trích dẫn quan trọng

> `Insurance Formular working days Error : Expression expected.. Employee Code [0015]. ElementList : , Formular :`

> Lỗi `ElementList : ,` (rỗng) là dấu hiệu chắc chắn của thiếu phần tử BH — không cần tìm nguyên nhân khác.

> Lỗi `Expression expected` trong INS thường do công thức rỗng hoặc tham chiếu phần tử không tồn tại — KHÔNG phải lỗi dữ liệu NV.

> NV có "đầy đủ dữ liệu lương BHXH, hợp đồng" vẫn báo lỗi → nguyên nhân nằm ở cấu hình danh mục, không phải hồ sơ NV.

## Checklist xử lý khi gặp lỗi công thức BH

```
1. Đọc kỹ ElementList trong thông báo lỗi
   → Rỗng  → vào Danh mục > Phần tử bảo hiểm kiểm tra ngay
   → Có tên → kiểm tra phần tử đó có tồn tại và công thức hợp lệ không

2. Vào Bảo hiểm > Danh mục > Phần tử bảo hiểm
   → Xác định phần tử dùng trong công thức ngày công (working days)
   → Nếu thiếu → tạo lại phần tử với đúng mã

3. Kiểm tra Chế độ bảo hiểm / Chế độ lương áp dụng cho NV
   → Mở công thức tính ngày công
   → Đối chiếu tên phần tử với danh sách Bước 2
   → Sửa nếu sai

4. Phân tích lại BH tháng bị lỗi
```

## Liên kết

- [[wiki/flows/Flow-BaoHiem-Monthly]] — luồng phân tích BH hàng tháng, Err007 liên quan
- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — Bước 5: công thức từ `Cat_InsuranceElement`
- [[wiki/sources/INS-FAQ-4GocNhinTrucTrac]] — checklist 4 góc nhìn INS, góc INS config
- [[wiki/sources/INS-Config-FAQ]] — cấu hình BH, phần tử, công thức ngày công
- [[wiki/sources/INS-Troubleshooting-5Why]] — 5-Why RCA các lỗi INS tương tự
