---
type: source
domain: ins
tags:
  - bao-hiem
  - HRM
  - INS
  - VnResource
created: 2015-02-21
updated: 2026-04-27
khach-hang: VnResource (nội bộ)
related:
  - "[[wiki/concepts/HRM-Modules]]"
  - "[[wiki/flows/Flow-TinhLuong-Monthly]]"
  - "[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX]]"
source: "[[1. Projects/Nghiệp vụ HRM/INS/Ins_TaiLieuBaoHiem_01]]"
---
# INS — Vấn Đề & Cấu Hình Bảo Hiểm

> **Domain**: Bảo hiểm (BHXH / BHYT / BHTN)
> **Khách hàng**: VnResource (nội bộ)
> **Ngày ghi**: 21/02/2015
> **Nội dung**: Cấu hình BH, phần tử BH (elements), các vấn đề thường gặp trong phân hệ INS

---

### Cấu hình Bảo Hiểm

![](Ins_TaiLieuBaoHiem_01_image62.png)

![](Ins_TaiLieuBaoHiem_01_image63.png)

| **Cấu hình Bảo Hiểm** |  |  |
| --- | --- | --- |
| Tên Cấu Hình | DataType | Mô Tả |
| Chu Kỳ Báo Tăng LĐ Mới | int | 16 \[Thang N-1\] -\> 15\[Thang N\] |
| Chu Kỳ Bảo Hiểm | int | 16 \[Thang N-1\] -\> 15\[Thang N\] |
| Chu Kỳ Báo Giảm LĐ Nghỉ Việc | int |  |
| Chu Kỳ Thay Đổi Lương | int | 16 \[Thang N-1\] -\> 15\[Thang N\] |
| Ngày Nghỉ Thai Sản | string | Ngày Nghỉ hoặc chứng từ |
| Không KT Dữ Liệu BH | bit | Không kt dữ liệu BH bằng lịch sử BH (đóng BH đủ 6 tháng trong 12 tháng) |
| Đếm Từ Ngày Nghỉ Việc Đến Cuối Tháng | bool | Đếm từ ngày nghỉ việc đến cuối tháng (14 ngày) |
| ~~Sử dụng công thức lương BHXH~~ | ~~bool~~ | ~~Sử dụng cthuc Lương BHXH hoặc lấy lươngBHXH~~ |
| **Có Đếm Ngày Nghỉ Để Đóng BH** | bool | Có đếm nghỉ \>=14 ngày |
| Chu Kỳ Đếm Số Ngày Nghỉ Không Lương \>=14 Ngày | int | Chu kỳ 14 ngày (vd: ngày 1 đến ngày 31) |
| Áp Dụng Theo Chế Độ Lương | bool | Có sử dụng chu kỳ nghỉ 14 ngày trong chế độ lương (dateFrom,DateEnd) |
| **Số ngày nghỉ để không đóng BH** | int | mặc định 14 ngày |
| Dữ Liệu Tính Công | bool | Đếm nghỉ \>=14 ngày dựa vào Att_Attendance |
| **Xoá Dữ liệu Khi Phân tích Bảo Hiểm** | bool | Xử Lý Nghiệp Vụ Điều Chỉnh BH - Xoá Dữ liệu Khi Phân tích Bảo Hiểm |
| Phân tích cho nhân viên nhân bản | Bool | Phân tích cho Nv đã nhân bản, |
| **Dữ liệu ngày nghỉ dựa vào** | string | Nghỉ 14 ngày, E_LeaveDay, E_WorkDay, E_InsuranceRecord |
| **Điều chỉnh bảo hiểm** |  |  |
| **Xóa lịch sử bảo hiểm khi điều chỉnh** | bool | Xử Lý Nghiệp Vụ Điều Chỉnh BH - Xoá Dữ liệu lịch sử phân tích bảo hiểm khi điều chỉnh bảo hiểm |
| **D02** |  |  |
| Xoá Dữ liệu Khi Phân tích D02TS | Bool | Xử Lý Nghiệp Vụ Điều Chỉnh BH - Xoá Dữ liệu Khi Phân tích D02TS |
| Tách BHTN khi khác mức đóng | bool | Tách BHTN khi khác mức đóng (BHXH) {Dùng cho BC D02} |
| **Phân tích BH theo đợt** | bool | \- Khi tính toán điều chỉnh bảo hiểm -\> Lưu thêm vào báo cáo D02V2. \- Sử dụng cho chức năng phân tích bảo hiểm. |
| Thay đổi pháp nhân theo | string | \- Khi phân tích D02, 2 tháng liền kề không phải là đổi nơi đóng bảo hiểm sẽ xử lý thay đổi pháp nhân theo(công ty, cấp phòng ban công ty, cấp phòng ban chi nhánh). \- Sử dụng cho chức năng phân tích tất báo cáo D02. |
| **Khác** |  |  |
| Chu kỳ C70A (từ) | Int | 16 \[Thang N-1\] -\> 15\[Thang N\] |
| Chu kỳ C70A (đến) | int | 16 \[Thang N-1\] -\> 15\[Thang N\] |
| Không làm mới thông tin khi "Lưu và tạo mới" chứng từ | bool | khi bấm nút lưu và tạo mới sẽ không làm mới tất cả các field (ngoại trừ tên nhân viên) |

