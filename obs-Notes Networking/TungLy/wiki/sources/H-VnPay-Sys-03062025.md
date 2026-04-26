---
type: source
tags:
  - vnpay
  - meeting
  - uat
  - training
  - phase4
  - "2025"
date-updated: 2026-04-25
date-ingested: 2026-04-25
category: meeting
project: vnpay
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/concepts/Project-Phases]]"
---

# H-VnPay-Sys-03062025 — Biên bản họp UAT Phase 4

**Ngày họp**: 03/06/2025  
**Người tham dự**: VnPay (ANTT, HTM, HT, PTNV, PNS, NS, TK), VnResource (VnR)  
**Chủ đề**: Thống nhất kế hoạch **Giai đoạn 4 — Đào tạo và UAT**

---

## Kế hoạch chi tiết (10/06 – 18/07/2025)

| # | Việc | Thời gian | Trách nhiệm |
|---|------|-----------|-------------|
| 4.1 | Chuẩn bị hạ tầng, tích hợp domain & SSO | 15/05–06/06 | HTM, HT, ANTT |
| 4.2 | Đào tạo key user — Nhân sự & Chấm công | 10/06 | PTNV, NS, TK |
| 4.3 | UAT Nhân sự & Chấm công + fix & re-test | 10/06–13/06 | Team dự án |
| 4.4 | Đào tạo key user — Định biên, Tuyển dụng, Đào tạo, Tin tức, Bảo hiểm | 23/06 | PTNV, NS, TK |
| 4.5 | UAT các phân hệ trên + fix & re-test | 24/06–27/06 | Team dự án |
| 4.6 | UAT vòng 2 toàn hệ thống + fix & re-test | 07/07–11/07 | Team dự án |
| 4.7 | Hoàn tất UAT, ký nghiệm thu | 14/07–18/07 | PNS, PTNV |

## Cam kết đã thống nhất

- **VnResource**: re-test tất cả lỗi đã sửa trước khi gửi bản fix
- **ANTT**: trình BLĐ xin ý kiến về SSO trước khi triển khai
- Mọi lỗi UAT phải ghi vào **Issue Log** và theo dõi đến hết

## Key Insights

- UAT VnPay chia theo phân hệ: Nhân sự + Chấm công trước (10/06), các phân hệ còn lại sau (23/06), toàn hệ vòng 2 (07/07)
- **SSO tích hợp domain** cần approval BLĐ — là dependency quan trọng, có thể gây chậm trễ
- Pattern: đào tạo key user trước UAT (không UAT song song với đào tạo)
- Cam kết **re-test trước khi bàn giao** là tiêu chuẩn chất lượng VnR
