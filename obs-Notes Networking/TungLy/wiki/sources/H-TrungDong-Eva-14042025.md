---
type: source
tags:
  - trungdong
  - meeting
  - danh-gia
  - kpi
  - "2025"
date-updated: 2026-04-25
date-ingested: 2026-04-25
category: meeting
project: trungdong
related:
- "[[wiki/projects/TrungDong-Project]]"
- "[[wiki/concepts/HRM-Modules]]"
- "[[wiki/entities/Hai.NguyenNgoc]]"
---

# H-TrungDong-Eva-14042025 — Biên bản họp đánh giá

**Nguồn gốc**: `3. ARCHIEVED/Dự án 2025/TrungDong-Project/Meeting_Notes/H-TrungDong-Eva-14042025.md`  
**Ngày họp**: 14/04/2025  
**Người tham gia**: TungLy, TienDang, Phuoc.TranDac, Do.NguyenVan

---

## Tóm tắt

Cuộc họp tập trung vào 2 task kỹ thuật trong phân hệ **Đánh giá** (Phase 2):

### Task TRUNGDONG (P2)90 — Bảng đánh giá tham khảo

| Thay đổi | Chi tiết |
|---------|---------|
| Đổi tên | "Sửa thông tin phòng ban tham khảo" → **"Bảng đánh giá tham khảo"** |
| Bổ sung | Checkbox xác định bảng có phải **đánh giá nhân viên** hay không |
| Logic enum trọng số | Bảng cha: bỏ qua bảng đã vô hiệu hóa |
| Logic enum trọng số | Bảng nhân viên: tìm bảng cha là bảng *không phải nhân viên*, cùng OrgList |

### Task — Tạo mục tiêu nhân viên (KPI)

- **KPI con bắt buộc cùng đơn vị tính với KPI cha**
- **Cảnh báo loại 3** (KPI con vượt KPI cha) bị xác định là **không hợp lý** vì không kiểm soát được các bảng con trước đó
- → Action: Phuoc.Tran xác nhận lại với khách hàng hướng xử lý phù hợp

## Action Items

| Người | Việc |
|-------|------|
| Phuoc.TranDac | Trao đổi với KH về xử lý cảnh báo KPI con vượt KPI cha |

## Key Insights

- Phân hệ Đánh giá TrungDong có cấu trúc **bảng cha – bảng con** phức tạp, phân biệt bảng nhân viên và bảng phòng ban
- Logic trọng số phụ thuộc vào OrgList (phòng ban) — quan trọng khi cấu hình
- Cảnh báo validation KPI cần xác nhận nghiệp vụ trước khi code

---

*Cuộc họp liên quan: H-TrungDong-Eva-04032025 (chưa ingest)*
