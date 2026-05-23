---
type: meeting
title: "Họp SaaS #14 — 14/10/2023"
date: 2023-10-14
tags: [saas, meeting, identity, k8s, cmc, devops, licence, docker]
prev: "[[Meeting-1007]]"
next: "[[Meeting-1021]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 14/10/2023

## Mục tiêu
- Review tuần trước
- Kế hoạch DevOps và trao đổi về họp kiến trúc CMC

## Review tuần trước

| Hạng mục | Trạng thái |
|----------|-----------|
| Dockerfile bằng dòng lệnh (Minh.NguyễnĐạt) | 🔄 Đang tiếp tục |
| Monitor và log (Hiếu.Lê + Phúc.Dương) | 🔄 Cài đặt môi trường DONE; cấu hình lỗi đang làm |
| Window service multi-tenant (Tung.Ly) | 🔄 Đang xử lý |
| Demo identity mới với a.Hiền (Hoàng) | ✅ Done |
| Giao diện kích hoạt step-by-step (Hoàng) | ✅ 90% — chờ Linh hoàn thiện các case |
| Move tenant cũ sang identity mới (Hoàng) | 🔄 60% |
| API cập nhật mật khẩu lúc tạo database (Hoàng) | ✅ **DONE** |

## Các ý chính

### Identity (Hoàng.Nguyễn)
- Dự kiến 21/10 xong identity mới → tiếp tục apply chạy tenant
- Mục tiêu: có thể demo những phần đã xử lý xong

### Hiếu.Lê — DevOps
- Mô tả tài liệu DevOps
- **Kế hoạch DevOps**: start, end, PIC, status
- **Họp review kiến trúc CMC ngày 16/10/2023**

### Monitor và Log
- Đã cài đặt môi trường ✅
- Đang cấu hình lỗi 🔄

### Licence Multi-Tenant ⚠️
- **Chưa có giải pháp** — cần chốt mô hình licence cho SaaS
- Các câu hỏi cần trả lời: tính theo tenant? theo user? subscription?

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Hiếu.Lê | 16/10 | Họp kiến trúc với CMC; đưa ra kế hoạch cụ thể (start, end, PIC, status) |
| Hoàng.Nguyễn | 21/10 | Hoàn thiện giao diện kích hoạt step-by-step (100%) |
| Sáng + Hoàng + Tung.Ly | 21/10 | Tìm và chốt **giải pháp licence multi-tenant** |
| Minh.NguyễnĐạt | 21/10 | Xử lý dockerfile bằng dòng lệnh |
