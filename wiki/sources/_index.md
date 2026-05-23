---
description: "Index toàn bộ sources (raw ingest) — tìm theo project/domain, không cần đọc từng file."
type: sub-index
domain: sources
date-updated: 2026-05-05
---

# Sources Index

> Đây là danh mục trang nguồn gốc (raw ingest). Thường **không cần đọc trực tiếp** — đi qua wiki pages chính rồi backlink về đây. Dùng khi cần trace nguồn gốc thông tin cụ thể.

---

## Projects

| Trang | Project | Mô tả ngắn | Ingest |
|-------|---------|-----------|--------|
| [[wiki/sources/VnPay-Goals-Scope-Resources]] | VnPay | Goals, Scope, nhân sự 7 SE, rủi ro | 2026-04-25 |
| [[wiki/sources/VnPay-Phases-Timeline]] | VnPay | Timeline đầy đủ 8 giai đoạn (10/2024–09/2025) | 2026-04-25 |
| [[wiki/sources/VnPay-System-Architecture]] | VnPay | 13 services/sites, Kubernetes, vai trò từng service | 2026-04-25 |
| [[wiki/sources/VnPay-Performance-Incident]] | VnPay | Sự cố nghẽn 200 users tháng 11/2025, kết quả fix | 2026-04-25 |
| [[wiki/sources/VnPay-Deploy-Guide]] | VnPay | Hướng dẫn triển khai HRM VnPay: S3, IIS, SQL Server | 2026-04-25 |
| [[wiki/sources/VnPay-Security-Vulnerability-Oct2025]] | VnPay | Pentest 10/2025: 24 lỗ hổng (4 Critical: SQLi, Account Takeover…) | 2026-04-29 |
| [[wiki/sources/VNPAY1538-RCA-AppChiTietDonNghiTrong]] | VnPay | RCA VNPAY1538: Mobile App chi tiết đơn nghỉ trống — double-wrap .NET 8 | 2026-04-28 |
| [[wiki/sources/vNPAY1538-ObjDataData-Net8-Bug]] | VnPay | Phân tích kỹ thuật Obj.Data.Data double-wrap sau .NET 8 | 2026-04-29 |
| [[wiki/sources/H-VnPay-Att-17042025]] | VnPay | Họp Chấm công: đối tượng 1 đầu IN, quy tắc trễ/sớm | 2026-04-25 |
| [[wiki/sources/H-VnPay-TRA-30062025]] | VnPay | Họp UAT Tuyển dụng & Định biên: ưu tiên task | 2026-04-25 |
| [[wiki/sources/H-VnPay-INS-05082025]] | VnPay | Họp tích hợp Bảo hiểm MISA: lộ trình T9/2025 | 2026-04-25 |
| [[wiki/sources/H-VnPay-Sys-03062025]] | VnPay | Họp UAT Phase 4: kế hoạch đào tạo + UAT chi tiết | 2026-04-25 |
| [[wiki/sources/Bitex-Project-Overview]] | Bitex | Goals / Scope / Timeline / Risks / 5 giai đoạn | 2026-04-27 |
| [[wiki/sources/Bitex-Chat-ChiHuyThiCong]] | Bitex | Chat log nhóm — 7 issues, quyết định 2 HĐ 1 DA | 2026-04-27 |
| [[wiki/sources/Bitex-TaskList-PostGoLive]] | Bitex | Task list hậu go-live Tuyết Anh — 99 tasks | 2026-04-27 |
| [[wiki/sources/2026-05-04-log-review-bitex]] | Bitex | Log Review WindowsService + API SC — fix encrypt FullPath | 2026-05-04 |
| [[wiki/sources/2026-04-29-bitex-cham-cong-gps-wifi-loading]] | Bitex | GPS/WiFi mobile loading — chưa ghi nhận, lỗi trước bước gọi API | 2026-04-29 |
| [[wiki/sources/2026-05-05-loading-cham-cong-gps-wifi-dong-thoi]] | Bitex | Bug fix ATT: loading GPS/Wifi — gộp 1 API, server tự GETDATE() | 2026-05-05 |
| [[wiki/sources/QuickPack-Project-Overview]] | QuickPack | 8 phân hệ, GAP 3 module phức tạp, rủi ro SE T8/2025 | 2026-04-27 |
| [[wiki/sources/H-TrungDong-Eva-31122024]] | TrungDong | Biên bản họp xin nguồn lực Phase II (31/12/2024) | 2026-04-25 |
| [[wiki/sources/H-TrungDong-Eva-14042025]] | TrungDong | Biên bản họp quyết định kỹ thuật Đánh giá (14/04/2025) | 2026-04-25 |
| [[wiki/sources/TrungDong-Eva-Meetings-2025-Supplement]] | TrungDong | Phase II bổ sung: KPI 4 quý, UAT2 prep 32 modify | 2026-04-27 |
| [[wiki/sources/HongNgoc-DanhGia-SSO]] | HongNgoc | Hướng dẫn cấu hình JWT SSO cho hệ thống Đánh giá | 2026-04-25 |
| [[wiki/sources/HongNgoc-AutoLogin-JWT-2025]] | HongNgoc | Auto-login đánh giá cũ→mới qua JWT SSO_SecretKey shared | 2026-04-27 |
| [[wiki/sources/AVN-LDAP-BaoMat-PhanTich]] | AVN | LDAP plain text không bảo mật — HRM chưa có LDAPS | 2026-05-04 |
| [[wiki/sources/AVN-Security-Vulnerability-2025]] | AVN | 9 lỗ hổng Sonar (3 Critical hardcoded secrets, 1 Critical CSP…) | 2026-04-29 |
| [[wiki/sources/2026-04-29-avn-hrm-co-ho-tro-ldaps-chua]] | AVN | Câu hỏi LDAPS — chưa kết luận, đang raise task | 2026-04-29 |
| [[wiki/sources/LTG-INS-Meetings-2024]] | LTG | Họp BH 2024 — Ca 24h, nghỉ 14 ngày, ngày nghỉ custom | 2026-04-27 |
| [[wiki/sources/LTG-TAL-Meetings-2024]] | LTG | Họp Nhân Tài 2024 — kế thừa, phân quyền tự động | 2026-04-27 |
| [[wiki/sources/LTG-SYS-Meetings-2024]] | LTG | Họp SYS — kiêm nhiệm đa pháp nhân, store Get_Data_Permission_New | 2026-04-27 |
| [[wiki/sources/LTG-TAL-Supplement-Jul2024]] | LTG | TAL bổ sung: bình luận BẮT BUỘC trước duyệt, scheduler task | 2026-04-27 |
| [[wiki/sources/UNIS-INS-Meetings-2024]] | UNIS | BH tự nguyện giáo viên VN + nước ngoài | 2026-04-27 |
| [[wiki/sources/UNIS-INS-Jun2024-Supplement]] | UNIS | Họp BH tự nguyện 10/06/2024 — kick-off, thêm quốc tịch | 2026-04-27 |
| [[wiki/sources/TBV-INS-Meeting-2024]] | TBV | BH nâng cao — trích nộp thiếu, chốt dòng, AMIS | 2026-04-27 |
| [[wiki/sources/Karcher-INS-Meeting-2024]] | Karcher | Nghỉ 14 ngày không có module Công — enum từ chứng từ | 2026-04-27 |
| [[wiki/sources/VCBs-FAC-TAL-Meetings-2024]] | VCBs | FAC đầy đủ + TAL khung năng lực | 2026-04-27 |
| [[wiki/sources/VCBs-TAL-Jul2024-Supplement]] | VCBs | TAL 22/07/2024 — field Khía cạnh, ma trận mức-hành vi | 2026-04-27 |
| [[wiki/sources/FIT-Meetings-2024]] | FIT | Mail server per company, BH chu kỳ 15-14, ADFS SSO | 2026-04-27 |
| [[wiki/sources/MultiProject-SYS-Meetings-2024]] | Multi | Taisun/FGL/HVN/Toyota/AMIS: khóa đối tượng, survey redirect | 2026-04-27 |
| [[wiki/sources/HVN-SYS-KhoadoituongKyCong-2024]] | HVN | Khóa đối tượng theo loại kỳ công | 2026-04-27 |
| [[wiki/sources/FGL-Survey-RedirectJWT-2024]] | FGL | Tích hợp Survey qua redirect JWT | 2026-04-27 |
| [[wiki/sources/Terumo-SYS-Meeting-2024]] | Terumo | Tách user main/portal HRM V3 | 2026-04-27 |
| [[wiki/sources/Marico-DanhGia-HopDong]] | Marico | 9 task modify đánh giá hợp đồng | 2026-04-25 |
| [[wiki/sources/VietCap-Security-Vulnerability-Q42025]] | VietCap | Q4/2025: 11 lỗ hổng (1 Critical Redis RCE, 2 High…) | 2026-04-29 |
| [[wiki/sources/NghiSon-Security-Vulnerability-2025]] | NghiSon | CVE-2025-49844 Redis RCE Critical — fix nâng Redis ≥ 8.2.2 | 2026-04-29 |
| [[wiki/sources/PTSC-TLG-PhamVi]] | PTSC | §1–2: 30 dataset, 30 interface ESB, HR Master Data Hub | 2026-04-30 |
| [[wiki/sources/PTSC-TLG-KyThuatTichHop-Core]] | PTSC | §3 Core: CDC Watermark/Version, luồng 2 chiều, metadata/ERD | 2026-04-30 |
| [[wiki/sources/PTSC-TLG-BaoMat-IAM]] | PTSC | §3 IAM: OAuth2/OIDC, mTLS, IAM/SSO (Entra/Keycloak/ADFS) | 2026-04-30 |
| [[wiki/sources/PTSC-TLG-Idempotent-Operations]] | PTSC | §3 Ops: idempotent API, CorrelationId, retry backoff | 2026-04-30 |
| [[wiki/sources/PTSC-TLG-KienTruc-NenTang]] | PTSC | §4.1–4.6: 3-Tier, 5 servers HA, multi-env, IaaS cloud | 2026-04-30 |
| [[wiki/sources/PTSC-TLG-BaoMat-HA-DR]] | PTSC | §4.7–4.15: bảo mật 5 lớp, AES-256, HA 24/7, DR RPO/RTO | 2026-04-30 |
| [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhamVi-TichHop]] | PTSC | §1–2 orphan: 30 dataset, 30 interface ESB | 2026-04-30 |
| [[wiki/sources/TaiLieuGiaiPhap-PTSC-KyThuat-TichHop]] | PTSC | §3 orphan: CDC/API/IAM/Idempotent/Reprocess | 2026-04-30 |
| [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhiChucNang-KienTruc]] | PTSC | §4.1–4.9 orphan: kiến trúc 3-Tier, auth SSO, RBAC | 2026-04-30 |
| [[wiki/sources/TaiLieuGiaiPhap-PTSC-PhiChucNang-BaoMat-HA]] | PTSC | §4.10–4.15 orphan: bảo mật 5 lớp, AES-256, HA/DR | 2026-04-30 |

