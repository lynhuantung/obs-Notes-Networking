---
aliases: 
date: 2024-06-27
tags:
  - "#phanquyendulieu"
  - "#phantichbaohiem"
  - "#checkbug"
---


### Xử lý phân quyền theo phòng ban và chức vụ
#### Phải phân quyền các key quyền trong nhóm quyền
- Hre_Profile
- Cat_OrgStructure
- Cat_Jobtitle


### Phân tích bảo hiểm
- case 1: tổng hợp công chỉ có 10 ngày (ca) => check đóng bh (đúng)
- case 2: vào làm ngày 14/3 và nghỉ 9 ngày => báo nghỉ 14 ngày (đúng) vì có logic tính từ đầu tháng đến ngày vào làm tính nghỉ 14 ngày
- case 3: (kỳ nghỉ việc 16-15) nghỉ việc 14/3 đã báo giảm tháng 3 và tháng 4 và cấu hình thiết lập nhân sự "số ngày tính nhân viên nghỉ việc", kết quả tháng 4 vẫn báo giảm nghỉ việc => hệ thống lấy chu kỳ nghỉ việc cộng số ngày tính nhân viên nghỉ việc