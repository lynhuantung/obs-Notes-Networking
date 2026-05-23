---
description: "Mục lục toàn bộ wiki HRM: danh sách các trang entities, projects, flows, sources, concepts — đọc trước khi query hay ingest."
type: index
date-updated: 2026-05-23
last-analyzed: 2026-04-29
---

# Wiki Index

> Đây là trang LUÔN đọc đầu tiên. Danh mục toàn bộ wiki — dùng để tìm trang liên quan trước khi query hay ingest.

---

## Flows (Quy trình nghiệp vụ)

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|---------| 
| [[wiki/flows/Flow-TinhLuong-Monthly]] | Quy trình tính lương tháng: Chấm công → BH → Lương → C70 → Báo cáo | 2026-04-26 |
| [[wiki/flows/Flow-KhaiBaoiBHXH]] | Quy trình khai báo BHXH điện tử: D02-TS lên cổng iBHXH hàng tháng | 2026-04-26 |
| [[wiki/flows/Flow-Deploy-HRM]] | Quy trình deploy/upbuild + warmup IIS và Kubernetes | 2026-04-26 |
| [[wiki/flows/Flow-UAT-Process]] | Quy trình UAT: đào tạo → test → fix → sign-off → go-live | 2026-04-26 |
| [[wiki/flows/Flow-Onboarding-NhanVien]] | Quy trình onboarding nhân viên mới vào HRM | 2026-04-26 |
| [[wiki/flows/Flow-BaoHiem-Monthly]] | Luồng phân tích BH hàng tháng: INS01 chuỗi giá trị, ON/OFF thai sản, lỗi phân tích | 2026-04-27 |
| [[wiki/flows/Flow-Bitex-Phases]] | Sơ đồ 5 giai đoạn dự án Bitex-AKW: Khảo sát → Cài đặt → Đào tạo → UAT → Golive | 2026-04-27 |
| [[wiki/flows/Flow-QuickPack-Phases]] | Sơ đồ 6 giai đoạn dự án QuickPack QPVN + Build Management sequence | 2026-04-27 |
| [[wiki/flows/Flow-PhanQuyen-HeThong]] | Phân quyền SYS: 2 loại quyền, tạo nhóm, gán user, PrivilegeNumber bitwise | 2026-04-27 |
| [[wiki/flows/Flow-ResetPassword]] | Bảo mật đăng nhập, đổi mật khẩu, quên mật khẩu (4 bước) | 2026-04-27 |
| [[wiki/flows/Flow-LDAP-Login]] | Cấu hình và đăng nhập LDAP/Active Directory HRM | 2026-04-27 |
| [[wiki/flows/Flow-2FA-Login]] | Thiết lập 2FA, đăng nhập TOTP, recovery code, vô hiệu hóa/reset | 2026-05-04 |
| [[wiki/flows/Flow-TinhCong-ATT]] | Luồng tính công ATT 8 bước: đồng bộ → ca → trễ/sớm/OT → tổng hợp → bảng công → duyệt → khóa → lương | 2026-05-10 |
| [[wiki/flows/Flow-DaoTao-DevMoi-HRM]] | Lộ trình 3 module đào tạo developer mới: kiến trúc 4 tầng, Search/Excel/Delete, CRUD popup | 2026-05-05 |
| [[wiki/flows/f2m8t-catbank-system-flow]] | Luồng hệ thống CatBank: Search AJAX→Cat_GetDataController, Save/Delete→Cat_BankController Web API, 5 bước | 2026-05-05 |
| [[wiki/flows/k8d2p-flow-deploy-k8s-hrm]] | Quy trình deploy HRM lên K8s: CI (VNR build) vs CD (khách hàng deploy), luồng UAT + Production với mã bước | 2026-05-07 |
| [[wiki/flows/m3t7x-flow-cicd-deploy-k8s]] | Luồng CI/CD triển khai K8s: VNR build image → KH scan security → KH deploy, rollback plan | 2026-05-07 |
| [[wiki/flows/r5n8q-flow-integration-thirdparty]] | Luồng third-party gọi HRM integration API: IP whitelist → validate creds/scope → 200 JSON | 2026-05-07 |
| [[wiki/flows/v2k9m-flow-golive-k8s]] | Quy trình go-live K8s 7 phase: hạ tầng → kết nối → domain → deploy → cấu hình → loadtest → ANSP | 2026-05-07 |
| [[wiki/flows/p7m3k-flow-sso-microsoft-umc]] | Luồng SSO Microsoft OAuth2/OIDC cho UMC: Azure App Reg → IDS4 → email guard 403 | 2026-05-14 |