---

## INS (Bảo hiểm)

| Trang | Mô tả ngắn | Ingest |
|-------|-----------|--------|
| [[wiki/sources/INS-InsuranceMonthJoin]] | Logic xác định tháng tham gia BH | 2026-04-26 |
| [[wiki/sources/INS-InsurancePayback]] | Logic hoàn trả BH khi đóng sai/thừa | 2026-04-26 |
| [[wiki/sources/INS-InsuranceRecordDayCount]] | Đếm ngày thực tế bản ghi BH trong tháng | 2026-04-26 |
| [[wiki/sources/INS-Nghi14Ngay]] | Quy tắc nghỉ ốm hưởng BHXH: 14 ngày làm việc | 2026-04-26 |
| [[wiki/sources/INS-NghiThaiSan]] | Chế độ thai sản: 6 tháng, 100% lương | 2026-04-26 |
| [[wiki/sources/INS-iBHXH-Analyze]] | Luồng tích hợp HRM → iBHXH khai báo điện tử | 2026-04-26 |
| [[wiki/sources/INS-C70-TinhLuong]] | Bảng tổng hợp lương C70: cột BH NLĐ + NSDLĐ | 2026-04-26 |
| [[wiki/sources/INS-D02-ChungTu]] | Biểu mẫu D02-TS: tham gia/điều chỉnh BH | 2026-04-26 |
| [[wiki/sources/INS-FishBone-Analysis]] | FishBone 4M + 5 Whys phân tích nguyên nhân lỗi BH | 2026-04-26 |
| [[wiki/sources/INS-TruyNguyenNhan]] | 4M Root Cause Analysis theo Kaizen: 5 Whys, CAPA matrix | 2026-04-26 |
| [[wiki/sources/INS-VennD02]] | So sánh D02-VNPT / D02-Viettel / iBHXH — Venn diagram | 2026-04-26 |
| [[wiki/sources/INS-Kaizen-08]] | Nhật ký vấn đề BH Kaizen #08 (2017): D02/C70, timezone bug | 2026-04-26 |
| [[wiki/sources/INS-TaiLieuBaoHiem-01]] | Tài liệu INS v8.0.1.x — 9 module: mindmap, nghiệp vụ, DB schema | 2026-04-27 |
| [[wiki/sources/INS-NhatKy-VanDe-2017]] | Nhật ký vấn đề INS 2017: D02 thai sản, ON/OFF, timezone | 2026-04-27 |
| [[wiki/sources/INS-Troubleshooting-5Why]] | 5-Why RCA: Tên Công Việc, Số Tiền BH, C70A lương = 0 | 2026-04-27 |
| [[wiki/sources/INS-ThietKe-V8]] | Thiết kế chức năng INS V8: TK01/TK02/D02/C70A, IBHXH/EBHXH | 2026-04-27 |
| [[wiki/sources/INS-TaiLieuBH-01-Schema]] | Schema INS: Ins_ProfileInsuranceMonthly 72+ fields, Err001-Err008 | 2026-04-27 |
| [[wiki/sources/INS-Kaizen-08-Cards]] | 11 thẻ Kaizen INS/SYS (Ins0001–Ins0011, 2017–2018) | 2026-04-27 |
| [[wiki/sources/INS-Database-Tables]] | 72 bảng database INS: bảng đã xóa, bảng trung tâm | 2026-04-30 |
| [[wiki/sources/INS-IBHXH]] | Bảng mã IBHXH Tăng (12) và Giảm (19) + mapping Col0–Col53 | 2026-04-30 |
| [[wiki/sources/INS-Nguyen-Nhan-So-Tien-BH]] | RCA: không tính được số tiền BH — textbox công thức | 2026-04-30 |
| [[wiki/sources/INS-Nguyen-Nhan-Ten-Cong-Viec]] | RCA: không lấy được tên công việc — thiếu validate bắt buộc | 2026-04-30 |
| [[wiki/sources/INS-Overview]] | Index nhật ký vấn đề phân hệ BH 2017: 3 Mantis, 4M framework | 2026-04-30 |
| [[wiki/sources/INS-Thiet-Ke-Chuc-Nang]] | Thiết kế chức năng INS v8.0.1.1: mindmap, mapping V6→V8 | 2026-04-30 |
| [[wiki/sources/INS-Kaizen-Meta]] | Kaizen meta: phương pháp Kaizen, mẫu thẻ | 2026-04-30 |
| [[wiki/sources/INS-BC-D02]] | Bug Mantis #57589: D02 không hiển thị điều chỉnh lương | 2026-04-29 |
| [[wiki/sources/INS-Bieu-Mau]] | Biểu mẫu BH đầy đủ: TK01/TK02/D02-TS/C70A — 14 ký hiệu D02 | 2026-04-29 |
| [[wiki/sources/INS-BrainStorming-T10-2017]] | BrainStorming T10/2017: Pareto 70% bug từ 2 màn hình | 2026-04-29 |
| [[wiki/sources/INS-C70-FAQ]] | FAQ C70/C70A: lương BHXH = 0, conflict logic cũ/mới | 2026-04-29 |
| [[wiki/sources/INS-Chan-Doan-Su-Co]] | Chẩn đoán sự cố BH: 3 trục trắc, 4M framework | 2026-04-29 |
| [[wiki/sources/INS-EBHXH]] | Bảng mã EBHXH: 11 Tăng / 16 Giảm / Điều chỉnh | 2026-04-29 |
| [[wiki/sources/INS-FAQ-Phan-Tich-BH]] | FAQ phân tích BH: 4M framework, 3 loại trục trặc | 2026-04-29 |
| [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] | Quy trình 5 bước phân tích BH: logic, config, edge case | 2026-05-02 |
| [[wiki/sources/INS-FAQ-4GocNhinTrucTrac]] | Checklist 4 góc nhìn trục trặc: HRE/ATT/SAL/INS/SYS + 4M | 2026-05-02 |
| [[wiki/sources/INS-FAQ-KhongCoDuLieu]] | Tại sao phân tích BH không có dữ liệu — 2 điều kiện | 2026-05-02 |
| [[wiki/sources/INS-FAQ-LuongBHXHBang0]] | Lương BHXH = 0 — dữ liệu sai vs công thức sai | 2026-05-02 |
| [[wiki/sources/INS-FAQ-Nghi14NgayBaoThaiSan]] | Nghỉ ≥14 ngày báo thai sản — wont fix, loại chứng từ sảy thai | 2026-05-02 |
| [[wiki/sources/INS-FAQ-ThaiSanBaoNghi14Ngay]] | Thai sản báo ≥14 ngày — 3 nguyên nhân + ON/OFF rule | 2026-05-02 |
| [[wiki/sources/INS-FAQ-PhanTichTheoDot]] | Phân tích BH theo đợt — logic lưu/không lưu dòng mới | 2026-05-02 |
| [[wiki/sources/INS-FAQ-NghiViecNgoaiChuKy]] | Nghỉ việc ngoài chu kỳ vẫn báo giảm | 2026-05-02 |
| [[wiki/sources/INS-FAQ-NghiViecTrongKy]] | Nghỉ việc trong kỳ báo đóng BH — logic 2 dòng, config | 2026-05-02 |
| [[wiki/sources/INS-Nghiep-Vu]] | Nghiệp vụ tăng/giảm/điều chỉnh BH + logic số quyết định D02 | 2026-04-29 |
| [[wiki/sources/INS-Phan-Tich-BH-Lech-Thang]] | Timezone bug Mantis #87680: phân tích T9 ra T8 | 2026-04-29 |
| [[wiki/sources/INS-Quy-Trinh]] | Quy trình INS01: 4 bước, luồng HRE→ATT→INS→SAL | 2026-04-29 |
| [[wiki/sources/INS-Thai-San-On-Off]] | ON/OFF thai sản Mantis #57594: pivot ngày 14/15 | 2026-04-29 |
| [[wiki/sources/INS-D02-FAQ]] | Bộ FAQ D02 (6 file): quy tắc hỏi ngược, 6 loại BC | 2026-05-02 |
| [[wiki/sources/INS-Config-FAQ]] | ~50 key Sys_InsConfig: 8 nhóm cấu hình BH, lỗi thường gặp | 2026-05-02 |
| [[wiki/sources/INS-RCA-Formula14Day-TotalSickUnpaid-20260504]] | RCA + PDCA: TotalSickleaveDays = 0 do Calculate14DayFomular() | 2026-05-04 |
| [[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]] | Bug fix: T4 Thai sản + Nghỉ việc — SetLeave14Days guard IsPregnant | 2026-05-04 |
| [[wiki/sources/2026-05-05-phan-tich-bh-thang-n1-tu-xoa-dong-nv-nghi-viec-da-confirmed]] | Bug fix: DeleteInsuranceMonthly xóa nhầm dòng E_CONFIRMED tháng N+1 | 2026-05-05 |

