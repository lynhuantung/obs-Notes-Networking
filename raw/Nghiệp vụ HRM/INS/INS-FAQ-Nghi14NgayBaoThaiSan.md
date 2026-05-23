# INS FAQ — Nghỉ ≥14 Ngày Nhưng Hệ Thống Báo Nghỉ Thai Sản

## Nguyên nhân
**Đây là logic đúng của hệ thống — wont fix.**

Loại ngày nghỉ của NV có gắn loại chứng từ BH là **sảy thai** → hệ thống luôn ưu tiên báo thai sản, dù chỉ nghỉ 1 ngày.

## Logic hệ thống
- Loại ngày nghỉ → có trường "Loại chứng từ cần nộp"
- Nếu loại chứng từ = **sảy thai** → `IsPregnant = true` → báo thai sản
- Điều này override kết quả đếm ngày nghỉ ≥14

## Checklist hỏi PE
1. Loại ngày nghỉ NV đang dùng có gắn loại chứng từ BH là "sảy thai" không?
2. Giải thích cho PE: đây là logic đúng — sảy thai = thai sản dù số ngày ít hơn 14
