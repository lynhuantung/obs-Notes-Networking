---
type: wiki-project
tags: [bao-hiem, chan-doan, troubleshooting, su-co, HRM]
date-updated: 2026-04-26
related:
  - "[[INS-Overview]]"
  - "[[INS-FAQ-Phan-Tich-BH]]"
  - "[[INS-Nguyen-Nhan-Ten-Cong-Viec]]"
  - "[[INS-Nguyen-Nhan-So-Tien-BH]]"
---

# INS – Chẩn Đoán Sự Cố Bảo Hiểm

## Chức năng chẩn đoán

Chức năng **Chẩn đoán sự cố bảo hiểm** xử lý các trường hợp:

| Sự cố | Mô tả |
|---|---|
| Chưa chọn nơi đóng bảo hiểm | Nhân viên chưa được gán nơi đóng BH |
| Chức danh theo luật chưa có dữ liệu | Trường chức danh theo luật bị trống |
| Chức vụ theo luật chưa có dữ liệu | Trường chức vụ theo luật bị trống |

> **Lưu ý:** Bảo hiểm yêu cầu chức danh/chức vụ luôn là **tiếng Việt** (dùng trường "theo luật").

---

## Danh sách trục trặc bảo hiểm

> Bảng này **cập nhật liên tục** sau khi gặp vấn đề và người dùng đã giải quyết được.
> Nếu có link troubleshooting, sẽ dẫn đến trang chẩn đoán và xử lý trực tiếp.

| # | Trục trặc | Nguyên nhân | Xử lý | Trạng thái |
|---|---|---|---|---|
| 1 | Không lấy được Tên Công Việc | Xem [[INS-Nguyen-Nhan-Ten-Cong-Viec]] | Xem [[INS-Nguyen-Nhan-Ten-Cong-Viec]] | Đã ghi nhận |
| 2 | Không tính được số tiền đóng BH | Xem [[INS-Nguyen-Nhan-So-Tien-BH]] | Xem [[INS-Nguyen-Nhan-So-Tien-BH]] | Đã ghi nhận |
| 3 | Phân tích BH tháng N ra tháng N-1 | Timezone server/client lệch nhau | Xem [[INS-Phan-Tich-BH-Lech-Thang]] | Đã xử lý |

---

## Liên quan

- [[INS-FAQ-Phan-Tich-BH]] – Các góc nhìn phát hiện trục trặc
- [[INS-Nguyen-Nhan-Ten-Cong-Viec]] – Root cause tên công việc
- [[INS-Nguyen-Nhan-So-Tien-BH]] – Root cause số tiền BH
- [[INS-Overview]] – Tổng quan phân hệ bảo hiểm
