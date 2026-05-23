---
type: source
description: "FAQ bảo hiểm C70/C70A: các câu hỏi thường gặp, 5-Why phân tích conflict logic BHXH trong HRM."
domain: ins
tags: [bao-hiem, C70, C70A, FAQ, 5-why, BHXH, bug, conflict-logic]
source-file: raw/Nghiệp vụ HRM/INS/INS-C70-FAQ.md
created: 2026-04-29
updated: 2026-04-29
related:
  - "[[wiki/sources/INS-C70-TinhLuong]]"
  - "[[wiki/sources/INS-TruyNguyenNhan]]"
  - "[[wiki/sources/INS-FishBone-Analysis]]"
  - "[[wiki/architecture/INS-Architecture]]"
  - "[[wiki/architecture/INS-Database-Schema]]"
---

# INS — FAQ Báo Cáo C70 / C70A

## Tóm tắt

Tài liệu giải đáp 2 FAQ thường gặp trên báo cáo C70/C70A. FAQ1: tìm kiếm C70 tháng N ra lương BHXH = 0 và tháng tham gia = 01/01/0001 (do chưa phân tích BH tháng N-1). FAQ2: C70A hiển thị lương BHXH = 0 và số tiền không chính xác — phân tích 5-Why đầy đủ phát hiện conflict giữa logic cũ (ngày 15 làm pivot) và logic mới (lấy tháng trước ngày bắt đầu chứng từ), cộng với vấn đề dữ liệu dư thừa trong lương BHXH.

## Key Takeaways

- **C70** tổng hợp từ 3 nguồn: Chứng từ BH + Lịch sử BH + Lương BHXH
- **FAQ1 root cause**: chưa phân tích BH tháng N-1 → tháng tham gia = 01/01/0001
- **FAQ2 root cause 1**: quá nhiều dữ liệu lương BHXH cho 1 NV → lấy sai số tiền
- **FAQ2 root cause 2**: conflict logic cũ (pivot ngày 15) vs logic mới (lấy tháng trước ngày bắt đầu chứng từ)
- **Fix**: áp dụng logic mới, nhưng cần kiểm tra kỹ vì có thể làm sai dữ liệu khách hàng cũ
- Đây là ví dụ điển hình của **technical debt** trong codebase INS khi thay đổi logic không backward-compatible

## Trích dẫn quan trọng

> Conflict lập trình giữa logic cũ và logic mới: Logic mới lấy dữ liệu tháng trước của ngày bắt đầu chứng từ. Logic cũ: nếu ngày bắt đầu sau ngày 15 tháng N → lấy lương tháng N; nếu ngày bắt đầu trước ngày 15 → lấy lương tháng trước.

> Xử lý theo **logic mới**. ⚠️ **Lưu ý:** Việc này có thể làm sai dữ liệu của một số khách hàng cũ → cần kiểm tra kỹ.

## Liên kết

- [[wiki/sources/INS-C70-TinhLuong]] — Bảng tổng hợp lương C70: cột BH NLĐ + NSDLĐ
- [[wiki/sources/INS-TruyNguyenNhan]] — Phương pháp 4M RCA Kaizen
- [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M + 5 Whys
- [[wiki/architecture/INS-Database-Schema]] — Schema bảng Ins_ProfileInsuranceMonthly
