---
type: concept
tags:
  - project-management
  - phases
  - trien-khai
  - methodology
date-updated: 2026-04-25
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/projects/TrungDong-Project]]"
- "[[wiki/concepts/HRM-Modules]]"
---

# Project Phases — Giai Đoạn Triển Khai

## Mô hình chuẩn triển khai FIT-HRM

### Phase 1: Phân tích & Thiết kế (Analysis & Design)
- GAP analysis: so sánh yêu cầu khách hàng với tính năng phần mềm
- Lập danh sách customization cần thiết
- Xác nhận phạm vi, sign-off với khách hàng
- Output: GAP document, solution design

### Phase 2: Cài đặt & Cấu hình (Setup & Configuration)
- Cài đặt môi trường (dev, UAT, production)
- Cấu hình phân hệ theo yêu cầu đã sign-off
- Migration dữ liệu (nếu có)
- Coding customization

### Phase 3: Training (Đào tạo)
- Đào tạo admin hệ thống
- Đào tạo user cuối
- Tài liệu hướng dẫn sử dụng
- **Đang ở phase này**: [[wiki/projects/TrungDong-Project]]

### Phase 4: UAT (User Acceptance Testing)
- Khách hàng tự kiểm thử theo test cases
- Fix bugs phát sinh
- Sign-off UAT

### Phase 5: Go-Live
- Chuyển sang môi trường production
- Parallel run (chạy song song hệ thống cũ nếu có)
- Hypercare support (1–3 tháng sau go-live)

## Biến thể: Upgrade Project (VnPay)

Với dự án **nâng cấp** (không phải triển khai mới), phases rút gọn:
1. Chuyển đổi kỹ thuật (migration to new framework)
2. Kiểm thử hồi quy (regression testing)
3. Triển khai lên production

→ Xem chi tiết: [[wiki/projects/VnPay-Project]], [[wiki/concepts/Net8-Migration]]

## Thời gian điển hình

| Phase | Thời gian điển hình |
|-------|-------------------|
| Phân tích | 2–4 tuần |
| Cài đặt & Cấu hình | 4–8 tuần |
| Training | 2–4 tuần |
| UAT | 2–3 tuần |
| Go-Live + Hypercare | 1–3 tháng |
