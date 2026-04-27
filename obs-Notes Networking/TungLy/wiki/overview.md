---
type: overview
date-updated: 2026-04-27
sources-ingested: 82
last-analyzed: 2026-04-27
wiki-version: v4.3 (lần 12: QuickPack-Project — 1 source + 1 project + 1 entity + 1 flow)
---

# Wiki Overview

## Domain

Tư vấn triển khai phần mềm **HRM (Bizzi / FIT-HRM)** cho doanh nghiệp Việt Nam.

- **Phần mềm**: FIT-HRM (các phân hệ Nhân sự, Lương, Bảo hiểm, Chấm công, Đánh giá, Nhân tài)
- **Khách hàng tiêu biểu**: VnPay, TrungDong, HongNgoc, Bitex, LTG, Toyota VN, Taisun, FGL…
- **Đội ngũ**: Tư vấn triển khai + kỹ thuật (coding, training, go-live support)

## Trạng thái Wiki

| Chỉ số | Giá trị |
|--------|---------|
| Sources đã ingest (disk) | **75** (+4 INS batch: NhatKy-2017, Troubleshooting-5Why, ThietKe-V8, TaiLieuBH-01-Schema) |
| Trang Projects | 7 (3 active: VnPay, Bitex, QuickPack | 4 archived) |
| Trang Entities | 13 |
| Trang Concepts | 15 |
| Trang Sources | 73 |
| **Trang Flows** | **11** (+1: Flow-QuickPack-Phases) |
| **Trang Architecture** | **6** (+1: INS-Architecture) |
| **Trang Glossary** | **1** |
| Tổng trang nội dung | **~115 trang** (index/log/overview thêm 3 = 118) |
| Orphan pages | 1 (Vault-Structure — tồn đọng) |
| Ghost pages (log ≠ disk) | 3 (rca-schedule-vnws, rca-inoac-redis, rca-redis-stop) |
| Index ↔ Disk | ⚠️ 2 synthesis chưa vào index.md |
| Cập nhật lần cuối | 2026-04-27 |
| Lần analyze gần nhất | 2026-04-27 (lần 7 — đếm lại thực tế disk) |

## Dự án đang hoạt động (2026)

- **VnPay**: Nâng cấp .NET 8, timeline 01/01–19/04/2025 (đã hoàn thành giai đoạn chính)
- **Bitex**: Dự án mới 2026, đang trong giai đoạn khởi động
- **QuickPack (QPVN)**: Đã Golive 01/12/2025, đang Project Acceptance 01–02/2026

## Dự án đã hoàn thành (archived)

2024: LTG, Toyota HVN, Taisun, FGL, TBV, AMIS, OPA, UNIS, VCBs  
2025: TrungDong, HongNgoc, Terumo, Marico, PEWVN

## Gaps & To-Do

> Cập nhật lần analyze thứ 7 — 2026-04-27 (đếm thực tế disk, fix lệch số liệu, ghost pages)

- [ ] 🔴 **[GHOST PAGES]** 3 trang RCA có trong log nhưng không có file — kiểm tra/tạo lại:
  - `wiki/synthesis/rca-schedule-vnws-opa-20260418.md`
  - `wiki/synthesis/rca-inoac-redis-cache-20260427.md`
  - `wiki/synthesis/rca-redis-stop-restart-20260427.md`
- [ ] 🔴 **[RỦI RO CAO]** Ingest tài liệu Bitex — dự án 2026 ACTIVE nhưng **0 sources**
- [ ] 🔴 **[RỦI RO CAO]** Xác định `pvcfc` — xuất hiện trong WarmupStatus production; tạo entity/project nếu cần
- [ ] 🟡 Thêm 2 synthesis trang mới vào `wiki/index.md`:
  - `hoat-dong-wiki-27-04-2026.md`
  - `hoat-dong-wiki-27-04-2026-v2.md`
- [ ] 🟡 Tạo `wiki/entities/Bitex.md` — chưa có entity profile
- [ ] 🟡 Tạo `wiki/concepts/iBHXH-Portal.md` — đủ trọng lượng sau 9+ INS sources
- [ ] 🟡 Tạo `wiki/concepts/MISA-Integration.md` — nhắc nhiều trong VnPay-INS và BaoHiem research
- [ ] 🟡 Tạo `wiki/flows/Flow-OffBoarding-NhanVien.md`
- [ ] 🟡 Tạo `wiki/flows/Flow-TuyenDung.md`
- [ ] 🟡 Tạo `wiki/api/API-iBHXH-Integration.md`
- [ ] 🟡 Ingest thêm nguồn cho TrungDong (hiện 2 nguồn) — go-live docs, final report
- [ ] 🟡 Ingest thêm nguồn cho HongNgoc (hiện 2 nguồn)
- [ ] 🟢 Liên kết `wiki/concepts/Vault-Structure` từ ít nhất 1 project/concept khác (hết orphan)
- [ ] 🟢 Thêm cross-links giữa 9+ INS sources với nhau
- [ ] 🟢 Ingest archived project lessons learned (LTG, Toyota HVN, Taisun, FGL, TBV, AMIS)
- [ ] 🟢 Ingest các tài liệu VnPay còn lại (GAP analysis, QC test plan)
- ~~[ ] Tạo `wiki/concepts/PKM-Methods.md`~~ → ĐÃ tạo ✅
- ~~[ ] Ingest Daily 2024 notes~~ → ĐÃ gộp thành 6+ source pages ✅
- ~~[ ] Ingest FIT project~~ → ĐÃ tạo entity + source ✅
- ~~[ ] Tạo `wiki/concepts/BaoHiem-Module.md`~~ → ĐÃ cover bởi 9+ INS sources ✅
- ~~[ ] Tạo `wiki/flows/`~~ → ĐÃ tạo 7 trang flows ✅
- ~~[ ] Tạo `wiki/architecture/`~~ → ĐÃ tạo 6 trang architecture ✅
- ~~[ ] Tạo `wiki/glossary/`~~ → ĐÃ tạo HRM-Glossary ✅
