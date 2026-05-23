---
title: "INS — Lỗi phân tích BH: Insurance Formular working days Error Expression expected"
date: 2026-05-02
code: ins027
domain: ins
module: "Phân tích bảo hiểm / Phần tử bảo hiểm"
tags:
  - bug-fix
  - ins
  - phan-tich-bh
  - cong-thuc
  - phan-tu-bh
verified: yes
related:
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/sources/INS-FAQ-4GocNhinTrucTrac]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
---

# INS — Lỗi phân tích BH: Insurance Formular working days Error Expression expected

## Tóm tắt

Khi phân tích bảo hiểm tháng 12/2025 cho NV mã 0015 (nghỉ việc 09/12/2025),
hệ thống báo lỗi thay vì ra kết quả giảm BH. Lỗi xuất hiện tại màn hình
Bảo hiểm > Phân tích bảo hiểm sau khi bấm nút "Phân tích".

## Triệu chứng

Thông báo lỗi hiển thị:
```
Insurance Formular working days Error : Expression expected..
Employee Code [0015].
ElementList : ,
Formular :
```

- `ElementList` rỗng → không có phần tử nào được load vào công thức
- `Formular` rỗng → công thức ngày công trong chế độ BH không có giá trị
- NV có đầy đủ dữ liệu: lương BHXH, hợp đồng, đăng ký nghỉ việc 09/12/2025

## Phân tích nguyên nhân

### Root Cause

Công thức tính ngày làm việc (working days) trong **chế độ bảo hiểm** hoặc
**chế độ lương** tham chiếu đến phần tử bảo hiểm không tồn tại trong danh mục,
hoặc chuỗi công thức bị rỗng/null → parser báo `Expression expected`.

### Chuỗi nguyên nhân

```
Lỗi "Expression expected" khi phân tích BH
  ← Formular rỗng / ElementList rỗng
    ← Phần tử BH được dùng trong công thức bị xóa hoặc chưa được tạo
      ← Chế độ BH / Chế độ lương cấu hình công thức sai tên phần tử
```

## Giải pháp đã áp dụng

**Bước 1**: Vào **Bảo hiểm > Danh mục > Phần tử bảo hiểm**
- Kiểm tra danh sách phần tử đang có
- Xác định phần tử nào đang được dùng trong công thức ngày công (working days)
- Nếu phần tử bị thiếu → tạo lại phần tử với đúng mã

**Bước 2**: Kiểm tra **Chế độ bảo hiểm** (hoặc Chế độ lương áp dụng cho NV 0015)
- Mở công thức tính ngày công
- Đối chiếu tên phần tử trong công thức với danh sách tại Bước 1
- Nếu tên sai / thiếu → sửa lại công thức đúng mã phần tử

**Bước 3**: Phân tích lại BH tháng 12/2025 cho NV 0015
- Kết quả expected: dòng `IsQuit=true` tháng 12, không đóng BH

## Kết quả kiểm tra

- Verified: yes
- Sau khi bổ sung phần tử BH còn thiếu và sửa công thức → phân tích tháng 12
  ra kết quả đúng: NV 0015 nghỉ việc, không đóng BH tháng 12/2025

## Bài học / Lưu ý

- Lỗi `ElementList : ,` (rỗng) là dấu hiệu chắc chắn của thiếu phần tử BH —
  không cần tìm nguyên nhân khác
- Lỗi `Expression expected` trong INS thường do công thức rỗng hoặc
  tham chiếu phần tử không tồn tại — KHÔNG phải lỗi dữ liệu NV
- NV có "đầy đủ dữ liệu lương BHXH, hợp đồng" vẫn báo lỗi → nguyên nhân
  nằm ở cấu hình danh mục, không phải hồ sơ NV
- Checklist khi gặp lỗi công thức BH:
  1. Đọc kỹ `ElementList` trong thông báo lỗi — đây là danh sách phần tử đang được load
  2. Nếu rỗng → vào Danh mục > Phần tử bảo hiểm kiểm tra ngay
  3. Nếu có tên → kiểm tra phần tử đó có tồn tại và công thức hợp lệ không

## Liên kết

- [[wiki/flows/Flow-BaoHiem-Monthly]] — luồng phân tích BH hàng tháng
- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — Bước 5: công thức từ Cat_InsuranceElement
- [[wiki/sources/INS-FAQ-4GocNhinTrucTrac]] — checklist 4 góc nhìn INS
- [[wiki/sources/INS-Config-FAQ]] — cấu hình BH, phần tử, công thức
