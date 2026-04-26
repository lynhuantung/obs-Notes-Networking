---
Mã: Sys017
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys002 - Không có quyền IIS_IUSRS]]"
  - "[[Sys008 - Portal không đăng nhập được]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Portal không nhận key quyền

**Vấn đề:** Phân quyền hệ thống, portal không nhận key quyền vừa phân quyền

**Hiện trạng:**
- Phân quyền hệ thống, portal (api center) không nhận key quyền vừa phân quyền

**Nguyên nhân:**
- Không refresh cache quyền khi phân nhóm quyền, do thiếu cấu hình `Hrm_APICenter_Web` trong `WebSettings.json` của `WebMain`.

**Phương án:**
- Kiểm tra cấu hình `Hrm_APICenter_Web` trong tệp `WebSettings.json` của `WebMain`. Nếu có key này, hệ thống sẽ tự động refresh cache khi chỉnh sửa nhóm quyền trong api center.

> Ví dụ: `"Hrm_APICenter_Web": "https://pehn02.vnresource.net:2425/"`
> Trong đó, key `Hrm_APICenter_Web` là đường link của api Center API.

![issuelogs_sys017_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys017_001.png)
