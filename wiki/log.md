---
description: "Nhật ký hoạt động wiki HRM: ghi lại các lần ingest, cập nhật, phân tích và tổng hợp dữ liệu theo thời gian."
---

# Wiki Log

## [2026-05-23] ingest | Giao ban tuần 3 tháng 5 — 22/05/2026 (w5k9m)

Tạo: `wiki/sources/w5k9m-giao-ban-22052026.md`
Cập nhật: `wiki/index.md` — thêm entry sources

## [2026-05-20] ingest | Sys_MemoryMonitor — Giám sát Bộ nhớ Runtime (mm9x)

Tạo: `wiki/sources/mm9x--memory-monitor.md`
Tạo: `wiki/architecture/mm9x--memory-monitor.md`
Cập nhật: `wiki/index.md` — thêm entry sources + architecture

## [2026-05-04] ingest | AVN — LDAP không bảo mật (b3x9)

Tạo: `wiki/sources/AVN-LDAP-BaoMat-PhanTich.md`
Cập nhật: `wiki/projects/AVN-Project.md` — xác nhận LDAPS chưa có, cập nhật risk table
Cập nhật: `wiki/index.md` — thêm entry source mới

## [2026-05-04] ingest | RCA Formula14DayIns — TotalSickleaveDays = 0 (QPVN)

Nguồn: `raw/Nghiệp vụ HRM/INS/INS-RCA-Formula14Day-TotalSickUnpaid-20260504.md`
Tạo: `wiki/sources/INS-RCA-Formula14Day-TotalSickUnpaid-20260504.md`
Cập nhật: `wiki/projects/QuickPack-Project.md` — thêm link RCA source
Cập nhật: `wiki/index.md` — thêm entry source mới

## [2026-05-03] tonghop | phương pháp luận debug

Đọc: `wiki/concepts/PhuongPhapLuan-Debug`, `wiki/sources/PhuongPhapLuan-Debug`, `wiki/sources/PhuongPhapLuan-Socrates`, `wiki/sources/PhuongPhapLuan-FirstPrinciples`, `wiki/sources/PhuongPhapLuan-Aristotle`, `wiki/sources/PhuongPhapLuan-SAT`, `wiki/sources/Sach-TuDuyNhuSherlockHolmes`, `wiki/concepts/Kaizen-Methodology`
Tạo synthesis: `wiki/synthesis/phuong-phap-luan-debug-03-05-2026-m4rz.md`

## [2026-05-02] research | So sánh giao ban 2025 vs 2026

Báo cáo: `wiki/synthesis/GiaoBan-2025-vs-2026-Research-20260502-g5rx.md`
Nguồn: 41 biên bản giao ban (28 file 2025 + 13 file 2026) + 2 wiki sources
Key findings: Tái cơ cấu PTSP 25/03/2026, KPI trễ 2 năm liên tiếp, 21 kế cận được đào tạo, PM hóa toàn quốc 03/03/2026

## [2026-05-02] ingest | Phương pháp luận Debug tư duy bậc cao

Nguồn: 2 tài liệu nghiên cứu toản hợp (Core + Advanced), lưu thành 8 files trong `raw/archive/3. ARCHIEVED/Phuong_Phap_Luan/`
Tạo: `wiki/sources/PhuongPhapLuan-Debug.md`, `wiki/concepts/PhuongPhapLuan-Debug.md`
Cập nhật: `wiki/index.md` (Concepts + Sources)
Nội dung: 6 phương pháp luận (Sherlock/Einstein/DaVinci/Toyota/ContactTracing/Feynman) + Tâm lý học debug + SIR Model + Kiến trúc LLM Wiki 5 modes


Domain: Bảo hiểm (INS)
Đọc: `wiki/index.md`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`, `wiki/flows/Flow-BaoHiem-Monthly`
Ghi chú: Tổng quan INS01 4 bước, Err001-008, logic nghỉ 14 ngày, ON/OFF thai sản, chu kỳ 15-14, tích hợp MISA

## [2026-05-02] nghiepvu-query | SYS: nghiệp vụ phân quyền

Domain: Hệ thống (SYS / RBAC)
Đọc: `wiki/flows/Flow-PhanQuyen-HeThong`, `wiki/architecture/HRM-SysDB-Schema`, `wiki/sources/Sys-TaiLieuPhanQuyen-02`, `wiki/concepts/HRM-Security-Config`, `wiki/sources/LTG-SYS-Meetings-2024`
Ghi chú: 2 loại phân quyền (chức năng/dữ liệu), bitwise 8 bit PrivilegeNumber, pattern kiêm nhiệm đa pháp nhân (LTG), lỗ hổng Privilege Escalation VnPay pentest 10/2025

## [2026-05-01] research | Redis Cache VnPay — Standalone vs Sentinel vs Cluster

Đọc: `wiki/projects/VnPay-Project`, `wiki/architecture/HRM-System-Architecture`, `wiki/sources/Daily-2024-Cache-Redis`, `wiki/sources/VnPay-Performance-Incident`, `wiki/sources/VnPay-System-Architecture`
Đọc raw: `Confluence/Kiến trúc Redis Sentinel.md`, `Confluence/Chuyển Redis sang Sentinel...md`
Tạo synthesis: `wiki/synthesis/redis-cache-vnpay-Research-20260501-m7kt.md`
Tạo decision log: `wiki/decision-log/2026-06-19-redis-sentinel-vnpay.md`

## [2026-05-01] rootcause | Báo cáo tháng — 05/2026 IIS OOM VnPay

Đọc: `wiki/projects/VnPay-Project`, `wiki/concepts/HRM-IIS-Troubleshooting`, `wiki/sources/Nhat-ky-van-de-he-thong`
Tạo synthesis: `wiki/synthesis/monthly-rca-2026-05-vnpay-iis-oom-p9xk.md`
Tạo bug entry: `wiki/bugs/Sys025-iis-oom-vnpay.md`

## [2026-05-01] tonghop | VnPay phân tích toàn diện

Đọc: `wiki/projects/VnPay-Project`, `wiki/entities/VnPay`, `wiki/synthesis/VnPay-Research-20260427`, `wiki/sources/VnPay-Goals-Scope-Resources`, `wiki/sources/VnPay-Performance-Incident`, `wiki/sources/VnPay-Security-Vulnerability-Oct2025`, `wiki/sources/VnPay-System-Architecture`, `wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong`, `wiki/sources/vNPAY1538-ObjDataData-Net8-Bug`, `wiki/sources/H-VnPay-INS-05082025`, `wiki/sources/H-VnPay-Att-17042025`, `wiki/sources/H-VnPay-TRA-30062025`, `wiki/sources/H-VnPay-Sys-03062025`
Tạo synthesis: `wiki/synthesis/vnpay-phan-tich-toan-dien-01-05-2026-w3qf.md`

## [2026-05-01] tonghop | LTG Phase 3 toàn cảnh

Đọc: `wiki/projects/LTG-Project`, `wiki/entities/LTG`, `wiki/sources/LTG-INS-Meetings-2024`, `wiki/sources/LTG-TAL-Meetings-2024`, `wiki/sources/LTG-SYS-Meetings-2024`, `wiki/sources/LTG-TAL-Supplement-Jul2024`
Tạo synthesis: `wiki/synthesis/ltg-toan-canh-du-an-01-05-2026-p5nt.md`


## [2026-05-01] tonghop | biên bản họp LTG

Đọc: `wiki/sources/LTG-INS-Meetings-2024`, `wiki/sources/LTG-TAL-Meetings-2024`, `wiki/sources/LTG-SYS-Meetings-2024`, `wiki/sources/LTG-TAL-Supplement-Jul2024`, `wiki/projects/LTG-Project`, `wiki/entities/LTG`
Tạo synthesis: `wiki/synthesis/bienban-hop-ltg-01-05-2026-p4mg.md`

## [2026-05-01] tonghop | Bitex-AKW toàn cảnh

Đọc: `wiki/projects/Bitex-Project`, `wiki/flows/Flow-Bitex-Phases`, `wiki/sources/Bitex-Project-Overview`, `wiki/sources/Bitex-Chat-ChiHuyThiCong`, `wiki/sources/Bitex-TaskList-PostGoLive`, `wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading`, `wiki/synthesis/Bitex-Research-20260427`
Tạo synthesis: `wiki/synthesis/bitex-tong-hop-01-05-2026-b7xm.md`

## [2026-04-30] ingest | Batch: 4 PTSC orphans + INS-Thiet-Ke-Chuc-Nang + INS-Kaizen-Meta

Tạo mới:
- `wiki/sources/INS-Thiet-Ke-Chuc-Nang.md` — Thiết kế chức năng INS v8.0.1.1
- `wiki/sources/INS-Kaizen-Meta.md` — Giới thiệu Kaizen, mẫu thẻ, đề xuất họp đúng giờ
Cập nhật `wiki/index.md`: thêm 4 orphan PTSC sources + 2 source mới vào bảng Sources
Cập nhật `wiki/concepts/Kaizen-Methodology.md`: thêm link INS-Kaizen-Meta

## [2026-04-30] query | tài liệu giải pháp PTSC

Đọc: `wiki/synthesis/TaiLieuGiaiPhap-PTSC-Research-20260430-m8vx`, 6 trang PTSC-TLG sources
Kết quả: Tổng hợp 30 dataset/interface, kiến trúc 3-Tier, 5 gaps chính (Active–Standby, RPO/RTO, mTLS, SPOF, event bus)

## [2026-04-30] research | tai-lieu-giai-phap-ptsc

Đọc: 6 trang wiki PTSC-TLG (§1–§4.15), `wiki/architecture/HRM-System-Architecture`, `wiki/architecture/HRM-Auth-Architecture`, `wiki/sources/SaaS-VnR-Meetings-2023-2024`, 3 files raw PTSC (00-Index, s4.14-HA, s4.15-DR)
Tạo synthesis: `wiki/synthesis/TaiLieuGiaiPhap-PTSC-Research-20260430-m8vx.md`
Nội dung: 30 dataset/interface ESB, Master Data Hub, CDC 3 phương án, idempotent+CorrelationId, kiến trúc 3-Tier 5 servers, bảo mật 5 lớp AES-256, HA/DR gap analysis, 3 biểu đồ, 6 gợi ý hành động

---

## [2026-04-30] tonghop | tong-ket-ngay-30-04-2026

Đọc: `wiki/log.md`, `wiki/index.md`, `wiki/projects/PTSC-Project`, `wiki/sources/PTSC-TLG-*` (6 files), `wiki/sources/INS-Overview`, `wiki/sources/INS-Database-Tables`
Tạo synthesis: `wiki/synthesis/tong-ket-30-04-2026-m9xr.md`
Nội dung: 178 trang wiki, analyze #18, batch-ingest PTSC+INS, biểu đồ tăng trưởng, phân bố loại trang, INS coverage, PTSC prospect level mới, 3 câu hỏi suy ngẫm

---

## [2026-04-30] tonghop | bitex-toan-canh

Đọc: `wiki/projects/Bitex-Project`, `wiki/flows/Flow-Bitex-Phases`, `wiki/sources/Bitex-Project-Overview`, `wiki/sources/Bitex-Chat-ChiHuyThiCong`, `wiki/sources/Bitex-TaskList-PostGoLive`, `wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading`, `wiki/synthesis/Bitex-Research-20260427`
Tạo synthesis: `wiki/synthesis/bitex-toan-canh-30-04-2026.md`

## [2026-04-29] research | Check List Phân Quyền Hệ Thống HRM — q7wp3

Tạo: `wiki/synthesis/PhanQuyen-HeThong-CheckList-Research-20260429-q7wp3.md`
Cập nhật: `wiki/index.md`
Ghi chú: Nghiên cứu tổng hợp từ 17 nguồn (wiki + raw), 3 vòng tìm kiếm. 40+ check list items chia 6 nhóm: RBAC setup, DB/SQL, Auth/Session, Lỗ hổng thực tế (CWE-269/284/89), Kiêm nhiệm, Audit. Số liệu từ pentest VnPay 10/2025 (24 lỗ hổng), VietCap, AVN, NghiSon.
Nguồn chính: Flow-PhanQuyen-HeThong, HRM-SysDB-Schema, VnPay-Security-Vulnerability-Oct2025

---

## [2026-04-29] ingest | Giao ban VnResource 2026 (Q1) — 13 phiên giao ban 07/01–08/04/2026

Tạo: `wiki/sources/GiaoBan-2026-TongHop.md`
Cập nhật: `wiki/index.md`, `wiki/overview.md`
Ghi chú: File `Giao ban - 04082026.md` bị đặt nhầm vào thư mục 3. ARCHIEVED/Dự án 2025/ — thực tế là giao ban 08/04/2026, đã gộp vào nguồn 2026.
Nguồn: 12 file trong `1. Projects/Dự án 2026/Giao ban 2026 - Project/` + 1 file lạc thư mục (04082026)

---

## [2026-04-28] ingest | VNPAY1538-RCA-AppChiTietDonNghiTrong

Tạo: `wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong.md`
Cập nhật: `wiki/projects/VnPay-Project.md` (+1 source link), `wiki/concepts/Net8-Migration.md` (+section double-wrap risk + checklist)

---

## [2026-04-28] rootcause | Báo cáo tháng — 04/2026 — VNPAY1538 API double-wrap

Tạo: `wiki/synthesis/monthly-rca-2026-04.md`
Nội dung: PDCA đầy đủ — root cause Obj.Data.Data sau .NET 8 migration, 5 Whys, Pareto 1 nhóm, 5 action plans phòng ngừa tái diễn, check done VNPAY1538, follow-up audit toàn màn hình list→detail

---

## [2026-04-28] nghiepvu-query | ATT/SYS: nghiệp vụ HVN (Honda Vietnam)

Domain: Chấm công (ATT) + Hệ thống (SYS)
Đọc: `wiki/sources/HVN-SYS-KhoadoituongKyCong-2024`, `wiki/sources/MultiProject-SYS-Meetings-2024`, `wiki/index.md`
Ghi chú: HVN dùng 2 kỳ công/tháng — khóa đối tượng phải theo luồng NV → Loại NV → Loại kỳ công. Pattern này cần áp dụng cho mọi KH có 2+ kỳ/tháng. Chỉ có 1 source HVN trong wiki, cần ingest thêm nếu có.

> Append-only. KhÃ´ng sá»­a entry cÅ©. Format: `## [YYYY-MM-DD] <loáº¡i> | <tiÃªu Ä‘á»>`
> Loáº¡i: `ingest` | `query` | `lint` | `init`