---

## Architecture (Kiến trúc hệ thống)

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|---------| 
| [[wiki/architecture/HRM-System-Architecture]] | Kiến trúc tổng quan: IIS vs K8s, 13 services VnPay, luồng request | 2026-04-26 |
| [[wiki/architecture/HRM-Auth-Architecture]] | Kiến trúc xác thực: JWT SSO, Identity Server 4, VnrDecrypt, RBAC | 2026-04-26 |
| [[wiki/architecture/HRM-Database-Architecture]] | Kiến trúc database: SQL Server, CLR, Memory Optimized, MAXDOP | 2026-04-26 |
| [[wiki/architecture/HRM-Deployment-Architecture]] | Kiến trúc deploy: IIS config, K8s, multi-tenant, S3, warmup | 2026-04-26 |
| [[wiki/architecture/INS-Database-Schema]] | Database schema phân hệ INS: 20+ bảng, mapping V6→V8, tỉ lệ BH, enum chứng từ | 2026-04-27 |
| [[wiki/architecture/INS-Architecture]] | Architecture đầy đủ phân hệ INS: 72 bảng, 4 layer, phần tử BH, cấu hình | 2026-04-27 |
| [[wiki/architecture/HRM-SysDB-Schema]] | Schema 8 bảng SYS: UserInfo, Group, Resource, GroupPermission2, DataPermission | 2026-04-27 |
| [[wiki/architecture/SaaS-MultiTenant-Architecture]] | Kiến trúc HRM SaaS multi-tenant 2023: DB-per-tenant, Redis key namespace, K8s v1/v2, IdentityServer4 | 2026-05-02 |
| [[wiki/architecture/2FA-IDS4-Architecture]] | Kiến trúc 2FA trên IDS4: TOTP component, Recovery Code, backend security, token flow | 2026-05-04 |
| [[wiki/architecture/k9r2b-catbank-mvc-architecture]] | Kiến trúc 4 tầng màn hình CatBank: MVC Controller, Web API, Entity, Model — màn hình mẫu đào tạo dev | 2026-05-05 |
| [[wiki/architecture/p9k2w-k8s-hrm-service-architecture]] | Kiến trúc 8 service HRM trên K8s: 2 network zones, service mesh, VM sizing PROD, external dependencies | 2026-05-07 |
| [[wiki/architecture/ATT-Database-Schema]] | Schema 5 bảng ATT: Cat_GradeCfg, Att_AnnualLeave/Detail, Att_AttendanceTable/Item — quan hệ và nhóm field | 2026-05-10 |
| [[wiki/architecture/m4n8b-ssi-kien-truc-giai-phap]] | Kiến trúc SSI: multi-tier SOA, 5-server topology, Integration layer, DB Active/Passive | 2026-05-13 |
| [[wiki/architecture/mm9x--memory-monitor]] | Kiến trúc Sys_MemoryMonitor: static field scanner, GC diagnostics, multi-pod collection, snapshot/compare, xóa field từ xa | 2026-05-20 |

---

## Glossary (Từ điển thuật ngữ)

| Trang                          | Mô tả ngắn                                                          | Cập nhật   |
| ------------------------------ | ------------------------------------------------------------------- | ---------- |
| [[wiki/glossary/HRM-Glossary]] | Từ điển đầy đủ: BH (BHXH/BHYT/BHTN), D02/C70, SE/BA/QC, IIS, CLR... | 2026-04-26 |
| [[glossary]]                   | Phụ lục các nghiệp vụ                                               |            |

---

## API

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|---------| 
| [[wiki/api/HRM-API-Excel-Integration]] | HRM API → Excel: Bearer token Power Query, SQL direct, Store Procedure | 2026-04-27 |

---

## Bugs (Lỗi đã biết)

> Tra mục này trước khi kết luận về lỗi — tránh suy đoán lại những gì đã có root cause.

→ Xem [[wiki/bugs/_index]] — Open/Resolved theo module, root cause 1 dòng

> **Ins029** (2026-05-05): `DeleteInsuranceMonthly` thiếu guard `Status != E_CONFIRMED` → xóa nhầm dòng NV nghỉ việc tháng N+1

---

## Decision Log (Quyết định quan trọng)

