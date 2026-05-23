---
title: "ATT – Thiết lập chấm công (Sys_AttendanceConfig/Create)"
date: 2026-05-10
code: att-sys-attendance-config
domain: att
module: Attendance / System Config
tags:
  - att
  - config
  - sys-setting
  - nghiep-vu
verified: yes
related:
  - "[[ATT-Overview]]"
  - "[[ATT-TinhCong]]"
  - "[[ATT-LuatTangCa]]"
  - "[[ATT-LuatNgayNghi]]"
  - "[[ATT-DB-CatGradeCfg]]"
source-file: HRM12-GIT\Main\Source\Business\HRM.Business.HrmSystem.Models\Sys_AttConfigEntity.cs
source-service: HRM12-GIT\Main\Source\Business\HRM.Business.System.Domain\Sys_AttOvertimePermitConfigServices.cs
---

# ATT – Thiết lập chấm công (`Sys_AttendanceConfig/Create`)

## Tổng quan

Màn hình `Sys_AttendanceConfig/Create` — cấu hình toàn diện phân hệ chấm công.  
Tất cả setting lưu vào bảng **`Sys_AllSetting`** (cột `Name` = key, `Value1` = giá trị).  
API lưu: `POST api/Att_OvertimePermitConfig/` · Service: `Sys_AttOvertimePermitConfigServices`

Giao diện chia **7 tab**:

| Tab | Partial | Nội dung |
|-----|---------|---------|
| 1 | `Att_Workday_Summary` | Tính công / xử lý bảng công |
| 2 | `Sys_ConfigDB` | Kết nối DB máy chấm công |
| 3 | `Att_Overtime` | Tăng ca (OT) |
| 4 | `Att_Leave` | Nghỉ phép |
| 5 | `Att_OvertimePermit` | Giới hạn tăng ca |
| 6 | `Att_BusinessTrip` | Công tác |
| 7 | `Att_ConfigAudit` | Kiểm soát |

---

## Tab 1 — Tính công (`Att_Workday_Summary`)

### Nhận diện ca làm việc

| Key trong Sys_AllSetting | Value thực tế | Mô tả |
|--------------------------|--------------|-------|
| `HRM_ATT_WORKDAY_SUMMARY_DETECTSHIFT` | `True` | Tự động nhận diện ca |
| `HRM_ATT_WORKDAY_SUMMARY_DETECTSHIFT_ISCOMPUTE` | _(null)_ | Nhận diện ca khi tính công |
| `HRM_ATT_WORKDAY_SUMMARY_DETECTSHIFTPRIORITY` | _(null)_ | Ưu tiên ca khi nhận diện |
| `HRM_ATT_WORKDAY_SUMMARY_DETECTSHIFTPRIORITYWHENDETACHWRONGSHIFT` | _(null)_ | Ưu tiên ca khi tách sai ca |
| `HRM_ATT_WORKDAY_SUMMARY_DETECTFROMSHIFT` | _(null)_ | Tự nhận ca khi không có ca |
| `HRM_ATT_WORKDAY_SUMMARY_DETECTFROMSHIFTMISSINOROUT` | _(null)_ | Nhận ca khi miss in/out |
| `HRM_ATT_WORKDAY_SUMMARY_DETECT_SCANTYPE` | _(null)_ | Xác định loại quẹt thẻ |
| `HRM_ATT_WORKDAY_SUMMARY_ISATTENDANCESHIFTDEFAULTBY` | _(null)_ | Cách lấy ca mặc định |
| `HRM_ATT_SHIFT_SHIFTDEFAULT` | _(null)_ | Mã ca mặc định |

### Xử lý quẹt thẻ / dữ liệu in-out

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_WORKDAY_SUMMARY_SYMBOL` | _(null)_ | Ký hiệu quẹt vào |
| `HRM_ATT_WORKDAY_SUMMARY_SYMBOLOUT` | _(null)_ | Ký hiệu quẹt ra |
| `HRM_ATT_WORKDAY_SUMMARY_MAXHOURSNEXTINOUT` | `16` | Giờ tối đa giữa 2 lần quẹt liên tiếp |
| `HRM_ATT_WORKDAY_SUMMARY_MINMINUTESSAMEATT` | `1` | Phút tối thiểu giữa 2 lần quẹt cùng loại |
| `HRM_ATT_WORKDAY_SUMMARY_MAXHOURSONESHIFT` | `16` | Giờ tối đa 1 ca |
| `HRM_ATT_WORKDAY_SUMMARY_MAXWORKINGHOURS` | _(null)_ | Giờ làm tối đa/ngày |
| `HRM_ATT_WORKDAY_SUMMARY_MAXWORKDAYS` | _(null)_ | Ngày công tối đa |
| `HRM_ATT_WORKDAY_SUMMARY_ISVALIDATEENOUGHINOUT` | _(null)_ | Yêu cầu đủ cả in lẫn out |
| `HRM_ATT_WORKDAY_SUMMARY_ISDONOTCOMPUTEWORKDAYGREATERTHAN2TAMSCANLOG` | _(null)_ | Không tính công nếu >2 lần quẹt |
| `HRM_ATT_WORKDAY_SUMMARY_CODETAMSCANREASONMISSFORATT` | _(null)_ | Mã lý do thiếu quẹt thẻ |
| `HRM_ATT_WORKDAY_SUMMARY_PRIORITYDETACHTAMSCANLOG` | _(null)_ | Ưu tiên tách dữ liệu quẹt thẻ |
| `HRM_ATT_WORKDAY_SUMMARY_ISPRIORITYDETACHINOUTBYOVERTIMEHOLIDAY` | `True` | Ưu tiên tách in/out theo OT ngày lễ |

### Xử lý thiếu quẹt thẻ (MissTAM)

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_MISSTAM_LEAVETYPE` | `E_OFF_LESS` | Cách xử lý khi quẹt 1 lần |
| `HRM_ATT_MISSTAM_LEAVETYPETWOINOUT` | `E_OFF_NOT_SALARY` | Cách xử lý khi có 2 in/out |
| `HRM_ATT_MISSTAM_LEAVETYPEMISSINORMISSOUT` | `E_OFF_LESS` | Cách xử lý miss in hoặc miss out |
| `HRM_ATT_MISSTAM_LEAVETYPEHAVINGINOUT` | `E_OFF_LESS` | Loại nghỉ khi có đủ in/out |
| `HRM_ATT_MISSTAM_HAVINGLEAVEHAFTORFULL` | `E_OFF_LESS` | Loại nghỉ khi có nửa hoặc cả ngày |