---

## [2026-04-27] query | Dá»± Ã¡n LTG cÃ³ gÃ¬ Ä‘áº·c biá»‡t

Äá»c: `wiki/projects/LTG-Project`, `wiki/entities/LTG`, `wiki/sources/LTG-INS-Meetings-2024`, `wiki/sources/LTG-TAL-Meetings-2024`, `wiki/sources/LTG-SYS-Meetings-2024`, `wiki/sources/LTG-TAL-Supplement-Jul2024`
Káº¿t quáº£: Tá»•ng há»£p 4 Ä‘iá»ƒm Ä‘áº·c thÃ¹ LTG â€” ca 24h/nghá»‰ 14 ngÃ y, kiÃªm nhiá»‡m Ä‘a phÃ¡p nhÃ¢n, TAL Ä‘áº§y Ä‘á»§ nháº¥t vault, phÃ¢n quyá»n tá»± Ä‘á»™ng theo nhÃ³m NV

---

## [2026-04-27] query | TÃ¬m hiá»ƒu phÃ¢n quyá»n há»‡ thá»‘ng HRM

Äá»c: `wiki/flows/Flow-PhanQuyen-HeThong`, `wiki/sources/Sys-TaiLieuPhanQuyen-02`, `wiki/architecture/HRM-SysDB-Schema`, `wiki/sources/LTG-SYS-Meetings-2024`, `wiki/sources/Daily-2024-OPA-LDAP-Permission`
Káº¿t quáº£: Tá»•ng há»£p toÃ n diá»‡n 2 loáº¡i phÃ¢n quyá»n (chá»©c nÄƒng/dá»¯ liá»‡u), schema 8 báº£ng SYS, PrivilegeNumber bitwise, Get_Data_Permission_New pattern, kiÃªm nhiá»‡m Ä‘a phÃ¡p nhÃ¢n

---

## [2026-04-27] query | TÃ¬m hiá»ƒu InsSalaryPayBack â€” Ä‘iá»u chá»‰nh BH cáº¥p code

Äá»c: `wiki/sources/INS-InsurancePayback`, `wiki/sources/INS-TaiLieuBH-01-Schema`, `wiki/sources/TBV-INS-Meeting-2024`
Äá»c code: `Ins_InsuranceSalaryPayback.cs`, `Ins_InsurancePayBackServices.cs`, `InsurancePayBackInfo.cshtml`, `hrm_ins_sp_get_SalPayBack_New.sql`, `hrm_ins_sp_get_InsuranceSalaryPayback_Sal.sql`
Káº¿t quáº£: PhÃ¢n tÃ­ch Ä‘áº§y Ä‘á»§ entity schema (18 fields key), luá»“ng UI (auto-load tá»« Ins_ProfileInsuranceMonthly), cÃ´ng thá»©c InsSalaryAdjust = InsSalaryPayBack - InsSalary, DisplayCode TU/TT/CD áº©n hiá»‡n field

---

## [2026-04-27] query | TÃ¬m hiá»ƒu chá»©c nÄƒng Ä‘iá»u chá»‰nh báº£o hiá»ƒm

Äá»c: `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`, `wiki/sources/INS-D02-ChungTu`, `wiki/sources/INS-ThietKe-V8`, `wiki/flows/Flow-BaoHiem-Monthly`, `wiki/architecture/INS-Architecture`
Káº¿t quáº£: Tá»•ng há»£p toÃ n diá»‡n chá»©c nÄƒng Ä‘iá»u chá»‰nh BH â€” DC (mÃ£ 02 D02), Ins_InsuranceSalaryPayback, quy trÃ¬nh cáº­p nháº­t má»©c Ä‘Ã³ng, tÃ¬nh huá»‘ng truy thu/thoÃ¡i thu

---

## [2026-04-27] ingest | SYS batch â€” 4 tÃ i liá»‡u ká»¹ thuáº­t há»‡ thá»‘ng HRM

Táº¡o:
- `wiki/sources/Sys-TaiLieuHeThong-01.md` â€” 8 báº£ng DB SYS, UML, 50+ webconfig keys, báº£o máº­t
- `wiki/sources/Sys-TaiLieuPhanQuyen-02.md` â€” PhÃ¢n quyá»n: nhÃ³m quyá»n, mÃ n hÃ¬nh/nÃºt/tab
- `wiki/sources/Sys-TaiLieuLDAP-03.md` â€” TÃ­ch há»£p LDAP/Active Directory
- `wiki/sources/Sys-TaiLieuGetAPIToExcel-07.md` â€” HRM API â†’ Excel Power Query
- `wiki/architecture/HRM-SysDB-Schema.md` â€” Schema Ä‘áº§y Ä‘á»§ 8 báº£ng SYS
- `wiki/flows/Flow-PhanQuyen-HeThong.md` â€” Luá»“ng phÃ¢n quyá»n chá»©c nÄƒng + dá»¯ liá»‡u
- `wiki/flows/Flow-ResetPassword.md` â€” 3 luá»“ng báº£o máº­t password
- `wiki/flows/Flow-LDAP-Login.md` â€” Luá»“ng cáº¥u hÃ¬nh vÃ  Ä‘Äƒng nháº­p LDAP
- `wiki/api/HRM-API-Excel-Integration.md` â€” API Excel integration guide

Cáº­p nháº­t:
- `wiki/architecture/HRM-Auth-Architecture.md` â€” thÃªm LDAP + SYS DB links
- `wiki/concepts/HRM-Security-Config.md` â€” thÃªm webconfig keys + password policy
- `wiki/index.md` â€” thÃªm 3 flows + 1 architecture + 4 sources + API section
---

## [2026-04-27] ingest | INS folder batch â€” 17 file root + tailieubaohiem_01

Táº¡o sources:
- `wiki/sources/INS-NhatKy-VanDe-2017.md` â€” Nháº­t kÃ½ váº¥n Ä‘á» INS 2017 (D02, ON/OFF thai sáº£n, timezone bug, Pareto)
- `wiki/sources/INS-Troubleshooting-5Why.md` â€” 5-Why RCA: TÃªn CÃ´ng Viá»‡c, Sá»‘ Tiá»n BH, C70A=0; 4M framework
- `wiki/sources/INS-ThietKe-V8.md` â€” Thiáº¿t káº¿ chá»©c nÄƒng INS V8: nghiá»‡p vá»¥, biá»ƒu máº«u, IBHXH/EBHXH
- `wiki/sources/INS-TaiLieuBH-01-Schema.md` â€” Schema database Ä‘áº§y Ä‘á»§: 72+ fields, mÃ£ lá»—i Err001-Err008

Táº¡o flows:
- `wiki/flows/Flow-BaoHiem-Monthly.md` â€” Luá»“ng INS01: flowchart + sequenceDiagram, ON/OFF thai sáº£n

Táº¡o architecture:
- `wiki/architecture/INS-Architecture.md` â€” Layer architecture 4 phÃ¢n há»‡ + báº£ng trung tÃ¢m chi tiáº¿t

Files Ä‘Ã£ tá»“n táº¡i (skip): INS-Overview, INS-BC-D02, INS-Thai-San-On-Off, INS-Phan-Tich-BH-Lech-Thang, INS-FAQ-Phan-Tich-BH, INS-Chan-Doan-Su-Co, INS-Nguyen-Nhan-Ten-Cong-Viec, INS-Nguyen-Nhan-So-Tien-BH, INS-C70-FAQ, INS-BrainStorming-T10-2017, INS-Thiet-Ke-Chuc-Nang, INS-Bieu-Mau, INS-Nghiep-Vu, INS-IBHXH, INS-EBHXH, INS-Database-Tables, INS-Quy-Trinh â†’ ná»™i dung Ä‘Ã£ Ä‘Æ°á»£c tá»•ng há»£p vÃ o 4 sources + 2 trang má»›i

Cáº­p nháº­t: `wiki/index.md` â€” thÃªm 4 sources + 1 flow + 1 architecture
Cáº­p nháº­t: `wiki/overview.md` â€” sources +4, flows +1, architecture +1

---

## [2026-04-27] ingest | Ins_Kaizen_08 â€” 11 tháº» Kaizen BH + lÃ½ thuyáº¿t Kaizen

Táº¡o: `wiki/sources/INS-Kaizen-08-Cards.md` â€” 11 tháº» Kaizen thá»±c thi (Ins0001â€“Ins0011, 2017â€“2018)
Táº¡o: `wiki/concepts/Kaizen-Methodology.md` â€” LÃ½ thuyáº¿t Kaizen: 5S, 4 phÆ°Æ¡ng phÃ¡p, máº«u tháº»
Cáº­p nháº­t: `wiki/sources/INS-Kaizen-08.md` â€” thÃªm cross-links sang 2 trang má»›i
Cáº­p nháº­t: `wiki/index.md` â€” thÃªm 1 source + 1 concept
Cáº­p nháº­t: `wiki/overview.md` â€” sources-ingested +2

---

## [2026-04-27] ingest | INS-TaiLieuBaoHiem-01 â€” TÃ i liá»‡u BH toÃ n diá»‡n v8.0.1.x

Táº¡o: `wiki/sources/INS-TaiLieuBaoHiem-01.md`
Táº¡o: `wiki/architecture/INS-Database-Schema.md`
Cáº­p nháº­t: `wiki/index.md`, `wiki/overview.md`

---

## [2026-04-27] ingest | Batch ToÃ n bá»™ thÆ° má»¥c â€” 7 nhÃ³m quÃ©t + 4 source má»›i

**QuÃ©t**: 7 nhÃ³m file trÃªn toÃ n bá»™ raw/archive/ (loáº¡i trá»« wiki/)
**Káº¿t quáº£ Ä‘Ã¡nh giÃ¡ tá»«ng nhÃ³m:**
- NhÃ³m C (Danh sÃ¡ch dá»± Ã¡n 14 file): **Rá»—ng** â€” bá» qua
- NhÃ³m F (Story 07-2024 6 file): **Rá»—ng** â€” bá» qua
- NhÃ³m B (Daily Aug-Sep 2024): Háº§u háº¿t Ä‘Ã£ cover bá»Ÿi Daily-2024-* sources trÆ°á»›c â†’ bá» qua
- NhÃ³m A (SaaS VnR meetings 16 file): **Ná»™i dung phong phÃº** â†’ táº¡o source má»›i
- NhÃ³m E (Interview 4 file): **Há»“ sÆ¡ á»©ng viÃªn chi tiáº¿t** â†’ táº¡o source tá»•ng há»£p
- NhÃ³m G (Learning resources): Microservice SSO + Confluence vs WikiJS â†’ táº¡o source má»›i
- NhÃ³m D (Daily 2025 Jan-Feb): HongNgoc/PEWVN/INOAC/Lotte â†’ táº¡o source má»›i

**Táº¡o má»›i (4 trang):**
- `wiki/sources/SaaS-VnR-Meetings-Detail-2023.md` â€” 16 buá»•i há»p K8s/MinIO/Identity 07â€“10/2023
- `wiki/sources/Interview-SE-Candidates-2024.md` â€” 4 á»©ng viÃªn ThÃ¡i Báº£o An, MÃ£ Táº¥n VÄ©nh, Nguyá»…n HoÃ ng Trung, Tráº§n CÃ´ng Duy
- `wiki/sources/Learning-MicroService-Confluence-Tools.md` â€” SSO 3 tÃ¬nh huá»‘ng + Confluence vs WikiJS
- `wiki/sources/Daily-2025-Jan-Feb-Projects.md` â€” HongNgoc, PEWVN, INOAC, Lotte Okta, TVC, VnPay SSO Jan-Feb 2025

**PhÃ¡t hiá»‡n má»›i:**
- Dá»± Ã¡n Lotte Mark (SSO Okta OIDC) â€” chÆ°a cÃ³ entity/project trong wiki
- Dá»± Ã¡n INOAC (cháº¥m cÃ´ng + phÃ¢n quyá»n) â€” chÆ°a cÃ³ entity
- Dá»± Ã¡n TVC â€” Ä‘Ã£ biáº¿t nhÆ°ng file rá»—ng, khÃ´ng cÃ³ ná»™i dung

