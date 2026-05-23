---
description: "Timeline đầy đủ triển khai HRM VnPay 11 tháng (10/2024–09/2025): khởi động, migration .NET 8, UAT, golive — không chỉ là upgrade kỹ thuật."
type: source
tags:
  - vnpay
  - phases
  - timeline
  - golive
  - uat
  - "2025"
date-updated: 2026-04-25
date-ingested: 2026-04-25
category: architecture
project: vnpay
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/concepts/Project-Phases]]"
---

# VnPay — Các Giai Đoạn Triển Khai (Full Timeline)

**Nguồn gốc**: `Phases/Các giai đoạn.md`  
**Ngày cập nhật**: 15/04/2025

---

## Timeline đầy đủ

| Giai đoạn | Thời gian | Ghi chú |
|-----------|-----------|---------|
| Khởi động | 22/10/2024 – 22/11/2024 | |
| Khảo sát yêu cầu & lập giải pháp | 28/10/2024 – 28/02/2025 | GAP analysis, solution design |
| Chuyển đổi .NET 8 | 01/02/2025 – 17/02/2025 | Migration + tool chuyển đổi |
| Kiểm thử | 17/02/2025 – 28/02/2025 | Regression testing |
| Thiết lập phần mềm (cài đặt) | 28/03/2025 – 30/05/2025 | Cấu hình môi trường prod |
| Đào tạo & chuẩn bị UAT | 02/06/2025 – 06/06/2025 | Training key user |
| UAT1 | 09/06/2025 – 04/07/2025 | Nhân sự, Chấm công → Tuyển dụng, Định biên |
| UAT2 | 09/06/2025 – 04/07/2025 | Toàn hệ thống vòng 2 |
| Go-live | 07/07/2025 – 10/09/2025 | Hypercare |

**Tổng thời gian**: ~11 tháng (10/2024 – 09/2025)

## Key Insight

Đây **không phải chỉ là upgrade .NET 8** — đây là **triển khai HRM mới hoàn toàn** cho VnPay, bao gồm toàn bộ các phân hệ (Nhân sự, Chấm công, Tuyển dụng, Định biên, Đào tạo, Bảo hiểm, Tin tức…).

Migration .NET 8 là **giai đoạn kỹ thuật** trong tổng thể một dự án greenfield/upgrade lớn.