### Tính công

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_WORKDAY_SUMMARY_DAYCOMPUTEWORKDAY` | `[BYCUTOFFDURATION]` | Ngày tính công (theo kỳ) |
| `HRM_ATT_WORKDAY_SUMMARY_TYPELOADDATA` | `E_CHECKDAYSHIFT` | Kiểu load dữ liệu |
| `HRM_ATT_WORKDAY_SUMMARY_ISCOMPUTEATTENDANCE` | _(null)_ | Bật tính công tự động |
| `HRM_ATT_COMPUTEATTENDANCE_COMPUTEATTENDANCESTATUS` | `E_APPROVED` | Trạng thái phiếu để tính công |
| `HRM_ATT_WORKDAY_SUMMARY_STATUSCOMPUTEWORKDAYADJUST` | `True` | Lấy trạng thái khi tính công điều chỉnh |
| `HRM_ATT_WORKDAY_STATUSCOMPUTEATTENDANCE` | _(null)_ | Trạng thái tính công |
| `HRM_ATT_WORKDAY_SUMMARY_ISANALYZEOVERTIMEWHENCOMPUTEWORKDAY` | _(null)_ | Phân tích OT khi tính công |
| `HRM_ATT_WORKDAY_SUMMARY_ISPRIORITYCOMPUTEATTENDANCEBYSHIFTAPPROVED` | _(null)_ | Ưu tiên tính theo ca đã duyệt |
| `HRM_ATT_WORKDAY_SUMMARY_ISSUMMARIZEANDANNUALLEAVETOCOMPUTEWORKDAY` | `True` | Tổng hợp phép năm vào tính công |
| `HRM_ATT_WORKDAY_SUMMARY_ISINTEGRATIONANDANALYZEKHTOCOMPUTEWORKDAY` | `E_OVERTIME_PLAN` | Tích hợp phân tích KH vào tính công |
| `HRM_ATT_WORKDAY_SUMMARY_ISINTEGRATIONANALYZEOTTOCOMPUTEWORKDAY` | `E_OVERTIME_PLAN` | Tích hợp phân tích OT vào tính công |
| `HRM_ATT_WORKDAY_SUMMARY_ISINTEGRATIONINVALIDDATAANALYSISTOCOMPUTEWORKDAY` | _(null)_ | Tích hợp dữ liệu lỗi vào tính công |
| `HRM_ATT_WORKDAY_SUMMARY_FORMULATOTALATTCOMPUTEPAYROLL` | `[PaidLeaveDay]+[PaidWorkDayCount]` | Công thức tổng công |
| `HRM_ATT_WORKDAY_SUMMARY_FORMULASALARYCALCULATIONFORNONSHIFTDAYS` | _(null)_ | Công thức tính lương ngày không ca |
| `HRM_ATT_WORKDAY_SUMMARY_ISSHOWTOTALATTCOMPUTEPAYROLL` | `True` | Hiển thị tổng công |
| `HRM_ATT_WORKDAY_SUMMARY_WORKDAYLOCK` | _(null)_ | Trạng thái khóa ngày công |
| `HRM_ATT_WORKDAY_SUMMARY_ISSAVEWORKDAYNOTROSTER` | `True` | Lưu ngày công khi không có roster |
| `HRM_ATT_WORKDAY_SUMMARY_COMPUTEWORKDAYBYSHIFTCODE` | _(danh sách mã ca)_ | Tính công chỉ theo các mã ca này |
| `HRM_ATT_WORKDAY_SUMMARY_COMPUTETIMESHEET` | _(null)_ | Tính theo timesheet |
| `HRM_ATT_WORKDAY_SUMMARY_COMPUTEWORKDAY_FORDAYHAVEMANYSHIFT` | _(null)_ | Tính công ngày có nhiều ca |

### Kỳ công (Cut-off)

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_WORKDAY_SUMMARY_ISAPPLYPRENANCYFOREMPLOYEE` | `True` | Áp dụng chế độ thai sản |
| `HRM_ATT_CONFIG_ISALLOWAPPROVEDATALOCKEDANDTRANFERCUTOFDUATION` | _(null)_ | Duyệt + chuyển kỳ khi khóa (OT) |
| `HRM_ATT_CONFIG_ISALLOWAPPROVEDATALOCKEDANDTRANFERCUTOFDUATIONLEAVEDAY` | `True` | Duyệt + chuyển kỳ khi khóa (nghỉ) |
| `HRM_ATT_CONFIG_ISREGISTERLEAVEDAYBYLOCKCUTOFFDURATION` | `True` | Đăng ký nghỉ khi kỳ đã khóa |
| `HRM_ATT_CONFIG_ISREGISTEROTBYLOCKCUTOFFDURATION` | _(null)_ | Đăng ký OT khi kỳ đã khóa |
| `HRM_ATT_CONFIG_IS_UPDATESTATUS_SENDMAIL_LOCKCUTOFFDURATION` | _(null)_ | Cập nhật trạng thái + gửi mail khi khóa kỳ |
| `HRM_ATT_ISDETERMINELASTEDUNLOCKEDATTPERIOD` | _(null)_ | Xác định kỳ chưa khóa cuối |
| `HRM_ATT_DATAISINTHEUNLOCKEDATTPERIODANDLOCKATTPERIOD` | _(null)_ | Dữ liệu trong/ngoài kỳ |

