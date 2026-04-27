# Wiki Log

> Append-only. Không sửa entry cũ. Format: `## [YYYY-MM-DD] <loại> | <tiêu đề>`
> Loại: `ingest` | `query` | `lint` | `init`

---

## [2026-04-27] research | VnPay — Báo cáo toàn diện

Đọc: 10 trang wiki + 3 file thô (log lỗi T10/2025, tri thức thô, danh sách dự án)
Tạo báo cáo: `wiki/synthesis/VnPay-Research-20260427.md`
Chủ đề: khách hàng, kiến trúc 13 services, timeline 8 giai đoạn, sự cố nghẽn, tích hợp MISA, lessons learned

---

## [2026-04-27] ingest | Nhóm 1 rà soát — LTG-TAL, HVN, FGL, AMIS-ISO, HongNgoc

Tạo mới (6 source pages):
- `wiki/sources/LTG-TAL-Supplement-Jul2024.md` — bình luận BẮT BUỘC trước duyệt, tự tạo mục tiêu GAP, Nhóm NV vào phân quyền tự động, scheduler task, cảnh báo L&D
- `wiki/sources/HVN-SYS-KhoadoituongKyCong-2024.md` — khóa đối tượng 2 kỳ công/tháng; NV→NhómNV→LoạiKyCong
- `wiki/sources/FGL-Survey-RedirectJWT-2024.md` — SurveyAuthen/Index redirect gateway, JWT (CodeEmp/ProfileName/OrgstructureName)
- `wiki/sources/AMIS-ISO-AgileScrum-2024.md` — mẫu quy trình ISO 7 mục, Agile Scrum Misa, chuẩn hóa khối sản xuất VnR
- `wiki/sources/HongNgoc-AutoLogin-JWT-2025.md` — auto-login đánh giá cũ→mới qua SSO_SecretKey JWT shared

Cập nhật: `wiki/index.md`, `wiki/overview.md` (sources 64→70, tổng ~112 trang)

---

## [2026-04-27] ingest | Đợt 3 — UNIS/VCBs bổ sung + OPA/LDAP + Interview + ATT bug + Daily 2025

Tạo mới (9 source pages):
- `wiki/sources/UNIS-INS-Jun2024-Supplement.md` — BH tự nguyện kick-off 10/06, thêm quốc tịch người thân
- `wiki/sources/VCBs-TAL-Jul2024-Supplement.md` — TAL: field "Khía cạnh", chọn người khảo sát
- `wiki/sources/StandardUI-SE-2024.md` — 6 nhóm tiêu chuẩn SE: UI, button, validate, thông báo
- `wiki/sources/Daily-2024-OPA-LDAP-Permission.md` — OPA cache API v3, OpenLDAP Ubuntu, sp_GetPermissionNew EntityType
- `wiki/sources/Daily-2024-Vietcap-SSO-Security.md` — XSS HasXSSConfig, LTG SSO email, GetIntegratedUserList
- `wiki/sources/Daily-2025-CursorAI-Net8.md` — Cursor Memory Bank, FormCollection→IFormCollection migration
- `wiki/sources/Interview-SE-VnResource-2024.md` — quy trình phỏng vấn SE, 5 khía cạnh đánh giá
- `wiki/sources/ATT-BUG01-PhepNam-NgayLe.md` — sai tổng công khi phép trùng lễ, fix TimesheetSummary
- (Nhóm A, C, D rỗng — bỏ qua)

Cập nhật: `wiki/index.md`, `wiki/overview.md` (sources 55→64, tổng ~106 trang)

---

## [2026-04-27] ingest | Đợt 2 — Daily 2024 + FIT + PKM

