---
type: flow
domain: devops
tags:
  - k8s
  - deploy
  -  CircleK
  - cicd
created: 2026-05-06
updated: 2026-05-06
description: Quy trình cập nhật ứng dụng HRM lên môi trường Kubernetes (UAT & Production) — phân chia trách nhiệm VNR và  CircleK.
related:
  - "[[Flow-trien-khai-he-thong]]"
  - "[[Flow-Golive]]"
  - "[[Flow-UAT]]"
---

# Quy Trình Cập Nhật Ứng Dụng HRM Lên Kubernetes ( CircleK)

> **Loại**: Integration Flow — CI/CD
> **Trigger**: Có bản build mới cần cập nhật lên UAT hoặc Production
> **Phân hệ liên quan**: Tất cả service HRM (Main, Portal, Hr.Service, HrmSystem.Service, Identity, Api, Chat)

---

## 1. Tổng quan

Hệ thống HRM triển khai trên hạ tầng Kubernetes của  CircleK. Quy trình cập nhật được tách thành 2 giai đoạn rõ ràng:

| Giai đoạn | Đơn vị thực hiện | Mô tả |
|-----------|-----------------|-------|
| **CI** — Build & Push image | **VNR** | Build Docker image, đóng gói, push lên storage |
| **CD** — Deploy lên K8s | ** CircleK** | Nhận image, scan bảo mật, deploy lên cluster |

> ⚠️ VNR **không có quyền** trực tiếp thao tác trên K8s cluster của  CircleK.

---

## 2. Môi trường

| Môi trường | Quản lý | Mục đích |
|-----------|---------|---------|
| DEV | VNR | Phát triển nội bộ |
| TEST | VNR | Kiểm thử nội bộ |
| UAT |  CircleK cung cấp | Kiểm thử nghiệm thu |
| Production |  CircleK vận hành | Hệ thống thực tế |

---

## 3. Luồng CI/CD Tổng Thể

```mermaid
flowchart TD
    A[Developer commit code lên Git]
    B[VNR CI Pipeline — Build Docker Image]
    C[Push Image →  CircleK Storage / Registry]
    D[ CircleK Security Scan vulnerability · malware · compliance]
    E{Scan OK?}
    F[ CircleK CD Pipeline — Deploy lên K8s]
    G[Monitor Pod Health kubectl get pods]
    H{Pods Running?}
    I[Kiểm tra routing / config]
    J[Warmup & Smoke Test]
    K[✅ Hoàn tất]
    FAIL[❌ Rollback kubectl rollout undo]

    A --> B --> C --> D --> E
    E -- NOK --> FAIL
    E -- OK --> F --> G --> H
    H -- CrashLoop / Error --> FAIL
    H -- All Running --> I --> J --> K

    style B fill:#4A90D9,color:#fff
    style D fill:#E8A838,color:#fff
    style F fill:#4A90D9,color:#fff
    style K fill:#27AE60,color:#fff
    style FAIL fill:#E86B5A,color:#fff
```

---

## 4. Quy Trình Cập Nhật Lên UAT

### Các bên tham gia
| Vai trò | Đơn vị |
|---------|--------|
| DEV | VNR |
| Leader Dev | VNR |
| QTUD (Quản trị ứng dụng) |  CircleK |
| Tester |  CircleK |

### Luồng

```mermaid
flowchart TD
    A[DEV — Gửi yêu cầu cập nhật UAT]
    B[Leader Dev — Review code & phạm vi ảnh hưởng]
    C{Phê duyệt?}
    D[QTUD — Kiểm tra thông tin yêu cầu version · file · DB script · rollback plan]
    E{Thông tin đủ?}
    F[Trao đổi làm rõ với DEV]
    G[QTUD — Thực hiện Deploy UAT]
    H[QTUD — Kiểm tra sau deploy]
    I{Deploy OK?}
    J[Tester — Test chức năng trên UAT]
    K{Pass?}
    DONE[✅ Kết thúc]
    CANCEL[❌ Cancel]
    FIX[Trả lại DEV fix]

    A --> B --> C
    C -- NOK --> CANCEL
    C -- OK --> D --> E
    E -- NOK --> F --> D
    E -- OK --> G --> H --> I
    I -- NOK --> CANCEL
    I -- OK --> J --> K
    K -- Pass --> DONE
    K -- Fail --> FIX

    style G fill:#4A90D9,color:#fff
    style DONE fill:#27AE60,color:#fff
    style CANCEL fill:#E86B5A,color:#fff
```

### Chi tiết từng bước

#### Bước 1 — DEV chuẩn bị yêu cầu
**Người thực hiện**: Developer (VNR)

- Đảm bảo code đã merge đầy đủ
- Chuẩn bị thông tin gửi QTUD:
  - [ ] Version build (vd: ` CircleK_v80.1.0`)
  - [ ] Danh sách service cần cập nhật
  - [ ] DB migration script (nếu có)
  - [ ] Phạm vi ảnh hưởng
  - [ ] Rollback plan

#### Bước 2 — Leader Dev Review
**Người thực hiện**: Leader Dev (VNR)

- Review code changes
- Xác nhận phạm vi không vượt scope
- **OK** → Chuyển QTUD | **NOK** → Cancel

#### Bước 3 — QTUD Kiểm tra & Deploy
**Người thực hiện**: QTUD ( CircleK)

- Kiểm tra đầy đủ thông tin deploy
- Thực hiện deploy lên UAT cluster
- Phối hợp DBA / hạ tầng nếu cần
- Xác nhận service running

#### Bước 4 — Tester Kiểm thử
**Người thực hiện**: Tester ( CircleK)

- Functional test
- Regression test
- **Pass** → Done | **Fail** → Trả DEV fix