### GPS / Mobile

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_WORKDAY_SUMMARY_LOCATEGPSBY` | `E_SHOPGPS` | Phương thức xác định GPS |
| `HRM_ATT_WORKDAY_SUMMARY_EXPERTISELOCATEGPSBY` | `E_ROSTERGPS,E_OVERTIMEGPS` | Loại GPS được phép dùng |
| `HRM_ATT_WORKDAY_SUMMARY_ISALLOWCHECKINGPSBYCOORDINATES` | `True` | Cho phép chấm GPS bằng tọa độ |
| `HRM_ATT_WORKDAY_SUMMARY_ISALLOWCHECKINGPSBYMAC` | `True` | Cho phép chấm GPS bằng MAC |
| `HRM_ATT_WORKDAY_SUMMARY_ISSHOWWORKPLACECHECKINGPS` | _(null)_ | Hiển thị nơi làm việc khi chấm GPS |
| `HRM_ATT_WORKDAY_SUMMARY_STATUSSAVENWHENCHECKINGPS` | `E_APPROVED` | Trạng thái lưu khi chấm GPS |
| `HRM_ATT_WORKDAY_SUMMARY_SAVINGGPSTIMEKEEPINGDATANOTCORRECT` | `E_SUBMIT` | Xử lý khi dữ liệu GPS sai |
| `HRM_ATT_WORKDAY_SUMMARY_CONFIGPHOTOGRAPCHECKINGPS` | `E_UNVALIDATE` | Cấu hình ảnh chấm GPS |
| `HRM_ATT_SUMMARY_ISALLOWSENDINGSURVEYWHENCHECKINGGPS` | _(null)_ | Gửi khảo sát khi chấm GPS |
| `HRM_ATT_SUMMARY_ISALLOWSENDINGSURVEYWHENCHECKINGGPS_SURVEYCODE` | _(null)_ | Mã khảo sát khi chấm GPS |
| `HRM_ATT_WORKDAY_SUMMARY_WARNINGALLOWCHECKINGPSBYCOORDINATES` | `E_WARNING` | Cảnh báo GPS tọa độ |
| `HRM_ATT_WORKDAY_SUMMARY_WARNINGALLOWCHECKINGPSBYMAC` | `E_WARNING` | Cảnh báo GPS MAC |
| `HRM_ATT_WORKDAY_SUMMARY_ISALLOWCHECKINGPSWHENLEAVEDAYBUSINESSTRIP` | _(null)_ | Cho phép GPS khi công tác |
| `HRM_ATT_WORKDAY_SUMMARY_WARNINGALLOWCHECKINGPSWHENLEAVEDAYBUSINESSTRIP` | _(null)_ | Cảnh báo GPS khi công tác |
| `HRM_ATT_CONFIG_CHECKISBUSINESSTRAVELINGPSBYCOORDINATES` | _(null)_ | Kiểm tra công tác qua GPS tọa độ |
| `HRM_ATT_CONFIG_WARNINGBUSINESSTRAVELINGPSBYCOORDINATES` | _(null)_ | Cảnh báo công tác GPS |

### Roster / Ca kíp

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_ROSTER_COMPUTESTATUS` | `E_APPROVED` | Trạng thái roster để tính công |
| `HRM_ATT_CONFIG_VALIDATE_ROSTER_NON_CONTINUE_12HOUR` | _(null)_ | Kiểm tra ca liên tục <12h |
| `HRM_ATT_CONFIG_VALIDATE_NON_CONTINUE_12HOUR_HOUR` | `12` | Số giờ kiểm tra |
| `HRM_ATT_CONFIG_VALIDATE_NON_CONTINUE_12HOUR_FUNCTION` | _(null)_ | Hàm áp dụng khi vi phạm |
| `HRM_ATT_CONFIG_VALIDATE_ROSTER_NIGHT_NON_CONTINUE_2WEEKLY` | _(null)_ | Kiểm tra ca đêm liên tục 2 tuần |
| `HRM_ATT_CONFIG_VALIDATE_HOUR_ROSTER_NIGHT_LASTWEEK` | _(null)_ | Số giờ ca đêm tuần trước |
| `HRM_ATT_CONFIG_ISALLOWREGISTROSTERONPORTAL` | `True` | Cho phép đăng ký hộ ca trên portal |
| `HRM_ATT_CONFIG_ISALLOWREGISTINOUTONPORTAL` | `True` | Cho phép đăng ký hộ in/out trên portal |
| `HRM_ATT_ROSTER_ISALLOWSREGISTRATIONMULTIPLESHIFTS` | _(null)_ | Đăng ký nhiều ca |
| `HRM_ATT_ROSTER_ISALLOWAUTOGENERATEROSTERDATABASEONDATANULLDATEEND` | _(null)_ | Tự tạo roster khi DateEnd=null |
| `HRM_ATT_ISALLOWREGISTRATIONROSTERGROUP` | _(null)_ | Cho phép đăng ký roster group |
| `HRM_ATT_ISGENERATEROSTERWHENAPRROVEROSTERGROUP` | _(null)_ | Sinh roster khi duyệt group |
| `HRM_ATT_ISALLOWEDCHANGESHIFTMANYTIME` | _(null)_ | Đổi ca nhiều lần |
| `HRM_ATT_CONFIG_SHIFTCHANGEALLOWEDCONFIG` | _(null)_ | Cấu hình cho phép đổi ca |
| `HRM_ATT_CONFIG_SHIFTCHANGEALLOWEDCONFIGOPTION` | `E_WAIT_APPROVED,...` | Trạng thái đổi ca được phép |
| `HRM_ATT_CONFIG_LEAVEDAYOVERTIMEONCHANGESHIFTALLOWEDCONFI` | `E_BLOCK_OUT` | Nghỉ/OT khi đổi ca |
| `HRM_ATT_CONFIG_LEAVEDAYOVERTIMEONCHANGESHIFTALLOWEDCONFIGSTATUSOPTION` | `E_APPROVED,...` | Trạng thái cho phép |
| `HRM_ATT_SUMMARY_NotAllowChangeShiftOnRosterList` | _(null)_ | Không đổi ca trên danh sách |
| `HRM_ATT_WORKDAY_SUMMARY_ISALLOWCHANGEFLEXIBLESHIFT` | _(null)_ | Đổi ca linh hoạt |
| `HRM_ATT_ALLOWSHIFTSWAPEMP` | _(null)_ | Đổi ca giữa nhân viên |
| `HRM_ATT_REPLACEMENTSTAFFWHENCHANGINGSHIFTS` | _(null)_ | NV thay thế khi đổi ca |
| `HRM_ATT_WORKDAY_SUMMARY_ROSTER_IMPORT_TYPE` | `E_DEFAULT` | Kiểu import roster |
| `HRM_Att_WORKDAY_SUMMARY_ROSTERREREGISTER` | _(null)_ | Tái đăng ký roster |
| `HRM_ATT_WORKDAY_SUMMARY_ALLOWSHIFTCHANGEREGISTRATIONBYSHOP` | `E_ATT_GRADE` | Cho phép đổi ca theo shop |
| `HRM_ATT_WORKDAY_SUMMARY_BLOCKDIFFERENTSHIFTWHENREGISTERWORKDAY` | _(null)_ | Chặn đăng ký sai ca |
| `HRM_ATT_ONLYCANCELATIONSHIFTDATASTATUS` | `E_SUBMIT_TEMP` | Trạng thái hủy lịch ca |
| `HRM_ATT_ONLYCANCELATIONROSTERGROUPDATASTATUS` | `E_SUBMIT_TEMP` | Trạng thái hủy roster group |