> Tra mục này khi cần chọn phương án kỹ thuật/nghiệp vụ — ưu tiên ngữ cảnh HRM thực tế hơn lý thuyết.

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|----------|
| [[wiki/decision-log/2026-06-19-redis-sentinel-vnpay]] | Chọn Redis Sentinel thay Standalone/Cluster cho VnPay — ràng buộc 3 node, cần HA | 2026-05-01 |

---

## Projects

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|---------| 
| [[wiki/projects/VnPay-Project]] | Triển khai HRM đầy đủ + .NET 8 cho VnPay — Kubernetes, 13 services, tích hợp MISA | 2026-04-25 |
| [[wiki/projects/TrungDong-Project]] | Triển khai HRM cho Trung Đông | 2026-04-25 |
| [[wiki/projects/HongNgoc-Project]] | Nâng cấp phân hệ Đánh giá, SSO JWT | 2026-04-25 |
| [[wiki/projects/Bitex-Project]] | Triển khai HRM Bitex-AKW 2025-2026: 2 hợp đồng 1 hệ thống, golive 01/12/2025, hỗ trợ vận hành | 2026-04-27 |
| [[wiki/projects/QuickPack-Project]] | Triển khai HRM QPVN 8 phân hệ + .NET Core, golive 01/12/2025, rủi ro thiếu SE thực tế | 2026-04-27 |
| [[wiki/projects/AVN-Project]] | Triển khai HRM AVN — đang active, yêu cầu LDAPS thay LDAP (bảo mật) | 2026-04-29 |
| [[wiki/projects/Marico-Project]] | Modify đánh giá hợp đồng (9 tasks), archived 2024 | 2026-04-25 |
| [[wiki/projects/LTG-Project]] | Phase 3 post-UAT: kiêm nhiệm đa pháp nhân, INS ca 24h, TAL đầy đủ | 2026-04-27 |
| [[wiki/projects/PTSC-Project]] | Prospect đấu thầu 2026: 30 dataset, 30 interface ESB, kiến trúc 3-Tier HA, bảo mật 5 lớp | 2026-04-30 |
| [[wiki/projects/SSI-Project]] | Đấu thầu HRM Pro cho SSI — .NET 8/K8s, 24 API endpoints, MFA, security enterprise-grade | 2026-05-13 |
| [[wiki/projects/UMC-Project]] | Triển khai SSO Microsoft OAuth2/OIDC cho HRM tại UMC — Azure App Registration + Identity IDS4 | 2026-05-14 |

---

## Entities

| Trang | Loại | Mô tả ngắn |
|-------|------|-----------|
| [[wiki/entities/Hai.NguyenNgoc]] | Nhân sự | Chuyên lương & đánh giá, đang làm TrungDong |
| [[wiki/entities/Minh.NguyenVan]] | Nhân sự | Nguồn lực dự án |
| [[wiki/entities/VnPay]] | Khách hàng | Công ty thanh toán, nâng cấp HRM .NET 8 |
| [[wiki/entities/TrungDong]] | Khách hàng | Doanh nghiệp, triển khai HRM |
| [[wiki/entities/HongNgoc]] | Khách hàng | Bệnh viện Hồng Ngọc |
| [[wiki/entities/LTG]] | Khách hàng | LTG Group — kiêm nhiệm đa pháp nhân, TAL đầy đủ, INS ca 24h |
| [[wiki/entities/UNIS]] | Khách hàng | Đại học Quốc Tế — BH tự nguyện giáo viên nước ngoài |
| [[wiki/entities/TBV]] | Khách hàng | TBV — BH nâng cao, tích hợp AMIS D02 |
| [[wiki/entities/Karcher]] | Khách hàng | Kärcher VN — nghỉ 14 ngày không có module Công |
| [[wiki/entities/VCBs]] | Khách hàng | Vietcombank Securities — module FAC (tài sản) + TAL |
| [[wiki/entities/Terumo]] | Khách hàng | Terumo VN — tách user main/portal HRM V3 |
| [[wiki/entities/FIT]] | Dự án nội bộ | FIT project — ADFS SSO, chu kỳ BH 15-14, mail server per company |
| [[wiki/entities/QuickPack]] | Khách hàng | QuickPack Việt Nam (QPVN) — sản xuất, lương sản phẩm, đồng phục |
| [[wiki/entities/PTSC]] | Khách hàng (prospect) | PTSC Dầu khí — đấu thầu HRM 2026, 30 dataset, 30 interface ESB, 3-tier HA |
| [[wiki/entities/Bitex]] | Khách hàng | Bitex-AKW — 2 HĐ 1 hệ thống, golive 01/12/2025, hậu go-live ATT/TRA/Portal |
| [[wiki/entities/SSI]] | Khách hàng (prospect) | SSI Chứng khoán — đấu thầu HRM Pro 2026, 47 mục bảo mật, 24 API endpoints |

