---
description: "Nghiên cứu toàn diện dự án VnPay: khách hàng, kiến trúc 13 services K8s, timeline, sự cố hiệu năng, bảo mật và bài học."
type: synthesis
tags:
  - research
  - vnpay
  - hrm
  - kubernetes
  - net8
  - performance
  - uat
  - integration
date-created: 2026-04-27
date-updated: 2026-04-27
research-topic: Toàn diện dự án VnPay — khách hàng, kiến trúc, timeline, sự cố, bài học
sources-wiki: 10
sources-raw: 3
related:
  - "[[wiki/projects/VnPay-Project]]"
  - "[[wiki/entities/VnPay]]"
  - "[[wiki/synthesis/VnPay-Lessons-Learned]]"
  - "[[wiki/sources/VnPay-Goals-Scope-Resources]]"
  - "[[wiki/sources/VnPay-Phases-Timeline]]"
  - "[[wiki/sources/VnPay-System-Architecture]]"
  - "[[wiki/sources/VnPay-Performance-Incident]]"
  - "[[wiki/sources/VnPay-Deploy-Guide]]"
  - "[[wiki/sources/H-VnPay-Sys-03062025]]"
  - "[[wiki/sources/H-VnPay-INS-05082025]]"
  - "[[wiki/sources/H-VnPay-TRA-30062025]]"
  - "[[wiki/sources/H-VnPay-Att-17042025]]"
---

# Nghiên cứu: Dự án VnPay — Báo cáo Toàn diện

*Tạo: 2026-04-27 | Nguồn: 10 trang wiki + 3 file thô*

---

## Tóm tắt điều hành

Dự án VnPay là **dự án HRM phức tạp nhất** trong portfolio VnResource: 13 microservices trên Kubernetes, timeline 11 tháng (10/2024–09/2025), 7 SE, tích hợp 4 đối tác ngoài. Go-live thành công ngày 07/07/2025. Sau go-live gặp sự cố nghẽn 200 concurrent users do Identity service không scale, đã khắc phục trong tháng 12/2025 — TPS tăng từ ~4 lên ~11. Tích hợp MISA AMIS bảo hiểm là dependency lớn nhất còn dang dở (lộ trình T9/2025). Đây không đơn thuần là upgrade .NET 8 — là **triển khai HRM mới hoàn toàn** cho khách hàng fintech hạng nhất.

---

## 1. Bối cảnh & Phạm vi

### 1.1 Khách hàng

| Trường | Thông tin |
|--------|-----------|
| **Tên** | VnPay |
| **Ngành** | Thanh toán điện tử / Fintech |
| **Quốc gia** | Việt Nam |
| **Đặc điểm** | Yêu cầu kỹ thuật cao, có đội QA nội bộ riêng |

([[wiki/entities/VnPay]])

### 1.2 Mục tiêu dự án

1. **Chuyển .NET Framework → .NET Core 8** toàn bộ hệ thống HRM
2. **Triển khai HRM đầy đủ** cho VnPay (greenfield trên hạ tầng mới)
3. **Go-live trước tháng 07/2025** — ràng buộc cứng từ hợp đồng

> ⚠️ **Nhận định quan trọng**: Đây **không phải chỉ là upgrade .NET 8** — đây là dự án HRM mới hoàn toàn trên nền tảng Kubernetes/Docker, với migration kỹ thuật là một giai đoạn trong tổng thể dự án.

([[wiki/sources/VnPay-Goals-Scope-Resources]], [[wiki/sources/VnPay-Phases-Timeline]])

---

## 2. Findings — Những gì tìm thấy

### 2.1 Nhân sự dự án

| Họ tên | Vai trò |
|--------|---------|
| Nguyễn Huỳnh Huy Hoàng | Trưởng dự án (PM) |
| Lê Quang Trung | Lập trình viên |
| Trần Duy Bảo | Lập trình viên |
| Nguyễn Đạt Minh | Lập trình viên |
| Lý Nhuận Tùng | Lập trình viên |
| Lê Thiên Bảo | Lập trình viên |
| Cao Hải Quan | Lập trình viên |

**Phía VnPay (key users & IT)**: ANTT, HTM, HT, PTNV, PNS, NS, TK

