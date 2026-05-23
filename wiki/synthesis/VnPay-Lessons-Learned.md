---
description: "Tổng hợp bài học từ dự án VnPay: Kubernetes microservices, Identity HA, observability, UAT đa giai đoạn và quản lý rủi ro."
type: synthesis
tags:
  - vnpay
  - lessons-learned
  - kubernetes
  - performance
  - uat
  - integration
date-updated: 2026-04-25
related: 
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/sources/VnPay-Performance-Incident]]"
  - "[[wiki/sources/VnPay-System-Architecture]]"
  - "[[wiki/sources/H-VnPay-Sys-03062025]]"
---

# VnPay — Tổng Hợp Bài Học

*Tạo từ quá trình nghiên cứu toàn bộ tài liệu dự án VnPay (2026-04-25)*

---

## 1. Hiểu đúng quy mô dự án

**VnPay không phải upgrade đơn giản** — đây là dự án HRM phức tạp nhất trong portfolio:
- 13 microservices trên Kubernetes
- Tích hợp 4+ đối tác ngoài (MISA, TS24, Viettel, VnPay apps)
- Go-live đồng thời toàn bộ phân hệ (Nhân sự, Chấm công, Lương, Bảo hiểm, Tuyển dụng, Định biên, Đào tạo…)
- Timeline 11 tháng (10/2024–09/2025)

> **Lesson**: Khi khách hàng là fintech lớn + Kubernetes + multi-integration → estimate gấp đôi so với dự án HRM thông thường.

---

## 2. Identity Service là điểm nghẽn quan trọng nhất

Sự cố tháng 11/2025 chứng minh: **Identity (IDS4) không HA = toàn hệ thống sập** khi có concurrent traffic.

Checklist trước go-live bất kỳ dự án microservices:
- [ ] Identity service có multi-pod / HA không?
- [ ] Load balancing đều giữa các pod?
- [ ] Đã test tải với concurrent users thực tế (ít nhất 200)?
- [ ] Có monitoring/alerting (Grafana)?

---

## 3. Performance: Observability trước, optimize sau

Pattern chuẩn đã áp dụng thành công tháng 12/2025:
1. **Thêm log chi tiết** (pod, DB time, processing time) → có thể trace
2. **Test tải có đo lường** → biết baseline (TPS, latency)
3. **Optimize code + cache** API hot path
4. **Hạ tầng scale** (pod, resource) sau khi biết bottleneck

Kết quả: TPS tăng từ **~4 → ~11** (100 concurrent users).

> **Lesson**: Đừng optimize mù. Log trước → profiling → fix đúng chỗ.

---

## 4. UAT: Ưu tiên và phân lớp task là sống còn

Với dự án nhiều phân hệ, UAT cần:
- Hệ thống phân loại rõ ràng: **P1 (block go-live) / P1.5 / P2 (nice-to-have)**
- Raise task còn thiếu **trước deadline UAT**, không phải trong UAT
- Đào tạo key user **trước** UAT (không song song)
- VnR cam kết: **re-test trước khi bàn giao bản fix**

> **Lesson**: Tuyển dụng & Định biên bị underestimate — cần review ưu tiên giữa UAT, không chờ đến cuối.

---

## 5. Tích hợp đối tác: quản lý dependency chặt chẽ

MISA integration (bảo hiểm) có lịch riêng:
- MISA bàn giao API danh mục: 05/09/2025
- Đồng bộ ngược: 30/09/2025

> **Lesson**: Tích hợp bên thứ ba = dependency không kiểm soát được. Cần milestone rõ ràng, có buffer, và escalation path nếu bên ngoài trễ.

---

## 6. Kiến trúc Kubernetes cho HRM — đặc thù cao điểm cuối tháng

HRM có traffic spike đặc trưng (ngày 25–30 hàng tháng — chấm công, lương). Cần:
- **Auto-scale** trước cao điểm (proactive, không reactive)
- **Dynamic load balancing** real-time giữa các pod
- **Windows Service Core** phải chạy ổn định cho jobs cuối tháng

---

*Nguồn chính: [[wiki/sources/VnPay-Performance-Incident]], [[wiki/sources/VnPay-System-Architecture]], [[wiki/sources/H-VnPay-Sys-03062025]], [[wiki/sources/H-VnPay-TRA-30062025]]*
