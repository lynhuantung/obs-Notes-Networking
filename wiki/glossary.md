---
description: "Glossary — Định nghĩa thuật ngữ chính xác trong ngữ cảnh dự án HRM. Dùng làm neo ngữ nghĩa cho Request Graph Analyzer (B3)."
type: overview
date-updated: 2026-05-09
# updated: thêm nhóm Nghỉ Phép (2026-05-09)
tags:
  - glossary
  - dictionary
---

# Glossary — Định nghĩa thuật ngữ HRM

> **Cấu trúc mỗi entry:**
> - **Term**: Tên thuật ngữ chuẩn (khớp với key trong `dictionary_alias.md`)
> - **Definition**: Định nghĩa ngắn gọn, chính xác trong ngữ cảnh dự án
> - **Context**: Module / phân hệ sử dụng chính
> - **Intent-Tags**: Nhãn phân loại intent — `[fix-bug]` `[refactor]` `[feature]` `[config]` `[query]`
> - **Related**: Các thuật ngữ liên quan (tạo edge trong graph B5)

---

## Nghiệp vụ HRM

### Lương
- **Definition**: Toàn bộ quy trình tính và chi trả lương cho nhân viên, bao gồm phụ cấp, khấu trừ, thuế TNCN.
- **Context**: Phân hệ Lương — module `PayrollCalc`, stored proc `usp_TinhLuong*`
- **Intent-Tags**: `[query]` `[fix-bug]` `[feature]`
- **Related**: Bảo Hiểm, Thuế TNCN, Chấm Công, Hợp Đồng

### Bảo Hiểm
- **Definition**: Phân hệ quản lý BHXH / BHYT / BHTN. Nghiệp vụ cốt lõi là **Phân tích bảo hiểm** — xét từng NV theo từng tháng để xác định: (1) tháng đó có đóng BH không, (2) nếu có thì lương BH là bao nhiêu, (3) từ đó tính số tiền đóng theo tỉ lệ.
- **Context**: Phân hệ Bảo Hiểm — `InsuranceServices.cs`, báo cáo D02, C12
- **Intent-Tags**: `[query]` `[fix-bug]`
- **Related**: Phân Tích Bảo Hiểm, Lương BH, Kỳ Bảo Hiểm, Nghỉ 14 Ngày, Nghỉ Thai Sản, Nghỉ Việc, Hợp Đồng

### Phân Tích Bảo Hiểm
- **Definition**: Quy trình xét từng NV theo từng tháng → output 2 nhánh:
  - ✅ **Có đóng BH**: lấy lương BH (BHXH/BHYT/BHTN) × tỉ lệ → ra số tiền nộp
  - ❌ **Không đóng BH**: xảy ra khi NV rơi vào 1 trong 3 trường hợp: nghỉ việc / nghỉ ≥ 14 ngày / nghỉ thai sản
- **Context**: `InsuranceServices.cs` — hàm `AnalyzeInsurance`, `CheckLeave14day`
- **Intent-Tags**: `[query]` `[fix-bug]`
- **Related**: Bảo Hiểm, Lương BH, Nghỉ 14 Ngày, Nghỉ Thai Sản, Nghỉ Việc, Kỳ Bảo Hiểm

### Lương BH
- **Definition**: Mức lương dùng để tính số tiền đóng bảo hiểm — có thể khác nhau cho BHXH, BHYT, BHTN. Không nhất thiết bằng lương thực nhận. Được cấu hình trong bậc lương bảo hiểm (`Cat_InsuranceGrade`).
- **Context**: Phân hệ Bảo Hiểm — bảng `Cat_InsuranceGrade`, `Cat_InsuranceGradeDetailed`
- **Intent-Tags**: `[query]` `[config]`
- **Related**: Phân Tích Bảo Hiểm, Bảo Hiểm, Lương

