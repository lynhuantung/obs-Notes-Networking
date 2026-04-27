---
type: source
tags:
  - nhantai
  - ltg
  - meeting
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "1. Projects/LTG/H-LTG-TAL-020724.md + H-LTG-TAL-090724.md + H-LTG-TAL-200724.md + H-LTG-TAL-250724.md"
related:
  - "[[wiki/entities/LTG]]"
  - "[[wiki/projects/LTG-Project]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# LTG — Họp Nhân Tài (07/2024)

## Tóm tắt

4 biên bản họp về phân hệ Nhân Tài (TAL) trong dự án LTG Phase 3, tháng 07/2024. Chuỗi họp từ 02/07 đến 25/07. Thành viên cố định: TungLy, TienDang, MinhNguyendat.

## Key Takeaways

### Thiết lập vị trí chủ chốt & khung năng lực
- Placeholder min/max trên màn hình thiết lập vị trí chủ chốt
- Ẩn cột trọng số trong lưới khung năng lực
- Cột cấp độ thay textbox → dropdown

### Đội ngũ kế thừa (Succession)
- Popup so sánh: phần trăm round 2 chữ số, hiển thị chuỗi phòng ban, thêm cột nhóm năng lực
- **Quy trình duyệt 4 bước**: Phân tích → Tạo đề xuất → Bình luận → Duyệt (phải bình luận trước, mới được duyệt)
- **Tự động tạo mục tiêu**: Sau khi duyệt kế thừa → hệ thống tự tạo mục tiêu năng lực hướng tới + mục tiêu đào tạo theo GAP

### Phân tích đào tạo
- Phân tích được cả năng lực nhân viên **đang không có** (gap) so với vị trí chủ chốt
- Thêm cột: vị trí chủ chốt, mã chức vụ, mã lộ trình nghề nghiệp

### Phân quyền tự động
- Khi tạo NV mới: tự động tạo user + phân quyền portal
- Điều kiện theo **Nhóm nhân viên**:
  - "Nhân viên", "Lao động giản đơn", "Công nhân" → nhóm quyền "Nhân viên LTG"
  - Còn lại → "Nhân viên LTG" + "Quản lý"
- Giải pháp: thêm điều kiện Nhóm nhân viên vào màn hình cấu hình phân quyền tự động

### Scheduler Task
- Tạo scheduler task cập nhật tình trạng nhân viên định kỳ
- Thêm cột ngày nghỉ việc → highlight trên main + portal

### Pending chưa giải quyết
- Khi NV kế thừa bị kỷ luật → cảnh báo nhân viên tại L&D: **chưa có giải pháp**, cần chốt với Bao.Tran và Hoàng.Huynh

## Trích dẫn quan trọng

> "Hệ thống có danh sách khóa học cần đào tạo theo năng lực, có những năng lực nào của NV đang GAP nhưng lại không có cơ chế ràng buộc hoặc tự tạo. Giải pháp: sau khi duyệt, hệ thống tự tạo mục tiêu năng lực hướng tới và mục tiêu đào tạo hướng tới theo GAP của nhân viên"

> "Quy trình duyệt: B1 Phân tích → B2 Tạo đề xuất → B3 Bình luận → B4 Duyệt. Phải bình luận xong mới được duyệt"

## Bài học

- Phân hệ TAL LTG là một trong những triển khai **đầy đủ nhất** — có thể dùng làm tham chiếu cho dự án khác triển khai TAL
- Phân quyền tự động theo nhóm nhân viên là pattern tái sử dụng được cho nhiều khách hàng có nhiều cấp nhân viên

## Liên kết

- [[wiki/entities/LTG]]
- [[wiki/concepts/HRM-Modules]]
