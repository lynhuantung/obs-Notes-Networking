---
description: "Biên bản họp kỹ thuật Terumo (12/2024): vấn đề tách user main/portal trong HRM V3 — giải pháp tạo user main không cần chọn nhân viên."
type: source
tags:
  - terumo
  - phan-quyen
  - user-management
  - portal
  - meeting
  - archived-2024
date-ingested: 2026-04-27
date-updated: 2026-04-27
source-file: "3. ARCHIEVED/dự án 2025/Terumo-Project/H-TERUMO-SYS-181224.md"
related:
  - "[[wiki/entities/Terumo]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
---

# Terumo — Họp Hệ Thống: Tách User Main/Portal (12/2024)

## Tóm tắt

Biên bản họp kỹ thuật về vấn đề **tách biệt user main và user portal** trong dự án Terumo (12/2024). Đây là edge case của HRM V3: hệ thống V3 bắt buộc gắn nhân viên khi tạo user, dẫn đến user portal nhìn thấy dữ liệu đăng ký hộ trên main — không đúng nghiệp vụ.

## Key Takeaways

**Vấn đề HRM V3**:
- V3 bắt buộc gắn nhân viên khi tạo user (cả main lẫn portal)
- Kết quả: 3 loại user bị lẫn lộn: (1) dùng cả main+portal, (2) portal only, (3) đăng ký hộ trên main + dùng portal
- User portal nhìn thấy dữ liệu đăng ký hộ từ main → nhầm lẫn

**Giải pháp chốt — Tách 2 user riêng biệt**:
- User main: **không cần chọn nhân viên** khi tạo
- User portal: **vẫn cần chọn nhân viên** (phân quyền như hiện tại)
- Estimate: 1 ngày phân tích kỹ thuật + 1 ngày thiết kế quyền

## Bài học

- HRM V3 ràng buộc user-nhân viên chặt hơn V2 → cần xác nhận sớm về mô hình user (ai dùng main, ai dùng portal, ai dùng cả hai) ngay khi onboard dự án V3
- Pattern tách user main/portal là giải pháp chung cho nhiều KH có người dùng admin không phải nhân viên

## Liên kết

- [[wiki/entities/Terumo]]
- [[wiki/concepts/HRM-Security-Config]]
