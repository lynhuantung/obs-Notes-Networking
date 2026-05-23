---
description: "Dự án AVN: khách hàng sử dụng LDAP, đang nghiên cứu nâng cấp bảo mật lên LDAPS, trạng thái active năm 2026."
type: wiki-project
tags:
  - avn
  - ldap
  - ldaps
  - authentication
created: 2026-04-29
updated: 2026-05-06
status: active
related:
  - "[[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]]"
  - "[[wiki/sources/AVN-Security-Vulnerability-2025]]"
  - "[[wiki/sources/Sys-TaiLieuLDAP-03]]"
  - "[[wiki/flows/Flow-LDAP-Login]]"
  - "[[wiki/sources/AVN-LDAP-BaoMat-PhanTich]]"
---

# Dự án AVN

> **Khách hàng**: AVN
> **Giai đoạn**: Đang triển khai (active)
> **Phân hệ triển khai**: Chưa rõ đầy đủ — ghi nhận ban đầu từ vấn đề phiếu lương + LDAPS

---

## Tổng quan dự án

| Thông tin | Chi tiết |
|-----------|---------|
| Tên dự án | AVN |
| Khách hàng | AVN |
| PM / BA | Chưa ghi nhận |
| Bắt đầu | Chưa ghi nhận |
| Go-live dự kiến | Chưa ghi nhận |
| Phân hệ | Phiếu lương (SAL), Hệ thống (SYS / Authentication) |

---

## Trạng thái hiện tại

- Đang triển khai.
- Phát sinh yêu cầu chuyển từ LDAP → LDAPS (bảo mật).
- Đang khảo sát HRM có hỗ trợ LDAPS chưa.

---

## Cấu hình đặc biệt / Yêu cầu riêng

- **LDAPS**: Khách hàng yêu cầu dùng LDAPS thay LDAP vì lý do bảo mật (port 636, SSL).
- **Confirmed (2026-05-04)**: HRM chưa có xử lý LDAPS ở cả code (`LdapConnection`) lẫn UI (màn hình Nguồn LDAP chưa có field SSL).
- **Resolved (2026-05-06)**: Đã implement LDAPS — sửa Framework `LdapHelper.cs` + thêm `Connectiontype` (StandardLDAP/LDAPSSL) vào HRM config. Chi tiết: [[wiki/sources/ldap1-avn-ldaps-implementation-2026-05-06]]

---

## Vấn đề & Rủi ro

| Vấn đề | Trạng thái | Ghi chú |
|--------|-----------|---------|
| User `trinh_ttt` không vào được phiếu lương, báo sai mật khẩu | Đang xử lý | Nghi liên quan LDAP |
| HRM có hỗ trợ LDAPS chưa? | 🔴 Confirmed chưa có | Code + UI chưa implement LDAPS |
| LDAP bị tắt tại AVN | ✅ Resolved | IT policy cấm port 389 — đã implement LDAPS |
| HRM có hỗ trợ LDAPS chưa? | ✅ Resolved (2026-05-06) | Đã implement: Framework + HRM source |
| Chưa có tài khoản test LDAPS | 🟡 Pending | Chờ deploy AVN để test thực tế |

---

## Bảo mật

- Phát hiện 9 lỗ hổng qua SonarQube (09–10/2025): 4 Critical (hardcoded secrets + CSP), 5 High (TLS/SSL, AES, KDF).
- Đáng chú ý: CWE-295 (SSL cert validation) xuất hiện 2 lần trên 2 module khác nhau (Hệ thống + UHelp SSF).
- Chi tiết: [[wiki/sources/AVN-Security-Vulnerability-2025]]

## Lessons Learned

*(Chưa có — dự án đang active)*

---

## Liên kết

- [[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]] — Câu hỏi triển khai: HRM hỗ trợ LDAPS?
- [[wiki/sources/AVN-LDAP-BaoMat-PhanTich]] — Phân tích nguyên nhân LDAP không bảo mật + hướng xử lý (2026-05-04)
- [[wiki/sources/ldap1-avn-ldaps-implementation-2026-05-06]] — Implementation LDAPS hoàn chỉnh (2026-05-06)
- [[wiki/sources/AVN-Security-Vulnerability-2025]] — Báo cáo bảo mật AVN 2025: 9 lỗ hổng Sonar (CWE-798, CWE-295, CWE-1021...)
- [[wiki/sources/Sys-TaiLieuLDAP-03]] — Tài liệu LDAP HRM, bảng Sys_LdapConfig
- [[wiki/flows/Flow-LDAP-Login]] — Workflow đăng nhập LDAP
