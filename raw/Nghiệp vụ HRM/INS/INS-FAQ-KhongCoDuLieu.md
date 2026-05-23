# INS FAQ — Tại Sao Phân Tích BH Không Có Dữ Liệu?

## Điều kiện loại NV khỏi phân tích

Hệ thống sẽ không phân tích NV nếu rơi vào một trong 2 trường hợp:

### 1. NV nghỉ việc trước kỳ BH
- Cụ thể: `DateQuit < dateStartNewlabor` (ngày bắt đầu chu kỳ đóng BH)
- NV nghỉ việc vài tháng trước → hệ thống không đưa vào danh sách phân tích

### 2. NV chưa có lương BHXH
- Không có bản ghi `Sal_InsuranceSalary` (hoặc HĐ nếu dùng config phân tích theo HĐ)
- Tức là chưa được cấu hình đóng BHXH/BHYT/BHTN

## Checklist hỏi PE
1. NV có ngày nghỉ việc không? Ngày đó so với `dateStartNewlabor` thế nào?
2. NV có bản ghi lương BHXH (`Sal_InsuranceSalary`) không?
3. Nếu dùng config HĐ — HĐ của NV có loại HĐ đóng BHXH không?
