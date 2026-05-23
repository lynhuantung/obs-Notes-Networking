---
type: wiki-entity
tags:
  - ssi
  - dau-thau
  - chung-khoan
  - tai-chinh
created: 2026-05-14
updated: 2026-05-14
description: "SSI — Công ty CP Chứng khoán SSI, đấu thầu HRM Pro 2026: 183 file yêu cầu, 47 mục bảo mật, 24 API endpoints, MFA bắt buộc."
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
---

# SSI (Chứng khoán SSI)

> **Loại**: khach-hang (prospect)
> **Lĩnh vực**: Tài chính — Chứng khoán

---

## Thông tin chung

| Thông tin | Chi tiết |
|-----------|---------|
| Tên đầy đủ | Công ty Cổ phần Chứng khoán SSI |
| Lĩnh vực | Chứng khoán — một trong những CTCK lớn nhất Việt Nam |
| Kiểm soát pháp lý | UBCK, ISO 27001, Luật ANM 2025, NĐ 13/2023 |
| Trạng thái | Prospect — đang chuẩn bị hồ sơ thầu (05/2026) |
| Deployment | On-cloud hoặc On-premise (SSI chọn) |

---

## Dự án liên quan

- [[wiki/projects/SSI-Project]] — Đấu thầu HRM Pro, 183 file tài liệu giải pháp

---

## Yêu cầu đặc thù

| Hạng mục | Chi tiết |
|----------|---------|
| Phân hệ | HRM đầy đủ: HRE, SAL, ATT, INS, REC, TRN, KPI, Ký số |
| Tech stack | Angular 19, .NET 8, SQL Server 2019, Redis Sentinel, K8s |
| API | 24 endpoints hai chiều (14 GET + 10 POST/PUT) |
| SSO | Azure AD / Microsoft Entra ID bắt buộc |
| MFA | Bắt buộc toàn bộ tài khoản |
| Bảo mật | 47 items Ch.9 — financial-grade (OWASP ASVS Level 2+) |
| Hạ tầng | 5-server topology: 1 Nginx + 2 App (16c/64GB) + 2 DB (16c/128GB) |
| SLA patch | Critical ≤ 72h, High ≤ 7 ngày |

---

## Gap kỹ thuật cần xác nhận

- 🔴 Module ESOP (API 6.2.13) — chưa xác nhận HRM có chưa
- 🔴 MFA + Azure AD sync trong 1h — IDS4 có đủ capability không?
- 🔴 Database schema rollback tự động — hiện manual hay automated?

---

## Ghi chú

- Hồ sơ thầu SSI chi tiết hơn PTSC: có Ch.9 Security riêng (47 items) + Ch.6 API spec từng endpoint
- Benchmark với [[wiki/entities/PTSC]]: PTSC focus ESB/Data Platform; SSI focus API integration + Security compliance

---

## Liên kết

- [[wiki/projects/SSI-Project]] — Project page đầy đủ
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Hồ sơ thầu tổng thể
- [[wiki/sources/q3r6t-ssi-api-spec]] — API spec 24 endpoints
- [[wiki/sources/j5k9w-ssi-security-requirements]] — Bảo mật Ch.9
- [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] — Kiến trúc giải pháp
