---
type: note
title: SaaS VnR — Quyết Định Kỹ Thuật & Vấn Đề Tồn Đọng
tags:
  - saas
  - technical
  - decisions
  - issues
  - k8s
  - multi-tenant
created: 2026-05-02
related:
  - [[00-INDEX]]
  - [[SaaS-Tong-Quan-Kien-Truc]]
  - [[SaaS-Tien-Trinh-Phat-Trien]]
---

# SaaS VnR — Quyết Định Kỹ Thuật & Vấn Đề Tồn Đọng

---

## 1. Quyết định kỹ thuật đã chốt ✅

### Database per Tenant
- **Quyết định:** Mỗi tenant = 1 SQL Server database riêng biệt
- **Cách hoạt động:** Tenant Management DB lưu connection string → HRM resolve lúc runtime theo `tenantCode`
- **Tạo DB tự động:** Khi admin tạo tenant mới → chạy script restore từ DB template
- **Người thực hiện:** Tung.Ly

### Redis Cache per Tenant
- **Vấn đề gốc:** Biến static / memory cache trong .NET dùng chung toàn app → multi-tenant không phân biệt được tenant
- **Giải pháp:** Lưu cache với key namespace theo `tenantCode`
- **Ví dụ:** `cache_key = "{tenantCode}:permission:{userId}"`
- **Người thực hiện:** Vũ.Lê + Tung.Ly

### Storage per Tenant (MinIO → S3)
- **Quyết định:** Mỗi tenant = 1 bucket/folder riêng
- **Giai đoạn dev:** MinIO (on-prem)
- **Giai đoạn production:** AWS S3
- **Lưu ý:** File dùng chung (lang, field_info...) cần xử lý riêng — không copy trùng lặp
- **Người thực hiện:** Sáng.Mai

### Identity Server mới
- **Vấn đề gốc:** Identity cũ không hỗ trợ multi-tenant tốt
- **Giải pháp:** Dùng IdentityServer4 mới — có UI quản lý, chạy trong Docker
- **Trạng thái (21/10):** DONE — main/portal/apiv3 đều chạy với identity mới ✅
- **Link demo local:** 
  - Main: `https://hn-site.dev.local:2000`
  - Portal: `https://hn-site.dev.local:2001`
  - Identity: `https://hn-site.dev.local:1801`
- **Người thực hiện:** Hoàng.Nguyễn

### Log per Tenant
- **Quyết định:** Tạo thư mục log riêng theo `tenantCode`
- **Giải pháp ngắn hạn:** Sửa file global trong BaseService
- **Kế hoạch dài hạn:** Dùng **Loki** — log theo console + web dashboard Grafana
- **Người thực hiện:** Tung.Ly + Sáng.Mai + Vũ.Lê

### Kubernetes & Docker
- **Docker:** Dùng Dockerfile build image; **Helm Chart** thay Docker Compose (AWS không hỗ trợ Compose)
- **K8s cluster:** Node Windows hỗ trợ .NET Framework
- **Cloud target:** AWS EKS (hợp tác CMC)
- **Người lead:** Phúc.Dương + Hiếu.Lê

### Tenant Management UI
- **Flow đăng ký:** MISA Marketplace → API → tạo tenant tự động
- **Trang login:** Thêm textbox `tenantCode`
- **Sau đăng ký:** Email kích hoạt → đổi mật khẩu lần đầu → login HRM
- **Người thực hiện:** Hoàng.Nguyễn (BE identity) + Linh/Bảo/Đăng (FE)

---

## 2. Vấn đề kỹ thuật đã giải quyết ✅

| # | Vấn đề | Giải pháp | Người giải |
|---|--------|-----------|-----------|
| 1 | 1 source dùng nhiều database | Switch connection string theo tenantCode từ DB quản lý tenant | Tung.Ly |
| 2 | Memory cache không phân biệt tenant | Redis key theo tenantCode | Vũ.Lê + Tung.Ly |
| 3 | tenantCode = null trong một số context | Xử lý lúc authenticate; fallback dùng cookie | Tung.Ly + Sáng.Mai |
| 4 | MinIO chữ hoa/thường không đồng nhất | Sửa naming convention | Sáng.Mai |
| 5 | Superadmin không chạy sau khi tạo DB mới | Fix init script | Tung.Ly + Sáng.Mai |
| 6 | Login user sai sau multi-tenant | Fix xử lý auth theo tenant | Hoàng + Tung.Ly |
| 7 | API cập nhật mật khẩu lúc tạo DB | Đã có API | Hoàng.Nguyễn |
| 8 | Identity cũ không phù hợp multi-tenant | Move sang IdentityServer4 mới | Hoàng.Nguyễn |
| 9 | Log chung không phân biệt tenant | Tạo folder theo tenantCode trong BaseService | Tung.Ly |

---

## 3. Vấn đề chưa giải quyết khi dừng dự án ❌