### Hiển thị

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_CONFIG_ISSHOWTWOSHIFTINDAY` | `True` | Hiển thị 2 ca trong ngày |
| `HRM_ATT_CONFIG_DEFAULTMODESHOWTWOSHIFTINDAY` | `E_HIDE` | Chế độ mặc định hiển thị ca 2 |
| `HRM_ATT_WORKDAY_SUMMARY_ISSHOWSHIFT_IN_ATTMONHTLY` | `True` | Hiển thị ca trong bảng công tháng |
| `HRM_ATT_WORKDAY_SUMMARY_ISSHOWSHIFTANDOVERTIME` | _(null)_ | Hiển thị ca và OT |
| `HRM_ATT_WORKDAY_SUMMARY_ISPUBLISHED_IN_PORTALAPP` | `True` | Công bố lên portal/app |
| `HRM_ATT_SUMMARY_ISSHOWREMAINANL` | `True` | Hiển thị phép còn lại |
| `HRM_ATT_WORKDAY_SUMMARY_COLORFIELDTYPEINCOMPUTEWORKDAY` | `#ccffcc` | Màu loại ngày |
| `HRM_ATT_WORKDAY_SUMMARY_COLORFIELDDAYOFFSYMBOL` | `#96d28b` | Màu ký hiệu ngày nghỉ |
| `HRM_ATT_WORKDAY_SUMMARY_DISPLAYCOLORFORDATEWITHINVALIDNOTE` | `#ffff99` | Màu ngày có ghi chú lỗi |
| `HRM_ATT_CONFIG_DAYOFFSYMBOL` | `OFF` | Ký hiệu ngày nghỉ |
| `HRM_ATT_DEFAULTNAMENOSHIFT` | _(null)_ | Tên khi không có ca |
| `HRM_ATT_WORKDAY_SUMMARY_EXPORTGROUPBYORG` | _(null)_ | Xuất báo cáo theo phòng ban |
| `HRM_ATT_CONFIG_ATTENDANCETABLE_CONFIGGETDATAITEM` (alias: `HRM_ATT_ATTENDANCETABLE_CONFIGGETDATAITEM`) | _(công thức IF phức tạp)_ | Công thức hiển thị dữ liệu ô bảng công |

### Cấu hình khác

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_WORKDAY_SUMMARY_ISLAZYAPPROVE` | `True` | Lazy Approved |
| `HRM_ATT_WORKDAY_SUMMARY_ISTIMESHEET` | `False` | Bật Timesheet |
| `HRM_ATT_WORKDAY_SUMMARY_ISCOMPUTEEMPCHARGEMANYTASKS` | _(null)_ | NV đảm nhiệm nhiều task |
| `HRM_ATT_WORKDAY_SUMMARY_ISDISPLAYORGSTRUCTURECOST` | _(null)_ | Hiển thị phòng ban chi phí |
| `HRM_ATT_WORKDAY_SUMMARY_ISORGSTRUCTURECOSTID` | _(null)_ | ID phòng ban chi phí |
| `HRM_ATT_WORKDAY_SUMMARY_ISLOADDEFAULTDATE` | _(null)_ | Load ngày mặc định |
| `HRM_ATT_WORKDAY_SUMMARY_ISLOADDEFAULTUSERLOGIN` | _(null)_ | Load user đăng nhập mặc định |
| `HRM_ATT_WORKDAY_SUMMARY_ISAUTOMATICLOADDATATAMSCAN` | _(null)_ | Tự động load dữ liệu máy chấm công |
| `HRM_ATT_GETWD_PORTALAPP` | `E_STANDAR` | Cách lấy ngày công cho portal/app |
| `HRM_ATT_WORKDAY_SUMMARY_SENDMAILTYPE` | _(null)_ | Loại email gửi thông báo |
| `HRM_ATT_CONFIG_RIGHTEOUSHOURSOFTHEDAY` | `E_DailyTask` | Giờ hợp lệ trong ngày |
| `HRM_ATT_WORKDAY_SUMMARY_PROCESSPARTICIPATECOMPUTEWORKDAY` | `8` | Số process song song tính công |
| `HRM_ATT_ISCHECKSTDWORKHOURSLIMIT` | _(null)_ | Kiểm tra giờ chuẩn |
| `HRM_ATT_CONFIG_IS_ALLOW_REGISTER_TIMESHHET_IN_PORTAL` | `True` | Cho phép đăng ký timesheet trên portal |

---

## Tab 2 — Kết nối DB máy chấm công (`Sys_ConfigDB`)

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_DATABASETYPE` | `E_SQL` | Loại DB kết nối |
| `HRM_ATT_CONFIG_AUDIT_SERVERNAME` | _(null)_ | Server DB1 |
| `HRM_ATT_CONFIG_AUDIT_USERNAME` | _(null)_ | Username DB1 |
| `HRM_ATT_CONFIG_AUDIT_PASSWORD` | _(null)_ | Password DB1 |
| `HRM_ATT_CONFIG_AUDIT_DBNAME` | _(null)_ | Database DB1 |

> Ngoài ra có các key dạng `AttServerName1`, `AttTableName1`... map qua `Sys_AllSetting` với pattern tương tự.  
> Key tải dữ liệu: `HRM_ATT_TAM_LOADDATA`, `HRM_ATT_TAMSCANLOG_LOADDATA_ISCONVERT`

---

## Tab 3 — Tăng ca (`Att_Overtime`)

### Ca đêm

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_OT_NIGHTSHIFTFROM` | `4/1/2025 10:00:00 PM` | Giờ bắt đầu ca đêm (22:00) |
| `HRM_ATT_OT_NIGHTSHIFTTO` | `4/1/2025 6:00:00 AM` | Giờ kết thúc ca đêm (06:00) |
| `HRM_ATT_OT_BYPERIODOFTIME` | `E_SHIFT` | Phương thức tính ca đêm |
| `HRM_ATT_OT_NIGHTSHIFTOFDAYNOTSHIFT_START` | _(null)_ | Ca đêm ngày không có ca: bắt đầu |
| `HRM_ATT_OT_NIGHTSHIFTOFDAYNOTSHIFT_END` | _(null)_ | Ca đêm ngày không có ca: kết thúc |

### Trạng thái OT

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_OT_OVERTIMESTATUS` | `E_CONFIRM` | Trạng thái phiếu OT được tính vào công |
| `HRM_ATT_OT_OVERTIMESTATUSCANCEL` | `E_SUBMIT` | Trạng thái hủy OT |
| `HRM_ATT_OT_OVERTIMESTATUSREQUESTCANCEL` | _(null)_ | Trạng thái yêu cầu hủy OT |
| `HRM_ATT_OT_OVERTIMESTATUSPROGRESSIVE` | `E_SUBMIT,E_CONFIRM,E_APPROVED` | Trạng thái OT lũy tiến |
| `HRM_ATT_OT_OVERTIMESTATUSINWORKDAY` | _(null)_ | Trạng thái OT trong ngày làm |

