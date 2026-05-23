---
type: source
code: b6n3w
domain: SYS
tags:
  - catbank
  - mvc
  - webapi
  - flow
  - danh-muc
created: 2026-05-05
updated: 2026-05-05
description: "Luồng xử lý màn hình CatBank: 4 tầng View→Controller→HR Service→Business, 5 action Search/Info/Save/Delete, 3 điểm rủi ro"
source-file: raw/Nghiệp vụ HRM/SYS/Sys_Flow_CatBank_08.md
related:
  - "[[wiki/flows/f2m8t-catbank-system-flow]]"
  - "[[wiki/sources/p4m7x-catbank-search-structure]]"
  - "[[wiki/architecture/k9r2b-catbank-mvc-architecture]]"
  - "[[wiki/flows/Flow-DaoTao-DevMoi-HRM]]"
---

# Source: Flow — CatBank (Danh mục Ngân hàng)

## Tóm tắt

Tài liệu mô tả luồng xử lý đầy đủ của màn hình **Danh mục Ngân hàng (CatBank)** trong HRM, được tạo ngày 2026-05-05 như một màn hình mẫu phục vụ đào tạo developer mới. Luồng đi qua 4 tầng kiến trúc: View (Razor cshtml) → MVC Controller → HR Service (gồm MVC API và Web API) → Business (Entity). Tài liệu bao gồm sơ đồ Mermaid, 5 bước chi tiết, và 3 điểm rủi ro kỹ thuật.

## Key Takeaways

- **4 tầng rõ ràng**: View (`Index.cshtml`, `CatBankInfo.cshtml`) → `CatBankController` (MVC) → `Cat_GetDataController` + `Cat_BankController` (Web API) → `CatBankDemoEntity` (Business)
- **Tách biệt 2 loại controller phía service**: `Cat_GetDataController` (MVC API, xử lý load data & action phụ) và `Cat_BankController` (Web API, chỉ GET/POST/DELETE)
- **Search dùng AJAX POST** qua `CatBankDemoSearchModel`, không reload toàn trang
- **ConstantDisplay** chịu trách nhiệm đa ngôn ngữ — điểm rủi ro nếu thiếu key
- **Delete có 2 entry point**: từ Index và từ Info, đều đi qua `CatBankController` (MVC) rồi xuống Web API
- Rủi ro FK constraint khi xóa chưa được guard ở tầng Business

## Trích dẫn quan trọng

> Luồng đi qua 4 tầng: View (Razor) → MVC Controller → HR Service (MVC API + Web API) → Business (Entity).

> `Cat_GetDataController` (MVC API) nhận request, gọi `CatBankDemoEntity` để query DB

> `CatBankController` (MVC) nhận action `delete`, chuyển tiếp tới `Cat_BankController` (Web API)

> View sử dụng `ConstantDisplay` để dịch ngôn ngữ và xử lý hiển thị

## Liên kết

- [[wiki/flows/f2m8t-catbank-system-flow]] — Trang flows chi tiết từ source này
- [[wiki/sources/p4m7x-catbank-search-structure]] — 9 component chi tiết CatBank (source bổ trợ)
- [[wiki/architecture/k9r2b-catbank-mvc-architecture]] — Kiến trúc 4 tầng CatBank
- [[wiki/flows/Flow-DaoTao-DevMoi-HRM]] — Lộ trình đào tạo dev mới, CatBank là màn hình mẫu