### Kỳ Bảo Hiểm
- **Definition**: Các mốc ngày cấu hình trong `Sys_AllSetting` (đọc qua `Sys_AttOvertimePermitConfigServices.GetConfigValue`) — xác định **từ ngày / đến ngày** của từng chu kỳ BH trong tháng. Dùng để xét: NV nghỉ việc có rơi trong kỳ BH không → nếu không thì tháng hiện tại vẫn đóng BH, hệ thống tự add dòng tháng sau. Gồm các property chính trong `InsuranceServices`:

  | Property | AppConfig key | Mặc định | Ý nghĩa |
  |----------|--------------|----------|---------|
  | `PeriodInsuranceDayPreMonth` | `HRM_INS_CONFIG_PERIODINSURANCEYDAY` | 16 | Từ ngày (tháng trước) — Báo Tăng LĐ |
  | `PeriodInsuranceDayCurrentMonth` | *(= PreMonth - 1)* | 15 | Đến ngày (tháng này) — Báo Tăng LĐ |
  | `PeriodInsuranceDayPreMonthDefault` | `HRM_INS_CONFIG_PERIODINSURANCEDAYDEFAULTFROM` | 16 | Từ ngày — Chu kỳ BH mặc định |
  | `PeriodInsuranceDayCurrentMonthDefault` | `HRM_INS_CONFIG_PERIODINSURANCEDAYDEFAULTTO` | 15 | Đến ngày — Chu kỳ BH mặc định |
  | `PeriodInsuranceDayPreDecrease` | `HRM_INS_CONFIG_PERIODINSURANCEDAYDESCREASEFROM` | 16 | Từ ngày — Báo Giảm LĐ Nghỉ Việc |
  | `PeriodInsuranceDayCurrentDecrease` | `HRM_INS_CONFIG_PERIODINSURANCEDAYDESCREASETO` | 15 | Đến ngày — Báo Giảm LĐ Nghỉ Việc |
  | `PeriodInsuranceDayMonthChangeSalFrom` | `HRM_INS_CONFIG_PERIODINSURANCEDAYCHANGESALFROM` | 16 | Từ ngày — Chu kỳ thay đổi lương BH |
  | `PeriodInsuranceDayMonthChangeSalTo` | `HRM_INS_CONFIG_PERIODINSURANCEDAYCHANGESALTO` | 15 | Đến ngày — Chu kỳ thay đổi lương BH |
  | `HasInsurancePeriod` | `HRM_INS_CONFIG_ISUSEINSANALYZEPERIOD` | false | Có phân tích theo đợt (period) không? |

- **Context**: `InsuranceServices.cs` — các property đọc từ `Sys_AllSetting` qua `Sys_AttOvertimePermitConfigServices`
- **Intent-Tags**: `[config]` `[query]`
- **Related**: Phân Tích Bảo Hiểm, Nghỉ Việc, Sys_AllSetting

### Nghỉ 14 Ngày
- **Definition**: Trường hợp NV không đóng BH trong tháng vì nghỉ ≥ 14 ngày (mặc định, có thể cấu hình lại tại `CountLeaveIns`). **Logic xét** (`CheckLeave14day`):
  1. Duyệt từng ngày trong tháng (1→31)
  2. Ngày chỉ được đếm nếu NV **có ca làm việc** hôm đó — xác định qua `workday.ShiftID/Shift2ID` hoặc `dailyShift` (từ Roster/RosterGroup)
  3. Với mỗi ngày có ca, ưu tiên xét theo thứ tự: **leaveday** (`IsInsuranceLeave=true`) → **workday** (att_workday) → **InsuranceRecord** (chứng từ BH)
  4. Đếm đến đủ 14 ngày thì dừng
  5. Phân loại kết quả theo cấu hình ưu tiên: *Ưu tiên giảm không lương* / *Ưu tiên giảm bệnh* / *Không ưu tiên* → ra loại: `E_14_SICK` (nghỉ ốm) / `E_14_UNPAID` (không lương) / `E_14_LEAVE` (hỗn hợp)
- **Context**: `InsuranceServices.cs` — `CheckLeave14day`, bảng `Att_Workday`, `Att_LeaveDay`, `Ins_InsuranceRecord`
- **Intent-Tags**: `[fix-bug]` `[query]` `[config]`
- **Related**: Phân Tích Bảo Hiểm, Roster, DailyShift, Leaveday, Nghỉ Thai Sản

