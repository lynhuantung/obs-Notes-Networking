---
Mã: pattern-redis-crash-windows-update
aliases: [Redis lỗi sau Windows Update]
date: 2026-04-19
tags: [pattern, redis, infra, windows-update]
type: pattern
layer: infra
status: confirmed
cases:
  - "[[Knowledge/case-studies/hrm/case-hrm-inoac-redis-crash]]"
  - "[[Knowledge/case-studies/hrm/case-hrm-vnpay-redis-crash]]"
Related:
  - "[[2-4 Dich vu Redis]]"
---

# Pattern: Redis crash sau Windows Update

## Triệu chứng
- Cache không hoạt động sau khi server được Windows Update
- Login lỗi / dữ liệu không load được
- Redis service bị stop tự động

## Nguyên nhân phổ biến
- Windows Update restart service tự động
- Redis service không được set `Startup Type: Automatic`
- Port bị firewall chặn sau update

## Phát hiện nhanh
```powershell
# Kiểm tra Redis service
Get-Service -Name Redis*

# Kiểm tra Redis có chạy không
redis-cli ping
# Kết quả mong đợi: PONG
```

## Fix an toàn
```powershell
# 1. Restart Redis
Start-Service Redis

# 2. Kiểm tra lại
redis-cli ping
```

## Phòng ngừa
- Set Redis service `Startup Type: Automatic`
- Thêm vào checklist sau mỗi lần Windows Update

## Cases liên quan
- [[Knowledge/case-studies/hrm/case-hrm-inoac-redis-crash]]
- [[Knowledge/case-studies/hrm/case-hrm-vnpay-redis-crash]]
