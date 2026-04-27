---
type: note
tags:
  - bitex
  - bug
  - technical
  - UAT
date-updated: 2025-12-06
Project: "[[Dự án Bitex]]"
related:
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]]"
  - "[[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-TaskPriority-AKW31-32-90]]"
---

# Note: Các Lỗi Kỹ Thuật — Tháng 11-12/2025

> Nguồn: [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]]  
> Giai đoạn: Training → UAT

---

## Bug 1: Các trường Ẩn/Hiện bị reset

**Ngày phát hiện:** 27/11/2025  
**Người báo:** Lại Huy Hà (SE)  
**Mô tả:** Các trường ẩn/hiện, bắt buộc bị **trả về nguyên trạng ban đầu** sau khi cấu hình  

**Phản hồi SE thi công:** "Không fix gì ảnh hưởng tới"  
**Hành động:** Escalate lên Lý Nhuận Tùng + Trần Duy Tùng để điều tra

**Ghi chú bổ sung (Hoàng Thanh Tùng - 27/11):**
> Chỗ "Chỉ tiêu": có logic set chỉ tiêu về = 0 nếu dùng chung với "Hạn chót"  
> → Khi ấn xem chi tiết sẽ hiển thị là 0

---

## Bug 2: Lỗi file FIELD_INFO_SPEC.XML — Trùng Key

**Ngày phát hiện:** 28/11/2025  
**Người báo:** Lại Huy Hà (SE)  
**Mô tả:** File `FIELD_INFO_SPEC.XML` gây lỗi khi đọc do **trùng key**  

**Xử lý tạm thời:**
- Bỏ file ra ngoài (chưa xóa) để ứng dụng chạy trơn tru
- Phạm Văn Hiển: có công cụ check key trùng → Lý Nhuận Tùng hỗ trợ Lại Huy Hà

**Xử lý dứt điểm:**
- Lại Huy Hà sẽ quay lại tìm key trùng và sửa

---

## Bug 3: AKW164 bị lỗi lại sau khi fix

**Ngày phát hiện:** 06/12/2025  
**Người báo:** Phan Thị Ngọc Tuyền (PE)  
**Task:** Bitex-AKW164  
**Mô tả:** Task đã fix, test pass → **sau đó bị lỗi lại**  

**Nguyên nhân nghi ngờ:** Build/deploy đè lên fix cũ  
**Hành động:** Thức nhờ Lý Nhuận Tùng check

---

## Bug 4: Lỗi file lang khi upbuild

**Ngày phát hiện:** 05/12/2025  
**Người báo:** Lý Nhuận Tùng  
**Mô tả:** Code để "lỡ cỡ" — file lang lỗi sau khi upbuild  
**Gốc rễ:** SE code chưa hoàn chỉnh file trước khi commit  
**Bài học:** Ae lưu ý chỉnh cho xong file, **đừng để lỡ cỡ**

---

## Tổng kết pattern lỗi

| Pattern | Bug liên quan | Biện pháp |
|---------|--------------|----------|
| Config bị reset sau deploy | Bug 1 | Kiểm tra logic set default trong code |
| Trùng key trong XML config | Bug 2 | Dùng tool check key trùng trước khi deploy |
| Build đè lên fix cũ | Bug 3 | Quản lý version build chặt chẽ hơn |
| Code chưa hoàn chỉnh trước commit | Bug 4 | Code review + PR checklist |

---

## Liên kết

- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/chat-Amis-Thi-Cong]] ← Nguồn chat
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Issue-TaskPriority-AKW31-32-90]] — AKW32 phức tạp
- [[TungLy/1. Projects/Dự án 2026/Bitex-Project/DailyNotes/Note-BuildLog-Convention]] — Quy trình build
