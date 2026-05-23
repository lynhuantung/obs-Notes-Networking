# INS-Config-FAQ — Cấu hình Thiết lập Bảo Hiểm (Sys_InsConfig)

> **Nguồn**: `Sys_InsConfigEntity.cs`, `Sys_Ins.cshtml`, `InsuranceServices.cs`, `Ins_InsuranceD02Services.cs`, `Ins_InsurancePayBackServices.cs`  
> **Cập nhật**: 2026-05-02  
> **Mục đích**: Tra cứu nhanh khi debug lỗi BH do cấu hình sai — mỗi key có: tên hiển thị, kiểu, mặc định, chức năng ảnh hưởng, lỗi thường gặp

---

## Tổng quan cấu trúc màn hình

Màn hình `Thiết Lập Bảo Hiểm` (Sys_InsConfig / tab Bảo Hiểm) gồm các nhóm fieldset:

| # | Fieldset | Mô tả |
|---|----------|--------|
| 1 | **Cấu Hình Bảo Hiểm** | Các ngày chốt, chu kỳ, cài đặt chung phân tích BH |
| 2 | **Nghỉ >= 14 Ngày** | Quy tắc đếm ngày nghỉ để miễn đóng BH |
| 3 | **Điều Chỉnh Bảo Hiểm** | Xóa dữ liệu khi phân tích lại, tìm kiếm NV nghỉ việc |
| 4 | **BC D02** | Cài đặt cho báo cáo D02-TS |
| 5 | **Chứng Từ Bảo Hiểm** | Kiểm soát chứng từ: trạng thái, quyền sửa, cảnh báo |
| 6 | **Đăng Ký Thay Đổi Thông Tin BH** | Trạng thái cho phép hủy/sửa đăng ký thay đổi |
| 7 | **01B-HSB (C70A)** | Chu kỳ 01B-HSB, trạng thái load chứng từ |
| 8 | **Phân Tích Lương BHXH** | Công thức tính lương BHXH |

---

## Nhóm 1: CẤU HÌNH BẢO HIỂM

### HRM_INS_CONFIG_SUMDATATEMPT
- **Tên**: Tổng hợp dữ liệu BH tạm đến ngày
- **Kiểu**: `int?`
- **Mặc định**: null
- **Dùng trong**: Xác định ngày cắt để tổng hợp dữ liệu BH dạng tạm thời
- **Ảnh hưởng**: Màn hình tổng hợp BH tạm

### HRM_INS_CONFIG_SUMDATAMAIN
- **Tên**: Tổng hợp dữ liệu BH chính thức đến ngày
- **Kiểu**: `int?`
- **Mặc định**: null
- **Ảnh hưởng**: Màn hình tổng hợp BH chính thức

### HRM_INS_CONFIG_PERIODINSURANCEYDAY
- **Tên**: Ngày Chốt BH (ngày cuối kỳ tăng LĐ)
- **Kiểu**: `int?`
- **Mặc định**: 15 (code trả về `value + 1 ?? 16`)
- **Dùng trong**: `InsuranceServices.PeriodInsuranceDayPreMonth` → dùng trong phân tích BH tăng LĐ
- **Logic**: `PeriodInsuranceDayPreMonth = config + 1` (Honda dùng ngày 18 → config = 17)
- **Ảnh hưởng**: Phân tích BH, D02 báo tăng LĐ, xác định NV nào thuộc kỳ N hay N+1
- **FAQ**: Nếu NV vào làm ngày 16 mà không ra D02 tăng → kiểm tra config này

### HRM_INS_CONFIG_PERIODINSURANCEDAYDEFAULTFROM / HRM_INS_CONFIG_PERIODINSURANCEDAYDEFAULTTO
- **Tên**: Chu kỳ BH (Từ ngày / Đến ngày)
- **Kiểu**: `int?` / `int?`
- **Mặc định**: From=16, To=15 (tháng N-1 ngày 15 → tháng N ngày 14)
- **Dùng trong**: `InsuranceServices.PeriodInsuranceDayPreMonthDefault`, `PeriodInsuranceDayCurrentMonthDefault`; `Ins_InsurancePayBackServices`
- **Ảnh hưởng**: Chu kỳ BH mặc định dùng trong phân tích BH, tính lương BH, C70A; D02
- **FAQ**: Sai chu kỳ BH → NV bị tính nhầm kỳ → kiểm tra 2 config này đầu tiên

