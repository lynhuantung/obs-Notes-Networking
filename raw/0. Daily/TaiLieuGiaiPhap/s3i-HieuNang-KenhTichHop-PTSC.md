---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, hieu-nang, scalability]
date: 2026-04-30
section: "§3.7 Hiệu năng tích hợp"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[06-Metadata-HieuNang-Idempotent]]
**Tiếp theo:** [[s3j-API-Idempotent-CorrelationId]]

## Yêu cầu hiệu năng cho kênh tích hợp với nền tảng dữ liệu của PTSC

> 3.7.1 Nhà cung cấp cam kết khả năng xử lý và mở rộng hiệu năng (Scalability) cho kênh tích hợp, đáp ứng khả năng xử lý lượng gọi API và batch để đảm bảo khả năng xử lý hiệu năng phần mềm. Số lượng API và batch sẽ được trao đổi và thống nhất trong quá trình triển khai dự án.
>
> [Phần mềm (Vnresource) đáp ứng yêu cầu về khả năng mở rộng và xử lý hiệu năng cho kênh tích hợp. Giải pháp được thiết kế theo hướng có thể mở rộng phù hợp với nhu cầu xử lý API và batch trong thực tế triển khai. Các thông số chi tiết về số lượng API, batch và tải xử lý sẽ được thống nhất trong giai đoạn triển khai dự án; trên cơ sở đó, Nhà cung cấp sẽ phối hợp cấu hình, kiểm thử và tối ưu để đảm bảo hiệu năng, kiểm thử và tối ưu hệ thống, bảo đảm vận hành ổn định và hiệu quả]{.mark}
>
> [3.7.2 Phần mềm phải đáp ứng không giới hạn tích hợp bởi license (hoặc ghi rõ giới hạn, nếu có, về API rate limit, số client, số interface, quota batch/export).]{.mark}
>
> [Phần mềm (Vnresource) cam kết hệ thống **không giới hạn tích hợp bởi license**, đồng thời minh bạch các **giới hạn kỹ thuật liên quan đến API rate limit, số client tích hợp, số interface hoặc quota batch/export (nếu áp dụng)** theo tài liệu kỹ thuật và phạm vi triển khai thống nhất giữa hai bên.]{.mark}
>
> [3.7.3 Phần mềm phải đáp ứng không gây ảnh hưởng đáng kể đến thời gian đáp ứng giao dịch online khi chạy job trích xuất dữ liệu theo lịch.]{.mark}
>
> [Phần mềm (Vnresource) cam kết các job trích xuất dữ liệu theo lịch được thiết kế và cấu hình theo hướng không gây ảnh hưởng đáng kể đến thời gian đáp ứng giao dịch online; đồng thời áp dụng các biện pháp phù hợp như chạy ngoài giờ cao điểm, chia batch, kiểm soát tài nguyên và tối ưu xử lý để bảo đảm hệ thống vận hành ổn định]{.mark}