### Nghỉ Không Lương
- **Definition**: Loại nghỉ không hưởng lương trong tháng — được tính vào tổng ngày nghỉ để xét điều kiện giảm BH ≥14 ngày (`E_14_UNPAID`). Liên quan trực tiếp đến cột `TotalUnpaidLeaveDay` trong màn hình Phân tích BH.
- **Context**: Phân hệ Bảo Hiểm — `CheckLeave14day`, bảng `Att_LeaveDay`, `Ins_InsuranceRecord`
- **Intent-Tags**: `[fix-bug]` `[query]`
- **Related**: Nghỉ 14 Ngày, Phân Tích Bảo Hiểm, Nghỉ Ốm, Bảo Hiểm

### Nghỉ Ốm
- **Definition**: Nghỉ bệnh/sick leave — được tính vào tổng ngày nghỉ để xét điều kiện giảm BH ≥14 ngày (`E_14_SICK`). Liên quan trực tiếp đến cột `TotalSickLeaveDay` trong màn hình Phân tích BH.
- **Context**: Phân hệ Bảo Hiểm — `CheckLeave14day`, `Ins_InsuranceRecord`
- **Intent-Tags**: `[fix-bug]` `[query]`
- **Related**: Nghỉ 14 Ngày, Phân Tích Bảo Hiểm, Nghỉ Không Lương, Bảo Hiểm

### Nghỉ Thai Sản (BH)
- **Definition**: Trường hợp đặc biệt — NV không đóng BH trong tháng vì đang nghỉ thai sản. Được xác định qua loại nghỉ có `IsPregnantLeave=true` hoặc `InsuranceType = E_PREGNANCY_SUCKLE`. Tách riêng khỏi nghỉ 14 ngày thông thường.
- **Context**: `InsuranceServices.cs`, `Cat_LeaveDayType.IsPregnantLeave`
- **Intent-Tags**: `[query]` `[fix-bug]`
- **Related**: Nghỉ 14 Ngày, Phân Tích Bảo Hiểm, Loại Nghỉ

### Ins_ProfileInsuranceMonthly
- **Definition**: Bảng lưu kết quả phân tích bảo hiểm theo từng NV × từng tháng. Mỗi dòng = 1 NV 1 tháng, ghi nhận: có/không đóng BH, lương BH, số tiền, loại nghỉ 14 ngày, số ngày nghỉ.
- **Context**: Phân hệ Bảo Hiểm — output của `AnalyzeInsurance`
- **Intent-Tags**: `[query]` `[fix-bug]`
- **Related**: Phân Tích Bảo Hiểm, Bảo Hiểm

### Chấm Công
- **Definition**: Ghi nhận thời gian làm việc thực tế (máy chấm, GPS, manual). Đầu vào của tính lương.
- **Context**: Phân hệ Chấm Công — `AttendanceLog`, GPS tracking
- **Intent-Tags**: `[fix-bug]` `[query]`
- **Related**: Lương, Ca Làm Việc, GPS

### Hợp Đồng
- **Definition**: Hợp đồng lao động — xác định loại hợp đồng, thời hạn, mức lương cơ sở.
- **Context**: Phân hệ Nhân Sự — `HopDong`, `LoaiHopDong`
- **Intent-Tags**: `[query]` `[feature]`
- **Related**: Lương, Bảo Hiểm, Nhân Viên

### Nhân Viên
- **Definition**: Thực thể trung tâm trong HRM — mã NV, thông tin cá nhân, đơn vị, chức vụ.
- **Context**: Toàn hệ thống — bảng `NhanVien`, `NhanVienChiTiet`
- **Intent-Tags**: `[query]` `[feature]`
- **Related**: Hợp Đồng, Lương, Chấm Công, Phòng Ban

### Phòng Ban
- **Definition**: Đơn vị tổ chức — cây phân cấp (Công ty → Phòng → Tổ).
- **Context**: Danh mục — `DonVi`, `PhongBan`
- **Intent-Tags**: `[query]`
- **Related**: Nhân Viên, Chức Vụ

### Nghỉ Phép
- **Definition**: Đăng ký và phê duyệt ngày nghỉ cho nhân viên — bao gồm nhiều loại: nghỉ năm, nghỉ luân phiên, nghỉ thai sản, v.v. Mỗi loại nghỉ có thể có công thức điều kiện riêng.
- **Context**: Phân hệ Chấm Công — Portal Chấm Công V3.0, module đăng ký ngày nghỉ
- **Intent-Tags**: `[fix-bug]` `[query]` `[feature]`
- **Related**: Loại Nghỉ, Điều Kiện Đăng Ký Nghỉ, Chấm Công, Nhân Viên

