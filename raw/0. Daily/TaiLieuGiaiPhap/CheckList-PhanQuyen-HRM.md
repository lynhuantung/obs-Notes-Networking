---
aliases:
  - Checklist xử lý vấn đề phân quyền HRM
date: 2026-05-02
tags:
  - checklist
  - "#phanquyen"
  - "#permission"
  - "#cache"
  - "#troubleshoot"
Related:
  - "[[Giải trình lỗi cache phân quyền]]"
  - "[[Sys017 - Portal không nhận key quyền]]"
  - "[[View cấu hình phân quyền theo menu]]"
---

# ✅ Checklist Xử Lý Vấn Đề Phân Quyền HRM

> Dùng khi triển khai báo cáo: không có nút tạo mới, không có quyền duyệt, tìm kiếm thiếu dữ liệu, màn hình không hiển thị.

---

## 1. Kiểm tra quyền chức năng (Action Permission)

> **Triệu chứng:** Bấm tìm kiếm được nhưng không có nút **Thêm mới**, **Duyệt**, **Xóa**, **Import/Export**

- [ ] Vào **Hệ thống > Nhóm quyền** → tìm nhóm quyền của user
- [ ] Kiểm tra các key quyền theo màn hình (dùng màn hình **View cấu hình phân quyền theo menu** nếu có)
- [ ] Các key quyền thường cần đủ bộ:
  - `View` – xem danh sách
  - `Modify` – thêm/sửa
  - `Delete` – xóa
  - `Approve` / `Confirm` – duyệt
  - `Import` / `Export` – import/export
- [ ] Nếu màn hình dùng **Privilege** bitwise: kiểm tra giá trị hex trong `ListPermissionByScreen` có đúng không
- [ ] Sau khi cấp quyền → **xóa cache** (xem mục 4)

---

## 2. Kiểm tra phân quyền dữ liệu (Data Permission)

> **Triệu chứng:** Có quyền xem nhưng kết quả tìm kiếm **thiếu dữ liệu**, không thấy nhân viên/phòng ban/dự án

- [ ] Kiểm tra **phân quyền phòng ban** (`Cat_OrgStructure`) — user có được gán quyền xem các phòng ban cần thiết không
- [ ] Kiểm tra **phân quyền hồ sơ nhân viên** (`Hre_Profile`) — có phân quyền theo đơn vị/chi nhánh không
- [ ] Kiểm tra **phân quyền chức vụ** (`Cat_Jobtitle`) nếu lọc theo chức danh
- [ ] Kiểm tra cấu hình **phân quyền theo dự án/danh mục** nếu module dùng danh mục riêng
- [ ] Kiểm tra user có bị **giới hạn đơn vị** trong thiết lập tài khoản không

---

## 3. Kiểm tra Portal V3 / API SC (testpermission)

> **Triệu chứng:** HRM Web có quyền, nhưng **Portal V3** hoặc **API SC** báo không có quyền

- [ ] Vào API SC → dùng endpoint **`/api/testpermission`** để kiểm tra trực tiếp key quyền cho user
- [ ] Kiểm tra cấu hình `Hrm_APICenter_Web` trong file `WebSettings.json` của `WebMain`:
  ```json
  "Hrm_APICenter_Web": "https://<domain>:<port>/"
  ```
  → Nếu thiếu key này, khi sửa nhóm quyền hệ thống **sẽ không tự refresh cache** ở API Center
- [ ] Sau khi thêm key → restart pool IIS của WebMain, sau đó thử phân quyền lại
- [ ] Kiểm tra Portal V3 có đang kết nối đúng API SC không (URL, port)

---

## 4. Xử lý cache phân quyền

> **Triệu chứng:** Đã phân quyền xong nhưng **vẫn chưa nhận quyền**, F5 vẫn không thấy

### 4a. Cache Memory (IIS)

- [ ] Hệ thống dùng **4 Application Pool** → mỗi pool có cache riêng
- [ ] Thao tác "xóa cache" từ UI chỉ clear **1 pool** — các pool còn lại không được clear
- [ ] Fix: **Restart toàn bộ 4 pool IIS** (hoặc recycle từng pool)
- [ ] Nếu chưa nâng .NET framework → không đồng bộ được cache Memory cross-pool → phải dùng Redis