---

## Concepts

| Trang | Mô tả ngắn |
|-------|-----------|
| [[wiki/concepts/HRM-Modules]] | Tổng quan các phân hệ HRM (Nhân sự, Lương, Bảo hiểm, Chấm công, Đánh giá, Nhân tài) |
| [[wiki/concepts/Project-Phases]] | Các giai đoạn triển khai: Phân tích, Training, Go-live |
| [[wiki/concepts/Nguon-Luc]] | Quản lý nguồn lực: trạng thái, vai trò, phân công |
| [[wiki/concepts/Net8-Migration]] | Quá trình nâng cấp từ .NET Framework lên .NET 8 |
| [[wiki/concepts/AI-DevTools]] | Cursor AI, Memory Bank, stack kỹ thuật TungLy |
| [[wiki/concepts/Vault-Structure]] | Cấu trúc vault TungLy, quy ước đặt tên, danh sách dự án |
| [[wiki/concepts/PKM-Methods]] | PARA, Zettelkasten, Truy vấn Socrates, Second Brain, Microservice decision framework |
| [[wiki/concepts/HRM-IIS-Troubleshooting]] | Lỗi IIS Pool thường gặp: 405, IIS_IUSRS, OutOfMemory, 403.14 |
| [[wiki/concepts/HRM-SQL-Troubleshooting]] | CLR, Memory Optimized Filegroup, MAXDOP, cache config limit |
| [[wiki/concepts/HRM-Log-Monitoring]] | Toolkit chẩn đoán: Event Viewer, Log Request, Task Scheduler |
| [[wiki/concepts/HRM-Security-Config]] | VnrDecrypt, sysadmin policy, AllowOrigin, permission cache |
| [[wiki/concepts/HRM-Network-Check]] | Test-NetConnection, webSettings.json keys, Symantec/proxy |
| [[wiki/concepts/HRM-Deploy-Checklist]] | Checklist deploy server mới + upbuild an toàn |
| [[wiki/concepts/HRM-Code-Quality]] | Quy tắc store, merge, enum, giao tiếp SE-BA-QC |
| [[wiki/concepts/Kaizen-Methodology]] | Phương pháp Kaizen: 5S, 4 cách cải tiến, mẫu thẻ, liên hệ RCA |
| [[wiki/concepts/PhuongPhapLuan-Debug]] | 6 phương pháp luận debug bậc cao: Sherlock, Einstein, Da Vinci, Toyota, Contact Tracing, Feynman |

---

## Sources

→ Xem [[wiki/sources/_index]] — phân nhóm theo Project / INS / SAL / SYS-ATT-SAL / Phương pháp luận

