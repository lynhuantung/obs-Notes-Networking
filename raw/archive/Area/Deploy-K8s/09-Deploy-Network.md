---
type: source
domain: infrastructure
tags:
  - k8s
  - deploy
  - network
  - traffic-flow
  - firewall
  - network-policy
created: 2026-05-07
updated: 2026-05-07
description: Ma trận kết nối network đầy đủ — internal service mesh và external dependencies
source-file: Tài liệu mô tả luồng gọi API tích hợp.md, Architecture_Metrics_Security_Overview.md
related:
  - "[[00-Deploy-K8s-Index]]"
  - "[[08-Deploy-ServiceInfo]]"
  - "[[03-Deploy-Checklist-App]]"
  - "[[01-Deploy-QnA]]"
---

# Deploy Network — Traffic Flow

> Ma trận kết nối đầy đủ giữa các service HRM.  
> Dùng để: cấu hình **K8s Network Policy**, mở **firewall**, và kiểm soát **outbound traffic**.  
> Nguồn: tài liệu Q&A + API Integration flow + Metrics architecture.

---

## Kiến trúc mạng tổng thể

```
Internet
  │
  ├─→ API Gateway (port 443)
  │       │
  │       └─→ [Public Zone]
  │               ├─ hrm-presentation-empportal   :8080
  │               ├─ hrm-presentation-main        :8080
  │               ├─ integration-service-apicore  :8080  (với IP whitelist)
  │               └─ sc-service-identity          :8080  (SSO endpoint)
  │
  └─→ [Internal Network] (không expose Internet)
          ├─ hrm-presentation-hr-service    :8080 / :9090
          ├─ hrm-presentation-system-service:8080 / :9090
          ├─ hrm-sc-service-apicore         :8080 / :9090
          ├─ presentation-windows-servicecore:8080 / :9090
          ├─ mssql                          :1433
          ├─ redis-sentinel                 :6379 / :26379
          ├─ Prometheus                     → pull :9090 từ services
          └─ Grafana                        → query Prometheus
```

> ⚠️ Port **9090 (metrics) KHÔNG được expose ra Internet** — chỉ Prometheus internal mới access được.

---

## Ma trận kết nối (Service → Destination)

### hrm-presentation-empportal
| Destination                            | Type     | Port | Mục đích               |
| -------------------------------------- | -------- | ---- | ---------------------- |
| mssql                                  | Internal | 1433 | Đọc/ghi dữ liệu        |
| redis                                  | Internal | 6379 | Cache session, data    |
| s3                                     | External | 443  | Upload/download file   |
| hrm-presentation-hr-service            | Internal | 8080 | Nghiệp vụ HR           |
| hrm-presentation-hrmsystem-servicecore | Internal | 8080 | Phân quyền, người dùng |
| hrm-sc-service-apicore                 | Internal | 8080 | API core               |
| hrm-integration-service-apicore        | Internal | 8080 | Tích hợp               |
| hrm-presentation-maincore              | Internal | 8080 | Web main               |
| sc-service-identity                    | Internal | 8080 | Auth token             |

### hrm-presentation-main (HR Admin)
| Destination | Type | Port | Mục đích |
|-------------|------|------|---------|
| mssql | Internal | 1433 | Đọc/ghi dữ liệu |
| redis | Internal | 6379 | Cache |
| s3 | External | 443 | File |
| hrm-presentation-hr-service | Internal | 8080 | Nghiệp vụ |
| hrm-presentation-hrmsystem-servicecore | Internal | 8080 | Phân quyền |
| hrm-sc-service-apicore | Internal | 8080 | API core |
| hrm-integration-service-apicore | Internal | 8080 | Tích hợp |
| hrm-presentation-emportalcore | Internal | 8080 | Shared |
| sc-service-identity | Internal | 8080 | Auth |

### hrm-presentation-hr-service (Service core)
| Destination | Type | Port | Mục đích |
|-------------|------|------|---------|
| mssql | Internal | 1433 | Primary data store |
| redis | Internal | 6379 | Cache |
| s3 | External | 443 | File storage |
| hrm-presentation-hrmsystem-servicecore | Internal | 8080 | Config hệ thống |
| hrm-sc-service-apicore | Internal | 8080 | API layer |
| hrm-integration-service-apicore | Internal | 8080 | External data |
| hrm-presentation-maincore | Internal | 8080 | — |
| hrm-presentation-emportalcore | Internal | 8080 | — |
| sc-service-identity | Internal | 8080 | Auth |

