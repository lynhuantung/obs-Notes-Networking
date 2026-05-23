---
description: "Khách hàng QuickPack Việt Nam (QPVN): sản xuất FMCG, triển khai 8 phân hệ HRM .NET Core, golive 01/12/2025."
type: wiki-entity
tags:
  - khách-hàng
  - quickpack
  - qpvn
  - fmcg
created: 2026-04-27
updated: 2026-04-27
related:
  - "[[wiki/projects/QuickPack-Project]]"
  - "[[wiki/sources/QuickPack-Project-Overview]]"
---

# QuickPack Việt Nam (QPVN)

## Thông tin

| Thuộc tính | Giá trị |
|-----------|---------|
| Tên | QuickPack Việt Nam |
| Viết tắt | QPVN |
| Loại | Khách hàng doanh nghiệp |
| Ngành | Sản xuất / FMCG (bao bì) |
| Liên hệ PM | Trần Phước Hạc (hac.tranphuoc) |
| Liên hệ BA | Nguyễn Quốc Nhựt (nhut.nguyen) |

## Dự án

- [[wiki/projects/QuickPack-Project]] — Triển khai HRM 8 phân hệ, Golive 01/12/2025

## Đặc điểm nghiệp vụ

- **Lương sản phẩm**: chu kỳ lệch so với lương chính → GAP phức tạp nhất trong SAL
- **Đào tạo theo đợt**: nhân viên mới đào tạo theo đợt → cần customization TRA
- **Quản lý đồng phục/thiết bị**: cảnh báo tồn kho, số lượng sắp cấp → logic tồn kho riêng
- **Tuyển dụng 8 cấp**: quy trình duyệt nhiều cấp, chặn vượt định biên

## Server/Hạ tầng

- URL UAT: `https://site1.hrquickpack.vn:8002`
- Stack: IIS + SQL Server + Redis (Windows Server)
