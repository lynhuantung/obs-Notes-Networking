---
Mã: 20260306172706
aliases:
date: 2026-03-06
tags:
  - "#workflow"
Project: "[[Dự án VnPay]]"
---
![[Pasted image 20260306172757.png]]

Luồng trong hình mô tả **quy trình cập nhật ứng dụng lên môi trường UAT**, với sự tham gia của các vai trò: **DEV → Leader Dev → QTUD → Tester**. Quy trình nhằm đảm bảo thay đổi được kiểm soát trước khi đưa cho tester kiểm thử. Dưới đây là mô tả chi tiết từng bước.

---

# 1. Luồng cập nhật ứng dụng lên môi trường UAT

|Bước|Vai trò|Hoạt động|Kết quả|
|---|---|---|---|
|1|DEV|Bắt đầu quy trình cập nhật|Start|
|2|Leader Dev|Kiểm tra thay đổi (code, chức năng, phạm vi ảnh hưởng)|Xác định có thể deploy|
|3|Leader Dev|Phê duyệt thay đổi|Nếu NOK → Cancel|
|4|QTUD|Kiểm tra thông tin yêu cầu|Kiểm tra đầy đủ thông tin deploy|
|5|QTUD|Đánh giá kết quả kiểm tra|Nếu NOK → trao đổi lại yêu cầu|
|6|QTUD|Trao đổi và làm rõ thông tin|Nếu không đạt → Cancel|
|7|QTUD|Xử lý yêu cầu cập nhật|Thực hiện deploy|
|8|QTUD|Nếu cần phối hợp bộ phận khác|Phối hợp xử lý|
|9|QTUD|Kiểm tra kết quả thực hiện|Nếu NOK → Cancel|
|10|Tester|Test ứng dụng|Kiểm thử trên UAT|
|11|Tester|Đánh giá kết quả test|Pass / Không Pass|
|12|Tester|Hoàn tất quy trình|Kết thúc|

---

# 2. Luồng chi tiết theo từng vai trò

## 1️⃣ DEV

- Bắt đầu quy trình cập nhật.
    
- Gửi yêu cầu cập nhật lên môi trường UAT.
    

---

## 2️⃣ Leader Dev

Thực hiện kiểm soát kỹ thuật:

- Kiểm tra thay đổi code
    
- Kiểm tra phạm vi ảnh hưởng
    
- Kiểm tra tính ổn định
    

**Quyết định:**

|Trường hợp|Kết quả|
|---|---|
|OK|Chuyển sang QTUD|
|NOK|Cancel|

---

## 3️⃣ QTUD (Quản trị ứng dụng / vận hành)

Thực hiện:

### Kiểm tra thông tin yêu cầu

Ví dụ:

- version deploy
    
- danh sách file
    
- script database
    
- hướng dẫn deploy
    
- rollback plan
    

### Đánh giá kết quả

|Kết quả|Hành động|
|---|---|
|OK|Tiếp tục xử lý|
|NOK|Trao đổi lại|

Nếu cần:

- phối hợp **DBA**
    
- phối hợp **hạ tầng**
    
- phối hợp **team khác**
    

Sau đó:

➡ **Xử lý yêu cầu (deploy lên UAT)**

---

### Kiểm tra kết quả deploy

|Trường hợp|Kết quả|
|---|---|
|OK|Chuyển Tester|
|NOK|Cancel|

---

## 4️⃣ Tester

Tester thực hiện:

### Test ứng dụng trên UAT

Bao gồm:

- test chức năng
    
- test regression
    
- test integration
    
- test UI
    

---

### Kết quả test

|Kết quả|Hành động|
|---|---|
|PassUAT|Kết thúc|
|Không Pass|Trả lại DEV|

---

# 3. Logic tổng thể của quy trình

```
DEV
  ↓
Leader Dev (Review)
  ↓
QTUD (Check request)
  ↓
QTUD (Deploy UAT)
  ↓
Tester (Test)
  ↓
Pass → Done
Fail → Fix
```

---

# 4. Ý nghĩa của quy trình này

Quy trình đảm bảo:

### 1️⃣ Kiểm soát chất lượng

Không deploy trực tiếp từ dev.

### 2️⃣ Tách trách nhiệm

|Vai trò|Trách nhiệm|
|---|---|
|DEV|Code|
|Leader Dev|Review|
|QTUD|Deploy|
|Tester|Test|

---

### 3️⃣ Giảm rủi ro production

UAT đóng vai trò:

```
Dev → UAT → Production
```

---