### Quy tắc OT

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_OT_HOLIDAYSCOMPUTE400` | `False` | OT ngày lễ tính 400% |
| `HRM_ATT_NOTAUTOREGISTERHOLIDAYLEAVE` | `False` | Không tự đăng ký nghỉ lễ |
| `HRM_ATT_OT_NOCUTOVERTIMEPASSDAY` | `False` | OT qua ngày không cắt |
| `HRM_ATT_OT_ISALLOWADDHOURWHENOTTHANTWOHOUR` | `False` | OT >2h được nghỉ thêm 30 phút |
| `HRM_ATT_OT_DONOTSPLITOTBREAKTIME` | `False` | Không tách OT theo giờ nghỉ |
| `HRM_ATT_OT_ALLOWEDTOSUBMITOTTYPE` | _(null)_ | Loại OT được phép nộp |
| `HRM_ATT_OT_ALLOWREGISTEROTWHENINMATERNITYREGIME` | `E_CHILDCARECOMPENSATION,E_LEAVE_EARLY` | Cho phép OT theo chế độ thai sản |
| `HRM_ATT_OT_ISNOTALLOWOTINPREGNANCYTIME` | _(null)_ | Không cho OT khi thai sản |
| `HRM_ATT_OT_ISALLOWREGISTEROTMULTIDAYS` | _(null)_ | Đăng ký OT nhiều ngày |
| `HRM_ATT_OT_ISALLOWCUT` | `True` | Cho phép tách tăng ca |
| `HRM_ATT_OT_OTPERMIT_ISALLOWSPLIT` | _(null)_ | Tách giờ làm theo ngày |
| `HRM_ATT_CONFIG_ALLOW_OT_UNLIMIT_NO_SHIFT` | _(null)_ | OT không giới hạn khi không có ca |
| `HRM_ATT_CONFIG_ALLOW_CHOSE_OT_TYPE` | `True` | Cho phép chọn loại OT |
| `HRM_ATT_OT_ISREGISTERVEHICLE` | `True` | Đăng ký phương tiện OT |

### Phê duyệt OT

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_OT_DONOTAPPROVEOTMYSELF` | `True` | Không tự duyệt OT |
| `HRM_ATT_OT_ISALLOWCOMMENTAPPROVE` | _(null)_ | Ghi chú khi duyệt OT |
| `HRM_ATT_OT_ISNOTSTATUSCONFIRM` | `True` | Không cần trạng thái xác nhận |
| `HRM_ATT_CONFIG_ISHOURSCOMFIRM` | _(null)_ | Xác nhận theo giờ |
| `HRM_ATT_OT_ISALLOWEDITREGISTERHOURSWHENAPPROVEOT` | _(null)_ | Sửa giờ đăng ký khi duyệt |
| `HRM_ATT_OT_ISALLOWAPPROVEORREJECTMANYRECORDINEMAIL` | `True` | Duyệt nhiều phiếu từ email |
| `HRM_ATT_OT_ISNOTALLOWREGISTOVERTIMEINPORTAL` | `True` | Không cho đăng ký OT trên portal |
| `HRM_ATT_OT_ISNOTALLOWCONFIRMOTWHENMISSINOUT` | _(null)_ | Không xác nhận OT khi miss in/out |
| `HRM_ATT_CONFIG_NUMBER_LEAVE_APPROVE_OVERTIME` | `2` | Số ngày phép để duyệt OT |
| `HRM_ATT_OT_MINHOURSTOREGISTEDFOOD` | _(null)_ | Số giờ OT để đăng ký suất ăn |

### Công thức / Làm tròn OT

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_OT_COMPUTE_MINHOUROT` | `0.5` | Giờ OT tối thiểu để tính |
| `HRM_ATT_OT_COMPUTE_ISROUND` | `True` | Làm tròn khi tính OT |
| `HRM_ATT_OT_COMPUTE_ROUNDHOUR` | `0.5` | Đơn vị làm tròn (0.5h) |
| `HRM_ATT_CONFIG_FORMULARROUNDOTHOUR` | _(null)_ | Công thức làm tròn giờ OT |
| `HRM_ATT_CONFIG_FORMULAR_ROUND_CONFIRM_HOUR` | _(null)_ | Công thức làm tròn giờ xác nhận |
| `HRM_ATT_OT_FORMULACANCELOTPAST` | _(null)_ | Công thức hủy OT quá khứ |
| `HRM_ATT_OT_FORMULAPREVENTOTPAST` | _(null)_ | Công thức ngăn đăng ký OT quá khứ |
| `HRM_ATT_OT_FOMULARCOMPUTEOTFROMTIMEREX` | _(null)_ | Công thức tính OT từ TimeRex |
| `HRM_ATT_CONFIG_IS_USE_FORMULA_ROUND_OVERTIME` | _(null)_ | Dùng công thức làm tròn |
| `HRM_ATT_CONFIG_IS_USE_FORMULA_MIN_OVERTIME` | _(null)_ | Dùng công thức giờ OT tối thiểu |
| `HRM_ATT_CONFIG_FORMULA_ROUND_OVERTIME` | _(null)_ | Công thức làm tròn OT |

### Phiếu tăng ca (OT Form)

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_Att_OT_Config_OTForm_MinNumberOfOvertimeRegisteredToEat` | `0` | Số giờ OT tối thiểu để đăng ký ăn |
| `HRM_Att_OT_Config_OTForm_AllowImportOfApprovalNotes` | _(null)_ | Import ghi chú phê duyệt |
| `HRM_Att_OT_Config_OTForm_WarningOvertimeVouchersWhileEnjoyingTheRegime` | _(null)_ | Cảnh báo OT khi hưởng chế độ |
| `HRM_Att_OT_Config_OTForm_BlockOvertimeVouchersWhileEnjoyingTheRegime` | _(null)_ | Chặn OT khi hưởng chế độ |
| `HRM_Att_OT_Config_OTForm_OnlyForCancelingOvertimeVouchersInStatus` | `E_SUBMIT` | Chỉ hủy OT ở trạng thái này |
| `HRM_Att_OT_Config_OTForm_OnlyForSubmitCancelingOvertimeVouchersInStatus` | `E_APPROVED` | Chỉ yêu cầu hủy OT ở trạng thái này |
| `HRM_Att_OT_Config_OTForm_NumberOfDaysBlockingRegistrationOfOTTicketsInThePast` | _(null)_ | Số ngày chặn đăng ký OT quá khứ |
| `HRM_Att_OT_Config_OTForm_NumberOfDaysBlockingOTCancellationInThePast` | _(null)_ | Số ngày chặn hủy OT quá khứ |
| `HRM_Att_OT_Config_OTForm_ColorOTFormBlocked` | _(null)_ | Màu phiếu OT bị chặn |
| `HRM_Att_OT_Config_OTForm_ColorOTFormWarned` | _(null)_ | Màu phiếu OT cảnh báo |
| `HRM_Att_OT_Config_OTForm_NumberOfDaysBefore` | `0` | Số ngày trước |

