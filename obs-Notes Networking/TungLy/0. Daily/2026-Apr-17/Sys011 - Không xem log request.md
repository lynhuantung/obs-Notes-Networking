---
Mã: Sys011
aliases:
date: 2022-08-05
tags:
  - daily
  - "#nghiep-vu"
  - "#nhatkyvande-hethong"
Project:
Liên quan:
  - "[[Sys000 - Kiểm tra nguồn gốc lỗi]]"
  - "[[Sys012 - Lỗi ghi log request]]"
source: https://confluence.vnresource.net:18001/pages/viewpage.action?pageId=39911747
---
# Không xem log request

**Vấn đề:** Không thể xem log request

**Hiện trạng:**
- Không vào được trang log request
- Xuất hiện lỗi **Unable to load DLL 'SQLite.Interop.dll': The specified module could not be found. (Exception from HRESULT: 0x8007007E)**
- ![issuelogs_sys011_001.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_001.png)

**Nguyên nhân:**
- Do chưa cài Visual C++ 2010,2012,2013,2015-2022 => cài cả X86 và X64

**Phương án:**
- Cài đặt Visual C++ 2010,2012,2013,2015-2022 theo thứ tự từ 2010 đến 2022, cài cả X86 và X64
  - Link cài đặt: [https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)
  - ![issuelogs_sys011_003.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_003.png)
- Tool chạy sqlLites: [https://sqlitebrowser.org/dl/](https://sqlitebrowser.org/dl/)
- Kết quả:
  - ![issuelogs_sys011_002.png](https://docs.vnresource.net/general_docs/issuelogs/issuelogs_sys011_002.png)
