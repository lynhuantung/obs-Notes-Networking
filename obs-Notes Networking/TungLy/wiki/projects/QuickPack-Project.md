---
type: wiki-project
tags:
  - quickpack
  - qpvn
  - hrm
  - net8
  - golive
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/entities/QuickPack]]"
  - "[[wiki/sources/QuickPack-Project-Overview]]"
  - "[[wiki/flows/Flow-QuickPack-Phases]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/concepts/Net8-Migration]]"
  - "[[wiki/concepts/Nguon-Luc]]"
---

# Dự án QuickPack Việt Nam (QPVN)

## Thông tin cơ bản

| Thuộc tính | Giá trị |
|-----------|---------|
| Mã dự án | 25010206-01 |
| Khách hàng | QuickPack Việt Nam (QPVN) |
| Vendor | VnResource |
| PM VnResource | Lý Nhuận Tùng (Tùng.Ly) |
| PM Khách hàng | Trần Phước Hạc |
| Bắt đầu | 04/2025 |
| Official Golive | **01/12/2025** ⭐ (mốc cứng) |
| Project Acceptance | 01–02/2026 |
| Trạng thái | ✅ Đã Golive, đang Acceptance |

## Mục tiêu

- Chuyển hệ thống HRM từ .NET Framework sang **.NET Core** cho QPVN
- Triển khai 8 phân hệ HRM: HRE, ATT, REC, UNI, INS, SAL, TRA, EVA
- Cải thiện hiệu suất hệ thống nhân sự lên 30% trong 6 tháng

## Phạm vi — 8 Phân hệ

### Đợt 1 — Build T8/2025, UAT T9/2025

| Phân hệ | Mô tả | GAP |
|---------|-------|-----|
| **HRE** | Hồ sơ nhân sự | Có GAP — người thân/NPT, tài khoản |
| **ATT** | Chấm công | Có GAP |
| **REC** | Tuyển dụng | **GAP phức tạp** — 8 cấp, chặn vượt định biên |
| **UNI** | Đồng phục & Thiết bị | **GAP rất phức tạp** — cảnh báo tồn kho |

### Đợt 2 — Build T9/2025, UAT T10/2025

| Phân hệ | Mô tả | GAP |
|---------|-------|-----|
| **INS** | Bảo hiểm | ✅ Không có GAP |
| **SAL** | Lương sản phẩm | **GAP rất phức tạp** — lệch chu kỳ lương chính |
| **TRA** | Đào tạo | **GAP rất phức tạp** — đào tạo theo đợt |
| **EVA** | Đánh giá | ✅ Không có GAP |

## Timeline

```
04/2025       Chuẩn bị, nâng cấp .NET Framework → .NET Core
06–07/2025    Khảo sát & chốt SRS (8 phân hệ)
15/07–30/08   Build Đợt 1: HRE, ATT, REC, UNI
15/08–30/09   Build Đợt 2: INS, SAL, TRA, EVA
T9/2025       UAT Đợt 1 (4 phân hệ đợt 1)
T10/2025      UAT Đợt 2 (4 phân hệ đợt 2)
01–20/11/2025 UAT Tổng hợp 8 phân hệ
T11/2025      Training End-user
01/12/2025    ⭐ GO-LIVE (mốc cứng)
01–02/2026    Project Acceptance / Nghiệm thu
```

## Hạ tầng & Kỹ thuật

| Thông tin | Giá trị |
|-----------|---------|
| URL UAT | `https://site1.hrquickpack.vn:8002` |
| Stack | .NET Core + IIS + SQL Server + Redis |
| S3 | Lưu file DB backup, config, source HRM |
| Build version hậu Golive | `QPVN_v8.12.48.01.43` (19/01/2026) |

**Services và Ports:**
- Main Web: 6501
- Employee Portal: 6502
- HR Service: 6503
- SYS Service: 6504
- API Center: 6505
- API Integration: 6506

## Rủi ro đã xảy ra

| Rủi ro | Mức độ | Kết quả |
|--------|--------|---------|
| Thiếu SE T8/2025 | 🔴 Cao | Yêu cầu 3MM, cấp < 0.5MM → escalate lên anh Bảo, anh Hiển |
| SE bị rút giữa UAT (09/09) | 🔴 Cao | Còn 35 tasks open → xin bổ sung sau lễ |
| 3 Bugs block UAT: QPVN2128/2158/2146 | 🟡 TB | Fix gấp trước 08/09 |
| Lỗi mobile app chỉ tại KH (T9/2025) | 🟡 TB | Điều SE mobile kiểm tra tại chỗ |
| Lỗi IIS_IUSRS permissions (09/10/2025) | 🟡 TB | Phân lại quyền full → fix xong |
| Server UAT/PRD chưa tách biệt | 🟡 TB | Lên kế hoạch dựng server PRD riêng |

## Nhân sự tham gia

| Vai trò | Tên |
|---------|-----|
| PM VnResource | Tùng.Ly (Lý Nhuận Tùng) |
| PM Khách hàng | Trần Phước Hạc |
| EM (escalation) | Quốc Bảo, anh Hiển |
| BA/PE | Trịnh Trần Thế Thông, Phan Thị Phương Thảo, Nguyễn Thị Kim Hồng |
| SE bổ sung T8 | Trần Thị Quỳnh Như (15–30/08), Quan (20–27/08), Tú (19–27/08) |
| Build Manager | Nguyễn Ngọc Hải |
| QC | Lê Thị Kim Tuyền |
| KH BA | Nguyễn Quốc Nhựt |

## Bài học rút ra

1. **Nguồn lực**: Chốt resource commitment từ đầu tháng — không để leo thang qua nhiều tuần
2. **UAT phase**: Cần SE backup song song (fix bug + develop phase tiếp theo)
3. **Quy định task tối thiểu**: "tối thiểu 5 task mới được xin nguồn lực" → PM KH challenge quy định này; nên xem xét lại
4. **Mobile app**: Lỗi chỉ xảy ra tại KH (không reproduce được tại VnR) → cần SE đến tại chỗ kiểm tra
5. **IIS permissions**: Luôn kiểm tra `IIS_IUSRS` và `NETWORK SERVICE` sau khi deploy

## Tài nguyên

- SRS: https://drive.google.com/file/d/18jjcY5p2Ba0_uKlp_qaQneP_jUkXbCn-/view
- Test Case: https://docs.google.com/spreadsheets/d/11g103d8kEB7cSc2MjnejOSMHo7mrrn37xBwPlqJ3-f8
- GAP Sheet: https://docs.google.com/spreadsheets/d/1uhtcnp6X5uern3ZMFKDac6HNwSgnkAIcoTgV-Xd1PWo

## Liên kết wiki

- [[wiki/entities/QuickPack]] — Entity khách hàng
- [[wiki/sources/QuickPack-Project-Overview]] — Tóm tắt nguồn
- [[wiki/flows/Flow-QuickPack-Phases]] — Sơ đồ 6 giai đoạn
- [[wiki/concepts/Net8-Migration]] — Nâng cấp .NET Core
- [[wiki/concepts/Nguon-Luc]] — Quản lý nguồn lực
- [[wiki/concepts/HRM-IIS-Troubleshooting]] — Lỗi IIS liên quan
- [[wiki/projects/Bitex-Project]] — Dự án tương tự (so sánh timeline/risk)
- [[wiki/projects/VnPay-Project]] — Dự án .NET 8 lớn hơn để so sánh
