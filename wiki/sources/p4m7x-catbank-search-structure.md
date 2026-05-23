---
type: source
code: p4m7x
description: "Chi tiết 9 component màn hình danh mục CatBank: MVC Controller, Web API, Entity, Model, View, ConstantDisplay."
domain: system
tags:
  - dao-tao
  - hrm-architecture
  - catbank
  - mvc
created: 2026-05-05
updated: 2026-05-05
source-file: raw/archive/3. ARCHIEVED/Dự án 2025/Kế hoạch đào tao/Cấu trúc search/
related:
  - "[[wiki/sources/x7k2p-dao-tao-dev-moi-hrm-2025]]"
  - "[[wiki/architecture/k9r2b-catbank-mvc-architecture]]"
  - "[[wiki/architecture/HRM-System-Architecture]]"
  - "[[wiki/flows/Flow-DaoTao-DevMoi-HRM]]"
---

# Source: Cấu trúc Search — CatBank Demo (9 component)

## Tóm tắt

Bộ 9 file ghi chú chi tiết từng component của màn hình danh mục **CatBank** — màn hình mẫu dùng để đào tạo developer mới HRM 2025. Mỗi file mô tả một class/view trong kiến trúc 4 tầng: Presentation (MVC Controller + View), Service (Web API Controller), Business (Entity), và Model. Tài liệu này là phần drill-down từ bộ kế hoạch đào tạo tổng quan (`x7k2p`).

## Key Takeaways

- **MVC Controller** (`CatBankController`): 3 action chính — `Index`, `CatBankInfo`, `RemoveSelected`
- **Web API Controller** (`Cat_BankController`): `GetByID`, `POST`, `DeleteOrRemove` — là điểm trung gian giữa MVC và Entity
- **Entity** (`CatBankDemoEntity`): tầng Business — chứa `Search()`, `Save()`, `Delete()`
- **SearchModel** (`CatBankDemoSearchModel`): chỉ dùng khi nhấn "Tìm kiếm", gửi AJAX đến `Cat_BankController`
- **DisplayModel** (`CatBankDemoModel`): binding dữ liệu vào Kendo Grid trên `Index.cshtml`; field names định nghĩa nested class `FieldNames`
- **View** `Index.cshtml`: giao diện chính (tìm kiếm, xóa, mở form thêm mới)
- **View** `CatBankInfo.cshtml`: form chi tiết / thêm mới; dùng `ConstantDisplay` để dịch label
- **`Cat_GetDataController`**: controller phụ — load dữ liệu cho tìm kiếm bổ sung / xuất Excel
- **`ConstantDisplay`**: thư viện hằng số label, dùng `[DisplayName(ConstantDisplay.HRM_Category_Bank_*)]` để localize

## Trích dẫn quan trọng

> `CatBankDemoModel` kế thừa `BaseViewModel` và chứa class lồng `FieldNames` với các `const string` dùng để map cột Kendo Grid mà không hard-code tên cột.

> `Cat_BankController` nhận request từ cả `CatBankDemoSearchModel` (search) lẫn `CatBankController` (delete), rồi gọi xuống `CatBankDemoEntity`.

> `ConstantDisplay` được dùng trực tiếp trong `[DisplayName(...)]` attribute của Model — mọi label hiển thị đi qua đây, không hard-code chuỗi trong code.

## Mapping component → tầng kiến trúc

| Component | Tầng | Vai trò |
|-----------|------|---------|
| `Index.cshtml` | Presentation / View | Giao diện chính |
| `CatBankInfo.cshtml` | Presentation / View | Form chi tiết / thêm mới |
| `CatBankController` | Presentation / MVC Controller | Điều phối View |
| `Cat_BankController` | Service / Web API | Endpoint CRUD |
| `Cat_GetDataController` | Service / Web API | Data phụ / xuất Excel |
| `CatBankDemoSearchModel` | Model | Filter tìm kiếm |
| `CatBankDemoModel` | Model | Data binding Grid |
| `CatBankDemoEntity` | Business | Logic nghiệp vụ |
| `ConstantDisplay` | Cross-cutting | Label / localization |

## Liên kết

- Tổng quan đào tạo: [[wiki/sources/x7k2p-dao-tao-dev-moi-hrm-2025]]
- Sơ đồ kiến trúc CatBank: [[wiki/architecture/k9r2b-catbank-mvc-architecture]]
- Kiến trúc hệ thống HRM: [[wiki/architecture/HRM-System-Architecture]]
- Luồng đào tạo dev mới: [[wiki/flows/Flow-DaoTao-DevMoi-HRM]]
