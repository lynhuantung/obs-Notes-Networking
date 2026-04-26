---
type: overview
date-updated: 2026-04-26
sources-ingested: 34
last-analyzed: 2026-04-26
wiki-version: v2 (flows + architecture + glossary added)
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
| Sources đã ingest | 34 |
| Trang Projects | 5 (2 active, 3 archived) |
| Trang Entities | 5 |
| Trang Concepts | 13 |
| Trang Sources | 34 |
| Trang Synthesis | 3 |
| **Trang Flows** | **5 (MỚI)** |
| **Trang Architecture** | **4 (MỚI)** |
| **Trang Glossary** | **1 (MỚI)** |
| Tổng trang nội dung | **70 trang** |
| Orphan pages | 1 (Vault-Structure) |
| Index ↔ Disk | ✅ KHỚP HOÀN TOÀN |
| Cập nhật lần cuối | 2026-04-26 |
| Lần analyze gần nhất | 2026-04-26 (lần 5 — restructure) |

## Dự án đang hoạt động (2026)

- **VnPay**: Nâng cấp .NET 8, timeline 01/01–19/04/2025 (đã hoàn thành giai đoạn chính)
- **Bitex**: Dự án mới 2026, đang trong giai đoạn khởi động

## Dự án đã hoàn thành (archived)

2024: LTG, Toyota HVN, Taisun, FGL, TBV, AMIS, OPA, UNIS, VCBs  
2025: TrungDong, HongNgoc, Terumo, Marico, PEWVN

## Gaps & To-Do

> Cập nhật lần analyze thứ 5 — 2026-04-26 (sau restructure: thêm flows/ + architecture/ + glossary/)

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
- ~~[ ] Tạo `wiki/concepts/BaoHiem-Module.md`~~ → ĐÃ cover bởi 9 INS sources ✅
- ~~[ ] Tạo `wiki/flows/`~~ → ĐÃ tạo 5 trang flows (2026-04-26) ✅
- ~~[ ] Tạo `wiki/architecture/`~~ → ĐÃ tạo 4 trang architecture (2026-04-26) ✅
- ~~[ ] Tạo `wiki/glossary/`~~ → ĐÃ tạo HRM-Glossary (2026-04-26) ✅
