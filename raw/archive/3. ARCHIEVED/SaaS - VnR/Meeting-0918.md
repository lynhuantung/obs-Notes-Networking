---
type: meeting
title: "Họp SaaS #10 — 18/09/2023"
date: 2023-09-18
tags: [saas, meeting, identity, minio, redis, windowservice, log]
prev: "[[Meeting-0909]]"
next: "[[Meeting-0923]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 18/09/2023

## Mục tiêu
- Review tuần 11–16/09
- Xử lý các vấn đề tồn đọng

## Review tuần trước ✅ / ❌

| Hạng mục | Kết quả |
|----------|---------|
| K8s — có người hỗ trợ | ✅ Phúc + Tú làm việc với người mới (Hiếu.Lê) |
| App mobile lên storage | ⏳ Hiếu.Trần confirm cuối tháng 09/2023 |
| Biến static → Redis cache | ✅ Đã xử lý lưu Redis cache khi lưu memory cache theo `tenantCode` |
| SaveMoney dựng server K8s | 🔄 Đang tiếp tục |
| Tính năng đăng nhập Tenant Mgmt | ✅ Hoàng xử lý trên Identity Server (tạm lấy từ WebSettings.json) |
| Web quản lý ứng dụng của User (Login, Dashboard) | ✅ User tạo công ty thành công (Linh, Minh, Bảo) |
| Gửi lại email kích hoạt | ✅ Done |
| Màn hình thông tin tài khoản | ✅ Done (chưa có API) |
| Chi tiết thông tin công ty | ✅ Done (chưa có API) |
| Link SaaS để kiểm tra | ✅ Đã dựng |
| MinIO SSL | ❌ Phúc chưa dựng được SSL |
| MinIO download file | ❌ Gặp vấn đề nhập mật khẩu mặc định |

## Các ý chính

### MinIO
- Download file gặp vấn đề nhập mật khẩu mặc định
- Chưa dựng được SSL

### Màn hình kích hoạt tài khoản (Step-by-step)
- Chưa có Design; FE + BE chưa xử lý
- Cần điều chỉnh lại màn hình xác nhận kích hoạt theo flow step-by-step

### Đổi mật khẩu lần đầu (tenant đăng ký)
- Có thể làm API trước (FE + BE)

### Biến static / httpContext
- Nếu có giải pháp → lên tài liệu hướng dẫn anh/em code

### Window Service — vấn đề mới phát sinh
- ⚠️ Window service chạy với `tenantCode`: **chưa xác định được tenantCode**
- Đề xuất thêm `tenantCode` vào Window Service
- Cần Vũ.Lê hỗ trợ

### Log
- Vấn đề: log chung không phân biệt tenant
- Sau khi Luân tạo template mẫu → Sáng.Mai đồng bộ file template lên MinIO

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Linh + Minh + Bảo | 23/09 | Xử lý filter được tất cả màn hình quản lý tenant |
| Sáng | 23/09 | Fix MinIO (chữ hoa/thường) |
| Tùng + Sáng | 23/09 | Fix Superadmin chưa chạy được sau khi tạo database mới |
| Hoàng + Tùng | 23/09 | Fix login user sai |
| Vũ + Sáng + Tùng | 23/09 | Log: chia thư mục theo `tenantCode` |
| Sáng + Tùng | 23/09 | Window service: xử lý sub-process theo từng `tenantCode` → xử lý qua API |
