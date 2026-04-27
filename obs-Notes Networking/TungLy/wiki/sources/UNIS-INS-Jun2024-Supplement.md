---
type: source
tags:
  - unis
  - ins
  - bh-tu-nguyen
  - meeting
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: 1.Projects/UNI/H-UNI-INS-100624.md
related:
  - "[[wiki/entities/UNIS]]"
  - "[[wiki/sources/UNIS-INS-Meetings-2024]]"
  - "[[wiki/concepts/HRM-Modules]]"
---

# Source: UNIS INS — Họp BH Tự Nguyện 10/06/2024

## Tóm tắt

Biên bản họp BH tự nguyện UNIS ngày 10/06/2024 — họp sớm hơn phiên tháng 8 (đã ingest). Tập trung vào phạm vi BH tự nguyện cho giáo viên nước ngoài, logic đăng ký người thân trên portal, và các modify cần thêm: quốc tịch người thân + phân tích logic BH tự nguyện.

## Key Takeaways

- **BH tự nguyện cho 2 nhóm**: Giáo viên người Việt Nam và người nước ngoài — cùng quy trình nhưng phân biệt quốc tịch.
- **Luồng đăng ký portal**: NV đăng ký BH tự nguyện cho người thân (người phụ thuộc) → Nhân sự phê duyệt bên main.
- **Thông tin người thân cần capture**: Loại quan hệ (vợ/chồng/con…) + Độ tuổi + **Quốc tịch** (modify mới).
- **Danh mục gói BH**: Chỉ dùng bảo hiểm sức khỏe — không dùng bảo hiểm tai nạn.
- **Modify cụ thể**:
  - Thêm field **Quốc tịch** ở người thân (vì giáo viên nước ngoài có thân nhân nước ngoài)
  - Phân tích lại logic BH tự nguyện (kiểm tra lại luồng)
  - Bên main: Nhân sự tạo mới hoặc NV tạo mới → Nhân sự phê duyệt
  - Portal: Chặn logic khi load gói hoặc khi lưu (tránh chọn gói không hợp lệ)
- **Phiên này (tháng 6) vs phiên tháng 8**: Phiên tháng 6 là kick-off phân tích ban đầu; phiên tháng 8 là hoàn thiện và confirm modify.

## Trích dẫn quan trọng

> **Scope BH tự nguyện UNIS**: "BH tự nguyện cho giáo viên (người Việt Nam, người nước ngoài) — nhân sự đăng ký; portal nhân viên đăng ký cho người thân."

> **Action items phiên 10/06**:
> 1. Thêm quốc tịch ở người thân
> 2. Phân tích BH tự nguyện (kiểm tra lại logic)
> 3. Thong.Trinh trao đổi nghiệp vụ với Bao.Tran và Tien.Dang để đảm bảo đúng luồng

## Liên kết

- [[wiki/entities/UNIS]] — Đại học Quốc Tế, profile entity
- [[wiki/sources/UNIS-INS-Meetings-2024]] — Phiên họp tháng 8 (đầy đủ hơn, bao gồm cả đăng ký người thân)
