---
type: architecture
tags:
  - ssi
  - kien-truc
  - system
created: 2026-05-13
updated: 2026-05-13
description: "Kiến trúc giải pháp VnResource HRM Pro cho SSI: multi-tier SOA, 4 sub-architecture, tech stack, HA/DR, integration"
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/architecture/SaaS-MultiTenant-Architecture]]"
---

# Architecture — SSI Kiến trúc Giải pháp VnResource HRM Pro

> **Loại**: System + Integration + Infrastructure
> **Mô tả**: Kiến trúc tổng thể đề xuất trong hồ sơ thầu SSI — Chương 8 + 10; bao gồm 4 sub-architecture: Application, System, Integration, Database

---

## Sơ đồ — Application Architecture (4 tầng)

```mermaid
flowchart TB
    subgraph Presentation["Presentation Layer"]
        W["Web MVC (Angular 19)"]
        P["Employee Portal"]
        M["Mobile API"]
        WS["Web Services"]
    end
    subgraph Business["Business Layer"]
        HRE["Nhân sự (HRE)"]
        SAL["Lương (SAL)"]
        ATT["Chấm công (ATT)"]
        INS["Bảo hiểm (INS)"]
        REC["Tuyển dụng"]
        TRN["Đào tạo / KPI"]
    end
    subgraph Data["Data Layer"]
        REPO["Repository Pattern"]
        EF["Entity Framework"]
    end
    subgraph Infra["Infrastructure Layer"]
        SEC["Security / Auth"]
        LOG["Logging / Middleware"]
        CACHE["Redis Cache"]
        FS["File Storage"]
    end
    Presentation --> Business
    Business --> Data
    Business --> Infra
    Data --> Infra
```

---

## Sơ đồ — System Architecture (Production)

```mermaid
flowchart TB
    subgraph Client["Client Layer"]
        U["User (Web/Mobile) — HTTPS/TLS"]
    end
    subgraph DMZ["DMZ Zone"]
        WAF["WAF (OWASP rules)"]
        LB["Nginx / HAProxy\nLoad Balancer\nRound Robin + Health Check"]
    end
    subgraph App["Application Layer (Internal)"]
        APP1["App Server 1\nWindows 2019\n16 cores / 64GB"]
        APP2["App Server 2\nWindows 2019\n16 cores / 64GB"]
    end
    subgraph Data["Data Layer"]
        DB1[("SQL Server 2019\nActive\n16 cores / 128GB")]
        DB2[("SQL Server 2019\nPassive (Failover)\n16 cores / 128GB")]
        REDIS["Redis Sentinel\n(session, cache, token)"]
        NFS["File Server (NFS)\nShared storage"]
    end
    subgraph DR["DR Site"]
        DRDB[("Backup DB\nFull + Incremental")]
    end
    Client --> WAF --> LB
    LB --> APP1
    LB --> APP2
    APP1 --> DB1
    APP2 --> DB1
    DB1 -->|"AlwaysOn / Log Shipping"| DB2
    DB1 -->|"Backup định kỳ"| DRDB
    APP1 --> REDIS
    APP2 --> REDIS
    APP1 --> NFS
    APP2 --> NFS
```

---

## Sơ đồ — Integration Architecture

```mermaid
flowchart LR
    subgraph External["Hệ thống ngoài SSI"]
        ERP["ERP"]
        BHXH["BHXH / TS24"]
        MISA["MISA"]
        MOBILE["Mobile App"]
        DP["Data Platform / MDM"]
        SSISYS["SSI Internal System\n(chứng từ kế toán)"]
    end
    subgraph Integration["Integration Service Layer"]
        GW["API Gateway (Ocelot)\nOAuth2 / JWT / API Key\nRate Limiting / IP Whitelist"]
        ISL["Integration Service\nRetry / Idempotent\nCorrelationId / AuditLog"]
    end
    subgraph Core["Core HRM"]
        HRM["VnResource HRM\n(Business Logic)"]
    end
    External -->|"REST / SOAP / File / CDC"| GW
    GW --> ISL --> HRM
    HRM --> ISL --> GW
    GW --> External
```

---

## Thành phần công nghệ

| Component | Công nghệ | Ghi chú |
|-----------|-----------|---------|
| Frontend | Angular 19 | Responsive, multi-browser |
| Backend | .NET 8 / ASP.NET Core | RESTful API, stateless |
| Legacy | .NET Framework 4.6.2 / ASP.NET MVC | HRM Main hiện tại |
| Database | SQL Server 2019 Standard+ | Active/Passive HA |
| Cache | Redis Sentinel | Session, token, lookup, config |
| API Gateway | Ocelot | Routing, LB, auth, logging |
| Auth | OAuth2 / OpenID Connect | SSO Azure AD, MFA |
| Load Balancer | Nginx / HAProxy | Round Robin, health check |
| WAF | WAF (OWASP rules) | XSS, SQLi, CSRF protection |
| Container | Docker / Kubernetes | Scale-out, rolling deploy |
| Monitoring | Prometheus + Grafana | Metrics, alerting |
| Logging | ELK / Graylog | Centralized, correlationId |
| Tracing | OpenTelemetry / Jaeger | Distributed tracing |
| CI/CD | Pipeline (SAST + Deploy) | DEV → UAT → PROD |
| File Storage | NFS + S3/Object Storage | Shared + long-term backup |

---

## URL Routing (Multi-tenant)

```
HRM Main:        https://{tenant}-main.vnrlocal.com/
Employee Portal: https://{tenant}-portal.vnrlocal.com/
HR Service:      https://{tenant}-hr.vnrlocal.com/
System Service:  https://{tenant}-sys.vnrlocal.com/
```

---

## Kết nối / Integration

- SSO: Azure AD / Microsoft Entra ID (OpenID Connect)
- Integration methods: REST API, SOAP/Web Service, File Exchange (CSV/JSON), CDC
- Dữ liệu đồng bộ: nhân viên, chấm công, lương, BH, KPI, master data
- Security: OAuth2 / JWT / API Key + Scope, IP Whitelist, Rate Limiting

---

## HA / DR specs

| Item | Spec |
|------|------|
| Availability target | 99.99% |
| DB HA | AlwaysOn AG hoặc Log Shipping/Mirroring |
| App HA | 2 node Active/Active, stateless, session trên Redis |
| Failover | LB health check → tự động route sang node còn lại |
| Backup | Full + Incremental, mã hóa at-rest |
| DR drill | Định kỳ, có bằng chứng |
| RTO/RPO | Được định nghĩa tại Ch.7.3 và Ch.7.4 |

---

## Liên kết

- [[wiki/projects/SSI-Project]] — Project page
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Hồ sơ thầu tổng thể
- [[wiki/sources/f8c4n-ssi-infrastructure-requirements]] — Hardware specs chi tiết
- [[wiki/sources/v7m2p-ssi-devops-requirements]] — CI/CD, DR, Monitoring
- [[wiki/architecture/HRM-System-Architecture]] — Kiến trúc HRM hiện tại
- [[wiki/architecture/SaaS-MultiTenant-Architecture]] — Multi-tenant K8s
- [[wiki/architecture/p9k2w-k8s-hrm-service-architecture]] — K8s service mesh
