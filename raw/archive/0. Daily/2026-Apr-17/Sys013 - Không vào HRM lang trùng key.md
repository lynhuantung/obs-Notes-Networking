---
Mã: Sys013
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys007 - Lấy log Event Viewer]]"
  - "[[Sys025 - Màn hình main bị lỗi]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Không vào HRM lang trùng key

**Vấn đề:** Lỗi không vào hệ thống HRM

**Hiện trạng:**
- Lỗi không vào hệ thống HRM

**Nguyên nhân:**
- Vào event Viewer để xem lỗi gì? => phải chạy link trên server chứa IIS mới thấy được lỗi.
- Nguyên nhân: do file lang_vn.spec.xml PE chỉnh bị trùng key
- ![issuelogs_sys013_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys013_001.png)

**Phương án:**

#### Tìm ra key đã bị trùng bằng tay hoặc dùng tool kiểm tra key trùng (liên hệ Phúc IT để nhận tool)
- Vào file lang spec tìm key trùng như tool mô tả và xóa dòng trùng trong file lang.
- ![issuelogs_sys013_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys013_002.png)
