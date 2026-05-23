---
type: source
tags:
  - ltg
  - tal
  - ke-thua
  - phan-quyen-tu-dong
  - meeting
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 1.Projects/LTG/H-LTG-TAL-090724.md, 1.Projects/LTG/H-LTG-TAL-200724.md
related:
  - "[[wiki/entities/LTG]]"
  - "[[wiki/sources/LTG-TAL-Meetings-2024]]"
  - "[[wiki/projects/LTG-Project]]"
description: "Biên bản họp bổ sung TAL LTG 09-20/07/2024: quy trình bình luận kế thừa, tự động mục tiêu GAP, phân quyền và cảnh báo kỷ luật."
---

# Source: LTG TAL — Họp Bổ Sung 09/07 & 20/07/2024

## Tóm tắt

2 biên bản họp TAL LTG bổ sung (09/07 và 20/07/2024) — nội dung chi tiết hơn so với phiên tổng hợp đã ingest. Tập trung vào: (1) quy trình bình luận bắt buộc trước duyệt kế thừa; (2) tự động tạo mục tiêu năng lực theo GAP; (3) phân quyền tự động thêm điều kiện Nhóm nhân viên; (4) scheduler task cập nhật tình trạng; (5) cảnh báo L&D khi NV kế thừa bị kỷ luật.

## Key Takeaways

### Bình luận kế thừa BẮT BUỘC trước duyệt (09/07)
- **Vấn đề**: Hiện tại B4 (Duyệt) có thể thực hiện dù chưa làm B3 (Bình luận) → sai quy trình.
- **Quy trình 4 bước chuẩn đội ngũ kế cận**:
  - B1: Phân tích đội ngũ kế cận
  - B2: Tạo đề xuất → output: 1 dòng trạng thái "Yêu cầu"
  - B3: **Bình luận đề xuất** (bắt buộc, 1 người bình luận)
  - B4: Duyệt đề xuất (chỉ được duyệt SAU KHI có bình luận)
- **Fix**: Sau khi bình luận xong → đóng popup → chỉ khi có bình luận mới unlock nút Duyệt.

### Tự động tạo mục tiêu năng lực theo GAP (09/07)
- **Vấn đề**: Tab "Mục tiêu" trong Kế thừa V2 có danh sách khóa học GAP nhưng không ràng buộc tự tạo.
- **Giải pháp**: Sau khi duyệt → **hệ thống tự tạo mục tiêu năng lực hướng tới + mục tiêu đào tạo** theo GAP của NV so với vị trí chủ chốt.
- **Phân tích đào tạo**: Thêm logic phân tích cả những **năng lực NV chưa có** (không chỉ năng lực GAP đang tồn tại). Thêm cột: vị trí chủ chốt, mã chức vụ, mã lộ trình nghề nghiệp.

### Phân quyền tự động — thêm điều kiện Nhóm NV (09/07)
- **Yêu cầu**: NV mới vào → tự động tạo user portal + phân quyền theo nhóm:
  - Nhóm "Nhân viên", "Lao động giản đơn", "Công nhân" → phân nhóm quyền **"Nhân viên LTG"**
  - Các đối tượng còn lại → phân nhóm quyền **"Nhân viên LTG" + "Quản lý"**
- **Gap hiện tại**: Màn hình cấu hình phân quyền tự động chưa có loại điều kiện **Nhóm nhân viên**.
- **Fix**: Thêm điều kiện "Nhóm nhân viên" vào màn hình cấu hình phân quyền tự động.

### Scheduler task cập nhật tình trạng NV (20/07)
- **Yêu cầu**: Tạo **scheduler task** chạy định kỳ để cập nhật tình trạng nhân viên (active/inactive/nghỉ việc).
- **Estimate**: 6 points (SE).
- **Highlight NV nghỉ việc**: Thêm cột ngày nghỉ việc → highlight dòng trên main và portal → 4 points.

### Cảnh báo L&D khi NV kế thừa bị kỷ luật (20/07)
- **Yêu cầu**: Khi NV thuộc đội ngũ kế thừa bị kỷ luật → gửi cảnh báo đến NV phụ trách L&D.
- **Trạng thái**: Chưa có giải pháp — cần chốt với Bao.Tran và Hoàng.Huynh.

## Trích dẫn quan trọng

> **Quy trình kế thừa chuẩn**: "Phải bình luận trước rồi người duyệt mới duyệt được dữ liệu nếu có setup người bình luận."

> **Tự động tạo mục tiêu**: "Sau khi duyệt, hệ thống tự tạo mục tiêu năng lực hướng tới và mục tiêu đào tạo hướng tới theo GAP của nhân viên."

> **Phân quyền tự động**: "Nếu nhân viên thuộc nhóm 'Nhân viên', 'Lao động giản đơn', 'Công nhân' → Phân nhóm quyền 'Nhân viên LTG'. Nếu nhân viên thuộc các đối tượng còn lại → Phân nhóm quyền 'Nhân viên LTG' và 'Quản lý'."

## Liên kết

- [[wiki/entities/LTG]] — LTG Group entity profile
- [[wiki/sources/LTG-TAL-Meetings-2024]] — Phiên tổng hợp TAL LTG (kế thừa 4 bước, GAP đào tạo)
- [[wiki/projects/LTG-Project]] — Phase 3 LTG tổng quan
