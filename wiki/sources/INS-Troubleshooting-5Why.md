---
type: source
tags: [bao-hiem, troubleshooting, root-cause, 5why, chan-doan, C70, FAQ, 4M]
created: 2026-04-27
updated: 2026-04-27
domain: ins
related:
  - [[wiki/concepts/HRM-Modules]]
  - [[wiki/sources/INS-NhatKy-VanDe-2017]]
  - [[wiki/sources/INS-FishBone-Analysis]]
  - [[wiki/sources/INS-ThietKe-V8]]
description: "Hướng dẫn troubleshooting và RCA 5-Why phân hệ bảo hiểm HRM theo framework 4M: con người, máy chủ, dữ liệu, phương pháp."
---

# INS — Troubleshooting & Root Cause Analysis (5-Why)

## Tóm tắt

Tổng hợp các tài liệu phân tích nguyên nhân gốc (root cause) và quy trình chẩn đoán sự cố phân hệ Bảo Hiểm VnResource HRM Pro. Áp dụng phương pháp **5-Why** và framework **4M** (Con người – Máy chủ – Dữ liệu – Phương pháp).

## Key Takeaways

### Framework chẩn đoán 4M

| Nhóm | Câu hỏi chẩn đoán |
|------|-------------------|
| **Con người** | Thao tác đúng chưa? Đã cấu hình bảo hiểm chưa? |
| **Máy chủ** | Server đáp ứng phân tích BH không? (Cảnh báo khi bộ nhớ > 90%) |
| **Dữ liệu đầu vào** | Đủ dữ liệu chưa? Công thức cấu hình đúng chưa? NV có nghỉ tạm hoãn không? |
| **Phương pháp** | Thực hiện đúng quy trình chưa? Đã có lương BHXH chưa? |

### Chức năng Chẩn đoán sự cố tích hợp

| Sự cố | Mô tả |
|-------|-------|
| Chưa chọn nơi đóng bảo hiểm | NV chưa được gán nơi đóng BH |
| Chức danh theo luật chưa có dữ liệu | Trường chức danh theo luật bị trống |
| Chức vụ theo luật chưa có dữ liệu | Trường chức vụ theo luật bị trống |

> **Lưu ý:** BH yêu cầu chức danh/chức vụ luôn là **tiếng Việt** (dùng trường "theo luật")

### RCA 1 — Không lấy được "Tên Công Việc" (5-Why)

```
Tại sao không lấy được tên công việc?
  → Do chưa có chức danh / chức vụ

Tại sao đã có chức danh/chức vụ vẫn không lấy được?
  → Do thiết lập công thức sai

Tại sao đã nhập chức danh theo luật vẫn không lấy được?
  → BH dùng trường "chức danh theo luật" (bắt buộc tiếng Việt)
  → Một số NV quên nhập chức danh theo luật

Tại sao nhân sự quên nhập?
  → CHƯA CÓ RÀNG BUỘC validate bắt buộc nhập
```

**Root Cause**: Chưa validate bắt buộc "Chức danh theo luật" và "Chức vụ theo luật"
**Giải pháp**: Validate bắt buộc 2 trường này tại màn hình nhập liệu nhân sự ✅

### RCA 2 — Không tính được "Số tiền đóng Bảo Hiểm" (5-Why)

```
Tại sao không tính được tiền BH?
  → Do chưa có lương đóng BH

Tại sao những phần tử đã có vẫn không tính được?
  → Phần tử trong công thức KHÔNG TỒN TẠI

Tại sao đã thiết lập đúng ở phần tử BH vẫn không tính được?
  → Do "chế độ lương" có textbox nhập tên công thức bằng text thủ công
  → Dễ nhập sai tên công thức
```

**Root Cause**: TextBox nhập text tự do cho tên công thức → không trực quan
**Giải pháp**: Thay textbox bằng **multiSelect** để chọn công thức ✅

**Vị trí cấu hình**: Bảo hiểm → Danh mục → Phần tử bảo hiểm

### RCA 3 — C70A: Lương BHXH = 0 và số tiền không chính xác (5-Why)

```
Tại sao không lấy được giá trị lương BHXH?
  → Ngày nhận chứng từ TRƯỚC ngày bắt đầu chứng từ

Đã chọn đúng ngày, vẫn chưa có?
  → Do chưa có lương BHXH

Đã có lương BHXH đúng vẫn không ra dữ liệu C70A?
  → Bên lương BHXH có QUÁ NHIỀU dữ liệu của 1 NV (lấy sai số tiền)
  → Chưa phân tích BH tháng trước của ngày bắt đầu chứng từ

Đã phân tích BH tháng trước vẫn sai?
  → CONFLICT giữa logic cũ và logic mới:
    - Logic mới: lấy dữ liệu tháng trước ngày bắt đầu chứng từ
    - Logic cũ: nếu bắt đầu sau ngày 15 → lấy lương tháng N
               nếu trước ngày 15 → lấy lương tháng trước
```

**Root Cause**: Conflict lập trình + user tạo quá nhiều dữ liệu lương BHXH
**Giải pháp**: Xử lý theo logic mới ⚠️ (cần kiểm tra kỹ ảnh hưởng KH cũ)

## Trích dẫn quan trọng

> "Hiện trường và dữ liệu tại hiện trường là không giống nhau."

> Lôi kéo khách hàng vào cùng suy nghĩ về hệ thống bằng cách đào tạo họ hiểu hệ thống.

> C70 tổng hợp từ 3 nguồn: Chứng từ BH + Lịch sử BH + Lương BHXH

## Liên kết

- [[wiki/sources/INS-NhatKy-VanDe-2017]] — Nhật ký vấn đề & kế hoạch cải tiến
- [[wiki/sources/INS-ThietKe-V8]] — Tài liệu thiết kế chức năng
- [[wiki/sources/INS-C70-TinhLuong]] — C70 tính lương chi tiết
- [[wiki/sources/INS-FishBone-Analysis]] — Fishbone analysis phân hệ BH
