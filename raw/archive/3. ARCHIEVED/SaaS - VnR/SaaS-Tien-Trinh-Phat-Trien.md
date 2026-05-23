---
type: note
title: SaaS VnR — Tiến Trình Phát Triển
tags:
  - saas
  - timeline
  - meeting
  - k8s
created: 2026-05-02
related:
  - [[00-INDEX]]
  - [[SaaS-Tong-Quan-Kien-Truc]]
  - [[SaaS-Ky-Thuat-Quyet-Dinh]]
---

# SaaS VnR — Tiến Trình Phát Triển (Jul–Oct 2023)

Tổng hợp toàn bộ **17 biên bản họp weekly** theo thứ tự thời gian.

---

## Phase 1: Khởi động & Nghiên cứu nền tảng (15/07 – 29/07)

### Meeting 15/07/2023
**Mục tiêu:** Hiểu Kubernetes, vẽ flow đăng ký HRM từ MISA marketplace.

**Kết quả:**
- Tung.Ly vẽ flow kiến trúc Kubernetes cho HRM
- Xác định các điểm HRM cần điều chỉnh để chạy multi-tenant:
  - Chỉnh file config → lưu nơi khác (không hardcode)
  - Hàm get config
  - Biến static, memory cache
  - Sửa cách ghi log

### Meeting 22/07/2023
**Mục tiêu:** Dựng web Kubernetes, Docker MVC + SQL.

**Chốt:**
- Minh.Nguyễn: đưa image lên Docker Hub share nhóm (28/07)
- Tú.Huỳnh: dựng web test chạy trên Kubernetes (28/07)
- Tung.Ly: viết kế hoạch đưa web lên Kubernetes, tạo project/task trên Git (24/07)

### Meeting 29/07/2023
**Mục tiêu:** Thuê máy ảo, SaveMoney hướng dẫn cài K8s.

**Chốt:**
- Tung.Ly: check 1 source dùng nhiều DB; kiểm tra RAM/CPU đề xuất thuê server
- Minh: demo migrate data từ source vào DB container Docker
- Sáng: xử lý upload MinIO, check file riêng dùng chung (lang, field_info...)

---

## Phase 2: Xây dựng core Multi-Tenant (05/08 – 19/08)

### Meeting 05/08/2023
**Mục tiêu:** Trao đổi multi-tenant, kế hoạch SaaS.

**Các ý chính:**
- **MinIO**: mỗi tenant 1 storage riêng; bảo mật file
- **Tenant Management**: thiết kế module quản lý tenant
- **Kịch bản vận hành SaaS**: Tung.Ly viết kịch bản
- **Timeline**: các mốc chính demo cho a.Hiền

**Chốt:**
- Tung.Ly: book họp với Đăng về quản lý tenant; xử lý switch nhiều DB; kịch bản vận hành
- Hoàng: tích hợp gọi API Misa-HRM
- Sáng: xử lý storage

### Meeting 10/08/2023
**Mục tiêu:** Thiết kế UI Tenant Management + User Management.

**Chốt:**
- Đăng: thiết kế giao diện quản lý tenant và users (14/08)
- Hoàng: tiến hành làm giao diện theo design của Đăng (18/08)

### Meeting 12/08/2023
**Mục tiêu:** Review + xử lý storage.

**Các ý chính:**
- Tạo users trong Tenant Management: dạng data warehouse, viết store lấy tất cả DB đồng bộ vào bảng users
- **Không đồng bộ** từ màn hình user trong HRM đến APP tenant
- Trang login thêm textbox `tenantCode`
- Xử lý Identity trong quản lý tenant

**Chốt:**
- Tung.Ly: show a.Hiền về kết nối nhiều database (16/08)

### Meeting 19/08/2023
**Mục tiêu:** Xử lý biến static, demo tạo tenant đến login.

**Luồng demo target:**
```
Tạo tenant → xác nhận → tự tạo DB mới (chạy script restore) → login HRM với tenantCode → upload file lên storage
```

**Vấn đề nổi bật:** SaveMoney chưa hỗ trợ đủ để cài K8s lên VnR.

---

## Phase 3: Giải quyết vấn đề kỹ thuật & K8s (26/08 – 23/09)

### Meeting 26/08/2023
**Mục tiêu:** Demo tạo tenant → login + xử lý biến static.

**Chốt:**
- Minh/Thịnh/Phúc/Tú: dựng HRM11 vào Kubernetes và Docker (09/09)
- Sáng/Hiếu: cấu hình App mobile lên storage (09/09)
- Vũ/Tùng: tìm giải pháp biến static (09/09)
- Phúc: liên hệ SaveMoney dựng server K8s thành → xóa → dựng lại + làm tài liệu

### Meeting 09/09/2023
> Biên bản gần trống — chỉ review tạo database tự động và overview K8s.

