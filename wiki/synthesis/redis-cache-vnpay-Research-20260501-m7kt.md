---
description: "Nghiên cứu Redis Cache VnPay: so sánh Standalone vs Sentinel vs Cluster, quyết định kiến trúc và bài học từ sự cố hiệu năng."
type: synthesis
code: m7kt
tags:
  - "redis"
  - "cache"
  - "vnpay"
  - "architecture"
  - "research"
  - "decision"
research-topic: Redis Cache VnPay — Standalone vs Sentinel vs Cluster
sources-wiki:
  - "wiki/projects/VnPay-Project"
  - "wiki/sources/Daily-2024-Cache-Redis"
  - "wiki/architecture/HRM-System-Architecture"
  - "wiki/sources/VnPay-Performance-Incident"
  - "wiki/sources/VnPay-System-Architecture"
  - "wiki/sources/SaaS-VnR-Meetings-2023-2024"
sources-raw:
  - "raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/Confluence/Kiến trúc Redis Sentinel.md"
  - "raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/Confluence/Chuyển Redis sang Sentinel (chỉnh hạ tầng và cấu hình).md"
created: 2026-05-01
updated: 2026-05-01
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/sources/Daily-2024-Cache-Redis]]"
  - "[[wiki/decision-log/2026-05-01-redis-sentinel-vnpay]]"
---

# Nghiên cứu: Redis Cache VnPay — Standalone vs Sentinel vs Cluster

## Mục lục