###  Phần Tử Bảo Hiểm

| **Phần Tử Bảo Hiểm** |  |  |
| --- | --- | --- |
| Mã Phần Tử | Tên Phần Tử | Mô Tả |
| **Tên công việc** |  |  |
| INS_SAL_BASICSALARY_JOBLEVEL | ------------------- Hệ số cấp bậc chức danh -- ---------------- ------------------- | Sal_BasicSalary.JobLevel (với \[Sal_BasicSalary.Status = "E_APPROVED"\]) |
| **INS_JOBNAME_JOBTITLE** | Chức Danh | Tên Công Việc (Cat_JobTitle.**JobTitleNameInLaw**) |
| **INS_JOBNAME_POSITION** | --------- Chức Vụ ------ -- --------- | Tên Công Việc (Cat_Position.**PositionNameInLaw**) |
| --- | --- | --- |
| INS_JOBNAME_NAMEOFRANK | Name Of Rank |  |
| INS_JOBNAME_HDTGROUPNAME | -------------------- Tên Nhóm Công Việc Nặng Nhọc -- ----------------- -------------------- | Honda |
| INS_JOBNAME_ORGSTRUCTURENAME | Tên Phòng Ban Cha |  |
| **Tính lương BHXH** |  |  |
| ATT_WORKDAY_HDTJOB_4 | Số ngày công làm HDT Job Loại 4 (tháng N) | Honda |
| ATT_WORKDAY_HDTJOB_5 | Số ngày công làm HDT Job Loại 5 (tháng N) | Honda |
| HR_START_DATE_HDTJOB | Ngày vào làm HDT Job trong kỳ tính lương | Honda |
| HR_END_DATE_HDTJOB | Ngày kết thúc HDT Job trong kỳ tính lương | Honda |
| ATT_CUTOFFDURATION_MONTH | Tháng tính lương |  |
| **INS_SALARY_INSURANCE_ROOT** | Lương đóng bảo hiểm gốc | Lương BHXH mới nhất so với kỳ BH (Sal_InsuranceSalary.InsuranceAmount) |
| INS_SALARY_INSURANCE_SENIORYEAR | Năm thâm niên | Tháng tính BH -- tháng bắt đầu đóng BH (profile.SocialInsDateReg) =\> số năm thâm niên (lấy phần nguyên) |
| INS_CAT_SALARYRANK_RATE | ------------------ Hệ số bậc lương chi tiết -- --------------- ------------------ | Cat_SalaryRank.**Rate** (chứa rankRateID trong Sal_BasicSalary với \[Sal_BasicSalary.Status = "E_APPROVED"\] ) |
| INS_JOBNAME_HDTJOBMONEY | Tiền công việc nặng nhọc | Honda |
| INS_JOBNAME_NUMDAYNONHDTJOB | Số ngày không làm việc HDTJob | Honda |
| INS_HDT4_TIMELINE | Số tiền HDT4 theo timeline | Honda |
| INS_HDT5_TIMELINE | Số tiền HDT5 theo timeline | Honda |
| INS_ALLOWANCE_AMOUNT1 | Số tiền Phụ Cấp 1 | Lấy 15 phụ cấp trong lương cơ bản (các cột Sal_BasicSalary. [E_AllowanceAmount]{.mark} ...) **Note**: lương cơ bản có ngày hiệu lực trước ngày cuối tháng kiểm tra và trạng thái là E_APPROVED |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT2                                | Số tiền Phụ Cấp 2              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT3                                | Số tiền Phụ Cấp 3              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT4                                | Số tiền Phụ Cấp 4              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT5                                | Số tiền Phụ Cấp 5              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT6                                | Số tiền Phụ Cấp 6              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT7                                | Số tiền Phụ Cấp 7              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT8                                | Số tiền Phụ Cấp 8              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT9                                | Số tiền Phụ Cấp 9              |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT10                               | Số tiền Phụ Cấp 10             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT11                               | Số tiền Phụ Cấp 11             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT12                               | Số tiền Phụ Cấp 12             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT13                               | Số tiền Phụ Cấp 13             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT14                               | Số tiền Phụ Cấp 14             |                                       |
+------------------------------------------------------+--------------------------------+                                       |
| INS_ALLOWANCE_AMOUNT15                               | Số tiền Phụ Cấp 15             |                                       |
| PC1 | Mã phụ cấp [động]{.mark} trong lương cơ bản | Sal_BasicSalary.Status = "**E_APPROVED**" . Sal_BasicSalary.AllowanceType1ID \- AllowanceType1ID dựa vào Cat_UsualAllowance.Code (vd: PC1) |
| --- | --- | --- |
| PC2 | Mã phụ cấp [động]{.mark} trong lương cơ bản | Sal_BasicSalary.Status = "E_APPROVED" . Sal_BasicSalary.AllowanceType2ID \- AllowanceType1ID dựa vào Cat_UsualAllowance.Code (vd: PC2) |
| [INS_SALARY_INSURANCE_ALLOWANCE1]{.mark} | PC1 của Lương BHXH | Sal_InsuranceSalary.Allowance1 (sau khi phân tích lương BHXH sẽ có dữ liệu này \[Sakurai\]) |
| [INS_SALARY_INSURANCE_ALLOWANCE]{.mark}2 | PC2 của Lương BHXH | Sal_InsuranceSalary.Allowance2(sau khi phân tích lương BHXH sẽ có dữ liệu này \[Sakurai\]) |
| [INS_SALARY_INSURANCE_ALLOWANCE]{.mark}3 | PC3 của Lương BHXH | Sal_InsuranceSalary.Allowance3(sau khi phân tích lương BHXH sẽ có dữ liệu này \[Sakurai\]) |
| [INS_SALARY_INSURANCE_ALLOWANCE]{.mark}4 | PC4 của Lương BHXH | Sal_InsuranceSalary.Allowance4(sau khi phân tích lương BHXH sẽ có dữ liệu này \[Sakurai\]) |
| \[PC_DieuChinh\] (mã tuỳ chỉnh) | Mã phụ cấp phát sinh (Cat_UnusualAllowanceCfg.Code) | Lấy phụ cấp theo nhân viên (Sal_UnusualAllowance.Amount) Với mã phụ cấp (Cat_UnusualAllowanceCfg.Code) : Sal_UnusualAllowance.UnusualEDTypeID = Cat_UnusualAllowanceCfg.ID (điều kiện lấy phụ cấp : ngày bắt đầu pc trước(hoặc bằng) ngày kết thúc chu kỳ lương của bh && ngày kết thúc pc phải sau(hoặc bằng) ngày bắt đầu chu kỳ lương (lấy giao kỳ PC và kỳ lương BH) |
| **Nghỉ 14 ngày** |  |  |
| \[INS_14DAYS_INSURANCE_STDWORKDAYCOUNT\] | Công chuẩn (ngày) | Att_AttendanceTable.StdWorkDayCount |
| \[INS_14DAYS_INSURANCE_REALWORKDAYCOUNT\] | Công thực tế (ngày) | Att_AttendanceTable.RealWorkDayCount (sau tính công hoặc import công sẽ có dữ liệu này) |
| \[INS_14DAYS_INSURANCE_PAIDWORKDAYCOUNT\] | Công tính lương (ngày) | Att_AttendanceTable.PaidWorkDayCount |
| \[INS_14DAYS_INSURANCE_TOTALUNPAIDLEAVEDAYNOTSHIFT\] | Tổng số ngày nghỉ (không ca) | Đếm số ngày nghỉ trong Att_Leaveday theo chu kỳ nghỉ 14 ngày (Att_Leaveday.DateEnd - Att_Leaveday.DateStart): Att_Leaveday.LeavedayType =\> Cat_LeaveDayType.PaidRate = 0 |
| \[INS_PROFILE_COMPARE_DATEEND_PROBATION\] | Có thử việc trong kỳ tăng LĐ mới | Kiểm tra NV có DateEndProbation và DateHire nằm trong chu kỳ tăng LĐ |
| Lưu ý: các mã phần tử không được có khoảng trắng |  |  |

###  Các Vấn Đề BH Thường Gặp

1.  Phân tích BH

| **Lỗi Thường Gặp BHXH** |  |  |
| --- | --- | --- |
| Mã Phần Tử | Tên Phần Tử | Mô Tả |
| Err_001 | **Chức danh theo luật không thể để trống** | Xem lại danh mục \>\> chức danh, không được để trống chức danh theo luật |
| Err002 | **Chức vụ theo luật không thể để trống** | Xem lại danh mục \>\> chức vụ, không được để trống chức vụ theo luật |
| Err003 | **Chưa tổng hợp công** | Tổng hợp công tháng chọn trước khi phân tích bảo hiểm |
| Err004 | **công thức lương BH không thể parse** | Xem lại công thức bảo hiểm trong chế độ lương |
| Err005 | **Công thức tên công việc không thể parse do tên theo luật bị null** | tên theo luật không thể để trống |
| Err006 | **Currency VND / USD not found** | Tiền tệ (Cat_Currency) đã chỉnh sửa tiền tệ, trong khi lương BHXH vẫn tham chiếu tiền tệ cũ |
| Err007 | **Employee Code \[00121\]. ElementList : INS_SALARY_INSURANCE_ROOT : 8000000 , Formular : \[Ele1\]+\[Ele2\]+\[Ele3\]+\[INS_SALARY_INSURANCE_ROOT\]** | Cấu hình công thức sai \[Ele1\]+\[Ele2\]+\[Ele3\] không tồn tại |
| Err008 | **Nơi đóng bảo hiểm không thể để trống** | Nơi đóng bảo hiểm không thể để trống trong màn hình chỉnh sửa nhân viên |
| --- 
---

## Lỗi thường gặp / Bug đã gặp

| Triệu chứng | Root cause | Cách fix |
|-------------|-----------|---------|
| | | |

---

## Văn bản pháp lý / Căn cứ

- **Luật / Nghị định**: Luật BHXH 2014 (sửa đổi 2019)
- **Thông tư**:
- **Hiệu lực từ**: 

---

## Ghi chú thêm / Lessons Learned

- 

---

## Liên kết

- [[wiki/sources/INS-C70-TinhLuong]]
- [[wiki/sources/INS-InsuranceMonthJoin]]
- [[wiki/flows/Flow-KhaiBaoiBHXH]]

---
## 🔗 Xem thêm

[[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/00-INDEX|⬆ INDEX — Tài Liệu Bảo Hiểm 01]]

- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/01-gioi-thieu|Giới Thiệu & Từ Viết Tắt]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/02-mindmap|Sơ Đồ Mindmap]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/03-nghiep-vu-bieu-mau|Nghiệp Vụ & Biểu Mẫu BH]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/04-chuoi-gia-tri|Chuỗi Giá Trị (Lean Production)]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/05-database|Cấu Trúc Database]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/06-uml|Mô Hình UML & Activity Diagram]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/07-bao-cao-dong|Báo Cáo Động]]
- [[1. Projects/Nghiệp vụ HRM/INS/tailieubaohiem_01/09-bieu-do-code|Biểu Đồ Code (Kỹ Thuật)]]
