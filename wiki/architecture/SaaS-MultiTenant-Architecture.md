---
description: "Kiến trúc SaaS multi-tenant VnR năm 2023, phân tầng Kubernetes và mô hình quản lý nhiều khách hàng."
type: architecture
tags:
  - "saas"
  - "multi-tenant"
  - "k8s"
  - "system"
domain: system
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/SaaS-VnR-KienTruc-Stack]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
---

# Architecture: SaaS Multi-Tenant VnR (2023)

## Phân tầng kiến trúc tổng thể

```
┌─────────────────────────────────────────────────────┐
│              MISA Marketplace                       │
│     (Khách hàng đăng ký mua HRM SaaS)               │
└──────────────────────┬──────────────────────────────┘
                       │  API tích hợp Misa→HRM
┌──────────────────────▼──────────────────────────────┐
│           Tenant Management App                     │
│  - Tạo / quản lý tenant                            │
│  - Tạo DB tự động khi có tenant mới                │
│  - Quản lý user login theo tenantCode              │
│  - IdentityServer4 (mới) — có UI quản lý           │
└──────┬────────────────────────┬────────────────────┘
       │                        │
┌──────▼──────┐      ┌──────────▼──────────┐
│ HRM Tenant A│      │  HRM Tenant B ...   │
│ DB riêng    │      │  DB riêng           │
│ Storage riêng      │  Storage riêng      │
└─────────────┘      └─────────────────────┘
       │
┌──────▼──────────────────────────────────────────────┐
│                  Infrastructure                     │
│  Kubernetes (K8s) + Docker + Helm Chart            │
│  Storage: MinIO (dev/on-prem) / AWS S3 (prod)      │
│  Cache: Redis — key namespace theo tenantCode      │
│  Log: folder per tenantCode → Loki (kế hoạch)      │
│  Monitor: Grafana                                   │
│  Identity: IdentityServer4 (port :1801)            │
└─────────────────────────────────────────────────────┘
```

## Chiến lược isolation per-tenant

| Thành phần | Chiến lược | Trạng thái |
|-----------|-----------|------------|
| **Database** | DB-per-tenant (SQL Server) | ✅ DONE |
| **Cache (Redis)** | Key: `{tenantCode}:{module}:{id}` | ✅ DONE |
| **Storage** | MinIO bucket per tenant (dev) / S3 (prod) | ✅ DONE |
| **Log** | Folder `logs/{tenantCode}/` trong BaseService | ✅ DONE |
| **Identity** | IdentityServer4 mới — claim tenantCode trong JWT | ✅ DONE |
| **Window Service** | Sub-process per tenantCode (đề xuất) | ❌ Chưa xong |
| **Biến Static** | Refactor sang scoped/per-tenant | ❌ Chưa xong |
| **Licence** | Model chưa chốt | ❌ Pending |

## Stack kỹ thuật

```
Backend    : C# .NET (Framework 4.x + Core 6+)
Database   : SQL Server (DB-per-tenant)
Cache      : Redis (key namespace tenantCode)
Storage    : MinIO (dev) → AWS S3 (prod)
Identity   : IdentityServer4 (Docker, port 1801)
Container  : Docker (Dockerfile — không dùng Compose trên AWS)
Orchestration: Kubernetes
  On-prem v1: Node Windows + MinIO + SaveMoney (thất bại)
  Cloud v2  : AWS EKS + S3 + RDS + Helm Chart (CMC)
Log        : Custom folder per-tenant → Loki + Grafana (kế hoạch)
Monitor    : Grafana
CI/CD      : Git + DevOps plan (Hiếu.Lê + CMC)
```

## Hai phiên bản K8s

```
v1.0.0 — On-Premises
  Cluster: self-hosted (VnR)
  Node: Windows (cho .NET Framework)
  Storage: MinIO on-prem
  Volume: persistent local
  Partner: SaveMoney (thất bại tháng 9/2023)

v2.0.0 — AWS
  Cluster: EKS (Elastic Kubernetes Service)
  Storage: AWS S3
  DB: RDS (auto read/write split, auto-scale)
  Config: Helm Chart (bắt buộc thay Docker Compose)
  Partner: CMC (họp 16/10/2023)
  Log: Loki aggregation
```

## Tenant resolution flow (runtime)

```
Request đến HRM
    ↓
Lấy tenantCode từ:
  1. JWT Claim (ưu tiên)
  2. HTTP Header
  3. Cookie (fallback nếu null)
    ↓
Lookup connection string trong Tenant Management DB
    ↓
Tạo DbContext với connection string của tenant đó
    ↓
Tất cả query trong request dùng đúng DB của tenant
```

## File dùng chung (không copy per-tenant)

- `lang/` — file ngôn ngữ
- `field_info/` — metadata cấu hình field
- Template mẫu (Luân tạo → Sáng.Mai sync lên MinIO)

## Nhân sự phụ trách

| Module | Lead |
|--------|------|
| Multi-DB / Switch tenant | Tung.Ly |
| Identity Server 4 mới | Hoàng.Nguyễn |
| Storage MinIO/S3 | Sáng.Mai |
| Redis cache per-tenant | Tung.Ly + Vũ.Lê |
| K8s / DevOps | Phúc.Dương + Hiếu.Lê |
| Docker | Minh.NguyễnĐạt |
| Tenant UI (FE) | Linh / Bảo / Đăng.Vũ |
| Window Service | Tung.Ly + Sáng.Mai |

## So sánh On-Premises vs On-Cloud

| Tiêu chí | On-Premises | On-Cloud (AWS) |
|----------|-------------|----------------|
| Chi phí ban đầu | Cao | Thấp (pay-as-you-go) |
| Traffic performance | Tốt hơn | Phụ thuộc internet |
| Scale | Thủ công | Tự động, linh hoạt |
| Bảo mật / Kiểm soát data | Hoàn toàn | Nhà cung cấp quản lý |
| Backup/Restore | Tự quản lý | Tự động từ cloud |

## Liên kết

- [[wiki/sources/SaaS-VnR-KienTruc-Stack]] — source đầy đủ
- [[wiki/architecture/HRM-System-Architecture]] — kiến trúc HRM on-premise hiện tại
- [[wiki/architecture/HRM-Deployment-Architecture]] — deployment IIS / K8s production
- [[wiki/sources/SaaS-VnR-Meetings-Detail-2023]] — biên bản họp 16 buổi
