---
type: wiki-entity
tags:
  - ptsc
  - dau-thau
  - dau-khi
created: 2026-05-14
updated: 2026-05-14
description: "PTSC — Tổng Công ty Dịch vụ Kỹ thuật Dầu khí, prospect đấu thầu HRM 2026: 30 dataset, 30 interface ESB, kiến trúc 3-tier HA."
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/PTSC-TLG-PhamVi]]"
  - "[[wiki/sources/PTSC-TLG-KienTruc-NenTang]]"
---

# PTSC

> **Loại**: khach-hang (prospect)
> **Lĩnh vực**: Dầu khí — Dịch vụ kỹ thuật

---

## Thông tin chung

| Thông tin | Chi tiết |
|-----------|---------|
| Tên đầy đủ | Tổng Công ty Dịch vụ Kỹ thuật Dầu khí Việt Nam (PTSC) |
| Thuộc | Tập đoàn Dầu khí Việt Nam (PVN) |
| Lĩnh vực | Dịch vụ kỹ thuật dầu khí |
| Quy mô | Doanh nghiệp nhà nước quy mô lớn |
| Trạng thái | Prospect — đang đấu thầu 2026 |

---

## Dự án liên quan

- [[wiki/projects/PTSC-Project]] — Tài liệu giải pháp đấu thầu 2026: HRM đầy đủ + Data Platform + 30 interface ESB

---

## Đặc điểm kỹ thuật nổi bật

- **Tích hợp Data Platform**: 30 dataset → BI/AI/báo cáo
- **Tích hợp ESB**: 30 interface (REST/queue/file) qua trục ESB
- **Hạ tầng**: Kiến trúc 3-Tier HA: Nginx LB → 2 App Server → 2 DB Server Active/Passive
- **Bảo mật**: OAuth2/OIDC, mTLS, 2FA cho nghiệp vụ nhạy cảm, AES-256
- **DR**: DR site bắt buộc, RPO/RTO cam kết

---

## Ghi chú

- Tài liệu giải pháp được xây dựng tháng 04/2026 — 6 nhóm tài liệu, ingest vào wiki 30/04/2026
- So sánh với SSI: PTSC focus Data Platform ESB; SSI focus API integration + Security compliance

---

## Liên kết

- [[wiki/projects/PTSC-Project]] — Project page chi tiết
- [[wiki/sources/PTSC-TLG-PhamVi]] — Phạm vi tích hợp
- [[wiki/sources/PTSC-TLG-KienTruc-NenTang]] — Kiến trúc nền tảng
- [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] — Bảo mật, HA, DR
