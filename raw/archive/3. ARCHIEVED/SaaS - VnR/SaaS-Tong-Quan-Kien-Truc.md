---
type: note
title: SaaS VnR — Kiến Trúc Tổng Thể
tags:
  - saas
  - multi-tenant
  - k8s
  - architecture
  - on-cloud
  - on-premises
created: 2026-05-02
related:
  - [[00-INDEX]]
  - [[SaaS-Tien-Trinh-Phat-Trien]]
  - [[SaaS-Ky-Thuat-Quyet-Dinh]]
---

# SaaS VnR — Kiến Trúc Tổng Thể

---

## 1. Mô hình mục tiêu: HRM Multi-Tenant SaaS

VnResource triển khai HRM theo mô hình **Multi-Tenant**: một bộ codebase HRM phục vụ nhiều công ty khách hàng (tenant) khác nhau trên cùng một hạ tầng.

### 1.1 Phân tầng kiến trúc

```
┌─────────────────────────────────────────────────────┐
│                  MISA Marketplace                   │
│          (Khách hàng đăng ký mua HRM SaaS)          │
└──────────────────────┬──────────────────────────────┘
                       │  API tích hợp Misa-HRM
┌──────────────────────▼──────────────────────────────┐
│              Tenant Management App                  │
│   - Tạo / quản lý tenant                           │
│   - Tạo database tự động khi có tenant mới         │
│   - Quản lý user login theo tenantCode             │
│   - Identity Server (IdentityServer4 mới)          │
└────────┬──────────────────────┬─────────────────────┘
         │                      │
┌────────▼──────┐    ┌──────────▼──────────┐
│  HRM Tenant A │    │   HRM Tenant B ...  │
│  DB riêng     │    │   DB riêng          │
│  Storage riêng│    │   Storage riêng     │
└───────────────┘    └─────────────────────┘
         │
┌────────▼────────────────────────────────────────────┐
│                 Infrastructure                      │
│  Kubernetes (K8s) + Docker                         │
│  Storage: MinIO (on-prem) / AWS S3 (cloud)         │
│  Cache: Redis (per-tenant key)                     │
│  Log: Loki (per-tenant folder)                     │
│  Monitor: Grafana / custom dashboard               │
└─────────────────────────────────────────────────────┘
```

### 1.2 Nguyên tắc cốt lõi Multi-Tenant

| Thành phần | Chiến lược |
|-----------|-----------|
| **Database** | Mỗi tenant = 1 database riêng biệt (DB-per-tenant) |
| **Storage** | Mỗi tenant = 1 bucket/folder riêng trên MinIO hoặc S3 |
| **Cache (Redis)** | Key namespace theo `tenantCode` |
| **Log** | Thư mục log chia theo `tenantCode` |
| **Window Service** | Sub-process riêng theo `tenantCode` |
| **Identity** | Một Identity Server chung, xác thực theo tenant claim |
| **Config** | Tenant Management DB lưu connection string của từng tenant |

---

## 2. So sánh On-Premises vs On-Cloud

> Nguồn: `Documents/k8s/phantich_sosanh_onpremiss_onCloud.md`

| Tiêu chí | On-Premises | On-Cloud (AWS) |
|----------|-------------|----------------|
| Cài đặt | Phức tạp, quản lý phần cứng | Nhanh, không cần quản lý hạ tầng |
| Chi phí ban đầu | **Cao** | Thấp (pay-as-you-go) |
| Bảo mật | Kiểm soát hoàn toàn | Nhà cung cấp quản lý |
| Traffic performance | **Tốt hơn** (mạng nội bộ) | Phụ thuộc internet |
| Scale | Thủ công, hạn chế | **Tự động, linh hoạt** |
| Nâng cấp | Thủ công | Tự động |
| Backup/Restore | Tự quản lý | Tự động từ cloud |
| Quyền sở hữu data | **Hoàn toàn** | Lưu trên server provider |

### Khuyến nghị theo use case

| Trường hợp | Lựa chọn |
|------------|----------|
| Bảo mật cao, kiểm soát data tuyệt đối | **On-Premises** |
| Traffic tối ưu, mạng nội bộ | **On-Premises** |
| Triển khai nhanh, không quản lý hạ tầng | **On-Cloud** |
| Ngân sách ban đầu hạn chế | **On-Cloud** |
| Cần scale linh hoạt | **On-Cloud** |

### Điều kiện trước khi lên Cloud

1. **Tối ưu tài nguyên** — kiểm soát RAM/CPU tránh chi phí không cần thiết
2. **File storage** — đưa uploads ra S3/tương đương; khách hàng trả theo dung lượng
3. **Tối ưu tác vụ nặng** — review code trước khi scale

---

## 3. Hai phiên bản kiến trúc K8s

### v1.0.0 — Architecture On-Premises
> File: `Flow/K8s/K8s/v1.0.0.Architecture_OnPremesis.png`

- Kubernetes cluster chạy on-prem (máy chủ VnR)
- Node Windows hỗ trợ .NET Framework
- Volume persistent storage nội bộ
- MinIO làm file storage

### v2.0.0 — Architecture AWS
> File: `Flow/K8s/K8s/v2.0.0.Architecture_AWS.png`

- EKS (Elastic Kubernetes Service) trên AWS
- AWS S3 cho file storage
- Helm Chart thay Dockerfile compose (AWS không hỗ trợ compose trực tiếp)
- RDS hỗ trợ read/write split, auto-scale
- Loki cho log aggregation

---

## 4. Kịch bản vận hành SaaS

> File gốc: `Flow/Kịch bản vận hành SaaS.drawio`

### Luồng khách hàng đăng ký (Happy Path)

```
1. KH đăng ký HRM qua MISA Marketplace
      ↓
2. API Misa gọi HRM API → tạo tenant mới
      ↓
3. Tenant Management tự động:
   - Tạo database mới (restore từ template)
   - Tạo user superadmin
   - Gán tenantCode
   - Lưu connection string vào DB quản lý tenant
      ↓
4. Gửi email kích hoạt → KH đổi mật khẩu lần đầu
      ↓
5. KH login vào HRM với tenantCode + credentials
      ↓
6. HRM resolve tenantCode → kết nối đúng DB tenant
      ↓
7. KH sử dụng HRM (upload file → vào storage riêng của tenant)
```

---

## 5. Sơ đồ tham chiếu

| File | Mô tả |
|------|-------|
| `Flow/HRM_Multi_tenant.png` | Multi-tenant overview |
| `Flow/MultiTenant_Structure.png` | Cấu trúc hệ thống multi-tenant |
| `Flow/K8s/Multi tenant/Kubernetes_VnR.png` | K8s cluster VnR |
| `Flow/K8s/Multi tenant/marketPlace_Misa.png` | Flow đăng ký từ MISA |
| `xmind/Hình ảnh/Saas_RoadMap.png` | Roadmap SaaS |
| `xmind/Hình ảnh/Saas_TimeLine.png` | Timeline dự án |
