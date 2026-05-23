---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, saas, master-data]
date: 2026-04-30
section: "§3.2.2 SaaS commitments"
---

← [[s3b-Inbound-Channels]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3d-CapNhat-AnToan-KiemSoat]]

## 2) Cam kết tối thiểu với Phần mềm SaaS/Cloud ☁️

[Đối với mô hình SaaS, nhà cung cấp cam kết cung cấp tối thiểu các năng lực inbound để Data Platform đẩy Master Data vào Phần mềm, bao gồm:]{.mark}

- [API inbound để upsert Master Data theo khóa định danh thống nhất (insert nếu chưa có, update nếu đã tồn tại)]{.mark}

- [Và hoặc endpoint nhận message hoặc cơ chế consumer để nhận dữ liệu từ Data Platform qua broker]{.mark}

[Nhóm API inbound tối thiểu (minh họa, sẽ chốt theo ICD):]{.mark}

- POST /api/v1/masterdata/organizations:upsert

- POST /api/v1/masterdata/positions:upsert

- POST /api/v1/masterdata/codelists:upsert

- POST /api/v1/masterdata/employees:upsert [(nếu phạm vi có đồng bộ nhân sự từ MDM)]{.mark}

- POST /api/v1/recommendations:import [(nhận khuyến nghị/insight để hiển thị hoặc cập nhật trạng thái)]{.mark}