Tạo mới:
- `wiki/sources/Daily-2024-SSO-Auth.md` — Okta OIDC (Colgate), Azure AD, ADFS (FIT), auth.config patterns
- `wiki/sources/Daily-2024-Security-Fixes.md` — XSS grid, SQL Injection, Broken Access Control (GetUserList, GetEnum)
- `wiki/sources/Daily-2024-SQL-Performance.md` — Get_MasterDataForUser refactor, CPU 38750ms→672ms, temp table
- `wiki/sources/Daily-2024-Cache-Redis.md` — 5-pool cache, Task.Run HttpContext bug+fix, Redis 7.2.5 migration
- `wiki/sources/Daily-2024-INS-Bugs.md` — C70 hotfix nghỉ ốm dài ngày, VDSC leavedayTypeCount bug
- `wiki/sources/Daily-2024-PowerBI-Integration.md` — Power Query Bearer token, API_SP_GET_BANK, dynamic columns
- `wiki/sources/FIT-Meetings-2024.md` — mail server per company, BH chu kỳ 15-14, ADFS SSO claims mapping
- `wiki/entities/FIT.md` — FIT project nội bộ (ADFS, BH 15-14, mail per company)
- `wiki/concepts/PKM-Methods.md` — PARA, Zettelkasten, Socrates, Second Brain, Microservice decision framework

Cập nhật: `wiki/index.md`, `wiki/overview.md` (sources 47→55, entities 10→11, concepts 13→14, tổng ~97 trang)

---

## [2026-04-27] analyze | Wiki Analyze — health check lần 6

Stats: 34 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis, 5 flows, 4 architecture, 1 glossary → **70 trang tổng**
Orphans: 1 (Vault-Structure — tồn đọng từ lần trước)
Ghost pages (log ≠ disk): 6 trang (tồn đọng đã biết)
Index ↔ Disk: ✅ KHỚP HOÀN TOÀN — wiki STABLE, không có ingest mới kể từ 2026-04-26
Dự án thiếu nguồn: Bitex (0🔴), HongNgoc (1🟡), Marico (1🟡 archived), TrungDong (2🟡)
Gaps tồn đọng: pvcfc entity, iBHXH-Portal concept, MISA-Integration concept, api/ folder, 2 flows còn thiếu
Cập nhật: wiki/overview.md (lần 5 → 6, date-updated: 2026-04-27)

---

## [2026-04-27] ingest | Đợt 1 Batch Ingest — Projects 2024 + 2025 Archived

**Nguồn**: 1.Projects/LTG/, 1.Projects/UNI/, 1.Projects/VCBs/, 1.Projects/Taisun/, 1.Projects/FGL/, 1.Projects/HVN/, 1.Projects/Toyota/, 1.Projects/AMIS/, 3.ARCHIEVED/dự án 2024/(TBV, Karcher), 3.ARCHIEVED/dự án 2025/(TrungDong supplement, Terumo, Giao ban 2025), 1.Projects/07-2024 tổng hợp/, 1.Projects/SaaS-VnR/, 2.RESOURCE/Nghiep-vu-HRM/

**Tạo mới — Sources (13 trang)**:
- `wiki/sources/LTG-INS-Meetings-2024.md` — 2 họp BH LTG: ca 24h, nghỉ 14 ngày custom, ngày nghỉ không dùng Cat_DayOff
- `wiki/sources/LTG-TAL-Meetings-2024.md` — 4 họp Nhân Tài LTG: kế thừa, GAP đào tạo, phân quyền tự động nhóm NV
- `wiki/sources/LTG-SYS-Meetings-2024.md` — 2 họp SYS LTG: kiêm nhiệm đa pháp nhân, store Get_Data_PermissionConCurrent_New
- `wiki/sources/UNIS-INS-Meetings-2024.md` — BH tự nguyện giáo viên VN + nước ngoài, đăng ký người thân
- `wiki/sources/TBV-INS-Meeting-2024.md` — BH nâng cao: trích nộp thiếu, chốt dòng, cảnh báo, AMIS D02
- `wiki/sources/Karcher-INS-Meeting-2024.md` — nghỉ 14 ngày không có module Công → enum từ chứng từ
- `wiki/sources/MultiProject-SYS-Meetings-2024.md` — Taisun/FGL/HVN/Toyota/AMIS: khóa đối tượng, survey redirect, phân quyền tự động, ISO
- `wiki/sources/VCBs-FAC-TAL-Meetings-2024.md` — Quản lý tài sản FAC đầy đủ (6 quy trình + QR) + TAL khung năng lực
- `wiki/sources/TrungDong-Eva-Meetings-2025-Supplement.md` — KPI 4 quý, UAT2 18 task, nhân tài lĩnh vực
- `wiki/sources/Terumo-SYS-Meeting-2024.md` — tách user main/portal HRM V3
- `wiki/sources/GiaoBan-2025-TongHop.md` — 28 giao ban VnR: ISO, nhân sự, KPI, P.QTNNL, Succession
- `wiki/sources/NghiepVu-ATT-SAL.md` — nghiệp vụ ATT01–ATT05 (chấm công) + SAL01 (lương)
- `wiki/sources/SaaS-VnR-Meetings-2023-2024.md` — K8s multi-tenant, MinIO, chuyển đổi codebase SaaS

