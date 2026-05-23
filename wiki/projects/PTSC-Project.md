---
description: "Dự án PTSC (prospect 2026): triển khai HRM đầy đủ + tích hợp Data Platform ESB 30 interface, kiến trúc 3-tier HA cho dầu khí."
type: project
code: ptsc01
status: prospect
tags:
  - "ptsc"
  - "tich-hop"
  - "data-platform"
  - "esb"
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/sources/PTSC-TLG-PhamVi]]"
  - "[[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]]"
  - "[[wiki/sources/PTSC-TLG-BaoMat-IAM]]"
  - "[[wiki/sources/PTSC-TLG-Idempotent-Operations]]"
  - "[[wiki/sources/PTSC-TLG-KienTruc-NenTang]]"
  - "[[wiki/sources/PTSC-TLG-BaoMat-HA-DR]]"
---

# PTSC — Tài Liệu Giải Pháp Đấu 

## Tổng quan

**Khách hàng:** PTSC (Tổng Công ty Dịch vụ Kỹ thuật Dầu khí Việt Nam)  
**Trạng thái:** Prospect / Đấu  (tài liệu giải pháp 2026)  
**Phạm vi:** Triển khai HRM VnResource đầy đủ + tích hợp Data Platform/ESB quy mô lớn

## Phạm vi chính

| Hạng mục | Chi tiết |
|----------|---------|
| Phân hệ HRM | Đầy đủ (HRE, ATT, SAL, INS, TAL, TRA...) |
| Tích hợp Data Platform | 30 dataset → BI/AI/báo cáo |
| Tích hợp ESB | 30 interface (REST/queue/file) |
| Master Data Hub | HR là System of Record, Golden Employee ID |
| Tích hợp E-learning | 2 chiều (kế hoạch đào tạo + kết quả) |
| Tích hợp ERP | Chi phí nhân sự + ngân sách qua ESB |
| Hạ tầng | 5 servers HA, IaaS cloud option, DR site |

## Kiến trúc đề xuất

- **3-Tier:** Nginx LB → 2 App Server (.NET, stateless) → 2 DB Server (SQL Server Active/Passive)
- **ESB:** tất cả tích hợp qua trục ESB — không kết nối point-to-point
- **CDC:** Watermark + Version-based, hỗ trợ Delta Insert/Update/Delete
- **Bảo mật:** OAuth2/OIDC, mTLS, 2FA nghiệp vụ nhạy cảm, AES-256

## Yêu cầu kỹ thuật nổi bật

- Idempotent API + CorrelationId/TraceId end-to-end
- Retry controlled (backoff) + Dead Letter Queue
- Backfill/Replay theo Time Window (Late Arriving Data)
- HA 24/7/365 + DR site (RPO/RTO)
- Audit Trail tất cả thao tác người dùng + API

## Sources

- [[wiki/sources/PTSC-TLG-PhamVi]] — §1–2 phạm vi dịch vụ, tài liệu thiết kế
- [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] — §3 CDC, luồng 2 chiều, metadata
- [[wiki/sources/PTSC-TLG-BaoMat-IAM]] — §3 OAuth2, IAM, scope/role
- [[wiki/sources/PTSC-TLG-Idempotent-Operations]] — §3 idempotent, retry, reprocess
- [[wiki/sources/PTSC-TLG-KienTruc-NenTang]] — §4.1–4.6 kiến trúc, hiệu năng, auth
- [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] — §4.7–4.15 bảo mật, HA, DR
