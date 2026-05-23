---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, cdc, data-quality]
date: 2026-04-30
section: "§3.3.3 Đồng bộ & chất lượng"
---

← [[s3e2-CDC-Version-Based]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]

## 3) Đồng bộ về Data Platform/ESB và đảm bảo chất lượng dữ liệu 🔄🛡️

Phần mềm hỗ trợ đồng bộ delta qua ESB/API Gateway theo chuẩn tích hợp, đảm bảo:

- Idempotent/Deduplicate: mỗi sự kiện thay đổi có định danh duy nhất (ví dụ: change_log_id/correlation_id) để chống ghi trùng khi retry.

- Ordering: ưu tiên xử lý theo Version (nếu dùng Version-based) để đảm bảo đúng thứ tự thay đổi.

- Retry & Error handling: hỗ trợ cơ chế retry theo chính sách ESB, ghi nhận lỗi và phục hồi đồng bộ.

- Audit log: ghi nhận nhật ký phục vụ truy vết, đối soát và kiểm toán tích hợp.