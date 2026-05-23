---
type: source
description: "Tổng quan dự án HRM Bitex 2025-2026: phạm vi, timeline, các module triển khai và trạng thái tiến độ."
tags:
  - bitex
  - akw
  - hrm
  - project
  - 2025-2026
domain: system
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/concepts/HRM-Code-Quality]]"
  - "[[wiki/sources/Bitex-Chat-ChiHuyThiCong]]"
---

# Nguồn: Bitex Project — Tổng quan Dự án (Goals / Scope / Timeline / Risks / Resources / Phases)

> Nguồn gốc: Thư mục `1. Projects/Dự án 2026/Bitex-Project/` — Các file: Goals-7425, Scope-7425, Timeline-7425, Risks-7425, Resources-7425, Phases/

---

## Tóm tắt

Dự án Bitex-AKW là dự án triển khai HRM mới (Mã: 25010206-01) cho khách hàng **Bitex** và **AKW** — hai đơn vị ký **2 hợp đồng riêng biệt** nhưng dùng **chung 1 hệ thống HRM**. Dự án bắt đầu từ tháng 06/2025 và go-live vào 01/12/2025. Một mục tiêu kỹ thuật đặc biệt là chuyển từ .NET Framework sang .NET Core. Tính đến 27/04/2026, dự án đang trong giai đoạn hỗ trợ vận hành hậu go-live với nhiều cải tiến performance và bug fix liên tục.

---

## Key Takeaways

- **2 hợp đồng, 1 dự án**: Bitex + AKW ký hợp đồng riêng nhưng dùng chung source code HRM → quản lý 1 project trên AMIS, hạch toán tài chính tách đôi
- **Chuyển đổi kỹ thuật**: Mục tiêu chuyển từ .NET Framework → .NET Core (deadline: 20/03/2025, QC/SE fix đến 19/04)
- **Timeline 5 giai đoạn**:
  - Giai đoạn 1: Khảo sát + SRS (02/06 – 30/06/2025)
  - Giai đoạn 2: Cài đặt hệ thống (01/07 – 30/09/2025)
  - Giai đoạn 3: Đào tạo (29/09 – 18/12/2025, kéo dài so với kế hoạch)
  - Giai đoạn 4: UAT 2 round (14/10 – 23/11/2025)
  - Giai đoạn 5: Golive 01/12/2025 + Hỗ trợ vận hành (đang tiếp tục)
- **Tích hợp API**: HRM gọi API phía KH để lấy dữ liệu real-time (không chỉ import file tĩnh)
- **Branch source**: `HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09` — tách từ 23/08/2025
- **Nhóm chat quản lý**: "Bitex AKW - Chỉ huy thi công" (11/07/2025 → nay)
- **Trạng thái hiện tại (27/04/2026)**: Hậu go-live, PE Tuyết Anh hỗ trợ vận hành — 81/99 tasks done, đang cấu hình báo cáo và xuất Word

---

## Nhân sự dự án

| Tên | Vai trò | Ghi chú |
|-----|---------|---------|
| Lý Nhuận Tùng | Trưởng dự án / SE Lead | Phụ trách kỹ thuật, push SE |
| Trịnh Công Thức (Thức) | PE Lead | Task list, training plan, giao tiếp KH |
| Trần Duy Tùng | Quản lý thi công (TCDA) | Ra quyết định nguồn lực, OT |
| Trần Quốc Bảo | Quản lý (TCDA) | Trao đổi khi TDT vắng |
| Phạm Văn Hiển | Quản lý (TCDA) | Điều phối API, bổ sung nhân sự |
| Nguyễn Thị Kim Hồng | SE Lead (TCDA) | Quản lý task SE từ 11/2025 |
| Trần Văn Hoài Thương | SE thi công | Phụ trách từ 23/08/2025 |
| Phan Thị Ngọc Tuyền (Tuyết Anh) | PE hỗ trợ | Phụ trách hậu go-live, task AKW series |
| Nguyễn Thị Lan Vy | PE | Admin nhóm |

---

## Rủi ro thực tế phát sinh