### Loại Nghỉ
- **Definition**: Danh mục phân loại ngày nghỉ (nghỉ năm, nghỉ luân phiên, nghỉ ốm, nghỉ thai sản…). Mỗi loại có cấu hình riêng: số ngày, điều kiện, công thức tính.
- **Context**: Phân hệ Chấm Công — bảng danh mục loại nghỉ, liên kết với `E_ABILITYTILE_CODE`
- **Intent-Tags**: `[query]` `[config]` `[fix-bug]`
- **Related**: Nghỉ Phép, Điều Kiện Đăng Ký Nghỉ, Chấm Công

### Điều Kiện Đăng Ký Nghỉ
- **Definition**: Công thức/logic kiểm tra điều kiện trước khi cho phép đăng ký loại nghỉ. Dùng các biến: `E_DateStart`, `E_DateCreate`, `E_LeaveDay`, `E_ABILITYTILE_CODE`, `E_COMPANYCODE`, hàm `DATEDIF`. Mỗi loại nghỉ có thể cấu hình công thức riêng.
- **Context**: Portal Chấm Công V3.0 — engine đánh giá điều kiện đăng ký
- **Intent-Tags**: `[fix-bug]` `[config]` `[query]`
- **Related**: Nghỉ Phép, Loại Nghỉ, E_DateStart, E_LeaveDay

### Portal Chấm Công V3.0
- **Definition**: Giao diện web cho nhân viên tự đăng ký nghỉ, xem lịch, theo dõi số ngày phép. Phiên bản V3.0 — có thể có sự khác biệt logic so với V2.x.
- **Context**: Phân hệ Chấm Công — frontend portal, gọi API backend
- **Intent-Tags**: `[fix-bug]` `[feature]`
- **Related**: Nghỉ Phép, Chấm Công, API

### Nghỉ Việc (Bảo Hiểm)
- **Definition**: Trường hợp NV có `DateQuit` trong tháng phân tích. **Liên kết mật thiết với Nghỉ 14 Ngày** — logic xử lý phụ thuộc vào cấu hình `IsQuitLeave14Days`:

  **TH1: Nghỉ việc + nghỉ ≥ 14 ngày → báo Giảm hẳn tháng N**
  - `IsQuit = true`, `IsHaveInsSocial/UnEmp = false`
  - Tháng N không đóng BH

  **TH2: Nghỉ việc + nghỉ < 14 ngày → sinh 2 dòng**
  - **Dòng 1 (tháng N)**: `IsQuit = false` — vẫn đóng BHXH/BHYT/BHTN bình thường
  - **Dòng 2 (tháng N+1)**: `IsQuit = true`, `IsAnalyzeForNextMonth = true`, `Status = E_CONFIRMED` — báo Giảm

  **Logic đếm ngày sau khi nghỉ việc** (trong `CheckLeave14day`):
  - Sau `DateQuit`, NV không có ca → không dùng `dailyShift` được
  - Dùng **công thức bên Chế độ Công** (`Cat_GradeAttendance.WorkPeriodFormula`) — gọi `CalculateNumberOfDayByFormula(profileDateQuit → endMonth)` để đếm số ngày có ca (trừ day off) từ ngày nghỉ việc đến cuối tháng
  - Nếu tổng cộng (ngày nghỉ trước đó + ngày sau DateQuit) ≥ 14 → xác nhận nghỉ việc tháng N

  **Xét NV vào danh sách phân tích**:
  - Chỉ lấy NV có `DateQuit > periodQuitInsuranceDay` (= từ ngày chốt BH Giảm LĐ, mặc định ngày 15 tháng trước — đọc từ `Sys_AllSetting`)
  - NV nghỉ trước mốc đó → đã báo Giảm tháng trước, không lấy vào

- **Context**: `InsuranceServices.cs` — `SetLeave14Days`, `CheckLeave14day`, `CalculateNumberOfDayByFormula`
- **Intent-Tags**: `[fix-bug]` `[query]`
- **Related**: Nghỉ 14 Ngày, Kỳ Bảo Hiểm, Phân Tích Bảo Hiểm, Chế Độ Công, Ins_ProfileInsuranceMonthly

