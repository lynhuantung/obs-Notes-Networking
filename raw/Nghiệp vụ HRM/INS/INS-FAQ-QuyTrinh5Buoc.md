# INS FAQ — Quy Trình 5 Bước Phân Tích Bảo Hiểm

## Tổng quan
Phân tích bảo hiểm thực hiện theo 5 bước tuần tự:

1. Dữ liệu nhân viên
2. Kiểm tra tháng tham gia bảo hiểm
3. Kiểm tra tháng đóng bảo hiểm
4. Kiểm tra nghỉ 14 ngày
5. Tính lương bảo hiểm

---

## Bước 1 — Dữ liệu nhân viên
Lấy danh sách nhân viên cần phân tích theo phòng ban/đơn vị được chọn.

---

## Bước 2 — Tháng bắt đầu tham gia bảo hiểm

**Nguồn dữ liệu** — tùy cấu hình `HasAnalyzeContract` (Thiết lập BH > "Phân tích BH theo loại hợp đồng"):
- `false` → dùng **Lương BHXH** (`Sal_InsuranceSalary`) — màn hình trung gian, tránh query HĐ trực tiếp, performance tốt hơn
- `true` → dùng **Hợp đồng** có loại HĐ đóng BHXH (SP `hrm_ins_sp_getContract`)
- Hợp đồng có chức năng sync ngược lại lương BHXH

**Logic lấy tháng bắt đầu** (hàm `SetMonthJoinInsuranceByProfile`):
- Lấy bản ghi lương BHXH **gần nhất** trước tháng kiểm tra (`DateEffect <= endMonth`)
- Set riêng cho từng loại: `MonthBeginInsSocial`, `MonthBeginInsHealth`, `MonthBeginInsUnEmp`
- **Edge case tạm hoãn**: nếu NV có `DateComeBack` → ưu tiên lương BHXH sau ngày quay lại, không dùng bản ghi cũ trước tạm hoãn

---

## Bước 3 — Kiểm tra tháng đóng bảo hiểm

- Dựa vào `DateEffect` của lương BHXH (xác định ở bước 2)
- So với chu kỳ `PeriodInsuranceDayDefaultFrom` → `PeriodInsuranceDayDefaultTo` trong Thiết lập BH
- Nằm **trong chu kỳ** → đóng BH tháng N → set `IsSocialInsurance`, `IsHealthInsurance`, `IsUnEmpInsurance = true`
- Nằm **ngoài chu kỳ** → đóng BH tháng N+1

---

## Bước 4 — Kiểm tra nghỉ 14 ngày

**Nguồn dữ liệu ngày nghỉ** (tùy config `InsLeave14DayType`):
- `Att_Workday` (tổng hợp công) — có ca + có quẹt thẻ → xác định ngày đi làm
- `Att_Leaveday` — ngày nghỉ đã đăng ký + duyệt
- `Ins_InsuranceRecord` — chứng từ bảo hiểm
- `DailyShift` (bên công) — fallback cho NV nghỉ việc (NV nghỉ việc không có trong tổng hợp công)

**Chu kỳ đếm**: từ ngày → đến ngày theo `PeriodInsurance14DayFrom/To` trong Thiết lập BH

**Công thức tính** — định nghĩa trong `Cat_InsuranceElement` loại `INS_14DAYS`, load qua chế độ công hoặc chế độ bảo hiểm:
- Dùng công thức nghỉ 14 ngày hoặc công thức số ngày đi làm

**Kết quả**: tổng ngày nghỉ ≥ `CountLeaveIns` (mặc định 14) → set `IsDecreaseWorkingDays = true`

---

## Bước 5 — Tính lương bảo hiểm

- Công thức tính lương BH định nghĩa trong `Cat_InsuranceElement`, load qua chế độ công hoặc chế độ bảo hiểm
- Kết quả set vào: `SocialInsEmpAmount`, `HealthInsEmpAmount`, `UnemployEmpAmount` trên `Ins_ProfileInsuranceMonthly`
- Tỉ lệ đóng (% BHXH/BHYT/BHTN) lấy từ chế độ bảo hiểm
