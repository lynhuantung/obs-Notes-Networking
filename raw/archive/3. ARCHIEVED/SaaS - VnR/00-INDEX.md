---
type: index
title: SaaS VnR — Index
tags: [saas, multi-tenant, k8s, index]
created: 2026-05-02
updated: 2026-05-02
---

# SaaS VnR — Index

Dự án nghiên cứu & xây dựng nền tảng **HRM SaaS / Multi-Tenant** của VnResource.
Thời gian R&D: **Jul 2023 → Oct 2023** (archived).

---

## Tài liệu tổng hợp

| File | Nội dung |
|------|----------|
| [[SaaS-Tong-Quan-Kien-Truc]] | Kiến trúc tổng thể, mô hình Multi-Tenant, so sánh On-Prem vs On-Cloud, luồng đăng ký KH |
| [[SaaS-Tien-Trinh-Phat-Trien]] | Timeline 4 phase, tóm tắt từng buổi họp, điểm dừng |
| [[SaaS-Ky-Thuat-Quyet-Dinh]] | Quyết định đã chốt ✅, vấn đề đã giải ✅, tồn đọng ❌, phân tích rủi ro |
| [[SaaS-Nhan-Su]] | Danh sách thành viên, phân công, ma trận RACI, đối tác vendor |
| [[SaaS-Stack-Ky-Thuat]] | Stack chi tiết: DB, Redis, MinIO/S3, K8s, Identity, Log, Monitor, Window Service |
| [[SaaS-Van-De-Mo]] | 12 câu hỏi mở chưa trả lời, priority nếu resume dự án |

---

## Biên bản họp (16 buổi)

| File | Ngày | Nội dung chính |
|------|------|---------------|
| [[Meeting-0715]] | 15/07/2023 | Kickoff: K8s, flow MISA, điểm cần sửa HRM |
| [[Meeting-0722]] | 22/07/2023 | Docker web, K8s web, kế hoạch Git |
| [[Meeting-2907]] | 29/07/2023 | Thuê server, MinIO, migrate data Docker |
| [[Meeting-0805]] | 05/08/2023 | Multi-tenant design, MinIO per-tenant, kịch bản vận hành |
| [[Meeting-0810]] | 10/08/2023 | UI Tenant Management, User Management |
| [[Meeting-0812]] | 12/08/2023 | User data warehouse, tenantCode login, biến static |
| [[Meeting-0819]] | 19/08/2023 | Luồng tạo tenant → login, SaveMoney vấn đề K8s |
| [[Meeting-0826]] | 26/08/2023 | Demo target, user SQL, upload file |
| [[Meeting-0909]] | 09/09/2023 | Review (biên bản trống) |
| [[Meeting-0918]] | 18/09/2023 | Redis per-tenant ✅, MinIO SSL ❌, Window Service vấn đề |
| [[Meeting-0923]] | 23/09/2023 | K8s Phúc+Hiếu lead, Loki kế hoạch, Claim cookie fallback |
| [[Meeting-0930]] | 30/09/2023 | S3 AWS, Helm Chart, CMC, Log per-tenant ✅ |
| [[Meeting-1007]] | 07/10/2023 | Monitor plan, Claim tenant ✅, Window Service deadline |
| [[Meeting-1014]] | 14/10/2023 | CMC họp 16/10, Identity 90%, Licence ❓ chưa chốt |
| [[Meeting-1021]] | 21/10/2023 | Identity mới DONE ✅, link demo, SQLite → JSON log |
| [[Meeting-1028]] | 28/10/2023 | Buổi họp cuối (biên bản trống) |

---

## Cấu trúc thư mục gốc

```
SaaS - VnR/
├── 00-INDEX.md                          ← file này
├── SaaS-Tong-Quan-Kien-Truc.md
├── SaaS-Tien-Trinh-Phat-Trien.md
├── SaaS-Ky-Thuat-Quyet-Dinh.md
├── SaaS-Nhan-Su.md
├── SaaS-Stack-Ky-Thuat.md
├── SaaS-Van-De-Mo.md
├── Meeting-0715.md  →  Meeting-1028.md  (16 files)
│
├── Documents/                           → Tài liệu gốc (.docx, .pdf, .xlsx)
│   ├── k8s/phantich_sosanh_onpremiss_onCloud.md
│   ├── Phân Tích Và So Sánh SaaS...pdf
│   └── Report_MultiTenant-SaaS.pdf
│
├── Flow/                                → Sơ đồ kiến trúc
│   ├── HRM_Multi_tenant.png
│   ├── MultiTenant_Structure.png
│   ├── Kịch bản vận hành SaaS.drawio
│   └── K8s/ (v1 OnPremises + v2 AWS + MultiTenant diagrams)
│
└── xmind/
    ├── Bien_Ban_Hop/                    → 17 file .md gốc (có encoding lỗi UTF-8)
    └── Hình ảnh/                        → Evidence ảnh, Saas_RoadMap.png, Saas_TimeLine.png
```

---

## Timeline nhanh

```
Jul 2023  → Kickoff: K8s, Docker, flow MISA
Aug 2023  → Core multi-tenant: DB per tenant, Tenant Mgmt UI, MinIO
Sep 2023  → Kỹ thuật: Redis per-tenant, Identity mới, Log per-tenant, K8s với Hiếu.Lê
Oct 2023  → CMC + AWS, Helm Chart, Identity DONE, Monitor plan
           → ARCHIVED (Window Service, biến static, Licence chưa xong)
```

---

## Key decisions

| Quyết định | Lựa chọn |
|-----------|---------|
| DB strategy | DB per Tenant |
| Cache | Redis key theo tenantCode |
| Storage dev | MinIO |
| Storage prod | AWS S3 |
| Identity | IdentityServer4 mới |
| Container | Docker + Helm Chart |
| Orchestration | Kubernetes (EKS target) |
| Log dài hạn | Loki + Grafana |
| Cloud target | AWS (EKS, S3, RDS) |
| Partner K8s | CMC |
