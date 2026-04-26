---
Mã: Sys000
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys007 - Lấy log Event Viewer]]"
  - "[[Sys011 - Không xem log request]]"
  - "[[Sys012 - Lỗi ghi log request]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Kiểm tra nguồn gốc lỗi

**Vấn đề:** Cách check link và dự đoán những nguyên nhân lỗi dựa vào các công cụ có sẵn trên server và trên phần mềm HRM

**Hiện trạng:**
- Khi link bị lỗi, có các cách kiểm tra lỗi sau

**Phương án:**
- **Log Review** (tài liệu: [Log Request](https://confluence.vnresource.net:18001/display/SED/Log+Request)): kiểm tra những lỗi mà bộ phận kỹ thuật đã ghi log (phải đăng nhập superadmin mới thấy tính năng này)
  - ![issuelogs_sys000_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_003.png)
- **Log Request** (tài liệu: [Log request](https://confluence.vnresource.net:18001/display/SED/Log+Request)): kiểm tra những api lỗi dựa trên request (phải đăng nhập superadmin mới thấy tính năng này)
  - ![issuelogs_sys000_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_002.png)
- **Remote Server**: remote lên server và kiểm tra những file như: lang_vn_spec.xml, field_info_spec.xml, field_hidden_spec.xml
- **Event Viewer**: Kiểm tra lỗi, yêu cầu chạy link lỗi trên server
  - ![issuelogs_sys007_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_002.png)
  - ![issuelogs_sys000_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_001.png)
- **IIS Request (Worker processes)**: kiểm tra API chạy bao lâu
  - ![issuelogs_sys000_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys000_004.png)
- **IIS Log**: xem log từ IIS
