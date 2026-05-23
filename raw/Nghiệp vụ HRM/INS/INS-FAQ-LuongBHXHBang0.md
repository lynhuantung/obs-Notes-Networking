# INS FAQ — Tại Sao Lương BHXH = 0?

## Nguyên nhân
1. **Dữ liệu sai** (đa phần) — `InsuranceAmount` trong `Sal_InsuranceSalary` đang để 0 hoặc null
2. **Công thức sai** — công thức trong `Cat_InsuranceElement` tính ra 0

## Checklist hỏi PE
1. Màn hình lương BHXH (`Sal_InsuranceSalary`) của NV đó — số tiền lương BHXH là bao nhiêu?
2. Công thức tính lương BH trong `Cat_InsuranceElement` là gì? Các biến trong công thức có giá trị không?

## Lưu ý
- Đây thường là **wont fix** về logic — vấn đề nằm ở dữ liệu đầu vào hoặc công thức PE cấu hình sai
- Kiểm tra dữ liệu trước khi nghi ngờ code