Cáº­p nháº­t: `wiki/index.md` (+4 dÃ²ng), `wiki/overview.md` (sources 67â†’71)

---


Stats thá»±c táº¿ trÃªn disk:
- Sources: 67 trang (overview cÅ© ghi 70 â€” lá»‡ch 3, Ä‘Ã£ fix)
- Projects: 6 (2 active: VnPay, Bitex | 4 archived)
- Entities: 12 | Concepts: 14 | Synthesis: 6 | Flows: 5 | Architecture: 4 | Glossary: 1
- **Tá»•ng: ~115 trang ná»™i dung**

PhÃ¡t hiá»‡n má»›i:
- Ghost pages (3): rca-schedule-vnws, rca-inoac-redis, rca-redis-stop â€” log cÃ³, disk khÃ´ng cÃ³
- 2 synthesis trang chÆ°a vÃ o index.md â†’ Ä‘Ã£ fix
- overview.md lá»‡ch sources (70â†’67) vÃ  synthesis (3â†’6) â†’ Ä‘Ã£ fix

Tá»“n Ä‘á»ng:
- Orphans: 1 (Vault-Structure)
- Bitex: dá»± Ã¡n ACTIVE, 0 sources ðŸ”´
- ChÆ°a cÃ³: Bitex entity, iBHXH-Portal concept, MISA-Integration concept, api/ folder

Cáº­p nháº­t: wiki/overview.md (v3â†’v4), wiki/index.md (thÃªm 2 synthesis, last-analyzed)

---
## [2026-04-27] tonghop | Káº¿t thÃºc ngÃ y 27/04/2026 â€” FINAL (sau Bitex + QuickPack)

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`, `wiki/synthesis/toan-canh-wiki-ket-thuc-ngay-27-04-2026`, `wiki/projects/Bitex-Project`, `wiki/projects/QuickPack-Project`
Táº¡o synthesis: `wiki/synthesis/ket-thuc-ngay-27-04-2026-final.md`
Ná»™i dung: ~130 trang, Bitex gap Ä‘á» Ä‘Ã£ Ä‘Ã³ng, QuickPack onboard, 4 biá»ƒu Ä‘á»“, tá»· lá»‡ Query>Ingest, 3 quy luáº­t má»›i, 10 khuyáº¿n nghá»‹, 3 cÃ¢u há»i suy ngáº«m

---

## [2026-04-27] tonghop | ToÃ n cáº£nh wiki káº¿t thÃºc ngÃ y 27/04/2026

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/hoat-dong-wiki-27-04-2026`, `wiki/synthesis/hoat-dong-wiki-27-04-2026-v2`
Táº¡o synthesis: `wiki/synthesis/toan-canh-wiki-ket-thuc-ngay-27-04-2026.md`
Ná»™i dung: 120+ trang, INS 85% phá»§, SYS láº§n Ä‘áº§u khai thÃ¡c, 6 entity má»›i, 3 RCA, vÃ²ng láº·p wikiâ†’bug-fix hoÃ n chá»‰nh, 4 biá»ƒu Ä‘á»“, 10 khuyáº¿n nghá»‹, 3 cÃ¢u há»i suy ngáº«m

---

## [2026-04-27] tonghop | Tá»•ng káº¿t cuá»‘i ngÃ y 27/04/2026 â€” Bug-fix VNWs + toÃ n cáº£nh

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/hoat-dong-wiki-27-04-2026`
Táº¡o synthesis: `wiki/synthesis/hoat-dong-wiki-27-04-2026-v2.md`
Ná»™i dung: bug-fix VNWs Sys024 thá»±c chiáº¿n, wiki tra cá»©u thÃ nh cÃ´ng láº§n Ä‘áº§u, timeline 16 ngÃ y sá»± cá»‘, routing bug TaskScheduleService, 4 biá»ƒu Ä‘á»“, 10 khuyáº¿n nghá»‹, 3 cÃ¢u há»i suy ngáº«m

---

## [2026-04-27] tonghop | Hoáº¡t Ä‘á»™ng wiki ngÃ y 27/04/2026

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/hoat-dong-wiki-26-04-2026-v4`
Táº¡o synthesis: `wiki/synthesis/hoat-dong-wiki-27-04-2026.md`
Ná»™i dung: tÄƒng trÆ°á»Ÿng 50+ trang, 6 entities má»›i, 3 RCA, VnPay research, phÃ¢n bá»‘ nguá»“n theo khÃ¡ch hÃ ng, khuyáº¿n nghá»‹ Æ°u tiÃªn

---

## [2026-04-27] rootcause | Nháº­t kÃ½ & PhÃ¢n tÃ­ch â€” Sys024 Schedule VNWs khÃ´ng tá»± cháº¡y (OPA)

Soáº¡n 4 loáº¡i output (A/B/C/D) cho váº¥n Ä‘á» Schedule láº¥y há»“ sÆ¡ á»©ng viÃªn VNWs dá»«ng 16 ngÃ y do upbuild khÃ´ng stop Windows Service. LÆ°u táº¡i wiki/synthesis/rca-schedule-vnws-opa-20260418.md + append Nhat-ky-van-de-he-thong.md (Sys024)

---

## [2026-04-27] rootcause | Nháº­t kÃ½ â€” Sys023 Redis Cache Att_RosterGroup lá»‡ch DB (INOAC)

Soáº¡n 4 loáº¡i output (A/B/C/D) cho váº¥n Ä‘á» Redis cache nhÃ³m ca INOAC. LÆ°u táº¡i wiki/synthesis/rca-inoac-redis-cache-20260427.md + append Nhat-ky-van-de-he-thong.md

---

## [2026-04-27] rca | Redis tá»± Stop & Restart â€” IIS Pools máº¥t káº¿t ná»‘i cache

PhÃ¢n tÃ­ch live Redis (port 6379 + 6380), xÃ¡c Ä‘á»‹nh root cause: Redis cháº¡y trÃªn Cygwin khÃ´ng cÃ³ supervisor, AOF bloat 56MB, maxmemory=0. Äá» xuáº¥t 6 hÃ nh Ä‘á»™ng kháº¯c phá»¥c. LÆ°u táº¡i wiki/synthesis/rca-redis-stop-restart-20260427.md

---

## [2026-04-27] research | VnPay â€” BÃ¡o cÃ¡o toÃ n diá»‡n

Äá»c: 10 trang wiki + 3 file thÃ´ (log lá»—i T10/2025, tri thá»©c thÃ´, danh sÃ¡ch dá»± Ã¡n)
Táº¡o bÃ¡o cÃ¡o: `wiki/synthesis/VnPay-Research-20260427.md`
Chá»§ Ä‘á»: khÃ¡ch hÃ ng, kiáº¿n trÃºc 13 services, timeline 8 giai Ä‘oáº¡n, sá»± cá»‘ ngháº½n, tÃ­ch há»£p MISA, lessons learned

---

## [2026-04-27] ingest | NhÃ³m 1 rÃ  soÃ¡t â€” LTG-TAL, HVN, FGL, AMIS-ISO, HongNgoc

Táº¡o má»›i (6 source pages):
- `wiki/sources/LTG-TAL-Supplement-Jul2024.md` â€” bÃ¬nh luáº­n Báº®T BUá»˜C trÆ°á»›c duyá»‡t, tá»± táº¡o má»¥c tiÃªu GAP, NhÃ³m NV vÃ o phÃ¢n quyá»n tá»± Ä‘á»™ng, scheduler task, cáº£nh bÃ¡o L&D
- `wiki/sources/HVN-SYS-KhoadoituongKyCong-2024.md` â€” khÃ³a Ä‘á»‘i tÆ°á»£ng 2 ká»³ cÃ´ng/thÃ¡ng; NVâ†’NhÃ³mNVâ†’Loáº¡iKyCong
- `wiki/sources/FGL-Survey-RedirectJWT-2024.md` â€” SurveyAuthen/Index redirect gateway, JWT (CodeEmp/ProfileName/OrgstructureName)
- `wiki/sources/AMIS-ISO-AgileScrum-2024.md` â€” máº«u quy trÃ¬nh ISO 7 má»¥c, Agile Scrum Misa, chuáº©n hÃ³a khá»‘i sáº£n xuáº¥t VnR
- `wiki/sources/HongNgoc-AutoLogin-JWT-2025.md` â€” auto-login Ä‘Ã¡nh giÃ¡ cÅ©â†’má»›i qua SSO_SecretKey JWT shared

Cáº­p nháº­t: `wiki/index.md`, `wiki/overview.md` (sources 64â†’70, tá»•ng ~112 trang)

---

## [2026-04-27] ingest | Äá»£t 3 â€” UNIS/VCBs bá»• sung + OPA/LDAP + Interview + ATT bug + Daily 2025

Táº¡o má»›i (9 source pages):
- `wiki/sources/UNIS-INS-Jun2024-Supplement.md` â€” BH tá»± nguyá»‡n kick-off 10/06, thÃªm quá»‘c tá»‹ch ngÆ°á»i thÃ¢n
- `wiki/sources/VCBs-TAL-Jul2024-Supplement.md` â€” TAL: field "KhÃ­a cáº¡nh", chá»n ngÆ°á»i kháº£o sÃ¡t
- `wiki/sources/StandardUI-SE-2024.md` â€” 6 nhÃ³m tiÃªu chuáº©n SE: UI, button, validate, thÃ´ng bÃ¡o
- `wiki/sources/Daily-2024-OPA-LDAP-Permission.md` â€” OPA cache API v3, OpenLDAP Ubuntu, sp_GetPermissionNew EntityType
- `wiki/sources/Daily-2024-Vietcap-SSO-Security.md` â€” XSS HasXSSConfig, LTG SSO email, GetIntegratedUserList
- `wiki/sources/Daily-2025-CursorAI-Net8.md` â€” Cursor Memory Bank, FormCollectionâ†’IFormCollection migration
- `wiki/sources/Interview-SE-VnResource-2024.md` â€” quy trÃ¬nh phá»ng váº¥n SE, 5 khÃ­a cáº¡nh Ä‘Ã¡nh giÃ¡
- `wiki/sources/ATT-BUG01-PhepNam-NgayLe.md` â€” sai tá»•ng cÃ´ng khi phÃ©p trÃ¹ng lá»…, fix TimesheetSummary
- (NhÃ³m A, C, D rá»—ng â€” bá» qua)

Cáº­p nháº­t: `wiki/index.md`, `wiki/overview.md` (sources 55â†’64, tá»•ng ~106 trang)

---

## [2026-04-27] ingest | Äá»£t 2 â€” Daily 2024 + FIT + PKM

Táº¡o má»›i:
- `wiki/sources/Daily-2024-SSO-Auth.md` â€” Okta OIDC (Colgate), Azure AD, ADFS (FIT), auth.config patterns
- `wiki/sources/Daily-2024-Security-Fixes.md` â€” XSS grid, SQL Injection, Broken Access Control (GetUserList, GetEnum)
- `wiki/sources/Daily-2024-SQL-Performance.md` â€” Get_MasterDataForUser refactor, CPU 38750msâ†’672ms, temp table
- `wiki/sources/Daily-2024-Cache-Redis.md` â€” 5-pool cache, Task.Run HttpContext bug+fix, Redis 7.2.5 migration
- `wiki/sources/Daily-2024-INS-Bugs.md` â€” C70 hotfix nghá»‰ á»‘m dÃ i ngÃ y, VDSC leavedayTypeCount bug
- `wiki/sources/Daily-2024-PowerBI-Integration.md` â€” Power Query Bearer token, API_SP_GET_BANK, dynamic columns
- `wiki/sources/FIT-Meetings-2024.md` â€” mail server per company, BH chu ká»³ 15-14, ADFS SSO claims mapping
- `wiki/entities/FIT.md` â€” FIT project ná»™i bá»™ (ADFS, BH 15-14, mail per company)
- `wiki/concepts/PKM-Methods.md` â€” PARA, Zettelkasten, Socrates, Second Brain, Microservice decision framework

Cáº­p nháº­t: `wiki/index.md`, `wiki/overview.md` (sources 47â†’55, entities 10â†’11, concepts 13â†’14, tá»•ng ~97 trang)

---

## [2026-04-27] analyze | Wiki Analyze â€” health check láº§n 6

Stats: 34 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis, 5 flows, 4 architecture, 1 glossary â†’ **70 trang tá»•ng**
Orphans: 1 (Vault-Structure â€” tá»“n Ä‘á»ng tá»« láº§n trÆ°á»›c)
Ghost pages (log â‰  disk): 6 trang (tá»“n Ä‘á»ng Ä‘Ã£ biáº¿t)
Index â†” Disk: âœ… KHá»šP HOÃ€N TOÃ€N â€” wiki STABLE, khÃ´ng cÃ³ ingest má»›i ká»ƒ tá»« 2026-04-26
Dá»± Ã¡n thiáº¿u nguá»“n: Bitex (0ðŸ”´), HongNgoc (1ðŸŸ¡), Marico (1ðŸŸ¡ archived), TrungDong (2ðŸŸ¡)
Gaps tá»“n Ä‘á»ng: pvcfc entity, iBHXH-Portal concept, MISA-Integration concept, api/ folder, 2 flows cÃ²n thiáº¿u
Cáº­p nháº­t: wiki/overview.md (láº§n 5 â†’ 6, date-updated: 2026-04-27)