---

## SAL (Lương)

| Trang | Mô tả ngắn | Ingest |
|-------|-----------|--------|
| [[wiki/sources/m7p2k-pvfcco-luong-co-so-he-so-3p]] | MODIFY PVFCCo: thêm Lương cơ sở 3P vào Lương cơ bản + 2 enum trước/sau thay đổi lương | 2026-05-05 |

---

## SYS / ATT / SAL

| Trang | Domain | Mô tả ngắn | Ingest |
|-------|--------|-----------|--------|
| [[wiki/sources/Sys-TaiLieuHeThong-01]] | SYS | 8 bảng DB, UML, 50+ webconfig keys, bảo mật | 2026-04-27 |
| [[wiki/sources/Sys-TaiLieuPhanQuyen-02]] | SYS | Phân quyền HRM: 2 loại quyền, tạo nhóm 2 bước | 2026-04-27 |
| [[wiki/sources/Sys-TaiLieuLDAP-03]] | SYS | Tích hợp LDAP: cấu hình, Sys_LdapConfig, workflow | 2026-04-27 |
| [[wiki/sources/Sys-TaiLieuGetAPIToExcel-07]] | SYS | Lấy dữ liệu HRM API/SQL/Store → Excel qua Power Query | 2026-04-27 |
| [[wiki/sources/CheckList-PhanQuyen-HRM]] | SYS | Checklist 7 bước xử lý phân quyền HRM | 2026-05-02 |
| [[wiki/sources/SonarQube-Setup-Guide]] | SYS | SonarQube Docker + quét .NET 3 bước + xuất báo cáo | 2026-05-02 |
| [[wiki/sources/KySo-WindowsService]] | SYS | Ký số HRM.WindowsService.exe bằng self-signed cert | 2026-05-02 |
| [[wiki/sources/SSO-HRM-Protocols]] | SYS | Giao thức SSO HRM: SAML/OIDC/LDAP, Okta SAML2+OIDC | 2026-05-02 |
| [[wiki/sources/2fa-ids4-solution]] | SYS | Giải pháp 2FA IDS4: TOTP, thiết lập, recovery code | 2026-05-04 |
| [[wiki/sources/NghiepVu-ATT-SAL]] | ATT/SAL | Nghiệp vụ Chấm công (ATT01–05) và Tính lương (SAL01) | 2026-04-27 |
| [[wiki/sources/ATT-BUG01-PhepNam-NgayLe]] | ATT | ATT-BUG01: sai tổng công khi phép năm trùng ngày lễ | 2026-04-27 |
| [[wiki/sources/ATT-DangKy-QuenChamCong]] | ATT | Incident: đăng ký quên chấm công portal báo lỗi | 2026-04-29 |
| [[wiki/sources/p1a3t-att-overview]] | ATT | Tổng quan phân hệ ATT: 7 chủ đề con, mục đích | 2026-05-10 |
| [[wiki/sources/q7r2n-att-tinh-cong]] | ATT | Quy trình tính công 8 bước → sinh bảng công → SAL | 2026-05-10 |
| [[wiki/sources/k9v2x-att-du-lieu-tinh-cong]] | ATT | 6 nhóm dữ liệu tính công: chế độ, ca, OT, nghỉ | 2026-05-10 |
| [[wiki/sources/m4b8z-att-cong-cong-tru]] | ATT | Công cộng/trừ: công thức nghiệp vụ PaidWorkDayCount | 2026-05-10 |
| [[wiki/sources/n5c1k-att-luat-ngay-nghi]] | ATT | Luật ngày nghỉ BLLĐ: phép 12–16 ngày, thai sản 6T | 2026-05-10 |
| [[wiki/sources/n8d4m-att-luat-ngay-cong]] | ATT | Luật ngày công BLLĐ: 8h/ngày, giờ đêm 22:00–06:00 | 2026-05-10 |
| [[wiki/sources/w3t6p-att-luat-tang-ca]] | ATT | Luật OT: 6 điều kiện, hệ số 150/200/300+100%, 200h/năm | 2026-05-10 |
| [[wiki/sources/b5f9g-att-db-overview]] | ATT | DB Overview ATT: 5 bảng và quan hệ phân cấp | 2026-05-10 |
| [[wiki/sources/r6e1w-att-db-annualleave]] | ATT | Schema Att_AnnualLeave: phép năm tổng hợp theo năm | 2026-05-10 |
| [[wiki/sources/t4u8v-att-db-annualdetail]] | ATT | Schema Att_AnnualDetail: chi tiết phép từng tháng | 2026-05-10 |
| [[wiki/sources/c2s5j-att-db-attendancetable]] | ATT | Schema Att_AttendanceTable: bảng công tháng trung tâm | 2026-05-10 |
| [[wiki/sources/z8h4l-att-db-attendancetableitem]] | ATT | Schema Att_AttendanceTableItem: bảng công ngày | 2026-05-10 |
| [[wiki/sources/f3g6r-att-db-catgradecfg]] | ATT | Schema Cat_GradeCfg: chế độ công, tỷ lệ BH, OT types | 2026-05-10 |
| [[wiki/sources/h2j7q-att-sys-attendance-config]] | ATT | Sys_AttendanceConfig 7 tab: 200+ keys Sys_AllSetting | 2026-05-10 |
| [[wiki/sources/v9x3k-dang-ky-quen-cham-cong]] | ATT | Incident đăng ký quên chấm công portal lỗi (10/05/2026) | 2026-05-10 |