**Tạo mới — Entities (6 trang)**:
- `wiki/entities/LTG.md`, `wiki/entities/UNIS.md`, `wiki/entities/TBV.md`
- `wiki/entities/Karcher.md`, `wiki/entities/VCBs.md`, `wiki/entities/Terumo.md`

**Tạo mới — Projects (1 trang)**:
- `wiki/projects/LTG-Project.md`

**Cập nhật**:
- `wiki/index.md` — thêm 13 sources, 6 entities, 1 project
- `wiki/overview.md` — sources: 34→47, entities: 5→10, projects: 5→6, tổng: ~89 trang, version: v3

## [2026-04-26] analyze | Cập nhật rule chuẩn hóa diagram — flows/ vs architecture/

Vấn đề: flows/ và architecture/ đang bị trộn lẫn diagram (sequenceDiagram trong architecture, subgraph cấu trúc trong flows).

Cập nhật 2 file:

**CLAUDE.md** (rule toàn cục):
- Thêm thư mục `flows/`, `architecture/`, `glossary/`, `api/` vào cấu trúc wiki
- Thêm section "Quy tắc chuẩn hóa Diagram (BẮT BUỘC)"
  - flows/: cho phép flowchart, sequenceDiagram, stateDiagram — mô tả bước thực hiện
  - architecture/: cho phép flowchart+subgraph, ASCII tree, code block — mô tả cấu trúc tĩnh
  - Bảng phân loại nhanh + nguyên tắc + ví dụ đúng
  - 5 quy tắc cứng KHÔNG BAO GIỜ vi phạm

**.claude/skills/01-wiki-ingest/SKILL.md**:
- Thêm "Bước 3b — Phân loại nội dung → flows/ hoặc architecture/"
  - Tiêu chí tạo flows/ (thứ tự bước, ai làm gì, rẽ nhánh, message giữa hệ thống)
  - Tiêu chí tạo architecture/ (component, kết nối tĩnh, folder, hạ tầng)
  - Diagram cho phép cho từng loại (✅/❌ rõ ràng)
  - Quy tắc cứng: không trộn, nếu có cả hai → tạo 2 trang riêng
- Thêm section "Quy tắc Diagram" ở cuối với bảng phân loại + code mẫu

---

## [2026-04-26] analyze | Viết lại architecture/ — Thêm code structure, Mermaid, SQL snippets

Vấn đề: 4 trang architecture chỉ có văn bản mô tả, thiếu code structure/diagram thực tế.

Viết lại toàn bộ 4 trang dựa trên raw sources (Confluence docs VnPay):

**HRM-System-Architecture.md**:
- Mermaid graph K8s cluster (13 services, màu sắc, warning SPOF)
- Mermaid sequenceDiagram: login flow + Integration API flow
- ASCII tree: Windows Service + Hangfire flow
- Redis WarmupStatus key structure