---

## [2026-04-27] ingest | Äá»£t 1 Batch Ingest â€” Projects 2024 + 2025 Archived

**Nguá»“n**: 1.Projects/LTG/, 1.Projects/UNI/, 1.Projects/VCBs/, 1.Projects/Taisun/, 1.Projects/FGL/, 1.Projects/HVN/, 1.Projects/Toyota/, 1.Projects/AMIS/, 3.ARCHIEVED/dá»± Ã¡n 2024/(TBV, Karcher), 3.ARCHIEVED/dá»± Ã¡n 2025/(TrungDong supplement, Terumo, Giao ban 2025), 1.Projects/07-2024 tá»•ng há»£p/, 1.Projects/SaaS-VnR/, 2.RESOURCE/Nghiep-vu-HRM/

**Táº¡o má»›i â€” Sources (13 trang)**:
- `wiki/sources/LTG-INS-Meetings-2024.md` â€” 2 há»p BH LTG: ca 24h, nghá»‰ 14 ngÃ y custom, ngÃ y nghá»‰ khÃ´ng dÃ¹ng Cat_DayOff
- `wiki/sources/LTG-TAL-Meetings-2024.md` â€” 4 há»p NhÃ¢n TÃ i LTG: káº¿ thá»«a, GAP Ä‘Ã o táº¡o, phÃ¢n quyá»n tá»± Ä‘á»™ng nhÃ³m NV
- `wiki/sources/LTG-SYS-Meetings-2024.md` â€” 2 há»p SYS LTG: kiÃªm nhiá»‡m Ä‘a phÃ¡p nhÃ¢n, store Get_Data_PermissionConCurrent_New
- `wiki/sources/UNIS-INS-Meetings-2024.md` â€” BH tá»± nguyá»‡n giÃ¡o viÃªn VN + nÆ°á»›c ngoÃ i, Ä‘Äƒng kÃ½ ngÆ°á»i thÃ¢n
- `wiki/sources/TBV-INS-Meeting-2024.md` â€” BH nÃ¢ng cao: trÃ­ch ná»™p thiáº¿u, chá»‘t dÃ²ng, cáº£nh bÃ¡o, AMIS D02
- `wiki/sources/Karcher-INS-Meeting-2024.md` â€” nghá»‰ 14 ngÃ y khÃ´ng cÃ³ module CÃ´ng â†’ enum tá»« chá»©ng tá»«
- `wiki/sources/MultiProject-SYS-Meetings-2024.md` â€” Taisun/FGL/HVN/Toyota/AMIS: khÃ³a Ä‘á»‘i tÆ°á»£ng, survey redirect, phÃ¢n quyá»n tá»± Ä‘á»™ng, ISO
- `wiki/sources/VCBs-FAC-TAL-Meetings-2024.md` â€” Quáº£n lÃ½ tÃ i sáº£n FAC Ä‘áº§y Ä‘á»§ (6 quy trÃ¬nh + QR) + TAL khung nÄƒng lá»±c
- `wiki/sources/TrungDong-Eva-Meetings-2025-Supplement.md` â€” KPI 4 quÃ½, UAT2 18 task, nhÃ¢n tÃ i lÄ©nh vá»±c
- `wiki/sources/Terumo-SYS-Meeting-2024.md` â€” tÃ¡ch user main/portal HRM V3
- `wiki/sources/GiaoBan-2025-TongHop.md` â€” 28 giao ban VnR: ISO, nhÃ¢n sá»±, KPI, P.QTNNL, Succession
- `wiki/sources/NghiepVu-ATT-SAL.md` â€” nghiá»‡p vá»¥ ATT01â€“ATT05 (cháº¥m cÃ´ng) + SAL01 (lÆ°Æ¡ng)
- `wiki/sources/SaaS-VnR-Meetings-2023-2024.md` â€” K8s multi-tenant, MinIO, chuyá»ƒn Ä‘á»•i codebase SaaS

**Táº¡o má»›i â€” Entities (6 trang)**:
- `wiki/entities/LTG.md`, `wiki/entities/UNIS.md`, `wiki/entities/TBV.md`
- `wiki/entities/Karcher.md`, `wiki/entities/VCBs.md`, `wiki/entities/Terumo.md`

**Táº¡o má»›i â€” Projects (1 trang)**:
- `wiki/projects/LTG-Project.md`

**Cáº­p nháº­t**:
- `wiki/index.md` â€” thÃªm 13 sources, 6 entities, 1 project
- `wiki/overview.md` â€” sources: 34â†’47, entities: 5â†’10, projects: 5â†’6, tá»•ng: ~89 trang, version: v3

## [2026-04-26] analyze | Cáº­p nháº­t rule chuáº©n hÃ³a diagram â€” flows/ vs architecture/

Váº¥n Ä‘á»: flows/ vÃ  architecture/ Ä‘ang bá»‹ trá»™n láº«n diagram (sequenceDiagram trong architecture, subgraph cáº¥u trÃºc trong flows).

Cáº­p nháº­t 2 file:

**CLAUDE.md** (rule toÃ n cá»¥c):
- ThÃªm thÆ° má»¥c `flows/`, `architecture/`, `glossary/`, `api/` vÃ o cáº¥u trÃºc wiki
- ThÃªm section "Quy táº¯c chuáº©n hÃ³a Diagram (Báº®T BUá»˜C)"
  - flows/: cho phÃ©p flowchart, sequenceDiagram, stateDiagram â€” mÃ´ táº£ bÆ°á»›c thá»±c hiá»‡n
  - architecture/: cho phÃ©p flowchart+subgraph, ASCII tree, code block â€” mÃ´ táº£ cáº¥u trÃºc tÄ©nh
  - Báº£ng phÃ¢n loáº¡i nhanh + nguyÃªn táº¯c + vÃ­ dá»¥ Ä‘Ãºng
  - 5 quy táº¯c cá»©ng KHÃ”NG BAO GIá»œ vi pháº¡m

**.claude/skills/01-wiki-ingest/SKILL.md**:
- ThÃªm "BÆ°á»›c 3b â€” PhÃ¢n loáº¡i ná»™i dung â†’ flows/ hoáº·c architecture/"
  - TiÃªu chÃ­ táº¡o flows/ (thá»© tá»± bÆ°á»›c, ai lÃ m gÃ¬, ráº½ nhÃ¡nh, message giá»¯a há»‡ thá»‘ng)
  - TiÃªu chÃ­ táº¡o architecture/ (component, káº¿t ná»‘i tÄ©nh, folder, háº¡ táº§ng)
  - Diagram cho phÃ©p cho tá»«ng loáº¡i (âœ…/âŒ rÃµ rÃ ng)
  - Quy táº¯c cá»©ng: khÃ´ng trá»™n, náº¿u cÃ³ cáº£ hai â†’ táº¡o 2 trang riÃªng
- ThÃªm section "Quy táº¯c Diagram" á»Ÿ cuá»‘i vá»›i báº£ng phÃ¢n loáº¡i + code máº«u

---

## [2026-04-26] analyze | Viáº¿t láº¡i architecture/ â€” ThÃªm code structure, Mermaid, SQL snippets

Váº¥n Ä‘á»: 4 trang architecture chá»‰ cÃ³ vÄƒn báº£n mÃ´ táº£, thiáº¿u code structure/diagram thá»±c táº¿.

Viáº¿t láº¡i toÃ n bá»™ 4 trang dá»±a trÃªn raw sources (Confluence docs VnPay):

**HRM-System-Architecture.md**:
- Mermaid graph K8s cluster (13 services, mÃ u sáº¯c, warning SPOF)
- Mermaid sequenceDiagram: login flow + Integration API flow
- ASCII tree: Windows Service + Hangfire flow
- Redis WarmupStatus key structure

**HRM-Auth-Architecture.md**:
- Mermaid graph: 3 mÃ´ hÃ¬nh auth (Local, JWT SSO, IDS4)
- Mermaid sequenceDiagram: OAuth2 Authorization Code Flow
- C# code: IDS4 client config, JWT Bearer validation
- JSON: JWT SSO config, JWT payload máº«u
- SQL: VnrDecrypt usage pattern
- Security checklist Ä‘áº§y Ä‘á»§

**HRM-Database-Architecture.md**:
- ASCII tree: Solution structure + Database schema
- SQL: CLR setup scripts, Memory Optimized setup, MAXDOP
- C# code: Entity structure (feature-based), DIServices pattern, Compiled Model
- SQL: Performance monitoring queries (top slow, blocking)
- Backup/restore checklist

**HRM-Deployment-Architecture.md**:
- ASCII tree: Solution folder structure
- ASCII tree: IIS deployment folder structure (wwwroot)
- XML: web.config keys báº¯t buá»™c
- Table: IIS Application Pools config
- PowerShell: phÃ¢n quyá»n IIS_IUSRS
- YAML: K8s Deployment manifest + Traefik IngressRoute
- Shell: git workflow chuyá»ƒn nhÃ¡nh .NET8 â†” .NETFramework
- ASCII tree: Multi-tenant structure
- S3 bucket structure + PowerShell upload/download
- C# code: WarmupService pattern (StartAsync, WarmupRazorViewAsync)
- Mermaid graph: Deploy pipeline + Monitoring stack

---

## [2026-04-26] analyze | Cáº­p nháº­t flows/ â€” ThÃªm Mermaid flowchart vÃ o 5 trang

