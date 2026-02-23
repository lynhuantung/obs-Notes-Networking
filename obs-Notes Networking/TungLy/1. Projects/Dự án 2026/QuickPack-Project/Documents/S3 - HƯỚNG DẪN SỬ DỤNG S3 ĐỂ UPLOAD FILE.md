---
Mã: 
aliases: 
date: 2025-05-06
tags:
  - "#s3"
Project: "[[Dự án QuickPack]]"
Liên kết: []
---
# ✅ HƯỚNG DẪN SỬ DỤNG S3 ĐỂ UPLOAD FILE

---

## I. Chuẩn bị thông tin cần thiết

| Thông tin           | Giải thích                                                                                                      |
| ------------------- | --------------------------------------------------------------------------------------------------------------- |
| **Bucket**          | Tên vùng lưu trữ trên S3 (phải được cấp sẵn). Bucket = thư mục gốc để bạn lưu trữ và quản lý file trên đám mây. |
| **Endpoint**        | URL kết nối tới dịch vụ S3 (ví dụ: `https://s3-hni.sds.QuickPackcloud.vn`)                                          |
| **Access Key**      | Mã truy cập để xác thực với S3                                                                                  |
| **Secret Key**      | Mã bí mật tương ứng                                                                                             |
| **Region name**     | Vị trí địa lý bucket (ví dụ:  vnr-pmns-build-version)                                                           |
| **File cần upload** | Đường dẫn tới file trên máy bạn (ví dụ: `D:\data\myfile.zip`)                                                   |

---

## II. Cài đặt AWS CLI

### 🔧 Cài đặt trên Windows

1. Tải tại: [https://awscli.amazonaws.com/AWSCLIV2-2.11.0..msi](https://awscli.amazonaws.com/AWSCLIV2-2.11.0.msi)
    
2. Cài như phần mềm bình thường
    
3. Mở lại **CMD** → kiểm tra bằng:
    

```bash
aws --version
```

---

## III. Cấu hình AWS CLI

```bash
aws configure
```

Nhập các thông tin:

```
AWS Access Key ID     : <bạn điền AccessKey>
AWS Secret Access Key : <bạn điền SecretKey>
Default region name   : ap-southeast-1 (hoặc đúng region bucket)
Default output format : json
```

---

## IV. Upload file lên S3

### 1. Nếu file nằm cùng thư mục hiện tại:

```bash
aws s3 cp myfile.zip s3://my-bucket-name/ --endpoint-url https://your-s3-endpoint
```

VD:
```
aws s3 cp d:\readme.txt s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.QuickPackcloud.vn
```

### 2. Nếu file ở nơi khác (đường dẫn đầy đủ):

```bash
aws s3 cp D:\data\myfile.zip s3://my-bucket-name/ --endpoint-url https://your-s3-endpoint
```

---
## V. Kiểm tra file sau khi upload

- Nếu bucket public:
    

```url
https://your-s3-endpoint/my-bucket-name/myfile.zip
```

- Nếu private, cần cấp quyền IAM hoặc dùng presigned URL để truy cập.

- Nếu bucket không public thì dùng cmd để xem những files đã upload:
```
aws s3 ls s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.QuickPackcloud.vn
```
![[Pasted image 20250506143214.png]]
---


## VI. Các lệnh thường dùng
- Upload file
```bash
aws s3 cp D:\tmp\QuickPack-s3\test.rar s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.QuickPackcloud.vn
```
- Kiểm tra file đã upload

```bash
aws s3 ls s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.QuickPackcloud.vn
```
![[Pasted image 20250506144915.png]]