### Chế Độ Công (GradeAttendance)
- **Definition**: Cấu hình quy tắc tính công cho nhóm NV — trong đó có `WorkPeriodFormula` là công thức text dùng để **đếm số ngày làm việc** trong một khoảng thời gian, thay thế cho việc dựa vào Roster/dailyShift (vốn không có sau khi NV nghỉ việc). Công thức kết hợp các biến:

  | Biến | Ý nghĩa |
  |------|---------|
  | `D` | Tổng số ngày calendar trong khoảng (dateEnd - dateStart + 1) |
  | `SAT` | Số ngày Thứ 7 trong khoảng |
  | `SUN` | Số ngày Chủ Nhật trong khoảng |
  | `H` | Số ngày nghỉ lễ (`Cat_DayOff`) trong khoảng |
  | `H_NOT_SAT` | Số ngày nghỉ lễ **không phải** Thứ 7 |
  | `H_NOT_SUN` | Số ngày nghỉ lễ **không phải** Chủ Nhật |
  | `R` | Số ngày **có ca** (Roster đã duyệt) trong khoảng |

  Ví dụ công thức thực tế: `D - SUN - H_NOT_SUN` = tổng ngày trừ Chủ Nhật trừ ngày lễ (không tính lễ rơi vào CN).

  Kết quả được tính qua `FormulaHelper.ParseFormula` → trả về `int` số ngày.

  **Dùng trong BH**: khi NV nghỉ việc ngày X, không có ca từ X đến cuối tháng → gọi `CalculateNumberOfDayByFormula(formula, profileID, DateQuit, endMonth, ...)` để đếm số ngày "đáng lẽ phải đi làm" → cộng vào `countLeave` để xét đủ 14 ngày không.

- **Context**: `Att_AttendanceLib.CalculateNumberOfDayByFormula`, `Cat_GradeAttendance.WorkPeriodFormula`
- **Intent-Tags**: `[config]` `[query]`
- **Related**: Nghỉ Việc (Bảo Hiểm), Nghỉ 14 Ngày, Roster, DailyShift

### NLĐ
- **Definition**: Người lao động — nhân viên trong hệ thống HRM, đối tượng của mọi nghiệp vụ lương/BH/chấm công.
- **Context**: Toàn hệ thống — đồng nghĩa Nhân Viên, bảng `NhanVien`
- **Intent-Tags**: `[query]`
- **Related**: Hợp Đồng, Lương, Bảo Hiểm, Chấm Công, Nghỉ Việc

---

### Tỉ Lệ Bảo Hiểm
- **Definition**: Tỉ lệ % đóng BHXH/BHYT/BHTN cho cả NSDLĐ và NLĐ, cấu hình theo tháng áp dụng trong `Cat_RateInsurance`. Hiện tại (từ 01/2024):

  | Loại | NSDLĐ đóng | NLĐ đóng |
  |------|-----------|----------|
  | BHXH | 17.5% | 8% |
  | BHYT | 3% | 1.5% |
  | BHTN | 1% | 1% |

  Áp dụng vào phân tích: `MoneyInsuranceSocial = MoneyInsuranceTotal × rate` (tương tự BHYT, BHTN).

- **Context**: `Cat_RateInsurance` — tab "Tỉ lệ bảo hiểm" trong Cấu hình bảo hiểm
- **Intent-Tags**: `[config]` `[query]`
- **Related**: Phân Tích Bảo Hiểm, Lương BH, Mức Trần BH