Thay tháº¿ toÃ n bá»™ sÆ¡ Ä‘á»“ text thuáº§n (``` code block) báº±ng **Mermaid flowchart** vá»›i mÃ u sáº¯c vÃ  decision node:

- `Flow-TinhLuong-Monthly.md` â€” 1 diagram: end-to-end 9 bÆ°á»›c, decision node nghá»‰ á»‘m/thai sáº£n
- `Flow-KhaiBaoiBHXH.md` â€” 1 diagram: 8 bÆ°á»›c, decision node C70â†”D02 + duyá»‡t/tá»« chá»‘i
- `Flow-Deploy-HRM.md` â€” 2 diagram: IIS upbuild (10 bÆ°á»›c + rollback) + K8s (7 bÆ°á»›c + rollback)
- `Flow-UAT-Process.md` â€” 1 diagram: 10 bÆ°á»›c, vÃ²ng láº·p fix/reopen + sign-off gate
- `Flow-Onboarding-NhanVien.md` â€” 1 diagram: 8 bÆ°á»›c, decision node BHXH cÅ© + SSO

---

## [2026-04-26] analyze | Wiki Restructure â€” ThÃªm flows/ + architecture/ + glossary/

LÃ½ do: Wiki thiáº¿u 3 thÆ° má»¥c so vá»›i kiáº¿n trÃºc má»¥c tiÃªu (hrm-wiki). ToÃ n bá»™ ná»™i dung Ä‘Æ°á»£c tá»•ng há»£p tá»« 34 sources Ä‘Ã£ ingest.

Táº¡o má»›i â€” `wiki/flows/` (5 trang):
- `Flow-TinhLuong-Monthly.md` â€” Quy trÃ¬nh tÃ­nh lÆ°Æ¡ng thÃ¡ng end-to-end (9 bÆ°á»›c)
- `Flow-KhaiBaoiBHXH.md` â€” Quy trÃ¬nh khai bÃ¡o BHXH Ä‘iá»‡n tá»­ (8 bÆ°á»›c)
- `Flow-Deploy-HRM.md` â€” Quy trÃ¬nh deploy/upbuild + warmup (10 bÆ°á»›c, cÃ³ K8s variant)
- `Flow-UAT-Process.md` â€” Quy trÃ¬nh UAT: Ä‘Ã o táº¡o â†’ test â†’ fix â†’ sign-off (10 bÆ°á»›c)
- `Flow-Onboarding-NhanVien.md` â€” Quy trÃ¬nh onboarding nhÃ¢n viÃªn má»›i (8 bÆ°á»›c)

Táº¡o má»›i â€” `wiki/architecture/` (4 trang):
- `HRM-System-Architecture.md` â€” Tá»•ng quan: IIS vs K8s, 13 services, luá»“ng request, Ä‘iá»ƒm ngháº½n
- `HRM-Auth-Architecture.md` â€” JWT SSO, Identity Server 4, VnrDecrypt, RBAC, CORS
- `HRM-Database-Architecture.md` â€” SQL Server, CLR, Memory Optimized, MAXDOP, backup
- `HRM-Deployment-Architecture.md` â€” IIS config, K8s manifest, multi-tenant, S3, warmup

Táº¡o má»›i â€” `wiki/glossary/` (1 trang):
- `HRM-Glossary.md` â€” ~60 thuáº­t ngá»¯ & viáº¿t táº¯t: BH (BHXH/BHYT/BHTN), D02/C70, SE/BA/QC, IIS, CLR, K8s, JWT, Phases...

Cáº­p nháº­t:
- `wiki/index.md` â€” ThÃªm 3 section má»›i: Flows, Architecture, Glossary (Ä‘áº§u trang)
- `wiki/overview.md` â€” Tá»•ng trang: 60 â†’ 70; Gaps cáº­p nháº­t; wiki-version: v2

Stats: 10 trang má»›i, 70 tá»•ng trang, cáº¥u trÃºc wiki Ä‘áº§y Ä‘á»§ hÆ¡n (7/8 thÆ° má»¥c â€” cÃ²n thiáº¿u api/)

---

## [2026-04-26] ingest | INS â€” Nháº­t KÃ½ Váº¥n Äá» BH Kaizen #08 (2017)

Nguá»“n: `Projects/Nghiá»‡p vá»¥ HRM/INS/IssuesLog/INS_Kaizen_08.md`

Táº¡o má»›i:
- `wiki/sources/INS-Kaizen-08.md` â€” Nháº­t kÃ½ váº¥n Ä‘á» BH: 5 Whys D02/C70/TÃªn CÃ´ng Viá»‡c/Tiá»n BH, ON-OFF thai sáº£n, timezone bug, káº¿ hoáº¡ch giáº£m bug Pareto 09â€“10/2017

Cáº­p nháº­t:
- `wiki/concepts/HRM-Modules.md` â€” ThÃªm cross-link INS-Kaizen-08
- `wiki/index.md` â€” ThÃªm 1 dÃ²ng vÃ o báº£ng Sources (tá»•ng 34)
- `wiki/overview.md` â€” sources-ingested: 33 â†’ 34

---

## [2026-04-26] ingest | INS â€” PhÃ¢n há»‡ Báº£o Hiá»ƒm HRM (13 áº£nh, 9 ghi chÃº)

Nguá»“n: `1. Projects/Nghiá»‡p vá»¥ HRM/INS/` â€” 16 file (13 PNG Ä‘á»c Ä‘Æ°á»£c, 2 PDF + 1 DOCX khÃ´ng Ä‘á»c Ä‘Æ°á»£c)

Táº¡o má»›i (9 trang):
- `wiki/sources/INS-InsuranceMonthJoin.md` â€” Logic xÃ¡c Ä‘á»‹nh thÃ¡ng tham gia BH
- `wiki/sources/INS-InsurancePayback.md` â€” Logic hoÃ n tráº£ BH
- `wiki/sources/INS-InsuranceRecordDayCount.md` â€” Äáº¿m ngÃ y báº£n ghi BH (+ DayCount_InsuranceRecord)
- `wiki/sources/INS-Nghi14Ngay.md` â€” Quy táº¯c nghá»‰ á»‘m hÆ°á»Ÿng BHXH
- `wiki/sources/INS-NghiThaiSan.md` â€” Cháº¿ Ä‘á»™ thai sáº£n
- `wiki/sources/INS-iBHXH-Analyze.md` â€” PhÃ¢n tÃ­ch tÃ­ch há»£p iBHXH Ä‘iá»‡n tá»­
- `wiki/sources/INS-C70-TinhLuong.md` â€” Báº£ng lÆ°Æ¡ng C70 + Ä‘á»‘i soÃ¡t BH
- `wiki/sources/INS-D02-ChungTu.md` â€” Chá»©ng tá»« D02-TS (Venn + ThemPhanTu)
- `wiki/sources/INS-FishBone-Analysis.md` â€” FishBone 4M + 5 Whys RCA

Cáº­p nháº­t:
- `wiki/concepts/HRM-Modules.md` â€” Bá»• sung chi tiáº¿t phÃ¢n há»‡ Báº£o Hiá»ƒm + cross-links
- `wiki/index.md` â€” ThÃªm 9 dÃ²ng vÃ o báº£ng Sources
- `wiki/overview.md` â€” TÄƒng sources-ingested

---

## [2026-04-26] ingest | INS â€” TruyNguyenNhan + VennD02 (2 file cÃ²n sÃ³t)

Táº¡o má»›i:
- `wiki/sources/INS-TruyNguyenNhan.md` â€” PhÆ°Æ¡ng phÃ¡p 4M Root Cause Analysis theo Kaizen Nháº­t Báº£n: 5 Whys, CAPA matrix, 9 checklist bÆ°á»›c Ä‘á»‹nh vá»‹ lá»—i INS
- `wiki/sources/INS-VennD02.md` â€” So sÃ¡nh D02-VNPT / D02-Viettel / iBHXH (TS24): Venn diagram, báº£ng chi tiáº¿t, lá»—i tÃ­ch há»£p, flowchart tÆ° váº¥n

Cáº­p nháº­t:
- `wiki/concepts/HRM-Modules.md` â€” ThÃªm 2 cross-links má»›i vÃ o má»¥c Báº£o Hiá»ƒm
- `wiki/index.md` â€” ThÃªm 2 dÃ²ng vÃ o báº£ng Sources (tá»•ng 33)
- `wiki/overview.md` â€” sources-ingested: 31 â†’ 33

---

## [2026-04-26] analyze | Wiki Analyze â€” health check láº§n 4

Stats: 31 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis (57 trang tá»•ng)
Orphans: 1 (Vault-Structure)
Ghost pages (log â‰  disk): 6 trang (váº«n cÃ²n tá»« láº§n trÆ°á»›c)
Index â†” Disk: KHá»šP HOÃ€N TOÃ€N â€” wiki STABLE, khÃ´ng thay Ä‘á»•i so vá»›i láº§n 3
Gaps tá»“n Ä‘á»ng: iBHXH-Portal concept, MISA-Integration concept, pvcfc entity, cross-links INS
Cáº­p nháº­t: wiki/overview.md (láº§n 3 â†’ 4, gaps list refresh: iBHXH-Portal nÃ¢ng tá»« ðŸŸ¢ lÃªn ðŸŸ¡)

---

## [2026-04-26] analyze | Wiki Analyze â€” health check láº§n 3

Stats: 31 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis (57 trang tá»•ng)
Orphans: 1 (Vault-Structure khÃ´ng Ä‘Æ°á»£c link Ä‘áº¿n tá»« trang ná»™i dung nÃ o)
Ghost pages (log â‰  disk): 6 trang (váº«n cÃ²n tá»« láº§n trÆ°á»›c)
Index â†” Disk: KHá»šP HOÃ€N TOÃ€N â€” 31 sources trÃªn index = 31 trÃªn disk
Dá»± Ã¡n thiáº¿u nguá»“n: Bitex (0ðŸ”´), HongNgoc (1ðŸŸ¡), Marico (1ðŸŸ¡), TrungDong (2ðŸŸ¡)
Gaps má»›i: iBHXH-Portal concept, D02-TS form concept, HRM vs MISA synthesis
Cáº­p nháº­t: wiki/overview.md (stats + gaps list refresh)

---

## [2026-04-26] analyze | Wiki Analyze â€” health check láº§n 2

Stats: 22 sources, 5 projects (2 active, 3 archived), 13 concepts, 5 entities, 3 synthesis (48 trang tá»•ng)
Orphans: 2 (Vault-Structure khÃ´ng cÃ³ inbound link; hoat-dong-wiki-v4 chÆ°a vÃ o index â†’ Ä‘Ã£ fix)
Ghost pages (log â‰  disk): 6 trang (digest-daily, v1/v2/v3, tong-hop-hom-nay, huong-dan-wiki-system)
Dá»± Ã¡n thiáº¿u nguá»“n: Bitex (0), HongNgoc (1), Marico (1), TrungDong (2)
Gaps má»›i phÃ¡t hiá»‡n: pvcfc chÆ°a cÃ³ entity; BaoHiem-Module + MISA-Integration chÆ°a cÃ³ concept
Fixes: index.md thÃªm hoat-dong-wiki-v4; overview.md cáº­p nháº­t stats + gaps list
Cáº­p nháº­t: wiki/overview.md, wiki/index.md

---

## [2026-04-26] tonghop | Há»‡ thá»‘ng LLM Wiki â€” hÆ°á»›ng dáº«n & sá»©c khá»e tá»•ng thá»ƒ

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`
Táº¡o synthesis: `wiki/synthesis/huong-dan-wiki-system-26-04-2026.md`
Ná»™i dung: kiáº¿n trÃºc 3 lá»›p, thá»‘ng kÃª 51 trang, biá»ƒu Ä‘á»“ phÃ¢n bá»‘, quan há»‡ giá»¯a cÃ¡c thÃ nh pháº§n, gaps & khuyáº¿n nghá»‹

---

## [2026-04-26] analyze | Wiki Analyze â€” health check toÃ n bá»™

Stats: 22 sources, 5 projects, 13 concepts, 5 entities, 3 synthesis (51 trang tá»•ng)
Orphans: 2 (hoat-dong-wiki-26-04-2026-v4 chÆ°a vÃ o index; Vault-Structure khÃ´ng Ä‘Æ°á»£c link Ä‘áº¿n)
Dá»± Ã¡n thiáº¿u nguá»“n: Bitex (0), HongNgoc (1), Marico (1), TrungDong (2)
Gaps má»›i phÃ¡t hiá»‡n: entity/Bitex chÆ°a cÃ³; concept BaoHiem-Module vÃ  MISA-Integration chÆ°a cÃ³
Fixes: overview.md sources-ingested 21â†’22, Projects 4â†’5, Synthesis 2â†’3
Cáº­p nháº­t: wiki/overview.md

---

## [2026-04-26] tonghop | Hoáº¡t Ä‘á»™ng wiki ngÃ y 26/04/2026 â€” cÃº phÃ¡p chart v4

Äá»c: dá»¯ liá»‡u tá»« phiÃªn (index, log, digest, BaoHiem-Research)
Táº¡o tá»•ng há»£p: `wiki/synthesis/hoat-dong-wiki-26-04-2026-v4.md`

---

## [2026-04-26] tonghop | Hoáº¡t Ä‘á»™ng wiki ngÃ y 26/04/2026 â€” chuáº©n má»›i (story telling v3)

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/digest-2026-04-26-daily`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`
Táº¡o tá»•ng há»£p: `wiki/synthesis/hoat-dong-wiki-26-04-2026-v3.md`

---

## [2026-04-26] tonghop | Hoáº¡t Ä‘á»™ng wiki ngÃ y 26/04/2026 â€” story telling

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/digest-2026-04-26-daily`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`
Táº¡o tá»•ng há»£p: `wiki/synthesis/hoat-dong-wiki-26-04-2026-v2.md`

---

## [2026-04-26] tonghop | Hoáº¡t Ä‘á»™ng wiki ngÃ y 26/04/2026

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/synthesis/digest-2026-04-26-daily`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`
Táº¡o tá»•ng há»£p: `wiki/synthesis/hoat-dong-wiki-26-04-2026.md`

---

## [2026-04-26] tonghop | BÃ¡o cÃ¡o tá»•ng há»£p hÃ´m nay

Äá»c: `wiki/index.md`, `wiki/log.md`, `wiki/sources/Nhat-ky-van-de-he-thong`, `wiki/sources/Nhat-ky-van-de-nghiep-vu`, `wiki/sources/WarmupStatus-Performance-2026`, `wiki/sources/GitNexus-Daily-Note`, `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426`, `wiki/synthesis/digest-2026-04-26-daily`
Táº¡o tá»•ng há»£p: `wiki/synthesis/tong-hop-hom-nay-20260426.md`

---

## [2026-04-26] digest | Daily â€” 26/04/2026

Táº¡o: `wiki/synthesis/digest-2026-04-26-daily.md`
Stats: 2 ingest, 1 research, 4 sources má»›i, 22 tá»•ng sources, 5 projects

---

## [2026-04-26] ingest | 2026-Apr-17 Daily â€” 65 files (SysLog chi tiáº¿t + WarmupStatus + GitNexus)

Táº¡o má»›i:
- `wiki/sources/SysLog-HeThong-Chi-Tiet.md` (23 lá»—i Sys000â€“Sys022 IIS/SQL/Log/Network)
- `wiki/sources/SysLog-NghiepVu-Chi-Tiet.md` (29 lá»—i Sys00001â€“Sys00029 nghiá»‡p vá»¥ SE)
- `wiki/sources/WarmupStatus-Performance-2026.md` (6 services + Identity Razor warmup)
- `wiki/sources/GitNexus-Daily-Note.md` (ghi chÃº GitNexus khi tÃ¡ch nhÃ¡nh)

Cáº­p nháº­t:
- `wiki/concepts/HRM-IIS-Troubleshooting.md` (thÃªm source links)
- `wiki/concepts/HRM-SQL-Troubleshooting.md` (thÃªm source links)
- `wiki/concepts/HRM-Code-Quality.md` (thÃªm source links)
- `wiki/index.md` (thÃªm 4 dÃ²ng Sources)
- `wiki/overview.md` (sources-ingested: 25)


---

## [2026-04-26] ingest | Nháº­t KÃ½ Váº¥n Äá» Há»‡ Thá»‘ng (Sys000â€“Sys022)

Táº¡o: `wiki/sources/Nhat-ky-van-de-he-thong.md`
Táº¡o concepts: `HRM-IIS-Troubleshooting`, `HRM-SQL-Troubleshooting`, `HRM-Log-Monitoring`, `HRM-Security-Config`, `HRM-Network-Check`
Cáº­p nháº­t: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-04-26] ingest | Nháº­t KÃ½ Váº¥n Äá» Nghiá»‡p Vá»¥ SE (Sys00001â€“Sys00029)

Táº¡o: `wiki/sources/Nhat-ky-van-de-nghiep-vu.md`
Táº¡o concepts: `HRM-Deploy-Checklist`, `HRM-Code-Quality`
Cáº­p nháº­t: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

---

## [2026-04-25] ingest | VnPay â€” Goals, Scope, Resources, Risks

Táº¡o: `wiki/sources/VnPay-Goals-Scope-Resources.md`

