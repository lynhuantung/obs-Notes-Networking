---
type: source
code: v7m2p
description: "Yêu cầu DevOps hồ sơ thầu SSI Chương 7: containerization, CI/CD pipeline, backup/DR, SLO, incident response, monitoring/logging, distributed tracing"
tags:
  - ssi
  - devops
  - cicd
  - monitoring
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
source-file: "raw/0. Daily/TaiLieuGiaiPhap/Thau_SSI/051_7.1.1 ... 083_7.5.6"
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]"
  - "[[wiki/flows/Flow-Deploy-HRM]]"
  - "[[wiki/flows/m3t7x-flow-cicd-deploy-k8s]]"
---

# Source: SSI — Yêu cầu DevOps (Chương 7)

## Tóm tắt

Chương 7 hồ sơ thầu SSI bao gồm toàn bộ yêu cầu về vận hành kỹ thuật, chia thành 5 nhóm: Deployment (7.1), CI/CD (7.2), Backup & Recovery (7.3–7.4), và Monitoring/Observability (7.5). Tổng cộng 33 items. Đây là bộ yêu cầu DevOps enterprise-grade, yêu cầu containerization, pipeline đầy đủ, RTO/RPO rõ ràng, và observability stack hoàn chỉnh.

## Key Takeaways

- **Containerization bắt buộc**: Docker/Kubernetes hoặc tương đương; hỗ trợ auto-scaling, self-healing, rolling deploy
- **IaC**: Nếu deploy cloud → Terraform hoặc tương đương; nếu không container → deploy phải tự động hóa
- **CI/CD pipeline**: Build → **Security Scan (SAST/Dependency)** → Test → Deploy; hỗ trợ DEV/UAT/PROD
- **Approval gate bắt buộc** trước khi deploy Production
- **Deployment strategy**: Rolling / Blue-Green / Canary (3 lựa chọn)
- **Zero downtime deployment** bắt buộc
- **Rollback**: định nghĩa điều kiện + quy trình; hỗ trợ cả application VÀ database schema
- **RTO/RPO** được định nghĩa cho Application, Database, File Storage (cả 7.3 và 7.4)
- **Backup**: Full + Incremental, lịch trình xác định, mã hóa at-rest
- **DR drill định kỳ** với bằng chứng
- **SLO + error budget** được định nghĩa (7.4.5)
- **Monitoring**: availability, latency P95/P99, error rate, resource usage
- **Centralized logging**: log levels chuẩn (Info/Warning/Error/Trace), correlationId trên mọi request
- **Distributed tracing**: OpenTelemetry/Jaeger hoặc tương đương
- SSI IT có quyền truy cập log read-only + giao diện log explorer

## Chi tiết theo nhóm

### 7.1 — Deployment Infrastructure (8 items)

| Mục | Yêu cầu |
|-----|---------|
| 7.1.1 | Containerization: Docker/Kubernetes |
| 7.1.2 | Nếu không container: deploy phải tự động hóa |
| 7.1.3 | Cloud deploy: IaC bằng Terraform hoặc tương đương |
| 7.1.4 | Sơ đồ Logical Architecture cho Production và HA/DR |
| 7.1.5 | Sơ đồ Physical Deployment cho Production và HA/DR |
| 7.1.6 | Định nghĩa sizing tài nguyên: số user dự kiến, TPS, dung lượng dữ liệu |
| 7.1.7 | Architecture phải có: LB + WAF + App/API + DB + Monitoring + Logging |
| 7.1.8 | Cung cấp luồng request end-to-end: User → LB → App → DB → Observability |

### 7.2 — CI/CD Pipeline (8 items)

| Mục | Yêu cầu |
|-----|---------|
| 7.2.1 | Sơ đồ CI/CD pipeline |
| 7.2.2 | Pipeline gồm: **Build → Security Scan (SAST/Dependency) → Test → Deploy** |
| 7.2.3 | Hỗ trợ môi trường DEV / UAT / PROD |
| 7.2.4 | **Approval gate bắt buộc** trước khi deploy Production |
| 7.2.5 | Chiến lược deploy: **Rolling / Blue-Green / Canary** |
| 7.2.6 | **Zero downtime deployment** |
| 7.2.7 | Định nghĩa điều kiện và quy trình rollback |
| 7.2.8 | Rollback cho cả **application VÀ database schema** |

### 7.3 — Backup & Recovery (4 items)

| Mục | Yêu cầu |
|-----|---------|
| 7.3.1 | Định nghĩa **RTO/RPO** cho Application, Database, File Storage |
| 7.3.2 | Full backup + Incremental backup với lịch trình xác định |
| 7.3.3 | Backup mã hóa **at-rest** |
| 7.3.4 | DR drill định kỳ + bằng chứng |

### 7.4 — Reliability & Incident (7 items)

| Mục | Yêu cầu |
|-----|---------|
| 7.4.1 | Định nghĩa RTO/RPO (lặp lại — ưu tiên chi tiết hơn 7.3.1) |
| 7.4.2 | Full + Incremental backup |
| 7.4.3 | Backup mã hóa at-rest |
| 7.4.4 | DR drill định kỳ + bằng chứng |
| 7.4.5 | **Định nghĩa SLO và error budget** |
| 7.4.6 | Quy trình **incident response và escalation** |
| 7.4.7 | Quy trình **postmortem / RCA** |

### 7.5 — Monitoring & Observability (6 items)

| Mục | Yêu cầu |
|-----|---------|
| 7.5.1 | Giám sát: availability, **latency P95/P99**, error rate, resource usage |
| 7.5.2 | Công cụ monitoring + tích hợp **Prometheus/Grafana** |
| 7.5.3 | Centralized logging: log levels chuẩn + **correlation ID** |
| 7.5.4 | Chính sách lưu trữ log: online và archive |
| 7.5.5 | **SSI IT có quyền truy cập log read-only** + giao diện log explorer |
| 7.5.6 | Distributed tracing: **OpenTelemetry/Jaeger** hoặc tương đương |

## Đáp ứng VnResource

```
✅ Docker/Kubernetes: hỗ trợ, VNR build image, KH deploy (theo pattern K8s-HRM)
✅ CI/CD: DEV → TEST → UAT → PROD với pipeline kiểm soát
✅ Monitoring: Prometheus + Grafana + Alerting
✅ Logging: Graylog/ELK, JSON format, correlationId/traceId
✅ Tracing: OpenTelemetry distributed tracing
✅ Backup: Full + log, mã hóa
✅ HA: AlwaysOn/Log Shipping + Redis Sentinel + LB health check
```

## Trích dẫn quan trọng

> Containerization cho phép đóng gói application cùng toàn bộ dependency thành một môi trường chạy độc lập và nhất quán. Kubernetes hỗ trợ quản lý, scaling và tự động phục hồi container trong môi trường production.

> Hệ thống hỗ trợ: Structured logging (JSON format, gắn traceId/correlationId per request); Log levels: Info / Warning / Error / Trace — cấu hình per module/service; Centralized log: Graylog/ELK — tìm kiếm nhanh theo traceId.

## Liên kết

- [[wiki/projects/SSI-Project]] — Project page
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Hồ sơ thầu tổng thể
- [[wiki/flows/m3t7x-flow-cicd-deploy-k8s]] — Flow CI/CD K8s hiện có
- [[wiki/flows/k8d2p-flow-deploy-k8s-hrm]] — Flow deploy K8s HRM
- [[wiki/flows/Flow-Deploy-HRM]] — Flow deploy HRM tổng quát
- [[wiki/sources/t5d8k-hotroaohoa-docker-kubernetes]] — Hỗ trợ ảo hóa Docker/K8s
