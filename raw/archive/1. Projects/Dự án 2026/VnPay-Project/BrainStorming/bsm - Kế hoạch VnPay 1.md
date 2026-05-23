---
Mã: BSM-1
Tiêu đề: Brain Storming 1
Related:
  - "[[0.Brain Stormings]]"
tags:
  - "#brainStorming"
Project: "[[Dự án VnPay]]"
---
**BÁO CÁO GIẢI TRÌNH NGHẼN HỆ THỐNG HRM - VNPAY**

Vấn đề : Hệ thống HRM Portal phát sinh tình trạng nghẽn và treo (trong khoảng thời gian tháng 11 – tháng 12/2025) khi số lượng lớn nhân viên truy cập đồng loạt, đặc biệt trong các đợt cao điểm cuối tháng, ảnh hưởng đến trải nghiệm và tiến độ nghiệp vụ.

**1. Tình hình tháng 11/2025**

Hệ thống HRM Portal xảy ra tình trạng **nghẽn và treo** khi khoảng **200 nhân viên truy cập đồng loạt**.

**Nguyên nhân chính:**

- Dịch vụ **Identity chưa thể mở rộng nhiều pod**, trở thành điểm nghẽn.
- Chưa phát hiện sizing tài nguyên và pod chưa phù hợp.
- **Chưa thực hiện test tải tổng thể**, do:

- Chưa có log ghi nhận thời gian xử lý nghiệp vụ, thời gian truy vấn database và pod xử lý request.
- Chưa có hệ thống giám sát tập trung để theo dõi tải và phân bổ request.

**Biện pháp tạm thời:**

- Chia nhỏ từng phòng ban truy cập portal theo khung giờ để giảm tải.

---

**2. Kết quả cải thiện tháng 12/2025**

Tình trạng nghẽn khi 200 nhân viên truy cập đồng loạt **đã được cải thiện**.

**Các công việc đã thực hiện:**

- **VnR** bổ sung log chi tiết cho từng request (pod, thời gian DB, thời gian xử lý).
- **VnR phối hợp đối tác VnPay test tải 8 API dashboard**, kết quả **tăng từ ~4 TPS lên ~11 TPS (TPS tổng số request xử lý được trong 1 giây với thời điểm đồng loạt 100 user vào cùng lúc)**.
- **Cải thiện hiệu năng 8 API dashboard** thông qua tối ưu code và cache.
- **Đối tác VnPay điều chỉnh hạ tầng**, tăng số pod và sizing cho các service tải nặng (Portal, ApiCore, HrCore, SysCore).

---

**3. Giám sát và vấn đề còn tồn tại**

- Đã triển khai **hệ thống giám sát** (Grafana và công cụ theo dõi phân bổ request).
- Ghi nhận hiện tượng **một pod tăng tải đột biến**, trong khi các pod khác còn tài nguyên, do cơ chế load balancing chưa tối ưu theo thời gian thực.
- Giám sát trước khi thay đổi => số lượng request vào APICore của 1 pod cụ thể tăng mạnh và nghẻn tại đó.
![[cbimage (16).png]]

- Giám sát sau khi thay đổi => phân bổ đều hơn
![[Pasted image 20260116083628.png]]
---

**4. Đề xuất**

**VnPay:**

- Cải thiện cơ chế phân bổ tải động:

- Pod quá tải → chuyển request sang pod khác
- Tải tăng cao → tự động scale pod
- Cao điểm cuối tháng (ngày 25–30) → chủ động tăng pod

**VnR:**

- Tiếp tục tối ưu hiệu năng các API sử dụng thường xuyên, đặc biệt trong giai đoạn cao điểm.