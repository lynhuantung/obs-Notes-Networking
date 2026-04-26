---
Mã: Sys002
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys001 - Lỗi 405 network webconfig]]"
  - "[[Sys010 - Lỗi 403.14 sau upbuild]]"
  - "[[Sys017 - Portal không nhận key quyền]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Không có quyền IIS_IUSRS

**Vấn đề:** Không có quyền thư mục IIS_IUSRS [2022/08/05]
- Không có quyền thư mục mặc dù đẵ phân quyền IIS_IUSRS

**Hiện trạng:**
- Không truy cập được file log (access denied), mặc dù đã phân quyền IIS_IUSRS
- ![issuelogs_sys002_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_001.png)

**Nguyên nhân:**
- Do copy source từ IIS khác và trước đó đã phân quyền pool cho user khác nên không hiểu quyền thư mục log của user hiện tại.

**Phương án:**
- Sửa cấu hình authentication của iis web hiện tại, và chọn Anonymous Authentication >> chọn edit >> check vào application pool identity để xác nhận quyền pool của user hiện tại.
  - ![issuelogs_sys002_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_002.png)
- Tiếp theo tiến hành phân quyền thư mục.
  - ![issuelogs_sys002_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_003.png)
- Nếu cách trên vẫn không được, tiến hành thiết lập 3 source cùng 1 pool:
  - ![issuelogs_sys002_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys002_004.png)
