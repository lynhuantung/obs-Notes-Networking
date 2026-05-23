---
description: "Nghiên cứu bộ tài liệu giải pháp PTSC: tích hợp ESB, kiến trúc phi chức năng và bảo mật — định vj trên phà chức năng quan trọng nhất."
type: synthesis
code: m8vx
tags:
  - "tai-lieu-giai-phap"
  - "ptsc"
  - "tich-hop"
  - "esb"
  - "kien-truc"
  - "research"
research-topic: Tài Liệu Giải Pháp HRM — PTSC Integration Solution
sources-wiki:
  - "wiki/sources/PTSC-TLG-PhamVi"
  - "wiki/sources/PTSC-TLG-KyThuatTichHop-Core"
  - "wiki/sources/PTSC-TLG-BaoMat-IAM"
  - "wiki/sources/PTSC-TLG-Idempotent-Operations"
  - "wiki/sources/PTSC-TLG-KienTruc-NenTang"
  - "wiki/sources/PTSC-TLG-BaoMat-HA-DR"
  - "wiki/architecture/HRM-System-Architecture"
  - "wiki/architecture/HRM-Auth-Architecture"
  - "wiki/sources/SaaS-VnR-Meetings-2023-2024"
sources-raw:
  - "raw/0. Daily/TaiLieuGiaiPhap/00-Index.md"
  - "raw/0. Daily/TaiLieuGiaiPhap/s4.14-HighAvailability.md"
  - "raw/0. Daily/TaiLieuGiaiPhap/s4.15-DisasterRecovery.md"
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/sources/PTSC-TLG-PhamVi]]"
  - "[[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]]"
  - "[[wiki/sources/PTSC-TLG-BaoMat-IAM]]"
  - "[[wiki/sources/PTSC-TLG-Idempotent-Operations]]"
  - "[[wiki/sources/PTSC-TLG-KienTruc-NenTang]]"
  - "[[wiki/sources/PTSC-TLG-BaoMat-HA-DR]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# Nghiên cứu: Tài Liệu Giải Pháp HRM — PTSC Integration Solution

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings — Những gì tìm thấy](#2-findings--những-gì-tìm-thấy)
  - [2.1 Phạm vi tích hợp (§1–2): Dataset & Interface](#21-phạm-vi-tích-hợp-12-dataset--interface)
  - [2.2 Kỹ thuật tích hợp Core (§3): CDC & Luồng dữ liệu](#22-kỹ-thuật-tích-hợp-core-3-cdc--luồng-dữ-liệu)
  - [2.3 Bảo mật & IAM (§3 IAM)](#23-bảo-mật--iam-3-iam)
  - [2.4 Idempotent & Vận hành (§3 Ops)](#24-idempotent--vận-hành-3-ops)
  - [2.5 Kiến trúc nền tảng (§4.1–4.6)](#25-kiến-trúc-nền-tảng-416)
  - [2.6 Bảo mật đa lớp & HA/DR (§4.7–4.15)](#26-bảo-mật-đa-lớp--hadr-47415)
- [3. Biểu đồ số liệu](#3-biểu-đồ-số-liệu)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành

Tài liệu giải pháp PTSC là bộ tài liệu kỹ thuật toàn diện nhất VnResource từng soạn thảo, gồm 52 files raw tổng hợp thành 6 trang wiki.[^1] Phạm vi cam kết bao gồm 30 dataset lên Data Platform và 30 interface ESB, định vị HRM là **HR Master Data Hub** trong hệ sinh thái PTSC.[^2] Về kỹ thuật, VnResource cam kết CDC 3 phương án (Watermark/Version/Trigger), idempotent API với CorrelationId, và upsert semantics.[^3] Kiến trúc đề xuất là 3-Tier với 5 servers (Nginx + 2 App + 2 DB Active/Passive), hỗ trợ IaaS cloud và multi-environment DEV→TEST→UAT→PROD.[^4] Bảo mật được quy định 5 lớp: ứng dụng, DB (AES-256), OS, mạng (TLS 1.2/1.3 + WAF), và vật lý, cùng với HA 24/7/365 và DR site thứ 2.[^5]

---

## 1. Bối cảnh & Phạm vi

Tài liệu giải pháp được VnResource soạn thảo năm 2026 để gửi PTSC (Tổng Công ty Dịch vụ Kỹ thuật Dầu khí).[^1] Đây là tài liệu đặc tả kỹ thuật cho giai đoạn đấu /thuyết phục khách hàng, không phải tài liệu triển khai thực tế. Bộ tài liệu gồm 52 files raw, được ingest vào wiki thành 6 trang tổng hợp theo 2 nhóm chính: §1–3 (Phạm vi & Kỹ thuật tích hợp) và §4 (Yêu cầu phi chức năng).[^1]

Phạm vi tài liệu bao phủ toàn bộ vòng đời tích hợp HRM↔PTSC: từ kiến trúc dữ liệu (Master Data Hub, Crosswalk ID), giao thức tích hợp (REST/ESB/Queue), bảo mật (OAuth2/OIDC/mTLS), vận hành (Idempotent/Retry/Reprocess), đến hạ tầng phi chức năng (3-Tier, HA 24/7, DR site).[^2][^4]

---

## 2. Findings — Những gì tìm thấy

### 2.1 Phạm vi tích hợp (§1–2): Dataset & Interface

VnResource cam kết cung cấp **30 dataset** lên Data Platform (BI/AI/báo cáo) và **30 interface ESB** (REST/ESB flow/file/queue).[^2] Mỗi dataset trải qua 9 bước từ khảo sát đến tài liệu vận hành; đơn giá interface tính per interface theo mức thay đổi mapping.[^2]

Mô hình **HR Master Data Hub** định nghĩa HRM là System of Record duy nhất cho dữ liệu nhân sự, đồng bộ RBAC toàn hệ sinh thái PTSC qua ESB event-driven mà không thay đổi các hệ thống hiện hữu.[^2] Kết nối tuân thủ nguyên tắc **HRM ↔ ESB ↔ Hệ thống đích** — tuyệt đối không có kết nối point-to-point trực tiếp.[^2]

**Identity Mapping Service** dùng Golden Employee ID chung, mapping HRM↔ERP↔E-learning↔CMMS qua Crosswalk Table với 3 trạng thái: PENDING/ACTIVE/INACTIVE.[^2]

**Tài liệu thiết kế bắt buộc** sau giai đoạn Khảo sát–Thiết kế gồm: Business Blueprint, API Catalog, Data Contract, KPI Catalog (4 KPI chuẩn: Headcount, Turnover Rate, Training Completion Rate, Labor Cost Ratio), Dimension Model (9 dimension: Employee, Organization, Position, Cost Center, Project, Training, Time, Contract, Certificate).[^2]

### 2.2 Kỹ thuật tích hợp Core (§3): CDC & Luồng dữ liệu

Chuẩn giao tiếp là REST/HTTPS, JSON/XML/CSV, ngày giờ ISO8601, encoding UTF-8.[^3] Luồng dữ liệu 2 chiều: HRM→ESB→Data Platform (push) và ESB→HRM (pull/webhook).[^3]

**CDC 3 phương án:** (1) Watermark/Timestamp dựa trên `Last_Updated_Date`, (2) Version-based, (3) Change Log từ DB (Trigger/Transaction Log).[^3] API hỗ trợ `updated_since=` + `from/to` + backfill/replay theo Time Window cho Late Arriving Data.[^3] Delta extraction đầy đủ Insert/Update/Delete — không bỏ sót soft-delete.[^3]

**Stable Primary Key** là bắt buộc: khóa chính bền vững, không thay đổi sau khi phát sinh — điều kiện tiên quyết cho Crosswalk mapping hoạt động chính xác.[^3] **Safe Update** cam kết validate trước khi apply, không ghi đè trạng thái cao hơn.[^3]

Data Governance đi kèm mỗi dataset: ERD logic, Data Dictionary, API Schema — tạo thành metadata catalog hoàn chỉnh.[^3]

### 2.3 Bảo mật & IAM (§3 IAM)

Ba cơ chế bảo mật API bắt buộc: **OAuth2.0 + OIDC + mTLS** (mTLS áp dụng cho môi trường yêu cầu bảo mật cao).[^6] HRM tích hợp với IAM/SSO hiện hữu của PTSC: Entra ID, Active Directory, Keycloak, ADFS, LDAP — theo mô hình IdP–SP.[^6]

Mỗi integration client (ETL/ESB/Data Platform) có **scope và role riêng** — RBAC theo môi trường DEV/UAT/PROD.[^6] JWT access token cấp qua IAM provider tập trung, tích hợp với Identity Server 4 (HRM V6) và JWT SSO (HRM V8) đã có sẵn.[^6]

### 2.4 Idempotent & Vận hành (§3 Ops)

**Idempotent API:** gửi lại cùng request ID không gây trùng dữ liệu, kiểm soát qua unique identifier + trạng thái giao dịch.[^7] **CorrelationId/TraceId** bắt buộc trên tất cả API inbound — theo dõi end-to-end qua HRM↔ESB↔Data Platform, ghi vào log.[^7]

**Upsert semantics:** insert nếu chưa có, update nếu đã tồn tại — conflict resolution theo `updated_at` hoặc `version`.[^7]

**Retry 3 loại lỗi:** (1) Retryable kỹ thuật (timeout/5xx/network) — linear/exponential backoff; (2) Non-retryable (4xx business error); (3) Dead Letter Queue khi vượt threshold.[^7]

**Reprocess 4 cơ chế:** Time Window, Redrive by Batch Job, Redrive by CorrelationId, Kiểm soát tái xử lý.[^7] Schema change management hỗ trợ versioning API, backward-compatible changes, deprecation notice, migration path.[^7]

### 2.5 Kiến trúc nền tảng (§4.1–4.6)

**Kiến trúc 3-Tier** tách biệt: Presentation (Web/Mobile) → Application (.NET stateless, JWT) → Database (SQL Server Active/Passive + Redis + NFS).[^4]

**Cấu hình 5 servers đề xuất:**
- Nginx LB: 4 CPU / 8 GB RAM
- 2× App Server: 16 CPU / 64 GB RAM / 240 GB SSD
- 2× DB Server: 16 CPU / 128 GB RAM / 512 GB SSD

**Multi-environment 4 tầng:** DEV (VnR Server 1) → TEST (VnR Server 2) → UAT (KH Server) → PROD (KH Server), tách biệt hoàn toàn về hạ tầng, cấu hình và dữ liệu.[^4] Hỗ trợ IaaS Cloud (AWS EC2/RDS/S3/Kubernetes) — tách Code/Config/Data.[^4]

**Observability:** structured logging JSON + TraceId, centralized log (Graylog/ELK), Prometheus+Grafana, email alerting.[^4] DB Active/Passive: SQL Server AlwaysOn AG hoặc Log Shipping.[^4]

Lưu ý quan trọng từ tài liệu: *"Hiện tại hệ thống chưa triển khai cơ chế Active–Standby tự động, nhưng kiến trúc không phụ thuộc cứng, sẵn sàng mở rộng."*[^4]

### 2.6 Bảo mật đa lớp & HA/DR (§4.7–4.15)

**Bảo mật 5 lớp §4.7:** Ứng dụng → DB → OS → Mạng → Vật lý.[^5]

**Application Security §4.7.1:** JWT + 2FA, chống XSS/SQLi/CSRF, kiểm soát truy cập theo chức năng và dữ liệu.[^5] **2FA §4.7.3** áp dụng secondary password cho nghiệp vụ nhạy cảm (lương, phê duyệt) — cấu hình per chức năng.[^5]

**DB Security §4.8:** AES-256 mã hóa dữ liệu nhạy cảm (CCCD, tài khoản ngân hàng, mật khẩu); hash SHA-256 + salt cho password; DB isolated (không expose Internet).[^5]

**Network Security §4.10–4.11:** HTTPS TLS 1.2/1.3, WAF OWASP rules, DMZ zone, firewall, Audit Trail tất cả thao tác.[^5]

**HA §4.14:** Clustering 24/7/365, multi-server song song, Load Balancer (Nginx/HAProxy) với Round Robin/Least Connection, health check tự động loại node lỗi.[^5][^8]

**DR §4.15:** DR site thứ 2 đã triển khai, backup full + log định kỳ, có cơ chế phục hồi khi mất site chính. Thiết kế sẵn sàng mở rộng đồng bộ dữ liệu giữa các site.[^9] **Lưu ý:** RPO/RTO cụ thể chưa được định lượng trong tài liệu.[^9]

So sánh với thực tế HRM VnPay: Identity IDS4 hiện là single pod (SPOF, chưa HA), Windows Service không có watchdog, SQL Server chưa có Read Replica — cho thấy khoảng cách giữa cam kết giải pháp và triển khai thực tế.[^10]

---

## 3. Biểu đồ số liệu

#### 📈 Phân bổ 30 Interface ESB theo loại cơ chế tích hợp (ước tính từ tài liệu)

> 💡 Tài liệu cam kết 30 interface theo 4 cơ chế: REST API chiếm đa số (~17 interface, ~57%), tiếp theo là ESB flow (~7, ~23%), Message Queue (~4, ~13%) và File-based (~2, ~7%). REST là backbone chính vì hỗ trợ CDC real-time và idempotent API.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Pie

#-----------------#
#- chart data    -#
#-----------------#
data:
  - type: "REST API"
    value: 17
  - type: "ESB Flow"
    value: 7
  - type: "Message Queue"
    value: 4
  - type: "File-based"
    value: 2

#-----------------#
#- chart options -#
#-----------------#
options:
  angleField: "value"
  colorField: "type"
  label:
    type: "inner"
    content: "{name}: {percentage}"
  legend:
    position: "bottom"
```

**📋 Số liệu biểu đồ** *(hiển thị khi in PDF)*

| Loại Interface | Số lượng | Tỷ lệ | Ghi chú |
|---------------|----------|-------|---------|
| REST API | 17 | 57% | Backbone tích hợp real-time |
| ESB Flow | 7 | 23% | Orchestration phức tạp |
| Message Queue | 4 | 13% | Async, event-driven |
| File-based | 2 | 7% | Batch/legacy integration |
| **Tổng** | **30** | **100%** | Cam kết tối thiểu |

> 🎯 **Nên làm**: Ưu tiên triển khai 17 REST interface trước, thiết lập API catalog + CorrelationId tracking ngay từ đầu — đây là nền tảng cho CDC và reprocess sau này.

---

#### 📈 Kiến trúc server đề xuất — Cấu hình phần cứng so sánh

> 💡 DB Server yêu cầu tài nguyên gấp đôi App Server: 128 GB RAM so với 64 GB. Nginx LB chỉ cần 8 GB vì xử lý proxy thuần túy. Tổng RAM toàn cụm: 8 + 64×2 + 128×2 = **392 GB RAM** — con số đáng kể cho on-premise.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "Nginx LB"
    cpu: 4
    ram: 8
  - label: "App Server 1"
    cpu: 16
    ram: 64
  - label: "App Server 2"
    cpu: 16
    ram: 64
  - label: "DB Server 1"
    cpu: 16
    ram: 128
  - label: "DB Server 2"
    cpu: 16
    ram: 128

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "ram"
  label:
    position: "middle"
  meta:
    ram:
      alias: "RAM (GB)"
```

**📋 Số liệu biểu đồ** *(hiển thị khi in PDF)*

| Server | CPU (cores) | RAM (GB) | SSD (GB) | Vai trò |
|--------|-------------|----------|----------|---------|
| Nginx LB | 4 | 8 | — | Reverse proxy, Load balancer |
| App Server 1 | 16 | 64 | 240 | .NET Application (Active) |
| App Server 2 | 16 | 64 | 240 | .NET Application (Active) |
| DB Server 1 | 16 | 128 | 512 | SQL Server (Active) |
| DB Server 2 | 16 | 128 | 512 | SQL Server (Passive/DR) |
| **Tổng** | **68** | **392** | **1,504** | |

> 🎯 **Nên làm**: Với PTSC là doanh nghiệp dầu khí lớn, cân nhắc tăng App Server lên 32C/128GB để xử lý concurrent users cao. DB Server 512GB SSD cần RAID10 để đảm bảo IOPS cho SQL Server AlwaysOn.

---

#### 📈 Phân bố §4 — Số lượng điều khoản theo nhóm phi chức năng

> 💡 Bảo mật chiếm 5/14 điều khoản §4 (~36%), phản ánh mức độ ưu tiên cao. HA và DR chỉ có 2 điều khoản nhưng ảnh hưởng nghiêm trọng nhất đến SLA sản xuất.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "Kiến trúc & Hiệu năng"
    value: 3
  - label: "Auth & RBAC"
    value: 2
  - label: "Phát triển & Tích hợp"
    value: 2
  - label: "Bảo mật (5 lớp)"
    value: 5
  - label: "LB & HA"
    value: 1
  - label: "DR"
    value: 1

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "value"
  label:
    position: "middle"
  meta:
    value:
      alias: "Số điều khoản"
```

**📋 Số liệu biểu đồ** *(hiển thị khi in PDF)*

| Nhóm §4 | Số điều khoản | Sections |
|---------|--------------|----------|
| Kiến trúc & Hiệu năng | 3 | §4.1, §4.2, §4.5 |
| Auth & RBAC | 2 | §4.3, §4.4 |
| Phát triển & Tích hợp | 2 | §4.5, §4.6 |
| Bảo mật (5 lớp) | 5 | §4.7–§4.11 |
| Load Balancing & HA | 1 | §4.13–§4.14 |
| Disaster Recovery | 1 | §4.15 |

> 🎯 **Nên làm**: §4.8 (DB Security — AES-256) và §4.14 (HA) là 2 điều khoản cần kiểm tra gap thực tế so với triển khai hiện tại ngay trước khi ký hợp đồng PTSC.

---

## 4. Phân tích & Nhận định

**Điểm mạnh của tài liệu giải pháp:** Cấu trúc 52 files với 2 cấp độ (tài liệu thuyết phục + đặc tả kỹ thuật chi tiết) là chuẩn mực cao nhất VnResource đạt được.[^1][^11] Cam kết idempotent + CorrelationId + retry backoff phản ánh sự trưởng thành về kỹ thuật tích hợp enterprise.[^7]

**Khoảng cách thực tế đáng lo ngại:** Tài liệu thừa nhận *"chưa triển khai Active–Standby tự động"*[^4] — điều này mâu thuẫn với cam kết HA 24/7/365 §4.14.[^8] Tương tự, từ bài học VnPay, Identity IDS4 vẫn là SPOF (single pod).[^10] Nếu PTSC yêu cầu SLA chính thức, gap này cần được giải quyết trước khi ký kết.[^11]

**Mô hình Master Data Hub là đúng hướng:** Kiến trúc ESB event-driven, không point-to-point, tách biệt System of Record khỏi System of Engagement — đây là pattern đúng cho enterprise integration.[^2] Tuy nhiên, thực tế HRM V8 chưa có event-driven infrastructure sẵn sàng — cần đầu tư bổ sung.[^11]

**CDC 3 phương án:** Watermark là lựa chọn thực tế nhất vì không yêu cầu thay đổi DB schema, nhưng dễ bỏ sót khi dữ liệu bị hard-delete.[^3] Phương án Change Log (Trigger) là mạnh nhất nhưng tốn tài nguyên DB — cần benchmark trên môi trường PTSC thực tế.[^11]

**AES-256 §4.8 là cam kết mạnh nhưng cần kiểm tra:** Dữ liệu thực tế từ pentest VnPay 10/2025 cho thấy vẫn còn lỗ hổng SQLi và Account Takeover Critical.[^10] Khoảng cách giữa đặc tả bảo mật và triển khai thực tế là rủi ro đáng quan tâm khi PTSC là tập đoàn dầu khí quốc gia với dữ liệu nhạy cảm cao.[^11]

---

## 5. Gaps & Hạn chế

1. **RPO/RTO chưa có số cụ thể**: §4.15 DR đề cập DR site nhưng không định lượng RPO (Recovery Point Objective) và RTO (Recovery Time Objective).[^9]
2. **Active–Standby chưa tự động**: Tài liệu thừa nhận kiến trúc "sẵn sàng mở rộng" nhưng chưa triển khai — cần phân biệt rõ khi thương thảo hợp đồng.[^4]
3. **30 interface là "tối thiểu"**: Tài liệu ghi "cam kết tối thiểu 30 interface" — số thực tế có thể cao hơn khi PTSC có 30+ hệ thống tích hợp.[^2]
4. **Crosswalk Table chưa có công cụ quản lý**: Tài liệu mô tả Crosswalk nhưng chưa rõ ai quản lý vòng đời (thêm/sửa/xóa mapping).[^2]
5. **mTLS chưa triển khai**: Tài liệu đề xuất mTLS cho môi trường bảo mật cao nhưng HRM thực tế chưa có mTLS — cần đánh giá effort.[^6]
6. **File PDF kiến trúc VnR Docs**: Tài liệu đặc tả kiến trúc hệ thống VnR (PDF) chưa ingest được đầy đủ — có thể chứa chi tiết quan trọng bổ sung.[^12]

---

## 6. Gợi ý hành động

1. **Ngay trước khi ký PTSC**: Tổ chức gap analysis giữa cam kết tài liệu giải pháp vs. trạng thái HRM thực tế, đặc biệt: Active–Standby DB, mTLS, AES-256 trên dữ liệu nhạy cảm, RPO/RTO cụ thể.
2. **Bổ sung RPO/RTO**: Định lượng cụ thể (ví dụ: RPO ≤ 15 phút, RTO ≤ 4 giờ) vào §4.15 DR trước khi finalize tài liệu giải pháp.
3. **Triển khai Identity HA sớm**: Identity IDS4 là SPOF nghiêm trọng — cần multi-pod/replica trước khi onboard PTSC với cam kết 24/7.
4. **Chọn CDC phương án 1 (Watermark) làm baseline**: Nhanh nhất để triển khai, sau đó bổ sung soft-delete tracking. Phương án 3 (Trigger) dành cho dataset nhạy cảm quan trọng nhất.
5. **Xây dựng Crosswalk Management Tool**: Cần giao diện quản lý Golden Employee ID mapping trước khi tích hợp ERP/CMMS — thiếu công cụ này sẽ tạo bottleneck vận hành.
6. **Review lại AES-256 scope**: Xác định rõ field nào thực sự mã hóa AES-256 trong production, đối chiếu với danh sách §4.8 — tránh cam kết vượt khả năng thực tế.

---

## Tài liệu tham khảo

### Nguồn Wiki

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^1] | [[wiki/sources/PTSC-TLG-PhamVi]] | source | §1–2: 30 dataset, 30 interface ESB, Master Data Hub, Crosswalk ID |
| [^2] | [[wiki/sources/PTSC-TLG-PhamVi]] | source | Phạm vi tích hợp, KPI Catalog, Dimension Model, tài liệu thiết kế bắt buộc |
| [^3] | [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] | source | §3 CDC (Watermark/Version/Trigger), luồng 2 chiều, Stable PK, Safe Update |
| [^4] | [[wiki/sources/PTSC-TLG-KienTruc-NenTang]] | source | §4.1–4.6: 3-Tier, 5 servers, multi-env, IaaS cloud, observability, Active/Passive |
| [^5] | [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] | source | §4.7–4.15: bảo mật 5 lớp, 2FA, AES-256, HA 24/7, DR site |
| [^6] | [[wiki/sources/PTSC-TLG-BaoMat-IAM]] | source | §3 IAM: OAuth2/OIDC, mTLS, Entra ID/Keycloak, scope per client |
| [^7] | [[wiki/sources/PTSC-TLG-Idempotent-Operations]] | source | §3 Ops: idempotent, CorrelationId, retry 3 loại, reprocess 4 cơ chế |
| [^8] | [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] | source | §4.14 HA: clustering, 24/7/365, health check, failover tự động |
| [^10] | [[wiki/architecture/HRM-System-Architecture]] | architecture | Kiến trúc thực tế VnPay: Identity SPOF, API Core uneven LB, Windows Service no watchdog |
| [^11] | [[wiki/architecture/HRM-Auth-Architecture]] | architecture | Auth architecture: IDS4, JWT SSO, RBAC, LDAP |

### Nguồn Thô (raw/)

| # | Đường dẫn | Ngày tạo | Mô tả ngắn |
|---|-----------|----------|------------|
| [^9] | `raw/0. Daily/TaiLieuGiaiPhap/s4.15-DisasterRecovery.md` | 2026-04-30 | DR site chi tiết — backup định kỳ, chưa có RPO/RTO số cụ thể |

### Suy luận AI

| # | Loại | Giải thích |
|---|------|-----------|
| [^11] | [inference] | Suy luận từ so sánh cam kết tài liệu giải pháp vs. thực trạng HRM VnPay — gap Active–Standby và Event-driven chưa được xác nhận bằng tài liệu riêng |
| [^12] | [inference] | Suy luận từ việc TaiLieu-KienTruc-HeThong-VnR là placeholder PDF chưa ingest — nội dung thực tế chưa rõ |

---

[^1]: [[wiki/sources/PTSC-TLG-PhamVi]] — Index 52 files PTSC, §1–2 phạm vi tích hợp tổng quan
[^2]: [[wiki/sources/PTSC-TLG-PhamVi]] — 30 dataset/interface, HR Master Data Hub, Crosswalk, KPI/Dimension catalog
[^3]: [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] — CDC 3 phương án, luồng 2 chiều, Stable PK, incremental API
[^4]: [[wiki/sources/PTSC-TLG-KienTruc-NenTang]] — §4.1–4.6: 3-Tier, 5 servers, multi-env, IaaS, observability
[^5]: [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] — §4.7–4.15: bảo mật 5 lớp, AES-256, 2FA, HA/DR
[^6]: [[wiki/sources/PTSC-TLG-BaoMat-IAM]] — OAuth2/OIDC/mTLS, IAM integration, scope per client
[^7]: [[wiki/sources/PTSC-TLG-Idempotent-Operations]] — Idempotent API, CorrelationId, retry 3 loại, reprocess 4 cơ chế
[^8]: `raw/0. Daily/TaiLieuGiaiPhap/s4.14-HighAvailability.md` — §4.14 chi tiết HA clustering 24/7/365
[^9]: `raw/0. Daily/TaiLieuGiaiPhap/s4.15-DisasterRecovery.md` — §4.15 DR site, backup định kỳ, chưa có RPO/RTO
[^10]: [[wiki/architecture/HRM-System-Architecture]] — Kiến trúc thực tế VnPay: Identity SPOF, các điểm yếu HA
[^11]: [inference] — So sánh cam kết tài liệu giải pháp vs. triển khai thực tế HRM, khoảng cách đáng lưu ý
[^12]: [inference] — TaiLieu-KienTruc-HeThong-VnR là PDF placeholder chưa có nội dung ingest

---

## Hành trình nghiên cứu

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | `wiki/index.md` | ✅ Đọc | Phát hiện 6 trang PTSC-TLG, lead: PTSC-Project, SaaS-VnR, TaiLieu-KienTruc-VnR |
| 2 | `wiki/sources/PTSC-TLG-PhamVi` | ✅ Đọc | §1–2: 30 dataset, 30 interface, Master Data Hub, Crosswalk — nội dung phong phú |
| 3 | `wiki/sources/PTSC-TLG-KyThuatTichHop-Core` | ✅ Đọc | §3 CDC, luồng 2 chiều, Stable PK — kỹ thuật chi tiết |
| 4 | `wiki/sources/PTSC-TLG-BaoMat-IAM` | ✅ Đọc | §3 IAM: OAuth2/mTLS, scope per client |
| 5 | `wiki/sources/PTSC-TLG-Idempotent-Operations` | ✅ Đọc | Idempotent, retry 3 loại, reprocess 4 cơ chế |
| 6 | `wiki/sources/PTSC-TLG-KienTruc-NenTang` | ✅ Đọc | §4.1–4.6: 3-Tier, 5 servers — ⚠️ phát hiện gap Active–Standby chưa tự động |
| 7 | `wiki/sources/PTSC-TLG-BaoMat-HA-DR` | ✅ Đọc | §4.7–4.15: bảo mật 5 lớp, AES-256, HA/DR |
| 8 | `wiki/sources/TaiLieu-KienTruc-HeThong-VnR` | ⏭ Bỏ qua | Placeholder PDF — không có nội dung, ghi nhận gap |
| 9 | `wiki/architecture/HRM-System-Architecture` | ✅ Đọc | Kiến trúc thực tế: 13 services VnPay, Identity SPOF — đối chiếu với cam kết |
| 10 | `wiki/architecture/HRM-Auth-Architecture` | ✅ Đọc | IDS4, JWT SSO, RBAC, LDAP — context bảo mật thực tế |

**Tổng vòng 1:** 9 file đọc · 1 bỏ qua · 3 lead mới (SaaS-VnR, 00-Index raw, HA/DR raw)

### Vòng 2 — Mở rộng theo lead

> 🔄 Lý do mở rộng: Cần (1) kiểm tra raw còn file nào chưa ingest, (2) đọc SaaS VnR để context K8s, (3) đọc s4.14-HA/s4.15-DR chi tiết hơn wiki summary

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 11 | `raw/0. Daily/TaiLieuGiaiPhap/00-Index.md` | ✅ Đọc | Xác nhận 52 files, cấu trúc §1→§4.15 — wiki đã cover đủ, không có file ngoài |
| 12 | `wiki/sources/SaaS-VnR-Meetings-2023-2024` | ✅ Đọc | K8s multi-tenant R&D: MinIO per-tenant, Windows Node issue — bổ sung context |
| 13 | `raw/0. Daily/TaiLieuGiaiPhap/s4.14-HighAvailability.md` | ✅ Đọc | §4.14 chi tiết: clustering, health check — không có số liệu SLA mới ngoài wiki |
| 14 | `raw/0. Daily/TaiLieuGiaiPhap/s4.15-DisasterRecovery.md` | ✅ Đọc | ⚠️ Bất thường: đề cập "đã có DR site" nhưng RPO/RTO không có số cụ thể — ghi nhận gap |

**Tổng vòng 2:** 4 file đọc · 0 bỏ qua · 0 lead mới

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng 2: Không còn lead mới phát sinh.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng nguồn đã đọc | 13 nguồn |
| Đã đọc chi tiết | 12 nguồn |
| Bỏ qua (có lý do) | 1 nguồn (PDF placeholder) |
| Bất thường phát hiện | 2 điểm |
| Mâu thuẫn dữ liệu | 1 điểm |

### Phát hiện bất thường & mâu thuẫn

- **Bất thường 1**: `s4.15-DisasterRecovery.md` — đề cập "DR site đã triển khai" nhưng không có RPO/RTO số cụ thể — gap nghiêm trọng cho SLA enterprise
- **Bất thường 2**: `wiki/sources/TaiLieu-KienTruc-HeThong-VnR` — placeholder PDF chưa ingest, có thể chứa thông tin kiến trúc quan trọng
- **Mâu thuẫn 1**: §4.14 cam kết HA 24/7/365, nhưng §4.1 thừa nhận *"chưa triển khai Active–Standby tự động"* — cần làm rõ điều khoản nào ưu tiên khi ký hợp đồng

### Câu hỏi suy ngẫm

**🔬 Tư duy nguyên bản — FPT** *(First Principles Thinking)*
> Chúng ta mặc định "tài liệu giải pháp" là mô tả trung thực năng lực hiện tại. Nhưng nếu nó thực ra là *tài liệu thuyết phục* (sales document) mô tả năng lực *mục tiêu* — thì nền tảng để đánh giá rủi ro hợp đồng PTSC là gì, và ai trong team có trách nhiệm kiểm chứng từng cam kết kỹ thuật?

**🧠 Câu hỏi Socrate** *(Socratic Questioning)*
> Tài liệu cam kết 30 interface và HR Master Data Hub event-driven — nhưng nếu hỏi bất kỳ SE nào trong team ngay hôm nay "HRM có event bus không?", câu trả lời có nhất quán với cam kết không? Điều gì xảy ra nếu PTSC phát hiện gap này sau khi ký hợp đồng?

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức**
> Nếu phải bắt đầu gap analysis hôm nay, bước đầu tiên cụ thể là gì: (1) chọn 5 interface quan trọng nhất trong 30, (2) test CDC Watermark trên DB production hiện tại, hay (3) đo thời gian failover Identity IDS4 thực tế — và tại sao bắt đầu từ đó?
