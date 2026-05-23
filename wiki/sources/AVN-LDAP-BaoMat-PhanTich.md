---
type: source
description: "Phân tích bảo mật LDAP/LDAPS cho AVN: đánh giá rủi ro, cấu hình SSL và khuyến nghị nâng cấp xác thực."
code: b3x9
domain: system
tags:
  - avn
  - ldap
  - ldaps
  - security
  - authentication
  - incident
created: 2026-05-04
updated: 2026-05-04
source-file: raw/Nghiệp vụ HRM/SYS/AVN-LDAP-BaoMat-PhanTich.md
related:
  - "[[wiki/projects/AVN-Project]]"
  - "[[wiki/flows/Flow-LDAP-Login]]"
  - "[[wiki/sources/Sys-TaiLieuLDAP-03]]"
  - "[[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]]"
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
---

# Source: AVN — LDAP không bảo mật: phân tích nguyên nhân và hướng xử lý

## Tóm tắt

Tài liệu ghi nhận và phân tích nguyên nhân IT khách hàng AVN yêu cầu tắt LDAP vì lý do bảo mật (2026-05-04). Vấn đề cốt lõi là **Standard LDAP (port 389) truyền credentials plain text** qua mạng — không phải lỗi code HRM mà là bản chất của protocol. Quan trọng hơn, HRM hiện tại **chưa có xử lý LDAPS** ở cả code lẫn UI (màn hình Nguồn LDAP chưa có field cấu hình SSL). Tài liệu đề xuất hướng xử lý ngắn/trung/dài hạn, bao gồm develop LDAPS mới hoàn toàn hoặc chuyển sang SSO.

## Key Takeaways

- **Nguyên nhân gốc rễ**: Standard LDAP (port 389) không mã hóa — password đi plain text trên wire. Đây là vấn đề protocol, không phải bug HRM
- **HRM chưa có LDAPS**: Code chưa xử lý SSL/TLS trong `LdapConnection`. Màn hình "Nguồn LDAP" chưa có field cấu hình SSL (port 636, certificate...)
- **AVN đã tắt LDAP**: IT áp dụng security policy cấm port 389 trong mạng doanh nghiệp — tắt là đúng theo chuẩn ngành
- **So sánh chuẩn ngành**: Standard LDAP = legacy, LDAPS (port 636, TLS) = recommended. Hệ thống lớn (Jira, GitLab, Jenkins) đã dùng LDAPS hoặc OIDC từ lâu
- **Hướng ngắn hạn**: Đề xuất khách hàng dùng SSO (ADFS/OIDC) nếu hạ tầng có sẵn
- **Hướng trung hạn**: Raise task phát triển LDAPS mới hoàn toàn — thêm field UI + fix code LdapConnection

## Trích dẫn quan trọng

> IT AVN áp dụng security policy: không cho phép port 389 (plain text) trong mạng doanh nghiệp. Tắt LDAP là biện pháp xử lý tạm thời trong khi chờ giải pháp thay thế.

> ⚠️ **Confirmed (2026-05-04)**: HRM hiện tại **chưa có xử lý LDAPS** ở cả code lẫn UI. Code chưa xử lý SSL/TLS trong `LdapConnection`. Màn hình "Nguồn LDAP" chưa có field/option cấu hình SSL.

> Đây là **vấn đề của protocol LDAP thuần** — không phải lỗi code HRM. Tuy nhiên HRM cần phát triển thêm để đáp ứng yêu cầu bảo mật hiện đại.

## Liên kết

- [[wiki/projects/AVN-Project]] — Dự án AVN (cập nhật trạng thái LDAP)
- [[wiki/flows/Flow-LDAP-Login]] — Flow cấu hình và đăng nhập LDAP HRM
- [[wiki/sources/Sys-TaiLieuLDAP-03]] — Tài liệu LDAP HRM, bảng Sys_LdapConfig
- [[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]] — Ghi nhận ban đầu câu hỏi LDAPS (2026-04-29)
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc xác thực tổng thể
