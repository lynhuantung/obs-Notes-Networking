---
type: source
code: k4xp
tags:
  - bao-hiem
  - thai-san
  - on-off
  - checklist
  - troubleshooting
domain: ins
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/sources/INS-Thai-San-On-Off]]"
  - "[[wiki/sources/INS-NghiThaiSan]]"
  - "[[wiki/sources/INS-FAQ-Nghi14NgayBaoThaiSan]]"
description: "Giải thích 3 nguyên nhân nghỉ thai sản nhưng hệ thống báo nghỉ ≥14 ngày, kèm checklist ưu tiên xử lý cho PE."
---

# INS FAQ — Nghỉ Thai Sản Nhưng Hệ Thống Báo Nghỉ ≥14 Ngày

## Tóm tắt

Tài liệu giải thích 3 nguyên nhân khiến NV nghỉ thai sản nhưng hệ thống báo nghỉ ≥14 ngày, kèm checklist hỏi PE theo thứ tự ưu tiên. Nguyên nhân thứ 3 (ON/OFF rule) là wont fix — logic nghiệp vụ đúng.

## Key Takeaways

- **Nguyên nhân 1**: `Att_Leaveday` chưa được duyệt → fix: duyệt ngày nghỉ
- **Nguyên nhân 2**: Loại ngày nghỉ thiếu chứng từ "Sinh con / Nuôi con nuôi" → fix: cấu hình lại
- **Nguyên nhân 3 — ON/OFF rule (wont fix)**: pivot ngày 14/15 quyết định ON/OFF thai sản tháng N
  - ON: ngày bắt đầu thai sản ∈ [15/N-1 → 14/N]
  - OFF: ngày kết thúc thai sản ∈ [15/N-1 → 14/N]
- Checklist theo thứ tự: duyệt → loại ngày nghỉ → kiểm tra chu kỳ ON/OFF

## Trích dẫn quan trọng

> Nghỉ thai sản mà vượt ra ngoài chu kỳ [15/N-1 → 14/N] → hệ thống không nhận diện là thai sản tháng đó → báo ≥14 ngày thay thế — đây là ON/OFF rule, wont fix.

## Liên kết

- [[wiki/sources/INS-Thai-San-On-Off]] — chi tiết rule ON/OFF Mantis #57594
- [[wiki/sources/INS-FAQ-Nghi14NgayBaoThaiSan]] — chiều ngược lại: nghỉ ≥14 ngày báo thai sản
