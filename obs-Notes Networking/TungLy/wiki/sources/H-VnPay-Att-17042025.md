---
type: source
tags:
  - vnpay
  - meeting
  - att
  - chấm-công
  - uat
  - "2025"
date-updated: 2026-04-25
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/concepts/HRM-Modules]]"
---

# H-VnPay-Att-17042025 — Biên bản họp Chấm công

**Ngày họp**: 17/04/2025  
**Người tham gia**: TungLy, Do.NguyenVan, Hiep.Tran  
**Phân hệ**: ATT (Chấm công), INS (Bảo hiểm), TRA (Đào tạo)

---

## Các quyết định kỹ thuật — Phân hệ Chấm công

### 1. Nhóm đối tượng chỉ chấm công 1 đầu (chỉ đầu IN)

- Thêm hình thức chấm công riêng cho đối tượng này
- Tính đi trễ bình thường, **không tính thiếu Out**
- Vẫn ghi nhận giờ Out nếu có OT sau ca, không giới hạn

### 2. Quy tắc tính trễ/sớm & tính công

- Dùng cấu hình **giờ muộn sớm chuyên cần** trong chế độ công
- Rà soát lại lấy enum trên bảng công

### 3. Hiển thị nghỉ bù ngày lễ

- Dùng cấu hình **hiển thị dữ liệu công** trong ngày trên bảng công

## Key Insights

- Phân hệ Chấm công VnPay có trường hợp đặc biệt: nhân viên chỉ chấm IN (không chấm OUT) — cần rule riêng
- Enum trên bảng công cần rà soát kỹ trước khi cấu hình quy tắc trễ/sớm
