---
type: source
tags:
  - bitex
  - akw
  - chat-log
  - issues
  - project-management
domain: system
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/projects/Bitex-Project]]"
  - "[[wiki/sources/Bitex-Project-Overview]]"
  - "[[wiki/concepts/HRM-Code-Quality]]"
---

# Nguồn: Bitex — Chat Log Nhóm "Chỉ Huy Thi Công" (11/07/2025 → 27/01/2026)

> Nguồn gốc: `DailyNotes/chat-Amis-Chi-Huy-Thi-Cong.md` + `Issue-NguonLuc-SE.md` + `Issue-HRE-Deadline-Tre.md` + `Issue-2HopDong-1DuAn.md`

---

## Tóm tắt

Nhóm chat AMIS "Bitex AKW - Chỉ huy thi công" ghi nhận toàn bộ giao tiếp quản lý dự án từ 11/07/2025 đến 27/01/2026. Đây là nguồn dữ liệu thực tế nhất về các vấn đề phát sinh, quyết định dự án, và bài học kinh nghiệm — từ tranh luận tách/gộp hợp đồng, thiếu nguồn lực SE, deadline HRE trễ, đến lỗi gửi mail hậu go-live.

---

## Key Takeaways

- **Issue 1 — 2 hợp đồng 1 dự án (22/08/2025)**: Thống nhất quản lý 1 project AMIS, hạch toán tài chính chia đôi theo 2 hợp đồng (Bitex + AKW). Tiền lệ: ITL ký 13 hợp đồng, không tách dự án
- **Issue 2 — BA bị rút không thông báo (06/09/2025)**: Thức escalate vì BA điều sang dự án khác mà không báo PE. Yêu cầu thêm 2 SE đến hết tháng 9 (SE Thương + 1 SE mới)
- **Issue 3 — HRE deadline trễ (15/10/2025)**: TCDA cam kết xong 10/10, đến 15/10 vẫn chưa xong, PE không nhận cập nhật. Re-target: 18/10/2025
- **Issue 4 — AKW32 sub-task ẩn (01/11/2025)**: 1 task move code thực chất nhiều sub-task → SE cần sáng 05/11 (OT 04/11)
- **Issue 5 — Lỗi gửi mail tồn đọng (27/01/2026)**: Đã raise task nhưng chưa xử lý triệt để — cần Trung.Pham + Lý Nhuận Tùng theo dõi
- **Lệch dữ liệu file offline vs online (18/12/2025)**: Quy tắc: chỉ dùng Google Sheet online làm chuẩn
- **Dependency AKW31/32/90**: AKW90 → AKW32 (phải xong 32 mới làm 90)

---

## Trích dẫn quan trọng

> **"SE xong task ≠ Dự án đảm bảo"** — Thức (PE Lead, 25/12/2025)
>
> Chuỗi xử lý thực tế: SE xong → PE test + config → Chuyển KH → KH kiểm tra → Nghiệm thu
> SE chỉ là bước đầu trong chuỗi.

> **Thức escalate nguồn lực (06/09/2025)**:
> "@Trần Duy Tùng sao rút BA qua dự án khác mà không thông báo gì vậy anh"

> **Nguyên tắc task estimation (01/11/2025)**:
> "Khi raise task move code, cần breakdown rõ các sub-task và estimate từng phần" — rút ra từ AKW32

---

## Bài học quản lý dự án

1. Rút nguồn lực → bắt buộc thông báo PE trước ≥ 3 ngày
2. Deadline SE cần buffer 2–3 ngày cho PE test + config trước UAT/training
3. Cần cột "deadline mong đợi" riêng trong tracking tool
4. 1 task phức tạp (move code) → breakdown sub-task trước khi estimate
5. Chỉ dùng 1 nguồn dữ liệu task — Google Sheet online
6. Multi-contract → 1 project AMIS + hạch toán tài chính tách riêng

---

## Liên kết

- [[wiki/projects/Bitex-Project]] — Trang dự án chính
- [[wiki/sources/Bitex-Project-Overview]] — Tổng quan goals / scope / timeline / risks
- [[wiki/concepts/HRM-Code-Quality]] — Quy tắc build, merge, store
