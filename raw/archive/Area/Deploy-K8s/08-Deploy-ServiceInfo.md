---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - service
  - port
  - dotnet
  - architecture
created: 2026-05-07
updated: 2026-05-07
description: Danh sách 8 service HRM — language, port, instance type, mô tả chức năng, dependencies
source-file: 
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[05-Deploy-Sizing-PROD]]"
  - "[[09-Deploy-Network]]"
  - "[[03-Deploy-Checklist-App]]"
---

# Deploy Service Info — Thông tin Dịch vụ

> Danh sách đầy đủ 8 service HRM triển khai lên K8s.  
> Tất cả viết bằng **.NET 8**, deploy dạng **Deployment** (stateless).  
> Port service: **8080** | Port metrics: **9090** (Prometheus, internal only).

---

## Danh sách service

| TT | Service Name | Mô tả | Instance | Port Svc | Port Metrics | Replicas PROD |
|----|-------------|-------|----------|----------|-------------|---------------|
| 1 | hrm-presentation-empportal | Giao diện nhân viên (Employee Portal) | Deployment | 8080 | 9090 | 2 |
| 2 | hrm-presentation-hr-service | Service xử lý dữ liệu HR (core) | Deployment | 8080 | 9090 | 6 |
| 3 | hrm-presentation-system-service | Service quản lý phân quyền hệ thống | Deployment | 8080 | 9090 | 4 |
| 4 | hrm-presentation-main | Giao diện quản trị nhân sự (HR Admin) | Deployment | 8080 | 9090 | 6 |
| 5 | hrm-sc-service-apicore | API core nghiệp vụ (shared API layer) | Deployment | 8080 | 9090 | 6 |
| 6 | integration-service-apicore | Service tích hợp hệ thống bên ngoài | Deployment | 8080 | 9090 | 2 |
| 7 | sc-service-identity | Xác thực & phân quyền (Identity/SSO) | Deployment | 8080 | 9090 | 2 |
| 8 | presentation-windows-servicecore | Background job, Hangfire scheduler, email | Deployment | 8080 | 9090 | 1 |

---

## Mô tả chi tiết từng service

### 1. hrm-presentation-empportal
- **Vai trò:** Giao diện web dành cho nhân viên — xem bảng lương, nghỉ phép, chấm công
- **User:** Nhân viên toàn công ty
- **Traffic pattern:** Cao vào đầu/cuối tháng (xem lương), giờ hành chính
- **Dependencies:** hr-service, system-service, apicore, identity, redis, s3

### 2. hrm-presentation-hr-service
- **Vai trò:** Service xử lý nghiệp vụ HR — tính lương, quản lý nhân sự, chấm công
- **User:** Gọi từ các service khác (internal API)
- **Traffic pattern:** Liên tục, là **bottleneck chính** của hệ thống → replicas cao nhất (6)
- **Dependencies:** mssql, redis, s3, apicore, identity

### 3. hrm-presentation-system-service
- **Vai trò:** Quản lý phân quyền, cấu hình hệ thống, danh mục
- **User:** Admin hệ thống
- **Traffic pattern:** Trung bình — bị gọi trong mỗi request kiểm tra quyền
- **Dependencies:** mssql, redis, hr-service, apicore

### 4. hrm-presentation-main
- **Vai trò:** Giao diện quản trị cho phòng Nhân sự — tuyển dụng, hợp đồng, đào tạo
- **User:** HR Manager, phòng Nhân sự
- **Traffic pattern:** Cao giờ hành chính
- **Dependencies:** hr-service, system-service, apicore, identity, redis, s3

### 5. hrm-sc-service-apicore
- **Vai trò:** API core shared — layer xử lý business logic chung cho các presentation service
- **User:** Gọi từ tất cả presentation services
- **Traffic pattern:** Rất cao — là **gateway nội bộ** → replicas cao (6)
- **Dependencies:** mssql, redis, s3, identity

### 6. integration-service-apicore
- **Vai trò:** Tích hợp với hệ thống bên ngoài (chấm công, third-party)
- **User:** Third-party systems gọi vào HRM qua `/integrate/v1/...`
- **Traffic pattern:** Thấp, theo lịch batch
- **Auth:** IP whitelist + client_id/secret + scope check
- **Dependencies:** mssql, redis, s3, hr-service, apicore, identity

### 7. sc-service-identity
- **Vai trò:** Authentication & Authorization — quản lý token, SSO integration
- **User:** Tất cả services (gọi để validate token)
- **Traffic pattern:** Cao — mỗi request đều phải qua identity check
- **Dependencies:** mssql, redis

### 8. presentation-windows-servicecore
- **Vai trò:** Background services — Hangfire scheduler, gửi email thông báo, batch processing
- **User:** Không có user trực tiếp — chạy nền
- **Traffic pattern:** Theo lịch Hangfire — không phải realtime
- **Special:** Duy nhất service gọi ra **smtp.gmail.com** (external)
- **Replicas:** 1 (singleton để tránh duplicate jobs)
- **Dependencies:** mssql, redis, s3, smtp.gmail.com, tất cả services

---

## Cấu hình K8s mẫu (1 service)

```yaml
# Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hrm-presentation-hr-service
spec:
  replicas: 6
  selector:
    matchLabels:
      app: hrm-presentation-hr-service
  template:
    spec:
      containers:
      - name: hrm-presentation-hr-service
        image: <registry>/hrm-presentation-hr-service:<tag>
        ports:
        - containerPort: 8080   # service
        - containerPort: 9090   # metrics
        resources:
          requests:
            cpu: "1"
            memory: "2Gi"
          limits:
            cpu: "4"
            memory: "8Gi"
        envFrom:
        - configMapRef:
            name: hrm-config
        - secretRef:
            name: hrm-secret
        livenessProbe:
          httpGet: { path: /health/live, port: 8080 }
        readinessProbe:
          httpGet: { path: /health/ready, port: 8080 }
        securityContext:
          runAsNonRoot: true
---
# Service
apiVersion: v1
kind: Service
metadata:
  name: hrm-presentation-hr-service
spec:
  ports:
  - name: http
    port: 8080
  - name: metrics
    port: 9090
```

---

## Ghi chú

- Tất cả service đều **stateless** — state lưu trong Redis / MSSQL
- Port 9090 (metrics) chỉ mở trong **Internal Network** — không expose ra ngoài
- `presentation-windows-servicecore` nên có `podAntiAffinity` để tránh chạy 2 replica trên cùng node
- Sizing chi tiết: [[05-Deploy-Sizing-PROD]]
- Kết nối giữa services: [[09-Deploy-Network]]