---

## Tab 4 — Nghỉ phép (`Att_Leave`)

### Phép năm

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_ANNUALLEAVE_FORMULARCONFIG` | _(null)_ | Công thức cấu hình phép năm |
| `HRM_ATT_ANNUALLEAVE_FORMULARCOMPUTE` | _(null)_ | Công thức tính phép năm |
| `HRM_ATT_ANNUALSICKLEAVE_FORMULARCONFIG` | _(null)_ | Công thức phép bệnh |
| `HRM_ATT_ANNUALSICKLEAVE_FORMULARCOMPUTE` | _(null)_ | Công thức tính phép bệnh |
| `HRM_ATT_ANNUALINSURANCELEAVE_FORMULARCONFIG` | _(null)_ | Công thức phép BHXH |
| `HRM_ATT_ANNUALINSURANCELEAVE_FORMULARCOMPUTE` | _(null)_ | Công thức tính phép BHXH |
| `HRM_ATT_ANNUALLEAVE_ALLOWFINALIZATIONHOLIDAYS` | _(null)_ | Cho phép quyết toán ngày nghỉ |
| `HRM_ATT_ANNUALDETAIL_ALLOWANALYZEANNUAL` | `True` | Phân tích phép năm (cơ chế mới) |
| `HRM_ATT_ANNUALLEAVE_ANNUALBEGINMONTHTOENDMONTH` | `False` | Phép chốt từ ngày 1–31 |
| `HRM_ATT_ANNUALLEAVE_COMPENSATELEAVETOENDMONTH` | `False` | Bù phép đến cuối tháng |
| `HRM_ATT_ANNUALLEAVE_FINALIZEREMAININGLEAVEEACHMONTH` | `False` | Chốt phép còn lại mỗi tháng |
| `HRM_ATT_ANNUALLEAVE_FINALIZEREMAININGPREGNANCYLEAVEEACHMONTH` | `False` | Chốt phép thai sản mỗi tháng |
| `HRM_ATT_ANNUALDETAIL_MONTHRESET` | `3` | Tháng reset phép năm (tháng 3) |
| `HRM_ATT_ANNUALDETAIL_ANNUALMETHOD` | `E_PROGRESS` | Phương thức tính phép |
| `HRM_ATT_CONFIG_ANL_MONTHBEGINYEAR` | _(null)_ | Tháng bắt đầu năm phép |
| `HRM_ATT_CONFIG_ANL_DAYBEGIN_FULLMONTH` | _(null)_ | Ngày bắt đầu tháng đầy đủ |
| `HRM_ATT_CONFIG_ANL_SENIOR_MONTH` | `60` | Số tháng thâm niên tăng phép |
| `HRM_ATT_CONFIG_ANL_DAY_PER_MONTH` | _(null)_ | Số ngày phép/tháng |
| `HRM_ATT_CONFIG_ANL_ROUND_UP` | _(null)_ | Quy tắc làm tròn phép |
| `HRM_ATT_CONFIG_MONTH_INYEAR_TO_COMPUTE_SENIOR` | `60` | Số tháng/năm để tính thâm niên |
| `HRM_ATT_ANNUALDETAIL_NOTALLOWCOMPUTESMALLERTHANZERO` | `True` | Không cho âm nghỉ bù |
| `HRM_ATT_ANNUALLEAVE_DISSOLVEANNUALLEAVE` | `True` | Giải thể phép năm |
| `HRM_ATT_SUMMARY_ISUSINGANNUALSETTLEMENT` | _(null)_ | Dùng quyết toán phép năm |

### Trạng thái nghỉ phép

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_ANNUALDETAIL_LEAVEDAYSTATUS` | `E_APPROVED` | Trạng thái phiếu nghỉ tính vào công |
| `HRM_ATT_ANNUALDETAIL_LEAVEDAYSTATUSCANCEL` | `E_SUBMIT` | Trạng thái hủy phiếu nghỉ |
| `HRM_ATT_ANNUALDETAIL_LEAVEDAYSTATUSREQUESTCANCEL` | `E_APPROVED` | Trạng thái yêu cầu hủy nghỉ |
| `HRM_ATT_LEAVEDAY_MULTIPLELEAVEDDAYTYPE` | _(null)_ | Nhiều loại nghỉ cùng lúc |
| `HRM_ATT_LEAVEDAY_MULTIPLELEAVEFUNDS` | `E_AnnualLeave` | Nhiều quỹ nghỉ |
| `HRM_ATT_ANNUALDETAIL_LEAVEDAYBUSSINESSSTATUS` | `E_APPROVED` | Trạng thái nghỉ công tác |
| `HRM_ATT_CONFIG_LEAVEDAYTYPECODEALLOWREGISTERDATALOCKED` | _(null)_ | Loại nghỉ được đăng ký khi đã khóa |
| `HRM_ATT_ONLYEDITDELETEONSTATUSTEMP` | `E_LEAVEDAY,E_OVERTIMEPLAN,...` | Chỉ sửa/xóa khi ở trạng thái này |
| `HRM_ATT_TAMSCANLOGREGISTER_STATUSCANCEL` | _(null)_ | Trạng thái hủy đăng ký quẹt thẻ |
| `HRM_ATT_TAMSCANLOGREGISTER_STATUSREQUESTCANCEL` | _(null)_ | Trạng thái yêu cầu hủy quẹt thẻ |
| `HRM_ATT_ROSTER_STATUSCANCEL` | `E_SUBMIT_TEMP` | Trạng thái hủy roster |
| `HRM_ATT_LEAVEDAYBUSINESSTRAVEL_STAUTSCANCEL` | `E_SUBMIT` | Trạng thái hủy phiếu nghỉ công tác |
| `HRM_ATT_BIZTRIPALLOWEDREQUEST_STATUSCANCEL` | _(null)_ | Trạng thái cho phép hủy công tác |