---

## [2026-04-25] ingest | VnPay â€” Phases Timeline Ä‘áº§y Ä‘á»§

Táº¡o: `wiki/sources/VnPay-Phases-Timeline.md`

---

## [2026-04-25] ingest | VnPay â€” Kiáº¿n trÃºc 13 services (Ã nghÄ©a cÃ¡c sites)

Táº¡o: `wiki/sources/VnPay-System-Architecture.md`

---

## [2026-04-25] ingest | VnPay â€” Sá»± cá»‘ ngháº½n & Load test thÃ¡ng 11-12/2025

Táº¡o: `wiki/sources/VnPay-Performance-Incident.md`

---

## [2026-04-25] ingest | H-VnPay-Att-17042025 â€” Há»p Cháº¥m cÃ´ng

Táº¡o: `wiki/sources/H-VnPay-Att-17042025.md`

---

## [2026-04-25] ingest | H-VnPay-TRA-30062025 â€” Há»p UAT Tuyá»ƒn dá»¥ng & Äá»‹nh biÃªn

Táº¡o: `wiki/sources/H-VnPay-TRA-30062025.md`

---

## [2026-04-25] ingest | H-VnPay-INS-05082025 â€” Há»p tÃ­ch há»£p Báº£o hiá»ƒm MISA

Táº¡o: `wiki/sources/H-VnPay-INS-05082025.md`

---

## [2026-04-25] ingest | H-VnPay-Sys-03062025 â€” Há»p UAT Phase 4

Táº¡o: `wiki/sources/H-VnPay-Sys-03062025.md`

---

## [2026-04-25] query | nghiÃªn cá»©u thÆ° má»¥c TungLy â€” tá»•ng quan vault

KhÃ¡m phÃ¡ toÃ n bá»™ cáº¥u trÃºc vault. Táº¡o má»›i:
- `wiki/projects/Marico-Project.md`
- `wiki/concepts/AI-DevTools.md` (Cursor AI, Memory Bank, tech stack TungLy)
- `wiki/concepts/Vault-Structure.md` (cáº¥u trÃºc thÆ° má»¥c, quy Æ°á»›c, danh sÃ¡ch dá»± Ã¡n)
- `wiki/sources/AI-Cursor-MemoryBank.md`
- `wiki/sources/BaiGiang-DotNet-KendoUI-JWT.md`
- `wiki/sources/VnPay-Deploy-Guide.md`
- `wiki/sources/Marico-DanhGia-HopDong.md`
- `wiki/sources/Monthly-07-2024-TongHop.md`
Cáº­p nháº­t: `wiki/index.md`, `wiki/overview.md`

---

## [2026-04-25] query | nghiÃªn cá»©u vnpay â€” tá»•ng há»£p toÃ n bá»™ dá»± Ã¡n

Táº¡o synthesis: `wiki/synthesis/VnPay-Lessons-Learned.md`  
Cáº­p nháº­t: `wiki/projects/VnPay-Project.md` (rewrite Ä‘áº§y Ä‘á»§), `wiki/index.md`, `wiki/log.md`

---

## [2026-04-25] ingest | H-TrungDong-Eva-31122024 â€” BiÃªn báº£n há»p xin nguá»“n lá»±c Phase II

Táº¡o: `wiki/sources/H-TrungDong-Eva-31122024.md`  
Cáº­p nháº­t: `wiki/projects/TrungDong-Project.md`, `wiki/entities/Minh.NguyenVan.md`, `wiki/index.md`

---

## [2026-04-25] ingest | H-TrungDong-Eva-14042025 â€” BiÃªn báº£n há»p ká»¹ thuáº­t ÄÃ¡nh giÃ¡

Táº¡o: `wiki/sources/H-TrungDong-Eva-14042025.md`  
Cáº­p nháº­t: `wiki/projects/TrungDong-Project.md` (quyáº¿t Ä‘á»‹nh ká»¹ thuáº­t, lessons learned), `wiki/index.md`

---

## [2026-04-25] ingest | HongNgoc â€” TÃ i liá»‡u xá»­ lÃ½ Ä‘Ã¡nh giÃ¡ (JWT SSO)

Táº¡o: `wiki/sources/HongNgoc-DanhGia-SSO.md`  
Cáº­p nháº­t: `wiki/projects/HongNgoc-Project.md` (giáº£i phÃ¡p ká»¹ thuáº­t, lessons learned), `wiki/index.md`

---

## [2026-04-26] research | Nghiá»‡p vá»¥ Báº£o hiá»ƒm trong HRM

Äá»c: 5 trang wiki + 7 file thÃ´ (LTG x2, FIT, UNIS x2, TBV, Karcher, VnPay)
Táº¡o: `wiki/synthesis/BaoHiem-NghiepVu-Research-20260426.md`
Gaps: Káº¿t quáº£ tÃ­ch há»£p MISA sau 30/09/2025 chÆ°a cÃ³; 01-HSB chÆ°a dá»± Ã¡n nÃ o hoÃ n thÃ nh; BHTN chÆ°a Ä‘Æ°á»£c Ä‘á» cáº­p; Story0724-2-1 bá»‹ trá»‘ng

---

## [2026-04-25] init | Bootstrap wiki tá»« vault obs-Notes-Networking

Khá»Ÿi táº¡o cáº¥u trÃºc wiki ban Ä‘áº§u dá»±a trÃªn ná»™i dung vault hiá»‡n cÃ³:
- Táº¡o wiki/index.md, wiki/overview.md, wiki/log.md
- Táº¡o trang projects: VnPay, TrungDong, HongNgoc, Bitex
- Táº¡o trang entities: Hai.NguyenNgoc, Minh.NguyenVan, VnPay, TrungDong, HongNgoc
- Táº¡o trang concepts: HRM-Modules, Project-Phases, Nguon-Luc, Net8-Migration
- Táº¡o thÆ° má»¥c raw/ (sáºµn sÃ ng nháº­n nguá»“n má»›i)
- Táº¡o thÆ° má»¥c sources/, synthesis/ (trá»‘ng, chá» ingest)

## [2026-04-27] ingest | QuickPack-Project â€” ToÃ n bá»™ thÆ° má»¥c dá»± Ã¡n QPVN

Táº¡o: `wiki/sources/QuickPack-Project-Overview.md`
Táº¡o: `wiki/projects/QuickPack-Project.md`
Táº¡o: `wiki/entities/QuickPack.md`
Táº¡o: `wiki/flows/Flow-QuickPack-Phases.md`
Cáº­p nháº­t: `wiki/index.md`, `wiki/overview.md`
Nguá»“n: 29 file trong `1. Projects/Dá»± Ã¡n 2026/QuickPack-Project/` (Goals, Scope, Timeline, Risks, Phases, DailyNotes, Meeting_Notes, Documents)

## [2026-04-28] tonghop | So sÃ¡nh 3 dá»± Ã¡n Golive 2025 â€” VnPay / QuickPack / Bitex

Äá»c: `wiki/projects/VnPay-Project.md`, `wiki/projects/Bitex-Project.md`, `wiki/projects/QuickPack-Project.md`, `wiki/synthesis/toan-canh-wiki-ket-thuc-ngay-27-04-2026.md`, `wiki/projects/LTG-Project.md`
Táº¡o synthesis: `wiki/synthesis/hoat-dong-wiki-28-04-2026.md`
Chá»§ Ä‘á»: So sÃ¡nh toÃ n diá»‡n 3 dá»± Ã¡n Golive T12/2025 â€” pattern rá»§i ro, timeline, GAP, bÃ i há»c PM

---

Táº¡o: `wiki/sources/Bitex-Project-Overview.md`, `wiki/sources/Bitex-Chat-ChiHuyThiCong.md`, `wiki/sources/Bitex-TaskList-PostGoLive.md`
Táº¡o: `wiki/flows/Flow-Bitex-Phases.md`
Cáº­p nháº­t: `wiki/projects/Bitex-Project.md`, `wiki/index.md`, `wiki/overview.md`
Nguá»“n: 19 file trong `1. Projects/Dá»± Ã¡n 2026/Bitex-Project/` (Goals, Scope, Timeline, Risks, Resources, Phases, DailyNotes, Meeting_Notes)

## [2026-04-27] research | Dá»± Ã¡n Bitex-AKW â€” toÃ n cáº£nh triá»ƒn khai, rá»§i ro, bÃ i há»c PM

Nguá»“n: 5 trang wiki (Bitex-Project, Flow-Bitex-Phases, Bitex-Project-Overview, Bitex-Chat-ChiHuyThiCong, Bitex-TaskList-PostGoLive)
Káº¿t quáº£: Táº¡o `wiki/synthesis/Bitex-Research-20260427.md`
Cáº­p nháº­t: `wiki/index.md`, `wiki/log.md`

## [2026-04-27] research | Dá»± Ã¡n QuickPack Viá»‡t Nam (QPVN) â€” 8 phÃ¢n há»‡, GAP, nguá»“n lá»±c, ká»¹ thuáº­t
Nguá»“n wiki: 4 trang (QuickPack-Project, entities/QuickPack, QuickPack-Project-Overview, Flow-QuickPack-Phases)
Nguá»“n thÃ´: 14 files (Goals, Scope, Timeline, Risks, Resources, GAP, Issues, Phases, Meeting Notes)
Káº¿t quáº£: Táº¡o `wiki/synthesis/QuickPack-Research-20260427.md`
Cáº­p nháº­t: `wiki/index.md`, `wiki/log.md`


## [2026-04-29] research | Giao ban VnResource 2026 — tái cấu trúc PTSP, KPI, ISO, thuế TNCN
Nguồn wiki: 2 trang (GiaoBan-2026-TongHop, GiaoBan-2025-TongHop)
Nguồn thô: 14 files (12 biên bản Giao ban 2026 + 1 file lạc 08/04/2026 + 1 context 2025)
Kết quả: Tạo wiki/synthesis/GiaoBan-2026-Research-20260429-p4wn9.md

## [2026-04-29] research | Giao ban 2026 — Góc nhìn văn hóa tổ chức: vi phạm R/NC, gia hạn GĐVP, deadline pattern
Nguồn wiki: 3 trang (GiaoBan-2026-TongHop, GiaoBan-2025-TongHop, synthesis p4wn9)
Nguồn thô: 13 files (toàn bộ biên bản giao ban Q1/2026)
Kết quả: Tạo wiki/synthesis/GiaoBan-2026-Research-20260429-k7m3x.md

---

## [2026-04-29] batch-ingest | 14 file chưa ingest — ATT, INS, SYS, .NET8 bug

Tạo mới 14 trang sources:
- `wiki/sources/vNPAY1538-ObjDataData-Net8-Bug.md` — phân tích Obj.Data.Data double-wrap .NET 8
- `wiki/sources/ATT-DangKy-QuenChamCong.md` — incident quên chấm công portal báo lỗi
- `wiki/sources/INS-BC-D02.md` — bug Mantis #57589: D02 thiếu điều chỉnh lương thai sản/14 ngày
- `wiki/sources/INS-Bieu-Mau.md` — biểu mẫu TK01/TK02/D02-TS/C70A đầy đủ
- `wiki/sources/INS-BrainStorming-T10-2017.md` — Pareto 70% bug T9/2017, kế hoạch T10
- `wiki/sources/INS-C70-FAQ.md` — FAQ C70/C70A: lương BHXH=0, conflict logic cũ/mới
- `wiki/sources/INS-Chan-Doan-Su-Co.md` — chẩn đoán sự cố BH: 3 trục trặc, 4M framework
- `wiki/sources/INS-EBHXH.md` — bảng mã EBHXH: 11 Tăng / 16 Giảm / Điều chỉnh
- `wiki/sources/INS-FAQ-Phan-Tich-BH.md` — FAQ phân tích BH: 4M, 3 loại trục trặc
- `wiki/sources/INS-Nghiep-Vu.md` — nghiệp vụ tăng/giảm + logic số quyết định D02
- `wiki/sources/INS-Phan-Tich-BH-Lech-Thang.md` — timezone bug Mantis #87680
- `wiki/sources/INS-Quy-Trinh.md` — quy trình INS01: 4 bước, luồng HRE→ATT→INS→SAL
- `wiki/sources/INS-Thai-San-On-Off.md` — ON/OFF thai sản Mantis #57594: pivot 14/15
- `wiki/sources/Tieuchuan-SE-30052024.md` — tiêu chuẩn SE (Nghĩa): UI, button, validate
- `wiki/sources/TaiLieu-KienTruc-HeThong-VnR.md` — placeholder PDF kiến trúc VnR Docs
Cập nhật: `wiki/index.md`, `wiki/overview.md`
Ghi chú: File PDF kiến trúc hệ thống chưa đọc được — đã tạo placeholder

## [2026-04-30] analyze | Wiki Analyze lần 18

Stats: 108 sources, 8 projects, 13 entities, 15 concepts, 11 flows, 7 architecture, 14 synthesis, 1 glossary, 1 api = **178 trang tổng**
Orphans: 1 trang (Vault-Structure)
Ghost pages: 4 (3 rca-* cũ + GiaoBan-2026 p4wn9/k7m3x không tìm thấy file)
Index lệch: 3 synthesis chưa vào index.md (hoat-dong-28, ket-thuc-final, monthly-rca)
Gaps mới phát hiện: PTSC — 51 raw files TaiLieuGiaiPhap chưa ingest, chưa có project page
Cập nhật: wiki/overview.md (v4.9)

