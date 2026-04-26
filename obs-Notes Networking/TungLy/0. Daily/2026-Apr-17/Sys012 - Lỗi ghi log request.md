---
Mã: Sys012
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys006 - Tắt log IIS dung lượng]]"
  - "[[Sys010 - Lỗi 403.14 sau upbuild]]"
  - "[[Sys011 - Không xem log request]]"
  - "[[Sys016 - Log không tự xóa 30 ngày]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Lỗi ghi log request

**Vấn đề:** Lỗi ghi log request

**Hiện trạng:**
- Không ghi log request
- Vào màn hình log request không tìm thấy log request mới nhất mặc dù đã cấu hình ghi log request

**Nguyên nhân:**
- Do không stop tất cả pool khi cập nhật bản build
- Do khi web đang chạy mà cập nhật build thì những file log đang ghi sẽ bị lỗi. Vì thế cần stop pools trước khi cập nhật build

**Phương án:**

##### Bước 1: Tắt site và pool link đang chạy

##### Bước 2: Vào source -> vào Folder HRM.Prosentation.Main tìm thư mục log
![issuelogs_sys012_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys012_001.png)

##### Bước 3: Trong Folder Log chứa 4 Folder (xóa hoặc chuyển thư mục RequestInformation sang nơi khác)
- HRM.Presentation.EmpPortal (a)
- HRM.Presentation.Hr.Service (b)
- HRM.Presentation.HrmSystem.Service (c)
- HRM.Presentation.Main (d)
- Vào từng Folder trên tìm Folder: RequestInformation "Folder ghi log"
- Back up lại các folder này ra khỏi folder a,b,c,d (cut 4 folder RequestInformation vào 1 folder mới nằm ngoài source rồi lưu lại)
  - ![issuelogs_sys012_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys012_002.png)
- Sau khi đã cut RequestInformation ra khỏi 4 folder thì mở lại site và start pools chạy bình thường để hệ thống ghi log lại.
