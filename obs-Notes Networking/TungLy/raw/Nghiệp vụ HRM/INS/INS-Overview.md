---
type: wiki-project
tags: [bao-hiem, HRM, VnResource, phan-he-bao-hiem]
date-updated: 2026-04-26
related:
  - "[[INS-BC-D02]]"
  - "[[INS-Thai-San-On-Off]]"
  - "[[INS-Phan-Tich-BH-Lech-Thang]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
  - "[[INS-Chan-Doan-Su-Co]]"
  - "[[INS-Nguyen-Nhan-Ten-Cong-Viec]]"
  - "[[INS-Nguyen-Nhan-So-Tien-BH]]"
  - "[[INS-C70-FAQ]]"
  - "[[INS-BrainStorming-T10-2017]]"
---

# Nhật Ký Vấn Đề – Phân Hệ Bảo Hiểm (INS)

> **Nguồn:** VnResource HRM Pro 2017 – Tài liệu nội bộ (Confidential)  
> **Tác giả gốc:** Tung.Ly – VnResource Co., Ltd  
> **Phiên bản:** 1.0 (21/08/2017)

## Mục đích

Ghi lại nhật ký những vấn đề có **logic dài và khó** trong phân hệ Bảo Hiểm, nhằm giảm thiểu tối đa bug xảy ra khi thay đổi yêu cầu.

---

## Danh mục vấn đề

### Báo cáo & Phân tích

| Ghi chú | Nội dung |
|---|---|
| [[INS-BC-D02]] | Thay đổi BC D02 – nghỉ thai sản ≥ 14 ngày |
| [[INS-Thai-San-On-Off]] | Nguyên tắc On-Off Thai Sản |
| [[INS-Phan-Tich-BH-Lech-Thang]] | Phân tích BH tháng N ra tháng N-1 trên lưới |
| [[INS-C70-FAQ]] | Báo cáo C70 – Các câu hỏi thường gặp |

### Chẩn đoán & Nguyên nhân gốc

| Ghi chú | Nội dung |
|---|---|
| [[INS-FAQ-Phan-Tich-BH]] | FAQ phân tích bảo hiểm – các góc nhìn phát hiện trục trặc |
| [[INS-Chan-Doan-Su-Co]] | Chẩn đoán sự cố bảo hiểm & danh sách trục trặc |
| [[INS-Nguyen-Nhan-Ten-Cong-Viec]] | Root cause: không lấy được "Tên Công Việc" |
| [[INS-Nguyen-Nhan-So-Tien-BH]] | Root cause: không tính được "Số tiền đóng bảo hiểm" |

### Kế hoạch & Cải tiến

| Ghi chú | Nội dung |
|---|---|
| [[INS-BrainStorming-T10-2017]] | BrainStorming mục tiêu tháng 10/2017 |

---

## Nguyên tắc chung khi xử lý bug BH

- Đa số vấn đề bảo hiểm do **thiếu dữ liệu** → VNR xử lý.
- "**Hiện trường và dữ liệu tại hiện trường là không giống nhau**" – cần lôi kéo khách hàng cùng suy nghĩ.
- Nhóm nguyên nhân: **Con người – Máy chủ – Dữ liệu đầu vào – Phương pháp**.

---

## Mantis IDs liên quan

| Mantis ID | Vấn đề |
|---|---|
| 57589 | [[INS-BC-D02]] – BC D02 không hiển thị điều chỉnh lương khi nghỉ thai sản |
| 57594 | [[INS-Thai-San-On-Off]] – Nguyên tắc On-Off thai sản |
| 87680 | [[INS-Phan-Tich-BH-Lech-Thang]] – Phân tích BH tháng N ra N-1 |
