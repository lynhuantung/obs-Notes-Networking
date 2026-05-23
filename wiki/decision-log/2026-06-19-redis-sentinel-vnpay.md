---
description: "Quyết định chuyển Redis từ Standalone sang Sentinel cho VnPay HRM, tăng resilience và tự động failover."
type: decision
code: m7kt
tags:
  - "decision"
  - "vnpay"
  - "redis"
  - "cache"
  - "architecture"
domain: system
created: 2026-05-01
updated: 2026-05-01
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/synthesis/redis-cache-vnpay-Research-20260501-m7kt]]"
---

## [2026-06-19] decision | Dùng Redis Sentinel thay Standalone cho HRM VnPay

- **Decision**: Chuyển Redis từ Standalone sang Sentinel với 3 sentinel nodes (26379–26381), 1 master + 2 replica, ServiceName = `mymaster`.
- **Why**: Redis Standalone là SPOF trong môi trường K8s 13 services — khi Master down, toàn bộ Warmup, Hangfire, distributed cache bị gián đoạn. Sau sự cố nghẽn 200 users tháng 11/2025, team quyết định tăng resilience toàn hệ thống.
- **Chosen**: Redis Sentinel — tự động failover, ứng dụng không cần đổi config khi Master chuyển, phù hợp với 3 node hiện có.
- **Rejected**: 
  - Redis Standalone — SPOF, không HA
  - Redis Cluster — yêu cầu tối thiểu 6 node (3 master + 3 replica), VnPay chỉ có 3 node → không đủ điều kiện
- **Impact**: Tất cả 13 services phải update `webSettings.json` với `UseRedisSentinel: true` và connection string dạng `mymaster,host:26379,host:26380,host:26381,...`
- **Context**: Hạ tầng VnPay: Windows Server, Redis 7.2.5, cài qua nssm. K8s 13 services đều phụ thuộc Redis. Team không có capacity vận hành Redis Cluster phức tạp hơn. HRM workload không cần horizontal scale data — chỉ cần HA.
- **Links**: [[wiki/projects/VnPay-Project]], [[wiki/architecture/HRM-System-Architecture]], [[wiki/synthesis/redis-cache-vnpay-Research-20260501-m7kt]]
