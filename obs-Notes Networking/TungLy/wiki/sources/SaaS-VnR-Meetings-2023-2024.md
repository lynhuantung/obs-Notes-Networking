---
type: source
tags:
  - saas
  - kubernetes
  - multi-tenant
  - vnresource-internal
  - archived-2023-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "1. Projects/SaaS - VnR/xmind/Bien_Ban_Hop/ (15 files, 07/2023–10/2024)"
related:
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/architecture/HRM-Deployment-Architecture]]"
  - "[[wiki/concepts/Net8-Migration]]"
---

# SaaS VnResource — Họp Nội Bộ Phát Triển SaaS (2023–2024)

## Tóm tắt

15 biên bản họp nội bộ VnResource về dự án chuyển đổi HRM sang **SaaS multi-tenant** trên Kubernetes (2023–2024). Đây là dự án R&D chiến lược của VnResource, song song với các dự án khách hàng. TungLy tham gia với vai trò BA/SE chính phụ trách kiến trúc SaaS và multi-tenant.

## Key Takeaways — Kiến trúc SaaS

### Kubernetes & Docker
- **Mục tiêu ban đầu (07/2023)**: Hiểu Kubernetes, vẽ flow đăng ký HRM từ chợ phần mềm MISA
- **Docker**: Tạo images cho cả .NET Framework và .NET Core
- **K8s**: Demo node Windows, cấu hình volume
- **Windows Node**: Cần xử lý .NET Framework trên K8s (không phải thuần Linux)

### Multi-Tenant
- **Kiến trúc**: Mỗi tenant là một database riêng (switch nhiều database)
- **Storage**: MinIO — mỗi tenant là một storage riêng (bảo mật tách biệt)
- **Tenant Management**: Quản lý tenant trung tâm
- **Hàm get config**: Cần điều chỉnh để đọc config theo tenant

### Kịch bản vận hành SaaS
- Flow đăng ký HRM từ chợ phần mềm MISA
- Tích hợp gọi API MISA-HRM
- Timeline demo cho BĐH (ưu tiên mốc chính)

### Điều chỉnh code HRM cho SaaS
- Chỉnh file config → lưu nơi khác (không hard-code)
- Hàm get config theo tenant
- Biến static, memory cache → cần cẩn thận với multi-tenant
- Sửa cách ghi log (tách theo tenant)

## Bài học

- SaaS multi-tenant trên K8s đòi hỏi refactor sâu vào core HRM (config, cache, log) — không chỉ là deploy lên cloud
- Windows node trên K8s là điểm phức tạp đặc thù của .NET Framework — cần xem xét migration .NET 8 trước
- MinIO per-tenant là pattern bảo mật đúng nhưng tốn resource hơn shared bucket

## Liên kết

- [[wiki/architecture/HRM-System-Architecture]] — kiến trúc 13 services VnPay (kết quả thực tế SaaS)
- [[wiki/architecture/HRM-Deployment-Architecture]] — deploy K8s
- [[wiki/concepts/Net8-Migration]] — migration song song
