---
description: "Báo cáo RCA PDCA tháng 04/2026: lỗi VNPAY1538 double-wrap API response, phân tích 5 Whys và cải tiến quy trình."
type: synthesis
tags:
  - rca
  - monthly-report
  - pdca
  - vnpay
  - net8-migration
  - mobile-app
created: 2026-04-28
updated: 2026-04-28
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/concepts/Net8-Migration]]"
  - "[[wiki/sources/Daily-2025-CursorAI-Net8]]"
---

# Báo Cáo Tóm Tắt Mục Tiêu Tháng 04/2026

## Mô Tả Vấn Đề

- Tháng 04/2026 ghi nhận lỗi nghiêm trọng trên Mobile App VnPay: màn hình chi tiết đơn ngày nghỉ hiển thị trống sau khi migration lên .NET 8.
- Nguyên nhân cốt lõi: **cấu trúc API response không đồng nhất** giữa các màn hình cùng module do Global Response Wrapper wrap đôi — pattern phổ biến sau .NET 8 migration tại VnPay.

---

## Hiện Trạng

| Chỉ số | Tháng 03/2026 | Tháng 04/2026 | Thay đổi |
|--------|--------------|--------------|---------|
| Bug Mobile App (VnPay) | — | 1 (VNPAY1538) | Mới phát sinh |
| Won't Fix | — | 0 | — |
| Severity | — | HIGH (UX bị ảnh hưởng trực tiếp) | — |

> ⚠️ **Lưu ý:** Đây là lỗi điển hình của giai đoạn **Post-.NET 8 Migration** — có nguy cơ tái diễn ở các màn hình list→detail khác nếu không có checklist kiểm tra đồng bộ.

---

## Mục Tiêu

Mục tiêu phân hệ **ATT / Nghỉ phép — Mobile App (VnPay)** tháng 05/2026 sẽ **giảm bug dạng API response mismatch từ 1 xuống 0** và **xây dựng checklist phòng ngừa** đến hết ngày 31/05/2026.

---

## Root Cause (Phân Tích Pareto)

### Phân tích 5 Whys — VNPAY1538

| # | Câu hỏi | Trả lời | Nguồn |
|---|---------|---------|-------|
| 1 | Tại sao màn hình chi tiết hiển thị trống? | Frontend không render được data | Testcase thực tế |
| 2 | Tại sao frontend không render được? | Đọc sai tầng data: `Obj.Data` thay vì `Obj.Data.Data` | Code review |
| 3 | Tại sao lại đọc sai tầng? | Màn hình Duyệt được code theo cấu trúc cũ (single-wrap), màn hình Đăng ký đã cập nhật double-wrap | `[[raw/vNPAY1538-ObjDataData-Net8-Bug]]` |
| 4 | Tại sao có sự không đồng nhất này? | Migration .NET 8 thêm Global Response Filter wrap thêm 1 tầng, nhưng không phải tất cả controller đều được cập nhật frontend đồng bộ | `[[wiki/concepts/Net8-Migration]]` |
| **Root** | **Nguyên nhân gốc rễ** | **Không có contract/interface chung cho API response shape — mỗi màn hình tự parse, thiếu test tự động cho luồng list→detail** | inference |

### Nhóm nguyên nhân (Pareto)

```
Bug count (tháng 04/2026 — VnPay Mobile):

1. API response structure không đồng nhất (post-migration)  — 1 bug  (~100%)
   └─ Sub: Thiếu Response Shape Contract               ~60%
   └─ Sub: Thiếu test tự động luồng list→detail         ~40%
```

> Tháng 04 chỉ có 1 bug được ghi nhận chính thức → **tập trung 100% vào nhóm này** để ngăn tái diễn trên các màn hình tương tự.

---

## Plan — Kế Hoạch

| # | What | Who | Notes | When | Status |
|---|------|-----|-------|------|--------|
| 1 | Audit toàn bộ màn hình Mobile App có luồng list→detail, kiểm tra cấu trúc `Obj.Data` vs `Obj.Data.Data` | SE VnPay | Ưu tiên module ATT, SAL, INS | 05/05/2026 | New |
| 2 | Thống nhất Response Shape: chọn 1 trong 2 — single-wrap hoặc double-wrap — áp dụng toàn project | SE + BA | Document quyết định vào wiki | 09/05/2026 | New |
| 3 | Tạo helper parse chung `parseApiResponse(res)` xử lý cả 2 trường hợp | SE | Short-term fix tránh lỗi tương tự | 12/05/2026 | New |
| 4 | Thêm code review checklist: "API response đang dùng Obj.Data hay Obj.Data.Data?" | Tech Lead | Ghim vào PR template | 15/05/2026 | New |
| 5 | Viết integration test kiểm tra `response.Data` vs `response.Data.Data` cho tất cả API public Mobile | SE QC | Test Playwright/Postman collection | 31/05/2026 | New |

---

## Check — Hiệu Quả Giải Pháp

| # | What | Who | Notes | When | Status |
|---|------|-----|-------|------|--------|
| 1 | Fix màn hình Duyệt: `Obj.Data` → `Obj.Data.Data` | SE VnPay | Ticket VNPAY1538 | 28/04/2026 | ✅ Done |
| 2 | Xác nhận root cause qua code review | SE | Đã xác nhận double-wrap từ Global Response Filter | 28/04/2026 | ✅ Done |
| 3 | Ghi nhật ký RCA vào wiki | SE | `raw/vNPAY1538-ObjDataData-Net8-Bug.md` | 28/04/2026 | ✅ Done |

---

## Act — Follow Up

| # | What | Who | Notes | When | Status |
|---|------|-----|-------|------|--------|
| 1 | Ingest bài học `.NET 8 double-wrap` vào `wiki/concepts/Net8-Migration.md` | SE | Cảnh báo cho toàn team | 05/05/2026 | 🔄 Doing |
| 2 | Thông báo pattern này đến các SE đang làm Mobile App VnPay | Tech Lead | Slack / standup | 30/04/2026 | ⏳ Pending |
| 3 | Theo dõi kết quả audit màn hình (Action Plan #1) | SE | Nếu phát hiện thêm → tạo ticket mới | 09/05/2026 | ⏳ Pending |

---

## Bài Học Tháng Này

1. **Post-migration risk**: Sau khi thêm Global Response Wrapper vào .NET 8 pipeline, **bắt buộc** kiểm tra lại tất cả màn hình có luồng list→detail — đây là luồng dễ bị lỗi nhất vì gọi 2 API khác nhau.
2. **Contract first**: Trước khi code frontend mobile, cần thống nhất Response Shape Contract bằng văn bản — tránh mỗi màn hình parse theo cách riêng.
3. **Test coverage gap**: Thiếu integration test tự động cho luồng list→detail là lý do lỗi này không bị phát hiện sớm trong QA.
4. **Wiki as safety net**: Ghi lại pattern lỗi `.NET 8 Obj.Data.Data` vào wiki giúp team tra cứu nhanh khi gặp triệu chứng tương tự ở module khác.

---

## Liên Kết

- **Ticket gốc:** VNPAY1538
- **Raw analysis:** `[[raw/vNPAY1538-ObjDataData-Net8-Bug]]`
- **Project:** `[[wiki/projects/VnPay-Project]]`
- **Concept:** `[[wiki/concepts/Net8-Migration]]`
- **Source:** `[[wiki/sources/Daily-2025-CursorAI-Net8]]`

---

*Tùng Lý — Tháng 04/2026*
