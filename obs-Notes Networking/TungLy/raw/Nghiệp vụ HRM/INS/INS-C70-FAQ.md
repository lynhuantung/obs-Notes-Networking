---
type: wiki-project
tags: [bao-hiem, C70, bao-cao, FAQ, BHXH, HRM]
date-updated: 2026-04-26
related:
  - "[[INS-Overview]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
  - "[[INS-Chan-Doan-Su-Co]]"
---

# INS – Báo Cáo C70: FAQ Thường Gặp

## C70 là gì?

Báo cáo **C70 / C70A** tổng hợp dữ liệu bảo hiểm xã hội từ 3 nguồn:
1. **Chứng từ BH**
2. **Lịch sử BH**
3. **Lương BHXH**

---

## ❓ FAQ 1: Tìm kiếm C70 tháng N ra Lương BHXH = 0, Tháng tham gia BH = 01/01/0001

**Câu hỏi:** Tại sao tìm kiếm C70 tháng N ra Lương tính BHXH + Số tiền = 0, Tháng tham gia BH = 01/01/0001?

**Trả lời:**
> Vì **phân tích bảo hiểm tháng N-1** ra lương BH = 0, **hoặc chưa phân tích BH tháng N-1**.

→ Cần kiểm tra lại kết quả phân tích BH tháng trước.

---

## ❓ FAQ 2: C70A có giá trị lương BHXH = 0 và số tiền không chính xác

### Mô tả vấn đề

| Tiêu chí | Chi tiết |
|---|---|
| **What** | Tìm kiếm C70A hiển thị lương BHXH = 0.0 và số tiền chưa chính xác |
| **Where** | Màn hình C70A (nút tìm kiếm) |
| **How to reproduce** | Thu nhỏ phạm vi, tập trung vào tìm kiếm dữ liệu **khám thai** và **nghỉ ốm ngắn ngày** |

### Phân tích 5-Why

```
❓ Tại sao không lấy được giá trị lương BHXH?
  → Do ngày nhận chứng từ TRƯỚC ngày bắt đầu chứng từ

❓ Đã chọn ngày nhận sau ngày bắt đầu, vẫn chưa có dữ liệu BH?
  → Do chưa có lương BHXH

❓ Đã có lương BHXH vẫn không ra đúng dữ liệu lương BHXH bên C70A?
  → (chưa ghi nhận)

❓ Đã có lương BHXH đúng vẫn chưa có dữ liệu lương BHXH bên C70A?
  → Do bên lương BHXH có QUÁ NHIỀU dữ liệu của 1 nhân viên
    (chỉ khi thay đổi lương mới có dòng mới → dư thừa dữ liệu → lấy sai số tiền)
  → Do chưa phân tích BH tháng trước của ngày bắt đầu chứng từ

❓ Đã phân tích BH tháng trước vẫn chưa ra kết quả đúng?
  → Do CONFLICT giữa logic cũ và logic mới:
    - Logic mới: lấy dữ liệu tháng trước của ngày bắt đầu chứng từ
    - Logic cũ: nếu ngày bắt đầu sau ngày 15 tháng N → lấy lương tháng N
               nếu ngày bắt đầu trước ngày 15 → lấy lương tháng trước
```

### Nguyên nhân gốc

1. **Người dùng tạo quá nhiều dữ liệu** bên màn hình lương BHXH → lấy số tiền sai
2. **Conflict lập trình** giữa logic cũ và logic mới (kỳ trước vs kỳ hiện tại)

### Giải pháp

> Xử lý theo **logic mới** (lấy dữ liệu tháng trước ngày bắt đầu chứng từ).
> ⚠️ **Lưu ý:** Việc này có thể làm sai dữ liệu của một số khách hàng cũ → cần kiểm tra kỹ.

---

## Liên quan

- [[INS-FAQ-Phan-Tich-BH]] – FAQ phân tích bảo hiểm
- [[INS-Chan-Doan-Su-Co]] – Chẩn đoán sự cố bảo hiểm
- [[INS-Overview]] – Tổng quan phân hệ bảo hiểm