### Đăng ký nghỉ

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_ATT_LEAVE_CONDITIONSOFAPPROVEORREJECTLEAVEDAY` | _(null)_ | Điều kiện duyệt/từ chối nghỉ |
| `HRM_ATT_CONFIG_CONDITIONSOFREGISTRACTION` | _(null)_ | Điều kiện đăng ký nghỉ |
| `HRM_ATT_CONFIG_ISBLOCKWARNINGCONDITIONSOFREGISTRACTION` | `E_BLOCK_OUT` | Block/Warning khi vi phạm điều kiện |
| `HRM_ATT_OT_ISNOTALLOWREGISTLEAVEDAYINPORTAL` | _(null)_ | Không đăng ký nghỉ trên portal |
| `HRM_ATT_ATT_LEAVE_ISALLOWCOMMENTAPPROVE` | `True` | Ghi chú khi duyệt nghỉ |
| `HRM_ATT_CONFIG_ISROLLBACKDATALEAVEDAYWHENREJECTED` | _(null)_ | Rollback khi từ chối nghỉ |
| `HRM_ATT_ANNUALDETAIL_LEAVEDAYSPAST` | `1000` | Số ngày đăng ký nghỉ quá khứ |
| `HRM_ATT_ANNUALDETAIL_FORMULACANCELLEAVEDAYSPAST` | _(null)_ | Công thức hủy nghỉ quá khứ |
| `HRM_ATT_ANNUALDETAIL_MINUTESADJUST` | _(null)_ | Số phút điều chỉnh |
| `HRM_ATT_CONFIG_LEAVECODEALLOWCONFIRMREJECT` | _(null)_ | Mã nghỉ được xác nhận/từ chối |
| `HRM_ATT_OT_LEAVE_CLOSINGCYCLE` | `E_CURRENTMONTH` | Chu kỳ chốt phép |
| `HRM_ATT_OT_LEAVE_COMPCLOSINGCYCLE` | `E_CURRENTMONTH` | Chu kỳ chốt phép bù |
| `HRM_ATT_CONFIG_LEAVEDAYTRANSFERCYCLE` | `E_CUTOFFDURATION` | Chu kỳ chuyển phép |
| `HRM_ATT_CONFIG_LEAVEDAYTRANSFERCANCELSTATUS` | _(null)_ | Trạng thái hủy chuyển phép |
| `HRM_ATT_CONFIG_FORMULACANCELREGISTERLEAVEDAYTRANSFER` | _(null)_ | Công thức hủy chuyển phép |

---

## Tab 5 — Giới hạn tăng ca (`Att_OvertimePermit`)

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `E_ConfigAllowOTLimit` | `True` | **Kích hoạt giới hạn OT** |
| `E_ConfiOTAllowPosition` | _(null)_ | Giới hạn theo vị trí |
| `HRM_ATT_OT_ISCUMULATIVEMONTH` | `True` | Tích lũy OT theo tháng |
| `HRM_ATT_OT_APPLYOVERTIMEPLAN` | `True` | Áp dụng kế hoạch OT |
| `HRM_ATT_OT_OTPERMIT_ISOVERTIMELIMITBYYEARFINNANCE` | _(null)_ | Giới hạn theo năm tài chính |
| `HRM_ATT_OT_OTPERMIT_LIMITHOUR_BYDAY` | `12` | Giới hạn OT/ngày (giờ) |
| `HRM_ATT_OT_OTPERMIT_LIMITHOUR_BYWEEK` | `40` | Giới hạn OT/tuần |
| `HRM_ATT_OT_OTPERMIT_LIMITHOUR_BYMONTH` | `40` | Giới hạn OT/tháng |
| `HRM_ATT_OT_OTPERMIT_LIMITHOUR_BYYEAR` | `200` | Giới hạn OT/năm (luật: 200h) |
| `HRM_ATT_OT_OTPERMIT_LIMITCOLOR` | `#ffff99` | Màu cảnh báo mức cơ bản |
| `HRM_ATT_OT_OTPERMIT_LIMITCOLOR_LEV1` | `#f4c6c8` | Màu mức 1 |
| `HRM_ATT_OT_OTPERMIT_LIMITCOLOR_LEV2` | `#ffff99` | Màu mức 2 |
| `HRM_ATT_OT_OTPERMIT_LIMITCOLOR_LEV3` | `#f10420` | Màu mức 3 |
| `HRM_ATT_OT_OTPERMIT_ISALLOWOVERLIMIT_NORMAL` | `True` | Áp dụng xử lý khi vượt trần thường |
| `HRM_ATT_OT_OTPERMIT_ISALLOWOVERLIMIT_NORMAL_LEV1` | `True` | Áp dụng xử lý mức 1 |
| `HRM_ATT_OT_OTPERMIT_ISALLOWOVERLIMIT_NORMAL_LEV2` | `True` | Áp dụng xử lý mức 2 |
| `HRM_ATT_OT_OTPERMIT_ISALLOWOVERLIMIT_NORMAL_LEV3` | `True` | Áp dụng xử lý mức 3 |
| `HRM_ATT_OT_OTPERMIT_WARNINGTYPE` | `E_WARNING` | Kiểu xử lý khi vượt trần |
| `HRM_ATT_OT_OTPERMIT_WARNINGTYPE_LEV1` | `E_BLOCK` | Kiểu xử lý mức 1 |
| `HRM_ATT_OT_OTPERMIT_WARNINGTYPE_LEV2` | `E_BLOCK` | Kiểu xử lý mức 2 |
| `HRM_ATT_OT_OTPERMIT_WARNINGTYPE_LEV3` | `E_WARNING` | Kiểu xử lý mức 3 |
| `HRM_ATT_OT_OTPERMIT_COMPARECOLOR` | `#fff0f5` | Màu so sánh OT |
| `HRM_ATT_OT_OTPERMIT_COMPARECONFIRMHOURSSMALLERAPPROVEDHOURSCOLOR` | `#f0ffff` | Màu khi giờ xác nhận < giờ duyệt |
| `HRM_ATT_OT_OTPERMIT_COMPARECONFIRMHOURSGREATERAPPROVEDHOURSCOLOR` | `#f0fff0` | Màu khi giờ xác nhận > giờ duyệt |
| `HRM_ATT_OT_OTPERMIT_NIGHTSHIFTWHILEINMATERNITY` | `E_BLOCK_OUT` | Ca đêm khi thai sản |
| `HRM_ATT_WORKHOUR_LIMITHOUR_BYDAY` | `12` | Giới hạn giờ làm/ngày |
| `HRM_ATT_WORKHOUR_LIMITHOUR_BYDAY_WARNINGTYPE` | `E_WARNING` | Kiểu cảnh báo giờ làm |