---

## 5. Quy Trình Cập Nhật Lên Production (Go-live)

### Các bên tham gia
| Vai trò | Đơn vị |
|---------|--------|
| DEV | VNR |
| PO / PM | VNR hoặc  CircleK |
| QTUD |  CircleK |
| Tester |  CircleK |

### Luồng

```mermaid
flowchart TD
    A[DEV — Kiểm tra thay đổi code · version · DB script · phạm vi]
    B[PO/PM — Phê duyệt triển khai]
    C{Phê duyệt?}
    D[QTUD — Kiểm tra thông tin yêu cầu]
    E{Thông tin đủ?}
    F[Trao đổi làm rõ]
    G[QTUD — Thực hiện Deploy Production web · API · DB · restart · clear cache · config]
    H[QTUD — Phối hợp bộ phận khác nếu cần DBA · Hạ tầng · Network · Security]
    I[QTUD — Kiểm tra kết quả deploy]
    J{Deploy OK?}
    K[Tester — Smoke Test Production]
    L{Pass?}
    M[Review — Log · Hiệu năng · Nghiệp vụ]
    N{Review OK?}
    DONE[✅ Kết thúc — Thông báo team]
    RB[Rollback]
    HF[Hotfix khẩn cấp]
    CANCEL[❌ Cancel]

    A --> B --> C
    C -- NOK --> CANCEL
    C -- OK --> D --> E
    E -- NOK --> F --> D
    E -- OK --> G --> H --> I --> J
    J -- NOK --> CANCEL
    J -- OK --> K --> L
    L -- Fail --> RB
    L -- Pass --> M --> N
    N -- OK --> DONE
    N -- NOK --> RB --> HF

    style G fill:#4A90D9,color:#fff
    style DONE fill:#27AE60,color:#fff
    style RB fill:#E86B5A,color:#fff
    style HF fill:#E86B5A,color:#fff
    style CANCEL fill:#9B9B9B,color:#fff
```

### Chi tiết từng bước

#### Bước 1 — DEV chuẩn bị
**Người thực hiện**: Developer (VNR)

- [ ] Version build chính xác
- [ ] Danh sách service cập nhật
- [ ] DB migration script
- [ ] Hướng dẫn deploy
- [ ] Rollback plan cụ thể

#### Bước 2 — PO/PM Phê duyệt
**Người thực hiện**: PO / PM

- Xác nhận đúng kế hoạch release
- Xác nhận không ngoài phạm vi
- **OK** → Tiếp tục | **NOK** → Cancel

#### Bước 3 — QTUD Kiểm tra thông tin
**Người thực hiện**: QTUD ( CircleK)

- Kiểm tra đầy đủ checklist deploy
- Yêu cầu làm rõ nếu thiếu thông tin

#### Bước 4 — QTUD Deploy Production
**Người thực hiện**: QTUD ( CircleK)

Các thao tác có thể bao gồm:
- Deploy web / API service mới
- Chạy DB migration script
- Restart service
- Clear Redis cache
- Update ConfigMap / Secret K8s

#### Bước 5 — Tester Smoke Test
**Người thực hiện**: Tester ( CircleK)

- [ ] Đăng nhập Main site
- [ ] Đăng nhập Employee Portal
- [ ] Version hiển thị đúng
- [ ] Kiểm tra chức năng chính của bản release

#### Bước 6 — Review & Xác nhận
**Người thực hiện**: Leader Dev + PO

- Kiểm tra application log
- Kiểm tra hiệu năng
- Xác nhận với nghiệp vụ
- **OK** → Thông báo hoàn tất | **NOK** → Rollback

---

## 6. Config & Secret trên K8s

| Thành phần | Giải pháp | Trách nhiệm chuẩn bị |
|------------|-----------|---------------------|
| Cấu hình ứng dụng | K8s **ConfigMap** |  CircleK |
| Mật khẩu / credentials | K8s **Secret** |  CircleK |
| Quản lý secret tập trung | **HashiCorp Vault** |  CircleK |

> ⚠️ **VNR cần**: Cập nhật source code để đọc config từ ConfigMap/Secret thay vì hardcode trong `appsettings.json`

---

## 7. So sánh UAT vs Production

| Tiêu chí | UAT | Production |
|----------|-----|-----------|
| Người phê duyệt | Leader Dev | **PO/PM** |
| Review sau deploy | Không bắt buộc | **Bắt buộc** |
| Rollback | Ít dùng | **Bắt buộc có plan** |
| Hotfix | Không | **Có** |
| Thông báo sau deploy | Nội bộ | **Team + Khách hàng** |

---

## 8. Điểm rủi ro

| Rủi ro | Tác động | Phòng tránh |
|--------|---------|------------|
| Image bị reject sau security scan | Delay deploy | VNR cần tuân thủ security baseline  CircleK yêu cầu |
| DB migration lỗi | Rollback toàn bộ | Test script trên UAT trước, có rollback script |
| Service CrashLoop sau deploy | Production downtime | Smoke test UAT kỹ trước khi lên PRD |
| ConfigMap/Secret chưa được update | App lỗi config |  CircleK chuẩn bị trước khi deploy, VNR confirm key names |
| Rollback không thành công | Cần hotfix khẩn | Luôn có hotfix plan sẵn sàng |

---

## 9. Liên kết

- [[Flow-trien-khai-he-thong]] — Kiến trúc CI/CD tổng thể VNR– CircleK
- [[Flow-UAT]] — Quy trình cập nhật lên UAT chi tiết
- [[Flow-Golive]] — Quy trình cập nhật lên LIVE chi tiết
- [[Lịch sử cập nhật build]] — Lịch sử các version đã deploy
