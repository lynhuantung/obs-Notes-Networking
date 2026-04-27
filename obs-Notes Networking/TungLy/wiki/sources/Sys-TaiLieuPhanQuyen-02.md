---
type: source
domain: system
tags:
  - sys
  - permission
  - rbac
  - training
created: 2026-04-27
updated: 2026-04-27
source-file: raw/Nghiệp vụ HRM/SYS/Sys_TaiLieuPhanQuyen_02.md
related:
  - "[[wiki/flows/Flow-PhanQuyen-HeThong]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/sources/Sys-TaiLieuHeThong-01]]"
---

# Source: Tài Liệu Phân Quyền HRM — Module SYS (02)

## Tóm tắt

Tài liệu đào tạo nhân viên mới về **phân quyền HRM Pro 8**, viết bởi Tung.Ly vào 06/2017. Hướng dẫn thực hành đầy đủ từ khái niệm đến thao tác UI: phân loại 2 loại quyền (dữ liệu và chức năng), cách tạo nhóm quyền mới (2 bước), phân quyền theo màn hình/nút/tab, và đăng ký tài nguyên mới vào hệ thống. Là tài liệu onboarding SE khi tiếp cận phân quyền HRM lần đầu.

## Key Takeaways

- **2 loại phân quyền**: (1) **Phân quyền dữ liệu** — theo phòng ban, nơi làm việc; (2) **Phân quyền chức năng** — theo màn hình, nút, tab
- **Tạo nhóm quyền 2 bước**: Bước 1 — tạo nhóm tại *Hệ thống > Nhóm quyền*; Bước 2 — gán user vào nhóm tại *Hệ thống > Người dùng*
- **Tên resource chuẩn**: `Controller_Action` cho màn hình (vd: `Cat_Bank_index`), `Controller_Action_IDButton` cho nút (vd: `Cat_DayOff_Index_btnAnalyzeCompensateHoliday`), ID tab HTML cho tab (vd: `InfoContactDetail`)
- **Tài nguyên mới**: nếu màn hình/nút/tab mới chưa có trong danh sách → vào *Hệ thống > Danh sách tất cả tài nguyên* (cần đăng nhập superadmin) để import/refresh
- **Phân cấp theo user**: có thể phân quyền cấp bậc, user cấp trên có thể giới hạn quyền user cấp dưới

## Trích dẫn quan trọng

> Phân nhóm quyền cần 2 bước: (1) tạo nhóm quyền và gán tài nguyên; (2) vào màn hình người dùng để gán nhóm quyền cho từng user.

> Ví dụ phân quyền cho màn hình `Cat_Bank/index` → tìm tên quyền `Cat_Bank_index` (Tên controller_Action) và thực hiện phân các quyền như Xem, Tạo mới, Xóa, Sửa…

> Nếu muốn phân quyền cho màn hình/nút/tab mới tạo chưa có trong danh sách → vào *DS tất cả tài nguyên* — yêu cầu phải đăng nhập bằng superadmin.

## Liên kết

- [[wiki/flows/Flow-PhanQuyen-HeThong]] — Quy trình phân quyền step-by-step
- [[wiki/concepts/HRM-Security-Config]] — Cấu hình bảo mật, RBAC
- [[wiki/sources/Sys-TaiLieuHeThong-01]] — Schema DB Sys_Group, Sys_GroupPermission2, Sys_Resource
