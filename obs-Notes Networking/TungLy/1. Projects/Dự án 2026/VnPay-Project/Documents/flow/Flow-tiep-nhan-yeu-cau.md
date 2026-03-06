---
Mã: 20260306172706
aliases:
date: 2026-03-06
tags:
  - "#workflow"
Project: "[[Dự án VnPay]]"
---
![[Pasted image 20260306173306.png]]
Hình này mô tả **quy trình tiếp nhận và xử lý các yêu cầu trong hệ thống** (ví dụ: yêu cầu hỗ trợ, bug, thay đổi chức năng, hỗ trợ khách hàng…). Quy trình thể hiện sự phối hợp giữa các bộ phận **DEV / BA / CSKH → Leader / PO / PM → QTUD → DEV / BA / CSKH review**.

Dưới đây là mô tả chi tiết từng bước của luồng.

---

# 1. Tổng quan quy trình xử lý yêu cầu

Các vai trò tham gia:

|Vai trò|Nhiệm vụ|
|---|---|
|DEV / BA / CSKH|Tiếp nhận yêu cầu ban đầu|
|Leader Dev / PO / PM|Phê duyệt và đánh giá yêu cầu|
|QTUD|Xử lý và thực hiện yêu cầu|
|DEV / BA / CSKH|Kiểm tra kết quả cuối|

Luồng tổng thể:

```
Tiếp nhận yêu cầu
      ↓
Phê duyệt
      ↓
Kiểm tra thông tin
      ↓
Xử lý yêu cầu
      ↓
Thực hiện xong
      ↓
Review kết quả
      ↓
Kết thúc
```

---

# 2. Chi tiết từng bước trong quy trình

## 1️⃣ DEV / BA / CSKH – Tiếp nhận yêu cầu

Quy trình bắt đầu khi:

- người dùng báo lỗi
    
- khách hàng yêu cầu hỗ trợ
    
- phát sinh yêu cầu thay đổi
    

Bước đầu:

```
Start → Kiểm tra thay đổi
```

Mục tiêu:

- xác định yêu cầu thuộc loại nào
    
- xác định mức độ ảnh hưởng
    
- xác định cần xử lý hay không
    

---

## 2️⃣ Leader Dev / PO / PM – Phê duyệt

Sau khi nhận yêu cầu, **Leader Dev / PO / PM thực hiện phê duyệt**.

### Kết quả phê duyệt

|Trường hợp|Hành động|
|---|---|
|OK|Chuyển sang bước kiểm tra thông tin|
|NOK|Cancel yêu cầu|

Mục tiêu:

- tránh xử lý các yêu cầu không cần thiết
    
- kiểm soát phạm vi thay đổi
    

---

## 3️⃣ QTUD – Kiểm tra thông tin yêu cầu

QTUD tiếp nhận yêu cầu đã được phê duyệt và thực hiện:

```
Kiểm tra thông tin yêu cầu
```

Ví dụ kiểm tra:

- mô tả yêu cầu
    
- dữ liệu liên quan
    
- môi trường xảy ra lỗi
    
- tài liệu hướng dẫn
    

---

### Kết quả kiểm tra

|Kết quả|Hành động|
|---|---|
|OK|Chuyển sang xử lý yêu cầu|
|NOK|Trao đổi và làm rõ thông tin|

Nếu thông tin chưa rõ:

```
Trao đổi và làm rõ thông tin yêu cầu
```

Sau khi làm rõ:

- nếu vẫn không hợp lệ → Cancel
    
- nếu hợp lệ → tiếp tục xử lý
    

---

## 4️⃣ QTUD – Xử lý yêu cầu

QTUD tiến hành:

```
Xử lý yêu cầu
```

Có thể bao gồm:

- cấu hình hệ thống
    
- chỉnh sửa dữ liệu
    
- xử lý lỗi
    
- hỗ trợ kỹ thuật
    

---

### Phối hợp với bộ phận khác

Trong quá trình xử lý có thể cần:

```
Phối hợp với BP khác
```

Ví dụ:

|Bộ phận|Mục đích|
|---|---|
|DEV|sửa code|
|DBA|xử lý database|
|Hạ tầng|cấu hình server|
|BA|xác nhận nghiệp vụ|

Nếu không phối hợp được:

```
Cancel
```

---

## 5️⃣ Hoàn tất thực hiện

Sau khi xử lý xong:

```
Thực hiện xong
```

Yêu cầu được chuyển sang bước kiểm tra.

---

## 6️⃣ DEV / BA / CSKH – Review kết quả

Bộ phận ban đầu tiếp nhận yêu cầu sẽ:

```
Review kết quả
```

Kiểm tra:

- vấn đề đã được giải quyết chưa
    
- yêu cầu có đúng như mong muốn không
    
- hệ thống có phát sinh lỗi khác không
    

---

### Kết quả review

|Kết quả|Hành động|
|---|---|
|OK|Kết thúc|
|NOK|Trả lại để xử lý lại|

Nếu chưa đạt:

- quay lại bước **Xử lý yêu cầu**
    

---

# 3. Logic tổng thể của quy trình

```
Tiếp nhận yêu cầu
      ↓
Phê duyệt
      ↓
Kiểm tra thông tin
      ↓
Xử lý yêu cầu
      ↓
Thực hiện xong
      ↓
Review kết quả
      ↓
OK → Kết thúc
NOK → Xử lý lại
```

---

# 4. Ý nghĩa của quy trình này

Quy trình giúp:

### 1️⃣ Kiểm soát yêu cầu

Không phải yêu cầu nào cũng xử lý ngay.

### 2️⃣ Đảm bảo thông tin đầy đủ

Tránh việc xử lý sai yêu cầu.

### 3️⃣ Phối hợp nhiều bộ phận

Các yêu cầu phức tạp có thể cần nhiều team.

### 4️⃣ Kiểm tra kết quả cuối

Đảm bảo yêu cầu thực sự được giải quyết.

---

# 5. Ví dụ thực tế trong hệ thống HRM

Một số yêu cầu thường gặp:

|Loại yêu cầu|Ví dụ|
|---|---|
|Lỗi hệ thống|Không tính lương đúng|
|Yêu cầu hỗ trợ|Reset mật khẩu|
|Thay đổi dữ liệu|Sửa thông tin nhân viên|
|Thay đổi chức năng|Thêm field báo cáo|

