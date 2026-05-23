---
description: "Tổng quan dự án QuickPack Việt Nam: triển khai 8 phân hệ HRM, golive 01/12/2025, rủi ro nguồn lực SE và 3 bug block UAT."
type: source
domain: attendance
tags:
  - quickpack
  - qpvn
  - hrm
  - triển-khai
  - golive
created: 2026-04-27
updated: 2026-04-27
source-file: "1. Projects/Dự án 2026/QuickPack-Project/"
related:
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/entities/QuickPack]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/flows/Flow-QuickPack-Phases]]"
---

# Source: QuickPack-Project — Tổng quan dự án QPVN

## Tóm tắt

Dự án triển khai hệ thống HRM cho **QuickPack Việt Nam (QPVN)** do VnResource thực hiện từ T4/2025 đến T2/2026. Mục tiêu chính là nâng cấp hệ thống từ .NET Framework sang .NET Core và triển khai 8 phân hệ (HRE, ATT, REC, UNI, INS, SAL, TRA, EVA). Official Golive là **01/12/2025** — mốc cứng không lùi. Dự án có 2 bên thực hiện song song: VnResource (build, SE) và QPVN (data migration, UAT). PM phía VnResource là **Lý Nhuận Tùng (Tùng.Ly)**, PM phía KH là **Trần Phước Hạc**.

## Key Takeaways

- **8 phân hệ** chia 2 đợt build: Đợt 1 (HRE/ATT/REC/UNI — T8), Đợt 2 (INS/SAL/TRA/EVA — T9)
- **3 module GAP phức tạp**: Đồng phục/Thiết bị (cảnh báo tồn kho), SAL (lệch chu kỳ lương), TRA (đào tạo theo đợt)
- **Rủi ro nghiêm trọng đã xảy ra**: thiếu SE T8/2025 — yêu cầu 3MM, thực cấp < 0.5MM; SE bị rút giữa UAT (09/09)
- **3 bugs block UAT**: QPVN2128, QPVN2158, QPVN2146 — cần fix trước ngày 08/09/2025
- **Hạ tầng**: Server UAT tại `https://site1.hrquickpack.vn:8002`, dùng IIS + SQL Server + Redis
- **Lỗi kỹ thuật đã xử lý**: thiếu file config mobile app, lỗi IIS_IUSRS permissions, Redis cache cần clear
- **Build Management**: quy trình SE raise → Nguyễn Ngọc Hải build Main (~1 tiếng) → SE upload portal → QC test
- **Project Acceptance**: 01–02/2026, đã có build `QPVN_v8.12.48.01.43` ngày 19/01/2026

## Trích dẫn quan trọng

> **Mục tiêu tổng quát:** Chuyển net framework sang netcore cho dự án QuickPack. Official Golive 01/12/2025 (mốc cứng, không lùi).

> **Vấn đề nguồn lực T8/2025 (Hạc → Tùng.Ly, 13/08/2025):** "PM yêu cầu 3 manmonth SE cho tháng 8/2025. Thực tế được cấp < 0.5 manmonth. Hậu quả: tất cả tasks đều chờ một mình Như làm → không kịp tiến độ."

> **Tình trạng task cuối T8:** 35 tasks tổng (29 chờ SE resolve + 6 bug) tại ngày 04/09 — block không test tiếp được → delay UAT.

> **Bài học nguồn lực:** "Nên chốt resource commitment từ đầu tháng, không để leo thang qua nhiều tuần. UAT phase cần SE backup song song (fix bug + develop phase tiếp theo)."

> **GAP Đồng phục:** Logic tồn kho: Tồn cũ + Nhập - Cấp + Thu hồi = Tồn mới. Chặn nhập vượt quá tồn kho.

## Chi tiết GAP theo phân hệ

| Phân hệ | GAP | Độ phức tạp |
|---------|-----|-------------|
| HRE | Người thân/NPT, trình độ, tài khoản | Trung bình |
| ATT | Chấm công theo quy tắc QPVN | Trung bình |
| REC | 8 cấp tuyển dụng, chặn vượt định biên | **Phức tạp** |
| Đồng phục/Thiết bị | Cảnh báo tồn kho, số lượng sắp cấp | **Rất phức tạp** |
| INS | ✅ Không có GAP | Đơn giản |
| SAL | Lương sản phẩm — lệch chu kỳ lương chính | **Rất phức tạp** |
| TRA | Đào tạo nhân viên mới theo đợt | **Rất phức tạp** |
| EVA | ✅ Không có GAP | Đơn giản |

## Cấu hình kỹ thuật HRM QPVN

- **URL UAT:** `https://site1.hrquickpack.vn:8002`
- **Stack:** .NET Core + IIS + SQL Server + Redis
- **Services:** Main Web (6501), Employee Portal (6502), HR Service (6503), SYS Service (6504), API Center (6505), API Integration (6506)
- **Files config mobile:** `/Apps/mobile/ConfigList.json`, `ConfigListFilter.json`, `ConfigListDetail.json`, `ConfigField.json`, `ConfigMappingSalary.json`, `ConfigChart.json`
- **Lỗi IIS hay gặp:** thiếu quyền `IIS_IUSRS` → phân lại quyền full

## Liên kết

- [[wiki/projects/QuickPack-Project]] — Trang dự án chính
- [[wiki/entities/QuickPack]] — Entity khách hàng QPVN
- [[wiki/flows/Flow-QuickPack-Phases]] — Sơ đồ 6 giai đoạn dự án
- [[wiki/concepts/Project-Phases]] — Khái niệm các giai đoạn triển khai
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — Lỗi IIS liên quan
- [[wiki/sources/Bitex-Project-Overview]] — Dự án tương tự để so sánh