---

## Daily / Kỹ thuật chung

| Trang | Mô tả ngắn | Ingest |
|-------|-----------|--------|
| [[wiki/sources/Nhat-ky-van-de-he-thong]] | 22 vấn đề kỹ thuật IIS/SQL/Log/Network (Sys000–Sys022) | 2026-04-26 |
| [[wiki/sources/Nhat-ky-van-de-nghiep-vu]] | 29 vấn đề nghiệp vụ SE: deploy, merge, store, quy trình | 2026-04-26 |
| [[wiki/sources/SysLog-HeThong-Chi-Tiet]] | 23 lỗi IIS/SQL/Log/Network chi tiết (Sys000–Sys022) | 2026-04-26 |
| [[wiki/sources/SysLog-NghiepVu-Chi-Tiet]] | 29 lỗi nghiệp vụ SE chi tiết (Sys00001–Sys00029) | 2026-04-26 |
| [[wiki/sources/WarmupStatus-Performance-2026]] | WarmupStatus 6 services + Identity Razor warmup (04/2026) | 2026-04-26 |
| [[wiki/sources/GitNexus-Daily-Note]] | Ghi chú GitNexus: chạy lại analyze khi tách nhánh | 2026-04-26 |
| [[wiki/sources/Daily-2024-SSO-Auth]] | SSO patterns 2024: Okta OIDC, Azure AD, ADFS, auth.config | 2026-04-27 |
| [[wiki/sources/Daily-2024-Security-Fixes]] | Bảo mật 2024: XSS grid, SQL Injection, Broken Access Control | 2026-04-27 |
| [[wiki/sources/Daily-2024-SQL-Performance]] | Refactor Get_MasterDataForUser: CPU 38750ms→672ms | 2026-04-27 |
| [[wiki/sources/Daily-2024-Cache-Redis]] | Cache 5 pools, Task.Run HttpContext bug, Redis 7.2.5 migration | 2026-04-27 |
| [[wiki/sources/Daily-2024-INS-Bugs]] | INS bugs: C70 hotfix nghỉ ốm dài ngày, VDSC leavedayTypeCount | 2026-04-27 |
| [[wiki/sources/Daily-2024-PowerBI-Integration]] | Power BI + HRM API: Bearer token, Power Query, API_SP_GET_BANK | 2026-04-27 |
| [[wiki/sources/Daily-2024-OPA-LDAP-Permission]] | OPA cache API v3, OpenLDAP cài Ubuntu, sp_GetPermissionNew | 2026-04-27 |
| [[wiki/sources/Daily-2024-Vietcap-SSO-Security]] | Vietcap XSS filter HasXSSConfig, LTG SSO email | 2026-04-27 |
| [[wiki/sources/Daily-2025-CursorAI-Net8]] | Cursor AI Memory Bank, .NET 8 FormCollection→IFormCollection | 2026-04-27 |
| [[wiki/sources/Daily-2025-Jan-Feb-Projects]] | Daily 01–02/2025: HongNgoc SSO, PEWVN, INOAC, Lotte Okta | 2026-04-27 |
| [[wiki/sources/SaaS-VnR-Meetings-2023-2024]] | SaaS VnR: K8s multi-tenant, MinIO, chuyển đổi codebase | 2026-04-27 |
| [[wiki/sources/SaaS-VnR-Meetings-Detail-2023]] | SaaS VnR: 16 biên bản họp chi tiết 07–10/2023 | 2026-04-27 |
| [[wiki/sources/SaaS-VnR-KienTruc-Stack]] | SaaS VnR 2023: kiến trúc multi-tenant, stack kỹ thuật | 2026-05-02 |
| [[wiki/sources/Monthly-07-2024-TongHop]] | Tháng 07/2024: Epic bảo mật + phân hệ | 2026-04-25 |
| [[wiki/sources/GiaoBan-2025-TongHop]] | Giao ban VnR 2025: ISO, nhân sự, KPI, Succession | 2026-04-27 |
| [[wiki/sources/GiaoBan-2026-TongHop]] | Giao ban VnR 2026 (01–04/2026): KPI, tái cấu trúc PTSP | 2026-04-29 |
| [[wiki/sources/AMIS-ISO-AgileScrum-2024]] | AMIS ISO: mẫu quy trình 7 mục, Agile Scrum Misa | 2026-04-27 |
| [[wiki/sources/Interview-SE-VnResource-2024]] | Quy trình phỏng vấn SE VnResource — 5 khía cạnh | 2026-04-27 |
| [[wiki/sources/Interview-SE-Candidates-2024]] | 4 hồ sơ ứng viên SE Backend 2024 | 2026-04-27 |
| [[wiki/sources/StandardUI-SE-2024]] | Tiêu chuẩn SE (Nghĩa): UI, button, validate, màn hình mới | 2026-04-27 |
| [[wiki/sources/Tieuchuan-SE-30052024]] | Tiêu chuẩn SE (Nghĩa) 30/05/2024 | 2026-04-29 |
| [[wiki/sources/TaiLieu-KienTruc-HeThong-VnR]] | Đặc tả kiến trúc hệ thống VnR Docs — placeholder | 2026-04-29 |
| [[wiki/sources/AI-Cursor-MemoryBank]] | Cursor AI: tính năng, Memory Bank, so sánh LLM Wiki | 2026-04-25 |
| [[wiki/sources/BaiGiang-DotNet-KendoUI-JWT]] | Cấu trúc bài giảng .NET MVC, Kendo UI, JWT | 2026-04-25 |
| [[wiki/sources/Learning-MicroService-Confluence-Tools]] | Microservice SSO 3 tình huống + Confluence vs WikiJS | 2026-04-27 |
| [[wiki/sources/Mockoon-UserGuide]] | Hướng dẫn Mockoon mock API: import Swagger, route/response | 2026-05-02 |