### HRM_INS_CONFIG_PERIODINSURANCEDAYCHANGESALFROM / HRM_INS_CONFIG_PERIODINSURANCEDAYCHANGESALTO
- **Tên**: Chu kỳ thay đổi lương (Từ ngày / Đến ngày)
- **Kiểu**: `int?` / `int?`
- **Mặc định**: From=16, To=15
- **Dùng trong**: `InsuranceServices.PeriodInsuranceDayMonthChangeSalFrom/To`; `Ins_InsurancePayBackServices`
- **Ảnh hưởng**: Xác định kỳ nào lương BH thay đổi được ghi nhận → ảnh hưởng D02 loại tăng/giảm lương
- **FAQ**: D02 không xuất hiện dòng thay đổi lương → kiểm tra config này

### HRM_INS_CONFIG_PERIODINSURANCEDAYDESCREASEFROM / HRM_INS_CONFIG_PERIODINSURANCEDAYDESCREASETO
- **Tên**: Chu kỳ Báo Giảm LĐ (Từ ngày / Đến ngày)
- **Kiểu**: `int?` / `int?`
- **Mặc định**: 16/16
- **Dùng trong**: `InsuranceServices.PeriodInsuranceDayPreDecrease/CurrentDecrease`
- **Lưu ý**: Giá trị cộng thêm `HRM_SAL_NUMBER_DAY_PROFILE_QUIT` (số ngày dôi ra khi nghỉ việc)
- **Ảnh hưởng**: Xác định NV nghỉ việc trong kỳ nào thì báo giảm tháng N hay N+1
- **FAQ**: D02 giảm LĐ sai tháng → kiểm tra cả config này và `HRM_SAL_NUMBER_DAY_PROFILE_QUIT`

### HRM_INS_CONFIG_ISPROFILECOPY
- **Tên**: Phân tích BH cho nhân viên nhân bản (copy profile)
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.HasProfileCopy`
- **Ảnh hưởng**: Phân tích BH — nếu `false`, NV nhân bản sẽ bị bỏ qua khi phân tích

### HRM_INS_CONFIG_ISPROFILEQUITHEALTH
- **Tên**: NV nghỉ việc vẫn đóng BHYT
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.HasProfileQuitHealth`
- **Ảnh hưởng**: Phân tích BH — NV đã có DateQuit vẫn được tính BHYT nếu bật

### HRM_INS_CONFIG_ISANALYZECONTRACT
- **Tên**: Phân tích BH theo loại hợp đồng
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.HasAnalyzeContract`
- **Ảnh hưởng**: Bật thì phân tích BH sẽ lọc theo loại hợp đồng — NV không có hợp đồng hợp lệ sẽ không ra kết quả

### HRM_INS_CONFIG_ISBLOCKANALYZEFUTUREINSURANCE
- **Tên**: Chặn phân tích bảo hiểm ở tương lai
- **Kiểu**: `bool?`
- **Mặc định**: null (không chặn)
- **Ảnh hưởng**: Phân tích BH — ngăn user phân tích cho kỳ tương lai

### HRM_INS_CONFIG_ISCHECKPREGINSHISTORY
- **Tên**: Kiểm tra đóng đủ 6 tháng BHXH trong 12 tháng trước khi có thai sản
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.HasCheckPregInsHistory`
- **Ảnh hưởng**: Phân tích thai sản — nếu bật, NV phải có đủ 6 tháng đóng BH trong 12 tháng liền kề mới được tính thai sản

