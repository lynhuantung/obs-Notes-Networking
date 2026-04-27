---
type: overview
date-updated: 2026-04-27
sources-ingested: 55
last-analyzed: 2026-04-27
wiki-version: v3 (Đợt 1: archived 2024+2025; Đợt 2: Daily 2024+FIT+PKM; Đợt 3: UNIS/VCBs/OPA/LDAP/Interview/ATT bug)
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
| Sources đã ingest | 70 (+6 từ Nhóm 1 rà soát) |
| Trang Projects | 6 (2 active, 4 archived) |
| Trang Entities | 11 |
| Trang Concepts | 14 |
| Trang Sources | 70 |
| Trang Synthesis | 3 |
| **Trang Flows** | **5** |
| **Trang Architecture** | **4** |
| **Trang Glossary** | **1** |
| Tổng trang nội dung | **~112 trang** |
| Orphan pages | 1 (Vault-Structure) |
| Index ↔ Disk | ✅ KHỚP |
| Cập nhật lần cuối | 2026-04-27 |
| Lần analyze gần nhất | 2026-04-27 (lần 6 + Đợt 1 + Đợt 2 batch ingest) |

## Dự án đang hoạt động (2026)

- **VnPay**: Nâng cấp .NET 8, timeline 01/01–19/04/2025 (đã hoàn thành giai đoạn chính)
- **Bitex**: Dự án mới 2026, đang trong giai đoạn khởi động

## Dự án đã hoàn thành (archived)

2024: LTG, Toyota HVN, Taisun, FGL, TBV, AMIS, OPA, UNIS, VCBs  
2025: TrungDong, HongNgoc, Terumo, Marico, PEWVN

## Gaps & To-Do

> Cập nhật lần analyze thứ 6 — 2026-04-27 (health check + Đợt 1 + Đợt 2 batch ingest)

- [ ] 🔴 **[RỦI RO CAO]** Ingest tài liệu Bitex — dự án 2026 ACTIVE nhưng **0 sources**
- [ ] 🔴 **[RỦI RO CAO]** Xác định `pvcfc` — xuất hiện trong WarmupStatus production; tạo entity/project nếu cần
- [ ] 🟡 Tạo `wiki/entities/Bitex.md` — chưa có entity profile
- [ ] 🟡 Tạo `wiki/concepts/iBHXH-Portal.md` — đủ trọng lượng sau 9 INS sources
- [ ] 🟡 Tạo `wiki/concepts/MISA-Integration.md` — nhắc nhiều trong VnPay-INS và BaoHiem research
- [ ] 🟡 Tạo `wiki/flows/Flow-OffBoarding-NhanVien.md` — quy trình nghỉ việc chưa có
- [ ] 🟡 Tạo `wiki/flows/Flow-TuyenDung.md` — quy trình tuyển dụng từ đăng tin đến onboarding
- [ ] 🟡 Tạo `wiki/api/API-iBHXH-Integration.md` — tài liệu API tích hợp iBHXH
- [ ] 🟡 Ingest thêm nguồn cho TrungDong (hiện 2 nguồn) — go-live docs, final report
- [ ] 🟡 Ingest thêm nguồn cho HongNgoc (hiện 1 nguồn)
- [ ] 🟢 Liên kết `wiki/concepts/Vault-Structure` từ ít nhất 1 project/concept khác (hết orphan)
- [ ] 🟢 Thêm cross-links giữa 9 INS sources với nhau
- [ ] 🟢 Ingest archived project lessons learned (LTG, Toyota HVN, Taisun, FGL, TBV, AMIS, OPA, UNIS)
- [ ] 🟢 Ingest các tài liệu dự án VnPay còn lại (GAP analysis, QC test plan)
- ~~[ ] Tạo `wiki/concepts/PKM-Methods.md`~~ → ĐÃ tạo (Đợt 2) ✅
- ~~[ ] Ingest Daily 2024 notes~~ → ĐÃ gộp thành 6 source pages (Đợt 2) ✅
- ~~[ ] Ingest FIT project~~ → ĐÃ tạo entity + source (Đợt 2) ✅
- ~~[ ] Tạo `wiki/concepts/BaoHiem-Module.md`~~ → ĐÃ cover bởi 9 INS sources ✅
- ~~[ ] Tạo `wiki/flows/`~~ → ĐÃ tạo 5 trang flows (2026-04-26) ✅
- ~~[ ] Tạo `wiki/architecture/`~~ → ĐÃ tạo 4 trang architecture (2026-04-26) ✅
- ~~[ ] Tạo `wiki/glossary/`~~ → ĐÃ tạo HRM-Glossary (2026-04-26) ✅
