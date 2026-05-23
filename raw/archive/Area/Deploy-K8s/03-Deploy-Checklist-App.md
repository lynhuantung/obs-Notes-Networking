---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - devops
  - checklist
  - logging
  - metrics
  - security
created: 2026-05-07
updated: 2026-05-07
description: Checklist tiêu chuẩn ứng dụng K8s — log stdout, TraceID, Prometheus, image security, autoscale
source-file: Architecture_Metrics_Security_Overview.md
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[02-Deploy-Scenario]]"
  - "[[08-Deploy-ServiceInfo]]"
  - "[[09-Deploy-Network]]"
---

# Deploy Checklist — Tiêu chuẩn Ứng dụng K8s

> Danh sách tiêu chuẩn KH yêu cầu trước khi deploy lên K8s/OCP.  
> Gồm 2 phần: (I) Tiêu chuẩn chung và (II) Tiêu chuẩn K8s.  
> Trạng thái hiện tại phần lớn **Chưa sẵn sàng** — VNR cần hoàn thiện trước go-live.

---

## I. Tiêu chuẩn chung

### 1. Cấu hình ENV / File Config

| Hạng mục | Yêu cầu | Trạng thái | Ghi chú |
|---------|---------|------------|---------|
| Không đóng config trong image | Config không được hardcode trong Dockerfile hay embed vào artifact | ⚠️ Chưa sẵn sàng | Hiện tại config đang nằm trong file JSON trên từng service |
| Promote image UAT → PROD | Bản build UAT chính là bản PROD, chỉ thay env | ⚠️ Chưa sẵn sàng | Cần refactor đọc config từ env var / ConfigMap |
| K8s ConfigMap | Cấu hình ứng dụng đọc từ ConfigMap | ⚠️ Chưa sẵn sàng | KH chuẩn bị, VNR update source code |
| K8s Secret / Vault | Credentials đọc từ Secret hoặc HashiCorp Vault | ⚠️ Chưa sẵn sàng | KH chuẩn bị Vault, VNR inject vào app |

**Action items VNR:**
- [ ] Rà soát toàn bộ `appsettings.json` / `appsettings.Production.json`
- [ ] Chuyển connection string, API key, secret → đọc từ `Environment Variables`
- [ ] Liệt kê danh sách secret cần inject: DB password, Redis password, S3 key, SSO secret...

---

### 2. Log ứng dụng

| Hạng mục | Yêu cầu | Trạng thái | Ghi chú |
|---------|---------|------------|---------|
| TraceID / RequestID | Mỗi request có 1 TraceID duy nhất xuyên suốt các service | ⚠️ Chưa sẵn sàng | Đã có RequestID, chưa có TraceID lan truyền giữa services |
| stdout (K8s) | Log phải ghi ra Console / stdout (không ghi file trong K8s) | ⚠️ Chưa sẵn sàng | Hiện tại đang ghi file. K8s collect stdout qua Promtail |
| Log file (VM) | Môi trường VM vẫn ghi file như cũ | ✅ Sẵn sàng | — |
| Log request/response | Ghi log mỗi khi nhận/phản hồi request + timeout/exception + error code | ⚠️ Chưa sẵn sàng | Đã có Log Request view, cần chuẩn format |
| Format Grafana | Log dạng JSON / structured để Promtail → Loki → Grafana đọc được | ⚠️ Chưa sẵn sàng | Cần thêm structured logging (Serilog JSON sink) |

**Luồng log K8s:**
```
Application stdout
    ↓
Promtail (DaemonSet trên node)
    ↓
Loki (log aggregation)
    ↓
Grafana (dashboard + query)
```

**Action items VNR:**
- [ ] Bật stdout logging cho môi trường K8s (env var điều khiển)
- [ ] Triển khai distributed tracing: thêm `TraceId` vào header `X-Trace-Id`, lan truyền giữa services
- [ ] Thêm Serilog JSON formatter cho structured log
- [ ] Log format tối thiểu: `timestamp`, `level`, `traceId`, `requestId`, `service`, `method`, `url`, `statusCode`, `duration`

---

### 3. Expose Metrics (Prometheus)

| Hạng mục | Yêu cầu | Trạng thái | Ghi chú |
|---------|---------|------------|---------|
| Endpoint /metrics | Mỗi service expose `/metrics` trên port **9090** (internal only) | ⚠️ Chưa sẵn sàng | Cần tích hợp `prometheus-net` hoặc `OpenTelemetry` |
| Metrics cơ bản | `http_requests_total`, `http_request_duration_seconds`, `db_connection_pool_*` | ⚠️ Chưa sẵn sàng | — |
| Bảo mật metrics | Port 9090 chỉ mở trong **Internal Network** — không public Internet | ✅ Thiết kế đúng | Theo kiến trúc: Public Zone (port 8080) / Internal (port 9090) |

**Kiến trúc metrics (theo tài liệu KH):**
```
Internet
  ↓ (chặn port 9090)
API Gateway
  ↓ (port 8080 — nghiệp vụ)
HRM Application

Internal Network:
Prometheus → pull /metrics:9090 từ từng service
    ↓
Grafana → dashboard
```

**Metrics cần expose:**
```
# HTTP
http_requests_total{method, endpoint, status}
http_request_duration_seconds{quantile}

# Database
db_connections_active
db_connections_idle
db_query_duration_seconds

# Custom
hrm_active_users
hrm_pending_jobs (windows-servicecore)
```

**Action items VNR:**
- [ ] Tích hợp `prometheus-net` vào ASP.NET Core middleware
- [ ] Expose endpoint `/metrics` trên port 9090 (cấu hình qua env var)
- [ ] Tạo ServiceMonitor YAML cho Prometheus scrape

---

### 4. Giám sát ứng dụng