### HRM_INS_CONFIG_PREGNANCY
- **Tên**: Nguồn dữ liệu nghỉ thai sản
- **Kiểu**: `string` (enum `PREGNANCY_ANALYZEINS`)
- **Giá trị**: `E_PREGNANCYLEAVEDAY` (ngày nghỉ) | `E_PREGNANCYINSRECORD` (chứng từ)
- **Mặc định**: `E_PREGNANCYLEAVEDAY`
- **Dùng trong**: `InsuranceServices.HasPregnancyLeaveday`
- **Ảnh hưởng**: Phân tích BH thai sản lấy từ bảng `Att_LeaveDay` hay `Ins_InsuranceRecord`
- **FAQ**: Thai sản không ra số ngày → kiểm tra config này khớp với nơi nhập dữ liệu thực tế

### HRM_INS_CONFIG_ISUSEINSANALYZEPERIOD
- **Tên**: Phân tích BH và D02 theo đợt
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.HasInsurancePeriod`, `Ins_InsuranceD02Services`, `Ins_InsurancePayBackServices`
- **Ảnh hưởng**: Khi bật, phân tích BH sẽ nhóm theo đợt (batch period) thay vì theo tháng; D02 cũng phân tích theo đợt

---

## Nhóm 2: NGHỈ >= 14 NGÀY

### HRM_INS_CONFIG_PROFILEQUITNEXTMONTH
- **Tên**: Nghỉ <14 ngày + nghỉ việc trong tháng → tháng N+1 không đóng BH
- **Kiểu**: `bool?`
- **Mặc định**: null (không áp dụng)
- **Dùng trong**: `InsuranceServices.IsCheck14dayProfileQuitNextMonth`
- **Logic**: NV nghỉ việc trong tháng N, số ngày nghỉ < 14 → vẫn đóng BH tháng N, nhưng tháng N+1 không đóng
- **Ảnh hưởng**: Phân tích BH tháng nghỉ việc

### HRM_INS_CONFIG_ISCOUNTAFTERQUIT
- **Tên**: Đếm từ ngày nghỉ việc đến cuối tháng vào số ngày nghỉ >= 14
- **Kiểu**: `bool?`
- **Mặc định**: `true`
- **Dùng trong**: `InsuranceServices.HasCountAfterQuit`
- **Ảnh hưởng**: Tính số ngày nghỉ 14 ngày — bật thì cộng thêm ngày từ DateQuit đến cuối tháng

### HRM_INS_CONFIG_ISLEAVEINSCOUNT
- **Tên**: Có đếm ngày nghỉ để xét không đóng BH không
- **Kiểu**: `bool?`
- **Mặc định**: `true`
- **Dùng trong**: `InsuranceServices.HasLeaveInsCount`
- **Ảnh hưởng**: Tắt thì bỏ qua toàn bộ logic nghỉ >= 14 ngày → luôn đóng BH

### HRM_INS_CONFIG_COUNTLEAVEINS
- **Tên**: Số ngày nghỉ ngưỡng (mặc định 14)
- **Kiểu**: `int?`
- **Mặc định**: `14`
- **Dùng trong**: `InsuranceServices.CountLeaveDayIns`
- **Ảnh hưởng**: Ngưỡng để xác định "nghỉ >= N ngày" không đóng BH
- **FAQ**: Khách hàng muốn thay đổi ngưỡng (VD: 15 ngày) → sửa config này

### HRM_INS_CONFIG_PERIODINSURANCE14DAYFROM / HRM_INS_CONFIG_PERIODINSURANCE14DAYTO
- **Tên**: Chu kỳ đếm ngày nghỉ >= 14 ngày (Từ ngày / Đến ngày)
- **Kiểu**: `int?` / `int?`
- **Mặc định**: From=1, To=31
- **Dùng trong**: `InsuranceServices.Period14DayFrom`; `Ins_InsurancePayBackServices`
- **Ảnh hưởng**: Giới hạn khoảng ngày trong tháng để đếm số ngày nghỉ
- **FAQ**: NV nghỉ đầu tháng không bị tính 14 ngày → kiểm tra config From/To

### HRM_INS_CONFIG_IS14DAYGRADEPAYROLLAPPLY
- **Tên**: Chu kỳ nghỉ >= 14 ngày áp dụng theo chế độ lương
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.Is14DayGradePayrollApply`
- **Ảnh hưởng**: Bật → chu kỳ đếm 14 ngày dùng theo chế độ lương (GradePayroll) thay vì chu kỳ BH mặc định

