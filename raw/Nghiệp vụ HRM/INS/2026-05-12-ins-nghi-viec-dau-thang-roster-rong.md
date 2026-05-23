---
Mã: "INS-Case4-NghiViecDauThang-ThieuCongThuc"
aliases:
created: 2026-05-12
updated: 2026-05-12
description: "Config: NV nghỉ việc tháng 4 bị báo nghỉ việc tháng 5 do chế độ công chưa cấu hình công thức WorkPeriodFormula → CalculateNumberOfDayByFormula trả về 0 < 14"
tags:
  - nhatkyvande
  - ins
  - nghi-viec
  - config
  - 14-ngay
  - cong-thuc-cham-cong
domain: ins
khach-hang: golive (ST2416)
loai-van-de: config
severity: trung
status: đang-xu-ly
related:
  - "[[wiki/sources/INS-FAQ-NghiViecTrongKy]]"
  - "[[wiki/sources/INS-Nghi14Ngay]]"
  - "[[wiki/sources/INS-Config-FAQ]]"
  - "[[wiki/glossary/HRM-Glossary]]"
---

# 📋 INS — NV nghỉ việc tháng 4 bị báo tháng 5 do thiếu WorkPeriodFormula trong chế độ công

> **Domain**: INS — Bảo Hiểm  
> **Khách hàng**: Golive (NV mẫu: ST2416)  
> **Severity**: 🟡 Trung  
> **Ngày phát sinh**: 12/05/2026

---

## 1. Mô tả vấn đề

- **Triệu chứng**: NV nghỉ việc ngày 1/4/2026, phân tích BH tháng 4 ra **đóng BHXH bình thường** (IsQuit=false). Tháng 5 mới báo nghỉ việc (IsQuit=true).
- **Mong muốn**: Phân tích BH tháng 4 ra **IsQuit=true** (báo nghỉ việc ngay tháng 4).
- **Nơi xảy ra**: Phân tích BH > `Ins_ProfileInsuranceMonthly`
- **Tần suất**: Tái hiện khi config ON + chế độ công chưa cấu hình `WorkPeriodFormula`
- **Ảnh hưởng**: Báo D02 sai tháng → nộp BHXH dư 1 tháng

---

## 2. Bối cảnh

- **Config**: `isCheck14dayProfileQuitNextMonth = ON`
- **NV**: ST2416, DateQuit = 1/4/2026
- **Chế độ công**: `Cat_GradeAttendance.WorkPeriodFormula` = **rỗng / chưa cấu hình**
- **Môi trường**: Production (golive)

---

## 3. Phân tích nguyên nhân (5 Whys)

| # | Câu hỏi "Tại sao?" | Trả lời |
|---|-------------------|---------| 
| W1 | Tại sao T4 ra đóng BH thay vì nghỉ việc? | Config ON + số ngày nghỉ tính được < 14 → sinh 2 dòng (T4 đóng BH + T5 IsQuit) |
| W2 | Tại sao số ngày nghỉ tính ra < 14 dù NV nghỉ việc từ 1/4? | `CalculateNumberOfDayByFormula` trả về 0 |
| W3 | Tại sao hàm trả về 0? | `Cat_GradeAttendance.WorkPeriodFormula` rỗng → hàm không tính được số ngày làm/nghỉ |
| W4 | Tại sao WorkPeriodFormula rỗng? | Chế độ công chưa được cấu hình công thức (ví dụ `[D]-[SUN]-[SAT]`) |
| W5 | Ảnh hưởng? | 0 < 14 → config ON kích hoạt logic 2 dòng → T4 đóng BH + T5 IsQuit |

### Root Cause

```
Chế độ công chưa cấu hình WorkPeriodFormula
→ CalculateNumberOfDayByFormula trả về 0 ngày nghỉ
→ 0 < 14 → config isCheck14dayProfileQuitNextMonth = ON
→ sinh 2 dòng: T4 đóng BH + T5 IsQuit
```

> **Đây là lỗi config, không phải bug code.**

---

## 4. Giải pháp

### Giải pháp (Fix config)

1. Vào **Chấm công > Cấu hình chấm công > Chế độ công** → tìm chế độ công đang áp dụng cho NV ST2416
2. Cấu hình trường **WorkPeriodFormula** (Công thức số ngày trong kỳ) = `[D]-[SUN]-[SAT]` (hoặc công thức phù hợp lịch làm việc)
3. Phân tích lại BH tháng 4

- **Bảng liên quan**: `Cat_GradeAttendance.WorkPeriodFormula`
- **Không cần sửa code**

---

## 5. Kết quả kiểm tra

- [ ] Đã test trên UAT
- [ ] Đã test trên Production
- [ ] Khách hàng xác nhận
- **Kết quả**: Đang xử lý

---

## 6. Phòng ngừa / Lessons Learned

- **Lesson**: Khi BH báo nghỉ việc sai tháng — **kiểm tra config trước khi nghi code**. Nguyên nhân phổ biến nhất là `WorkPeriodFormula` chưa cấu hình trong chế độ công.
- **Checklist debug** (theo thứ tự):
  1. `isCheck14dayProfileQuitNextMonth` đang ON hay OFF?
  2. `Cat_GradeAttendance.WorkPeriodFormula` có giá trị không?
  3. Nếu rỗng → cấu hình công thức → phân tích lại
- **Pattern tổng quát**: Bất kỳ NV nào bị báo nghỉ việc T+1 thay vì T → khả năng cao thiếu `WorkPeriodFormula` trong chế độ công.

---

## Liên kết

- [[wiki/sources/INS-FAQ-NghiViecTrongKy]] — logic 2 dòng D02 khi config ON
- [[wiki/sources/INS-Nghi14Ngay]] — 2 chế độ đếm ngày, Formula vs Day-by-day
- [[wiki/sources/INS-Config-FAQ]] — `isCheck14dayProfileQuitNextMonth`
- [[wiki/sources/INS-BugFix-ThaiSan-NghiViec-CungThang]] — case tương tự (thai sản + nghỉ việc cùng tháng)
- [[wiki/glossary/HRM-Glossary]] — định nghĩa "nghỉ việc trong kỳ BH", pitfall thiếu WorkPeriodFormula
