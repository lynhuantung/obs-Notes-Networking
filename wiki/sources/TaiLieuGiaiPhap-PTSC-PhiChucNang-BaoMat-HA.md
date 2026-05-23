---
description: "Yêu cầu phi chức năng bảo mật PTSC: AES-256, OWASP đa lớp, 2FA, audit log JSON có cấu trúc, HA 24/7, DR site và SIEM integration."
type: source
code: b5w1
tags:
  - "ptsc"
  - "non-functional"
  - "security"
  - "high-availability"
  - "disaster-recovery"
  - "audit-log"
domain: system
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/TaiLieuGiaiPhap-PTSC-PhiChucNang-KienTruc]]"
  - "[[wiki/sources/VnPay-Security-Vulnerability-Oct2025]]"
---

# TaiLieuGiaiPhap PTSC — §4.10–4.15: Phi Chức Năng — Bảo Mật, LB, HA, DR

> Covers: `s4.7-BaoMat-LopUngDung`, `s4.8-BaoMat-LopDatabase`, `s4.9-BaoMat-LopOS`, `s4.10-BaoMat-LopMang-HaTang`, `s4.11-KiemSoat-TruyCap-AuditLog`, `s4.13-CanBangTai-LoadBalancing`, `s4.14-HighAvailability`, `s4.15-DisasterRecovery`

## Tóm tắt

Phần §4.7–4.15 trình bày yêu cầu phi chức năng về bảo mật đa lớp (application, database, OS, network), kiểm soát truy cập, audit logging, load balancing, high availability 24/7/365, và disaster recovery. VnResource cam kết tuân thủ các chuẩn bảo mật OWASP, mã hóa AES-256, log JSON có cấu trúc với correlationId, SIEM integration, HA clustering, và DR site.

## Key Takeaways

### §4.7 Bảo mật lớp ứng dụng
- **Bảo mật đa lớp**: Application → Database → OS → Network → Physical (5 lớp)
- **Chống OWASP**: XSS, SQL Injection, CSRF — WAF + input sanitization
- **Network security**: HTTPS xuyên suốt; tách lớp web/API/database; Admin qua VPN/IP whitelist; Dev không truy cập production trực tiếp
- **2FA nghiệp vụ nhạy cảm**: secondary password cho lương, phê duyệt; bật/tắt theo chức năng/role
- **Code security**: che giấu mã nguồn; mobile: mã hóa dữ liệu local + vùng lưu trữ an toàn OS

### §4.8 Bảo mật lớp Database
- **Mã hóa dữ liệu nhạy cảm**: AES-256 + KMS/HSM; mật khẩu hash + salt (SHA-256+)
- **Cô lập CSDL**: DB không expose Internet; tài khoản kết nối hạn chế quyền
- **Ghi log DB**: toàn bộ thao tác → audit trail; xuất dữ liệu ghi log

### §4.9 Bảo mật lớp OS
- Hardening OS; kiểm soát truy cập máy chủ; patch management
- Giới hạn user/process chạy ứng dụng; không dùng root

### §4.10 Bảo mật lớp mạng & hạ tầng
- **WAF**: lọc OWASP attacks; rule theo URL/API
- **Firewall + IDS/IPS**: phát hiện tấn công
- **TLS 1.2/1.3**: toàn bộ kết nối; certificate hợp lệ CA; cipher mạnh
- **Tách DMZ/Internal**: reverse proxy terminate SSL; không expose DB

### §4.11 Kiểm soát truy cập & Audit Log
- **Session monitoring**: theo dõi phiên đang hoạt động; admin chủ động đóng phiên; thống kê thời gian sử dụng
- **Structured log JSON bắt buộc**: timestamp, system/component, environment, log level, request id/correlation id/trace id, mã lỗi
- **Log masking**: không log dữ liệu nhạy cảm (mật khẩu, token, CCCD) ở dạng rõ; masking/redaction
- **SIEM integration**: kết nối API gửi log + cảnh báo ra hệ thống PTSC; phát hiện hành vi bất thường
- **Rule-based alerting**: tương quan sự kiện phát hiện rủi ro an ninh; gửi alert qua email/dashboard

### §4.13 Load Balancing
- **Nginx/HAProxy/Ocelot**: Round Robin / Least Connection; SSL termination; health check tự động loại node lỗi
- **App stateless**: session qua Redis; horizontal scaling; failover tự động

### §4.14 High Availability
- **24/7/365**: cluster nhiều app server; auto-failover khi node down
- **Network HA**: thiết bị dự phòng tự động chuyển
- **Storage HA**: DB AlwaysOn Active/Passive; đồng bộ dữ liệu; không mất dữ liệu

### §4.15 Disaster Recovery
- **DR site**: backup định kỳ sang site thứ 2; phục hồi khi mất site chính; RPO/RTO xác định
- Thiết kế mở rộng: đồng bộ dữ liệu multi-site, replication trong tương lai
- Backup: full + log; lịch backup theo cấu hình; restore test định kỳ

## Trích dẫn quan trọng

> **Mã hóa dữ liệu trong cơ sở dữ liệu:** Toàn bộ dữ liệu nhạy cảm được mã hóa bằng thuật toán **AES-256** và bảo vệ thông qua hệ thống quản lý khóa tập trung (KMS) hoặc HSM để đảm bảo rằng chỉ có những người có quyền hạn mới có thể truy cập

> Log tích hợp/API phải theo định dạng có cấu trúc **(khuyến nghị JSON)** và bắt buộc có tối thiểu: **timestamp, system/component, environment, log level, request id/correlation id/trace id, mã lỗi**

> Log **không được chứa dữ liệu nhạy cảm** (mật khẩu, token, số định danh nhạy cảm...) ở dạng rõ; phải có cơ chế **masking/redaction**

> Hệ thống được thiết kế đảm bảo **khả dụng cao (High Availability)** — hỗ trợ chạy **liên tục 24/7/365**

## Liên kết

- [[wiki/projects/PTSC-Project]]
- [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhiChucNang-KienTruc]] — §4.1–4.9 kiến trúc + auth
- [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] — security pentest thực tế VnPay
- [[wiki/sources/AVN-Security-Vulnerability-2025]] — security Sonar AVN
- [[wiki/architecture/HRM-System-Architecture]]