### HRM_INS_CONFIG_ISATTENDANCETABLEFOR14DAY
- **Tên**: Nguồn dữ liệu đếm nghỉ 14 ngày: AttendanceTable hay Workday
- **Kiểu**: `bool`
- **Mặc định**: `false` (dùng Workday)
- **Dùng trong**: `InsuranceServices.IsAttendanceTableFor14Day`
- **Ảnh hưởng**: `true` = lấy từ `Att_AttendanceTable` (bảng tính công); `false` = lấy từ `Att_Workday` (tổng hợp công)
- **FAQ**: Số ngày nghỉ 14 ngày khác nhau giữa 2 nguồn → kiểm tra config này

### HRM_INS_CONFIG_INSLEAVE14DAYTYPE
- **Tên**: Loại dữ liệu dùng để đếm nghỉ 14 ngày
- **Kiểu**: `string` (multiselect, enum `InsLeave14DayType`)
- **Giá trị**: `Leaveday` | `Workday` | `InsuranceRecord`
- **Mặc định**: null (dùng tất cả)
- **Dùng trong**: `InsuranceServices.ListInsLeave14DayType`
- **Ảnh hưởng**: Phân tích BH — chỉ đếm từ nguồn được chọn; nếu null thì dùng mặc định hệ thống
- **FAQ**: NV có nghỉ trong ngày nghỉ nhưng không bị tính 14 ngày → kiểm tra loại nguồn này

### HRM_INS_CONFIG_PRIORITYDISPLAYLEAVEDAY14DAYS
- **Tên**: Ưu tiên hiển thị loại nghỉ >= 14 ngày
- **Kiểu**: `string` (enum `PriorityDisplayLeaveday`)
- **Mặc định**: null
- **Dùng trong**: `InsuranceServices.PriorityDisplayLeaveDay`
- **Ảnh hưởng**: Khi có nhiều loại nghỉ cùng ngày, ưu tiên loại nào hiển thị trên D02

### HRM_INS_CONFIG_PRIORITYPRENANCY
- **Tên**: Ưu tiên nghỉ thai sản khi tính 14 ngày
- **Kiểu**: `bool?`
- **Mặc định**: null
- **Dùng trong**: `InsuranceServices.PriorityPrenancy`
- **Ảnh hưởng**: Khi NV có cả nghỉ thai sản + nghỉ khác, ưu tiên thai sản để không bị tính 14 ngày sai

### HRM_INS_CONFIG_CAL14LEAVEDAYFROMSTARTDATECONTRACT
- **Tên**: Tính chu kỳ nghỉ 14 ngày từ ngày bắt đầu hợp đồng
- **Kiểu**: `bool?`
- **Mặc định**: null (false)
- **Dùng trong**: `InsuranceServices.Cal14LeaveDayFromStartDateContract`, `Ins_InsuranceD02Services`, `Ins_InsurancePayBackServices`
- **Ảnh hưởng**: Bật → chu kỳ bắt đầu từ ngày ký HĐ thay vì đầu tháng

---

## Nhóm 3: ĐIỀU CHỈNH BẢO HIỂM

