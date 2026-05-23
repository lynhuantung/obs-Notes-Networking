---
type: flow
domain: devops
tags:
  - k8s
  - deploy
  - cicd
  - kubernetes
  - uat
  - production
created: 2026-05-07
updated: 2026-05-07
description: "Quy trình deploy HRM lên K8s: CI do VNR, CD do khách hàng. Hai luồng UAT và Production với checklist chi tiết."
related:
  - "[[wiki/sources/k8d2p-flow-capnhat-k8s-hrm]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/flows/Flow-Deploy-HRM]]"
  - "[[wiki/concepts/HRM-Deploy-Checklist]]"
---

# Flow — Deploy HRM lên Kubernetes

> **Loại**: Integration Flow — CI/CD
> **Trigger**: Có bản build mới cần cập nhật lên UAT hoặc Production
> **Phân hệ liên quan**: Tất cả service HRM (Main, Portal, Hr.Service, HrmSystem.Service, Identity, Api, Chat)

---

## Tổng quan

Quy trình triển khai HRM lên Kubernetes được chia thành 2 giai đoạn rõ ràng theo ranh giới trách nhiệm:

| Giai đoạn | Đơn vị thực hiện | Nội dung |
|-----------|-----------------|---------|
| **CI** — Build & Push image | **VNR** | Build Docker image, đóng gói, push lên S3 hoặc Registry |
| **CD** — Deploy lên K8s | **Khách hàng** | Nhận image, security scan, deploy lên cluster |

> ⚠️ VNR **không có quyền** trực tiếp thao tác trên K8s cluster của khách hàng.

---

## Luồng 1 — Cập nhật lên UAT

### Các bên tham gia

| Vai trò | Đơn vị |
|---------|--------|
| Developer | VNR |
| Leader Dev | VNR |
| QTUD (Quản trị ứng dụng) | Khách hàng |
| Tester | Khách hàng |

### Sơ đồ

```mermaid
flowchart TD
    U1["[U1] Developer chuẩn bị\nversion · image/S3 path · DB script · rollback plan"]
    U2["[U2] Leader Dev review & phê duyệt"]
    UC1{"Đồng ý?"}
    U3["[U3] QTUD kiểm tra thông tin"]
    UC2{"Đủ thông tin?"}
    UX["Làm rõ với Developer"]
    U4["[U4] QTUD deploy lên UAT\nSecurity Scan → kubectl apply"]
    UC3{"Deploy OK?"}
    U5b["[U5b] Tester kiểm thử chức năng"]
    UC4{"Pass?"}
    UDONE["[U6a] ✅ Done"]
    UCANCEL["[U5a] ❌ Cancel"]
    UFIX["[U6b] Trả Developer fix"]

    U1 --> U2 --> UC1
    UC1 -- Không --> UCANCEL
    UC1 -- Đồng ý --> U3 --> UC2
    UC2 -- Chưa đủ --> UX --> U3
    UC2 -- Đủ --> U4 --> UC3
    UC3 -- Lỗi --> UCANCEL
    UC3 -- OK --> U5b --> UC4
    UC4 -- Pass --> UDONE
    UC4 -- Fail --> UFIX

    style U4 fill:#4A90D9,color:#fff
    style UDONE fill:#27AE60,color:#fff
    style UCANCEL fill:#9B9B9B,color:#fff
```

### Chi tiết từng bước

| Mã | Người thực hiện | Nội dung |
|----|----------------|---------|
| U1 | Developer (VNR) | Chuẩn bị: version build, danh sách service, DB migration script, phạm vi ảnh hưởng, rollback plan |
| U2 | Leader Dev (VNR) | Review code changes, xác nhận phạm vi không vượt scope. OK → tiếp tục, NOK → Cancel |
| U3 | QTUD (Khách hàng) | Kiểm tra đầy đủ thông tin deploy. Nếu thiếu → yêu cầu Developer làm rõ |
| U4 | QTUD (Khách hàng) | Security Scan image → deploy lên UAT cluster (`kubectl apply`) → xác nhận service running |
| U5a | — | Deploy lỗi → Cancel, báo VNR |
| U5b | Tester (Khách hàng) | Functional test + Regression test |
| U6a | — | Pass → ✅ Done |
| U6b | — | Fail → trả Developer fix, lặp lại từ U1 |

**Checklist Developer gửi QTUD (UAT)**:
- [ ] Version build (vd: `v80.1.0`)
- [ ] Danh sách service cần cập nhật
- [ ] DB migration script (nếu có)
- [ ] Phạm vi ảnh hưởng
- [ ] Rollback plan

---

## Luồng 2 — Cập nhật lên Production

### Các bên tham gia

| Vai trò | Đơn vị |
|---------|--------|
| Developer | VNR |
| PO / PM | VNR hoặc Khách hàng |
| QTUD | Khách hàng |
| Tester | Khách hàng |

### Sơ đồ

