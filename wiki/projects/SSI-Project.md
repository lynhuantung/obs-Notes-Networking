---
type: wiki-project
tags:
  - ssi
  - dau-thau
  - hrm
created: 2026-05-13
updated: 2026-05-13
description: "Đấu thầu triển khai HRM cho SSI (Chứng khoán SSI) — VnResource HRM Pro, yêu cầu kỹ thuật toàn diện 2025"
status: planning
related:
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]]"
  - "[[wiki/sources/q3r6t-ssi-api-spec]]"
  - "[[wiki/sources/j5k9w-ssi-security-requirements]]"
  - "[[wiki/projects/PTSC-Project]]"
---

# SSI — Đấu thầu HRM Pro

> **Khách hàng**: SSI (Công ty Cổ phần Chứng khoán SSI)
> **Giai đoạn**: Planning / Đấu thầu
> **Phân hệ triển khai**: Toàn bộ (Nhân sự, Lương, Chấm công, BH, Tuyển dụng, Đào tạo, KPI, Ký số)

---

## Tổng quan dự án

| Thông tin | Chi tiết |
|-----------|---------|
| Tên dự án | VnResource HRM Pro cho SSI |
| Khách hàng | Công ty CP Chứng khoán SSI |
| Loại | Đấu thầu (Tender) |
| Tên tài liệu | TLGP.HeThong — Tài liệu Giải pháp Kỹ thuật |
| Phân hệ | HRM đầy đủ (8+ phân hệ) |
| Deployment options | On-cloud hoặc On-premise (SSI chọn) |
| Tech stack | Angular 19, .NET 8, SQL Server 2019, Redis, Docker/K8s |

---

## Trạng thái hiện tại

- Đang ở giai đoạn chuẩn bị hồ sơ thầu (2026-05-13)
- Tài liệu giải pháp kỹ thuật đã được xây dựng đầy đủ (183 file)
- Chưa có kết quả trúng thầu

---

## Yêu cầu đặc thù SSI

### Tích hợp hệ thống nội bộ SSI
- **SSO**: Azure AD / Microsoft Entra ID (bắt buộc)
- **API đẩy vào SSI**: Xuất chứng từ kế toán (6.3.10) — tích hợp hệ thống nội bộ SSI
- **ECM**: Tích hợp file với hệ thống quản lý file tập trung

### API yêu cầu (24 endpoints — xem chi tiết [[wiki/sources/q3r6t-ssi-api-spec]])
- **GET (14 APIs)**: org structure, nhân viên, ứng viên, chức danh, bảng công, chi phí lương, phiếu lương (mã hóa), cấu hình ca/holiday, loại nghỉ, danh sách nghỉ/OT, quỹ phép, quyết toán thôi việc, ESOP, hạn mức tuyển dụng
- **POST/PUT (10 APIs)**: cập nhật nghỉ phép, thông tin cá nhân, uỷ quyền quyết toán thuế, kết quả HQCV, học tập/giảng dạy, kỳ thi, KPI đào tạo, đề xuất tuyển dụng

### Bảo mật nâng cao
- MFA bắt buộc toàn bộ tài khoản
- Data masking: CMND/CCCD, số tài khoản ngân hàng, mức lương
- Tuân thủ NĐ 13/2023/NĐ-CP + ISO 27001 + Luật ANM 2025
- SSDLC + Pentest định kỳ

### Hạ tầng Production
- 2 App Server: Windows Server 2019, 16 cores, 64GB RAM
- 2 DB Server Active/Passive: SQL Server 2019 Std+, 16 cores, 128GB RAM
- Nginx LB + WAF
- Fiber kết nối 1Gbps

---

## Cấu hình đặc biệt / Yêu cầu riêng

- Phiếu lương mã hóa (6.2.7) — không trả về plain text
- Tích hợp SSO Azure AD — đồng bộ trạng thái user disabled/deleted trong vòng 1h
- DR drill định kỳ có bằng chứng
- Approval gate bắt buộc trước khi deploy Production
- SLA patch: Critical ≤ 72h, High ≤ 7 ngày, Medium ≤ 30 ngày

---

## Vấn đề & Rủi ro

| Vấn đề | Trạng thái | Ghi chú |
|--------|-----------|---------|
| SSI yêu cầu on-cloud hoặc on-premise | Chờ quyết định | Ảnh hưởng cấu hình hạ tầng (Ch.3.1 vs Ch.3.2) |
| MFA bắt buộc — HRM hiện tại đã có? | Cần verify | Xem [[wiki/architecture/2FA-IDS4-Architecture]] |
| ESOP API (6.2.13) | Cần confirm | Module ESOP có trong HRM hiện tại không? |

---

## Lessons Learned

- Hồ sơ thầu SSI chi tiết hơn PTSC: có Ch.9 bảo mật riêng (47 items), Ch.6 API spec cụ thể từng endpoint
- Pattern tương tự [[wiki/projects/PTSC-Project]] nhưng SSI focus nhiều hơn vào API integration và security compliance

---

## Liên kết

- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] — Source hồ sơ thầu tổng thể
- [[wiki/sources/q3r6t-ssi-api-spec]] — API spec chi tiết Ch.6
- [[wiki/sources/j5k9w-ssi-security-requirements]] — Bảo mật Ch.9
- [[wiki/sources/v7m2p-ssi-devops-requirements]] — DevOps Ch.7
- [[wiki/sources/f8c4n-ssi-infrastructure-requirements]] — Hạ tầng Ch.10
- [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] — Kiến trúc giải pháp Ch.8
- [[wiki/projects/PTSC-Project]] — Dự án thầu tương tự
