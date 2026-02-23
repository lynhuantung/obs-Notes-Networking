---
Mã: S3- tài liệu
aliases:
date: 2025-10-06
time: 11:05
Week: "41"
tags:
  - daily
  - "#s3"
---

# 🗂️ TÀI LIỆU HƯỚNG DẪN SỬ DỤNG S3 TRONG .NET CORE

**Amazon S3 (Simple Storage Service)** là dịch vụ lưu trữ đối tượng trên đám mây do Amazon Web Services (AWS) cung cấp.  
Tài liệu này hướng dẫn cách upload, download và quản lý tệp từ máy trạm lên **S3**, dùng cho hệ thống HRM.

---

## ✅ HƯỚNG DẪN SỬ DỤNG S3 ĐỂ UPLOAD FILE

### I. Chuẩn bị thông tin cần thiết

| Thông tin           | Mô tả                                                                           |
| ------------------- | ------------------------------------------------------------------------------- |
| **Bucket**          | Tên vùng lưu trữ trên S3 (ví dụ: `vnr-pmns-build-version` hoặc `vnphrm-build`). |
| **Endpoint**        | URL kết nối tới dịch vụ S3, ví dụ: `https://s3-hni.sds.vnpaycloud.vn`.          |
| **Access Key**      | Mã truy cập do quản trị hệ thống cấp.                                           |
| **Secret Key**      | Mã bí mật tương ứng với Access Key.                                             |
| **Region name**     | Vị trí địa lý bucket (ví dụ: `ap-southeast-1` hoặc tên định danh riêng).        |
| **File cần upload** | Đường dẫn tới file trên máy bạn (VD: `D:\data\myfile.zip`).                     |

---

### II. Cài đặt AWS CLI

#### 🔧 Cài đặt trên Windows

1. Tải AWS CLI tại:  
    👉 [https://awscli.amazonaws.com/AWSCLIV2-2.11.0.msi](https://awscli.amazonaws.com/AWSCLIV2-2.11.0.msi)
    
2. Cài đặt như phần mềm bình thường.
    
3. Mở CMD để kiểm tra:
    
    ```bash
    aws --version
    ```
    

---

### III. Cấu hình AWS CLI

AWS CLI lưu cấu hình tại:

```
C:\Users\<UserName>\.aws\
```

Trong đó có **2 file**:

#### 🗂️ 1. File `credentials`

```ini
[app]
aws_access_key_id = <bạn điền access_key_id>
aws_secret_access_key = <bạn điền secret_access_key>

[default]
aws_access_key_id = <bạn điền access_key_id>
aws_secret_access_key = <bạn điền secret_access_key>
```

#### 🗂️ 2. File `config`

```ini
[app]
region = vnr-pmns-build-version
output = json

[default]
region = vnphrm-build
output = json
```

> 💡 Mỗi profile tương ứng với 1 bucket:
> 
> - **[default]** → Dùng cho **build**
>     
> - **[app]** → Dùng cho **data của HRM**
>     

---

### IV. Upload file lên S3

#### 1️⃣ Upload file cùng thư mục hiện tại

```bash
aws s3 cp myfile.zip s3://my-bucket-name/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app
```

#### 2️⃣ Upload file theo đường dẫn đầy đủ

```bash
aws s3 cp D:\data\myfile.zip s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app
```

---

### V. Kiểm tra file sau khi upload

- **Nếu bucket public:**
    
    ```
    https://s3-hni.sds.vnpaycloud.vn/vnr-pmns-build-version/myfile.zip
    ```
    
- **Nếu bucket private:**  
    Cần cấp quyền IAM hoặc dùng **presigned URL** để tải.
    
- **Kiểm tra file đã upload:**
    
    ```bash
    aws s3 ls s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app
    ```
    

---

### VI. Các lệnh thường dùng

| Mục đích                      | Câu lệnh                                                                                                                                                       |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Upload file**               | `aws s3 cp D:\tmp\test.rar s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`                                         |
| **Upload folder**             | `aws s3 sync D:\HRM9Clone1\Main\Source\Build\TestFolder s3://vnr-pmns-build-version/TestFolder/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app` |
| **Xóa file**                  | `aws s3 rm s3://vnr-pmns-build-version/test.rar --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`                                                 |
| **Xóa folder (prefix)**       | `aws s3 rm s3://vnr-pmns-build-version/TestFolder/ --recursive --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`                                  |
| **Download file**             | `aws s3 cp s3://vnr-pmns-build-version/test.rar D:\tmp\test-downloaded.rar --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`                      |
| **Download folder**           | `aws s3 sync s3://vnr-pmns-build-version/TestFolder/ D:\tmp\MyDownload\TestFolder --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`               |
| **Liệt kê file**              | `aws s3 ls s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`                                                         |
| **Liệt kê file trong folder** | `aws s3 ls s3://vnr-pmns-build-version/TestFolder/ --recursive --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`                                  |

---

### VII. Phân biệt 2 Bucket sử dụng trong HRM

|Loại Bucket|Tên Bucket|Mục đích|Lệnh kiểm tra|
|---|---|---|---|
|**Build (Default)**|`vnphrm-build`|Lưu file build, publish, release|`aws s3 ls s3://vnphrm-build/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile default`|
|**App Data (HRM)**|`vnr-pmns-build-version`|Lưu file dữ liệu HRM (import, export, báo cáo)|`aws s3 ls s3://vnr-pmns-build-version/ --endpoint-url https://s3-hni.sds.vnpaycloud.vn --profile app`|
