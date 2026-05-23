---
description: "Yêu cầu bảo mật đa lớp, Load Balancing, High Availability 24/7 và Disaster Recovery cho PTSC HRM: OWASP, AES-256, 2FA, HA clustering, DR site."
type: source
code: e3q9
tags:
  - "ptsc"
  - "bao-mat"
  - "high-availability"
  - "disaster-recovery"
  - "owasp"
domain: system
created: 2026-04-30
updated: 2026-04-30
source-file: raw/0. Daily/TaiLieuGiaiPhap/s4.7-*, s4.8-*, s4.9-*, s4.10-*, s4.11-*, s4.13-*, s4.14-*, s4.15-*
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/PTSC-TLG-KienTruc-NenTang]]"
  - "[[wiki/sources/VnPay-Security-Vulnerability-Oct2025]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
---

# Source: PTSC TaiLieuGiaiPhap — §4.7–4.15 Bảo Mật, HA & Disaster Recovery

## Tóm tắt

Phần §4.7–4.15 quy định yêu cầu bảo mật đa lớp (ứng dụng, DB, OS, mạng, hạ tầng), Load Balancing, High Availability (24/7/365) và Disaster Recovery cho hệ thống HRM PTSC. VnResource cam kết đáp ứng OWASP Top 10, 2FA cho nghiệp vụ nhạy cảm, AES-256 cho dữ liệu nhạy cảm, clustering HA, và DR site với RPO/RTO xác định.

## Key Takeaways

- **Bảo mật 5 lớp §4.7:** Ứng dụng → DB → OS → Mạng → Vật lý
- **§4.7.1 Application Security:** JWT + 2FA, chống XSS/SQLi/CSRF, kiểm soát truy cập theo chức năng và dữ liệu
- **§4.7.3 2FA:** secondary password cho nghiệp vụ nhạy cảm (lương, phê duyệt) — cấu hình per chức năng
- **§4.7.4 Obfuscation:** che giấu mã nguồn web; mobile chưa làm nhiễu nhưng dữ liệu mã hóa tại vùng an toàn
- **§4.8 DB Security:** AES-256 mã hóa dữ liệu nhạy cảm (CCCD, tài khoản NH, mật khẩu); hash SHA-256 + salt cho password; DB isolated (không expose Internet)
- **§4.10–4.11 Network:** HTTPS TLS 1.2/1.3, WAF OWASP rules, DMZ zone, firewall, Audit Trail tất cả thao tác
- **§4.13 Load Balancing:** Nginx/HAProxy, Round Robin/Least Connection, health check tự động loại node lỗi
- **§4.14 HA:** Clustering 24/7/365, multi-server song song, Load Balancer failover tự động
- **§4.15 DR:** DR site thứ 2, backup full + log, RPO/RTO xác định — phục vụ khôi phục khi mất site chính

## Trích dẫn quan trọng

> Hệ thống áp dụng cơ chế **mã hóa và băm (hashing) dữ liệu nhạy cảm**: mật khẩu dùng SHA-256 + salt; dữ liệu nhạy cảm khác (SĐT, tài khoản ngân hàng, CCCD) mã hóa **AES-256 symmetric** khi lưu DB.

> Hệ thống cho phép áp dụng **xác thực bổ sung (2FA)** đối với các nghiệp vụ nhạy cảm — người dùng nhập lại **mật khẩu xác minh riêng (secondary password)** trước khi hệ thống cho phép truy cập.

> Hệ thống được thiết kế đảm bảo **khả dụng cao (High Availability)**, hỗ trợ chạy **liên tục 24/7/365**. Khi một máy gặp sự cố, hệ thống tự động chuyển sang máy khác.

## Liên kết

- [[wiki/sources/PTSC-TLG-KienTruc-NenTang]] — §4.1–4.6 kiến trúc và hiệu năng
- [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — thực tế lỗ hổng VnPay 2025
- [[wiki/concepts/HRM-Security-Config]] — cấu hình bảo mật HRM hiện tại
- [[wiki/sources/PTSC-TLG-BaoMat-IAM]] — §3 OAuth2, IAM
