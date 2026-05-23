---
Mã: 20260306172706
aliases:
date: 2026-03-06
tags:
  - "#workflow"
Project: "[[Dự án VnPay]]"
---
![[Pasted image 20260306173119.png]]
Hình này mô tả **quy trình cập nhật ứng dụng lên môi trường LIVE (Production)**. So với luồng **UAT**, luồng LIVE có thêm các bước kiểm soát như **PO/PM phê duyệt, review sau deploy, rollback và hotfix** để giảm rủi ro cho hệ thống đang vận hành.

Dưới đây là mô tả chi tiết từng giai đoạn.

---

# 1. Tổng quan luồng cập nhật ứng dụng lên LIVE

Quy trình gồm các vai trò chính:

| Vai trò | Trách nhiệm                                 |
| ------- | ------------------------------------------- |
| DEV     | Chuẩn bị thay đổi                           |
| PO/PM   | Phê duyệt triển khai                        |
| QTUD    | Thực hiện deploy (QTUD - quản trị ứng dụng) |
| Tester  | Kiểm thử sau deploy                         |

Luồng tổng thể:

```
DEV → PO/PM → QTUD → Tester → Review → Hoàn tất
                              ↓
                           Rollback / Hotfix
```

---

# 2. Chi tiết từng bước trong quy trình

## 1️⃣ DEV – Kiểm tra thay đổi

DEV bắt đầu quy trình:

- Start
    
- Kiểm tra thay đổi
    

Các nội dung cần kiểm tra:

- code đã merge
    
- version deploy
    
- database script
    
- phạm vi ảnh hưởng
    

---

## 2️⃣ PO/PM – Phê duyệt triển khai

Sau khi DEV chuẩn bị xong, **PO/PM thực hiện phê duyệt**.

### Quyết định

|Trường hợp|Hành động|
|---|---|
|OK|Chuyển sang bước kiểm tra thông tin|
|NOK|Cancel|

Mục đích:

- đảm bảo đúng kế hoạch release
    
- tránh deploy ngoài phạm vi
    

---

## 3️⃣ QTUD – Kiểm tra thông tin yêu cầu

QTUD (quản trị ứng dụng) kiểm tra:

- version deploy
    
- danh sách file
    
- script database
    
- dependency service
    
- hướng dẫn deploy
    
- rollback plan
    

### Kết quả

|Kết quả|Hành động|
|---|---|
|OK|Tiếp tục xử lý|
|NOK|Trao đổi làm rõ yêu cầu|

Nếu yêu cầu không rõ:

```
Trao đổi và làm rõ thông tin
```

Sau đó mới tiếp tục deploy.

---

## 4️⃣ QTUD – Xử lý yêu cầu (Deploy)

QTUD tiến hành:

```
Xử lý yêu cầu
```

Có thể bao gồm:

- deploy web
    
- deploy API
    
- chạy script database
    
- restart service
    
- clear cache
    
- update config
    

---

## 5️⃣ Phối hợp bộ phận khác (nếu cần)

Trong quá trình deploy có thể cần:

- DBA
    
- hạ tầng
    
- network
    
- security
    

Luồng:

```
Phối hợp bộ phận khác
```

Sau khi xử lý xong tiếp tục deploy.

---

## 6️⃣ Kiểm tra kết quả thực hiện

Sau deploy, QTUD kiểm tra:

- service chạy bình thường
    
- API hoạt động
    
- web truy cập được
    
- database không lỗi
    

### Kết quả

|Trường hợp|Hành động|
|---|---|
|OK|Chuyển Tester|
|NOK|Cancel|

---

## 7️⃣ Tester – Test ứng dụng

Tester thực hiện kiểm thử nhanh trên production:

```
Test ứng dụng
```

Ví dụ:

- login
    
- tạo dữ liệu
    
- chạy chức năng chính
    
- kiểm tra lỗi
    

---

### Kết quả test

|Kết quả|Hành động|
|---|---|
|Pass test|Tiếp tục|
|Không pass|Trả về xử lý|

---

# 3. Giai đoạn Review sau deploy

Sau khi test pass:

```
Review
```

Mục tiêu:

- xác nhận deploy thành công
    
- kiểm tra log
    
- kiểm tra hiệu năng
    
- xác nhận với nghiệp vụ
    

---

### Kết quả Review

|Trường hợp|Hành động|
|---|---|
|OK|Kết thúc|
|NOK|Rollback|

---

# 4. Cơ chế xử lý lỗi

Nếu review thất bại:

```
Rollback
```

Rollback có thể:

- restore database
    
- rollback version
    
- rollback service
    

---

### Nếu rollback vẫn lỗi

Thực hiện:

```
Hotfix
```

Hotfix là sửa lỗi khẩn cấp trực tiếp trên production.

---

# 5. Luồng logic tổng thể

```
DEV
 ↓
PO/PM phê duyệt
 ↓
QTUD kiểm tra request
 ↓
QTUD deploy
 ↓
Tester test
 ↓
Review
 ↓
OK → Kết thúc
NOK → Rollback → Hotfix
```

---

# 6. Điểm khác giữa UAT và LIVE

|Tiêu chí|UAT|LIVE|
|---|---|---|
|Phê duyệt|Leader Dev|PO/PM|
|Mục đích|Test chức năng|Triển khai thật|
|Review sau deploy|Không bắt buộc|Bắt buộc|
|Rollback|Ít dùng|Bắt buộc|
|Hotfix|Không|Có|

---

