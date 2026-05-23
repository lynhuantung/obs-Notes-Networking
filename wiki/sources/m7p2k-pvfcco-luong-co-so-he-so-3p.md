---
type: source
code: m7p2k
description: "MODIFY PVFCCo: thêm Lương cơ sở từ Hệ số lương 3P vào màn hình Lương cơ bản + 2 enum tính lương trước/sau thay đổi"
tags:
  - "pvfcco"
  - "payroll"
  - "modify"
  - "3p-coefficient"
domain: payroll
created: 2026-05-05
updated: 2026-05-05
source-file: "raw/0. Daily/Clippings/MODIFY_THÊM_LƯƠNG_CƠ SỞ CỦA HỆ SỐ 3P.md"
related:
  - "[[wiki/concepts/HRM-Modules]]"
---

# Source: MODIFY — Thêm Lương cơ sở của Hệ số 3P (PVFCCo)

> Nguồn gốc: [Confluence PVFCCo](https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=79552700) — tài liệu PE/CS

## Tóm tắt

Khách hàng PVFCCo yêu cầu hiển thị **Mức lương cơ sở** (từ Hệ số lương 3P) trên màn hình Lương cơ bản. Khi người dùng chọn Ngày hiệu lực và Bậc lương, hệ thống tự động load mức lương cơ sở 3P tương ứng theo ngày hiệu lực. Ngoài ra, bổ sung **2 enum tính lương** mới: mức lương cơ sở trước và sau khi thay đổi lương trong tháng (logic 1 tháng chỉ thay đổi lương 1 lần). Field lưu vào `Sal_BaseSalaryEffect.BaseSalary` + `Sal_BaseSalaryEffect.Coefficient3PID`.

## Key Takeaways

- **Field mới**: `Base Salary` (Lương cơ sở) — thêm vào popup Tạo mới/Cập nhật Lương cơ bản; readonly, load từ Hệ số lương 3P theo ngày hiệu lực
- **Cột hiển thị + Enum xuất BC Excel**: thêm cột "Lương cơ sở" vào danh sách Lương cơ bản
- **Enum 1 — Mức lương cơ sở sau thay đổi lương** (mới nhất trong kỳ):
  - Bước 1: Tìm dòng lương cơ bản cùng nhân viên, ngày hiệu lực trong khoảng [đầu tháng, cuối tháng], lấy dòng ngày hiệu lực MỚI NHẤT
  - Bước 2: Load `BaseSalary` của dòng đó; nếu không tìm → trả về 0
- **Enum 2 — Mức lương cơ sở trước thay đổi lương** (liền kề trước kỳ):
  - Bước 1: Tìm dòng lương cơ bản cùng nhân viên, ngày hiệu lực < ngày đầu tháng, lấy dòng ngày hiệu lực MỚI NHẤT
  - Bước 2: Load `BaseSalary` của dòng đó; nếu không tìm → trả về 0
- **Table liên quan**: `Sal_BaseSalaryEffect` — thêm field `BaseSalary` và `Coefficient3PID` (logic load đã có, SE thêm field để lưu)
- **Đường dẫn màn hình**:
  - Lương > Dữ liệu tính lương > Lương cơ bản > Lương cơ bản (popup + danh sách)
  - Lương > Cấu hình tính lương > Phần tử lương > Phần tử tính lương (thêm 2 enum mới)
- **Test case mẫu**: NV HVT0102, ngạch C.01 (Chủ tịch HĐQT), bậc 1, hệ số P1=24.5, ngày HLực 01/10/2025 → Lương cơ sở: 5,000,000

## Trích dẫn quan trọng

> Khi chọn ngày hiệu lực và Bậc lương ở mh Lương cơ bản thì load mức lương cơ sở 3P theo ngày hiệu lực

> Mô tả Load Mức lương cơ sở theo hiệu lực (Sal_BaseSalaryEffect.BaseSalary && Sal_BaseSalaryEffect.Coefficient3PID (readonly) - Hiện tại đã có logic load lên để tính - SE thêm field để lưu)

> Enum: 1 tháng chỉ thay đổi lương 1 lần
> - Lương cơ sở hiệu lực trước thay đổi lương (đi theo logic lương cơ bản): Liền kề
> - Lương cơ sở hiệu lực sau thay đổi lương (đi theo logic lương cơ bản): mới nhất trong kỳ lương

## Liên kết

- [[wiki/concepts/HRM-Modules]] — phân hệ SAL (Lương cơ bản, Phần tử tính lương)