### Meeting 18/09/2023
**Review:**
- Redis cache: đã xử lý lưu memory cache theo `tenantCode` ✅
- Login Tenant Management: đã xử lý trên Identity Server (lấy tạm từ WebSettings.json) ✅
- Gửi lại email kích hoạt, màn hình thông tin tài khoản, chi tiết công ty: done ✅

**Vấn đề còn tồn đọng:**
- MinIO: chưa dựng được SSL; download file gặp vấn đề nhập mật khẩu mặc định
- Màn hình xác nhận kích hoạt step-by-step: chưa có Design + FE/BE chưa xử lý
- Window Service chạy với `tenantCode`: chưa xác định được tenantCode
- Biến static, httpContext: chưa giải quyết

**Chốt:**
- Log: chia thư mục theo `tenantCode`
- Window service: xử lý sub-process theo từng tenantCode

### Meeting 23/09/2023
**Mục tiêu:** Xử lý window service theo tenant.

**K8s:**
- Phúc + Hiếu.Lê: lead K8s, đề xuất mô hình → a.Hiền quyết định

**Giải pháp Log:**
- Sửa file global → set theo `tenantCode`
- Sau này dùng **Loki** (log theo console + web dashboard)

**Giải pháp Claim Tenant:**
- Nếu null → dùng cookie

---

## Phase 4: Identity mới + K8s với CMC (30/09 – 28/10)

### Meeting 30/09/2023
**S3 / AWS:**
- Sáng.Mai làm việc với Hiếu.Lê → tìm hiểu S3 lưu file vào storage
- AWS RDS: cơ chế tự tạo 1 DB đọc, 1 DB ghi → tính phí; scale DB tự động khi dung lượng lớn

**Vấn đề khó:**
- Window service: chưa tạo được sub-process theo multi-tenant
- Biến static, httpContext.cache: chưa xử lý theo multi-tenant

**Chốt:**
- Hiếu.Lê: họp kiến trúc CMC về K8s AWS (07/10)
- Dùng **Helm Chart** (thay Docker Compose vì AWS không hỗ trợ)

### Meeting 07/10/2023
**Monitor & Log:**
- Hiếu.Lê + Phúc.Dương: kế hoạch monitor và log (gửi 09/10)

**Chốt:**
- Minh: xử lý dockerfile bằng dòng lệnh (14/10)
- Tung.Ly: xử lý window service theo multi-tenant (14/10)
- Hoàng: demo identity mới với a.Hiền (09/10)

### Meeting 14/10/2023
**Identity (Hoàng.Nguyễn):**
- Đã move tenant cũ sang identity mới (60%)
- Giao diện kích hoạt tài khoản step-by-step (90%) — chưa hoàn thiện do ưu tiên dự án khách
- API cập nhật mật khẩu lúc tạo database: **DONE** ✅

**K8s:**
- Hiếu.Lê họp kiến trúc với CMC ngày 16/10
- Kế hoạch DevOps: start, end, PIC, status

**Chốt:**
- Sáng/Hoàng/Tung.Ly: tìm và chốt giải pháp **licence multi-tenant** (21/10)

### Meeting 21/10/2023
**Identity (Hoàng.Nguyễn) — DONE:**
- Move từ tenant cũ sang identity mới ✅
- Chạy identity mới cho main/portal/apiv3 ✅
- Link demo: `https://hn-site.dev.local:2000` (main), `:2001` (portal), `:1801` (identity)

**Monitor & Log:**
- Đọc được log JSON ✅
- Chưa đọc log request (SQLite → cần chuyển sang log JSON)

**Docker:**
- Tạm thời chạy được source HRM ✅

**Chốt (28/10):**
- Hoàng: tiếp tục identity mới (ngôn ngữ, lấy thông tin user, login quản lý tenant, refactor auth)
- Phúc.Dương: chuyển log SQLite → log JSON
- Hiếu.Lê: đọc log request

---

## Tóm tắt tiến độ theo Phase

| Phase | Thời gian | Kết quả chính |
|-------|-----------|---------------|
| **1 - Nghiên cứu** | 15/07–29/07 | Hiểu K8s, Docker; phân tích điểm cần sửa HRM |
| **2 - Core MT** | 05/08–19/08 | Thiết kế Tenant Mgmt UI; schema multi-DB; MinIO storage |
| **3 - Kỹ thuật** | 26/08–23/09 | Redis per-tenant; Identity mới; log per-tenant; K8s với SaveMoney/Hiếu.Lê |
| **4 - Identity + K8s** | 30/09–28/10 | Identity mới DONE; họp CMC; Helm Chart; Monitor/Log kế hoạch |

---

## Điểm dừng (archived)

Dự án dừng tại cuối tháng 10/2023. Các việc còn dở:
- Window Service theo multi-tenant: **chưa xong**
- Biến static / httpContext.cache: **chưa xong**
- Giải pháp licence multi-tenant: **chưa chốt**
- K8s production (CMC/AWS): **đang plan**
- Log request (Loki): **đang làm**
