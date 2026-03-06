---
Mã: 20260306172706
aliases:
date: 2026-03-06
tags:
  - "#workflow"
Project: "[[Dự án VnPay]]"
---
![[Pasted image 20260306173648.png]]
Bảng trong hình mô tả **luồng triển khai hệ thống và phân chia trách nhiệm giữa VNR và VNPAY** khi triển khai ứng dụng lên hạ tầng của VNPAY. Nội dung bao gồm các phần: **môi trường, trách nhiệm hạ tầng, CI/CD, source code, luồng network và quản lý secret/config**.

Dưới đây là mô tả chi tiết từng phần của luồng.

---

# 1. Luồng tổng thể triển khai hệ thống

Quy trình triển khai có thể tóm tắt như sau:

```text
VNR Source Code
      ↓
VNR CI Build Image
      ↓
Push Image → VNPAY S3 Service
      ↓
VNPAY Security Scan
      ↓
VNPAY CD Deploy
      ↓
Deploy lên K8s Cluster
```

Luồng này thể hiện **VNR chịu trách nhiệm build**, còn **VNPAY chịu trách nhiệm deploy và vận hành production**.

---

# 2. Environment (Môi trường)

|Nội dung|Mô tả|
|---|---|
|DEV|do VNR chuẩn bị|
|TEST|do VNR chuẩn bị|
|UAT|do VNPAY cung cấp|
|PRD|do VNPAY vận hành|

Điều này có nghĩa:

- **VNR quản lý môi trường phát triển**
    
- **VNPAY quản lý môi trường triển khai chính thức**
    

Luồng môi trường:

```text
DEV (VNR)
   ↓
TEST (VNR)
   ↓
UAT (VNPAY)
   ↓
PRODUCTION (VNPAY)
```

---

# 3. Responsibility (Phân chia trách nhiệm)

|Thành phần|Đơn vị chịu trách nhiệm|
|---|---|
|DEV server|VNR|
|UAT server|VNPAY|
|Production server|VNPAY|

Ý nghĩa:

- VNR chỉ chịu trách nhiệm **code và build**
    
- VNPAY chịu trách nhiệm **hạ tầng chạy hệ thống**
    

---

# 4. DevOps / CI-CD

Trong bảng ghi:

|Thành phần|Thông tin|
|---|---|
|Template|Waiting for VNPAY template|
|CI|VNR|
|CD|VNPAY|

Luồng CI/CD:

```text
Developer commit code
       ↓
VNR CI build container image
       ↓
Push image tới VNPAY storage
       ↓
VNPAY chạy security scan
       ↓
VNPAY CD deploy
```

Điểm quan trọng:

- **CI thuộc VNR**
    
- **CD thuộc VNPAY**
    

---

# 5. Source Code và Flow Deploy

Luồng build image được mô tả:

```text
VNR CI Build Image
      ↓
Push to VNPAY S3 service
      ↓
VNPAY Scan Security
      ↓
VNPAY CD Deploy
```

Chi tiết từng bước:

### 1. Build container image

- thực hiện bởi **VNR CI pipeline**
    

### 2. Push image

- push image lên **VNPAY S3 storage / image repository**
    

### 3. Security scan

- VNPAY kiểm tra:
    
    - vulnerability
        
    - malware
        
    - compliance
        

### 4. CD deploy

- VNPAY deploy lên cluster
    

---

# 6. Traffic flow (Luồng mạng)

Trong bảng ghi:

```
K8s -> External
```

Có nghĩa:

- hệ thống chạy trên **Kubernetes**
    
- cần mở **outbound traffic**
    

Next action:

```
VNR: Need to update flow of the outbound traffic
```

Điều này có nghĩa:

VNR cần cung cấp thông tin:

- API gọi ra ngoài
    
- IP/Domain cần whitelist
    
- port sử dụng
    

Ví dụ:

|Service|Endpoint|
|---|---|
|Payment API|api.vnpay.vn|
|SMS|sms.provider.vn|
|Email|smtp.server|

---

# 7. Secret / Config

Hệ thống không dùng config cũ mà chuyển sang **Kubernetes config management**.

Thông tin trong bảng:

|Thành phần|Giải pháp|
|---|---|
|Config|K8s ConfigMap|
|Secret|K8s Secret|
|Secret management|HashiCorp Vault|

Luồng quản lý config:

```text
Application
    ↓
K8s ConfigMap (config)
    ↓
K8s Secret (password)
    ↓
Hashicorp Vault (central secret store)
```

---

# 8. Phân chia công việc tiếp theo

Trong bảng có ghi rõ:

### VNR

|Nhiệm vụ|
|---|
|Update outbound traffic flow|
|Update source code để dùng ConfigMap/Secret|

---

### VNPAY

|Nhiệm vụ|
|---|
|Prepare Vault service|
|Prepare K8s ConfigMap|
|Prepare K8s Secret|

---

# 9. Luồng kiến trúc triển khai hoàn chỉnh

Có thể biểu diễn như sau:

```text
Developer
    ↓
Git Repository
    ↓
VNR CI Pipeline
    ↓
Build Docker Image
    ↓
Push Image → VNPAY Storage
    ↓
Security Scan (VNPAY)
    ↓
VNPAY CD Pipeline
    ↓
Deploy to Kubernetes
    ↓
Application Running
```

---

# 10. Điểm quan trọng trong kiến trúc này

### 1. Tách CI và CD

|CI|CD|
|---|---|
|VNR|VNPAY|

---

### 2. Chuẩn hóa container

Hệ thống deploy bằng:

```
Docker + Kubernetes
```

---

### 3. Secret management chuẩn enterprise

Dùng:

```
Hashicorp Vault
```

để tránh hardcode password.

