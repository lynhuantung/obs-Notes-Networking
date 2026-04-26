---
Mã: Sys004
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys001 - Lỗi 405 network webconfig]]"
  - "[[Sys018 - Kiểm tra kết nối mạng]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Link ngoài bị chặn HRM

**Vấn đề:** Gọi link HRM từ google chat bị lỗi hình răng cưa [2022/08/05]
- Gọi link HRM từ google chat bị lỗi hình răng cưa, phải refresh trang 1 lần nửa mới vô được trang HRM

**Hiện trạng:**
- Hệ thống chặn link ngoài gọi vào HRM

**Nguyên nhân:**
- Do cấu hình pool trong IIS, nếu chọn "Enable 32 Bit Application" là true thì chỉ dùng được tối đa 4GB RAM.

**Phương án:**
- Add key `<add key="AllowOrigin" value="https://www.google.com/" />` vào webconfig (hoặc webSetting.json) main và portal
- ![issuelogs_sys004_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys004_001.png)
