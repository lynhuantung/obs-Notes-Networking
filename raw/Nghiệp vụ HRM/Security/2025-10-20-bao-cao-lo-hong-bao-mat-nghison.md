---
title: "Báo cáo lỗ hổng bảo mật dự án NghiSon — 2025"
date: 2025-10-20
domain: security
module: "NghiSon — Máy chủ Redis"
tags: [security, vulnerability, cve, redis, lua, rce, nghison]
verified: yes
---

# Báo cáo lỗ hổng bảo mật dự án NghiSon — 2025

## Tóm tắt

Dự án NghiSon phát hiện **1 lỗ hổng bảo mật mức Critical** vào ngày 20/10/2025, do **khách hàng báo cáo**.
Lỗ hổng liên quan đến Redis CVE-2025-49844 — cho phép thực thi mã tùy ý (RCE) trên máy chủ thông qua Lua scripting.
Lỗ hổng đã được đóng / bỏ qua.

---

## ĐỢT 1 — 20/10/2025 | Phát hiện bởi: Khách hàng | Tác động: Máy chủ

---

### 1. vulnerability Critical — CVE-2025-49844 (Redis Lua Scripting Use-After-Free)

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 20/10/2025 |
| **Phát hiện bởi** | Khách hàng |
| **Tác động** | Máy chủ |
| **Mã lỗ hổng** | CVE-2025-49844 |
| **Mức độ** | 🔴🔴 Critical |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Một use-after-free trong subsystem Lua scripting của Redis, cho phép attacker thoát khỏi sandbox Lua và thực thi mã tùy ý trên máy chủ.
> Tham khảo: https://www.sysdig.com/blog/cve-2025-49844-redishell

**Cách khắc phục (nguyên văn):**
> Update redis lên phiên bản tối thiểu là 8.2.2

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến những nơi có dùng redis

**Notes (nguyên văn):**
> Nếu khai thác thành công kẻ tấn công có thể mở shell / reverse shell → kiểm soát host.
> Đọc file nhạy cảm (/etc/passwd, SSH keys, token môi trường, file config).
> Ghi/cài đặt phần mềm (malware, miner)

---

## Tổng hợp

| # | Tiêu đề | Mã lỗ hổng | Mức độ | Tác động | Trạng thái |
|---|---|---|---|---|---|
| 1 | vulnerability Critical CVE-2025-49844 (Redis Lua Scripting Use-After-Free) | CVE-2025-49844 | 🔴🔴 Critical | Máy chủ | ✅ Đã đóng / Bỏ qua |

---

## Bài học / Lưu ý

- **CVE-2025-49844 là lỗ hổng RCE Critical**: Kẻ tấn công có thể thoát khỏi sandbox Lua của Redis và chiếm quyền kiểm soát toàn bộ host — cần có quy trình patch khẩn cấp khi CVE critical liên quan đến infrastructure.
- **Phát hiện bởi khách hàng**: Cần chủ động theo dõi CVE của các thành phần infrastructure (Redis, Nginx, OS...) thay vì chờ khách hàng phát hiện. Có thể dùng các công cụ như Trivy, Grype hoặc theo dõi feed CVE định kỳ.
- **Redis version management**: Đảm bảo Redis luôn được cập nhật lên phiên bản tối thiểu an toàn (≥ 8.2.2 cho lỗ hổng này). Cần có checklist version audit cho toàn bộ infrastructure.
- **Lỗ hổng tương tự VietCap**: CVE-2025-49844 cũng xuất hiện ở dự án VietCap (17/10/2025) — cho thấy đây là lỗ hổng phổ biến trên nhiều dự án dùng Redis, cần patch đồng loạt trên tất cả các hệ thống.