| [[wiki/sources/w5k9m-giao-ban-22052026]] | Giao ban tuần 3 tháng 5/2026: 3 QT/QĐ mới, KPIs, đào tạo PMP, bổ nhiệm QLCL, mâu thuẫn CRs | 2026-05-23 |
| [[wiki/sources/mm9x--memory-monitor]] | Kiến trúc đầy đủ Sys_MemoryMonitor: static fields, GC diagnostics, multi-pod, snapshot/compare, ClearField từ xa | 2026-05-20 |
| [[wiki/sources/n7q3x-ins-nghi-viec-thieu-workperiodformula]] | INS config: NV nghỉ việc bị báo tháng sau do thiếu WorkPeriodFormula trong chế độ công | 2026-05-12 |
| [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]] | Hồ sơ thầu SSI HRM Pro tổng thể: 183 file, 10 chương, tech stack .NET 8/Angular 19/K8s | 2026-05-13 |
| [[wiki/sources/p7m3k-umc-sso-microsoft-bien-ban-hop]] | Biên bản họp UMC 14/05/2026: thống nhất SSO Microsoft OAuth2/OIDC cho HRM, Azure App Registration | 2026-05-14 |
| [[wiki/sources/q3r6t-ssi-api-spec]] | SSI API Spec Ch.6: 14 GET + 10 POST/PUT endpoints tích hợp HRM ↔ SSI | 2026-05-13 |
| [[wiki/sources/j5k9w-ssi-security-requirements]] | SSI Security Ch.9: 47 items — input validation, MFA, OAuth2, audit log, BVDLCN, SSDLC | 2026-05-13 |
| [[wiki/sources/v7m2p-ssi-devops-requirements]] | SSI DevOps Ch.7: CI/CD, Docker/K8s, backup/DR, SLO, monitoring P95/P99, OpenTelemetry | 2026-05-13 |
| [[wiki/sources/f8c4n-ssi-infrastructure-requirements]] | SSI Infrastructure Ch.10: 5-server topology, App 16c/64GB, DB 16c/128GB, 1Gbps fiber | 2026-05-13 |
| [[wiki/sources/a1b2c-ssi-ch1-cau-hinh-he-thong]] | SSI Ch.1 detail: ngôn ngữ, file config, tham số đa cấp, metadata, phân quyền, master data, báo cáo | 2026-05-13 |
| [[wiki/sources/d3e4f-ssi-ch3-van-hanh-sla]] | SSI Ch.3 detail: thiết bị đầu cuối, phần mềm máy trạm, vận hành on-cloud/on-premise, SLA | 2026-05-13 |
| [[wiki/sources/g5h6i-ssi-ch6-api-detail]] | SSI Ch.6 detail: 4 yêu cầu chung, 14 GET, 10 POST/PUT — endpoint + request/response schema đầy đủ | 2026-05-13 |
| [[wiki/sources/j7k8l-ssi-ch7-devops-detail]] | SSI Ch.7 detail: 33 items — containerization, CI/CD, backup/DR RTO/RPO, SLO, monitoring, tracing | 2026-05-13 |
| [[wiki/sources/m9n0p-ssi-ch8-kien-truc-detail]] | SSI Ch.8 detail: tổng quan giải pháp, 4 sub-architecture, SOA, DC-DR, SSO Azure AD, ECM | 2026-05-13 |
| [[wiki/sources/q1r2s-ssi-ch9-baomat-detail]] | SSI Ch.9 detail: 46 items bảo mật đầy đủ — input validation, MFA, session, DB, TLS, BVDLCN | 2026-05-13 |
| [[wiki/sources/t3u4v-ssi-ch10-hatang-detail]] | SSI Ch.10 detail: 37 items hạ tầng — 5-server topology, OS, network, storage, DB HA/DR, client | 2026-05-13 |
| [[wiki/sources/p1a3t-att-overview]] | Tổng quan phân hệ chấm công ATT: 7 chủ đề con, mục đích, từ viết tắt | 2026-05-10 |
| [[wiki/sources/q7r2n-att-tinh-cong]] | Quy trình tính công 8 bước: đồng bộ → sinh bảng công → chuyển lương | 2026-05-10 |
| [[wiki/sources/k9v2x-att-du-lieu-tinh-cong]] | 6 nhóm dữ liệu tính công: chế độ công, ca, quá trình, nghỉ, OT, tổng hợp | 2026-05-10 |
| [[wiki/sources/m4b8z-att-cong-cong-tru]] | Công cộng/trừ: công thức nghiệp vụ, đi trễ, nghỉ hưởng lương, nghỉ không lương | 2026-05-10 |
| [[wiki/sources/n5c1k-att-luat-ngay-nghi]] | Luật ngày nghỉ BLLĐ: phép năm 12–16 ngày, nghỉ lễ, thai sản 6 tháng, chính sách lao động nữ | 2026-05-10 |
| [[wiki/sources/n8d4m-att-luat-ngay-cong]] | Luật ngày công BLLĐ: 8h/ngày 48h/tuần, giờ ban đêm 22:00–06:00 | 2026-05-10 |
| [[wiki/sources/w3t6p-att-luat-tang-ca]] | Luật tăng ca OT: 6 điều kiện, hệ số 150/200/300+100%, OT đêm, giới hạn 200h/năm | 2026-05-10 |
| [[wiki/sources/b5f9g-att-db-overview]] | DB Overview ATT: 5 bảng chính và quan hệ phân cấp | 2026-05-10 |
| [[wiki/sources/r6e1w-att-db-annualleave]] | Schema Att_AnnualLeave: phép năm tổng hợp, phép bệnh, phép chuyển năm trước | 2026-05-10 |
| [[wiki/sources/t4u8v-att-db-annualdetail]] | Schema Att_AnnualDetail: chi tiết phép tháng, SeniorBonus, PregnantLeave | 2026-05-10 |
| [[wiki/sources/c2s5j-att-db-attendancetable]] | Schema Att_AttendanceTable: bảng công tháng trung tâm — 9 loại OT, 6 loại nghỉ | 2026-05-10 |
| [[wiki/sources/z8h4l-att-db-attendancetableitem]] | Schema Att_AttendanceTableItem: bảng công ngày — giờ vào/ra, OT, trễ, pre-compute lương | 2026-05-10 |
| [[wiki/sources/f3g6r-att-db-catgradecfg]] | Schema Cat_GradeCfg: chế độ công — OT types, phép năm, tỷ lệ BH, ca mặc định | 2026-05-10 |
| [[wiki/sources/h2j7q-att-sys-attendance-config]] | Cấu hình Sys_AttendanceConfig 7 tab: 200+ keys trong Sys_AllSetting | 2026-05-10 |
| [[wiki/sources/v9x3k-dang-ky-quen-cham-cong]] | Incident đăng ký quên chấm công portal báo lỗi không rõ (10/05/2026) | 2026-05-10 |
| [[wiki/sources/t5d8k-hotroaohoa-docker-kubernetes]] | Hồ sơ thầu §1.2.5: VNR build Docker image cung cấp qua Registry/S3, khách hàng tự deploy K8s | 2026-05-08 |
| [[wiki/sources/p9k2w-deploy-k8s-hrm-planning]] | Bộ 10 file kế hoạch triển khai HRM lên K8s: Q&A, kịch bản 7 phase, checklist, sizing VM/K8s, service info, network matrix | 2026-05-07 |
| [[wiki/sources/ck7m3-circlek-hatang-k8s-s3-07052026]] | Biên bản họ p hạ tầng K8S & S3 Circle K 07/05/2026: chọn storage, dựng UAT, phân vai trò VNR/CircleK | 2026-05-07 |
| [[wiki/sources/k8d2p-flow-capnhat-k8s-hrm]] | Quy trình cập nhật HRM lên K8s: CI/CD phân chia VNR vs khách hàng, UAT + Production, Config/Secret | 2026-05-07 |
| [[wiki/sources/ldap1-avn-ldaps-implementation-2026-05-06]] | Implementation LDAPS hoàn chỉnh cho AVN: sửa Framework LdapHelper + Connectiontype enum + 4 caller | 2026-05-06 |
| [[wiki/sources/b6n3w-sys-flow-catbank-08]] | Luồng 4 tầng màn hình CatBank: View→MVC→HR Service→Business, 5 action, 3 điểm rủi ro | 2026-05-05 |
| [[wiki/sources/x7k2p-dao-tao-dev-moi-hrm-2025]] | Kế hoạch đào tạo developer mới HRM 2025: 3 module video, kiến trúc 4 tầng, luồng Search/Excel/Delete | 2026-05-05 |
| [[wiki/sources/p4m7x-catbank-search-structure]] | Chi tiết 9 component màn hình CatBank demo: MVC, Web API, Entity, Model, View, ConstantDisplay | 2026-05-05 |
| [[wiki/sources/m7p2k-pvfcco-luong-co-so-he-so-3p]] | MODIFY PVFCCo: thêm Lương cơ sở 3P vào Lương cơ bản + 2 enum | 2026-05-05 |
| [[wiki/sources/h7p2m-giao-ban-14052026]] | Giao ban tuần 2 tháng 5/2026: KPIs thiết lập mục tiêu Q2, đánh giá tháng 4, đề xuất hủy lịch nghỉ HRM | 2026-05-14 |
| [[wiki/sources/g8k3p-giao-ban-05052026]] | Giao ban tuần 1 tháng 5/2026: KPIs, số hóa tính thưởng, đánh giá TTPTSP, đãi ngộ lần 1 | 2026-05-05 |

---

## Synthesis

→ Xem [[wiki/synthesis/_index]] — nghiên cứu chuyên đề, RCA tháng, tổng kết ngày

---

## Cách dùng wiki này

1. **Ingest nguồn mới**: "ingest raw/ten-file.md" — LLM đọc, tóm tắt, cập nhật wiki
2. **Query**: hỏi bất kỳ câu hỏi — LLM đọc index → trang liên quan → trả lời có citation
3. **Lint**: "lint wiki" — LLM kiểm tra orphan pages, mâu thuẫn, thiếu cross-link