**HRM-Auth-Architecture.md**:
- Mermaid graph: 3 mô hình auth (Local, JWT SSO, IDS4)
- Mermaid sequenceDiagram: OAuth2 Authorization Code Flow
- C# code: IDS4 client config, JWT Bearer validation
- JSON: JWT SSO config, JWT payload mẫu
- SQL: VnrDecrypt usage pattern
- Security checklist đầy đủ

**HRM-Database-Architecture.md**:
- ASCII tree: Solution structure + Database schema
- SQL: CLR setup scripts, Memory Optimized setup, MAXDOP
- C# code: Entity structure (feature-based), DIServices pattern, Compiled Model
- SQL: Performance monitoring queries (top slow, blocking)
- Backup/restore checklist

**HRM-Deployment-Architecture.md**:
- ASCII tree: Solution folder structure
- ASCII tree: IIS deployment folder structure (wwwroot)
- XML: web.config keys bắt buộc
- Table: IIS Application Pools config
- PowerShell: phân quyền IIS_IUSRS
- YAML: K8s Deployment manifest + Traefik IngressRoute
- Shell: git workflow chuyển nhánh .NET8 ↔ .NETFramework
- ASCII tree: Multi-tenant structure
- S3 bucket structure + PowerShell upload/download
- C# code: WarmupService pattern (StartAsync, WarmupRazorViewAsync)
- Mermaid graph: Deploy pipeline + Monitoring stack

---

## [2026-04-26] analyze | Cập nhật flows/ — Thêm Mermaid flowchart vào 5 trang