### Mức Trần BH
- **Definition**: Giới hạn tối đa của lương BH dùng để tính tiền đóng. Có **2 loại trần** dùng trong phân tích:

  **1. Mức trần BHXH** (`Cat_ValueEntity` type=`E_INSURANCE_CAPE_AMOUNT`, bảng "Mức trần đóng BHXH"):
  - Áp dụng cho BHXH và BHYT
  - Lương BH ≥ mức trần → lấy mức trần
  - Có thể override theo `Cat_InsuranceGrade.MaxSalary` (cấu hình riêng theo chế độ BH)
  - Cũng có lương tối thiểu (`E_MINIMUM_SALARY`): lương BH ≤ lương tối thiểu → lấy lương tối thiểu
  - Logic trong `GetInsuranceSalary()`: `if result >= ceiling → result = ceiling`

  **2. Mức trần BHTN** — dựa vào **lương vùng** (`Cat_RegionDetail.MaxSalary`):
  - NV thuộc vùng nào (xác định qua `Hre_Profile` → `Cat_Region`) → lấy `MaxSalary` vùng đó theo ngày hiệu lực
  - Lương BH ≥ mức trần vùng → lấy mức trần vùng
  - Logic trong `GetMonneyBHTN()`: `if result >= MoneyMaxByRegion → result = MoneyMaxByRegion`
  - **Mức trần BHTN thấp hơn mức trần BHXH**

- **Context**: `InsuranceServices.SetMoneyInsuranceByProfileByMonth`, `GetInsuranceSalary`, `GetMonneyBHTN`
- **Intent-Tags**: `[config]` `[query]`
- **Related**: Lương BH, Tỉ Lệ Bảo Hiểm, Mức Lương Vùng, Phân Tích Bảo Hiểm

### Mức Lương Vùng
- **Definition**: Mức lương tối thiểu và tối đa theo khu vực địa lý (`Cat_Region` / `Cat_RegionDetail`), cấu hình theo ngày hiệu lực. **Ảnh hưởng trực tiếp đến mức trần BHTN** — `MaxSalary` của vùng = trần lương đóng BHTN. NV thuộc vùng nào xác định qua `Hre_Profile`. Ví dụ màn hình: Vùng I lương min 4,680,000 – max 93,600,000.
- **Context**: `Cat_Region`, `Cat_RegionDetail` — tab "Mức lương vùng" trong Cấu hình bảo hiểm
- **Intent-Tags**: `[config]` `[query]`
- **Related**: Mức Trần BH, Lương BH, Phân Tích Bảo Hiểm

### Điều Chỉnh Bảo Hiểm (Payback)
- **Definition**: Nghiệp vụ chỉnh tay kết quả phân tích BH khi dữ liệu thực tế không khớp (do nhập liệu thiếu). Màn hình: `Ins_InsuranceSalaryPayback/Index` (gọi là **Điều chỉnh bảo hiểm**).

  **Flow nghiệp vụ**:
  1. NV tạo/chỉnh dòng điều chỉnh — nhập lương BH cũ (`InsSalary`), lương BH mới (`InsSalaryPayBack`), chênh lệch (`InsSalaryAdjust`), chọn loại D02 (`TypeID`)
  2. Bấm **Tính toán** → hệ thống lưu 1 dòng vào `Ins_ProfileInsuranceMonthly` với `PaybackID != null`
  3. Bảng BH tháng đó có **2 dòng**: dòng phân tích (`PaybackID = null`) + dòng điều chỉnh (`PaybackID != null`)
  4. Nếu chọn loại Tăng/Giảm → dòng điều chỉnh xuất hiện trên **Báo cáo D02**

  **Ảnh hưởng đến D02** (`OnComputeD02_V2`):
  - Dữ liệu so sánh tháng trước = `inFirst` + `inFirstPayback` (cộng dồn)
  - `insuranceSalaryFirst = inFirst.SalaryInsurance + inFirstPayback.SalaryInsurance`
  - Dòng điều chỉnh lấy theo: `PaybackID != null` và `MonthYear != MonthYearEffect` (hiệu lực từ tháng khác)

  **Trường quan trọng** trong `Ins_InsuranceSalaryPaybackEntity`:
  | Field | Ý nghĩa |
  |-------|----------|
  | `InsSalary` | Lương BH đã đóng (gốc) |
  | `InsSalaryPayBack` | Lương BH điều chỉnh |
  | `InsSalaryAdjust` | Chênh lệch |
  | `TypeID` | Loại D02 — xác định hiện trên BC D02 là Tăng hay Giảm gì |
  | `IsCallPayBack` | Đã tính toán chưa? |
  | `PaybackID` | ID trỏ về dòng điều chỉnh gốc |
  | `MonthYearEffect` | Tháng hiệu lực của điều chỉnh (có thể khác `MonthYear`) |

