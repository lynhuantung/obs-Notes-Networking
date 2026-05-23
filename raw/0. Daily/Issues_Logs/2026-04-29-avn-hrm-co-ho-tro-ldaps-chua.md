---
title: "AVN - Câu hỏi triển khai: HRM có hỗ trợ LDAPS chưa?"
date: 2026-04-29
project: AVN
domain: system
module: Authentication / LDAP
tags: [deployment-question, ldap, ldaps, avn, authentication]
status: pending
verified: no
---

# AVN — Câu hỏi triển khai: HRM có hỗ trợ LDAPS chưa?

## Bối cảnh

Trong quá trình triển khai dự án AVN, phát sinh yêu cầu từ phía khách hàng:
**không dùng LDAP nữa, chuyển sang LDAPS** vì lý do bảo mật.

Câu hỏi đặt ra: **HRM hiện tại có hỗ trợ LDAPS chưa?**

## Trigger ban đầu

- User `trinh_ttt` không vào được phiếu lương, hệ thống báo sai mật khẩu.
- Nghi ngờ nguyên nhân liên quan đến LDAP.
- IT phía khách hàng thông báo yêu cầu đổi sang LDAPS.

## Câu hỏi / Vấn đề

1. HRM có hỗ trợ LDAPS chưa?
2. Nếu chuyển từ LDAP → LDAPS thì cần chuẩn bị gì?

## Thông tin ghi nhận từ trao đổi

- **Hiện trạng:** Khách hàng đang dùng LDAP; IT yêu cầu đổi sang LDAPS vì bảo mật.
- **Trả lời ban đầu:** Chưa rõ HRM có sẵn hỗ trợ LDAPS hay chưa — cần raise task để kiểm tra.
- **Action items:**
  - [ ] Raise task nghiên cứu HRM có hỗ trợ LDAPS chưa.
  - [ ] Xin tài khoản test LDAPS từ IT phía khách hàng.
  - [ ] Test thử LDAPS trên Ultra Server của khách hàng.
  - [ ] Tìm hiểu tài liệu về LDAP/LDAPS để chuẩn bị.

## Trạng thái

- Chưa có kết luận — đang ở giai đoạn khảo sát / raise task.

## Liên kết liên quan

- [[wiki/projects/AVN]] ← dự án AVN
- [[wiki/sources/ldap-ldaps]] ← tài liệu LDAP/LDAPS (nếu có)
