---
type: source
code: h5rj
tags:
  - bao-hiem
  - nghi-viec
  - 2-dong
  - config
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-FAQ-NghiViecNgoaiChuKy]]"
  - "[[wiki/sources/INS-FAQ-QuyTrinh5Buoc]]"
  - "[[wiki/sources/INS-Nghiep-Vu]]"
description: "Logic 2 dòng đóng bảo hiểm khi nhân viên nghỉ việc trong kỳ với config isCheck14dayProfileQuitNextMonth, hotfix TVC."
---

# INS FAQ — Nghỉ Việc Trong Kỳ Hệ Thống Báo Đóng BH

## Tóm tắt

Tài liệu giải thích logic 2 dòng khi NV nghỉ việc trong kỳ với config `isCheck14dayProfileQuitNextMonth = ON`. Đây là tính năng hotfix TVC (task 0117303/0114722), không phải bug. PE hay thắc mắc vì thấy NV nghỉ việc tháng này nhưng vẫn có dòng đóng BH.

## Key Takeaways

- **Config OFF** (mặc định): nghỉ việc trong kỳ → báo giảm tháng N luôn
- **Config ON**: tùy số ngày nghỉ
  - ≥14 ngày → báo giảm hẳn tháng N (`IsQuit=true`)
  - <14 ngày → **2 dòng**: dòng 1 tháng N đóng BH bình thường + dòng 2 tháng N+1 báo nghỉ việc (`IsQuit=true`, `Status=E_CONFIRMED`)
- Checklist: (1) kiểm tra config; (2) tổng ngày nghỉ trong tháng

## Trích dẫn quan trọng

> NV nghỉ <14 ngày trong tháng N → dòng 1: tháng N đóng BH bình thường. Dòng 2: tháng N+1 IsQuit=true, Status=E_CONFIRMED — không phải bug, đây là logic hotfix TVC.

## Liên kết

- [[wiki/sources/INS-FAQ-NghiViecNgoaiChuKy]] — nghỉ việc ngoài chu kỳ báo giảm LĐ
- [[wiki/sources/INS-Nghiep-Vu]] — nghiệp vụ tăng/giảm/điều chỉnh BH
