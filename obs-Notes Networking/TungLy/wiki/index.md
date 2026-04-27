---
type: index
date-updated: 2026-04-27
last-analyzed: 2026-04-27
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
| [[wiki/flows/Flow-PhanQuyen-HeThong]] | Phân quyền SYS: 2 loại quyền, tạo nhóm, gán user, PrivilegeNumber bitwise | 2026-04-27 |
| [[wiki/flows/Flow-ResetPassword]] | Bảo mật đăng nhập, đổi mật khẩu, quên mật khẩu (4 bước) | 2026-04-27 |
| [[wiki/flows/Flow-LDAP-Login]] | Cấu hình và đăng nhập LDAP/Active Directory HRM | 2026-04-27 |

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

---

## Glossary (Từ điển thuật ngữ)

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|---------|
| [[wiki/glossary/HRM-Glossary]] | Từ điển đầy đủ: BH (BHXH/BHYT/BHTN), D02/C70, SE/BA/QC, IIS, CLR... | 2026-04-26 |

---

## API

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|---------|
| [[wiki/api/HRM-API-Excel-Integration]] | HRM API → Excel: Bearer token Power Query, SQL direct, Store Procedure | 2026-04-27 |

---

## Projects

| Trang | Mô tả ngắn | Cập nhật |
|-------|-----------|---------|
| [[wiki/projects/VnPay-Project]] | Triển khai HRM đầy đủ + .NET 8 cho VnPay — Kubernetes, 13 services, tích hợp MISA | 2026-04-25 |
| [[wiki/projects/TrungDong-Project]] | Triển khai HRM cho Trung Đông | 2026-04-25 |
| [[wiki/projects/HongNgoc-Project]] | Nâng cấp phân hệ Đánh giá, SSO JWT | 2026-04-25 |
| [[wiki/projects/Bitex-Project]] | Triển khai HRM Bitex-AKW 2025-2026: 2 hợp đồng 1 hệ thống, golive 01/12/2025, hỗ trợ vận hành | 2026-04-27 |
| [[wiki/projects/Marico-Project]] | Modify đánh giá hợp đồng (9 tasks), archived 2024 | 2026-04-25 |
| [[wiki/projects/LTG-Project]] | Phase 3 post-UAT: kiêm nhiệm đa pháp nhân, INS ca 24h, TAL đầy đủ | 2026-04-27 |

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

---

## Sources

