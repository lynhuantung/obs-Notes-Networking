---
type: wiki-entity
tags:
  - khach-hang
  - archived-2024
date-updated: 2026-04-27
related:
  - "[[wiki/projects/LTG-Project]]"
  - "[[wiki/sources/LTG-INS-Meetings-2024]]"
  - "[[wiki/sources/LTG-TAL-Meetings-2024]]"
  - "[[wiki/sources/LTG-SYS-Meetings-2024]]"
---

# Entity: LTG (Long Thành Gaz / LTG Group)

## Thông tin chung

| Thuộc tính    | Giá trị                                        |
| ------------- | ---------------------------------------------- |
| Loại          | Khách hàng — Doanh nghiệp sản xuất/phân phối   |
| Trạng thái    | ✅ Archived (2024)                              |
| Giai đoạn     | Phase 3 — Post-UAT fix & go-live               |
| Thời gian     | 07/2024                                        |
| Phân hệ chính | Bảo hiểm (INS), Nhân tài (TAL), Hệ thống (SYS) |

## Nhân sự tham gia (VnResource)

| Tên | Vai trò |
|-----|---------|
| TungLy | SE chính / BA |
| MinhNguyendat | SE |
| TienDang | Leader / SYS |
| ThongTrinh | PE |
| SonVo, TungTran, TinNguyen | SE |
| BaoTran, HienPham, NganNguyen | QC / BA |

## Đặc điểm nổi bật

- **Kiêm nhiệm đa pháp nhân**: 1 nhân viên có thể kiêm nhiệm tại nhiều công ty con trong LTG Group — đây là yêu cầu đặc thù phức tạp, cần mở rộng hàm phân quyền `Get_Data_Permission_New()`
- **BH nghỉ tuần/lễ custom**: LTG không dùng `Cat_DayOff` chuẩn — ngày nghỉ hàng tuần là Thứ 7 + Chủ nhật, ngày lễ tự quản lý riêng
- **Phân hệ Nhân tài (TAL)**: Triển khai đầy đủ: vị trí chủ chốt, khung năng lực, đội ngũ kế thừa, phân tích đào tạo, phân quyền tự động

## Liên kết

- [[wiki/sources/LTG-INS-Meetings-2024]]
- [[wiki/sources/LTG-TAL-Meetings-2024]]
- [[wiki/sources/LTG-SYS-Meetings-2024]]
- [[wiki/concepts/HRM-Modules]]