| # | Rủi ro | Thời điểm | Trạng thái |
|---|--------|-----------|-----------|
| R1 | BA bị rút không thông báo PE | 06/09/2025 | ✅ Đã xử lý |
| R2 | HRE deadline trễ (10/10 → 18/10) | 15/10/2025 | ✅ Re-target |
| R3 | AKW32 ẩn nhiều sub-task — estimate sai | 01/11/2025 | ✅ Đã xử lý |
| R4 | Lệch dữ liệu file offline vs online | 18/12/2025 | ✅ Chốt Google Sheet |
| R5 | Lỗi gửi mail hệ thống | 27/01/2026 | 🔄 Đang theo dõi |
| R6 | Lỗi cache cấu hình (HttpContext → Redis) | 12/02/2026 | ✅ Đã fix |
| R7 | Performance: cache list → dictionary | 08/04/2026 | ✅ Đã fix |

---

## Lỗi kỹ thuật nổi bật (Tháng 11–12/2025)

| Bug | Mô tả | Biện pháp |
|-----|-------|----------|
| Bug 1 | Trường ẩn/hiện bị reset về nguyên trạng | Kiểm tra logic set default |
| Bug 2 | FIELD_INFO_SPEC.XML trùng key | Dùng tool check key, sửa file |
| Bug 3 | AKW164 bị lỗi lại sau khi fix | Quản lý version build chặt hơn |
| Bug 4 | File lang lỗi sau upbuild do code "lỡ cỡ" | Code review + PR checklist |

---

## Quy ước build (từ 23/08/2025)

- **Branch**: `HRM9-BRANCH/v8.12.48.01/BITEX_v8.12.48.01.09`
- **Format Main**: `/HRM8_SQL/Pass/BITEX_v8.12.48.01.09.XX.zip`
- **Format MyApp**: `/HRM8_SQL/PASS/BUILD_PortalNew/BITEX_8.12.48.01/my-app-BITEX_v8.12.48.01.XX_DDMMYYYYYYYY.zip`
- **Quy trình**: SE build cuối giờ → gửi path → PE/QC up môi trường test → fix bug trước, move code sau

---

## Trích dẫn quan trọng

> **"SE xong task ≠ Dự án đảm bảo"** — Thức (PE Lead, 25/12/2025)
>
> SE xong → PE test + config → Chuyển KH → KH kiểm tra → Nghiệm thu.
> SE chỉ là bước đầu trong chuỗi.

> **Issue 2 hợp đồng 1 dự án** — Trịnh Công Thức / Trần Quốc Bảo:
> "2 hợp đồng nhưng 1 source code, 1 hệ thống. Nếu tách: 1 công việc phải thực hiện 2 lần → vô lý."

> **Bài học cache cấu hình (12/02/2026)**:
> "Hệ thống dùng HttpContext.Cache, cache chỉ tồn tại theo từng request. Khi nhiều request chạy cùng lúc có thể cùng đọc file cấu hình và gây lỗi file đang được sử dụng. Chuyển sang Redis giúp dùng cache chung cho toàn hệ thống."

---

## Bài học dự án

1. **Thông báo khi rút nguồn lực**: Bắt buộc thông báo PE trước ít nhất 3 ngày khi điều chuyển nhân sự
2. **Buffer deadline**: Deadline SE cần sớm hơn deadline UAT ít nhất 2–3 ngày
3. **1 nguồn dữ liệu duy nhất**: Google Sheet online là chuẩn — không dùng file offline
4. **Estimate task kỹ**: 1 task có thể ẩn nhiều sub-task (VD: AKW32) → breakdown rõ trước khi raise
5. **Thông báo sớm khi sắp trễ**: SE không chờ đến ngày deadline mới báo
6. **Multi-contract = 1 project**: Quản lý công việc gộp, hạch toán tài chính tách theo hợp đồng

---

## Liên kết

- [[wiki/projects/Bitex-Project]] — Trang dự án chính
- [[wiki/sources/Bitex-Chat-ChiHuyThiCong]] — Chat log chi tiết nhóm thi công
- [[wiki/sources/Bitex-TaskList-PostGoLive]] — Task list hậu go-live (Tuyết Anh)
- [[wiki/flows/Flow-Bitex-Phases]] — Sơ đồ các giai đoạn dự án
- [[wiki/concepts/Project-Phases]] — Khái niệm giai đoạn triển khai HRM
- [[wiki/concepts/HRM-Code-Quality]] — Quy tắc build, merge, store
