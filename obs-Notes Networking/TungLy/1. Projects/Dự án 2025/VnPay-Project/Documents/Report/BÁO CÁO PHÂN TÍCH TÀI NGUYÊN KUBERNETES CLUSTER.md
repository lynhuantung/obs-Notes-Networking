---
Mã: rpt-01
Tiêu đề: Report Kubernetes cluster
Related:
tags:
  - "#brainStorming"
  - "#report"
  - "#grafana"
  - "#load-test"
Project: "[[Dự án VnPay]]"
---
Dưới đây là **báo cáo phân tích kỹ thuật** dựa **trực tiếp trên dashboard đã được lọc theo namespace HRM (`hrm-vnr-pilot`)**, viết theo **chuẩn tài liệu giải trình**, có **số liệu cụ thể + phân tích + kết luận rõ ràng**.  
Anh có thể **đưa nguyên văn vào báo cáo**.

---

# BÁO CÁO PHÂN TÍCH TÀI NGUYÊN

## Namespace: **hrm-vnr-pilot**

**Thời gian quan sát:** 6 giờ gần nhất  
**Phạm vi:** Chỉ các pod thuộc namespace HRM  
**Mục tiêu:** Đánh giá việc sử dụng tài nguyên của HRM và xác định liệu hiệu năng hệ thống HRM có bị ảnh hưởng bởi hạ tầng Kubernetes hay không.
![[Pasted image 20260105173913.png]]
---

## 1. Tổng quan quy mô HRM trên cluster

|Chỉ tiêu|Giá trị|
|---|---|
|Namespace HRM|`hrm-vnr-pilot`|
|Số pod HRM đang chạy|**59 pods**|
|Tổng node cluster|384|
|Tổng pod toàn cluster|9.227|

### Nhận định

- HRM chỉ chiếm **~0.64% tổng số pod** toàn cluster.
    
- Quy mô HRM **nhỏ so với tổng cluster**, không phải workload chiếm ưu thế.
    

---

## 2. Global CPU Usage (đã lọc HRM)

### Số liệu

|Chỉ số|Giá trị|
|---|---|
|CPU Real|**5.43%**|
|CPU Requests|**22.7%**|
|CPU Limits|**38.9%**|

### Phân tích

- CPU sử dụng thực tế thấp.
    
- Requests và Limits cao hơn nhiều so với Real → **CPU được cấp dư so với nhu cầu thực tế**.
    

### Kết luận

👉 **HRM không thiếu CPU**.  
👉 Không có dấu hiệu nghẽn CPU do hạ tầng.

---

## 3. CPU Usage – Thống kê chi tiết

|Chỉ số|Giá trị|
|---|---|
|CPU sử dụng thực tế|**412 cores**|
|CPU Requests|**2292 cores**|
|CPU Limits|**3959 cores**|
|Tổng CPU cluster|**10.156 cores**|

### Phân tích

- HRM sử dụng CPU rất thấp so với tổng khả năng cluster.
    
- CPU cluster dư thừa lớn.
    

### Kết luận

👉 CPU **không phải nguyên nhân gây chậm HRM**.

---

## 4. Global RAM Usage (đã lọc HRM)

### Số liệu

|Chỉ số|Giá trị|
|---|---|
|RAM Real|**17.77%**|
|RAM Requests|**12.23%**|
|RAM Limits|**17.59%**|

### Phân tích

- RAM sử dụng ổn định, thấp hơn 20%.
    
- Không có dấu hiệu memory pressure hoặc OOM.
    

### Kết luận

👉 **HRM không bị thiếu RAM**.  
👉 Không cần tăng memory limit cho HRM ở thời điểm hiện tại.

---

## 5. RAM Usage – Thống kê chi tiết

|Chỉ số|Giá trị|
|---|---|
|RAM sử dụng thực tế|**4.66 TiB**|
|RAM Requests|**4.18 TiB**|
|RAM Limits|**6.07 TiB**|
|Tổng RAM cluster|**35.5 TiB**|

### Phân tích

- HRM dùng RAM ổn định, không tăng tuyến tính theo thời gian.
    
- Không có dấu hiệu memory leak.
    

---

## 6. Cluster CPU & Memory Utilization

|Chỉ số|Giá trị|
|---|---|
|Cluster CPU Utilization|**5.41%**|
|Cluster Memory Utilization|**17.8%**|

### Nhận định

- Cluster đang vận hành ở mức tải thấp.
    
- HRM chạy trên nền cluster **dư tài nguyên**.
    

---

## 7. Network Traffic (liên quan HRM)

### Số liệu

- Peak traffic: ~**1–1.2 Gb/s**
    
- Traffic dao động theo nhịp, không kéo dài
    

### Phân tích

- Network ổn định.
    
- Không có hiện tượng nghẽn mạng ảnh hưởng HRM.
    

---

## 8. Disk I/O

### Số liệu

- Đỉnh đọc/ghi: ~**600–700 MB/s**
    
- Trung bình: ~**200–300 MB/s**
    

### Phân tích

- Disk có spike ngắn hạn nhưng không liên tục.
    
- Không có pattern nghẽn I/O kéo dài.
    

---

## 9. CPU Utilization by Namespace (HRM)

### Số liệu

- CPU trung bình: ~**2–3 cores**
    
- Peak ngắn hạn: ~**8–9 cores**
    

### Phân tích

- Có spike CPU cục bộ nhưng **ngắn hạn**, không kéo dài.
    
- Không dẫn đến saturation.
    

### Kết luận

👉 Có thể là **job hoặc request đột biến**, nhưng không gây nghẽn hệ thống.

---

## 10. Memory Utilization by Namespace (HRM)

### Số liệu

|Chỉ số|Giá trị|
|---|---|
|RAM Min|**~1.67 GiB**|
|RAM Max|**~6.23 GiB**|
|RAM Mean|**~3.77 GiB**|

### Phân tích

- Memory dao động trong biên an toàn.
    
- Không có xu hướng tăng dần.
    

---

# KẾT LUẬN TỔNG HỢP (DÙNG CHO GIẢI TRÌNH)

> Dựa trên số liệu giám sát từ dashboard Kubernetes đã lọc riêng namespace HRM (`hrm-vnr-pilot`), hệ thống HRM hiện đang sử dụng tài nguyên CPU và RAM ở mức thấp và ổn định, không ghi nhận dấu hiệu quá tải, thiếu tài nguyên, hay nghẽn hạ tầng. Cluster Kubernetes cung cấp dư năng lực cho HRM vận hành. Do đó, các vấn đề hiệu năng (nếu phát sinh) **không xuất phát từ hạ tầng Kubernetes hoặc cấu hình tài nguyên pod**, mà cần tiếp tục phân tích ở tầng ứng dụng, cơ sở dữ liệu hoặc luồng nghiệp vụ.
