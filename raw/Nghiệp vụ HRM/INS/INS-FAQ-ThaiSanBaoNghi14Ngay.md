# INS FAQ — Nghỉ Thai Sản Nhưng Hệ Thống Báo Nghỉ ≥14 Ngày

## Nguyên nhân (3 trường hợp)

### 1. Ngày nghỉ chưa được duyệt
- `Att_Leaveday` chưa approve → hệ thống không nhận diện là nghỉ thai sản
- Fix: duyệt ngày nghỉ

### 2. Loại ngày nghỉ không gắn chứng từ "Sinh con / Nuôi con nuôi"
- Loại ngày nghỉ phải có "Loại chứng từ cần nộp" = **Sinh con** hoặc **Nuôi con nuôi**
- Fix: cấu hình lại loại ngày nghỉ

### 3. Vượt chu kỳ — ON/OFF Thai Sản Rule (Mantis #57594)
**Đây là logic đúng — wont fix.**

Pivot ngày **14/15** là ranh giới quyết định:
- **ON** (đóng BH tháng N): ngày **bắt đầu** thai sản ∈ [ngày 15/N-1 → ngày 14/N]
- **OFF** (không đóng BH tháng N): ngày **kết thúc** thai sản ∈ [ngày 15/N-1 → ngày 14/N]

Nếu ngày nghỉ thai sản vượt ra ngoài chu kỳ → hệ thống không nhận diện là thai sản tháng đó → báo ≥14 ngày thay thế.

## Checklist hỏi PE (theo thứ tự)
1. Ngày nghỉ đã được duyệt chưa?
2. Loại ngày nghỉ có gắn chứng từ "Sinh con / Nuôi con nuôi" không?
3. Ngày bắt đầu / kết thúc thai sản có nằm trong chu kỳ [15/N-1 → 14/N] không?

## Liên kết
- INS-Thai-San-On-Off (wiki) — chi tiết rule ON/OFF Mantis #57594
