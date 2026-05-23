---
Mã: 25073026-01
aliases:
date: 2025-07-26
time: 12:43
Week: "30"
tags:
  - daily
  - "#story-point"
---
# Cách đánh story point
### 1. **Độ phức tạp nghiệp vụ**

| Mức độ       | Story Point | Mô tả ngắn gọn                                        |
| ------------ | ----------- | ----------------------------------------------------- |
| Rất đơn giản | 0.2         | Không có nghiệp vụ, chỉ sửa giao diện/text/help       |
| Đơn giản     | 1           | Có nghiệp vụ nhẹ (form, danh mục đơn giản, nhập khẩu) |
| Trung bình   | 3           | Quản lý theo nhân viên, phê duyệt 1 bước              |
| Phức tạp     | 8           | Có luồng phê duyệt, gửi email/thông báo/ký số         |
| Rất phức tạp | 13          | Tính công/lương/bảo hiểm, logic tính toán phức tạp    |

---

### 2. **Độ phức tạp kỹ thuật**

| Mức độ       | Story Point | Mô tả ngắn gọn                                                               |
| ------------ | ----------- | ---------------------------------------------------------------------------- |
| Rất đơn giản | 0.2         | Chỉnh sửa nhỏ: dịch thuật, tìm kiếm, ẩn/hiện đơn giản                        |
| Đơn giản     | 1           | Thêm field, logic ẩn/hiện cần code, tạo 1 màn danh mục                       |
| Trung bình   | 3           | Thêm màn hình theo nhân viên, chức năng nhân bản                             |
| Phức tạp     | 8           | Thay đổi control dùng chung, tích hợp API xác thực                           |
| Rất phức tạp | 13          | Tính toán phức tạp, nghiên cứu kỹ thuật, chỉnh framework, setup microservice |

---

### 3. **Khối lượng công việc**

| Mức độ               | Story Point | Mô tả ngắn gọn                                      |
| -------------------- | ----------- | --------------------------------------------------- |
| Rất ít (<1h)         | 0.1         | Dịch thuật, enum, tìm kiếm đơn giản                 |
| Ít (<4h)             | 2.5         | Chỉnh sửa form, enum, tìm kiếm nâng cao             |
| Trung bình (<8h)     | 6           | Màn hình danh mục, enum tính                        |
| Nhiều (1–2 ngày)     | 12          | Import, master-detail, tích hợp API, lỗi môi trường |
| Nhiều (2–3 ngày)     | 20          | Import nhiều bảng, màn hình tab/vùng đơn            |
| Nhiều (3–4 ngày)     | 28          | Màn hình nhiều tab/vùng, dạng calendar, tính toán   |
| Rất nhiều (4–6 ngày) | 40          | Màn hình phức tạp, nghiên cứu công cụ               |
| Rất nhiều (6–8 ngày) | 56          | Build công cụ hỗ trợ                                |
| Trên 8 ngày          | 64          | Nghiên cứu, nâng cấp framework                      |

---

### 4. **Mức độ ảnh hưởng/phụ thuộc**

| Mức độ          | Story Point | Mô tả ngắn gọn                                  |
| --------------- | ----------- | ----------------------------------------------- |
| Không ảnh hưởng | 0           | QC chỉ test đúng chức năng thi công             |
| Ảnh hưởng ít    | 1           | Ảnh hưởng nhẹ, QC kiểm tra 1–3 chức năng        |
| Ảnh hưởng vừa   | 3           | Ảnh hưởng trung bình, QC kiểm tra 4–7 chức năng |
| Ảnh hưởng nhiều | 5           | Ảnh hưởng lớn, kiểm tra toàn hệ thống           |

---

### 5. **Công việc nâng cao khác**

|Yếu tố|Story Point|Mô tả|
|---|---|---|
|Nghiệp vụ rất phức tạp|13|Tham gia họp với kinh doanh, CS, dự toán báo giá|
|Kỹ thuật rất phức tạp|13|Tham gia họp với IT KH, trình bày kiến trúc/mô hình|


Nguồn: [SP - Định nghĩa - Google Sheets](https://docs.google.com/spreadsheets/d/1OjD0KfcFmsbMYUzIxDBY_FH5criBJRxadMuN8z3XCUo/edit?gid=1142339106#gid=1142339106)