Thay thế toàn bộ sơ đồ text thuần (``` code block) bằng **Mermaid flowchart** với màu sắc và decision node:

- `Flow-TinhLuong-Monthly.md` — 1 diagram: end-to-end 9 bước, decision node nghỉ ốm/thai sản
- `Flow-KhaiBaoiBHXH.md` — 1 diagram: 8 bước, decision node C70↔D02 + duyệt/từ chối
- `Flow-Deploy-HRM.md` — 2 diagram: IIS upbuild (10 bước + rollback) + K8s (7 bước + rollback)
- `Flow-UAT-Process.md` — 1 diagram: 10 bước, vòng lặp fix/reopen + sign-off gate
- `Flow-Onboarding-NhanVien.md` — 1 diagram: 8 bước, decision node BHXH cũ + SSO

---

## [2026-04-26] analyze | Wiki Restructure — Thêm flows/ + architecture/ + glossary/

Lý do: Wiki thiếu 3 thư mục so với kiến trúc mục tiêu (hrm-wiki). Toàn bộ nội dung được tổng hợp từ 34 sources đã ingest.

Tạo mới — `wiki/flows/` (5 trang):
- `Flow-TinhLuong-Monthly.md` — Quy trình tính lương tháng end-to-end (9 bước)
- `Flow-KhaiBaoiBHXH.md` — Quy trình khai báo BHXH điện tử (8 bước)
- `Flow-Deploy-HRM.md` — Quy trình deploy/upbuild + warmup (10 bước, có K8s variant)
- `Flow-UAT-Process.md` — Quy trình UAT: đào tạo → test → fix → sign-off (10 bước)
- `Flow-Onboarding-NhanVien.md` — Quy trình onboarding nhân viên mới (8 bước)

Tạo mới — `wiki/architecture/` (4 trang):
- `HRM-System-Architecture.md` — Tổng quan: IIS vs K8s, 13 services, luồng request, điểm nghẽn
- `HRM-Auth-Architecture.md` — JWT SSO, Identity Server 4, VnrDecrypt, RBAC, CORS
- `HRM-Database-Architecture.md` — SQL Server, CLR, Memory Optimized, MAXDOP, backup
- `HRM-Deployment-Architecture.md` — IIS config, K8s manifest, multi-tenant, S3, warmup

Tạo mới — `wiki/glossary/` (1 trang):
- `HRM-Glossary.md` — ~60 thuật ngữ & viết tắt: BH (BHXH/BHYT/BHTN), D02/C70, SE/BA/QC, IIS, CLR, K8s, JWT, Phases...

Cập nhật:
- `wiki/index.md` — Thêm 3 section mới: Flows, Architecture, Glossary (đầu trang)
- `wiki/overview.md` — Tổng trang: 60 → 70; Gaps cập nhật; wiki-version: v2

Stats: 10 trang mới, 70 tổng trang, cấu trúc wiki đầy đủ hơn (7/8 thư mục — còn thiếu api/)

---

## [2026-04-26] ingest | INS — Nhật Ký Vấn Đề BH Kaizen #08 (2017)

Nguồn: `Projects/Nghiệp vụ HRM/INS/IssuesLog/INS_Kaizen_08.md`

Tạo mới:
- `wiki/sources/INS-Kaizen-08.md` — Nhật ký vấn đề BH: 5 Whys D02/C70/Tên Công Việc/Tiền BH, ON-OFF thai sản, timezone bug, kế hoạch giảm bug Pareto 09–10/2017

Cập nhật:
- `wiki/concepts/HRM-Modules.md` — Thêm cross-link INS-Kaizen-08
- `wiki/index.md` — Thêm 1 dòng vào bảng Sources (tổng 34)
- `wiki/overview.md` — sources-ingested: 33 → 34

---

## [2026-04-26] ingest | INS — Phân hệ Bảo Hiểm HRM (13 ảnh, 9 ghi chú)

Nguồn: `1. Projects/Nghiệp vụ HRM/INS/` — 16 file (13 PNG đọc được, 2 PDF + 1 DOCX không đọc được)

Tạo mới (9 trang):
- `wiki/sources/INS-InsuranceMonthJoin.md` — Logic xác định tháng tham gia BH
- `wiki/sources/INS-InsurancePayback.md` — Logic hoàn trả BH
- `wiki/sources/INS-InsuranceRecordDayCount.md` — Đếm ngày bản ghi BH (+ DayCount_InsuranceRecord)
- `wiki/sources/INS-Nghi14Ngay.md` — Quy tắc nghỉ ốm hưởng BHXH
- `wiki/sources/INS-NghiThaiSan.md` — Chế độ thai sản
- `wiki/sources/INS-iBHXH-Analyze.md` — Phân tích tích hợp iBHXH điện tử
- `wiki/sources/INS-C70-TinhLuong.md` — Bảng lương C70 + đối soát BH
- `wiki/sources/INS-D02-ChungTu.md` — Chứng từ D02-TS (Venn + ThemPhanTu)
- `wiki/sources/INS-FishBone-Analysis.md` — FishBone 4M + 5 Whys RCA

Cập nhật:
- `wiki/concepts/HRM-Modules.md` — Bổ sung chi tiết phân hệ Bảo Hiểm + cross-links
- `wiki/index.md` — Thêm 9 dòng vào bảng Sources
- `wiki/overview.md` — Tăng sources-ingested

---

## [2026-04-26] ingest | INS — TruyNguyenNhan + VennD02 (2 file còn sót)

Tạo mới:
- `wiki/sources/INS-TruyNguyenNhan.md` — Phương pháp 4M Root Cause Analysis theo Kaizen Nhật Bản: 5 Whys, CAPA matrix, 9 checklist bước định vị lỗi INS
- `wiki/sources/INS-VennD02.md` — So sánh D02-VNPT / D02-Viettel / iBHXH (TS24): Venn diagram, bảng chi tiết, lỗi tích hợp, flowchart tư vấn

Cập nhật:
- `wiki/concepts/HRM-Modules.md` — Thêm 2 cross-links mới vào mục Bảo Hiểm
- `wiki/index.md` — Thêm 2 dòng vào bảng Sources (tổng 33)
- `wiki/overview.md` — sources-ingested: 31 → 33

---

## [2026-04-26] analyze | Wiki Analyze — health check lần 4

Stats: 31 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis (57 trang tổng)
Orphans: 1 (Vault-Structure)
Ghost pages (log ≠ disk): 6 trang (vẫn còn từ lần trước)
Index ↔ Disk: KHỚP HOÀN TOÀN — wiki STABLE, không thay đổi so với lần 3
Gaps tồn đọng: iBHXH-Portal concept, MISA-Integration concept, pvcfc entity, cross-links INS
Cập nhật: wiki/overview.md (lần 3 → 4, gaps list refresh: iBHXH-Portal nâng từ 🟢 lên 🟡)

---

## [2026-04-26] analyze | Wiki Analyze — health check lần 3

Stats: 31 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis (57 trang tổng)
Orphans: 1 (Vault-Structure không được link đến từ trang nội dung nào)
Ghost pages (log ≠ disk): 6 trang (vẫn còn từ lần trước)
Index ↔ Disk: KHỚP HOÀN TOÀN — 31 sources trên index = 31 trên disk
Dự án thiếu nguồn: Bitex (0🔴), HongNgoc (1🟡), Marico (1🟡), TrungDong (2🟡)
Gaps mới: iBHXH-Portal concept, D02-TS form concept, FIT-HRM vs MISA synthesis
Cập nhật: wiki/overview.md (stats + gaps list refresh)

---

## [2026-04-26] analyze | Wiki Analyze — health check lần 2

Stats: 22 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis (48 trang tổng)
Orphans: 2 (Vault-Structure không có inbound link; hoat-dong-wiki-v4 chưa vào index → đã fix)
Ghost pages (log ≠ disk): 6 trang (digest-daily, v1/v2/v3, tong-hop-hom-nay, huong-dan-wiki-system)
Dự án thiếu nguồn: Bitex (0), HongNgoc (1), Marico (1), TrungDong (2)
Gaps mới phát hiện: pvcfc chưa có entity; BaoHiem-Module + MISA-Integration chưa có concept
Fixes: index.md thêm hoat-dong-wiki-v4; overview.md cập nhật stats + gaps list
Cập nhật: wiki/overview.md, wiki/index.md

---

## [2026-04-26] tonghop | Hệ thống LLM Wiki — hướng dẫn & sức khỏe tổng thể

Đọc: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`
Tạo synthesis: `wiki/synthesis/huong-dan-wiki-system-26-04-2026.md`
Nội dung: kiến trúc 3 lớp, thống kê 51 trang, biểu đồ phân bố, quan hệ giữa các thành phần, gaps & khuyến nghị

---

## [2026-04-26] analyze | Wiki Analyze — health check toàn bộ

Stats: 22 sources, 5 projects, 13 concepts, 5 entities, 3 synthesis (51 trang tổng)
Orphans: 2 (hoat-dong-wiki-26-04-2026-v4 chưa vào index; Vault-Structure không được link đến)
Dự án thiếu nguồn: Bitex (0), HongNgoc (1), Marico (1), TrungDong (2)
Gaps mới phát hiện: entity/Bitex chưa có; concept BaoHiem-Module và MISA-Integration chưa có
Fixes: overview.md sources-ingested 21→22, Projects 4→5, Synthesis 2→3
Cập nhật: wiki/overview.md

---

## [2026-04-26] tonghop | Hoạt động wiki ngày 26/04/2026 — cú pháp chart v4

Đọc: dữ liệu từ phiên (index, log, digest, BaoHiem-Research)
Tạo tổng hợp: `wiki/synthesis/hoat-dong-wiki-26-04-2026-v4.md`

---

## [2026-04-26] tonghop | Hoạt động wiki ngày 26/04/2026 — chuẩn mới (story telling v3)

Đọc: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/digest-2026-04-26-daily`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`
Tạo tổng hợp: `wiki/synthesis/hoat-dong-wiki-26-04-2026-v3.md`

---

## [2026-04-26] tonghop | Hoạt động wiki ngày 26/04/2026 — story telling

Đọc: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/digest-2026-04-26-daily`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`
Tạo tổng hợp: `wiki/synthesis/hoat-dong-wiki-26-04-2026-v2.md`

---

## [2026-04-26] tonghop | Hoạt động wiki ngày 26/04/2026

Đọc: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/digest-2026-04-26-daily`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`
Tạo tổng hợp: `wiki/synthesis/hoat-dong-wiki-26-04-2026.md`

---

## [2026-04-26] tonghop | Báo cáo tổng hợp hôm nay

Đọc: `wiki/index.md`, `wiki/log.md`, `wiki/sources/Nhat-ky-van-de-he-thong`, `wiki/sources/Nhat-ky-van-de-nghiep-vu`, `wiki/sources/WarmupStatus-Performance-2026`, `wiki/sources/GitNexus-Daily-Note`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`, `wiki/synthesis/digest-2026-04-26-daily`
Tạo tổng hợp: `wiki/synthesis/tong-hop-hom-nay-20260426.md`

---

## [2026-04-26] digest | Daily — 26/04/2026

Tạo: `wiki/synthesis/digest-2026-04-26-daily.md`
Stats: 2 ingest, 1 research, 4 sources mới, 22 tổng sources, 5 projects

---

## [2026-04-26] ingest | 2026-Apr-17 Daily — 65 files (SysLog chi tiết + WarmupStatus + GitNexus)

Tạo mới:
- `wiki/sources/SysLog-HeThong-Chi-Tiet.md` (23 lỗi Sys000–Sys022 IIS/SQL/Log/Network)
- `wiki/sources/SysLog-NghiepVu-Chi-Tiet.md` (29 lỗi Sys00001–Sys00029 nghiệp vụ SE)
- `wiki/sources/WarmupStatus-Performance-2026.md` (6 services + Identity Razor warmup)
- `wiki/sources/GitNexus-Daily-Note.md` (ghi chú GitNexus khi tách nhánh)

Cập nhật:
- `wiki/concepts/HRM-IIS-Troubleshooting.md` (thêm source links)
- `wiki/concepts/HRM-SQL-Troubleshooting.md` (thêm source links)
- `wiki/concepts/HRM-Code-Quality.md` (thêm source links)
- `wiki/index.md` (thêm 4 dòng Sources)
- `wiki/overview.md` (sources-ingested: 25)


---

## [2026-04-26] ingest | Nhật Ký Vấn Đề Hệ Thống (Sys000–Sys022)

Tạo: `wiki/sources/Nhat-ky-van-de-he-thong.md`
Tạo concepts: `HRM-IIS-Troubleshooting`, `HRM-SQL-Troubleshooting`, `HRM-Log-Monitoring`, `HRM-Security-Config`, `HRM-Network-Check`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-04-26] ingest | Nhật Ký Vấn Đề Nghiệp Vụ SE (Sys00001–Sys00029)

Tạo: `wiki/sources/Nhat-ky-van-de-nghiep-vu.md`
Tạo concepts: `HRM-Deploy-Checklist`, `HRM-Code-Quality`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

---

## [2026-04-25] ingest | VnPay — Goals, Scope, Resources, Risks

Tạo: `wiki/sources/VnPay-Goals-Scope-Resources.md`

---

## [2026-04-25] ingest | VnPay — Phases Timeline đầy đủ

Tạo: `wiki/sources/VnPay-Phases-Timeline.md`

---

## [2026-04-25] ingest | VnPay — Kiến trúc 13 services (Ý nghĩa các sites)

Tạo: `wiki/sources/VnPay-System-Architecture.md`

---

## [2026-04-25] ingest | VnPay — Sự cố nghẽn & Load test tháng 11-12/2025

Tạo: `wiki/sources/VnPay-Performance-Incident.md`

---

## [2026-04-25] ingest | H-VnPay-Att-17042025 — Họp Chấm công

Tạo: `wiki/sources/H-VnPay-Att-17042025.md`

---

## [2026-04-25] ingest | H-VnPay-TRA-30062025 — Họp UAT Tuyển dụng & Định biên

Tạo: `wiki/sources/H-VnPay-TRA-30062025.md`

---

## [2026-04-25] ingest | H-VnPay-INS-05082025 — Họp tích hợp Bảo hiểm MISA

Tạo: `wiki/sources/H-VnPay-INS-05082025.md`

---

## [2026-04-25] ingest | H-VnPay-Sys-03062025 — Họp UAT Phase 4

Tạo: `wiki/sources/H-VnPay-Sys-03062025.md`

---

## [2026-04-25] query | nghiên cứu thư mục TungLy — tổng quan vault

Khám phá toàn bộ cấu trúc vault. Tạo mới:
- `wiki/projects/Marico-Project.md`
- `wiki/concepts/AI-DevTools.md` (Cursor AI, Memory Bank, tech stack TungLy)
- `wiki/concepts/Vault-Structure.md` (cấu trúc thư mục, quy ước, danh sách dự án)
- `wiki/sources/AI-Cursor-MemoryBank.md`
- `wiki/sources/BaiGiang-DotNet-KendoUI-JWT.md`
- `wiki/sources/VnPay-Deploy-Guide.md`
- `wiki/sources/Marico-DanhGia-HopDong.md`
- `wiki/sources/Monthly-07-2024-TongHop.md`
Cập nhật: `wiki/index.md`, `wiki/overview.md`

---

## [2026-04-25] query | nghiên cứu vnpay — tổng hợp toàn bộ dự án

Tạo synthesis: `wiki/synthesis/VnPay-Lessons-Learned.md`  
Cập nhật: `wiki/projects/VnPay-Project.md` (rewrite đầy đủ), `wiki/index.md`, `wiki/log.md`

---

## [2026-04-25] ingest | H-TrungDong-Eva-31122024 — Biên bản họp xin nguồn lực Phase II

Tạo: `wiki/sources/H-TrungDong-Eva-31122024.md`  
Cập nhật: `wiki/projects/TrungDong-Project.md`, `wiki/entities/Minh.NguyenVan.md`, `wiki/index.md`

---

## [2026-04-25] ingest | H-TrungDong-Eva-14042025 — Biên bản họp kỹ thuật Đánh giá

Tạo: `wiki/sources/H-TrungDong-Eva-14042025.md`  
Cập nhật: `wiki/projects/TrungDong-Project.md` (quyết định kỹ thuật, lessons learned), `wiki/index.md`

---

## [2026-04-25] ingest | HongNgoc — Tài liệu xử lý đánh giá (JWT SSO)

Tạo: `wiki/sources/HongNgoc-DanhGia-SSO.md`  
Cập nhật: `wiki/projects/HongNgoc-Project.md` (giải pháp kỹ thuật, lessons learned), `wiki/index.md`

---

## [2026-04-26] research | Nghiệp vụ Bảo hiểm trong FIT-HRM

Đọc: 5 trang wiki + 7 file thô (LTG x2, FIT, UNIS x2, TBV, Karcher, VnPay)
Tạo: `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426.md`
Gaps: Kết quả tích hợp MISA sau 30/09/2025 chưa có; 01-HSB chưa dự án nào hoàn thành; BHTN chưa được đề cập; Story0724-2-1 bị trống

---

## [2026-04-25] init | Bootstrap wiki từ vault obs-Notes-Networking

Khởi tạo cấu trúc wiki ban đầu dựa trên nội dung vault hiện có:
- Tạo wiki/index.md, wiki/overview.md, wiki/log.md
- Tạo trang projects: VnPay, TrungDong, HongNgoc, Bitex
- Tạo trang entities: Hai.NguyenNgoc, Minh.NguyenVan, VnPay, TrungDong, HongNgoc
- Tạo trang concepts: HRM-Modules, Project-Phases, Nguon-Luc, Net8-Migration
- Tạo thư mục raw/ (sẵn sàng nhận nguồn mới)
- Tạo thư mục sources/, synthesis/ (trống, chờ ingest)