- **Context**: `Ins_InsuranceSalaryPayback`, `Ins_ProfileInsuranceMonthly.PaybackID`, `Ins_InsuranceD02Services`
- **Intent-Tags**: `[fix-bug]` `[query]` `[feature]`
- **Related**: Phân Tích Bảo Hiểm, Báo Cáo D02, Ins_ProfileInsuranceMonthly

### Báo Cáo D02
- **Definition**: Báo cáo **Tăng/Giảm lao động và tiền lương** so với tháng trước đối với BHXH. Nguồn gốc là mẫu giấy D02-TS, sau chuyển sang điện tử. Hệ thống hỗ trợ nhiều định dạng:

  | Tên | Mô tả |
  |-----|-------|
  | **D02 (gốc)** | Báo cáo giấy truyền thống |
  | **iBHXH** | Điện tử — cổng BHXH |
  | **eBHXH** | Điện tử — có Tăng/Giảm/Điều chỉnh |
  | **D02 VNPT** | Điện tử qua VNPT |
  | **D02 VietTel** | Điện tử qua Viettel |

  **Mục đích**: So sánh `Ins_ProfileInsuranceMonthly` tháng N với tháng N-1 (hoặc đợt trước) → phát hiện thay đổi → sinh dòng Tăng/Giảm.

  **Logic Tăng LĐ** — ưu tiên theo thứ tự (chỉ vào 1 case đầu tiên khớp):

  | Ưu tiên | Điều kiện | Loại D02 |
  |---------|-----------|----------|
  | 1 | NV đi làm lại sau tạm hoãn (trong kỳ tăng LĐ) | `E_TANG_LD` |
  | 2 | Tháng N-1 nghỉ 14 ngày **và** HĐ ký tháng N-1 | `E_TANG_LD` |
  | 2b | Tháng N-1 nghỉ 14 ngày **và** HĐ ký trước đó | `E_TANG_BENH` hoặc `E_TANG_LEAVE_14WORKINGDAYS` |
  | 3 | **HĐ ký trong kỳ tăng LĐ** (ngày 16 tháng N-1 → ngày 15 tháng N) **và HĐ thuộc loại đóng BHXH** | `E_TANG_LD` |
  | 4 | Tháng trước nghỉ thai sản | `E_TANG_TS` |
  | 5 | Có chứng từ nghỉ ốm dài ngày | `E_TANG_BENH` |
  | 6 | Lần đầu đóng BHTN (HĐ ký trong kỳ tăng LĐ, HĐ có đóng BHTN) | `E_TANG_BHTN` |

  **Kỳ tăng LĐ** = `dateFromIncreaseLabor` (ngày 16 tháng N-1) → `dateToIncreaseLabor` (ngày 15 tháng N) — đọc từ `Sys_AllSetting` (`PeriodInsuranceDayPreMonth`/`PeriodInsuranceDayCurrentMonth`).

  **Điều kiện HĐ**: `contractSocialsChunk` = danh sách HĐ thuộc **loại HĐ có đóng BHXH** — đây là điều kiện bắt buộc, HĐ không đóng BHXH sẽ không tính Tăng LĐ.
  1. Lấy data 2 tháng: `inNow` (tháng N) và `inFirst` (tháng N-1)
  2. So sánh từng NV: `IsIncreaseInsurance(inFirst, inNow)` → Tăng? `IsDecreaseInsurance(...)` → Giảm?
  3. Sinh dòng D02 với `TypeInsuranceD02TS` tương ứng

  **Các loại trạng thái D02 chính** (`TypeInsuranceD02TS`):

  | Nhóm | Trạng thái | Ý nghĩa |
  |------|-----------|----------|
  | Tăng | `E_TANG_LD` | Tăng lao động mới |
  | Tăng | `E_TANG_LUONG` | Tăng lương BH |
  | Tăng | `E_TANG_BHTN` | Tăng BHTN (lần đầu ký HĐ đóng BHTN) |
  | Tăng | `E_TANG_TS` | Tăng — hết thai sản quay lại |
  | Giảm | `E_GIAM_LD` | Giảm LĐ — nghỉ việc |
  | Giảm | `E_GIAM_BENH` | Giảm — nghỉ ốm ≥ 14 ngày |
  | Giảm | `E_GIAM_LEAVE_` | Giảm — nghỉ không lương ≥ 14 ngày |
  | Giảm | `E_GIAM_TS` | Giảm — nghỉ thai sản |
  | Giảm | `E_GIAM_LUONG` | Giảm lương BH |
  | Giảm | `E_GIAM_BHTN` | Giảm BHTN |
  | Điều chỉnh | `E_CHANGEJOBNAME` | Thay đổi chức danh |

  **Dữ liệu so sánh**:
  - `insuranceSalaryFirst` = lương BH tháng N-1 (BHXH/BHYT)
  - `insuranceSalaryNow` = lương BH tháng N
  - Lương BHTN tách riêng (`SalaryUnEmpInsurance`)
  - Nếu lương vượt trần nhưng vẫn thay đổi → vẫn báo Tăng/Giảm lương