```mermaid
flowchart TD
    P1["[P1] Developer chuẩn bị đầy đủ\nversion · image · DB script · rollback plan"]
    P2["[P2] PO/PM phê duyệt triển khai"]
    PC1{"Đồng ý?"}
    P3["[P3] QTUD kiểm tra thông tin"]
    PC2{"Đủ thông tin?"}
    PX["Làm rõ với Developer"]
    P4["[P4] QTUD deploy lên Production\nkubectl apply · DB script · clear cache"]
    P5["[P5] Phối hợp DBA / hạ tầng nếu cần"]
    PC3{"Deploy OK?"}
    P6b["[P6b] Tester smoke test\nlogin · version · chức năng chính"]
    PC4{"Pass?"}
    P7b["[P7b] Review tổng thể\nlog · hiệu năng · stability"]
    PC5{"Ổn định?"}
    PDONE["[P8a] ✅ Hoàn tất\nThông báo các bên"]
    PRB["[P7a] Rollback\nkubectl rollout undo"]
    PHF["[P8b] Hotfix khẩn cấp"]
    PCANCEL["[P6a] ❌ Cancel"]

    P1 --> P2 --> PC1
    PC1 -- Không --> PCANCEL
    PC1 -- Đồng ý --> P3 --> PC2
    PC2 -- Chưa đủ --> PX --> P3
    PC2 -- Đủ --> P4 --> P5 --> PC3
    PC3 -- Lỗi --> PCANCEL
    PC3 -- OK --> P6b --> PC4
    PC4 -- Fail --> PRB
    PC4 -- Pass --> P7b --> PC5
    PC5 -- Ổn định --> PDONE
    PC5 -- Có vấn đề --> PRB --> PHF

    style P4 fill:#4A90D9,color:#fff
    style PDONE fill:#27AE60,color:#fff
    style PRB fill:#E86B5A,color:#fff
    style PHF fill:#E86B5A,color:#fff
    style PCANCEL fill:#9B9B9B,color:#fff
```

### Chi tiết từng bước

| Mã | Người thực hiện | Nội dung |
|----|----------------|---------|
| P1 | Developer (VNR) | Chuẩn bị đầy đủ: version, danh sách service, DB migration script, hướng dẫn deploy, rollback plan |
| P2 | PO/PM | Xác nhận đúng kế hoạch release, không ngoài phạm vi. OK → tiếp, NOK → Cancel |
| P3 | QTUD (Khách hàng) | Kiểm tra checklist deploy, yêu cầu làm rõ nếu thiếu thông tin |
| P4 | QTUD (Khách hàng) | Deploy: `kubectl apply`, chạy DB script, restart service, clear Redis cache, update ConfigMap/Secret |
| P5 | QTUD + DBA | Phối hợp DBA / hạ tầng nếu có thay đổi DB hoặc infra |
| P6a | — | Deploy lỗi → Cancel |
| P6b | Tester (Khách hàng) | Smoke test: đăng nhập Main site, đăng nhập Portal, version đúng, chức năng chính |
| P7a | — | Fail → **Rollback** (`kubectl rollout undo`) |
| P7b | Leader Dev + PO | Pass → Review log, hiệu năng, xác nhận với nghiệp vụ |
| P8a | — | Ổn định → ✅ Hoàn tất, thông báo team + khách hàng |
| P8b | — | Có vấn đề → Rollback + Hotfix khẩn cấp |

**Smoke test checklist (Production)**:
- [ ] Đăng nhập Main site thành công
- [ ] Đăng nhập Employee Portal thành công
- [ ] Version hiển thị đúng
- [ ] Kiểm tra chức năng chính của bản release

---

## Config & Secret trên K8s

| Thành phần | Giải pháp | Trách nhiệm |
|------------|-----------|------------|
| Cấu hình ứng dụng | K8s **ConfigMap** | Khách hàng |
| Mật khẩu / credentials | K8s **Secret** | Khách hàng |
| Quản lý secret tập trung | **HashiCorp Vault** | Khách hàng |

> ⚠️ **VNR cần**: Source code đọc config từ ConfigMap/Secret — **không hardcode trong `appsettings.json`**.

---

## Điểm rủi ro

| Rủi ro | Tác động | Phòng tránh |
|--------|---------|------------|
| Image bị reject sau security scan | Delay deploy | VNR tuân thủ security baseline của khách hàng từ sớm |
| DB migration lỗi | Rollback toàn bộ | Test script trên UAT trước, chuẩn bị rollback script |
| Service CrashLoop sau deploy | Production downtime | Smoke test UAT kỹ trước khi lên PRD |
| ConfigMap/Secret chưa update | App lỗi config | Khách hàng chuẩn bị trước, VNR confirm key names |
| Rollback không thành công | Cần hotfix khẩn | Luôn có hotfix plan sẵn sàng |

---

## Liên kết

- [[wiki/sources/k8d2p-flow-capnhat-k8s-hrm]] — Tài liệu nguồn
- [[wiki/architecture/HRM-Deployment-Architecture]] — Kiến trúc deploy IIS + K8s
- [[wiki/flows/Flow-Deploy-HRM]] — Quy trình deploy HRM (bao gồm IIS warmup)
- [[wiki/concepts/HRM-Deploy-Checklist]] — Checklist deploy server mới