---

## Phương pháp luận

| Trang | Mô tả ngắn | Ingest |
|-------|-----------|--------|
| [[wiki/sources/PhuongPhapLuan-Debug]] | 6 phương pháp debug tư duy bậc cao: Sherlock/Einstein/DaVinci… | 2026-05-02 |
| [[wiki/sources/PhuongPhapLuan-Socrates]] | Socrates: 35 câu hỏi bóc giả định ẩn | 2026-05-02 |
| [[wiki/sources/PhuongPhapLuan-FirstPrinciples]] | First Principles: Strip→Identify→Rebuild→Compare | 2026-05-02 |
| [[wiki/sources/PhuongPhapLuan-Aristotle]] | Aristotle Syllogism: Tam đoạn luận, 4 lỗi logic phổ biến | 2026-05-02 |
| [[wiki/sources/PhuongPhapLuan-SAT]] | SAT Lan truyền kích hoạt: 35 câu hỏi mở rộng wiki | 2026-05-02 |
| [[wiki/sources/PhuongPhapLuan-BocTachChucNang]] | Bóc tách chức năng: INPUT/LOGIC/OUTPUT/GUARD/PHẢN BIỆN | 2026-05-03 |
| [[wiki/sources/PhuongPhapLuan-Debug-12-TongHop]] | Tổng hợp 12 phương pháp debug: sơ đồ chọn nhanh, template | 2026-05-03 |
| [[wiki/sources/Sach-TuDuyNhuSherlockHolmes]] | Sách Daniel Smith: 10 bước tư duy Holmes, kỹ năng quan sát | 2026-05-02 |
| [[wiki/sources/2026-05-02-ins-loi-phan-tich-bh-expression-expected-phan-tu-bh]] | Lỗi phân tích BH `Expression expected` — checklist 4 bước | 2026-05-02 |
