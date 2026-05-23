# Plan K8s — WBS AWS Deployment & Automation

**Nguồn:** Plan_K8s.xlsx (Sheet: WBS)
**Thời lượng dự án:** 3–4 tháng | **Tổng effort:** 80 man-days

## Work Breakdown Structure

### 1.0 Proof of Concept (POC) with AWS Cloud — 20 md

#### Project Kick-off and Planning (10 md)
- Define project scope, objectives, and success criteria
- Define migrate strategy (rehost, replatform,...)
- Define project standards (coding, infrastructure,...)

#### Incremental Development and Validation (10 md)
- Build infrastructure templates
- Build CI/CD flow templates

---

### 2.0 Infrastructure — 20 md

#### Essential module (10 md)
- Develop Terraform essential module: **Network, K8s cluster**
- Develop Terraform load balancer module
- Develop Terraform storage module

#### Component module (10 md)
- Develop Terraform security module: Firewall, Certificate
- Develop Terraform IAM module: User, Group, Policy, Role,...

---

### 3.0 Refinement — 20 md

#### Microservices Deployment (15 md)
- Containerize for microservices
- **HelmChart deployment**
- Test container deployment and scaling

#### Domain (5 md)
- Set up global custom domain routing
- Configure location-based routing
- Test global routing

---

### 4.0 Monitoring/Logging & Handover — 20 md

#### Microservices Monitoring (10 md)
- **Agent** *(Requirement: Docker, docker-compose)*
  - Uptime, Node metrics: Blackbox, NodeExporter
- **Centralize** *(Requirement: Docker, docker-compose)*
  - Monitoring: Prometheus
  - Dashboard: Grafana
  - Alert: Alert Manager

#### Microservices Logging (5 md)

#### AWS
- AWS monitoring deployment
- AWS logging deployment

---

**Tổng:** 80 man-days | Timeline: W1–W16 (16 tuần)
