# INS FAQ — NV Nghỉ Việc Ngoài Chu Kỳ Mà Vẫn Báo Giảm LĐ

## Logic xác định tháng báo giảm LĐ khi nghỉ việc

Hệ thống xác định tháng báo giảm dựa vào **số ngày nghỉ**:
- Tính từ **ngày nghỉ việc → cuối tháng** = số ngày nghỉ
- **≥14 ngày** → báo giảm LĐ **tháng N** (tháng đang phân tích)
- **<14 ngày** → báo giảm LĐ **tháng N+1**

## Config bổ sung — "Số ngày tính NV nghỉ việc" (Thiết lập nhân sự)
- Nếu **không có** → dùng ngày mặc định từ chu kỳ báo giảm LĐ trong Thiết lập BH
- Nếu **có giá trị** → cộng thêm số ngày đó vào chu kỳ báo giảm

**Ví dụ**: Chu kỳ giảm LĐ 16/08–15/09, NV nghỉ ngày 16/09, config = 1 ngày → báo giảm tháng 09

## PE hay thắc mắc
"NV nghỉ ngày 20, sao báo giảm tháng này?" → vì từ ngày 20 → cuối tháng ≥14 ngày → đúng logic.

## Checklist hỏi PE
1. NV nghỉ việc ngày bao nhiêu?
2. Từ ngày đó đến cuối tháng có ≥14 ngày không?
3. Config "Số ngày tính NV nghỉ việc" trong Thiết lập nhân sự có giá trị bao nhiêu?
