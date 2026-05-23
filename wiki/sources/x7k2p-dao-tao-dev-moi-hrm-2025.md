---
type: source
code: x7k2p
description: "Kế hoạch đào tạo NV mới vào codebase HRM 2025: lộ trình 3 module video, kiến trúc 4 tầng, luồng Search/Excel/Delete."
domain: system
tags:
  - dao-tao
  - onboarding-dev
  - hrm-architecture
created: 2025-04-17
updated: 2026-05-05
source-file: raw/archive/3. ARCHIEVED/Dự án 2025/Kế hoạch đào tao/
related:
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/flows/Flow-DaoTao-DevMoi-HRM]]"
  - "[[wiki/flows/Flow-Onboarding-NhanVien]]"
---

# Source: Kế hoạch đào tạo Developer mới vào HRM (2025)

## Tóm tắt

Bộ tài liệu nội bộ năm 2025 phục vụ đào tạo developer mới tiếp cận codebase HRM. Gồm 3 module video (khoảng 15 phút/video): giới thiệu kiến trúc, hướng dẫn tìm kiếm/xuất Excel/xóa, và tạo mới/chỉnh sửa. Mỗi module có slide nội dung + kịch bản lời thoại + sơ đồ component chi tiết. Phương pháp giảng dạy dựa trên tư duy nguyên bản (First Principles) lấy cảm hứng từ Lego.

## Key Takeaways

- **Kiến trúc 4 tầng**: Presentation (MVC) → Service (Web API) → Business → Data (SQL Server)
- **4 project chính**: `HRM.Presentation.Main`, `EmpPortal`, `Hr.Service`, `HrmSystem.Service`
- **Cấu trúc màn hình danh mục chuẩn**: Sitemap → Điều kiện tìm kiếm → Nút xử lý → Kendo Grid
- **Luồng Search**: View AJAX → `CatBankDemoSearchModel` → `Cat_BankController.GET` → `CatBankDemoEntity.Search()` → DB
- **Luồng Delete**: Confirm → `DELETE /api/Cat_Bank/{id}` → `CatBankDemoEntity.Delete()` → DB
- **Xuất Excel**: 2 cách — gọi API lấy data rồi tạo file, hoặc xử lý trực tiếp tại MVC Controller (EPPlus/Aspose)
- **Đổi cột**: Frontend-only, `columnMenu: true` trong Kendo Grid, không ảnh hưởng API
- **Phương pháp dạy**: Chia nhỏ đến thành phần nguyên bản → kết nối lại theo cách mới (Lego thinking)

## Trích dẫn quan trọng

> Hệ thống được chia thành 4 tầng chính: Presentation – Service – Business – Data. Dữ liệu luân chuyển từ UI ➝ API ➝ Business ➝ Data.

> Với cấu trúc cố định này, bạn chỉ cần học một lần là có thể áp dụng cho rất nhiều màn hình tương tự.

> Khi gặp vấn đề khó về thêm xóa sửa màn hình, thay vì lao vào giải quyết liền, thử hỏi "những sự thật cơ bản nhất, cái mà không thể bàn cãi gì được nữa về vấn đề này nó là gì?"

## Component sơ đồ màn hình danh mục (CatBank demo)

| Component | Vai trò |
|-----------|---------|
| `Index.cshtml` | View chính: tìm kiếm, xóa, mở form thêm mới |
| `CatBankController` | MVC Controller: `Index`, `CatBankInfo`, `RemoveSelected` |
| `CatBankDemoSearchModel` | Gom điều kiện filter từ giao diện |
| `CatBankDemoModel` | Data binding vào View |
| `Cat_BankController` | Web API: `GetByID`, `POST`, `DeleteOrRemove` |
| `Cat_GetDataController` | Load data phụ / bổ trợ |
| `CatBankDemoEntity` | Business logic: `Search()`, `Save()`, `Delete()` |
| `CatBankInfo.cshtml` | View tạo mới / chỉnh sửa |

## Liên kết

- Kiến trúc hệ thống: [[wiki/architecture/HRM-System-Architecture]]
- Luồng đào tạo 3 module: [[wiki/flows/Flow-DaoTao-DevMoi-HRM]]
- Onboarding nhân viên: [[wiki/flows/Flow-Onboarding-NhanVien]]
- Chi tiết 9 component CatBank: [[wiki/sources/p4m7x-catbank-search-structure]]
- Sơ đồ kiến trúc CatBank: [[wiki/architecture/k9r2b-catbank-mvc-architecture]]
