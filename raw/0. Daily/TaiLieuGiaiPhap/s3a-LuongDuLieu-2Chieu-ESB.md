---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, esb, kafka]
date: 2026-04-30
section: "§3.2 Luồng dữ liệu 2 chiều"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Parent: [[s3-Chuan-GiaoTiep-DataPlatform-ESB]]
**Liên quan:** [[s3b-Inbound-Channels]] | [[s3c-CamKet-SaaS-Inbound]] | [[s3d-CapNhat-AnToan-KiemSoat]]

## Hỗ trợ luồng dữ liệu 02 chiều qua ESB/API Gateway và/hoặc Message Broker

> 3.2.1 Phần mềm phải cho phép Luồng ra (Phần mềm → Data Platform): phát sinh sự kiện hoặc dữ liệu giao dịch, Master Data, dữ liệu thay đổi CDC -- Change Data Capture (nếu có) sang ESB/Kafka/topic hoặc API của Data Platform.
>
> [Nhà cung cấp cam kết Phần mềm hỗ trợ luồng dữ liệu 2 chiều với Data Platform thông qua ESB/API Gateway và/hoặc Message Broker (Kafka/Topic). Phần mềm có khả năng phát sinh sự kiện nghiệp vụ, đồng bộ dữ liệu giao dịch, Master Data và hỗ trợ CDC (Change Data Capture) ra Data Platform; đồng thời nhận và xử lý dữ liệu từ Data Platform qua REST API hoặc Kafka Consumer. Toàn bộ luồng tích hợp được thiết kế theo chuẩn bảo mật, có cơ chế xử lý lỗi, retry và audit log đầy đủ.]{.mark}
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image11.jpg){width="6.873966535433071in" height="3.75in"}
>
> [3.2.2 Phần mềm phải cho phép Luồng vào (Data Platform → Phần mềm): tiếp nhận dữ liệu master, dữ liệu chuẩn hóa, kết quả phân tích/ khuyến nghị từ Data Platform thông qua API hoặc messaging, và cập nhật an toàn vào Phần mềm.Với Phần mềm SaaS: NCC cam kết cung cấp tối thiểu các API inbound/message broker để Data Platform có thể đẩy dữ liệu (Master Data) vào Phần mềm.]{.mark}
>
> [Nhà  cam kết Phần mềm (VnResource) cho phép triển khai luồng dữ liệu vào từ Data Platform để tiếp nhận và cập nhật an toàn các nhóm dữ liệu sau:]{.mark}

- [Master Data dùng chung (ví dụ: tổ chức, đơn vị, chức danh, danh mục dùng chung, mã chuẩn hóa...)]{.mark}

- [Dữ liệu chuẩn hóa (đã làm sạch, chuẩn code list, chuẩn định danh)]{.mark}

- [Kết quả phân tích và khuyến nghị từ Data Platform (ví dụ: gợi ý chuẩn hóa hồ sơ, cảnh báo chất lượng dữ liệu, gợi ý mapping, điểm rủi ro...)]{.mark}