---
Mã: note-server-setup
aliases:
date: 2025-07-11
tags:
  - technical
  - infrastructure
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-thi-cong-quickpack|← Index Chat Thi Công]]"
  - "[[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/Documents/Hướng dẫn cấu hình hệ thống HRM|Hướng dẫn cấu hình HRM]]"
---

# Server Setup — QuickPack UAT & PRD

> Nguồn: Chat thi công 07 - 11/2025

---

## Cấu hình Server UAT (Hiện trạng)

- **Loại:** Server vật lý
- **Cài đặt:** App + SQL cùng trên 1 server
- **Thời điểm:** Tháng 07/2025

---

## Kế hoạch Server PRD

- Dựng link PRD vào **tuần sau** (tính từ 07/2025)
- **IT QPVN hỏi phương án** để có tốc độ tốt nhất:
  - Đề xuất của IT: Dùng server vật lý hiện tại làm **SQL server**
  - Câu hỏi: Server App nên dựng trên **VM** hay trên **server vật lý đó luôn**?

> Nhờ Trần Duy Tùng + Lý Nhuận Tùng tư vấn

---

## Vấn đề kỹ thuật đã gặp

### IIS Permissions

```
Lỗi: Thiếu quyền IIS_IUSRS trên thư mục
Action: Phân lại full quyền nha Hạc
Fix: Phân quyền thư mục lại → chạy được
```

### Redis Cache

```
Action: Clear cache Redis + Restart pool Portal
Người thực hiện: Trần Phước Hạc
```

### Source Code

- Tách source QPVN từ ITL (11/07/2025)
- Dựng link nội bộ VnR + link test cho KH
- Thủ tục: Email nhờ tách source (không cần làm thủ tục thêm)

---

## Thành viên IT liên quan

| Tên | Vai trò |
|-----|---------|
| Nguyễn Thị Lan Vy | Tạo group, điều phối IT ban đầu |
| Nguyễn Ngọc Hải | Build manager, deploy |

---

*← [[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-thi-cong-quickpack|Quay lại Index Chat Thi Công]]*

