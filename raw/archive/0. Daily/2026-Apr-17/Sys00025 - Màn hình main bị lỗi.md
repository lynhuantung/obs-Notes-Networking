---
Mã: Sys00025
aliases:
date: 2021-07-28
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00003 - Không lấy được version]]"
  - "[[Sys00007 - Webconfig thiếu key]]"
  - "[[Sys00019 - Key dịch không đồng nhất]]"
  - "[[Sys00024 - Login lỗi 500 GetEnum]]"
---
# Màn hình main bị lỗi

**Vấn đề:** Vào màn hình main bị lỗi ở link khách hàng

**Lý Do:**
- Tại sao 1: Do webconfig không đúng phiên bản của bản build
- Tại sao 2: Chưa phân quyền IIS_IUSRS
- Tại sao 3: File lang_VN_SPEC.xml bị trùng key

**Nguyên nhân gốc:**
- Do file webconfig không đúng phiên bản
- Do file lang bị trùng key dịch

**Cách phòng tránh:**
- Khi dịch file lang phải rà soát kỹ và sử dụng tool SE cung cấp để check file lang có bị trùng key không
- Webconfig phải lay đúng phiên bản (khi up build)

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| [Tung.Ly] | Sys00025 | SE | 28/07/2021 |