([[wiki/sources/VnPay-Goals-Scope-Resources]])

### 2.2 Timeline đầy đủ — 8 giai đoạn

| # | Giai đoạn | Thời gian | Ghi chú |
|---|-----------|-----------|---------|
| 1 | Khởi động | 22/10/2024 – 22/11/2024 | |
| 2 | Khảo sát & GAP Analysis | 28/10/2024 – 28/02/2025 | Solution design |
| 3 | Chuyển đổi .NET 8 | 01/02/2025 – 17/02/2025 | Migration code |
| 4 | Kiểm thử hồi quy | 17/02/2025 – 28/02/2025 | Regression testing |
| 5 | Cài đặt & cấu hình | 28/03/2025 – 30/05/2025 | Cấu hình môi trường prod |
| 6 | Đào tạo & chuẩn bị UAT | 02/06/2025 – 06/06/2025 | Training key user |
| 7 | UAT (Phase 4) | 10/06/2025 – 18/07/2025 | 2 vòng, theo phân hệ |
| 8 | Go-live & Hypercare | 07/07/2025 – 10/09/2025 | Đang optimize |

**Tổng thời gian**: ~11 tháng

([[wiki/sources/VnPay-Phases-Timeline]])

### 2.3 Kiến trúc hệ thống — 13 Microservices

Hệ thống chạy trên **Kubernetes** với Traefik làm reverse proxy:

| # | Service | Vai trò | Người dùng |
|---|---------|---------|-----------|
| 1 | **Portal** | Cổng nhân viên: hồ sơ, công, lương, nghỉ phép | Nhân viên |
| 2 | **Main** | Quản trị HRM: hồ sơ, tuyển dụng, đào tạo | HR, Quản lý |
| 3 | **HR API** | API nghiệp vụ nhân sự | Portal, Main |
| 4 | **SYS API** | Bảo mật, phân quyền, cấu hình | Nội bộ |
| 5 | **API Core** | API lõi nội bộ cho Portal | Portal |
| 6 | **Integration API** | Gateway tích hợp đối tác (MISA, TS24, Viettel) | Đối tác (S2S) |
| 7 | **Identity (IDS4)** ⚠️ | SSO, OAuth2, OpenID Connect, cấp token | Toàn hệ thống |
| 8 | **News** | Tin tức nội bộ (WordPress) + SSO | Nhân viên, HR |
| 9 | **Survey API** | Khảo sát nội bộ (DB độc lập) | Nhân viên, HR |
| 10 | **Chat API** | Dịch vụ chat nội bộ | Nhân viên |
| 11 | **Chat FE** | Giao diện chat nhúng vào Portal | Nhân viên |
| 12 | **Windows Service Core** | Background jobs: sync, email, công-lương | Hệ thống |
| 13 | **Traefik** | Reverse proxy, load balancer, TLS | IT/DevOps |

([[wiki/sources/VnPay-System-Architecture]])

### 2.4 Phân hệ triển khai

Nhân sự · Chấm công · Lương · Bảo hiểm · Tuyển dụng · Định biên · Đào tạo · Tin tức · Khảo sát · Chat

### 2.5 Tích hợp đối tác

| Đối tác | Phân hệ | Trạng thái | Ghi chú |
|---------|---------|-----------|---------|
| **MISA AMIS** | Bảo hiểm | Đang thực hiện (T9/2025) | Phụ thuộc lịch MISA |
| **TS24** | Integration API | Vận hành | — |
| **Viettel** | Integration API | Vận hành | — |
| **VnPay apps** | Integration API | Vận hành | — |

Pattern tích hợp MISA: MISA cung cấp API danh mục (05/09/2025) → đồng bộ ngược trạng thái hồ sơ (30/09/2025).

([[wiki/sources/H-VnPay-INS-05082025]])

### 2.6 Triển khai — Artifacts & Deploy Pattern

| Loại | File | Ghi chú |
|------|------|---------|
| Database | `HRMPRO12_VNPAY_20250423.rar` | Backup SQL Server |
| Cấu hình | `IIS-DB-VnPay-config.rar` | Config IIS + DB connection |
| Source HRM | `VNPAY_v8.12.46.01.19.rar` | Source .NET 8 production |

