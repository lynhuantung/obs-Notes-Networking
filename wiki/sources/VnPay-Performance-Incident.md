---
description: "Sự cố nghến 200 concurrent users VnPay (T11/2025) và cải thiện T12: tối ưu 8 API dashboard, thêm pod, Grafana — TPS tăng từ 4 lên 11."
type: source
tags:
  - vnpay
  - performance
  - load-test
  - kubernetes
  - docker
  - "2025"
date-updated: 2026-04-25
date-ingested: 2026-04-25
category: incident
project: vnpay
related:
- "[[wiki/projects/VnPay-Project]]"
- "[[wiki/sources/VnPay-System-Architecture]]"
---

# VnPay — Báo cáo nghẽn hệ thống & Load Test

**Nguồn gốc**: `BrainStorming/bsm - Kế hoạch VnPay 1.md`  
**Thời điểm**: Tháng 11–12/2025 (post go-live)

---

## Sự cố tháng 11/2025: Nghẽn 200 concurrent users

**Triệu chứng**: HRM Portal treo/nghẽn khi ~200 nhân viên truy cập đồng loạt (cao điểm cuối tháng).

**Nguyên nhân gốc rễ**:
1. **Identity service chưa scale được nhiều pod** → điểm nghẽn trung tâm
2. Sizing tài nguyên và số pod chưa phù hợp
3. Chưa có hệ thống giám sát tập trung
4. Chưa có log ghi nhận thời gian xử lý nghiệp vụ / DB query / pod

**Biện pháp tạm thời**: Chia nhỏ phòng ban truy cập theo khung giờ.

---

## Cải thiện tháng 12/2025

**Kết quả**: Sự cố 200 concurrent users **đã được giải quyết**.

| Việc đã làm | Đơn vị | Kết quả |
|-------------|--------|---------|
| Bổ sung log chi tiết (pod, DB time, xử lý time) | VnR | Có thể trace bottleneck |
| Test tải 8 API dashboard | VnR + VnPay | TPS tăng ~4 → **~11 TPS** (100 concurrent users) |
| Tối ưu code + cache 8 API dashboard | VnR | Giảm latency đáng kể |
| Tăng pod + sizing các service nặng (Portal, ApiCore, HrCore, SysCore) | VnPay IT | Phân bổ tải đều hơn |
| Triển khai Grafana giám sát | VnR + VnPay | Visibility tốt hơn |

**Vấn đề còn tồn tại**: Load balancing chưa tối ưu real-time — một pod vẫn có thể spike khi các pod khác idle.

---

## Đề xuất tiếp theo

**VnPay (hạ tầng)**:
- Tự động chuyển request sang pod khác khi pod quá tải
- Auto-scale pod khi tải cao
- Chủ động tăng pod trước cao điểm cuối tháng (ngày 25–30)

**VnR (phần mềm)**:
- Tiếp tục tối ưu hiệu năng các API tần suất cao

## Key Insights

- **High traffic pattern**: cao điểm cuối tháng là đặc trưng của HRM (chấm công, lương) — cần capacity planning theo chu kỳ
- **Identity là critical service**: không thể để single pod — phải HA trước go-live
- **Observability trước, optimize sau**: cần log + metrics trước khi có thể debug performance
- Kết quả test tải: **11 TPS với 100 concurrent** = ~660 req/phút là baseline cần đảm bảo
