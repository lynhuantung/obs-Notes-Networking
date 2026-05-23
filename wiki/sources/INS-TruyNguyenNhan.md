---
type: source
tags:
  - INS
  - root-cause-analysis
  - 4M
  - fishbone
  - kaizen
  - 5-whys
  - quality-management
  - hrm
date-ingested: 2026-04-26
date-updated: 2026-04-26
source-file: 1. Projects/Nghiệp vụ HRM/INS/TruyNguyenNhan.md
related:
  - "[[wiki/sources/INS-FishBone-Analysis]]"
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/sources/INS-InsuranceMonthJoin]]"
  - "[[wiki/sources/INS-InsurancePayback]]"
description: "Phương pháp truy nguyên nhân 4M (Man/Machine/Material/Method) áp dụng cho phân hệ INS, kèm sơ đồ xương cá và checklist CAPA."
---

# INS — Phương Pháp Truy Nguyên Nhân (4M Analysis)

## Tóm tắt

Tài liệu hệ thống hóa phương pháp **4M Root Cause Analysis** theo phong cách Nhật Bản (Toyota Production System / Kaizen) áp dụng riêng cho module **Bảo Hiểm (INS)** trong hệ thống HRM. Bao gồm: khung lý thuyết 4M, biểu đồ xương cá, quy trình 5 Whys, ma trận CAPA, và checklist định vị lỗi nhanh. Được tạo ngày 2026-04-26 dựa trên hình ảnh phân tích gốc từ nhóm INS.

## Key Takeaways

- **Khung 4M áp dụng cho INS**: Man (nhập liệu sai, thiếu kỹ năng), Machine (bug code, timeout, conflict module), Material (dữ liệu master sai, tỷ lệ BH chưa cập nhật), Method (sai thứ tự thực hiện, SOP lỗi thời)
- **Quy trình 7 bước**: Mô tả lỗi → Xác định bộ phận → Vẽ Fishbone → 5 Whys → Xác nhận root cause → CAPA → Xác minh & Chuẩn hóa
- **5 Whys thực chiến**: Ví dụ số BHXH sai → mức lương tính thiếu → phụ cấp không vào căn cứ → cấu hình mapping chưa thiết lập → không có checklist nghiệm thu INS → **Root Cause: thiếu checklist nghiệm thu module INS**
- **Ma trận CAPA**: Mỗi nguyên nhân gốc rễ cần cả Corrective Action (khắc phục ngay) + Preventive Action (ngăn tái phát)
- **5 sai lầm thường gặp**: Dừng lại quá sớm, blame game, không reproduce, không document, không phòng ngừa
- **4 nguyên tắc Nhật Bản**: Genchi Genbutsu (đến tận nơi), 5 Whys (5 lần tại sao), Kaizen (mỗi fix là cơ hội cải tiến), Poka-Yoke (thiết kế để không tái lỗi)
- **Ma trận ưu tiên**: Lỗi số BHXH sai + lỗi mapping phụ cấp → **ưu tiên cao nhất** (tần suất cao + ảnh hưởng lớn)

## Trích dẫn quan trọng

> **Nguyên tắc vàng**: Đừng xử lý triệu chứng — hãy tìm **nguyên nhân gốc rễ**. Một lỗi được fix đúng cách không bao giờ tái phát.

> **Root Cause thực tế**: "Vì khi triển khai ban đầu, nghiệp vụ BHXH chưa được confirm rõ → Vì không có checklist nghiệm thu riêng cho module INS."
> → **Hành động khắc phục**: Tạo checklist nghiệm thu chi tiết, bao gồm kiểm tra mapping từng loại phụ cấp vào căn cứ đóng BHXH.

> **Poka-Yoke**: Thiết kế để không thể mắc lỗi đó lần nữa — sau mỗi incident INS, cần review checklist và thêm guard điều kiện vào quy trình.

> **Về blame game**: Đổ lỗi cho con người thay vì tìm lỗi hệ thống/quy trình là sai lầm phổ biến nhất — lỗi hầu hết xuất phát từ Method hoặc Material, không phải Man.

## Liên kết

- **Source gốc liên quan**: [[wiki/sources/INS-FishBone-Analysis]] — FishBone 4M + 5 Whys tổng quan (đã ingest trước)
- **Áp dụng cho phân hệ**: [[wiki/concepts/HRM-Modules]] — Bảo Hiểm
- **Lỗi thực tế cần truy nguyên nhân**: [[wiki/sources/INS-InsurancePayback]], [[wiki/sources/INS-InsuranceMonthJoin]]
- **Checklist deploy liên quan**: [[wiki/concepts/HRM-Deploy-Checklist]]
- **Log lỗi kỹ thuật**: [[wiki/sources/SysLog-HeThong-Chi-Tiet]], [[wiki/sources/SysLog-NghiepVu-Chi-Tiet]]
