---
description: "Dự án VCBs: 6 quy trình Quản lý Tài sản (FAC) và Khách hàng/Nhân Tài (TAL) — có QRCode, kiểm kê và thanh lý tài sản."
type: source
tags:
  - facility
  - tai-san
  - vcbs
  - meeting
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "1. Projects/VCBs/H-VCBS-FAC-290624/ + H-VCBS-TAL-220724.md"
related:
  - "[[wiki/entities/VCBs]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# VCBs — Quản Lý Tài Sản (FAC) & Nhân Tài (TAL) (06–07/2024)

## Tóm tắt

Dự án VCBs (Vietcombank Securities) triển khai 2 module ngoài HRM cốt lõi: (1) **Quản lý Tài sản** (FAC — Facility) — module đặc thù không phải domain HRM; (2) **Quản lý Nhân Tài** — khung năng lực + đội ngũ kế cận. Đây là dự án hiếm hoi triển khai module tài sản đầy đủ.

## Key Takeaways — Quản lý Tài sản (FAC)

**6 quy trình chính**:
1. **Phiếu nhập** — đưa tài sản mới vào hệ thống (nhà cung cấp, số lượng, giá)
2. **Phiếu xuất** — cấp phát tài sản cho bộ phận/người dùng
3. **Phiếu thu hồi** — thu hồi từ người dùng/phòng ban
4. **Phiếu điều chuyển** — chuyển tài sản giữa phòng ban
5. **Phiếu bảo trì sửa chữa** — quản lý bảo dưỡng định kỳ
6. **Kiểm kê tài sản** — kế hoạch kiểm kê, thực hiện, xử lý thất lạc
7. **Thanh lý tài sản** — xử lý phế thải/đấu giá/tặng

**Tính năng đặc thù**: Quản lý QRCode và BarCode cho từng tài sản

**Phân biệt Tài sản vs Thiết bị**:
- Tài sản: bao gồm tất cả (vật chất + phi vật chất), tối ưu hóa và bảo vệ
- Thiết bị: tập con, chỉ thiết bị vật lý, quản lý vòng đời

## Key Takeaways — Nhân Tài (TAL)

- **Khung năng lực**: Thêm field "khía cạnh" vào danh mục năng lực; cho phép chọn người khảo sát khi gửi mail
- **Ma trận mức và hành vi**: Giá trị cốt lõi + hành vi mong đợi
- **Đội ngũ kế cận**: Chưa được đề cập chi tiết trong biên bản

## Bài học

- FAC là module ngoài domain HRM — cần đánh giá kỹ nguồn lực riêng; không dùng SE/BA HRM thông thường
- VCBs là case hiếm: kết hợp cả FAC + TAL — hai module phức tạp song song

## Liên kết

- [[wiki/entities/VCBs]]
- [[wiki/concepts/HRM-Modules]]
- [[wiki/sources/LTG-TAL-Meetings-2024]] — TAL reference
