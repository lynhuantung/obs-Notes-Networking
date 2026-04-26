---
type: wiki-project
tags:
  - vnpay
  - net8
  - hrm
  - upgrade
  - triển-khai
  - kubernetes
  - docker
  - "2025"
date-updated: 2026-04-26
related: 
  - "[[wiki/entities/VnPay]]"
  - "[[wiki/concepts/Net8-Migration]]"
  - "[[wiki/concepts/Project-Phases]]"
  - "[[wiki/concepts/HRM-Modules]]"

# --- CHART FIELDS ---
status: post-golive
start-date: 2024-10-22
end-date: 2025-09-10
project-type: new-deployment
industry: fintech
team-size: 7
effort-mandays: 0
modules:
  - hrm
  - payroll
  - attendance
  - insurance
  - evaluation
  - recruitment
---

# Dự án VnPay

## Thông tin cơ bản

| Trường | Giá trị |
|--------|---------|
| Khách hàng | [[wiki/entities/VnPay]] |
| Loại dự án | Triển khai HRM mới + Nâng cấp .NET 8 |
| Khởi động | 22/10/2024 |
| Go-live | 07/07/2025 |
| Hypercare kết thúc | 10/09/2025 |
| Trạng thái | Post go-live (đang hypercare/optimize) |

> ⚠️ Đây **không phải chỉ là upgrade .NET 8** — đây là **dự án triển khai HRM đầy đủ** cho VnPay, chạy trên hạ tầng Kubernetes/Docker, tích hợp nhiều đối tác (MISA, TS24, Viettel).

## Nhân sự

| Họ tên | Vai trò |
|--------|---------|
| Nguyễn Huỳnh Huy Hoàng | Trưởng dự án |
| Lê Quang Trung | Lập trình viên |
| Trần Duy Bảo | Lập trình viên |
| Nguyễn Đạt Minh | Lập trình viên |
| Lý Nhuận Tùng | Lập trình viên |
| Lê Thiên Bảo | Lập trình viên |
| Cao Hải Quan | Lập trình viên |

Phía VnPay: ANTT, HTM, HT, PTNV, PNS, NS, TK (key users & IT)

## Timeline đầy đủ

| Giai đoạn | Thời gian |
|-----------|-----------|
| Khởi động | 22/10/2024 – 22/11/2024 |
| Khảo sát & GAP | 28/10/2024 – 28/02/2025 |
| Chuyển đổi .NET 8 | 01/02/2025 – 17/02/2025 |
| Kiểm thử hồi quy | 17/02/2025 – 28/02/2025 |
| Cài đặt & cấu hình | 28/03/2025 – 30/05/2025 |
| Đào tạo & chuẩn bị UAT | 02/06/2025 – 06/06/2025 |
| UAT (Phase 4) | 10/06/2025 – 18/07/2025 |
| Go-live | 07/07/2025 – 10/09/2025 |

→ Nguồn: [[wiki/sources/VnPay-Phases-Timeline]]

## Kiến trúc hệ thống

13 services trên Kubernetes (Traefik reverse proxy):
- **Portal** — cổng nhân viên
- **Main** — quản trị HRM
- **HR API / SYS API / API Core** — backend nghiệp vụ
- **Integration API** — tích hợp đối tác (MISA, TS24, Viettel)
- **Identity (IDS4)** — SSO trung tâm ⚠️ điểm nghẽn quan trọng
- **Windows Service Core** — background jobs (lương, công)
- **Grafana / Traefik** — monitoring & routing

→ Chi tiết: [[wiki/sources/VnPay-System-Architecture]]

## Phân hệ triển khai

Nhân sự · Chấm công · Lương · Bảo hiểm · Tuyển dụng · Định biên · Đào tạo · Tin tức · Khảo sát · Chat

## Tích hợp đối tác

| Đối tác | Phân hệ | Trạng thái |
|---------|---------|-----------|
| MISA AMIS | Bảo hiểm | Lộ trình T9/2025, đang thực hiện |
| TS24 / Viettel | Integration API | *(chưa rõ chi tiết)* |

→ Chi tiết bảo hiểm: [[wiki/sources/H-VnPay-INS-05082025]]

## Quyết định kỹ thuật theo phân hệ

### Chấm công
- Đối tượng chỉ chấm 1 đầu (chỉ IN): tính trễ bình thường, không tính thiếu Out
- Enum bảng công: rà soát trước khi cấu hình quy tắc trễ/sớm
→ [[wiki/sources/H-VnPay-Att-17042025]]

### UAT & Ưu tiên task
- Hệ thống ưu tiên: 1 (critical) / 1.5 / 2 (low)
- Tuyển dụng + Định biên nâng từ P2 → P1 (30/06/2025)
→ [[wiki/sources/H-VnPay-TRA-30062025]]

## Sự cố & Lessons Learned

### Nghẽn hệ thống tháng 11/2025
- 200 concurrent users → portal treo
- **Root cause**: Identity service không scale được nhiều pod
- **Fix**: tăng pod, tối ưu 8 API, deploy Grafana monitoring
- TPS tăng từ ~4 → **~11 TPS** (100 users)
→ [[wiki/sources/VnPay-Performance-Incident]]

## Rủi ro đã xảy ra

| Rủi ro | Giai đoạn | Đã xử lý? |
|--------|-----------|-----------|
| Lỗi migration code | Phase chuyển đổi | Có |
| Chưa có môi trường Linux | Kiểm thử | Có (nhờ IT dựng) |
| Identity không scale | Post go-live | Đang cải thiện |
| Phụ thuộc MISA (bảo hiểm) | Hypercare | Đang thực hiện |
| Load balancing chưa đều | Post go-live | Đang cải thiện |

## Sources đã ingest

- [[wiki/sources/VnPay-Goals-Scope-Resources]]
- [[wiki/sources/VnPay-Phases-Timeline]]
- [[wiki/sources/VnPay-System-Architecture]]
- [[wiki/sources/VnPay-Performance-Incident]]
- [[wiki/sources/H-VnPay-Att-17042025]]
- [[wiki/sources/H-VnPay-TRA-30062025]]
- [[wiki/sources/H-VnPay-INS-05082025]]
- [[wiki/sources/H-VnPay-Sys-03062025]]
