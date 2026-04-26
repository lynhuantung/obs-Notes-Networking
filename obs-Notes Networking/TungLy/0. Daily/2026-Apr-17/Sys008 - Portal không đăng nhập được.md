---
Mã: Sys008
aliases:
date: 2022-08-11
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys005 - Login lỗi 500 CLR]]"
  - "[[Sys017 - Portal không nhận key quyền]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Portal không đăng nhập được

**Vấn đề:** Đăng nhập Portal không được, mặc dù đúng username và Password [2022/08/11]
- Đăng nhập portal không thành công, mặc dù thông tin username và password đều đúng. 4 Link đều hoạt động bình thường.

**Hiện trạng:**
- Khi đăng nhập vào web portal báo sai thông tin đăng nhập. Mặc dù đã kiễm tra lại thông tin đăng nhập đúng.
- ![issuelogs_sys008_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys008_001.png)

**Nguyên nhân:**
- ConnectString Database trong file webSettings.json của Portal bị sai. Không trùng với Database của Main.

**Phương án:**
- Sửa ConnectString Database trong file webSettings.json của Portal
- ![issuelogs_sys008_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys008_002.png)
