---
Mã: Sys003
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys006 - Tắt log IIS dung lượng]]"
  - "[[Sys014 - Xóa memory optimized filegroup]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# OutOfMemory không đủ RAM

**Vấn đề:** Bị lỗi outOfMemory do không đủ RAM [2022/08/05]

**Hiện trạng:**
- Bị lỗi outOfMemory do không đủ RAM

**Nguyên nhân:**
- Do cấu hình pool trong IIS, nếu chọn "Enable 32 Bit Application" là true thì chỉ dùng được tối đa 4GB RAM.

**Phương án:**
- Vào pool của IIS chỉnh thông tin "Enable 32 Bit Application" la false (vì dùng 64bit sẽ sử dụng tối đa RAM).
- ![issuelogs_sys003_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys003_001.png)
