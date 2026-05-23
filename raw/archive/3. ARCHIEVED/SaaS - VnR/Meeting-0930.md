---
type: meeting
title: "Họp SaaS #12 — 30/09/2023"
date: 2023-09-30
tags: [saas, meeting, aws, s3, helm, identity, k8s, cmc, log, loki]
prev: "[[Meeting-0923]]"
next: "[[Meeting-1007]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]", "[[SaaS-Tong-Quan-Kien-Truc]]"]
---

# Biên Bản Họp — 30/09/2023

## Mục tiêu
- Review tuần trước
- Kiến trúc K8s từ Hiếu.Lê và Hiếu.Lê lập kế hoạch

## Review tuần trước

| Hạng mục | Trạng thái |
|----------|-----------|
| Window service — multi-tenant (Tùng+Sáng+Vũ.Lê) | 🔄 Sửa thông tin multi-tenant để chạy |
| Log per-tenant (Tùng+Sáng+Vũ.Lê) | ✅ Tung.Ly sửa trong BaseService; chưa làm giao diện view log |
| Claim tenant null (Sáng+Tung.Ly) | ❌ Chưa xử lý được |
| Identity mới (Hoàng.Nguyễn) | ✅ Có identity mới, có UI quản lý; đang chạy bằng Docker |
| Docker (Minh.NguyễnĐạt) | ⏳ Nghỉ phép, chưa báo cáo tiến độ |

## Các ý chính

### Log
- Sau này dùng **Loki**: log theo console + có 1 web dashboard để view

### Docker
- **Dùng Helm Chart** thay Docker Compose (vì AWS không hỗ trợ Docker Compose)

### AWS S3
- Sáng.Mai làm việc với Hiếu.Lê để tìm hiểu S3 lưu file vào storage
- Sáng.Mai cần môi trường test S3

### Vấn đề khó khăn còn tồn đọng
| Vấn đề | Ghi chú |
|--------|---------|
| Window service chưa tạo được sub-process theo multi-tenant | Tồn đọng từ nhiều tuần |
| Biến static, httpContext.cache chưa xử lý theo multi-tenant | Tồn đọng từ nhiều tuần |

### AWS — SQL Database scaling
- AWS có cơ chế tự tạo 1 DB đọc + 1 DB ghi (tính phí riêng)
- Scale database tự động khi dung lượng lớn (tính phí)
- ⚠️ Cần tính vào chi phí vận hành SaaS

### Identity (Hoàng.Nguyễn)
- Giao diện chưa được điều chỉnh (chờ confirm có cần design lại không)
- Source chưa refactor về VnR

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Hiếu.Lê | 02/10 | Define tiêu chuẩn K8s; a.Hiền review kế hoạch với Hiếu |
| Hiếu.Lê | 02/10 | Sáng.Mai cần môi trường test S3 |
| Hiếu.Lê | 07/10 | Làm việc với CMC về K8s AWS |
| Tung.Ly | 02/10 | Claim tenant null → xử lý lúc authen (Sáng hỗ trợ) |
| Hoàng.Nguyễn | 07/10 | Apply vào tenant; refactor source về VnR; giao diện step-by-step kích hoạt; link dashboard user |