## [2026-04-30] lint | Wiki Health Check

Tìm thấy: 2 vấn đề nghiêm trọng, 3 cần chú ý, 3 đề xuất
Fix tự động:
- Thêm `[[wiki/projects/PTSC-Project]]` vào index.md (orphan page)
- Đánh dấu ⚠️ GHOST cho `GiaoBan-2026-Research-20260429` trong index.md
- Thêm 4 synthesis còn thiếu vào index.md: hoat-dong-28, ket-thuc-final, monthly-rca, tong-ket-30-04

---

## [2026-04-30] batch-ingest | 11 file — INS (5) + PTSC TaiLieuGiaiPhap (6 nhóm)

Tạo mới 11 trang sources:
- `wiki/sources/INS-Database-Tables.md` — 72 bảng DB phân hệ INS, 2 bảng đã xóa, bảng trung tâm
- `wiki/sources/INS-IBHXH.md` — mã IBHXH Tăng (12) + Giảm (19), mapping Col0–Col53
- `wiki/sources/INS-Nguyen-Nhan-So-Tien-BH.md` — RCA 5-Why: textbox công thức không trực quan
- `wiki/sources/INS-Nguyen-Nhan-Ten-Cong-Viec.md` — RCA 5-Why: thiếu validate chức danh theo luật
- `wiki/sources/INS-Overview.md` — index nhật ký vấn đề phân hệ BH 2017, 3 Mantis, 4M
- `wiki/sources/PTSC-TLG-PhamVi.md` — §1–2 phạm vi 30 dataset, 30 interface, HR Master Data Hub
- `wiki/sources/PTSC-TLG-KyThuatTichHop-Core.md` — §3 CDC, luồng 2 chiều, stable PK, metadata
- `wiki/sources/PTSC-TLG-BaoMat-IAM.md` — §3 OAuth2/OIDC, mTLS, IAM/SSO, scope per client
- `wiki/sources/PTSC-TLG-Idempotent-Operations.md` — §3 idempotent API, CorrelationId, retry, reprocess
- `wiki/sources/PTSC-TLG-KienTruc-NenTang.md` — §4.1–4.6 3-Tier, 5 servers, multi-env, IaaS
- `wiki/sources/PTSC-TLG-BaoMat-HA-DR.md` — §4.7–4.15 bảo mật 5 lớp, 2FA, AES-256, HA, DR
Tạo mới 1 trang project:
- `wiki/projects/PTSC-Project.md` — PTSC Prospect 2026
Cập nhật: `wiki/index.md`, `wiki/overview.md`

## [2026-05-02] lint | Health check (05-wiki-lint)

Kiểm tra: flows (11), architecture (7), projects (9), entities (13), concepts (15), sources (118), synthesis (21), bugs (1), decision-log (1), glossary (1), api (1)

**Phát hiện:**
- 🔴 4 trang synthesis orphan (có trên disk, không có trong index): `bienban-hop-ltg-01-05-2026-p4mg`, `bitex-tong-hop-01-05-2026-b7xm`, `ltg-toan-canh-du-an-01-05-2026-p5nt`, `vnpay-phan-tich-toan-dien-01-05-2026-w3qf`
- 🔴 1 ghost mới phát hiện: `PhanQuyen-HeThong-CheckList-Research-20260429-q7wp3` (có trong index, không có file)
- 🟡 Stats overview stale: Synthesis count 16 → thực tế 21, Index↔Disk sai
- ✅ Không có dead links rõ ràng, không phát hiện mâu thuẫn dữ liệu

**Fix tự động:**
- Thêm 4 trang synthesis vào `wiki/index.md`
- Cập nhật entry `PhanQuyen-Checklist` thành ⚠️ GHOST trong index
- Sửa `wiki/overview.md`: Synthesis 16→21, Ghost 4→5, Index↔Disk status, ngày analyze

## [2026-05-02] ingest | INS FAQ — 9 file checklist phân tích BH

Tạo: `wiki/sources/INS-FAQ-QuyTrinh5Buoc.md`
Tạo: `wiki/sources/INS-FAQ-4GocNhinTrucTrac.md`
Tạo: `wiki/sources/INS-FAQ-KhongCoDuLieu.md`
Tạo: `wiki/sources/INS-FAQ-LuongBHXHBang0.md`
Tạo: `wiki/sources/INS-FAQ-Nghi14NgayBaoThaiSan.md`
Tạo: `wiki/sources/INS-FAQ-ThaiSanBaoNghi14Ngay.md`
Tạo: `wiki/sources/INS-FAQ-PhanTichTheoDot.md`
Tạo: `wiki/sources/INS-FAQ-NghiViecNgoaiChuKy.md`
Tạo: `wiki/sources/INS-FAQ-NghiViecTrongKy.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-06] ingest | AVN LDAPS Implementation

Tạo: `wiki/sources/ldap1-avn-ldaps-implementation-2026-05-06.md`
Cập nhật: `wiki/projects/AVN-Project.md`, `wiki/index.md`

---

## [2026-05-05] tonghop | toan-canh-portfolio-9-du-an

Đọc: `wiki/projects/VnPay`, `wiki/projects/Bitex`, `wiki/projects/QuickPack`, `wiki/projects/LTG`, `wiki/projects/AVN`, `wiki/projects/PTSC`, `wiki/projects/TrungDong`, `wiki/projects/HongNgoc`, `wiki/projects/Marico`
Tạo synthesis: `wiki/synthesis/p7vx-tong-hop-tat-ca-du-an-05-05-2026.md`

---

## [2026-05-02] ingest | SaaS VnR — Kiến Trúc, Stack & Quyết Định (2023)

Tạo: `wiki/sources/SaaS-VnR-KienTruc-Stack.md`
Tạo: `wiki/architecture/SaaS-MultiTenant-Architecture.md`
Cập nhật: `wiki/index.md` (thêm vào bảng Sources + Architecture), `wiki/overview.md`

---

## [2026-05-02] ingest | Batch 4 sources mới (CheckList-PhanQuyen, SonarQube, Ký Số, SSO)

Tạo: `wiki/sources/CheckList-PhanQuyen-HRM.md`
Tạo: `wiki/sources/SonarQube-Setup-Guide.md`
Tạo: `wiki/sources/KySo-WindowsService.md`
Tạo: `wiki/sources/INS-D02-FAQ.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

---

## [2026-05-02] ingest | INS D02 FAQ – Bộ FAQ D02 (6 file)

Tạo: `wiki/sources/INS-D02-FAQ.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

---

## [2026-05-02] ingest | Mockoon User Guide

Tạo: `wiki/sources/Mockoon-UserGuide.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

---

## [2026-05-02] ingest | INS-Config-FAQ — Cấu hình Thiết lập Bảo Hiểm (Sys_InsConfig)

Tạo: `wiki/sources/INS-Config-FAQ.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

---

## [2026-05-02] ingest | PhuongPhapLuan — 4 phương pháp bổ sung (atomic, mỗi file 1 trang)

Tạo: `wiki/sources/PhuongPhapLuan-Socrates.md`
Tạo: `wiki/sources/PhuongPhapLuan-FirstPrinciples.md`
Tạo: `wiki/sources/PhuongPhapLuan-Aristotle.md`
Tạo: `wiki/sources/PhuongPhapLuan-SAT.md`
Xóa (merged sai): `wiki/sources/PhuongPhapLuan-Socrates-FirstPrinciples-Aristotle.md`
Cập nhật: `wiki/concepts/PhuongPhapLuan-Debug.md` — bảng 5 phương pháp bổ sung
Cập nhật: `wiki/concepts/PKM-Methods.md` — Zettelkasten chi tiết
Cập nhật: `wiki/index.md`
Lưu ý: 13 file ghi chú sách "Tư Duy Như Sherlock Holmes" không ingest riêng — bao hàm trong `01-Sherlock-Holmes.md` core.

---

## [2026-05-02] ingest | Sách Tư Duy Như Sherlock Holmes — Daniel Smith (13 file ghi chú)

Tạo: `wiki/sources/Sach-TuDuyNhuSherlockHolmes.md`
Cập nhật: `wiki/index.md`

---

## [2026-05-02] code-review | INS-Nghi14Ngay — Hai chế độ đếm ngày nghỉ 14 ngày

Query: INS_BUG_QPVN2596 — cột TotalSickleaveDays / TotalUnpaidLeaveDays trống trên Golive
Đọc: `InsuranceServices.cs` — hàm `CheckLeave14day`, `SetLeave14Days`, `Calculate14DayFomular`
Kết luận: Golive dùng `Formula14DayIns` → Chế độ 2 (công thức) → không phân biệt loại nghỉ → hai cột = 0
Cập nhật: `wiki/sources/INS-Nghi14Ngay.md` — bổ sung section kỹ thuật "Hai chế độ đếm", root cause QPVN2596, bài học thiết kế

## [2026-05-02] ingest | Ins027 — Lỗi phân tích BH Expression expected (phần tử BH thiếu)

Raw: `raw/Nghiệp vụ HRM/2026-05-02-ins-loi-phan-tich-bh-expression-expected-phan-tu-bh.md`
Tạo: `wiki/bugs/Ins027-phan-tich-bh-expression-expected-phan-tu-bh.md`
Cập nhật index: thêm Ins027 vào mục BugsnnCap nhat: wiki/index.md, wiki/overview.md (sources 142->143)

## [2026-05-03] research | ETL — Kiến thức nền tảng & Thực chiến (k7qm)

Nguồn: 9 file raw ETL (Data-WareHouse/, ELT-Airbyte/, Daily) + wiki/sources/PTSC-TLG-KyThuatTichHop-Core
Tạo: `wiki/synthesis/etl-kien-thuc-nen-tang-Research-20260503-k7qm.md`
Findings chính: API động đang làm Extract layer thực tế; Transform gần 0% production; CDC cam kết PTSC nhưng chưa verify codebase
Cập nhật: wiki/index.md — thêm entry synthesis mới

## [2026-05-03] research | Mockoon & API Mock — POST an toàn & LLM testing (p4kx)

Nguồn: wiki/sources/Mockoon-UserGuide, src/mockoon_user_guide.md, PTSC-TLG-Idempotent-Operations
Tạo: `wiki/synthesis/Mockoon-API-Mock-Research-20260503-p4kx.md`
Findings chính: Mockoon interceptor network tầng — POST không chạm DB; LLM dùng được hoàn toàn; 60% test case mockable; gap: không có DB test riêng
Hướng dẫn setup nhanh 5 phút có trong báo cáo
Cập nhật: wiki/index.md — thêm entry synthesis mới

## [2026-05-03] tonghop | Tổng kết ngày 03/05/2026 (w9qm)

Đọc: wiki/synthesis/etl-kien-thuc-nen-tang-k7qm, wiki/synthesis/Mockoon-API-Mock-p4kx, wiki/overview, wiki/log
Tạo synthesis: `wiki/synthesis/tong-ket-03-05-2026-w9qm.md`
Điểm nổi bật: Shadow ETL pipeline, CDC gap PTSC cam kết vs thực tế, Mockoon test strategy 60/25/15
Cập nhật: wiki/index.md, wiki/log.md

## [2026-05-03] ingest | Bóc tách chức năng — Phương pháp luận Debug #12

Tạo: `wiki/sources/PhuongPhapLuan-BocTachChucNang.md`
Cập nhật: `wiki/concepts/PhuongPhapLuan-Debug.md` — thêm phương pháp #12, quy tắc GUARD, liên kết mới
Cập nhật: `wiki/index.md` — thêm entry source mới

## [2026-05-03] ingest | Tổng hợp 12 phương pháp debug

Tạo: `wiki/sources/PhuongPhapLuan-Debug-12-TongHop.md`
Cập nhật: `wiki/concepts/PhuongPhapLuan-Debug.md` — thêm link source tổng hợp
Cập nhật: `wiki/index.md` — thêm entry source mới

## [2026-05-04] ingest | 2FA – IdentityServer4

Nguồn: `raw/Nghiệp vụ HRM/SYS/2fa-ids4-solution.md`
Tạo: `wiki/sources/2fa-ids4-solution.md`
Tạo: `wiki/flows/Flow-2FA-Login.md` (4 flow: setup, login, recovery, quản lý)
Tạo: `wiki/architecture/2FA-IDS4-Architecture.md` (TOTP component, Recovery Code, backend security)
Cập nhật: `wiki/architecture/HRM-Auth-Architecture.md` — thêm section 2FA + cross-links
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-04] ingest | Bug Fix INS — Thai sản + Nghỉ việc cùng tháng (T4 tick 2, T5 trống)

Nguồn: `raw/Nghiệp vụ HRM/INS/2026-05-04-phan-tich-bh-thai-san-nghi-viec-cung-thang.md`
Tạo: `wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang.md`
Tạo: `wiki/bugs/Ins028-thai-san-nghi-viec-cung-thang.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-04] ingest | Log Review — Gom nhóm log WindowsService & API SC (Bitex)

Nguồn: `raw/Nghiệp vụ HRM/Sys/2026-05-04-log-review-bitex.md`
Tạo: `wiki/sources/2026-05-04-log-review-bitex.md`
Cập nhật: `wiki/projects/Bitex-Project.md` — thêm R9 (fix Log Review), link source mới
Cập nhật: `wiki/concepts/HRM-Log-Monitoring.md` — thêm section Log Review gom nhóm service
Cập nhật: `wiki/index.md` — thêm entry source mới

