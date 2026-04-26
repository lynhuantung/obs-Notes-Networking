---
type: source
tags:
  - vnpay
  - goals
  - scope
  - resources
  - risks
  - net8
  - "2025"
date-updated: 2026-04-25
date-ingested: 2026-04-25
category: architecture
project: vnpay
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/concepts/Net8-Migration]]"
- "[[wiki/concepts/Nguon-Luc]]"
---

# VnPay — Goals, Scope, Resources, Risks

**Nguồn gốc**: Các file `1. Goals`, `2. Scope`, `5. Resources`, `6. Risks` trong vault VnPay  
**Ngày tạo**: 06/01/2025

---

## Mục tiêu dự án

1. **Chuyển .NET Framework → .NET Core 8** cho toàn bộ hệ thống HRM VnPay
   - Deadline ban đầu: 20/03/2025 (hoàn thành migration + QA)
   - QC và SE fix bugs: đến 19/04/2025
2. **Triển khai cho khách hàng** (go-live): đến tháng 07/2025
3. **Họp GAP** với PE để xác định yêu cầu phát sinh

## Phạm vi

- Nâng cấp net framework → .NET Core 8
- Triển khai cho khách hàng (cài đặt môi trường, go-live)
- **Ràng buộc**: Go-live trước tháng 07/2025

## Nhân sự dự án

| Họ tên | Vai trò |
|--------|---------|
| Nguyễn Huỳnh Huy Hoàng | **Trưởng dự án** |
| Lê Quang Trung | Lập trình viên |
| Trần Duy Bảo | Lập trình viên |
| Nguyễn Đạt Minh | Lập trình viên |
| Lý Nhuận Tùng | Lập trình viên |
| Lê Thiên Bảo | Lập trình viên |
| Cao Hải Quan | Lập trình viên |

**Tổng**: 1 TL + 6 SE

## Rủi ro

| Giai đoạn | Rủi ro | Ứng phó |
|-----------|--------|---------|
| Phase 1 — Chuyển đổi | Lỗi chuyển đổi code | Trao đổi với Hoang.Nguyen |
| Phase 1 — Chuyển đổi | Lỗi portal | — |
| Phase 2 — Kiểm thử | Chưa có môi trường Linux | Nhờ IT dựng môi trường Linux |
