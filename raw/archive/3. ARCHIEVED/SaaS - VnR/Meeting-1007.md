---
type: meeting
title: "Họp SaaS #13 — 07/10/2023"
date: 2023-10-07
tags: [saas, meeting, monitor, log, docker, windowservice, identity]
prev: "[[Meeting-0930]]"
next: "[[Meeting-1014]]"
related: ["[[SaaS-Ky-Thuat-Quyet-Dinh]]"]
---

# Biên Bản Họp — 07/10/2023

## Mục tiêu
- Review tuần trước
- Kiến trúc K8s từ Hiếu.Lê và kế hoạch DevOps

## Review tuần trước

| Hạng mục | Trạng thái |
|----------|-----------|
| K8s — define tiêu chuẩn (Hiếu.Lê) | ✅ a.Hiền review kế hoạch 4 tháng với Hiếu |
| S3 môi trường test (Hiếu.Lê) | ✅ Chuẩn bị |
| K8s AWS với CMC (Hiếu.Lê) | ✅ Đã làm việc |
| Claim tenant null (Tung.Ly) | ✅ **Đã xử lý được** |
| Identity + giao diện (Hoàng.Nguyễn) | 🔄 Còn nhiều việc tiếp tục |

## Các ý chính

### Monitor & Log cho web HRM
- Ghi log cho ứng dụng nội bộ
- Hiếu.Lê + Phúc.Dương: kế hoạch triển khai và demo (Hiếu gửi kế hoạch 09/10)

### Docker
- Sửa Docker file compose

## Chốt công việc

| Người | Deadline | Công việc |
|-------|----------|-----------|
| Minh.NguyễnĐạt | 14/10 | Xử lý dockerfile bằng dòng lệnh |
| Hiếu.Lê + Phúc.Dương | 14/10 | Monitor và log: kế hoạch triển khai + demo (Hiếu gửi kế hoạch 09/10) |
| Tung.Ly | 14/10 | Xử lý Window service theo multi-tenant |
| Hoàng | 09/10 | Demo identity mới với a.Hiền |
| Hoàng | 14/10 | Xử lý giao diện tenant step-by-step khi kích hoạt tài khoản multi-tenant |