### 4b. Cache Redis (Phân tán)

- [ ] Kiểm tra Redis Sentinel có đang chạy không (dùng `mcp Redis_Sentinel`)
- [ ] Xóa key cache liên quan đến user/nhóm quyền trên Redis:
  - Pattern thường dùng: `permission_*`, `user_*<userId>*`
- [ ] Kiểm tra tất cả dự án (services) đã **bật Redis cache** chưa — nếu 1 service chưa bật → dữ liệu không đồng bộ
- [ ] **Lưu ý:** Khi dùng `Task.Run()` (background task) → không truyền được `UserID` header → cache quyền danh mục **không được xóa đúng** → cần confirm fix đã thêm header vào task.run chưa

### 4c. Sau khi phân quyền — checklist xóa cache đúng cách

- [ ] Vào UI HRM → Xóa cache hệ thống (nếu có chức năng)
- [ ] Restart/Recycle toàn bộ Application Pool IIS
- [ ] Xóa Redis key liên quan (nếu cần)
- [ ] Yêu cầu user **logout → login lại** để nhận session mới
- [ ] Test lại bằng `/api/testpermission` trên API SC

---

## 5. Kiểm tra cấu hình WebSettings.json

> Các key quan trọng liên quan phân quyền

| Key | Mô tả |
|-----|-------|
| `Hrm_APICenter_Web` | URL của API Center — cần có để refresh cache quyền tự động |
| `isConfigUser` | Nếu = `"true"` → **bỏ qua toàn bộ kiểm tra quyền** (dùng cho config user) |

- [ ] Đọc file: `Presentation\HRM.Presentation.Main\webSettings.json`
- [ ] Xác nhận `Hrm_APICenter_Web` đã khai báo và URL đúng
- [ ] Kiểm tra `isConfigUser` không bị set `true` nhầm cho tài khoản thường

---

## 6. Kiểm tra tài khoản & nhóm quyền

- [ ] User đã được gán **nhóm quyền** chưa (không chỉ tạo tài khoản)
- [ ] Nhóm quyền đã được gán cho **đúng đơn vị/chi nhánh** chưa
- [ ] Kiểm tra user không bị **trùng nhóm quyền conflict** (quyền A cấp, quyền B thu hồi cùng key)
- [ ] Kiểm tra **tài khoản còn active** không (không bị khóa/hết hạn)
- [ ] Nếu mới tạo tài khoản: đã chạy quy trình **"Tạo TK phân quyền nhanh"** đủ bước chưa

---

## 7. Debug nhanh theo triệu chứng

| Triệu chứng | Kiểm tra đầu tiên |
|---|---|
| Không có nút Thêm mới | Key `Modify` trong nhóm quyền + clear cache |
| Không có nút Duyệt | Key `Approve`/`Confirm` + clear cache |
| Tìm kiếm thiếu dữ liệu | Phân quyền phòng ban / danh mục |
| Portal V3 báo no permission | `Hrm_APICenter_Web` config + `/api/testpermission` |
| Đã phân quyền vẫn không nhận | Restart 4 pool IIS + xóa Redis cache + logout-login |
| API SC không nhận key mới | Thiếu `Hrm_APICenter_Web` trong WebSettings |
| Task nền không clear cache quyền | Bug thiếu UserID header trong Task.Run |

---

## Ghi chú kỹ thuật

- `checkPermission(privilegeType, screen)` trong `hrm-data.js`:
  - Ưu tiên đọc từ `VnrCommon.ListPermissionByScreen` (client-side cache)
  - Nếu không có → gọi AJAX `MainBase/CheckPermission` (server)
  - `isConfigUser == "true"` → bypass toàn bộ, return `true`
- Hệ thống có **2 loại cache**: Memory (per-pool) và Redis (distributed)
- **7000+ key quyền** → cần tra theo menu/module, không dò thủ công từng key
- Màn hình xem cấu hình quyền theo menu: đọc từ `mvcsitemap` → hiển thị quyền theo nhóm
