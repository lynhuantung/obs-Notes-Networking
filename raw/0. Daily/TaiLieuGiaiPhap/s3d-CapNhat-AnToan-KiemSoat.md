---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, bao-mat, idempotent]
date: 2026-04-30
section: "§3.2.3 Cơ chế cập nhật an toàn"
---

← [[s3c-CamKet-SaaS-Inbound]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]

## 3) Cơ chế cập nhật an toàn và kiểm soát dữ liệu 🛡️

[Nhà  cam kết cơ chế cập nhật inbound đảm bảo an toàn và toàn vẹn dữ liệu, tối thiểu gồm:]{.mark}

- [Xác thực và phân quyền API (OAuth2.0/OpenID Connect và hoặc mTLS theo chính sách bảo mật tích hợp)]{.mark}

- [Validation và chuẩn hóa đầu vào (schema validation, kiểm tra code list, kiểm tra FK, kiểm tra bắt buộc)]{.mark}

- [Idempotent + chống trùng theo request_id/correlationId để hỗ trợ retry không phát sinh trùng dữ liệu]{.mark}

- [Upsert semantics theo unique identifier; có quy tắc xử lý xung đột (ưu tiên theo]{.mark} updated_at [hoặc]{.mark} version [theo thống nhất giữa các hệ thống)]{.mark}

- [Audit log và truy vết: ghi nhận đầy đủ ai đẩy, lúc nào, payload metadata, kết quả xử lý, correlationId/traceId]{.mark}

- [Quarantine/holding bản ghi lỗi và cung cấp danh sách lỗi để xử lý và reprocess/re-drive khi cần (nếu dữ liệu không đạt validation)]{.mark}

> []{.mark}![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image55.png){width="6.873966535433071in" height="3.75in"}