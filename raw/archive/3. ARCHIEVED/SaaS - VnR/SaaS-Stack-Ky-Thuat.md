---
type: note
title: SaaS VnR — Stack Kỹ Thuật & Công Nghệ
tags: [saas, tech-stack, k8s, docker, redis, minio, s3, identity, loki]
created: 2026-05-02
related: ["[[00-INDEX]]", "[[SaaS-Ky-Thuat-Quyet-Dinh]]", "[[SaaS-Tong-Quan-Kien-Truc]]"]
---

# SaaS VnR — Stack Kỹ Thuật & Công Nghệ

---

## 1. Backend

### C# / .NET
| Thành phần | Version | Ghi chú |
|-----------|---------|---------|
| .NET Framework | 4.x | HRM cũ — cần Docker node Windows |
| .NET Core / .NET | 6+ | HRM mới — chạy được Linux container |
| IdentityServer4 | Mới | Thay Identity cũ; có UI quản lý; chạy Docker |
| Entity Framework | — | ORM cho HRM |

### Chiến lược Multi-Tenant (Backend)
```csharp
// Tenant resolution flow:
// 1. Request đến → lấy tenantCode từ:
//    - HTTP Header
//    - Claim (JWT)
//    - Cookie (fallback nếu null)
// 2. Lookup connection string từ Tenant Management DB
// 3. Tạo DbContext với connection string tương ứng
// 4. Tất cả query trong request dùng DbContext của tenant đó
```

**Vấn đề biến static (chưa giải quyết):**
```csharp
// ❌ Pattern cũ — KHÔNG an toàn multi-tenant:
public static class PermissionHelper {
    public static List<Permission> Permissions; // Shared toàn app!
}

// ✅ Pattern cần refactor sang:
// - DI Scoped per-request
// - Redis cache với key: "{tenantCode}:permissions:{userId}"
```

---

## 2. Database

### SQL Server — DB per Tenant
```
Tenant Management DB (1 DB trung tâm)
├── bảng Tenants: tenantCode, connectionString, ...
├── bảng TenantUsers: mapping user → tenant
└── bảng TenantConfig: cấu hình per tenant

Tenant A DB (tự động tạo khi đăng ký)
Tenant B DB
Tenant C DB
...
```

**Tạo DB tự động:**
- Trigger: khi admin xác nhận tạo tenant mới
- Action: restore DB từ template → gán tenantCode → tạo user SQL → lưu connection string

---

## 3. Cache — Redis

### Chiến lược key per Tenant
```
Pattern key: {tenantCode}:{module}:{identifier}

Ví dụ:
  "HONDA:permissions:user123"
  "TOYOTA:masterdata:departments"
  "FGL:cache:reportConfig"
```

**Lợi ích:** Flush cache một tenant không ảnh hưởng tenant khác.

---

## 4. Storage

### Dev: MinIO
| Thuộc tính | Giá trị |
|-----------|---------|
| Loại | Object storage (S3-compatible) |
| Triển khai | On-premises (self-hosted) |
| Per-tenant | Mỗi tenant = 1 bucket riêng |
| SSL | ❌ Chưa cài được (tồn đọng) |
| Vấn đề | Case-sensitive chữ hoa/thường |

### Production: AWS S3
| Thuộc tính | Giá trị |
|-----------|---------|
| Loại | Managed object storage |
| Per-tenant | Mỗi tenant = 1 bucket hoặc prefix |
| Billing | Khách hàng trả theo dung lượng sử dụng |
| Chi phí | Pay-as-you-go |

**File dùng chung** (không copy per-tenant):
- `lang` — file ngôn ngữ
- `field_info` — metadata cấu hình field
- Template mẫu (Luân tạo → Sáng.Mai đồng bộ lên MinIO)

---

## 5. Container & Orchestration

### Docker
| Thành phần | Ghi chú |
|-----------|---------|
| Base image .NET Framework | Node Windows bắt buộc |
| Base image .NET Core | Linux OK |
| Dockerfile | Build bằng dòng lệnh (không dùng Compose trực tiếp) |
| Docker Hub | Share image nội bộ team |

### Kubernetes (K8s)
| Thành phần | On-Prem (v1.0) | On-Cloud/AWS (v2.0) |
|-----------|---------------|---------------------|
| Cluster | Self-hosted | AWS EKS |
| Node OS | Windows (cho .NET FW) | Mixed |
| Storage | Volume persistent | AWS EBS/EFS |
| File storage | MinIO | AWS S3 |
| Config | — | Helm Chart |
| Deployment | Docker Compose (dev) | **Helm Chart** (prod) |

> ⚠️ AWS **không hỗ trợ Docker Compose** → phải dùng Helm Chart cho production.

---

## 6. Identity & Authentication

### IdentityServer4 (mới)
| Thuộc tính | Giá trị |
|-----------|---------|
| Loại | OpenID Connect / OAuth2 |
| UI quản lý | ✅ Có (thay Identity cũ không có UI) |
| Chạy trong | Docker container |
| Port (local) | `:1801` |
| Hỗ trợ | Main HRM + Portal + APIv3 |
| Multi-tenant | Nhận `tenantCode` qua claim |

**Login flow multi-tenant:**
```
1. User vào trang login
2. Nhập: username + password + tenantCode
3. Identity Server xác thực
4. Trả về JWT có claim tenantCode
5. HRM app đọc tenantCode từ claim → resolve DB
```

---

## 7. Logging

### Ngắn hạn (implemented)
```
Log folder structure:
  logs/
  ├── HONDA/
  │   ├── app-2023-10-01.log
  │   └── error-2023-10-01.log
  ├── TOYOTA/
  │   └── ...
  └── FGL/
      └── ...
```
- Sửa trong `BaseService` → set tenantCode vào log context

### Dài hạn (kế hoạch)
| Công nghệ | Vai trò |
|-----------|---------|
| **Loki** | Log aggregation (Grafana Labs) |
| **Grafana** | Web dashboard xem log |
| Console output | Log theo chuẩn JSON → Loki đọc |

---

## 8. Monitor

| Công nghệ | Vai trò | Trạng thái |
|-----------|---------|-----------|
| Custom monitor | Log cho ứng dụng nội bộ | 🔄 Đang setup |
| Grafana | Dashboard | 🔄 Cài đặt môi trường DONE; cấu hình lỗi |
| Log request (SQLite) | Trace HTTP request | ❌ Chưa đọc được → đang chuyển sang JSON |

---

## 9. Window Service

**Vấn đề:** Windows Service background jobs không có HTTP context → không có `tenantCode`.

**Giải pháp đề xuất (chưa implement):**
```
Option 1: Sub-process per tenant
  - Mỗi tenant = 1 sub-process của Window Service
  - Sub-process nhận tenantCode làm argument

Option 2: API-driven
  - Window Service gọi API nội bộ
  - API nhận tenantCode trong header/param
  - API tự resolve DB context
```

---

## 10. CI/CD (Kế hoạch)

| Thành phần | Kế hoạch |
|-----------|---------|
| Source control | Git (TFS → Git) |
| Build pipeline | DevOps plan (Hiếu.Lê) |
| Deploy | Helm Chart lên EKS |
| Partner | CMC (họp 16/10/2023) |
