---
Mã: note-validate-ma
aliases:
date: 2025-08-21
tags:
  - technical
  - requirement
Project: "[[Dự án QuickPack]]"
Liên kết:
  - "[[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-thi-cong-quickpack|← Index Chat Thi Công]]"
---

# Yêu cầu Validate Ký Tự Đặc Biệt trong Trường MÃ

> Nguồn: Chat thi công 21/08 - 22/08/2025
> Người raise: Trần Phước Hạc → Lý Nhuận Tùng

---

## Yêu cầu

Dự án QPVN yêu cầu các trường **"MÃ"** không được nhập các ký tự đặc biệt để tránh lỗi hệ thống.

---

## Phân tích giải pháp

### Giải pháp 1: Validate tức thời trên từng control

| | Chi tiết |
|--|---------|
| **Cách làm** | Khi nhập ký tự đặc biệt vào field MÃ → báo lỗi ngay lập tức |
| **Ưu điểm** | Trải nghiệm tốt, người dùng thấy rõ ràng ngay |
| **Nhược điểm** | Cần khai báo tại **từng control** có chữ "MÃ" |
| **Chi phí** | Cao hơn — phải làm nhiều màn hình |

### Giải pháp 2: Kiểm tra khi bấm Lưu ✅ (đề xuất)

| | Chi tiết |
|--|---------|
| **Cách làm** | Khi lưu dữ liệu, hệ thống kiểm tra field nào chứa chữ "code" → nếu có ký tự đặc biệt → báo lỗi |
| **Ưu điểm** | Triển khai nhanh, chỉ viết **1 lần** |
| **Nhược điểm** | Rủi ro kiểm nhầm field có chữ "code" nhưng không phải trường MÃ; người dùng chỉ biết lỗi khi bấm Lưu |
| **Chi phí** | Thấp — ước tính rất nhanh |

---

## Quyết định

> ⏳ Chưa chốt giải pháp tính đến 22/08/2025 — anh Tùng hỏi rõ phạm vi màn hình

**Câu hỏi chốt:**
- Tất cả màn hình có trường MÃ hay chỉ một số màn hình cụ thể?
- Hạc liệt kê danh sách màn hình để Thông nắm và biết hướng raise task

---

## Danh sách màn hình cần áp dụng

> ⬜ Chưa liệt kê đầy đủ — cần Trần Phước Hạc bổ sung

---

*← [[TungLy/1. Projects/Dự án 2026/QuickPack-Project/DailyNotes/chat-thi-cong-quickpack|Quay lại Index Chat Thi Công]]*
