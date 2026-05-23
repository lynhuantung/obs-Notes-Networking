---
type: source
description: "Checklist kiểm tra phân quyền HRM: hướng dẫn troubleshoot cache permission, xác định đúng role user."
code: p7xk
tags:
  - "phanquyen"
  - "permission"
  - "cache"
  - "troubleshoot"
  - "system"
domain: system
created: 2026-05-02
updated: 2026-05-02
related:
  - "[[wiki/architecture/HRM-Auth-Architecture]]"
  - "[[wiki/concepts/HRM-Security-Config]]"
  - "[[wiki/flows/Flow-PhanQuyen-HeThong]]"
  - "[[wiki/architecture/HRM-SysDB-Schema]]"
---

# Source: CheckList-PhanQuyen-HRM

## Tóm tắt

Checklist xử lý vấn đề phân quyền HRM — được tạo ngày 2026-05-02 để dùng khi triển khai báo cáo gặp lỗi: không có nút tạo mới, không có quyền duyệt, tìm kiếm thiếu dữ liệu, màn hình không hiển thị. Tài liệu bao gồm 7 mục kiểm tra từ quyền chức năng, quyền dữ liệu, Portal V3, xử lý cache, đến cấu hình `webSettings.json`. Đây là tài liệu thực chiến dành cho SE khi hỗ trợ khách hàng sau go-live.

## Key Takeaways

- **2 loại quyền**: Action Permission (nút/chức năng) và Data Permission (dữ liệu lọc theo phòng ban/đơn vị)
- **Cache là vấn đề phổ biến nhất**: Restart toàn bộ 4 pool IIS sau khi cấp quyền — clear từ UI chỉ clear 1 pool
- **`Hrm_APICenter_Web`** là key bắt buộc trong `webSettings.json` để refresh cache quyền tự động khi dùng API Center
- **`/api/testpermission`** trên API SC dùng để kiểm tra trực tiếp key quyền cho user
- **`isConfigUser = "true"`** bypass toàn bộ kiểm tra quyền — không được nhầm set cho tài khoản thường
- **Bug `Task.Run()`**: background task không truyền được `UserID` header → cache quyền danh mục không clear đúng
- 7000+ key quyền trong hệ thống — cần tra theo menu/module, không dò thủ công

## Trích dẫn quan trọng

> Hệ thống dùng **4 Application Pool** → mỗi pool có cache riêng. Thao tác "xóa cache" từ UI chỉ clear **1 pool** — các pool còn lại không được clear. Fix: **Restart toàn bộ 4 pool IIS**.

> `isConfigUser == "true"` → bypass toàn bộ, return `true` — không bao giờ set nhầm cho tài khoản thường.

> Khi dùng `Task.Run()` (background task) → không truyền được `UserID` header → cache quyền danh mục **không được xóa đúng**.

## Debug nhanh theo triệu chứng

| Triệu chứng | Kiểm tra đầu tiên |
|---|---|
| Không có nút Thêm mới | Key `Modify` trong nhóm quyền + clear cache |
| Không có nút Duyệt | Key `Approve`/`Confirm` + clear cache |
| Tìm kiếm thiếu dữ liệu | Phân quyền phòng ban / danh mục |
| Portal V3 báo no permission | `Hrm_APICenter_Web` config + `/api/testpermission` |
| Đã phân quyền vẫn không nhận | Restart 4 pool IIS + xóa Redis cache + logout-login |
| API SC không nhận key mới | Thiếu `Hrm_APICenter_Web` trong WebSettings |
| Task nền không clear cache quyền | Bug thiếu UserID header trong Task.Run |

## Liên kết

- [[wiki/flows/Flow-PhanQuyen-HeThong]] — Luồng phân quyền SYS: 2 loại, tạo nhóm, gán user, bitwise
- [[wiki/architecture/HRM-Auth-Architecture]] — Kiến trúc RBAC, permission cache Redis/Memory
- [[wiki/concepts/HRM-Security-Config]] — VnrDecrypt, AllowOrigin, permission cache config
- [[wiki/architecture/HRM-SysDB-Schema]] — Schema `Sys_UserInfo`, `GroupPermission2`
