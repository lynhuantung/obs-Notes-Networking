# INS FAQ — Nghỉ Việc Trong Kỳ Hệ Thống Báo Đóng BH

## Cấu hình liên quan
Thiết lập BH > **"Kiểm tra nghỉ ≥14 ngày khi nhân viên nghỉ việc"** (`isCheck14dayProfileQuitNextMonth`)

## Logic theo config

### Config = OFF (mặc định)
- NV nghỉ việc trong kỳ → báo nghỉ việc tháng N luôn (dựa vào `dateEndQuit`)

### Config = ON
NV có `DateQuit` ∈ [beginMonth, endMonth]:

**Trường hợp 1 — nghỉ ≥14 ngày trong tháng:**
- Báo **giảm hẳn tháng N** (`IsQuit=true`, xóa `IsDecreaseWorkingDays`)

**Trường hợp 2 — nghỉ <14 ngày trong tháng:**
- Tạo **2 dòng**:
  - Dòng 1: tháng N vẫn **đóng BH bình thường** (`IsQuit=false`, `IsSocial/Health/UnEmp=true`)
  - Dòng 2: tháng N+1 **báo nghỉ việc** (`IsQuit=true`, `Status=E_CONFIRMED`)

## PE hay thắc mắc
"NV nghỉ việc tháng này sao vẫn thấy đóng BH?" → do config ON + nghỉ <14 ngày → dòng 1 vẫn đóng BH bình thường, dòng 2 mới báo nghỉ việc tháng sau.

## Checklist hỏi PE
1. Config `isCheck14dayProfileQuitNextMonth` trong Thiết lập BH có check không?
2. NV nghỉ ngày bao nhiêu? Tổng ngày nghỉ trong tháng là bao nhiêu (so với ngưỡng 14)?