| Tool | Hạng mục giám sát | Trạng thái |
|------|------------------|------------|
| **Nagios** | Pod status (Crash/Running) qua K8s API | ⚠️ KH setup |
| **Nagios** | Database connectivity | ⚠️ KH setup |
| **Nagios** | Redis connectivity | ⚠️ KH setup |
| **Nagios** | CPU, MEM, PVC, HDD per node | ⚠️ KH setup |
| **Nagios** | URL health check (Ingress endpoint) | ⚠️ KH setup |
| **Grafana + Prometheus** | Request TPS | ⚠️ Sau khi VNR expose metrics |
| **Grafana + Prometheus** | Total connections | ⚠️ Sau khi VNR expose metrics |
| **Grafana + Prometheus** | Response time (P50, P95, P99) | ⚠️ Sau khi VNR expose metrics |
| **Loki + Grafana** | Log aggregation + search | ⚠️ Sau khi VNR bật stdout log |

---

## II. Tiêu chuẩn Kubernetes

### 1. Image Base

| Hạng mục | Yêu cầu | Trạng thái | Ghi chú |
|---------|---------|------------|---------|
| Official Image | Sử dụng image base từ Docker Hub Official | ⚠️ Chưa sẵn sàng | — |
| Alpine / slim | Dùng `mcr.microsoft.com/dotnet/aspnet:8.0-alpine` để giảm size | ⚠️ Chưa sẵn sàng | Đang dùng full image |
| Multi-stage build | Tách build stage và runtime stage trong Dockerfile | ⚠️ Chưa sẵn sàng | Đã có plan, cần implement |

**Dockerfile pattern (Multi-stage .NET 8):**
```dockerfile
# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final
WORKDIR /app
COPY --from=build /app .
USER app  # non-root
ENTRYPOINT ["dotnet", "HRM.Service.dll"]
```

---

### 2. Non-root

| Hạng mục | Yêu cầu | Trạng thái |
|---------|---------|------------|
| Chạy bằng user non-root | Không chạy process trong container với UID 0 | ⚠️ Chưa sẵn sàng |
| SecurityContext | Set `runAsNonRoot: true` trong Pod spec | ⚠️ Chưa sẵn sàng |

---

### 3. Healthcheck

| Hạng mục | Yêu cầu | Trạng thái |
|---------|---------|------------|
| Liveness probe | K8s restart pod khi unhealthy | ⬜ Cần kiểm tra |
| Readiness probe | K8s không route traffic khi chưa sẵn sàng | ⬜ Cần kiểm tra |

**K8s probe config mẫu:**
```yaml
livenessProbe:
  httpGet:
    path: /health/live
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 10
readinessProbe:
  httpGet:
    path: /health/ready
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 5
```

---

### 4. Resource Requests & Limits

> Chi tiết sizing xem: [[05-Deploy-Sizing-PROD]] và [[06-Deploy-Sizing-Loadtest]]

| Hạng mục | Yêu cầu | Trạng thái |
|---------|---------|------------|
| CPU Request | Khai báo trong Deployment spec | ⚠️ Chưa sẵn sàng |
| CPU Limit | Khai báo trong Deployment spec | ⚠️ Chưa sẵn sàng |
| Memory Request | Khai báo trong Deployment spec | ⚠️ Chưa sẵn sàng |
| Memory Limit | Khai báo trong Deployment spec | ⚠️ Chưa sẵn sàng |

---

### 5. Autoscale (HPA)

| Hạng mục | Yêu cầu | Trạng thái |
|---------|---------|------------|
| HorizontalPodAutoscaler | Scale theo CPU hoặc MEM | ⚠️ Chưa sẵn sàng |
| Min replicas | Đặt min để tránh downtime | ⚠️ Chưa sẵn sàng |
| Max replicas | Đặt max để tránh resource starvation | ⚠️ Chưa sẵn sàng |

**HPA config mẫu:**
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
spec:
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
```

---

### 6. Secrets Management

| Hạng mục | Yêu cầu | Owner | Trạng thái |
|---------|---------|-------|------------|
| HashiCorp Vault | Central secret store | KH | ❓ Chưa rõ timeline |
| K8s Secret | Fallback nếu chưa có Vault | KH | ⚠️ Chưa sẵn sàng |
| K8s ConfigMap | Non-sensitive config | KH | ⚠️ Chưa sẵn sàng |

---

### 7. Network Policy

> Chi tiết ma trận kết nối: [[09-Deploy-Network]]

| Hạng mục | Yêu cầu | Owner | Trạng thái |
|---------|---------|-------|------------|
| Ingress policy | Chỉ cho phép traffic đúng source → destination | KH | ⚠️ Chưa sẵn sàng |
| Egress policy | Chỉ mở outbound đến các endpoint đã khai báo | KH | ⚠️ Chưa sẵn sàng |
| Namespace isolation | Các namespace không traffic chéo khi không cần | KH | ⚠️ Chưa sẵn sàng |

---

## Tổng kết trạng thái

| Nhóm | Số hạng mục | Sẵn sàng | Chưa sẵn sàng |
|------|------------|---------|---------------|
| Config/ENV | 4 | 0 | 4 |
| Logging | 5 | 1 | 4 |
| Metrics | 3 | 1 | 2 |
| Monitoring | 8 | 0 | 8 |
| Image | 3 | 0 | 3 |
| Security | 2 | 0 | 2 |
| Healthcheck | 2 | 0 | 2 |
| Resource | 4 | 0 | 4 |
| Autoscale | 3 | 0 | 3 |
| Secret | 3 | 0 | 3 |
| Network Policy | 3 | 0 | 3 |

> ⚠️ **Kết luận:** Cần hoàn thiện trước khi go-live PROD. Ưu tiên: Config/ENV → Logging → Metrics → Image security.
