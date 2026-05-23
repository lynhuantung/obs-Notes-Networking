---
Mã: Sys007
aliases:
date: 2022-08-11
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys000 - Kiểm tra nguồn gốc lỗi]]"
  - "[[Sys013 - Không vào HRM lang trùng key]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Lấy log Event Viewer

**Vấn đề:** Ghi nhận file log từ server về kiểm tra nguyên nhân lỗi [2022/08/11]

**Hiện trạng:**
- Khi hệ thống bị lỗi, window sẽ tiến hành ghi log vào event viewer. Chúng ta tiến hành lấy file log về để kiểm tra nguyên nhân.

**Nguyên nhân:**
- Khi hệ thống bị lỗi, window sẽ tiến hành ghi log vào event viewer. Nhìn vào log, chúng ta sẽ xác định được nguyên nhân lỗi mà không cần mở source debug.

**Phương án:**

#### Bước 1: Vào cửa sổ window trên server chứa IIS và vào tìm kiếm `event viewer`
![issuelogs_sys007_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_001.png)

#### Bước 2: Trong cửa sổ event viewer, chọn Windows Logs\Application
- Chọn event log lỗi (dấu hiệu nhận biết: icon tam giác màu vàng) và save về máy để gửi cho bộ phận kỹ thuật kiểm tra nguyên nhân.
- ![issuelogs_sys007_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_002.png)

#### Bước 3: Để mở file log trên `Event viewer`, ta vào Windows Logs\Application và chọn `open Saved Log` ở góc phải
![issuelogs_sys007_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_003.png)

#### Bước 4: Kết quả sau khi mở log, bộ phận kỹ thuật tiến hành kiểm tra và phỏng đoán nguyên nhân lỗi
![issuelogs_sys007_004.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys007_004.png)