---

## Tab 6 — Công tác (`Att_BusinessTrip`)

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_WORKDAY_SUMMARY_ISBUSINESSTRAVELDATAV2` | _(null)_ | Dùng nghiệp vụ công tác V2 |
| `HRM_ATT_CONFIG_ISALLOWREGISTBUSSINESSTRAVELINDAYOFF` | _(null)_ | Đăng ký công tác ngày nghỉ |
| `HRM_ATT_BUSSINESSTRAVEL_BUSSINESSTRIPSTATUSSAVEINTAMSCANAPP` | _(null)_ | Trạng thái công tác lưu vào app |
| `HRM_ATT_BUSSINESSTRAVEL_BUSSINESSTRIPTYPESAVEINTAMSCANAPP` | _(null)_ | Loại công tác lưu vào app |
| `HRM_ATT_BUSSINESSTRAVEL_WARNINGREQUESTWHENHAVINGBENIFIT` | `E_CHILDCARECOMPENSATION,E_LEAVE_EARLY` | Cảnh báo đăng ký công tác khi có chế độ |
| `HRM_ATT_BUSSINESSTRAVEL_BLOCKREQUESTWHENHAVINGBENIFIT` | `E_MATERNITY_UP_7MONTHS` | Chặn đăng ký công tác khi có chế độ |
| `HRM_ATT_CONFIG_ISALLOWCOMMENTAPPROVEBUSINESSTRAVEL` | _(null)_ | Ghi chú khi duyệt công tác |
| `HRM_ATT_CONFIG_ISSHOWACTUALCOSTBUSINESSTRAVEL` | _(null)_ | Hiển thị chi phí thực khi tạo |
| `HRM_Att_Leave_BusinessTripScope` | _(null)_ | Phạm vi công tác tính công |
| `HRM_ATT_ANNUALDETAIL_FORMULACANCELBUSINESSPAST` | _(null)_ | Công thức hủy công tác quá khứ |
| `HRM_ATT_OT_ISNOTALLOWREGISTLEAVEDAYBUSINESSTRAVELINPORTAL` | _(null)_ | Không đăng ký công tác trên portal |
| `HRM_ATT_CONFIG_ONLYALLOWEDCANCELTRAVELTIMEREQUESTHAVINGSTATUS` | `E_APPROVED` | Chỉ hủy khi ở trạng thái này |
| `HRM_ATT_CONFIG_TRAVELTIMEREQUESTHASSTATUS` | `E_APPROVED` | Trạng thái đăng ký công tác |
| `HRM_ATT_CONFIG_ALLOWEDINPUTAPPROVALNOTETRAVELTIMEREQUEST` | _(null)_ | Nhập ghi chú phê duyệt |
| `HRM_ATT_CreateManyInOneDayRegisVehicleBusinessTravel` | `E_Block` | Tạo nhiều phương tiện 1 ngày |
| `HRM_ATT_IsNotAllowRegisVehicleBusinessTravel` | _(null)_ | Không đăng ký phương tiện |
| `HRM_ATT_lstStatusCancelRegisVehicleBusinessTravel` | _(null)_ | Trạng thái hủy đăng ký phương tiện |
| `HRM_ATT_lstStatusRequestRegisVehicleBusinessTravel` | _(null)_ | Trạng thái yêu cầu phương tiện |
| `HRM_ATT_lstStatusCountedRegisVehicleBusinessTravel` | _(null)_ | Trạng thái tính phương tiện |
| `HRM_ATT_WarnRegisVehicleBusinessTravelProgram` | _(null)_ | Cảnh báo đăng ký phương tiện |
| `HRM_ATT_BlockRegisVehicleBusinessTravelProgram` | _(null)_ | Chặn đăng ký phương tiện |
| `HRM_ATT_FormularBlockRegisVehicleBusinessTravel` | _(null)_ | Công thức chặn phương tiện |
| `HRM_ATT_CONFIG_ACCUMULATIONPAYMENTMETHOD` | `E_CASHOUT` | Phương thức thanh toán tích lũy |
| `HRM_ATT_BLOCKEMPLOYEEDATABYBUSINESS` | _(null)_ | Chặn nhân viên theo loại nghiệp vụ |
| `HRM_ATT_ALLOWREGISTERDATABYBUSINESS` | _(null)_ | Cho phép đăng ký theo loại nghiệp vụ |

---

## Tab 7 — Kiểm soát (`Att_ConfigAudit`)

| Key | Value thực tế | Mô tả |
|-----|--------------|-------|
| `HRM_ATT_CONFIG_AUDIT_ISCHANGESHIFT` | _(null)_ | Bật kiểm soát đổi ca |
| `HRM_ATT_CONFIG_AUDIT_ISCUTTINGBYWORKDATECONFIRM` | _(null)_ | Cắt OT theo ngày công xác nhận |
| `HRM_ATT_CONFIG_AUDIT_ALLOCATEOVERTIMEBY` | _(null)_ | Phân bổ OT theo |
| `HRM_ATT_CONFIG_AUDIT_TYPEOFSHIFT` | _(null)_ | Loại ca kiểm soát |
| `HRM_ATT_CONFIG_AUDIT_CUTTINGINOUTBY` | _(null)_ | Cắt in/out theo |
| `HRM_ATT_CONFIG_AUDIT_SERVERNAME` | _(null)_ | Server DB audit |
| `HRM_ATT_CONFIG_AUDIT_USERNAME` | _(null)_ | Username audit |
| `HRM_ATT_CONFIG_AUDIT_PASSWORD` | _(null)_ | Password audit |
| `HRM_ATT_CONFIG_AUDIT_DBNAME` | _(null)_ | Database audit |
| `HRM_ATT_CONFIG_OVERITME_ISALLOWVALIDATIONINVALIDOVERTIMEDATA` | _(null)_ | Validate dữ liệu OT không hợp lệ |

---

## Ghi chú kỹ thuật

- Key trong `Sys_AllSetting.Name` — **phân biệt hoa thường** khi query
- Một số key bị duplicate row (nhiều UserID khác nhau) — system lấy row theo UserID hoặc row đầu tiên
- Giá trị Enum thường có prefix `E_` (ví dụ `E_APPROVED`, `E_SUBMIT`, `E_BLOCK_OUT`)
- Key `_(null)_` = chưa được thiết lập (dùng giá trị default trong code)
- Export/Import cấu hình qua JSON: `Sys_AttendanceConfig_Create.json`
