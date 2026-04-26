---
Mã: Sys006
aliases:
date: 2022-08-10
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys012 - Lỗi ghi log request]]"
  - "[[Sys016 - Log không tự xóa 30 ngày]]"
  - "[[Sys003 - OutOfMemory không đủ RAM]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Tắt log IIS dung lượng

**Vấn đề:** Tắt log trong IIS [2022/08/10]
- Web sử dụng lâu và dung lượng log tăng quá cao.

**Hiện trạng:**
- Dung lượng log của IIS tăng quá cao sau 4 năm.

**Nguyên nhân:**
- Dung lượng log tăng quá cao

**Phương án:**

#### Bước 1: Vào IIS chọn Logging
![issuelogs_sys006_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys006_001.png)

#### Bước 2: Disable tính năng ghi log trong IIS
![issuelogs_sys006_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys006_002.png)
