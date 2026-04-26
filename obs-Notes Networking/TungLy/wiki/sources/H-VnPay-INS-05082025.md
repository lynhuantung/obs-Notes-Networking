---
type: source
tags:
  - vnpay
  - meeting
  - bao-hiem
  - misa
  - integration
  - "2025"
date-updated: 2026-04-25
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/concepts/HRM-Modules]]"
---

# H-VnPay-INS-05082025 — Biên bản họp Bảo hiểm tích hợp MISA

**Ngày họp**: 05/08/2025  
**Người tham gia**: TungLy, Tuan.Pham, Thong.Trinh, Lê Tuấn Hải (MISA), Hoa Minh (MISA)  
**Phân hệ**: INS (Bảo hiểm) — Tích hợp VnResource ↔ MISA AMIS Bảo hiểm

---

## Nội dung

### Tích hợp API danh mục từ MISA

- Mốc **600**: đồng bộ danh mục (MISA → VnResource)
- Mốc **630**: đồng bộ bổ sung các danh mục khác
- Bảng mapping thông tin VnResource ↔ AMIS bảo hiểm đã có

### Lộ trình

| Mốc | Ngày | Việc |
|-----|------|------|
| 05/09/2025 | Tuấn Hải (MISA) | Cung cấp API danh mục |
| 30/09/2025 | MISA | Bàn giao đồng bộ ngược trạng thái hồ sơ |
| xx/08/2025 | VnR | Cung cấp thông tin kết nối với MISA |

## Key Insights

- VnPay tích hợp phân hệ bảo hiểm với **MISA AMIS** — tích hợp bên thứ ba phức tạp, có lịch trình riêng
- Pattern tích hợp: MISA cung cấp API danh mục trước, sau đó MISA gọi API VnR để đồng bộ ngược
- **Mốc số** (600, 630) là cách phân chia scope tích hợp theo từng sprint/bàn giao
- Rủi ro: phụ thuộc lịch bàn giao của bên thứ ba (MISA)
