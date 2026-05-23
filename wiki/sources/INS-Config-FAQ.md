---
type: source
description: "FAQ cấu hình bảo hiểm INS: các thiết lập SysInsConfig, câu hỏi thường gặp và cách kiểm tra."
code: k3f9
tags:
  - "ins"
  - "config"
  - "bao-hiem"
  - "sys-insconfig"
domain: ins
created: 2026-05-02
updated: 2026-05-02
source-file: raw/Nghiệp vụ HRM/INS/INS-Config-FAQ.md
related:
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/sources/INS-Quy-Trinh]]"
  - "[[wiki/sources/INS-FAQ-4GocNhinTrucTrac]]"
---

# Source: INS-Config-FAQ — Cấu hình Thiết lập Bảo Hiểm (Sys_InsConfig)

## Tóm tắt

Tài liệu tra cứu toàn diện các key config trong màn hình **Thiết Lập Bảo Hiểm** (`Sys_InsConfig`), được trích xuất trực tiếp từ source code (`Sys_InsConfigEntity.cs`, `InsuranceServices.cs`, `Ins_InsuranceD02Services.cs`, `Ins_InsurancePayBackServices.cs`). Tài liệu cập nhật 2026-05-02, bao gồm **8 nhóm cấu hình** với ~50 keys, mỗi key có: tên hiển thị, kiểu dữ liệu, giá trị mặc định, hàm sử dụng, và lỗi thường gặp. Mục tiêu là giúp debug lỗi BH nhanh — không cần đọc code.

## Key Takeaways

- **Config quan trọng nhất**: `HRM_INS_CONFIG_INSURANCERECORDSTATUSCOUNT` — trạng thái chứng từ được đưa vào phân tích BH, D02, C70A; đây là nguyên nhân #1 khi chứng từ đã nhập mà không ra D02/phân tích
- **Chu kỳ BH** được kiểm soát bởi 3 cặp config riêng biệt: chu kỳ mặc định, chu kỳ thay đổi lương, chu kỳ báo giảm LĐ — sai 1 cặp dẫn đến D02 nhầm tháng
- **Logic 14 ngày** có 6+ config điều khiển: ngưỡng ngày, nguồn dữ liệu (LeaveDay/Workday/InsuranceRecord), bảng tính công vs tổng hợp công, chu kỳ đếm — cần xác định đúng nguồn trước khi debug
- **Static cache** trong `InsuranceServices`: thay đổi config cần restart app hoặc clear cache để có hiệu lực ngay
- **Config liên module**: 3 key từ SAL/HRE/ATT ảnh hưởng trực tiếp đến BH (`HRM_SAL_NUMBER_DAY_PROFILE_QUIT`, `HRM_HRE_CONFIG_QUITCAL`, `HRM_ATT_ANNUALDETAIL_LEAVEDAYSTATUS`)
- Bảng **"Triệu chứng → Config cần kiểm tra"** cuối file là công cụ debug nhanh nhất — 14 triệu chứng phổ biến được mapping trực tiếp

## Trích dẫn quan trọng

> `InsuranceRecordStatusCount` được dùng ở **nhiều chỗ** trong `InsuranceServices`, `D02Services`, `PayBackServices` → đây là config quan trọng nhất khi chứng từ không được tính

> Nhiều property trong `InsuranceServices` dùng **static cached field** → thay đổi config cần restart app hoặc clear cache để có hiệu lực ngay

> `HRM_INS_CONFIG_PERIODINSURANCEYDAY`: `PeriodInsuranceDayPreMonth = config + 1` (Honda dùng ngày 18 → config = 17) — Nếu NV vào làm ngày 16 mà không ra D02 tăng → kiểm tra config này

> `HRM_INS_CONFIG_ISDELDATACOMPUTEINSURANCE`: Bật cùng với phân tích lại có thể làm mất dữ liệu đã điều chỉnh thủ công

## Nhóm config theo chức năng

| Nhóm | Số keys | Chức năng chính |
|------|---------|----------------|
| Cấu Hình BH chung | 12 | Ngày chốt, chu kỳ, nguồn dữ liệu thai sản, hợp đồng |
| Nghỉ ≥14 Ngày | 11 | Ngưỡng ngày, nguồn dữ liệu, chu kỳ đếm, ưu tiên thai sản |
| Điều Chỉnh BH | 3 | Xóa dữ liệu khi tính lại, tìm NV nghỉ việc |
| BC D02 | 4 | Tách BHTN, pháp nhân D02, 2 dòng tăng thai sản |
| Chứng Từ BH | 11 | Trạng thái, khóa sửa, cảnh báo thai sản, 01B-HSB |
| Đăng Ký Thay Đổi | 2 | Trạng thái hủy/khóa đăng ký thay đổi thông tin BH |
| C70A / 01B-HSB | 2 | Chu kỳ, trạng thái load chứng từ |
| Lương BHXH | 1 | Công thức tính mức lương đóng BH |

## Liên kết

- [[wiki/architecture/INS-Architecture]] — kiến trúc phân hệ INS, 4 layer, 72 bảng
- [[wiki/architecture/INS-Database-Schema]] — schema bảng `Sys_AllSetting` lưu các key này (cột `Name` = AppKey, `Value1` = giá trị)
- [[wiki/sources/INS-FAQ-QuyTrinh5Buoc]] — quy trình 5 bước phân tích BH dùng các config trên
- [[wiki/sources/INS-FAQ-4GocNhinTrucTrac]] — checklist 4 góc nhìn debug, nhiều step kiểm tra config
- [[wiki/sources/INS-Quy-Trinh]] — luồng INS01: HRE→ATT→INS→SAL, config ảnh hưởng từng bước
- [[wiki/sources/INS-FAQ-NghiViecTrongKy]] — logic 2 dòng D02, config `isCheck14dayProfileQuitNextMonth`
- [[wiki/sources/INS-Thai-San-On-Off]] — ON/OFF thai sản pivot ngày 14/15, liên quan config nghỉ 14 ngày
