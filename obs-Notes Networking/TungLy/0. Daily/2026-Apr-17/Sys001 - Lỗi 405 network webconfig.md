---
Mã: Sys001
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys002 - Không có quyền IIS_IUSRS]]"
  - "[[Sys005 - Login lỗi 500 CLR]]"
  - "[[Sys018 - Kiểm tra kết nối mạng]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Lỗi 405 network webconfig

**Vấn đề:** Lỗi 405 về tín hiệu network [2022/08/05]

**Hiện trạng:**
- Không kết nối máy chủ ở HR Service được
- ![issuelogs_sys001_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys001_001.png)

**Nguyên nhân:**
- Webconfig chưa đúng.

**Phương án:**
- Sửa web.config bên main (xóa dòng như hình bên dưới)
- ![issuelogs_sys001_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys001_002.png)