### hrm-sc-service-apicore (API Core)
| Destination | Type | Port | Mục đích |
|-------------|------|------|---------|
| mssql | Internal | 1433 | Data |
| redis | Internal | 6379 | Cache |
| s3 | External | 443 | File |
| Tất cả presentation services | Internal | 8080 | Route requests |
| sc-service-identity | Internal | 8080 | Auth |

### integration-service-apicore
| Destination | Type | Port | Mục đích |
|-------------|------|------|---------|
| mssql | Internal | 1433 | Data |
| redis | Internal | 6379 | Cache |
| s3 | External | 443 | File |
| Tất cả presentation services | Internal | 8080 | Fetch data |
| sc-service-identity | Internal | 8080 | Auth |
| **Third-party systems** | **Inbound** | 443 | Gọi vào từ bên ngoài |

### sc-service-identity
| Destination | Type | Port | Mục đích |
|-------------|------|------|---------|
| mssql | Internal | 1433 | User store, token store |
| redis | Internal | 6379 | Token cache |
| *(Không gọi các service khác)* | — | — | — |

### presentation-windows-servicecore
| Destination        | Type         | Port    | Mục đích      |
| ------------------ | ------------ | ------- | ------------- |
| mssql              | Internal     | 1433    |               |
| redis              | Internal     | 6379    |               |
| s3                 | External     | 443     | File          |
| **smtp.gmail.com** | **External** | **587** | **Gửi email** |
| Tất cả services    | Internal     | 8080    | Trigger jobs  |

---

## External Dependencies

| External Service | Domain / IP | Port | Protocol | Sử dụng bởi | Cần whitelist |
|-----------------|------------|------|----------|------------|--------------|
| S3 Cloud | *(KH cung cấp endpoint)* | 443 | HTTPS | Tất cả trừ identity | ✅ |
| smtp.gmail.com | smtp.gmail.com | 587 | SMTP+TLS | windows-servicecore | ✅ |
| SSO Provider | *(KH cung cấp)* | 443 | HTTPS | identity, presentation | ✅ |
| Chấm công API | *(KH xác nhận)* | *(xác nhận)* | HTTPS | integration-service | ✅ |
| Third-party (Inbound) | *(partner IP)* | 443 | HTTPS | integration-service | ✅ Inbound whitelist |

---

## Luồng tích hợp Third-Party (Inbound)

```
Third-Party System
    │  GET /integrate/v1/... (client_id, secret)
    ↓
Integrate API (integration-service-apicore)
    ├── IP whitelist check → 403 nếu không hợp lệ
    ├── Credential validate (client_id, secret, scope)
    │       └── → 401/403 nếu sai
    ├── Fetch data từ HRM Core
    └── Return 200 JSON
```

---

## Yêu cầu Network Policy K8s

### Ingress rules (traffic vào)
```
hrm-presentation-empportal  ← API Gateway (public)
hrm-presentation-main       ← API Gateway (public)
sc-service-identity         ← API Gateway (SSO)
integration-service-apicore ← Internet (IP whitelist)

Tất cả services :9090 ← Prometheus pod (internal only)
```

### Egress rules (traffic ra)
```
Tất cả services          → mssql:1433
Tất cả services          → redis:6379, :26379
Tất cả trừ identity      → s3:443
windows-servicecore       → smtp.gmail.com:587
integration-service       → 3rd party endpoints:443
Tất cả services          → sc-service-identity:8080
Presentation services    → hr-service, apicore, system-service:8080
```

---

## Checklist mở kết nối (VNR gửi KH)

- [ ] Danh sách IP/domain S3 endpoint
- [ ] Danh sách IP partner inbound cho integration-service
- [ ] Confirm smtp.gmail.com:587 được cho phép outbound
- [ ] SSO endpoint URL
- [ ] Chấm công API endpoint + IP

---

## Ghi chú

- Tham chiếu checklist: [[03-Deploy-Checklist-App]] mục Network Policy
- Outbound list đầy đủ: [[01-Deploy-QnA]] section Traffic Flow
- Service info: [[08-Deploy-ServiceInfo]]
