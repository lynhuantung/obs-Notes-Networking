---
description: "Bug INS027: Lỗi 'Expression expected' trong công thức phần tử bảo hiểm khi phân tích BH, nguyên nhân và cách fix."
type: bug
code: ins027
status: resolved
tags:
  - bug
  - ins
  - phan-tich-bh
  - cong-thuc
  - phan-tu-bh
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/flows/Flow-BaoHiem-Monthly]]"
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/sources/INS-FAQ-4GocNhinTrucTrac]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
---

## Ins027 — Phân tích BH lỗi "Insurance Formular working days Error: Expression expected"

- **Status**: `resolved`
- **Date**: 2026-05-02
- **Affected**: Phân hệ INS — màn hình Phân tích bảo hiểm

### Hiện trạng

- Vào **Bảo hiểm > Phân tích bảo hiểm**, chọn tháng, bấm Phân tích → hệ thống báo lỗi:
  ```
  Insurance Formular working days Error : Expression expected..
  Employee Code [0015]. ElementList : , Formular :
  ```
- NV có đầy đủ dữ liệu: lương BHXH, hợp đồng, đăng ký nghỉ việc → vẫn lỗi
- Không ra kết quả phân tích (không có dòng đóng/giảm BH)

### Nguyên nhân (5 Whys)

- Tại sao (1): Phân tích BH báo lỗi `Expression expected`
- Tại sao (2): `Formular` rỗng — parser không parse được công thức ngày công
- Tại sao (3): `ElementList` rỗng — không có phần tử nào được load vào công thức
- Tại sao (4): Công thức trong chế độ BH/chế độ lương tham chiếu phần tử không tồn tại trong danh mục
- **Root**: Phần tử bảo hiểm dùng trong công thức ngày công bị thiếu hoặc tên sai trong **Danh mục > Phần tử bảo hiểm**

### Khắc phục

1. Vào **Bảo hiểm > Danh mục > Phần tử bảo hiểm** — kiểm tra phần tử đang được dùng trong công thức ngày công
2. Nếu phần tử thiếu → tạo lại với đúng mã; nếu tên sai → sửa công thức trong chế độ BH/lương
3. Phân tích lại → kết quả expected: `IsQuit=true`, không đóng BH

### Phòng tránh

- Khi gặp lỗi `ElementList : ,` (rỗng) → **kiểm tra Danh mục Phần tử bảo hiểm ngay**, không tìm nguyên nhân ở hồ sơ NV
- NV "đủ dữ liệu" vẫn có thể lỗi công thức — phân biệt lỗi dữ liệu NV vs lỗi cấu hình danh mục
- Checklist nhanh:
  1. `ElementList` rỗng → thiếu phần tử BH
  2. `ElementList` có tên → phần tử tồn tại nhưng công thức sai
  3. `Formular` rỗng → công thức chưa được nhập trong chế độ BH/lương

### Links

- [[wiki/flows/Flow-BaoHiem-Monthly]] — luồng phân tích BH hàng tháng
- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — Bước 5: công thức từ Cat_InsuranceElement
- [[wiki/sources/INS-FAQ-4GocNhinTrucTrac]] — checklist 4 góc nhìn INS
- [[wiki/sources/INS-Config-FAQ]] — cấu hình BH, phần tử, công thức
- Raw: `raw/Nghiệp vụ HRM/2026-05-02-ins-loi-phan-tich-bh-expression-expected-phan-tu-bh.md`