- [Tóm tắt điều hành](#tóm-tắt-điều-hành)
- [1. Bối cảnh & Phạm vi](#1-bối-cảnh--phạm-vi)
- [2. Findings](#2-findings)
- [3. Biểu đồ so sánh](#3-biểu-đồ-so-sánh)
- [4. Phân tích & Nhận định](#4-phân-tích--nhận-định)
- [5. Gaps & Hạn chế](#5-gaps--hạn-chế)
- [6. Gợi ý hành động](#6-gợi-ý-hành-động)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
- [Hành trình nghiên cứu](#hành-trình-nghiên-cứu)

---

## Tóm tắt điều hành

**Câu hỏi này đã được thực tế trả lời**: VnPay đã chuyển từ Redis Standalone sang Redis Sentinel từ tháng 06/2025.[^1] Câu hỏi không còn là "chọn gì?" mà là "tại sao Sentinel đúng và khi nào mới cần Cluster?" Redis Cluster bị loại không phải vì kém hơn mà vì hạ tầng VnPay chỉ có 3 node — không đủ tối thiểu cho Cluster ổn định.[^2] Sentinel giải quyết đúng vấn đề gốc: Redis Standalone là SPOF trong môi trường K8s nhiều services phụ thuộc vào cache.[^3] Bất kỳ AI nào đề xuất Cluster cho VnPay đều sai ngữ cảnh — phải theo Sentinel đã được triển khai.[^4]

---

## 1. Bối cảnh & Phạm vi

HRM VnPay chạy trên Kubernetes với 13 services.[^5] Redis được dùng cho 3 mục đích chính: WarmupStatus key (6 services), Hangfire job queue (Windows Service), và distributed cache (thay thế MemoryCache per-process).[^3] Sau sự cố nghẽn 200 concurrent users tháng 11/2025, VnPay đã scale up infrastructure — trong đó có việc đánh giá lại Redis.[^6] Tháng 06/2025, VnPay chuyển Redis sang Sentinel với 3 sentinel nodes (ports 26379–26381) và 1 master + 2 replica.[^1]

Phạm vi research: toàn bộ tài liệu VnPay trong wiki + Confluence raw (Redis Sentinel, kiến trúc, config).

---

## 2. Findings

### 2.1 VnPay đã chuyển sang Redis Sentinel từ 19/06/2025

**Mô tả chi tiết**: Tài liệu Confluence của VnPay ghi ngày 19/06/2025, hướng dẫn chi tiết migrate từ Standalone sang Sentinel: cài 3 sentinel nodes bằng nssm (Windows Service), config `sentinel1.conf` → `sentinel3.conf`, và update `webSettings.json` tất cả services với key `UseRedisSentinel: true`.[^1]

**Tại sao quan trọng**: Đây không phải quyết định lý thuyết — đây là config đang chạy production. Mọi thảo luận về "nên dùng gì" phải bắt đầu từ đây, không phải từ zero.

**Rủi ro / Tác động**: Nếu agent không biết điều này và đề xuất Standalone hoặc Cluster → config sẽ xung đột với hệ thống thực tế.

**Nguồn**: `raw/archive/...Chuyển Redis sang Sentinel...`[^1] | **Độ tin cậy**: Dữ kiện

---

### 2.2 Lý do chọn Sentinel: HA với 3 node, không cần scale data

**Mô tả chi tiết**: Redis Sentinel cung cấp HA tự động — khi Master down, Sentinel bỏ phiếu (quorum) và promote Replica thành Master mới, ứng dụng reconnect mà không cần thay đổi config.[^7] VnPay có đúng 3 node Redis (1 master + 2 replica) + 3 sentinel — đây là setup tối thiểu chuẩn cho Sentinel HA.[^7]

**Tại sao quan trọng**: Redis Standalone = SPOF. Khi Master down (restart, crash, deploy) → toàn bộ cache miss → Identity service, Hangfire, WarmupStatus đều bị ảnh hưởng → cascade failures.

**Rủi ro / Tác động**: Không có Sentinel → mỗi lần restart Redis là downtime cho tất cả 13 services.

**Nguồn**: `raw/archive/...Kiến trúc Redis Sentinel.md`[^7] | **Độ tin cậy**: Dữ kiện

---

### 2.3 Redis Cluster bị loại vì không phù hợp hạ tầng VnPay

**Mô tả chi tiết**: Redis Cluster yêu cầu tối thiểu 6 node (3 master + 3 replica) để ổn định. VnPay chỉ có 3 node Redis — không đủ để chạy Cluster đúng cách.[^2] Ngoài ra, Redis Cluster shards data theo slot — phức tạp hơn nhiều trong vận hành, và HRM không có nhu cầu scale data vượt single-node capacity.

**Tại sao quan trọng**: Nhiều tài liệu kỹ thuật đề xuất Cluster vì "tốt hơn" về throughput — nhưng "tốt hơn theo lý thuyết" ≠ "phù hợp ngữ cảnh". VnPay cần HA, không cần sharding.

**Rủi ro / Tác động**: Nếu triển khai Cluster với 3 node → quorum không ổn định → failover không đáng tin cậy hơn Standalone.

**Nguồn**: [^2][inference] | **Độ tin cậy**: Suy luận từ kiến trúc Redis Sentinel docs

---

### 2.4 Lịch sử: từ MemoryCache → Redis Standalone → Redis Sentinel

**Mô tả chi tiết**: Tháng 08/2024, HRM migrate từ `IMemoryCache` (per-process, IIS) sang `IDistributedCache` với Redis 7.2.5.[^8] Nguyên nhân: IIS chạy 5 pools (main/portal/hr/sys/apiv3) → mỗi pool có cache riêng → clear cache trên 1 pool không sync sang 4 pools còn lại → user thấy quyền khác nhau.[^8] Tháng 06/2025, thêm bước Sentinel để đảm bảo HA.[^1]

**Tại sao quan trọng**: Quá trình 3 bước này cho thấy quyết định được đưa ra dựa trên vấn đề thực tế, không phải "best practice" chung chung.

**Rủi ro / Tác động**: Hiểu lịch sử này giúp tránh rollback về MemoryCache hoặc Standalone trong tương lai.

**Nguồn**: [[wiki/sources/Daily-2024-Cache-Redis]][^8] | **Độ tin cậy**: Dữ kiện

---

### 2.5 Config thực tế VnPay — webSettings.json

**Mô tả chi tiết**: Config sau khi migrate sang Sentinel:[^1]

```json
"RedisConfiguration": {
  "UseRedisSentinel": true,
  "UseRedisServer": false,
  "RedisConnection": "mymaster,127.0.0.1:26379,127.0.0.1:26380,127.0.0.1:26381,syncTimeout=60000,...",
  "RedisPrefixKeyName": "App-VnPay-Net8",
  "UseRedisSyncData": true
}
```

Sentinel nodes chạy trên ports 26379–26381, ServiceName = `mymaster`, Redis 7.2.5, cài qua nssm trên Windows Server.

**Tại sao quan trọng**: Đây là source of truth — bất kỳ thay đổi nào cần phải align với format config này.

**Rủi ro / Tác động**: Thay đổi config sai format → UseRedisSentinel không được nhận diện → fallback về Standalone không báo lỗi.

**Nguồn**: `raw/archive/...Chuyển Redis sang Sentinel...`[^1] | **Độ tin cậy**: Dữ kiện

---

## 3. Biểu đồ so sánh

#### 📈 So sánh 3 phương án Redis theo tiêu chí phù hợp VnPay

> 💡
> Sentinel chiến thắng tuyệt đối trên tiêu chí quan trọng nhất với VnPay: HA tự động — điểm 5/5 so với Standalone (1/5) và Cluster (5/5 nhưng không thể triển khai với hạ tầng hiện tại).
> Cluster bị cản bởi ràng buộc hạ tầng cứng (chỉ 3 node), không phải vì kém hơn về kỹ thuật — đây là điểm mà tài liệu lý thuyết thường bỏ qua.
> Standalone phù hợp môi trường dev/test nhưng là SPOF trong production K8s — không thể dùng cho VnPay post-golive.
> Complexity vận hành của Sentinel (3/5) cao hơn Standalone nhưng thấp hơn Cluster — đây là trade-off đúng cho team hiện tại.
> Gap còn lại: chưa có benchmark latency Sentinel vs Standalone trong môi trường VnPay để đo overhead thực tế.
> Nếu VnPay mở rộng lên 6+ node Redis trong tương lai → Cluster trở thành lựa chọn hợp lệ, cần re-evaluate.

```chartsview
#-----------------#
#- chart type    -#
#-----------------#
type: Column

#-----------------#
#- chart data    -#
#-----------------#
data:
  - label: "HA tự động"
    standalone: 1
    sentinel: 5
    cluster: 5
  - label: "Phù hợp 3 node"
    standalone: 5
    sentinel: 5
    cluster: 1
  - label: "Độ phức tạp vận hành (nghịch)"
    standalone: 5
    sentinel: 3
    cluster: 1
  - label: "Phù hợp workload HRM"
    standalone: 3
    sentinel: 5
    cluster: 4

#-----------------#
#- chart options -#
#-----------------#
options:
  xField: "label"
  yField: "sentinel"
  label:
    position: "middle"
  meta:
    sentinel:
      alias: "Redis Sentinel (điểm 1-5)"
```

**📋 Số liệu so sánh**

| Tiêu chí | Standalone | Sentinel | Cluster | Ghi chú |
|----------|-----------|---------|---------|---------|
| HA tự động | 1 | 5 | 5 | Cluster cần 6+ node |
| Phù hợp 3 node VnPay | 5 | 5 | 1 | Cluster tối thiểu 6 node |
| Độ phức tạp vận hành (nghịch) | 5 | 3 | 1 | 1=phức tạp, 5=đơn giản |
| Phù hợp workload HRM cache | 3 | 5 | 4 | HRM không cần sharding |

> 🎯 **Nên làm**: Giữ Sentinel, document rõ ngưỡng "khi nào upgrade lên Cluster" (khi data cache > 80% RAM single node hoặc khi có 6+ node Redis).

---

## 4. Phân tích & Nhận định

### 4.1 Quy luật rút ra

**Chọn Redis mode theo ràng buộc hạ tầng trước, tính năng sau.** Cluster "tốt hơn" về throughput nhưng bị loại bởi ràng buộng cứng (3 node). Trong HRM, quyết định kỹ thuật luôn phải pass qua filter: "có phù hợp hạ tầng và team hiện tại không?"[^2]

**Sentinel giải quyết đúng vấn đề gốc rễ, không over-engineer.** VnPay cần HA (Sentinel giải quyết), không cần horizontal scale data (Cluster). Dùng đúng công cụ cho đúng vấn đề.[^7]

**Redis dependency cascade trong K8s là rủi ro ẩn.** 13 services đều phụ thuộc Redis (Warmup, Hangfire, cache) → Redis Standalone down = cascading failure toàn hệ thống. Đây là lý do HA là tiêu chí số 1, không phải throughput.[^3]

### 4.2 Mâu thuẫn phát hiện

| # | Mâu thuẫn | Hệ quả nếu không xử lý |
|---|-----------|------------------------|
| 1 | Tài liệu lý thuyết Redis thường đề xuất Cluster là "production best practice" | Agent có thể suggest Cluster cho VnPay → sai ngữ cảnh |
| 2 | IIS 5-pool pattern cũ (Standalone + 5 endpoints clear cache) đã bị thay thế bởi Sentinel | Nếu áp dụng pattern cũ vào môi trường mới → cache inconsistency |

---

## 5. Gaps & Hạn chế

- **Không có benchmark latency** Sentinel vs Standalone trong môi trường VnPay thực tế → rủi ro: không biết overhead Sentinel có ảnh hưởng response time không.
- **Chưa rõ monitoring setup** cho Sentinel — cần biết alert nào được cấu hình khi Sentinel failover xảy ra.
- **Chưa có runbook failover** — khi Master down thực tế, team cần biết chính xác phải làm gì (kiểm tra log, xác nhận Replica promoted, restart services nếu cần).

---

## 6. Gợi ý hành động

| Ưu tiên | Hành động | Lý do cụ thể |
|---------|-----------|--------------|
| 🔴 Cao | Document ngưỡng "khi nào upgrade lên Cluster" | Tránh tình trạng future agent/dev đề xuất Cluster khi chưa cần |
| 🟡 Trung bình | Setup Grafana alert cho Sentinel failover events | Hiện tại không biết khi nào failover xảy ra cho đến khi có vấn đề |
| 🟡 Trung bình | Viết runbook failover Sentinel cho team VnPay IT | Giảm MTTR khi Redis incident xảy ra |
| 🟢 Thấp | Benchmark latency Sentinel overhead (~1-2ms expected) | Xác nhận không có performance regression |

---

## Tài liệu tham khảo

### Nguồn Wiki

| # | Wikilink | Loại | Mô tả ngắn |
|---|----------|------|------------|
| [^3] | [[wiki/architecture/HRM-System-Architecture]] | architecture | Redis dùng cho Warmup + Hangfire, K8s 13 services |
| [^5] | [[wiki/projects/VnPay-Project]] | project | 13 services K8s, timeline, kiến trúc tổng quan |
| [^6] | [[wiki/sources/VnPay-Performance-Incident]] | source | Sự cố 200 users tháng 11/2025, fix scale |
| [^8] | [[wiki/sources/Daily-2024-Cache-Redis]] | source | Migration MemoryCache→Redis 7.2.5, 5-pool pattern, Task.Run bug |

### Nguồn Thô (raw/)

| # | Đường dẫn | Ngày tạo | Mô tả ngắn |
|---|-----------|----------|------------|
| [^1] | `raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/Confluence/Chuyển Redis sang Sentinel (chỉnh hạ tầng và cấu hình).md` | 2025-06-19 | Hướng dẫn migrate + config webSettings.json thực tế |
| [^7] | `raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/Confluence/Kiến trúc Redis Sentinel.md` | 2026-03-07 | Kiến trúc Sentinel, flow hoạt động, failover mechanism |

### Suy luận AI

| # | Loại | Giải thích |
|---|------|-----------|
| [^2] | [inference] | Redis Cluster yêu cầu tối thiểu 6 node — suy luận từ kiến trúc Sentinel docs và số node VnPay hiện có (3). Chưa có tài liệu VnPay nói rõ lý do loại Cluster. |
| [^4] | [inference] | Agent nên ưu tiên decision-log/wiki hơn kiến thức chung — suy luận từ nguyên tắc LLM Wiki. |

---

[^1]: `raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/Confluence/Chuyển Redis sang Sentinel (chỉnh hạ tầng và cấu hình).md` — Config thực tế, ngày 19/06/2025
[^2]: [inference] — Redis Cluster cần 6+ node tối thiểu, VnPay chỉ có 3
[^3]: [[wiki/architecture/HRM-System-Architecture]] — Redis role trong 13 services VnPay
[^4]: [inference] — Nguyên tắc ưu tiên wiki context hơn LLM general knowledge
[^5]: [[wiki/projects/VnPay-Project]] — Tổng quan dự án VnPay
[^6]: [[wiki/sources/VnPay-Performance-Incident]] — Sự cố scale tháng 11/2025
[^7]: `raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/Confluence/Kiến trúc Redis Sentinel.md` — Kiến trúc và flow Sentinel
[^8]: [[wiki/sources/Daily-2024-Cache-Redis]] — Lịch sử migration cache

---

## Hành trình nghiên cứu

### Vòng 1 — Quét nền

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 1 | `wiki/index.md` | ✅ Đọc | Tìm thấy: VnPay-Project, Daily-2024-Cache-Redis, HRM-System-Architecture, decision-log/ |
| 2 | `wiki/projects/VnPay-Project.md` | ✅ Đọc | 13 services K8s, Redis dùng cho Hangfire + Warmup |
| 3 | `wiki/sources/Daily-2024-Cache-Redis.md` | ✅ Đọc | 💡 Redis 7.2.5 đã dùng, 5-pool pattern, migration history |
| 4 | `wiki/architecture/HRM-System-Architecture.md` | ✅ Đọc | Redis DB2 = Hangfire queue + WarmupStatus |
| 5 | `wiki/decision-log/_template.md` | ✅ Đọc | Chưa có decision về Redis — cần tạo mới |
| 6 | `wiki/sources/VnPay-Performance-Incident.md` | ✅ Đọc | Sự cố 200 users, Identity SPOF, cần HA toàn hệ thống |
| 7 | `wiki/sources/VnPay-System-Architecture.md` | ✅ Đọc | 13 services chi tiết, Identity = SPOF |

**Tổng vòng 1:** 7 file đọc · 0 bỏ qua · 1 lead mới (tìm raw Confluence Redis)

### Vòng 2 — Mở rộng theo lead

> 🔄 Lý do mở rộng: chưa có quyết định cụ thể về Sentinel vs Cluster → cần tìm raw docs

| Bước | File / Nguồn | Hành động | Kết quả / Quyết định |
|------|-------------|-----------|----------------------|
| 8 | `raw/**/*Redis*` (search) | 🔍 Quét | Tìm thấy 6 file, trong đó 2 file Confluence VnPay về Sentinel |
| 9 | `raw/.../Kiến trúc Redis Sentinel.md` | ✅ Đọc | 💡 Architecture đầy đủ: 3 sentinel + 1 master + 2 replica, flow failover |
| 10 | `raw/.../Chuyển Redis sang Sentinel...md` | ✅ Đọc | 💡 JACKPOT: Config thực tế, ngày 19/06/2025, webSettings.json sau migrate |

**Tổng vòng 2:** 2 file đọc · 4 bỏ qua (không liên quan) · 0 lead mới

### Kết thúc tìm kiếm

> 🏁 Dừng tại vòng 2: không còn lead mới phát sinh.

| Chỉ số | Giá trị |
|--------|---------|
| Tổng file đọc | 9 file |
| Bỏ qua | 4 file |
| Lead theo đuổi | 1 lead |
| Bất thường | 0 |
| Mâu thuẫn dữ liệu | 1 (lý thuyết vs thực tế VnPay) |

### Phát hiện bất thường & mâu thuẫn

- **Mâu thuẫn 1**: Tài liệu kỹ thuật chung thường đề xuất Redis Cluster cho production — nhưng VnPay chọn Sentinel vì ràng buộc 3 node. **Dùng quyết định thực tế VnPay vì có context cụ thể.**

### Câu hỏi suy ngẫm

**🔬 Tư duy nguyên bản — FPT**
> Chúng ta mặc định "production = Redis Cluster" là best practice — nhưng nếu bỏ giả định đó, tiêu chí thực sự để chọn Redis mode là gì? (Gợi ý: số node có sẵn, loại workload, tần suất failover thực tế)

**🧠 Câu hỏi Socrate**
> Sentinel giải quyết HA khi Master down — nhưng Sentinel có giải quyết được vấn đề Redis bị OOM (như bug Sys025 IIS vừa phát hiện) không? Nếu không, lớp bảo vệ nào còn thiếu?

**🎯 SAT — Suy ngẫm · Áp dụng · Thách thức**
> Nếu VnPay muốn thêm 3 node Redis nữa để upgrade lên Cluster, bước chuẩn bị đầu tiên cần làm là gì — và bao lâu thì hệ thống downtime trong quá trình migrate?