- Artifacts lưu trên **AWS S3**
- Phiên bản production: `v8.12.46.01.19`

([[wiki/sources/VnPay-Deploy-Guide]])

### 2.7 UAT — Quy trình & Cam kết

UAT Phase 4 (10/06–18/07/2025) chia 3 đợt:
1. **10/06**: Đào tạo + UAT Nhân sự & Chấm công
2. **23/06**: Đào tạo + UAT Định biên, Tuyển dụng, Đào tạo, Tin tức, Bảo hiểm
3. **07/07**: UAT vòng 2 toàn hệ thống
4. **14–18/07**: Ký nghiệm thu

**Cam kết chất lượng**: VnResource re-test tất cả lỗi đã sửa trước khi bàn giao bản fix.

([[wiki/sources/H-VnPay-Sys-03062025]])

### 2.8 Sự cố post-go-live — Tháng 10–12/2025

#### Lỗi Production (07/10/2025)

| Lỗi | Số lần | Tác động |
|-----|--------|---------|
| SP `hrm_hre_sp_get_ProfileWorkListPortalV3` — `ArgumentNullException` | 19 lần/giờ | 12 user bị ảnh hưởng |
| Log4net SQLite connection string thiếu | 6 lần | Log không ghi được |
| File permission `/app/` denied | 4 lần | Log bị block |
| System.Exception NULL (business logic) | 49 lần | Liên tục |

*(Nguồn thô: `Daily-2025/2025-Oct-41/log lỗi vnpay.md`)*

#### Sự cố nghẽn hệ thống (Tháng 11/2025)

- **Triệu chứng**: Portal treo khi ~200 nhân viên truy cập đồng thời
- **Root cause**:
  1. Identity service không scale multi-pod → điểm nghẽn trung tâm
  2. Sizing tài nguyên chưa phù hợp
  3. Chưa có giám sát tập trung
  4. Chưa có log trace thời gian xử lý
- **Biện pháp tạm**: Chia nhỏ phòng ban truy cập theo khung giờ

([[wiki/sources/VnPay-Performance-Incident]])

#### Kết quả cải thiện (Tháng 12/2025)

| Việc làm | Kết quả |
|----------|---------|
| Thêm log chi tiết (pod, DB time, processing time) | Có thể trace bottleneck |
| Test tải + optimize 8 API dashboard | TPS: **~4 → ~11** (100 concurrent users) |
| Tăng pod + sizing Portal, ApiCore, HrCore, SysCore | Phân bổ tải đều hơn |
| Triển khai Grafana monitoring | Visibility tốt hơn |

**Vấn đề còn tồn tại**: Load balancing chưa tối ưu real-time — một pod vẫn spike khi pod khác idle.

---

## 3. Phân tích & Nhận định

### 3.1 Phức tạp vượt trội so với dự án HRM thông thường

VnPay là outlier trong portfolio:
- **HRM thông thường**: IIS + SQL Server, 1–3 service, on-premise
- **VnPay**: 13 microservices, Kubernetes, Docker, 4 tích hợp đối tác, AWS S3

Hệ quả: rủi ro kỹ thuật cao hơn hẳn, cần team có kinh nghiệm DevOps.

### 3.2 Identity Service — Kiến trúc điểm nghẽn có thể dự đoán trước

Identity (IDS4) là **single point of failure** ngay từ thiết kế — toàn bộ 13 service đều phụ thuộc vào nó để cấp token. Sự cố tháng 11/2025 là **có thể dự đoán** nếu HA checklist được thực hiện trước go-live.

**Lesson rút ra**: Bất kỳ dự án microservices nào, Identity/Auth service phải được HA trước go-live, không phải sau sự cố.

### 3.3 HRM có traffic spike đặc thù — cần capacity planning theo chu kỳ

Cuối tháng (ngày 25–30): chấm công, lương → spike đột ngột. Đây là **chu kỳ có thể lên kế hoạch trước**. Cần:
- Auto-scale proactive (không reactive)
- Pre-warm trước cao điểm

### 3.4 Dependency bên thứ ba là rủi ro không kiểm soát được

MISA có lịch riêng — VnR không thể ép. Buffer và escalation path là bắt buộc với mọi tích hợp bên ngoài.

