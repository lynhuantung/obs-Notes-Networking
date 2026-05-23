---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, cdc, version]
date: 2026-04-30
section: "§3.3.2 Version CDC"
---

← [[s3e1-CDC-Watermark-Timestamp]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3e3-DongBo-DataPlatform-ChatLuong]]

## 2) Trích xuất delta theo phiên bản (Version-based CDC) 🔢

Trong trường hợp cần độ chính xác cao khi có nhiều thay đổi cùng thời điểm, phần mềm hỗ trợ cơ chế trích xuất theo Version hoặc Change Log:

- Mỗi thay đổi dữ liệu phát sinh một bản ghi log với Version tăng dần (monotonic) và Change Type = INSERT/UPDATE/DELETE.

- Hệ thống tích hợp chỉ cần lưu last_version đã xử lý, sau đó lấy tiếp phần tăng thêm, đảm bảo không bỏ sót và dễ replay khi cần.

Ví dụ tham số API (minh họa):

- GET /api/v1/changelog?since_version={last_version}&entity={entity_name}