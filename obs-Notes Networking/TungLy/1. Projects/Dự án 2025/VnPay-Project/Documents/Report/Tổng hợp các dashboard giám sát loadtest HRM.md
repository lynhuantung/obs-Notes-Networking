---
Mã: rpt-02
Tiêu đề: báo cáo test tải
Related:
tags:
  - "#brainStorming"
  - "#report"
  - "#grafana"
  - "#load-test"
Project: "[[Dự án VnPay]]"
date: 2026-02-07
Người tạo: Tester VnPay
---
**Tổng hợp các dashboard giám sát loadtest HRM**

**1. Đánh giá sơ bộ**

- Tài nguyên ứng dụng

+ Thời điểm loadtest, tài nguyên của ứng dụng RAM, CPU của các service không có tăng cao vượt ngưỡng

+ Trạng thái của database, redis ở ngưỡng bình thường

+ Các pod service ở trạng thái running, không bị restart

+ network, bandwith không có bất thường

- Khả năng đáp ứng của ứng dụng

+ Số lượng request bị chậm cao (chi tiết theo file đính kèm)

+ Bị chậm trên nhiều API

+ Tỉ lệ lỗi cao 7.34% (chủ yếu là do timeout)

+ Kịch bản test tải chưa có test API Identity

**2. Thông tin hệ thống ứng dụng chạy loadtest**

**- Tài nguyên được cấp phát cho hệ thống**

|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|**Service name**|**Request CPU**|**Limited CPU**|**Request RAM**|**Limited RAM**|**replicas**|**Tổng RAM Limited**|**Tổng CPU Limted**|
|hrm-presentation-empportal|1|4|2|8|4|32|16|
|hrm-presentation-hr-service|1|4|2|8|6|48|24|
|hrm-presentation-system-service|1|2|2|4|4|16|8|
|hrm-presentation-main|1|2|1|8|6|48|12|
|hrm-sc-service-apicore|1|4|1|8|6|48|24|
|integration-service-apicore|1|2|2|4|2|8|4|
|sc-service-identity|1|4|1|8|2|16|8|
|chatapi-service|1|2|2|4|1|4|2|
|chatfe-service|1|2|2|4|1|4|2|
|apiservey-service|1|2|2|8|1|8|2|
|hrm-news-service|1|2|4|8|2|16|4|
|presentation-windows-servicecore|1|2|2|4|1|4|2|
|||||||252|108|

**- Tham số cấu hình loadtest:**

**+ Tổng số lượng thread: 100**

**+ Thời gian chạy: 30p**

**+ Số lượng user: 1**

**+ Số api test: 8**

**+ Timeout request: 30s**

**+ Thời gian bắt đầu loadtest: 12/21/25, 9:39 PM**

**+ Thời gian kết thúc Loadtest: "12/21/25, 10:10 PM"**

**3. Kết quả loadtest**
![[Pasted image 20260207103621.png]]
![[Pasted image 20260207103627.png]]
![[Pasted image 20260207103634.png]]
![[Pasted image 20260207103639.png]]
![[Pasted image 20260207103645.png]]
**4. Chi tiết thông số giám sát của hệ thống**

**4.1 Theo log ứng dụng**
![[Pasted image 20260207103657.png]]

![[Pasted image 20260207103705.png]]
![[Pasted image 20260207103711.png]]
![[Pasted image 20260207103715.png]]
![[Pasted image 20260207103719.png]]
![[Pasted image 20260207103725.png]]

![[Pasted image 20260207103730.png]]
![[Pasted image 20260207103735.png]]
![[Pasted image 20260207103739.png]]
![[Pasted image 20260207103745.png]]
![[Pasted image 20260207103750.png]]
![[Pasted image 20260207103755.png]]![[Pasted image 20260207103758.png]]
**4.2 Tài nguyên sử dụng**

**1. Tổng tài nguyên theo từng service**

Memory
![[Pasted image 20260207103812.png]]
CPU
![[Pasted image 20260207103821.png]]
Bandwith
![[Pasted image 20260207103831.png]]
Transmit bandwith
![[Pasted image 20260207103841.png]]
**2. Chi tiết tài nguyên sử dụng theo từng pod của từng service**

- hrm-presentation-empportal
![[Pasted image 20260207103854.png]]
![[Pasted image 20260207103900.png]]
![[Pasted image 20260207103903.png]]
- hrm-presentation-hr-service
![[Pasted image 20260207103919.png]]

![[Pasted image 20260207103925.png]]
![[Pasted image 20260207103930.png]]
- hrm-presentation-main
![[Pasted image 20260207103948.png]]
![[Pasted image 20260207103953.png]]
![[Pasted image 20260207103958.png]]
- hrm-presentation-system-service
![[Pasted image 20260207104010.png]]
![[Pasted image 20260207104014.png]]
![[Pasted image 20260207104019.png]]
- hrm-sc-service-apicore
![[Pasted image 20260207104033.png]]
![[Pasted image 20260207104037.png]]
![[Pasted image 20260207104042.png]]
- integration-service-apicore
![[Pasted image 20260207104055.png]]
![[Pasted image 20260207104100.png]]
![[Pasted image 20260207104104.png]]
- sc-service-identity
![[Pasted image 20260207104115.png]]
![[Pasted image 20260207104118.png]]
![[Pasted image 20260207104124.png]]

- SQL Server
![[Pasted image 20260207104136.png]]
![[Pasted image 20260207104141.png]]

![[Pasted image 20260207104145.png]]
![[Pasted image 20260207104150.png]]
- Redis master

![[Pasted image 20260207104205.png]]
![[Pasted image 20260207104210.png]]