### 3.5 Pattern "Observability trước, optimize sau" đã được chứng minh

Chuỗi: **Log chi tiết → Test tải đo lường → Optimize đúng chỗ → Scale** đã cho kết quả rõ ràng (TPS x2.75). Đây là pattern chuẩn nên áp dụng cho mọi dự án microservices.

---

## 4. Gaps & Hạn chế

| Gap | Mức độ | Ghi chú |
|-----|--------|---------|
| Load balancing real-time chưa tối ưu | Trung bình | Đang cải thiện |
| Tích hợp MISA AMIS chưa hoàn thành | Cao | Phụ thuộc lịch MISA T9/2025 |
| Tài liệu chi tiết quy trình deploy Kubernetes | Chưa có trong wiki | Chỉ có bản tóm tắt |
| Auto-scale policy chưa được document | Chưa rõ | Cần confirm với IT VnPay |
| Log lỗi production (T10/2025) — resolution chưa rõ | Trung bình | File thô có vấn đề, chưa rõ đã fix chưa |

---

## 5. Gợi ý hành động

### Kỹ thuật
1. **Document HA checklist** cho Identity service — áp dụng cho tất cả dự án microservices tương lai
2. **Tạo capacity planning template** cho HRM — dựa trên cycle cuối tháng
3. **Theo dõi lộ trình MISA** — escalate sớm nếu trễ deadline T9/2025
4. **Verify fix lỗi production T10/2025** — SP `hrm_hre_sp_get_ProfileWorkListPortalV3` và log4net config

### Quy trình
5. **Chuẩn hóa UAT pattern** từ VnPay: đào tạo trước → UAT theo phân hệ → UAT toàn hệ → ký nghiệm thu
6. **Thêm load test vào definition of done** trước go-live — không để đến post-go-live mới phát hiện
7. **Template Risk Register** với 5 rủi ro đã xảy ra tại VnPay làm baseline cho dự án tương lai

### Wiki
8. **Ingest thêm**: `02-Docker-Trong-Du-An-VnPay.md`, `VnPay Upgrade Net8.md`, `bsm - Kế hoạch VnPay.md`
9. **Tạo trang** `wiki/architecture/VnPay-K8s-Architecture.md` với diagram Kubernetes đầy đủ

---

## Nguồn tham khảo

### Wiki (đã ingest)
- [[wiki/projects/VnPay-Project]] — Tổng quan dự án
- [[wiki/entities/VnPay]] — Thông tin khách hàng
- [[wiki/synthesis/VnPay-Lessons-Learned]] — Bài học tổng hợp trước
- [[wiki/sources/VnPay-Goals-Scope-Resources]] — Mục tiêu, nhân sự, rủi ro
- [[wiki/sources/VnPay-Phases-Timeline]] — Timeline 8 giai đoạn
- [[wiki/sources/VnPay-System-Architecture]] — 13 services/sites
- [[wiki/sources/VnPay-Performance-Incident]] — Sự cố + cải thiện
- [[wiki/sources/VnPay-Deploy-Guide]] — Hướng dẫn deploy
- [[wiki/sources/H-VnPay-Sys-03062025]] — Biên bản họp UAT Phase 4
- [[wiki/sources/H-VnPay-INS-05082025]] — Biên bản họp tích hợp MISA
- [[wiki/sources/H-VnPay-TRA-30062025]] — Biên bản họp UAT Tuyển dụng
- [[wiki/sources/H-VnPay-Att-17042025]] — Biên bản họp Chấm công

### File thô (đọc trực tiếp)
- `3. ARCHIEVED/Daily-2025/2025-Oct-41/log lỗi vnpay.md` — Log lỗi production T10/2025
- `Area/Tổng Hợp tri thức thô 2025/1-1 Du an VnPay.md` — Ghi chú tổng hợp
- `3. ARCHIEVED/Danh sách dự án/Dự án VnPay.md` — Metadata dự án

---

*Báo cáo này tổng hợp toàn bộ thông tin VnPay có trong vault tính đến 2026-04-27. Để cập nhật, ingest thêm các file thô còn lại hoặc chạy lại research sau khi có kết quả MISA T9/2025.*
