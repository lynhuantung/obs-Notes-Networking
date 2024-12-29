---
aliases: 
date: 2024-07-23
tags:
  - ins_map
  - BH
---
## Phân tích bảo hiểm
### Step 1: Lấy thông tin nhân viên 
	-  Thông tin nhân vien [[Thông tin nhân viên]]
Kiểm tra [[Khóa đối tượng]]
### Step 2: Thang bat đầu đóng BH (SetMonthJoinInsuranceByProfile)
	- Xác định tháng bắt đầu đóng bh

### Step 3. Kiểm tra có đóng BH (SetIsHaveInsurnceByProfileByMonth)
- Kiểm tra từ lương bhxh  có đóng (BHXH, BHYT, BHTN)
- Nghỉ thai sản [[thải sản]]
- Nghỉ việc [[nghỉ việc]]
### Step 4. Nghỉ 14 ngày (Processing14DayDatas) (loại trừ nv "thai sản", "nghỉ việc", "nv chua tham gia BH") [[Truy vết/Thành Phần BH/Nghỉ 14 ngày]]
- CheckLeave14day_56092993 (Nghỉ 14 ngay 1 nhân viên)
- SetLeave14Days (Nghỉ 14 ngay theo nhieu nhan vien)
- Calculate14DayFomular (cong thức tính nghi 14 ngay)
- CalculateWorkingDaysFomular (cong thức tính số ngày đi làm) 
- InitialzeInsuranceElements14Day(khoi tao phan tu bao hiem nghi 14)
### Step 5. tính lương BH (SetMoneyInsuranceByProfileByMonth)
- InitialzeInsuranceElements(khoi tao phan tu bao hiem)
- CalculateInsuranceSalaryByFomular (cong thức tính lương)
- GetJobNameByFomular( công thức jobname)


### Link
[[Truy vết/Thành Phần BH/Lịch sử NV]]