- **Context**: `Ins_InsuranceD02Services.OnComputeD02_V2`, bảng `Ins_ReportD02Item`, `Ins_ReportD02ItemV2`
- **Intent-Tags**: `[query]` `[fix-bug]`
- **Related**: Phân Tích Bảo Hiểm, Ins_ProfileInsuranceMonthly, Tỉ Lệ Bảo Hiểm, Nghỉ 14 Ngày, Nghỉ Việc (Bảo Hiểm), Nghỉ Thai Sản (BH)

---

## Kỹ thuật / Hệ thống

### IIS
- **Definition**: Internet Information Services — web server chạy ứng dụng HRM .NET trên Windows Server.
- **Context**: Hạ tầng — deploy, cấu hình app pool, binding port
- **Intent-Tags**: `[config]` `[fix-bug]`
- **Related**: Deploy, AppPool, WebConfig

### Redis
- **Definition**: Cache layer — lưu session, kết quả tính lương tạm, queue job.
- **Context**: Infrastructure — `Redis_Sentinel` (production), `Redis_Local` (dev)
- **Intent-Tags**: `[fix-bug]` `[config]`
- **Related**: Cache, Session, Queue

### SQL Server
- **Definition**: RDBMS chính của HRM — T-SQL, stored procedures, views.
- **Context**: Toàn hệ thống — kết nối qua `webSettings.json`
- **Intent-Tags**: `[query]` `[fix-bug]` `[refactor]`
- **Related**: Stored Procedure, Index, Execution Plan

### Stored Procedure
- **Definition**: Logic nghiệp vụ đóng gói trong DB — prefix `usp_` hoặc `sp_`.
- **Context**: SQL Server HRM
- **Intent-Tags**: `[fix-bug]` `[refactor]` `[query]`
- **Related**: SQL Server, T-SQL, Trigger

### GPS
- **Definition**: Hệ thống định vị địa lý — dùng để chấm công ngoài văn phòng, xác minh vị trí check-in.
- **Context**: Phân hệ Chấm Công — mobile app → API → `AttendanceLog`
- **Intent-Tags**: `[fix-bug]` `[feature]`
- **Related**: Chấm Công, Mobile App, API

### API
- **Definition**: REST API nội bộ HRM — endpoint C#/.NET phục vụ web và mobile.
- **Context**: `HRM.Presentation.Main` — controllers, WebAPI
- **Intent-Tags**: `[fix-bug]` `[feature]` `[refactor]`
- **Related**: IIS, WebConfig, Mobile App

### S3
- **Definition**: AWS S3 — lưu trữ file đính kèm (hợp đồng scan, báo cáo xuất).
- **Context**: `AWS_S3_App` / `AWS_S3_Dev` / `AWS_S3_UAT`
- **Intent-Tags**: `[feature]` `[config]`
- **Related**: File Upload, Report Export

---

## Intent Taxonomy

| Tag | Ý nghĩa |
|-----|---------|
| `[fix-bug]` | Sửa lỗi đang xảy ra |
| `[refactor]` | Cải thiện code/SP không thay đổi behavior |
| `[feature]` | Thêm tính năng mới |
| `[config]` | Cấu hình hạ tầng / môi trường |
| `[query]` | Truy vấn thông tin, báo cáo, phân tích |

---

*Cập nhật glossary khi có thuật ngữ domain mới xuất hiện trong wiki.*
