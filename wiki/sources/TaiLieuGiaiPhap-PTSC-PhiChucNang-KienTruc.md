---
description: "Yêu cầu phi chức năng kiến trúc PTSC: 3-Tier on-premise, 10.000 user đồng thời, SSO/2FA, RBAC, .NET+React Native, SLA ≤3 giây 99%."
type: source
code: k9r4
tags:
  - "ptsc"
  - "non-functional"
  - "architecture"
  - "authentication"
  - "rbac"
  - "development"
domain: system
created: 2026-04-30
updated: 2026-04-30
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/sources/TaiLieuGiaiPhap-PTSC-KyThuat-TichHop]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# TaiLieuGiaiPhap PTSC — §4.1–4.9: Phi Chức Năng — Kiến Trúc, Auth, RBAC, Dev

> Covers: `s4.1-KienTruc-NenTang-HeThong`, `s4.2-HieuNang-KhaNangMoRong`, `s4.3-TaiKhoan-DangNhap-ChungThuc`, `s4.4-PhanQuyen-TaiKhoan-RBAC`, `s4.5-LapTrinh-PhatTrien-HT`, `s4.6-TichHop-HeThong`

## Tóm tắt

Phần §4.1–4.9 mô tả yêu cầu phi chức năng về kiến trúc hệ thống, hiệu năng, xác thực, phân quyền và năng lực phát triển của VnResource HRM cho PTSC. Hệ thống triển khai theo mô hình 3-Tier on-premise (5 server: 1 Proxy/LB, 2 App, 2 DB Active/Passive), hỗ trợ 10.000 user đồng thời, SSO/2FA, RBAC đa tầng, và được xây dựng trên .NET (C#) + React Native mobile + SQL Server.

## Key Takeaways

### §4.1 Kiến trúc nền tảng
- **3-Tier Architecture**: Presentation (Web/Mobile) → Application (.NET API, stateless) → Database (SQL Server)
- **Cấu hình server on-premise**: Proxy/LB (Linux Nginx, 4 Core/8GB), 2 App Server (Win 2019, 16 Core/64GB/240GB SSD), 2 DB Server (SQL 2019, 16 Core/128GB/512GB SSD)
- **HA kiến trúc**: App stateless → Redis session; DB Active/Passive AlwaysOn; Load Balancer health check failover
- **Multi-environment**: DEV → TEST → UAT → PRODUCTION (tách biệt hoàn toàn)
- **Monitoring**: Structured logging JSON; traceId/correlationId; Graylog/ELK/Prometheus+Grafana; exception middleware global
- **Cloud IaaS**: hỗ trợ AWS (EC2/K8s), S3 storage, RDS; scale-out linh hoạt
- **UTF-8**: toàn bộ DB + API + UI; NVARCHAR, collation Unicode
- **Cross-platform**: Web (Chrome/Edge/Firefox), Mobile (iOS 13+, Android 8.0+), React Native

### §4.2 Hiệu năng & Scalability
- **Benchmark JMeter**: 15 chức năng, 200 HR user + 15.000 nhân viên, 10.000 concurrent user
- **SLA**: ≤ 3 giây với 99% thao tác nghiệp vụ (không tính báo cáo, tìm kiếm lớn)
- **Scale-out**: thêm App Server sau Load Balancer; tinh chỉnh index/query/cache; nâng cấp phần cứng

### §4.3 Authentication
- **IdentityServer4**: Access Token (ngắn hạn) + Refresh Token; revoke qua Redis blacklist
- **SSO**: Azure AD, Okta, LDAP, ADFS — mô hình IdP-SP (hiện tại AD → HRM, chưa ngược lại)
- **2FA/OTP**: Google Authenticator; bật/tắt theo nghiệp vụ/role; log đầy đủ
- **Password policy**: 4 mức độ (đơn giản → rất phức tạp) cấu hình được; hash + salt
- **Multi-session**: cho phép đồng thời nhiều phiên; có thể giới hạn số phiên; revoke token ngay khi disable
- **Forgot password**: OTP email/SMS; thời hạn ngắn; dùng một lần; ghi log
- **Rate limit**: chống brute force; Serilog + Grafana audit login

### §4.4 RBAC
- **2 loại quyền**: quyền chức năng (màn hình/nút/tab) + quyền dữ liệu (theo đơn vị/phạm vi)
- **Nhóm quyền**: tạo nhóm → gán màn hình/nút → gán user
- **PrivilegeNumber bitwise**: hiệu quả, kiểm tra nhanh quyền chi tiết
- Tham chiếu chi tiết: [[wiki/sources/Sys-TaiLieuPhanQuyen-02]], [[wiki/architecture/HRM-SysDB-Schema]]

### §4.5 Development
- **Stack**: .NET (C#) + Visual Studio; SQL Server; React Native (iOS/Android) + VS Code + Firebase
- **Module hóa**: bổ sung chức năng không ảnh hưởng hệ thống hiện tại; live patching qua K8s
- **Báo cáo**: Excel, PDF/DOCX; real-time hoặc scheduled; gửi email tự động
- **Approval workflow**: đa tầng, cấu hình theo nghiệp vụ/chức danh; thông báo email + hệ thống
- **API REST/JSON**: import Master Data, nghiệp vụ; hỗ trợ Excel/CSV import
- **Personalization**: ẩn/hiện cột, cấu hình cá nhân lưu theo user; UI preset theo vai trò

### §4.6 Tích hợp hệ thống
- Cam kết tích hợp qua ESB; hỗ trợ REST, SOAP, Kafka/RabbitMQ, SFTP
- Tài liệu API đầy đủ; không kết nối point-to-point

## Trích dẫn quan trọng

> Hệ thống được thiết kế theo mô hình **3-Tier Architecture**, tách biệt rõ ràng các lớp: Presentation, Application và Database, đảm bảo **tính mở rộng, bảo mật và dễ bảo trì**

> Thời gian đáp ứng khi thực hiện các thao tác nghiệp vụ **≤ 03 giây** với **99%** các thao tác nghiệp vụ (không tính thao tác báo cáo, truy vấn, tìm kiếm, nhập dữ liệu số lượng lớn)

> Hệ thống được triển khai theo mô hình **multi-environment** gồm: DEV → TEST → UAT → PRODUCTION. Mỗi môi trường được **tách biệt hoàn toàn về hạ tầng, cấu hình và dữ liệu**

## Liên kết

- [[wiki/projects/PTSC-Project]]
- [[wiki/sources/TaiLieuGiaiPhap-PTSC-KyThuat-TichHop]] — §3 kỹ thuật tích hợp
- [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhiChucNang-BaoMat-HA]] — §4.10–4.15 bảo mật và HA
- [[wiki/architecture/HRM-System-Architecture]]
- [[wiki/architecture/HRM-Auth-Architecture]]
- [[wiki/sources/Sys-TaiLieuPhanQuyen-02]] — chi tiết RBAC