### HRM_INS_CONFIG_ISDELDATACOMPUTEINSURANCE
- **Tên**: Xóa dữ liệu khi phân tích lại Bảo Hiểm
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.IsDelDataComputeInsurance`
- **Ảnh hưởng**: Khi phân tích BH, bật thì xóa toàn bộ dữ liệu cũ trước khi tính lại
- **FAQ/Rủi ro**: Bật cùng với phân tích lại có thể làm mất dữ liệu đã điều chỉnh thủ công

### HRM_INS_CONFIG_ISDELDATACOMPUTED02TS
- **Tên**: Xóa dữ liệu khi phân tích lại D02-TS
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `InsuranceServices.IsDelDataComputeD02TS`
- **Ảnh hưởng**: Tương tự trên nhưng cho riêng bảng D02-TS

### HRM_INS_CONFIG_NUMBEROFPERIODATTSEARCHTERMINATEDEMPS
- **Tên**: Số tháng kỳ công lùi để tìm NV nghỉ việc
- **Kiểu**: `int?`
- **Mặc định**: null
- **Ảnh hưởng**: Khi phân tích BH, hệ thống lùi N tháng để tìm NV đã nghỉ việc mà chưa được xử lý

---

## Nhóm 4: BC D02

### HRM_INS_CONFIG_SPLITUNEMPLOY
- **Tên**: Tách BHTN khi khác mức đóng
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Dùng trong**: `Ins_InsuranceD02Services.IsSplitUnemploy`
- **Ảnh hưởng**: D02 — khi mức đóng BHTN thay đổi giữa kỳ, tách thành 2 dòng riêng

### HRM_INS_CONFIG_ISDELDATACOMPUTED02TS
- *(xem Nhóm 3 ở trên)*

### HRM_INS_CONFIG_ISUSEINSANALYZEPERIOD
- *(xem Nhóm 1 ở trên — dùng cho cả D02)*

### HRM_INS_CONFIG_LEGALENTITYD02
- **Tên**: Thay đổi pháp nhân D02 theo cấp
- **Kiểu**: `string` (enum `LEGALENTITY_D02ANALYZEINS`)
- **Giá trị**: Công ty | Phòng ban cấp công ty | Phòng ban cấp chi nhánh
- **Mặc định**: null
- **Dùng trong**: `Ins_InsuranceD02Services.D02Legalentity`
- **Ảnh hưởng**: Xác định pháp nhân trên D02 lấy theo cấp nào (dùng khi DN có nhiều chi nhánh/pháp nhân)
- **FAQ**: D02 sai pháp nhân → kiểm tra config này + cấu trúc phòng ban

### HRM_INS_CONFIG_ISD02AFTERPRENANCY
- **Tên**: Chỉ hiển thị 1 dòng tăng thai sản (không hiện tăng lương riêng)
- **Kiểu**: `bool`
- **Mặc định**: `false`
- **Dùng trong**: `Ins_InsuranceD02Services.IsD02AfterPrenancy`
- **Ảnh hưởng**: D02 — NV đi làm lại sau thai sản, vừa tăng lương vừa tăng thai sản → bật thì gộp 1 dòng
- **FAQ**: D02 có 2 dòng tăng cho NV hết thai sản → bật config này

---

## Nhóm 5: CHỨNG TỪ BẢO HIỂM

### HRM_INS_CONFIG_ISALLOWENTERREASONREJECT
- **Tên**: Cho phép nhập lý do từ chối chứng từ BH
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Ảnh hưởng**: Màn hình chứng từ BH — hiện/ẩn field nhập lý do từ chối

### HRM_INS_CONFIG_ISNORRFRESH
- **Tên**: Không làm mới thông tin khi "Lưu và tạo mới" chứng từ
- **Kiểu**: `bool?`
- **Mặc định**: `false`
- **Ảnh hưởng**: Màn hình nhập chứng từ BH — bật thì giữ lại thông tin khi tạo chứng từ mới liên tiếp

### HRM_INS_CONFIG_NOTALLOWCREATEIIRAFTERDATEQUIT
- **Tên**: Không cho phép tạo chứng từ sau ngày nghỉ việc
- **Kiểu**: `string` (enum `WarnNotAllowCreateIIRAfterDateQuit`)
- **Mặc định**: null
- **Ảnh hưởng**: Chứng từ BH — kiểm soát tạo mới sau DateQuit; có thể cảnh báo hoặc chặn

### HRM_INS_CONFIG_WARNINGLOW6MONTH
- **Tên**: Cảnh báo BHXH dưới 6 tháng tính đến thời điểm sinh con
- **Kiểu**: `string` (enum `WarnLow6Month`)
- **Mặc định**: null
- **Ảnh hưởng**: Chứng từ thai sản — cảnh báo khi NV chưa đủ 6 tháng đóng BH

### HRM_INS_CONFIG_WARNINGNOTALLOWLEAVE60DAYBEFOREDOB
- **Tên**: Không cho nghỉ trước ngày sinh con quá 60 ngày
- **Kiểu**: `string` (enum `WarnNotAllowLeave60DayBeforeDOB`)
- **Mặc định**: null
- **Ảnh hưởng**: Kiểm tra ngày bắt đầu nghỉ thai sản — cảnh báo hoặc chặn nếu nghỉ sớm hơn 60 ngày

### HRM_INS_CONFIG_INSURANCERECORDSTATUSCOUNT
- **Tên**: Trạng thái chứng từ được tính vào phân tích BH
- **Kiểu**: `string` (enum `InsuranceRecordStatusConfig`)
- **Mặc định**: null
- **Dùng trong**: `InsuranceServices.InsuranceRecordStatus`, `Ins_InsuranceD02Services` (nhiều nơi), `Ins_InsurancePayBackServices`
- **Ảnh hưởng**: Phân tích BH, D02, C70A — chỉ lấy chứng từ ở trạng thái này để tính
- **FAQ**: Chứng từ đã nhập nhưng không ra D02/phân tích BH → kiểm tra trạng thái chứng từ có khớp config này không

### HRM_INS_CONFIG_INSURANCERECORDNOTALLOWEDIT
- **Tên**: Trạng thái chứng từ không được phép chỉnh sửa
- **Kiểu**: `string` (multiselect, enum `DocumentStatus`)
- **Mặc định**: null
- **Ảnh hưởng**: Màn hình chứng từ BH — disable nút sửa khi chứng từ ở trạng thái này

### HRM_INS_CONFIG_NOTALLOWEDITSTATUSPAID
- **Tên**: Không cho sửa chứng từ có trạng thái thanh toán
- **Kiểu**: `string` (multiselect, enum `PaymentStatusV2`)
- **Mặc định**: null
- **Ảnh hưởng**: Khóa chứng từ BH khi đã thanh toán ở các trạng thái cấu hình

### HRM_INS_CONFIG_ISINSURANCEINFOMATIONNOTALLOWEDIT
- **Tên**: Không cho chỉnh sửa thông tin chứng từ BHXH
- **Kiểu**: `bool?`
- **Mặc định**: null
- **Ảnh hưởng**: Khóa toàn bộ thông tin chứng từ BHXH khi bật

### HRM_INS_CONFIG_ISNOTCOUNTWORKDAY *(keyConfig trong view)*
- **Tên**: Loại trừ ngày đi làm khi tính số ngày chứng từ
- **Kiểu**: `bool?`  (field: `isNotCountWorkDaysWhenDayCount`)
- **Mặc định**: null
- **Ảnh hưởng**: Tính số ngày chứng từ ỐĐB/thai sản — nếu bật thì không cộng ngày đi làm vào tổng ngày

### HRM_INS_CONFIG_STATUSDEFAULTINSRECORDWAITING
- **Tên**: Trạng thái mặc định màn hình Chờ CT nghỉ BHXH
- **Kiểu**: `string` (multiselect, enum `LeaveDayStatus`)
- **Mặc định**: null
- **Ảnh hưởng**: Màn hình "Chờ chứng từ nghỉ BHXH" — lọc theo trạng thái này khi mở

### HRM_HR_INS_INSURANCERECORDALLOWCHANGEDATEWHILEWAITING
- **Tên**: Cho phép thay đổi ngày chứng từ khi đang ở trạng thái chờ
- **Kiểu**: `string` (enum `WarnNotAllowChangeDateInsRecord`)
- **Mặc định**: null
- **Ảnh hưởng**: Kiểm soát có cho phép sửa ngày chứng từ BH khi trạng thái = Chờ

---

## Nhóm 6: ĐĂNG KÝ THAY ĐỔI THÔNG TIN BH

### HRM_INS_CONFIG_CHANGEINSINFOREGISSTATUSALLOWDEL
- **Tên**: Trạng thái đăng ký thay đổi thông tin BH được phép hủy
- **Kiểu**: `string` (multiselect, enum `ChangeInsInfoRegister_Status`)
- **Mặc định**: null
- **Ảnh hưởng**: Màn hình đăng ký thay đổi thông tin BH — nút Hủy chỉ active khi ở trạng thái này

### HRM_INS_CONFIG_CHANGEINSINFOREGISSTATUSNOTALLOWEDIT
- **Tên**: Trạng thái đăng ký thay đổi thông tin BH không được sửa
- **Kiểu**: `string` (multiselect, enum `ChangeInsInfoRegister_Status`)
- **Mặc định**: null
- **Ảnh hưởng**: Khóa form đăng ký khi ở trạng thái đã cấu hình

---

## Nhóm 7: C70A / 01B-HSB

### HRM_INS_CONFIG_PERIODINSURANCEC70AFROM / HRM_INS_CONFIG_PERIODINSURANCEC70ATO
- **Tên**: Chu kỳ 01B-HSB (C70A) — Từ ngày / Đến ngày
- **Kiểu**: `int?` / `int?`
- **Mặc định**: null
- **Ảnh hưởng**: Xác định khoảng ngày để lọc chứng từ khi xuất 01B-HSB
- **FAQ**: 01B-HSB thiếu chứng từ → kiểm tra chu kỳ config này

### HRM_INS_CONFIG_ONLYLOADINSRECORDSTATUS
- **Tên**: Chỉ load chứng từ BH ở trạng thái
- **Kiểu**: `string` (multiselect, enum `DocumentStatus`)
- **Mặc định**: null
- **Ảnh hưởng**: Màn hình 01B-HSB — lọc chứng từ theo trạng thái

---

## Nhóm 8: LƯƠNG BHXH

### HRM_INS_CONFIG_INSURANCESALARYFORMULA
- **Tên**: Công thức tính lương BHXH
- **Kiểu**: `string` (textarea)
- **Mặc định**: null
- **Ảnh hưởng**: Phân tích lương BHXH — nếu null, dùng logic mặc định; nếu có, dùng công thức này để tính mức lương đóng BH

---

## Config liên quan từ module khác (ảnh hưởng đến BH)

| Key | Module | Ảnh hưởng đến BH |
|-----|--------|-----------------|
| `HRM_SAL_NUMBER_DAY_PROFILE_QUIT` | SAL | Cộng thêm vào chu kỳ báo giảm LĐ nghỉ việc |
| `HRM_HRE_CONFIG_QUITCAL` | HRE | Trạng thái xác nhận nghỉ việc — dùng để lọc NV báo giảm trong D02, InsurancePayBack |
| `HRM_ATT_ANNUALDETAIL_LEAVEDAYSTATUS` | ATT | Trạng thái ngày nghỉ được tính vào phân tích BH (mặc định: Approved) |
| `HRM_INS_CONFIG_VOLUNTARYINSURANCEFORMULACOMPAID` | INS | Công thức BH tự nguyện — phần công ty đóng |
| `HRM_SAL_FORMULA_FOR_CALCULATING_THE_ACTUAL_COST_OF_THE_COMPANY` | SAL | Chi phí thực công ty BH tự nguyện |
| `HRM_SAL_LOAD_PAYMENT_CALCULATION_BASED_ON_THE_AMOUNT_OF_MONEY_PAID_BY_THE_EMPPCOMP` | SAL | Phương thức tính thanh toán BH tự nguyện |

---

## Bảng tóm tắt nhanh — Lỗi → Config cần kiểm tra

| Triệu chứng lỗi | Config cần kiểm tra |
|-----------------|---------------------|
| D02 không có dữ liệu | `HRM_INS_CONFIG_INSURANCERECORDSTATUSCOUNT`, `HRM_INS_CONFIG_ISUSEINSANALYZEPERIOD`, `HRM_INS_CONFIG_PERIODINSURANCEDAYDEFAULTFROM/TO` |
| D02 sai tháng (tăng/giảm nhầm kỳ) | `HRM_INS_CONFIG_PERIODINSURANCEYDAY`, `HRM_INS_CONFIG_PERIODINSURANCEDAYDEFAULTFROM/TO`, `HRM_INS_CONFIG_PERIODINSURANCEDAYDESCREASEFROM/TO` |
| D02 sai loại (tăng lương không ra) | `HRM_INS_CONFIG_PERIODINSURANCEDAYCHANGESALFROM/TO` |
| D02 sai pháp nhân | `HRM_INS_CONFIG_LEGALENTITYD02` |
| D02 có 2 dòng tăng thai sản | `HRM_INS_CONFIG_ISD02AFTERPRENANCY` = true |
| D02 không tách dòng BHTN | `HRM_INS_CONFIG_SPLITUNEMPLOY` = true |
| Phân tích BH không ra NV | `HRM_INS_CONFIG_ISANALYZECONTRACT`, `HRM_INS_CONFIG_ISPROFILECOPY`, `HRM_ATT_ANNUALDETAIL_LEAVEDAYSTATUS` |
| Phân tích BH: NV nghỉ 14 ngày không bị loại | `HRM_INS_CONFIG_ISLEAVEINSCOUNT`, `HRM_INS_CONFIG_COUNTLEAVEINS`, `HRM_INS_CONFIG_INSLEAVE14DAYTYPE`, `HRM_INS_CONFIG_ISATTENDANCETABLEFOR14DAY` |
| Thai sản không ra ngày nghỉ | `HRM_INS_CONFIG_PREGNANCY` (kiểm tra nguồn dữ liệu) |
| Thai sản không đủ 6 tháng bị bỏ | `HRM_INS_CONFIG_ISCHECKPREGINSHISTORY` = true |
| Chứng từ BH không sửa được | `HRM_INS_CONFIG_INSURANCERECORDNOTALLOWEDIT`, `HRM_INS_CONFIG_NOTALLOWEDITSTATUSPAID`, `HRM_INS_CONFIG_ISINSURANCEINFOMATIONNOTALLOWEDIT` |
| 01B-HSB thiếu chứng từ | `HRM_INS_CONFIG_PERIODINSURANCEC70AFROM/TO`, `HRM_INS_CONFIG_ONLYLOADINSRECORDSTATUS` |
| Lương BHXH tính sai | `HRM_INS_CONFIG_INSURANCESALARYFORMULA` |
| NV nghỉ việc vẫn ra D02/BH | `HRM_INS_CONFIG_ISPROFILEQUITHEALTH`, `HRM_HRE_CONFIG_QUITCAL`, `HRM_SAL_NUMBER_DAY_PROFILE_QUIT` |
| Chu kỳ nhỉ 14 ngày tính từ ngày HĐ | `HRM_INS_CONFIG_CAL14LEAVEDAYFROMSTARTDATECONTRACT` = true |

---

## Ghi chú kỹ thuật

- Tất cả config được đọc qua `Sys_AttOvertimePermitConfigServices.GetConfigValue<T>(AppConfig.KEY)`
- Config lưu trong bảng `Sys_AllSetting` — key là chuỗi 
- Nhiều property trong `InsuranceServices` dùng **static cached field** → thay đổi config cần restart app hoặc clear cache để có hiệu lực ngay
- `InsuranceRecordStatusCount` được dùng ở **nhiều chỗ** trong `InsuranceServices`, `D02Services`, `PayBackServices` → đây là config quan trọng nhất khi chứng từ không được tính
