---
description: "Phạm vi dịch vụ tích hợp PTSC: 30 dataset, 30 interface ESB, HR Master Data Hub, KPI Catalog, Dimension Model và Crosswalk ID mapping."
type: source
code: t5p3
tags:
  - "ptsc"
  - "tich-hop"
  - "data-platform"
  - "esb"
domain: system
created: 2026-04-30
updated: 2026-04-30
source-file: raw/0. Daily/TaiLieuGiaiPhap/s1-*, s2-*, s2a-*, s2b-*
related:
  - "[[wiki/projects/PTSC-Project]]"
  - "[[wiki/concepts/Net8-Migration]]"
---

# Source: PTSC TaiLieuGiaiPhap — §1–2 Phạm Vi Dịch Vụ & Tài Liệu Thiết Kế

## Tóm tắt

Bộ tài liệu giải pháp VnResource HRM gửi PTSC (Tổng Công ty Dịch vụ Kỹ thuật Dầu khí), viết năm 2026. Phần §1–2 mô tả phạm vi dịch vụ tích hợp tuỳ chọn: 30 dataset lên Data Platform, 30 interface ESB, Master Data Hub nhân sự, tích hợp E-learning và ERP. §2 quy định các tài liệu thiết kế bắt buộc: Business Blueprint, API Catalog, Data Contract, KPI Catalog, Dimension Model, Crosswalk ID mapping.

## Key Takeaways

- **30 dataset** lên Data Platform (BI/AI/báo cáo) — mỗi dataset gồm 9 bước từ khảo sát đến tài liệu vận hành
- **30 interface** ESB (REST/ESB flow/file/queue) — đơn giá tính per interface theo mức thay đổi mapping
- **HR Master Data Hub**: HRM là System of Record, đồng bộ RBAC toàn hệ sinh thái qua ESB event-driven, không thay đổi DB hiện hữu
- **Identity Mapping Service**: Golden Employee ID dùng chung — mapping HRM↔ERP↔E-learning↔CMMS
- **Tài liệu bắt buộc sau Khảo sát–Thiết kế:** Blueprint quy trình + Technical Design Package (Integration Flow, DFD, Data Contract, API Spec)
- **KPI Catalog** chuẩn: Headcount, Turnover Rate, Training Completion Rate, Labor Cost Ratio — mỗi KPI có Source Dataset + Calculation Formula
- **Dimension model**: 9 dimension chuẩn (Employee, Organization, Position, Cost Center, Project, Training, Time, Contract, Certificate) — star schema ready
- **Crosswalk Table**: mapping OrganizationID/UserID/ProjectID… giữa HRM và Master Data PTSC, hỗ trợ PENDING/ACTIVE/INACTIVE states

## Trích dẫn quan trọng

> Nhà  cam kết triển khai tối thiểu **30 interface tích hợp** giữa Phần mềm và các hệ thống liên quan của PTSC thông qua các cơ chế tích hợp chuẩn như REST API, ESB integration flow, message queue và file-based integration.

> HRM được thiết kế theo mô hình **HR Master Data Hub** tích hợp ESB và SSO theo kiến trúc event-driven và loosely-coupled integration architecture, cho phép PTSC triển khai cơ chế RBAC tập trung trên toàn hệ sinh thái ứng dụng mà không cần thay đổi các hệ thống hiện hữu.

> Tất cả kết nối giữa HRM và các hệ thống khác đều đi theo mô hình **HRM ↔ ESB ↔ Hệ thống đích**. Không triển khai kết nối trực tiếp point-to-point.

## Liên kết

- [[wiki/projects/PTSC-Project]] — Dự án PTSC tổng quan
- [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] — §3 kỹ thuật tích hợp
- [[wiki/sources/PTSC-TLG-BaoMat-IAM]] — §3 bảo mật IAM
- [[wiki/sources/SaaS-VnR-Meetings-2023-2024]] — nền tảng SaaS VnR liên quan
