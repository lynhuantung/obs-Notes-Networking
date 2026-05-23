---
Mã: "25093713-01"
aliases: 
date: "2025-09-13"
time: "11:04"
Week: "37"
tags:
  - daily
---
## 🚨 Phân tích các loại lỗi bảo mật và cách khắc phục

## Báo cáo kiểm thử xâm nhập (Penetration Testing) bạn gửi có rất nhiều thông tin giá trị. Dưới đây là tổng hợp ngắn gọn **các loại lỗ hổng bảo mật chính** được phát hiện, **mức độ nghiêm trọng** và **khuyến nghị khắc phục** cho từng loại.

### 1. **Bypassing Authorization Schema (Vượt kiểm soát phân quyền)**

**Mức độ:** High/Medium

#### Mô tả:

- Hệ thống không kiểm tra đầy đủ quyền truy cập, cho phép user thông thường thực hiện các hành động hoặc truy cập dữ liệu của quản lý hoặc người dùng khác.
- Ví dụ: Nhân viên có thể xem lương của quản lý, duyệt/từ chối ngày nghỉ của người khác, truy cập/chỉnh sửa chứng chỉ của người khác...

#### Cách khắc phục:

- **Kiểm tra lại toàn bộ logic phân quyền** ở cả phía giao diện và backend.
- Trước khi thực hiện thao tác, **luôn kiểm tra session** còn hiệu lực và **kiểm tra quyền thực sự của user** đối với tác vụ/data đó.
- Sử dụng **middleware** hoặc **filter** để xác thực quyền trước khi xử lý request backend.
- Thống nhất rõ **role & permission matrix**, kiểm thử lại các API liên quan tới quyền truy cập.

---

### 2. **Local File Include (Chèn file cục bộ trái phép)**

**Mức độ:** High

#### Mô tả:

- Cho phép truy cập hoặc chèn file trên server thông qua path do người dùng nhập.
- Rủi ro: Kẻ tấn công có thể truy cập các file nhạy cảm, thực thi tập lệnh độc hại.

#### Cách khắc phục:

- **Chỉ định whitelist các file được phép truy cập.**
- Không truyền trực tiếp đường dẫn file từ client lên server.
- Áp dụng kiểm tra định dạng tên file, mã hóa hoặc token hóa nếu cần thiết.
- **Sử dụng hàm xử lý file an toàn và cập nhật thư viện liên quan.**

---

### 3. **SQL Injection**

**Mức độ:** High

#### Mô tả:

- Không kiểm soát/validate dữ liệu đầu vào, khiến truy vấn SQL "chèn" được mã độc.
- Rủi ro: Lộ/làm sai lệch dữ liệu, truy xuất dữ liệu nhạy cảm, thậm chí chiếm quyền kiểm soát hệ thống.

#### Cách khắc phục:

- **Dùng Prepared Statement hoặc ORM** không chèn trực tiếp dữ liệu đầu vào vào câu lệnh SQL.
- Kiểm tra, validate dữ liệu đầu vào nghiêm ngặt.
- Không xây dựng query động bằng string concatenation.

---

### 4. **Error Handling (Quản lý lỗi chưa an toàn)**

**Mức độ:** Medium

#### Mô tả:

- Lỗi xử lý exception trả về chi tiết cấu trúc hệ thống, path code, stack trace... cho client.
- Rủi ro: Tiết lộ thông tin nội bộ, giúp kẻ xấu tìm kiếm cách tấn công.

#### Cách khắc phục:

- Thông báo lỗi đến client chỉ nên mang tính **chung chung** (ví dụ: "Lỗi hệ thống, vui lòng thử lại.") thay vì chi tiết kỹ thuật.
- Ghi log chi tiết lỗi nội bộ ở phía server, **không trả về thông điệp kỹ thuật** ra ngoài.
- **Ẩn stacktrace, thông số kết nối, các đường dẫn source code** ở bất kỳ response nào trả ra ngoài.

---

### 5. **Files Flood in Server (Ngập file rác/không kiểm soát upload)**

**Mức độ:** Medium

#### Mô tả:

- Ứng dụng chưa kiểm soát tốt file upload/download, user có thể upload quá nhiều file hoặc (gián tiếp) gây ngập thư mục, ảnh hưởng lưu trữ.

#### Cách khắc phục:

- Giới hạn số lượng, dung lượng file mỗi user có thể upload trong 1 khoảng thời gian.
- Sử dụng **tên file sinh tự động** để tránh ghi đè hoặc tấn công đường dẫn.
- Theo dõi và dọn dẹp file không dùng (qua cron hoặc job tự động).

---

### 6. **Open Redirect**

**Mức độ:** Medium

#### Mô tả:

- Tham số trên URL có thể bị lợi dụng để chuyển hướng người dùng đến website bên ngoài (dễ bị lợi dụng lừa đảo/phishing).

#### Cách khắc phục:

- **Chỉ cho phép redirect đến các tên miền nằm trong whitelist.**
- Kiểm tra các tham số `returnUrl` hoặc tương tự, chặn mọi URL trỏ ra ngoài hoặc URL có cấu trúc đáng ngờ.
- Nếu cần chuyển hướng, sử dụng path nội bộ thay vì full URL.

---

### 7. **Weak Password Policy**

**Mức độ:** Medium

#### Mô tả:

- Chính sách mật khẩu yếu, cho phép dùng các mật khẩu đơn giản, dễ đoán.

#### Cách khắc phục:

- Áp dụng chính sách mật khẩu mạnh: **Tối thiểu 8 ký tự, có ký tự viết hoa, thường, số và ký tự đặc biệt.**
- Bắt buộc đổi mật khẩu định kỳ.
- Cảnh báo và không cho phép các mật khẩu phổ biến/dễ đoán.

---

## 📋 Tổng hợp nhanh mức độ tồn đọng

|Loại lỗi|Số lượng phát hiện|Đã fix|Còn tồn|
|---|---|---|---|
|**Serious/High**|9|9|0|
|**Medium**|10|5|5|
|**Low/Khác**|0|0|0|

---

## > ❗ **Lưu ý:** Các lỗi chưa khắc phục (vẫn còn tồn tại) cần được ưu tiên xử lý, đặc biệt là lỗi về **error handling** và **bypass phân quyền**.

## 🌈 Gợi ý kiểm thử/kỹ thuật nâng cao:

- Tích hợp kiểm thử bảo mật (static code analysis, dynamic application security testing) vào pipeline CI/CD.
- Tăng cường kiểm thử sau fix lỗi để đảm bảo không xuất hiện regression.
- Đào tạo đội dev về các lỗi phổ biến theo tiêu chuẩn OWASP Top 10.

