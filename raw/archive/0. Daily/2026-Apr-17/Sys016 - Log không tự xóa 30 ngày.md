---
Mã: Sys016
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys006 - Tắt log IIS dung lượng]]"
  - "[[Sys012 - Lỗi ghi log request]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Log không tự xóa 30 ngày

**Vấn đề:** Lỗi không tự xóa log sau 30 ngày

**Hiện trạng:**
- Lỗi không tự xóa log sau 30 ngày

**Nguyên nhân:**
- Xử lý xóa log của hệ thống, khi tạo thư mục không hợp lệ sẽ không tự xóa log.

**Phương án:**
- Tạo scheduler task trong window để xử lý xóa log tự động.

#### Bước 1: Download file import task có sẵn
- File: [issuelogs_sys016_deletehrmlog_001.xml](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys016_deletehrmlog_001.xml)

#### Bước 2: Thiết lập Task Scheduler
- Tìm ứng dụng `Task Scheduler` trong window
- Tạo một thư mục trong Task scheduler
- Thực hiện import task từ file xml ở bước 1 (chọn file `issuelogs_sys016_deletehrmlog_001.xml`)
- ![issuelogs_sys016_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys016_002.png)

**Giải thích tham số:** `/p "D:\HRM.Presentation.Main\Log" /s /d -30 /c "cmd /c del @file"`
- `D:\HRM.Presentation.Main\Log`: thư mục chứa file log
- `-30`: chỉ xóa những file log trước đó 30 ngày (có thể tùy chỉnh)

> **Lưu ý:**
> - Tab Triggers: tạo scheduler chạy hàng ngày, hàng tuần hay hàng tháng
> - Tab Actions: thực thi xử lý xóa log (thông qua ForFiles)
> - Link tham khảo: [https://dacocach.com/xoa-file-windows-10/](https://dacocach.com/xoa-file-windows-10/)
