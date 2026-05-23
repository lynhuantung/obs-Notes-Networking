---
Mã: 20260320134739
aliases:
date: 2026-03-20
tags:
  - daily
  - "#s3"
Project:
---

# 📘 TÀI LIỆU: CẤU HÌNH AWS S3 UPLOAD FILE

---

# 🎯 1. Mục tiêu

- Tạo user sử dụng S3
    
- Tạo Access Key / Secret Key
    
- Tạo Bucket
    
- Cấp quyền cho user truy cập bucket
    
- Upload file thành công
    

---

# 🧭 2. Kiến trúc tổng thể

```text
IAM User → Access Key → Policy → Bucket → Upload
```

---

# 👤 3. Tạo IAM User

## 👉 Bước 1

Truy cập:

👉 [https://console.aws.amazon.com/iam/home#/users](https://console.aws.amazon.com/iam/home#/users)

---

## 👉 Bước 2

- Click **Create user**
    
- Nhập:
    

```text
s3-vnpay-user
```

---

## 👉 Bước 3

- Tick:
    

```text
✔ Access key – Programmatic access
```

---

## 👉 Bước 4

- Next → chưa cần permission
    

---

# 🔑 4. Tạo Access Key / Secret Key

## 👉 Vào:

IAM → Users → chọn user → **Security credentials**

---

## 👉 Tạo key

- Click:
    

```text
Create access key
```

- Chọn:
    

```text
Command Line Interface (CLI)
```

---

## 👉 Kết quả

```text
aws_access_key_id = XXX
aws_secret_access_key = YYY
```

⚠️ Lưu ý:

- Secret key chỉ hiển thị 1 lần
    

---

# 🪣 5. Tạo Bucket

## 👉 Truy cập:

👉 [https://s3.console.aws.amazon.com/s3](https://s3.console.aws.amazon.com/s3)

---

## 👉 Tạo bucket

| Field       | Giá trị              |
| ----------- | -------------------- |
| Bucket name | vnr-hrm-vnpay-deploy |
| Region      | ap-southeast-2       |

---

👉 Click **Create bucket**

---

# 🔐 6. Tạo Policy (cấp quyền)

## 👉 Truy cập:

👉 [https://console.aws.amazon.com/iam/home#/policies/create](https://console.aws.amazon.com/iam/home#/policies/create)

---

## 👉 Dán JSON

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowListBucket",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::vnr-hrm-vnpay-deploy"
    },
    {
      "Sid": "AllowObjectAccess",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::vnr-hrm-vnpay-deploy/*"
    }
  ]
}
```

---

## 👉 Đặt tên:

```text
Allow-S3-vnpay-Deploy
```

---

# 🔗 7. Gán Policy vào User

👉 IAM → Users → chọn user

---

## 👉 Thao tác:

- Permissions → Add permissions
    
- Attach policies
    
- Chọn:
    

```text
Allow-S3-vnpay-Deploy
```

---

# 🧪 8. Test Upload

```bash
aws s3 cp D:\test.txt s3://vnr-hrm-circlek-deploy/ --region ap-southeast-2 --profile vnpay
```

---

# 📥 9. Lấy thông tin cấu hình

---

## 🔹 Bucket

| Thông tin | Giá trị                                                                             |
| --------- | ----------------------------------------------------------------------------------- |
| Bucket    | vnr-hrm-vnpay-deploy                                                                |
| Region    | ap-southeast-2                                                                      |
| Endpoint  | [https://s3.ap-southeast-2.amazonaws.com](https://s3.ap-southeast-2.amazonaws.com/) |

---

## 🔹 Access Key

👉 IAM → User → Security credentials

---

## 🔹 Config dùng trong hệ thống

```json
{
  "S3Configurations": {
    "Enable": true,
    "Bucket": "vnr-hrm-vnpay-deploy",
    "Endpoint": "https://s3.ap-southeast-2.amazonaws.com",
    "Accesskey": "XXX",
    "Secretkey": "YYY"
  }
}
```

---

# 📊 10. Mapping tổng thể

| Thành phần | Giá trị              |
| ---------- | -------------------- |
| User       | s3-vnpay-user        |
| Bucket     | vnr-hrm-vnpay-deploy |
| Region     | ap-southeast-2       |
| AccessKey  | từ IAM               |
| SecretKey  | từ IAM               |

---

# ⚠️ 11. Lỗi thường gặp

|Lỗi|Nguyên nhân|
|---|---|
|AccessDenied|chưa attach policy|
|InvalidAccessKey|sai key|
|NoSuchBucket|sai tên bucket|
|Upload fail|thiếu PutObject|

---

# 💡 12. Best Practice

- Tách user theo chức năng:
    
    - s3-build-user
        
    - s3-file-user
        
    - s3-report-user
        
- Không dùng:
    

```text
❌ s3:* với *
```

- Đặt tên bucket theo chuẩn:
    

```text
vnr-hrm-[module]-[env]
```

---

# 🔥 13. Kết luận

```text
Create User → Create Key → Create Bucket → Create Policy → Attach → Upload
```

---
![[Pasted image 20260320135241.png]]