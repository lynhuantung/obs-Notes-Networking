---
type: note
title: SaaS VnR — Nhân Sự & Phân Công
tags: [saas, team, members, responsibility]
created: 2026-05-02
related: ["[[00-INDEX]]", "[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# SaaS VnR — Nhân Sự & Phân Công

## Danh sách thành viên

### Tung.Ly
- **Vai trò:** Lead Backend (multi-tenant core)
- **Phụ trách:**
  - Switch nhiều database theo tenantCode
  - BaseService — log per-tenant
  - Window Service multi-tenant
  - Claim tenant / authen flow
  - Kịch bản vận hành SaaS
  - Timeline demo cho a.Hiền

### Hoàng.Nguyễn
- **Vai trò:** Lead Identity & Tenant UI Backend
- **Phụ trách:**
  - IdentityServer4 mới (thay Identity cũ)
  - API tích hợp Misa-HRM
  - Move tenant từ Identity cũ sang Identity mới
  - Giao diện Tenant Management (phối hợp FE)
  - API cập nhật mật khẩu lúc tạo DB mới

### Phúc.Dương
- **Vai trò:** Lead K8s / DevOps
- **Phụ trách:**
  - Kubernetes — dựng node Windows
  - Volume K8s
  - Dockerfile (phối hợp Minh)
  - Monitor & Log (phối hợp Hiếu.Lê)
  - Làm tài liệu K8s
  - Tổ chức lại tài liệu K8s

### Hiếu.Lê
- **Vai trò:** K8s Architecture & DevOps (từ tuần 09)
- **Phụ trách:**
  - Kiến trúc K8s chuẩn cho production
  - Kế hoạch DevOps (start/end/PIC/status)
  - Họp với CMC về K8s AWS (16/10/2023)
  - Monitor và log — đọc log request
  - S3 storage môi trường test

### Sáng.Mai
- **Vai trò:** Storage & Window Service
- **Phụ trách:**
  - MinIO — upload/download, config SSL
  - AWS S3 (phối hợp Hiếu.Lê)
  - Tài liệu storage
  - Đồng bộ file template lên MinIO
  - Window service sub-process theo tenantCode (phối hợp Tung.Ly)
  - Log per-tenant (phối hợp)

### Minh.NguyễnĐạt
- **Vai trò:** Docker
- **Phụ trách:**
  - Build Docker image (bao gồm .NET Framework)
  - Đưa image lên Docker Hub
  - Dockerfile bằng dòng lệnh
  - Demo migrate data vào DB container Docker

### Tú.Huỳnh
- **Vai trò:** K8s
- **Phụ trách:**
  - Dựng web test chạy trên Kubernetes
  - Volume trong Kubernetes
  - Vẽ mô hình kiến trúc cluster (phối hợp Phúc)

### Đăng.Vũ
- **Vai trò:** UI/UX Designer
- **Phụ trách:**
  - Thiết kế giao diện Tenant Management
  - Thiết kế giao diện User Management

### Vũ.Lê
- **Vai trò:** Senior Dev — hỗ trợ kỹ thuật
- **Phụ trách:**
  - Giải pháp biến static per-tenant
  - Hỗ trợ code (tối thứ 4 hoặc thứ 6)
  - Log per-tenant (phối hợp)
  - Window Service multi-tenant (phối hợp)

### Linh / Bảo
- **Vai trò:** Frontend developer
- **Phụ trách:**
  - Tenant UI (màn hình đăng ký, dashboard)
  - Màn hình kích hoạt tài khoản step-by-step
  - Hoàn thiện các edge case UI

### a.Hiền (Sponsor)
- **Vai trò:** Product Owner / Decision Maker
- **Phụ trách:**
  - Quyết định kiến trúc cuối cùng
  - Review kế hoạch K8s với Hiếu.Lê
  - Điều phối module chỉnh sửa storage
  - Review kế hoạch 4 tháng

---

## Ma trận RACI — Các module chính

| Module | Responsible | Accountable | Consulted | Informed |
|--------|------------|-------------|-----------|---------|
| Multi-DB / Switch tenant | Tung.Ly | a.Hiền | Vũ.Lê | All |
| Identity Server mới | Hoàng.Nguyễn | a.Hiền | Tung.Ly | All |
| Tenant UI (FE) | Linh/Bảo | Hoàng.Nguyễn | Đăng.Vũ | All |
| Storage MinIO/S3 | Sáng.Mai | a.Hiền | Hiếu.Lê | All |
| Redis cache per-tenant | Tung.Ly | a.Hiền | Vũ.Lê | All |
| K8s / DevOps | Phúc.Dương | a.Hiền | Hiếu.Lê | All |
| Monitor / Loki | Hiếu.Lê + Phúc | a.Hiền | — | All |
| Docker | Minh.NguyễnĐạt | Phúc.Dương | — | All |
| Window Service | Tung.Ly | a.Hiền | Vũ.Lê, Sáng | All |
| Licence model | Tung.Ly | a.Hiền | Sáng, Hoàng | All |

---

## Đối tác / Vendor bên ngoài

| Đối tác | Vai trò | Ghi chú |
|---------|---------|---------|
| **SaveMoney** | Tư vấn K8s on-prem | Hỗ trợ chưa đủ; chưa cài được K8s lên VnR đến tháng 09/2023 |
| **CMC** | K8s trên AWS | Họp kiến trúc 16/10/2023 với Hiếu.Lê |
| **MISA** | Marketplace HRM SaaS | Flow khách hàng đăng ký HRM qua chợ MISA |
| **AWS** | Cloud provider | Target production: EKS, S3, RDS |