| Trang | Nguồn gốc | Ingest |
|-------|----------|--------|
| [[wiki/sources/H-TrungDong-Eva-31122024]] | Biên bản họp xin nguồn lực Phase II TrungDong (31/12/2024) | 2026-04-25 |
| [[wiki/sources/H-TrungDong-Eva-14042025]] | Biên bản họp quyết định kỹ thuật Đánh giá TrungDong (14/04/2025) | 2026-04-25 |
| [[wiki/sources/HongNgoc-DanhGia-SSO]] | Hướng dẫn cấu hình JWT SSO cho hệ thống Đánh giá HongNgoc | 2026-04-25 |
| [[wiki/sources/VnPay-Goals-Scope-Resources]] | Goals, Scope, nhân sự 7 SE, rủi ro dự án VnPay | 2026-04-25 |
| [[wiki/sources/VnPay-Phases-Timeline]] | Timeline đầy đủ 8 giai đoạn (10/2024 – 09/2025) | 2026-04-25 |
| [[wiki/sources/VnPay-System-Architecture]] | 13 services/sites, Kubernetes, vai trò từng service | 2026-04-25 |
| [[wiki/sources/VnPay-Performance-Incident]] | Sự cố nghẽn 200 users tháng 11/2025, kết quả fix | 2026-04-25 |
| [[wiki/sources/H-VnPay-Att-17042025]] | Họp Chấm công: đối tượng 1 đầu IN, quy tắc trễ/sớm | 2026-04-25 |
| [[wiki/sources/H-VnPay-TRA-30062025]] | Họp UAT Tuyển dụng & Định biên: ưu tiên task | 2026-04-25 |
| [[wiki/sources/H-VnPay-INS-05082025]] | Họp tích hợp Bảo hiểm MISA: lộ trình T9/2025 | 2026-04-25 |
| [[wiki/sources/H-VnPay-Sys-03062025]] | Họp UAT Phase 4: kế hoạch đào tạo + UAT chi tiết | 2026-04-25 |
| [[wiki/sources/AI-Cursor-MemoryBank]] | Cursor AI: tính năng, Memory Bank, so sánh LLM Wiki | 2026-04-25 |
| [[wiki/sources/BaiGiang-DotNet-KendoUI-JWT]] | Cấu trúc bài giảng .NET MVC, Kendo UI, JWT | 2026-04-25 |
| [[wiki/sources/VnPay-Deploy-Guide]] | Hướng dẫn triển khai HRM VnPay: S3, IIS, SQL Server | 2026-04-25 |
| [[wiki/sources/Marico-DanhGia-HopDong]] | Marico: 9 task modify đánh giá hợp đồng | 2026-04-25 |
| [[wiki/sources/Monthly-07-2024-TongHop]] | Tháng 07/2024: Epic bảo mật + phân hệ | 2026-04-25 |
| [[wiki/sources/Nhat-ky-van-de-he-thong]] | 22 vấn đề kỹ thuật IIS/SQL/Log/Network (Sys000–Sys022) | 2026-04-26 |
| [[wiki/sources/Nhat-ky-van-de-nghiep-vu]] | 29 vấn đề nghiệp vụ SE: deploy, merge, store, quy trình | 2026-04-26 |
| [[wiki/sources/SysLog-HeThong-Chi-Tiet]] | 23 lỗi IIS/SQL/Log/Network chi tiết (Sys000–Sys022) | 2026-04-26 |
| [[wiki/sources/SysLog-NghiepVu-Chi-Tiet]] | 29 lỗi nghiệp vụ SE chi tiết (Sys00001–Sys00029) | 2026-04-26 |
| [[wiki/sources/WarmupStatus-Performance-2026]] | WarmupStatus 6 services + Identity Razor warmup (2026-04-20) | 2026-04-26 |
| [[wiki/sources/GitNexus-Daily-Note]] | Ghi chú GitNexus: chạy lại analyze khi tách nhánh | 2026-04-26 |
| [[wiki/sources/INS-InsuranceMonthJoin]] | Logic xác định tháng tham gia BH — InsuranceMonthJoin | 2026-04-26 |
| [[wiki/sources/INS-InsurancePayback]] | Logic hoàn trả BH khi đóng sai/thừa — InsurancePayback | 2026-04-26 |
| [[wiki/sources/INS-InsuranceRecordDayCount]] | Đếm ngày thực tế bản ghi BH trong tháng — DayCount formula | 2026-04-26 |
| [[wiki/sources/INS-Nghi14Ngay]] | Quy tắc nghỉ ốm hưởng BHXH: 14 ngày làm việc, không cắt bản ghi | 2026-04-26 |
| [[wiki/sources/INS-NghiThaiSan]] | Chế độ thai sản: 6 tháng, 100% lương, không cắt bản ghi BH | 2026-04-26 |
| [[wiki/sources/INS-iBHXH-Analyze]] | Phân tích luồng tích hợp HRM → iBHXH khai báo điện tử | 2026-04-26 |
| [[wiki/sources/INS-C70-TinhLuong]] | Bảng tổng hợp lương C70: cột BH NLĐ + NSDLĐ, đối soát D02 | 2026-04-26 |
| [[wiki/sources/INS-D02-ChungTu]] | Biểu mẫu D02-TS: tham gia/điều chỉnh BH, Venn so sánh phiên bản | 2026-04-26 |
| [[wiki/sources/INS-FishBone-Analysis]] | FishBone 4M + 5 Whys phân tích nguyên nhân gốc rễ lỗi BH | 2026-04-26 |
| [[wiki/sources/INS-TruyNguyenNhan]] | Phương pháp 4M Root Cause Analysis theo Kaizen Nhật Bản: 5 Whys, CAPA matrix, checklist định vị lỗi INS | 2026-04-26 |
| [[wiki/sources/INS-VennD02]] | So sánh D02-VNPT / D02-Viettel / iBHXH (TS24) — Venn diagram, bảng chi tiết, lỗi tích hợp, flowchart tư vấn chọn phần mềm | 2026-04-26 |
| [[wiki/sources/INS-Kaizen-08]] | Nhật ký vấn đề BH (Kaizen #08, 2017): 5 Whys D02/C70, ON-OFF thai sản, timezone bug, kế hoạch giảm bug Pareto | 2026-04-26 |
| [[wiki/sources/LTG-INS-Meetings-2024]] | LTG: họp BH 2024 — Ca 24h, nghỉ 14 ngày, ngày nghỉ custom | 2026-04-27 |
| [[wiki/sources/LTG-TAL-Meetings-2024]] | LTG: họp Nhân Tài 2024 — kế thừa, phân quyền tự động, GAP đào tạo | 2026-04-27 |
| [[wiki/sources/LTG-SYS-Meetings-2024]] | LTG: họp SYS — kiêm nhiệm đa pháp nhân, store Get_Data_Permission_New | 2026-04-27 |
| [[wiki/sources/UNIS-INS-Meetings-2024]] | UNIS: BH tự nguyện giáo viên VN + nước ngoài, đăng ký người thân | 2026-04-27 |
| [[wiki/sources/TBV-INS-Meeting-2024]] | TBV: BH nâng cao — trích nộp thiếu, chốt dòng, cảnh báo, AMIS | 2026-04-27 |
| [[wiki/sources/Karcher-INS-Meeting-2024]] | Karcher: nghỉ 14 ngày không có module Công — enum từ chứng từ | 2026-04-27 |
| [[wiki/sources/MultiProject-SYS-Meetings-2024]] | Taisun/FGL/HVN/Toyota/AMIS: khóa đối tượng, survey redirect, phân quyền tự động | 2026-04-27 |
| [[wiki/sources/VCBs-FAC-TAL-Meetings-2024]] | VCBs: quản lý tài sản FAC đầy đủ + TAL khung năng lực | 2026-04-27 |
| [[wiki/sources/TrungDong-Eva-Meetings-2025-Supplement]] | TrungDong Phase II bổ sung: KPI 4 quý, UAT2 prep 32 modify | 2026-04-27 |
| [[wiki/sources/Terumo-SYS-Meeting-2024]] | Terumo: tách user main/portal HRM V3 | 2026-04-27 |
| [[wiki/sources/GiaoBan-2025-TongHop]] | Giao ban VnR 2025: ISO, nhân sự, KPI, P.QTNNL, Succession | 2026-04-27 |
| [[wiki/sources/NghiepVu-ATT-SAL]] | Nghiệp vụ Chấm công (ATT01–05) và Tính lương (SAL01) | 2026-04-27 |
| [[wiki/sources/SaaS-VnR-Meetings-2023-2024]] | SaaS VnR: K8s multi-tenant, MinIO, chuyển đổi codebase 2023–2024 | 2026-04-27 |
| [[wiki/sources/Daily-2024-SSO-Auth]] | SSO patterns 2024: Okta OIDC (Colgate), Azure AD, ADFS (FIT), auth.config | 2026-04-27 |
| [[wiki/sources/Daily-2024-Security-Fixes]] | Bảo mật HRM 2024: XSS grid, SQL Injection store, Broken Access Control | 2026-04-27 |
| [[wiki/sources/Daily-2024-SQL-Performance]] | Refactor Get_MasterDataForUser: temp table, CPU 38750ms→672ms | 2026-04-27 |
| [[wiki/sources/Daily-2024-Cache-Redis]] | Cache 5 pools, Task.Run HttpContext bug+fix, Redis 7.2.5 migration | 2026-04-27 |
| [[wiki/sources/Daily-2024-INS-Bugs]] | INS bugs: C70 hotfix nghỉ ốm dài ngày, VDSC leavedayTypeCount reset | 2026-04-27 |
| [[wiki/sources/Daily-2024-PowerBI-Integration]] | Power BI + HRM API: Bearer token, Power Query, API_SP_GET_BANK | 2026-04-27 |
| [[wiki/sources/FIT-Meetings-2024]] | FIT: mail server per company, BH chu kỳ 15-14, ADFS SSO | 2026-04-27 |
| [[wiki/sources/UNIS-INS-Jun2024-Supplement]] | UNIS họp BH tự nguyện 10/06/2024 — kick-off phân tích, thêm quốc tịch người thân | 2026-04-27 |
| [[wiki/sources/VCBs-TAL-Jul2024-Supplement]] | VCBs TAL 22/07/2024 — field "Khía cạnh", chọn người khảo sát, ma trận mức-hành vi | 2026-04-27 |
| [[wiki/sources/StandardUI-SE-2024]] | Tiêu chuẩn SE (Nghĩa): UI, button, control, validate, thông báo, màn hình mới | 2026-04-27 |
| [[wiki/sources/Daily-2024-OPA-LDAP-Permission]] | OPA cache API v3, OpenLDAP cài Ubuntu, sp_GetPermissionNew theo EntityType | 2026-04-27 |
| [[wiki/sources/Daily-2024-Vietcap-SSO-Security]] | Vietcap XSS filter HasXSSConfig, LTG SSO email, GetIntegratedUserList API | 2026-04-27 |
| [[wiki/sources/Daily-2025-CursorAI-Net8]] | Cursor AI Memory Bank, .NET 8 FormCollection→IFormCollection, VnPay DLL bug | 2026-04-27 |
| [[wiki/sources/Interview-SE-VnResource-2024]] | Quy trình phỏng vấn SE VnResource — 5 khía cạnh đánh giá, tiêu chí PASS | 2026-04-27 |
| [[wiki/sources/ATT-BUG01-PhepNam-NgayLe]] | ATT-BUG01: sai tổng công khi phép năm trùng ngày lễ — fix hrm_get_TimesheetSummary | 2026-04-27 |
| [[wiki/sources/LTG-TAL-Supplement-Jul2024]] | LTG TAL bổ sung: bình luận BẮT BUỘC trước duyệt, tự tạo mục tiêu GAP, scheduler task, cảnh báo L&D | 2026-04-27 |
| [[wiki/sources/HVN-SYS-KhoadoituongKyCong-2024]] | HVN: khóa đối tượng theo loại kỳ công — NV → Nhóm NV → Loại kỳ công | 2026-04-27 |
| [[wiki/sources/FGL-Survey-RedirectJWT-2024]] | FGL: tích hợp Survey qua redirect JWT — SurveyAuthen/Index gateway pattern | 2026-04-27 |
| [[wiki/sources/AMIS-ISO-AgileScrum-2024]] | AMIS ISO: mẫu quy trình 7 mục, Agile Scrum Misa, chuẩn hóa quy trình sản xuất | 2026-04-27 |
| [[wiki/sources/HongNgoc-AutoLogin-JWT-2025]] | HongNgoc: auto-login đánh giá cũ→mới qua JWT SSO_SecretKey shared | 2026-04-27 |
| [[wiki/sources/SaaS-VnR-Meetings-Detail-2023]] | SaaS VnR: 16 biên bản họp chi tiết 07–10/2023 — K8s, MinIO per tenant, Identity Server, Redis cache tenantCode | 2026-04-27 |
| [[wiki/sources/Interview-SE-Candidates-2024]] | 4 hồ sơ ứng viên SE Backend 2024 — Thái Bảo An, Mã Tấn Vĩnh, Nguyễn Hoàng Trung, Trần Công Duy (PASS) | 2026-04-27 |
| [[wiki/sources/Learning-MicroService-Confluence-Tools]] | Microservice SSO 3 tình huống + Confluence vs WikiJS so sánh chi tiết | 2026-04-27 |
| [[wiki/sources/Daily-2025-Jan-Feb-Projects]] | Daily 01–02/2025: HongNgoc SSO, PEWVN, INOAC, Lotte Okta OIDC, TVC, VnPay SSO | 2026-04-27 |
| [[wiki/sources/INS-Kaizen-08-Cards]] | 11 thẻ Kaizen thực thi INS/SYS (Ins0001–Ins0011, 2017–2018): UX, validate, RAM warning, SE tooling | 2026-04-27 |
| [[wiki/sources/INS-TaiLieuBaoHiem-01]] | Tài liệu toàn diện INS v8.0.1.x — 9 module: mindmap, nghiệp vụ, DB schema, UML, cấu hình, code diagram | 2026-04-27 |
| [[wiki/sources/INS-NhatKy-VanDe-2017]] | Nhật ký vấn đề INS 2017: D02 thai sản, ON/OFF, timezone bug, Pareto 70% bug | 2026-04-27 |
| [[wiki/sources/INS-Troubleshooting-5Why]] | 5-Why RCA: Tên Công Việc, Số Tiền BH, C70A lương = 0 — 4M framework | 2026-04-27 |
| [[wiki/sources/INS-ThietKe-V8]] | Thiết kế chức năng INS V8: nghiệp vụ, biểu mẫu TK01/TK02/D02/C70A, IBHXH/EBHXH | 2026-04-27 |
| [[wiki/sources/INS-TaiLieuBH-01-Schema]] | Schema database đầy đủ INS: Ins_ProfileInsuranceMonthly 72+ fields, mã lỗi Err001-Err008 | 2026-04-27 |
| [[wiki/sources/Sys-TaiLieuHeThong-01]] | Tài liệu hệ thống SYS: 8 bảng DB, UML, 50+ webconfig keys, bảo mật, quên mật khẩu | 2026-04-27 |
| [[wiki/sources/Sys-TaiLieuPhanQuyen-02]] | Phân quyền HRM: 2 loại quyền, tạo nhóm 2 bước, màn hình/nút/tab | 2026-04-27 |
| [[wiki/sources/Sys-TaiLieuLDAP-03]] | Tích hợp LDAP: cấu hình, Sys_LdapConfig, multi-source, workflow đăng nhập | 2026-04-27 |
| [[wiki/sources/Sys-TaiLieuGetAPIToExcel-07]] | Lấy dữ liệu HRM API/SQL/Store → Excel qua Power Query + Bearer token | 2026-04-27 |
| [[wiki/sources/Bitex-Project-Overview]] | Bitex-AKW: Goals / Scope / Timeline / Risks / Resources / Phases — 5 giai đoạn, rủi ro thực tế, bài học | 2026-04-27 |
| [[wiki/sources/Bitex-Chat-ChiHuyThiCong]] | Bitex: Chat log nhóm "Chỉ Huy Thi Công" — 7 issues, quyết định 2 HĐ 1 DA, bài học PM | 2026-04-27 |
| [[wiki/sources/Bitex-TaskList-PostGoLive]] | Bitex-AKW: Task list hậu go-live Tuyết Anh — 99 tasks, HRE+ATT+Portal+APP | 2026-04-27 |

---

## Synthesis

| Trang | Chủ đề | Tạo |
|-------|--------|-----|
| [[wiki/synthesis/VnPay-Lessons-Learned]] | Tổng hợp bài học từ dự án VnPay (scale, UAT, tích hợp) | 2026-04-25 |
| [[wiki/synthesis/VnPay-Research-20260427]] | Báo cáo toàn diện VnPay: khách hàng, 13 services K8s, timeline, sự cố, gaps, gợi ý | 2026-04-27 |
| [[wiki/synthesis/BaoHiem-NghiepVu-Research-20260426]] | Nghiên cứu toàn diện nghiệp vụ Bảo hiểm: chứng từ, nghỉ 14 ngày, tích hợp MISA, BH tự nguyện | 2026-04-26 |
| [[wiki/synthesis/hoat-dong-wiki-26-04-2026-v4]] | Tổng hợp hoạt động wiki 26/04/2026 — biểu đồ, quy luật, câu hỏi suy ngẫm | 2026-04-26 |
| [[wiki/synthesis/hoat-dong-wiki-27-04-2026]] | Tổng hợp hoạt động wiki 27/04/2026 — tăng trưởng 50+ trang, 6 entities mới, 3 RCA | 2026-04-27 |
| [[wiki/synthesis/hoat-dong-wiki-27-04-2026-v2]] | Tổng hợp v2 ngày 27/04/2026 — bug-fix VNWs Sys024, routing bug TaskScheduleService | 2026-04-27 |
| [[wiki/synthesis/toan-canh-wiki-ket-thuc-ngay-27-04-2026]] | Toàn cảnh wiki kết thúc ngày 27/04/2026 — 120+ trang, INS/SYS, 3 RCA, 6 entity mới | 2026-04-27 |

---

## Cách dùng wiki này

1. **Ingest nguồn mới**: "ingest raw/ten-file.md" — LLM đọc, tóm tắt, cập nhật wiki
2. **Query**: hỏi bất kỳ câu hỏi — LLM đọc index → trang liên quan → trả lời có citation
3. **Lint**: "lint wiki" — LLM kiểm tra orphan pages, mâu thuẫn, thiếu cross-link
