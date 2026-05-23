---
type: source
domain: ins
tags:
  - bao-hiem
  - kaizen
  - performance
  - canh-bao
created: 2017-04-10
updated: 2026-04-27
khach-hang:
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
---

# Ins0006 — Cảnh báo & hiển thị bộ nhớ khi phân tích BH

up:: [[index]]
tags: kaizen, INS, bao-hiem, memory, canh-bao
date: 10/04/2017
prev:: [[Ins0005-validate-truc-trac-bh]]
next:: [[Sys0007-button-dau-trang]]

---

| Trường | Nội dung | | |
|--------|----------|-|-|
| **Tiêu đề** | Cảnh báo và hiển thị thông tin bộ nhớ khi phân tích BH | | |
| **Page** | `Hrm_Main_Web/Ins_AnalyzeInsurance/Index` | | |
| **Trước kaizen** | Khi phân tích bảo hiểm trong trường hợp bộ nhớ đã full, dẫn đến khi phân tích sẽ treo server. Full bộ nhớ dẫn đến cả hệ thống sụp đổ (là điều không thể chấp nhận được). Khách hàng là người điều khiển máy, cần biết năng suất máy đáp ứng cho xử lý hiện tại không (hiện tượng full RAM đều do chưa trực quan hoá cho người dùng biết). | | |
| **Sau kaizen** | ![](../../../../../src/Ins_Kaizen_08_image10.png) Khi chọn nút phân tích sẽ hiển thị cảnh báo bộ nhớ đầy (nếu bộ nhớ RAM vượt quá 80%), người dùng có thể tùy chọn tiếp tục phân tích hay dừng lại để đảm bảo an toàn không bị treo server. Trong khi phân tích sẽ hiển thị thông tin phần trăm của server. | | |
| **Kết quả** | Người dùng có thể nắm rõ năng suất bộ nhớ, xem xét có thể tiếp tục xử lý hay dừng lại. Giúp phát hiện vấn đề trực quan hơn. | | |
| **Tên** | **ID** | **Phòng Ban** | **Ngày** |
| Tung.Ly | Ins0006 | SE | 10/04/2017 |
