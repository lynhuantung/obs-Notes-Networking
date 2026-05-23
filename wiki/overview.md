---
description: "Tổng quan wiki HRM: thống kê nguồn ingest, domain phân loại, trạng thái và phạm vi toàn bộ kiến thức đã tích lũy."
type: overview
date-updated: 2026-05-20
sources-ingested: 204
wiki-version: v5.4 (lint 14/05/2026 — sync thống kê từ disk thực tế)
---

# Wiki Overview

## Domain

Tư vấn triển khai phần mềm **HRM (Bizzi / HRM)** cho doanh nghiệp Việt Nam.

- **Phần mềm**: HRM (các phân hệ Nhân sự, Lương, Bảo hiểm, Chấm công, Đánh giá, Nhân tài)
- **Khách hàng tiêu biểu**: VnPay, TrungDong, HongNgoc, Bitex, LTG, Toyota VN, Taisun, FGL…
- **Đội ngũ**: Tư vấn triển khai + kỹ thuật (coding, training, go-live support)

## Trạng thái Wiki

> Cập nhật bằng lint thực tế từ disk — 2026-05-14

| Chỉ số | Giá trị |
|--------|---------|
| Trang Sources (disk) | **203** |
| Trang Projects | **11** (7 active: VnPay, Bitex, QuickPack, AVN, PTSC, SSI, UMC \| 4 archived) |
| Trang Entities | **16** (+3: PTSC, Bitex, SSI) |
| Trang Concepts | **16** |
| Trang Flows | **20** |
| Trang Architecture | **14** |
| Trang Synthesis | **30** |
| Trang Bugs | **5** |
| Trang Glossary | **1** |
| Trang API | **1** |
| Trang Decision-Log | **1** |
| Tổng trang nội dung | **~314 trang** |
| Orphan pages | 1 (Vault-Structure — tồn đọng) |
| Ghost pages (log ≠ disk) | 3 (rca-* cũ — xem Gaps) |
| Cập nhật lần cuối | 2026-05-14 |
| Lần lint gần nhất | 2026-05-14 |

## Dự án đang hoạt động (2026)

- **VnPay**: Nâng cấp .NET 8, đã hoàn thành giai đoạn chính — vận hành
- **Bitex**: Dự án triển khai 2025-2026, hỗ trợ vận hành post-golive
- **QuickPack (QPVN)**: Golive 01/12/2025, đang Project Acceptance
- **AVN**: Đang active, đã triển khai LDAPS (05/2026)
- **PTSC**: Đấu thầu 2026 — 6 nhóm tài liệu giải pháp đã ingest
- **SSI**: Đấu thầu HRM Pro 2026 — 183 files hồ sơ, 14 trang wiki
- **UMC**: Triển khai SSO Microsoft OAuth2/OIDC — biên bản họp 14/05/2026

## Dự án đã hoàn thành (archived)

2024: LTG, Toyota HVN, Taisun, FGL, TBV, AMIS, OPA, UNIS, VCBs  
2025: TrungDong, HongNgoc, Terumo, Marico, PEWVN

## Gaps & To-Do

> Lint lần 19 — 2026-05-14

- ~~[ ] 🔴 **[PTSC]** Tạo `wiki/entities/PTSC.md` — chưa có entity profile cho khách hàng PTSC~~ → ĐÃ tạo ✅
- ~~[ ] 🟡 Tạo `wiki/entities/Bitex.md` — chưa có entity profile~~ → ĐÃ tạo ✅
- ~~[ ] 🟡 Tạo `wiki/entities/SSI.md` — dự án đấu thầu lớn, chưa có entity~~ → ĐÃ tạo ✅
- [ ] 🔴 **[GHOST PAGES]** 3 trang RCA cũ không có file trên disk — xác nhận đã mất hay cần tạo lại:
  - `wiki/synthesis/rca-schedule-vnws-opa-20260418.md`
  - `wiki/synthesis/rca-inoac-redis-cache-20260427.md`
  - `wiki/synthesis/rca-redis-stop-restart-20260427.md`
- [ ] 🔴 **[RỦI RO CAO]** Xác định `pvcfc` — xuất hiện trong WarmupStatus production; tạo entity/project nếu cần
- [ ] 🟡 AVN: ingest thêm nguồn (đang ACTIVE, hiện 2 sources)
- [ ] 🟡 Tạo `wiki/concepts/iBHXH-Portal.md` — đủ trọng lượng sau 15+ INS sources
- [ ] 🟡 Tạo `wiki/concepts/MISA-Integration.md` — nhắc nhiều trong VnPay-INS và BaoHiem research
- [ ] 🟡 Tạo `wiki/flows/Flow-OffBoarding-NhanVien.md`
- [ ] 🟡 Tạo `wiki/flows/Flow-TuyenDung.md`
- [ ] 🟡 Tạo `wiki/api/API-iBHXH-Integration.md`
- [ ] 🟡 Ingest thêm nguồn cho TrungDong (hiện 2 nguồn)
- [ ] 🟡 Ingest thêm nguồn cho HongNgoc (hiện 2 nguồn)
- [ ] 🟢 Liên kết `wiki/concepts/Vault-Structure` từ ít nhất 1 project/concept khác (hết orphan)
- [ ] 🟢 Thêm cross-links giữa 15+ INS sources với nhau
- [ ] 🟢 Ingest archived project lessons learned (LTG, Toyota HVN, Taisun, FGL, TBV, AMIS)
- [ ] 🟢 Ingest các tài liệu VnPay còn lại (GAP analysis, QC test plan)
- ~~[ ] Tạo `wiki/concepts/PKM-Methods.md`~~ → ĐÃ tạo ✅
- ~~[ ] Ingest Daily 2024 notes~~ → ĐÃ gộp thành 6+ source pages ✅
- ~~[ ] Ingest FIT project~~ → ĐÃ tạo entity + source ✅
- ~~[ ] Tạo `wiki/flows/`~~ → ĐÃ tạo 20 trang flows ✅
- ~~[ ] Tạo `wiki/architecture/`~~ → ĐÃ tạo 13 trang architecture ✅
- ~~[ ] Tạo `wiki/glossary/`~~ → ĐÃ tạo HRM-Glossary ✅
- ~~[ ] Ingest tài liệu Bitex~~ → ĐÃ ingest 3 sources ✅
- ~~[ ] Fix GiaoBan-2026-Research ghost p4wn9/k7m3x~~ → confirmed không tồn tại, đã xóa khỏi to-do ✅
