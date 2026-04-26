---
Mã: Sys009
aliases:
date: 2022-10-19
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys010 - Lỗi 403.14 sau upbuild]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Upload file giới hạn 20MB

**Vấn đề:** Không upload files vượt quá 20MB [2022/10/19]
- Khi upload files, không thể upload vượt quá 20MB

**Hiện trạng:**
- Khi upload files, không thể upload vượt quá 20MB

**Nguyên nhân:**
- Khi upload files với dung lượng lớn sẽ ảnh hưởng hệ thống.

**Phương án:**
- Cấu hình trong webConfig của web main với attribute `maxRequestLength` với dung lượng mong muốn nhưng không được vượt quá 20 MB
- ![issuelogs_sys009_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys009_001.png)
- Ví dụ: `<httpRuntime targetFramework="4.6.2" maxRequestLength="20480" />`
