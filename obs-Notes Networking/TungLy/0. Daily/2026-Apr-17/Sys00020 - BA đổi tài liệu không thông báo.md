---
Mã: Sys00020
aliases:
date: 2021-05-07
tags:
  - daily
  - "#nhatkyvande"
  - "#nghiep-vu"
Project:
Liên quan:
  - "[[Sys00017 - Đổi giải pháp lúc QC]]"
  - "[[Sys00018 - Sinh case test sót]]"
  - "[[Sys00026 - Lặp lại tạo TK phân quyền]]"
---
# BA đổi tài liệu không thông báo

**Vấn đề:** BA thay đổi tài liệu mà chưa thông báo cho SE/QC
BA thay đổi tài liệu không thông báo QC

**Lý Do:**
- Tại sao BA thay đổi tài liệu: Bởi vì QC phát hiện logic bị hỏng
- Tại sao logic bị hỏng: Bởi vì QC chưa hiểu rõ tài liệu và phát hiện logic phân tích thiếu
- Tại sao QC chưa hiểu tài liệu: Do người lập tài liệu dùng câu từ khiến hiểu nhầm và QC không tham gia vào confirm task dẫn đến không hiểu
- Tại sao QC không tham gia confirm task và khi BA chuyển tài liệu thì QC chưa đọc: Vì QC có kế hoạch riêng và không phát hiện sớm BA phân tích thiếu

**Nguyên nhân gốc:**
QC chưa hiểu rõ tài liệu khi test hoặc phát hiện mà không báo kịp thời cho BA mà đợi đến khi SE release build mới raise lên BA

**Cách phòng tránh:**
(chưa ghi)

| Tên | ID | Phòng ban | Ngày |
|---|---|---|---|
| Khai.Nguyen | Sys00020 | SE | 07/05/2021 |
