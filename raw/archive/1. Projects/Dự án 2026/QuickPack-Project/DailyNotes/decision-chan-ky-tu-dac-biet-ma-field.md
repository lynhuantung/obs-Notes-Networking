---
type: technical-decision
tags: [technical, decision, validation, UI]
date-updated: 2026-04-27
Project: "[[Dự án QuickPack]]"
related:
  - "[[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-chi-huy-thi-cong-quickpack]]"
  - "[[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/Phases/Phase-cài đặt]]"
---

# Quyết định kỹ thuật: Chặn ký tự đặc biệt trường "MÃ"

> Backlink: [[raw/archive/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-chi-huy-thi-cong-quickpack|Chat chỉ huy thi công]]

**Ngày thảo luận:** 21-26/08/2025  
**Người đề xuất:** Lý Nhuận Tùng  
**Người xem xét:** Trần Phước Hạc, Trịnh Trần Thế Thông  
**Quyết định cuối:** ✅ **Giải pháp 1**

---

## Bối cảnh

Dự án QPVN yêu cầu các trường **"MÃ"** không được nhập ký tự đặc biệt để tránh lỗi hệ thống.

---

## Hai giải pháp được đề xuất

### 📝 Giải pháp 1: Chặn ngay khi nhập (✅ CHỌN)

- **Cách làm:** Sửa control textbox — nếu nhập ký tự đặc biệt thì tự động xoá
- **Cơ sở:** Kế thừa hàm chung đã có sẵn (của anh Sáng trước đây), chỉ bật thêm 1 tùy chọn `bool`
- **Thời gian:** ~5 phút/control
- **Ưu điểm:** Trải nghiệm tốt, người dùng thấy ngay lập tức
- **Nhược điểm:** Cần khai báo tại từng control "MÃ"

### 📝 Giải pháp 2: Validate khi bấm Lưu (❌ Không chọn)

- **Cách làm:** Khi lưu, kiểm tra các field chứa chữ "code" → báo lỗi nếu có ký tự đặc biệt
- **Thời gian:** Rất nhanh, viết 1 lần
- **Ưu điểm:** Triển khai nhanh, không cần chỉnh từng control
- **Nhược điểm:** Rủi ro match nhầm field, người dùng chỉ biết lỗi khi bấm Lưu

---

## Hướng triển khai (Giải pháp 1)

```
Sửa trong field_info.xml + nhập pattern validate custom
→ Hiển thị message custom
→ PE cũng có thể cấu hình trong field_info.xml
→ Nếu không được, nhờ SE hỗ trợ 1 màn hình mẫu để PE tự cấu hình
```

**Note:** Các màn hình có trường "MÃ" đều phải áp dụng — danh sách do Hạc liệt kê, Thông nắm hướng raise task.

---

## Trạng thái

- [x] Thảo luận và chốt giải pháp (26/08/2025)
- [ ] Liệt kê đầy đủ các màn hình có trường MÃ
- [ ] Raise task và assign SE thực hiện

