---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - devops
  - qa
  - cicd
  - secret
created: 2026-05-07
updated: 2026-05-07
description: Q&A triển khai HRM K8s — câu hỏi & trả lời về môi trường, CICD, Secret/Config, phân công VNR/KH
source-file: Flow-trien-khai-he-thong.md
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[02-Deploy-Scenario]]"
  - "[[03-Deploy-Checklist-App]]"
---

# Deploy Q&A — Câu hỏi & Trả lời Triển khai

> Tổng hợp các câu hỏi phát sinh khi lên kế hoạch triển khai HRM lên K8s.  
> Nguồn: buổi họp VNR — VnPay, tài liệu `Flow-trien-khai-he-thong`.

---

## Bảng Q&A

| No. | Topic | Question | Answer | Next Action |
|-----|-------|----------|--------|-------------|
| 1 | Environment | Where is the DEV environment? | VNR cung cấp DEV + TEST. KH cung cấp UAT + PRD | — |
| 2 | CICD | Who owns CI/CD? | CI: **VNR** / CD: **KH** | KH gửi template CI/CD template cho VNR |
| 3 | CICD | Image build & deploy flow? | VNR CI Build Image → Push to KH S3 → KH Scan Security → KH CD Deploy lên K8s | — |
| 4 | DevOps | Outbound traffic flow? | K8s → External cần mở outbound | VNR cập nhật danh sách API/IP/Port cần whitelist |
| 5 | Source code | Config management? | Không dùng config cũ đóng trong image — bắt buộc dùng **K8s ConfigMap / Secret** | VNR: update source code đọc từ ConfigMap/Vault |
| 6 | Secret/Config | HashiCorp Vault? | KH chuẩn bị Vault service | KH: Prepare Vault / ConfigMap / Secret |

---

## Chi tiết từng topic

### 1. Môi trường

```
DEV   → VNR (phát triển nội bộ)
TEST  → VNR (test nội bộ trước UAT)
UAT   → KH  (nghiệm thu)
PROD  → KH  (vận hành)
```

> Nguyên tắc quan trọng: **bản build UAT = bản build PROD** — promote image không build lại.

---

### 2 & 3. CI/CD Flow

```
Developer commit code (VNR)
        ↓
VNR CI pipeline
        ↓  build Docker image
Push image → KH S3 / Image Registry
        ↓
KH chạy Security Scan (vulnerability, malware, compliance)
        ↓
KH CD pipeline
        ↓  Helm chart deploy
Kubernetes Cluster
```

- **CI thuộc VNR** — build, tag, push image
- **CD thuộc KH** — scan, deploy, vận hành cluster
- VNR chờ KH gửi CI/CD template (format Helm chart, image tag convention)

---

### 4. Outbound Traffic — cần khai báo

VNR cần cập nhật danh sách outbound services để KH mở firewall:

| Service | Endpoint / Domain | Port | Mô tả |
|---------|------------------|------|-------|
| S3 Storage | *(KH cung cấp)* | 443 | Upload/download file |
| Email | smtp.gmail.com | 587 | Gửi email (windows-servicecore) |
| SSO | *(KH cung cấp)* | 443 | Xác thực người dùng |
| Chấm công | *(KH cung cấp)* | — | Tích hợp dữ liệu chấm công |
| Integrate API | /integrate/v1/... | 443 | Third-party gọi vào HRM |

> ❓ UNKNOWN: Danh sách IP cụ thể chưa có — VNR cần bổ sung.

---

### 5 & 6. Config / Secret Management

**Cũ (không dùng nữa):**
```
appsettings.json / Web.config đóng trong image
```

**Mới (bắt buộc):**
```
K8s ConfigMap  → lưu cấu hình ứng dụng (endpoint, feature flag...)
K8s Secret     → lưu password, connection string
HashiCorp Vault → central secret store (KH cung cấp)
```

Luồng đọc config khi deploy:
```
Pod khởi động
    ↓
Đọc ConfigMap → config ứng dụng
Đọc Secret / Vault → credentials (DB password, Redis password, S3 key...)
    ↓
Ứng dụng chạy
```

**VNR action items:**
- [ ] Refactor source code: bỏ hardcode config, đọc từ env var / ConfigMap
- [ ] Liệt kê toàn bộ secret cần inject (DB, Redis, S3, SSO, email...)
- [ ] Phối hợp KH để map secret name → Vault path

---

## Thông tin môi trường (điền khi có)

| Hạng mục | UAT | PROD |
|----------|-----|------|
| URL truy cập | *(chờ KH)* | *(chờ KH)* |
| Endpoint API | *(chờ KH)* | *(chờ KH)* |
| Log/Metric URL | *(chờ KH)* | *(chờ KH)* |
| Grafana dashboard | *(chờ KH)* | *(chờ KH)* |
| Namespace K8s | *(chờ KH)* | *(chờ KH)* |

---

## Key Takeaways

- CI: VNR | CD: KH — ranh giới rõ ràng, không chồng lấn
- Không hardcode config trong image — ConfigMap/Vault là bắt buộc
- Promote image UAT → PROD, **không build lại**
- VNR phải khai báo outbound traffic để KH mở firewall