## [2026-05-05] ingest | Bug Fix INS Ins029 — Phân tích BH tháng N+1 tự xóa dòng NV nghỉ việc đã confirmed

Nguồn: `raw/Nghiệp vụ HRM/INS/2026-05-05-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed.md`
Tạo: `wiki/sources/2026-05-05-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed.md`
Tạo: `wiki/bugs/Ins029-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed.md`
Cập nhật: `wiki/bugs/_index.md`, `wiki/sources/_index.md`, `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-05] ingest | Giao ban Tuần 1 Tháng 5 — 05/05/2026

Nguồn: `raw/archive/1. Projects/Dự án 2026/Giao ban 2026 - Project/Giao ban -05052026.md`
Tạo: `wiki/sources/g8k3p-giao-ban-05052026.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-05] ingest | Kế hoạch đào tạo Developer mới HRM (2025)

Nguồn: `raw/archive/3. ARCHIEVED/Dự án 2025/Kế hoạch đào tao/` (7 file + 1 thu mục con)
Tạo: `wiki/sources/x7k2p-dao-tao-dev-moi-hrm-2025.md`
Tạo: `wiki/flows/Flow-DaoTao-DevMoi-HRM.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-05] ingest | Cấu trúc Search — CatBank Demo (9 component)

Nguồn: `raw/archive/3. ARCHIEVED/Dự án 2025/Kế hoạch đào tao/Cấu trúc search/` (9 files)
Tạo: `wiki/sources/p4m7x-catbank-search-structure.md`
Tạo: `wiki/architecture/k9r2b-catbank-mvc-architecture.md`
Cập nhật: `wiki/sources/x7k2p-dao-tao-dev-moi-hrm-2025.md` — thêm cross-link
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-05] ingest | MODIFY PVFCCo — Thêm Lương cơ sở Hệ số 3P vào Lương cơ bản

Nguồn: `raw/0. Daily/Clippings/MODIFY_THÊM_LƯƠNG_CƠ SỞ CỦA HỆ SỐ 3P.md`
Tạo: `wiki/sources/m7p2k-pvfcco-luong-co-so-he-so-3p.md`
Cập nhật: `wiki/sources/_index.md` — thêm mục SAL mới
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-05] research | Giao ban 2025 & 2026 — Nhìn lại 2 năm, nhận xét sâu sắc

Nghiên cứu: 41 biên bản giao ban (28 file 2025 + 13 file 2026), bổ sung giao ban 05/05/2026
Insight mới vs báo cáo cũ (g5rx): vòng lặp chia thưởng 10 tháng, PMP drop-out, ISO learning curve
Tạo: `wiki/synthesis/m4vx9-giao-ban-2025-2026-Research-20260505.md`
Tham chiếu: `wiki/synthesis/GiaoBan-2025-vs-2026-Research-20260502-g5rx.md`

## [2026-05-05] lint | Health check — Tìm mâu thuẫn toàn bộ tài liệu

Tìm thấy: 3 nghiêm trọng, 4 cần chú ý
Fix tự động:
- M1: VnPay entity sửa mô tả dự án (upgrade → new-deployment+migration)
- M2: TrungDong entity sửa trạng thái (Training → Archived 22/01/2025)
- M4: Bitex-Project R8 cập nhật Fixed (05/05/2026)
- M6: Bitex-Project thêm Nguyễn Thị Lan Vy vào bảng nhân sự
Cần xác nhận thêm: M3 (Bitex GPS root cause 2 inc khác nhau), M7 (.NET Core vs .NET 8 QPVN)


Nguồn: `raw/Nghiệp vụ HRM/ATT/2026-05-05-loading-cham-cong-gps-wifi-dong-thoi.md`
Tạo: `wiki/sources/2026-05-05-loading-cham-cong-gps-wifi-dong-thoi.md`
Cập nhật: `wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading.md` — thêm cross-link bug fix
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-05] ingest | Flow CatBank — Luồng 4 tầng màn hình Danh mục Ngân hàng

Nguồn: `raw/Nghiệp vụ HRM/SYS/Sys_Flow_CatBank_08.md`
Tạo: `wiki/sources/b6n3w-sys-flow-catbank-08.md`
Tạo: `wiki/flows/f2m8t-catbank-system-flow.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-07] ingest | Flow Deploy HRM lên Kubernetes

Nguồn: `raw/archive/1. Projects/Dự án 2026/VnPay-Project/Documents/flow/Flow-CapNhat-K8s-CircleK 1.md`
Tạo: `wiki/sources/k8d2p-flow-capnhat-k8s-hrm.md`
Tạo: `wiki/flows/k8d2p-flow-deploy-k8s-hrm.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-07] ingest | Biên bản họ p hạ tầng Circle K — K8S & S3

Nguồn: `raw/archive/1. Projects/LTG/H-CIRCLEK-HaTang-07052026.md`
Tạo: `wiki/sources/ck7m3-circlek-hatang-k8s-s3-07052026.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`

## [2026-05-07] ingest | Docker HRM VnPay + K8s Plan

Đọc: `raw/.../VnPay-Project/Documents/Dockers/` (8 file series Docker)
Convert: `raw/.../SaaS-VnR/Documents/k8s/Plan_K8s.xlsx` → `.md`, `K8s_DevOps_Plan.xlsx` → `.md`
Tạo: `wiki/sources/2026-05-07-docker-hrm-vnpay.md` (architecture)
Tạo: `wiki/sources/2026-05-07-k8s-plan-vnpay.md` (source)

## [2026-05-08] ingest | Hồ sơ thầu §1.2.5 — Docker & Kubernetes

Tạo: `wiki/sources/t5d8k-hotroaohoa-docker-kubernetes.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`


Nguồn: `raw/archive/Area/Deploy-K8s/` (10 file: Index, QnA, Scenario, Checklist, VM-UAT, Sizing-PROD, Sizing-Loadtest, VM-PROD, ServiceInfo, Network)
Tạo: `wiki/sources/p9k2w-deploy-k8s-hrm-planning.md`
Tạo: `wiki/architecture/p9k2w-k8s-hrm-service-architecture.md`
Tạo: `wiki/flows/m3t7x-flow-cicd-deploy-k8s.md`
Tạo: `wiki/flows/r5n8q-flow-integration-thirdparty.md`
Tạo: `wiki/flows/v2k9m-flow-golive-k8s.md`
Cập nhật: `wiki/projects/VnPay-Project.md`, `wiki/architecture/HRM-Deployment-Architecture.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`


## [2026-05-10] ingest | ATT – Nghiệp vụ Chấm công (15 files)

Tạo (sources/):
- `p1a3t-att-overview.md` — tổng quan phân hệ ATT
- `q7r2n-att-tinh-cong.md` — quy trình tính công 8 bước
- `k9v2x-att-du-lieu-tinh-cong.md` — 6 nhóm dữ liệu tính công
- `m4b8z-att-cong-cong-tru.md` — công cộng và công trừ
- `n5c1k-att-luat-ngay-nghi.md` — luật ngày nghỉ BLLĐ
- `n8d4m-att-luat-ngay-cong.md` — luật ngày công BLLĐ
- `w3t6p-att-luat-tang-ca.md` — luật tăng ca OT
- `b5f9g-att-db-overview.md` — DB overview 5 bảng
- `r6e1w-att-db-annualleave.md` — schema Att_AnnualLeave
- `t4u8v-att-db-annualdetail.md` — schema Att_AnnualDetail
- `c2s5j-att-db-attendancetable.md` — schema Att_AttendanceTable
- `z8h4l-att-db-attendancetableitem.md` — schema Att_AttendanceTableItem
- `f3g6r-att-db-catgradecfg.md` — schema Cat_GradeCfg
- `h2j7q-att-sys-attendance-config.md` — Sys_AttendanceConfig 7 tab
- `v9x3k-dang-ky-quen-cham-cong.md` — incident đăng ký quên chấm công

Tạo (architecture/): `ATT-Database-Schema.md`
Tạo (flows/): `Flow-TinhCong-ATT.md`
Cập nhật: `wiki/index.md`, `wiki/sources/_index.md`, `wiki/overview.md`

## 2026-05-12 ingest | INS — NV nghỉ việc bị báo tháng sau (thiếu WorkPeriodFormula)

Tạo: `wiki/sources/n7q3x-ins-nghi-viec-thieu-workperiodformula.md`
Cập nhật: `wiki/index.md`, `wiki/overview.md`

## 2026-05-13 ingest | Thầu SSI — VnResource HRM Pro (183 files, 7 trang wiki)

Tạo mới (sources/):
- `wiki/sources/x2p7k-thau-ssi-ho-so-tong-the.md` — tổng quan 10 chương hồ sơ thầu
- `wiki/sources/q3r6t-ssi-api-spec.md` — 24 API endpoints Ch.6
- `wiki/sources/j5k9w-ssi-security-requirements.md` — 47 items bảo mật Ch.9
- `wiki/sources/v7m2p-ssi-devops-requirements.md` — DevOps/CI/CD/Monitoring Ch.7
- `wiki/sources/f8c4n-ssi-infrastructure-requirements.md` — hạ tầng phần cứng Ch.10

Tạo mới (projects/): `wiki/projects/SSI-Project.md`
Tạo mới (architecture/): `wiki/architecture/m4n8b-ssi-kien-truc-giai-phap.md`
Cập nhật: `wiki/index.md`, `wiki/overview.md`

## 2026-05-14 research | SSO toàn diện — Microsoft, Nội bộ, OIDC, IDS4

Intent: query/research
Core KW: SSO, IdentityServer4, JWT, Azure AD, LDAP, OIDC
Đọc: 16 file (wiki core + raw/Area/SSO, raw/Projects/VnPay, raw/Daily/2024)
Bỏ qua: 3 file stub rỗng (SSO web main/portal/mobile)
Tạo synthesis: `wiki/synthesis/s7rk-sso-research-20260514.md`
Phát hiện quan trọng: IDS4 multi-node 5 shared components chưa được ingest wiki; LDAPS unconfirmed; token TTL/blacklist CWE-613

## 2026-05-13 ingest | Thầu SSI — 7 trang chi tiết toàn bộ nội dung 183 files

Tạo (sources/ chi tiết):
- `a1b2c-ssi-ch1-cau-hinh-he-thong.md` — Ch.1 đầy đủ (11 items)
- `d3e4f-ssi-ch3-van-hanh-sla.md` — Ch.3 đầy đủ (10 items, 22 sub-items)
- `g5h6i-ssi-ch6-api-detail.md` — Ch.6 đầy đủ (28 items: 4+14+10)
- `j7k8l-ssi-ch7-devops-detail.md` — Ch.7 đầy đủ (33 items)
- `m9n0p-ssi-ch8-kien-truc-detail.md` — Ch.8 đầy đủ (15 items)
- `q1r2s-ssi-ch9-baomat-detail.md` — Ch.9 đầy đủ (46 items)
- `t3u4v-ssi-ch10-hatang-detail.md` — Ch.10 đầy đủ (37 items)
Cập nhật: `wiki/index.md`, `wiki/overview.md`

## [2026-05-14] lint | Health check lần 19b — tạo 3 entity + sync synthesis _index

Tạo mới: `wiki/entities/PTSC.md`, `wiki/entities/Bitex.md`, `wiki/entities/SSI.md`
Cập nhật: `wiki/index.md` (+3 entity), `wiki/synthesis/_index.md` (+5 synthesis), `wiki/overview.md` (entities 13→16, to-do clean up)
To-do đã xử lý: PTSC entity, Bitex entity, SSI entity
Tổng entities hiện tại: 16 trang

## [2026-05-14] lint | Health check lần 19 — sync overview từ disk

Đếm thực tế disk: Sources 203, Projects 11, Flows 20, Architecture 13, Synthesis 30, Concepts 16
Fix: overview.md bảng thống kê (lệch ~65 sources), thêm SSI/UMC vào active, version v5.4
Ghost xác nhận: p4wn9/k7m3x không tồn tại → xóa khỏi to-do
Ghost còn lại: 3 rca-* cũ vẫn chưa tìm thấy trên disk

## [2026-05-14] ingest | Giao ban Tuần 2 Tháng 5 — 14/05/2026

Tạo: `wiki/sources/h7p2m-giao-ban-14052026.md`
Cập nhật: `wiki/index.md`, `wiki/log.md`, `wiki/overview.md`
Nội dung chính: KPIs thiết lập mục tiêu Q2/2026, đánh giá tháng 4, khen thưởng định kỳ, đề xuất tính năng hủy lịch nghỉ HRM

## [2026-05-14] tonghop | Microsoft SSO & OIDC — Authorization Code Flow, Internal SSO, OIDC Concepts

Đọc: `wiki/sources/SSO-HRM-Protocols`, `wiki/sources/Daily-2024-SSO-Auth`, `raw/archive/Area/SSO/0-SSO-la-gi`, `raw/archive/Area/SSO/Identity`, `raw/archive/Area/SSO/Giao-thuc-SSO`
Tạo synthesis: `wiki/synthesis/p7qx-microsoft-sso-oidc-hrm-14-05-2026.md`