### 3.1 Window Service theo Multi-Tenant
- **Vấn đề:** Windows Service xử lý background job (schedule) dùng chung — không biết đang chạy cho tenant nào
- **Hướng đề xuất:** Tạo sub-process riêng theo từng `tenantCode`, gọi qua API
- **Tại sao khó:** Windows Service không có HTTP context → không có claim tenant
- **Rủi ro:** Tất cả background job (tính lương, bảo hiểm...) đang dùng chung DB → sai dữ liệu khi multi-tenant

### 3.2 Biến Static / httpContext.Cache
- **Vấn đề:** .NET có nhiều biến static và static cache không theo tenant
- **Ví dụ:** `PermissionHelper.Permissions` — load 1 lần vào static, không biết tenant nào
- **Hướng đề xuất:** Trao đổi với Vũ.Lê, refactor sang scoped/per-tenant
- **Rủi ro cao:** Nếu không xử lý → tenant A có thể thấy data permission của tenant B

### 3.3 Giải pháp Licence Multi-Tenant
- **Vấn đề:** HRM hiện bán licence theo kiểu on-premise (1 bản = 1 công ty). Multi-tenant SaaS cần mô hình licence khác
- **Chưa chốt:** Tính theo số tenant? Số user? Subscription monthly?
- **Cần:** Sáng + Hoàng + Tung.Ly ngồi lại chốt

### 3.4 K8s Production
- **Trạng thái:** Đang plan với CMC (đã họp 16/10)
- **Chưa có:** Plan deployment cụ thể, timeline production

### 3.5 MinIO SSL
- **Vấn đề:** Phúc.Dương chưa cài được SSL cho MinIO
- **Ảnh hưởng:** File upload/download trên production không an toàn

---

## 4. Stack kỹ thuật

| Layer | Công nghệ | Ghi chú |
|-------|-----------|---------|
| **Backend** | C# .NET (Framework + Core) | HRM chạy cả .NET Framework |
| **Database** | SQL Server | DB-per-tenant |
| **Cache** | Redis | Key theo tenantCode |
| **Storage** | MinIO (dev) → AWS S3 (prod) | Bucket per tenant |
| **Identity** | IdentityServer4 | Mới, có UI quản lý |
| **Container** | Docker | Dockerfile + Helm Chart |
| **Orchestration** | Kubernetes (K8s) | Node Windows + Linux |
| **Cloud** | AWS (EKS, S3, RDS) | Target production |
| **On-prem K8s** | SaveMoney hỗ trợ | Gặp khó khăn |
| **Log** | Custom folder per-tenant → Loki | Loki là kế hoạch dài hạn |
| **Monitor** | Grafana | Kết hợp với Loki |
| **CI/CD** | Git + DevOps plan | Hiếu.Lê + CMC |

---

## 5. Phân tích rủi ro & Insight

### 🔍 Core Insight: Biến static là rủi ro lớn nhất
Toàn bộ codebase HRM on-premise dùng rất nhiều `static` class và `memory cache` không có tenant scope. Đây là **vấn đề kiến trúc gốc rễ**, không chỉ là bug nhỏ. Mỗi biến static cần được audit và refactor sang per-tenant. Nếu bỏ qua → **data leak giữa tenant là chắc chắn**.

### ⚠️ Rủi ro: Window Service không có tenant context
Window Service của HRM xử lý lương, bảo hiểm, schedule. Không có context tenant → tất cả job chạy với DB mặc định. Khi multi-tenant: **tenant B có thể bị tính lương của tenant A** nếu Window Service không được cô lập.

### 🎯 Hành động nếu resume dự án
1. **Audit biến static** — liệt kê toàn bộ static class/field → phân loại: dùng chung ok / cần per-tenant
2. **Xử lý Window Service** — implement sub-process với tenantCode hoặc chuyển sang API-driven background job
3. **Chốt licence model** — quyết định trước khi demo với khách hàng thật
4. **MinIO SSL** — bắt buộc trước production

---

## 6. Người chịu trách nhiệm theo module

| Module | Lead | Backup |
|--------|------|--------|
| Multi-DB / Switch tenant | Tung.Ly | Sáng.Mai |
| Identity Server | Hoàng.Nguyễn | — |
| Tenant UI (FE) | Linh / Bảo / Đăng | Hoàng.Nguyễn |
| Storage (MinIO/S3) | Sáng.Mai | — |
| Redis cache per-tenant | Tung.Ly | Vũ.Lê |
| K8s / DevOps | Phúc.Dương | Hiếu.Lê |
| Monitor / Log (Loki) | Hiếu.Lê | Phúc.Dương |
| Docker | Minh.NguyễnĐạt | Tú.Huỳnh |
| Window Service | Tung.Ly | Vũ.Lê |
| Licence model | Tung.Ly | Sáng.Mai + Hoàng |
