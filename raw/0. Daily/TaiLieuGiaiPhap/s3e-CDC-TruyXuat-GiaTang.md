---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, cdc]
date: 2026-04-30
section: "§3.3 CDC Incremental"
aliases: [CDC, Change Data Capture]
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[05-CDC-KhoaChinh-BaoMat-IAM]]
**Sub-topics:** [[s3e1-CDC-Watermark-Timestamp]] | [[s3e2-CDC-Version-Based]] | [[s3e3-DongBo-DataPlatform-ChatLuong]]

## Cơ chế truy xuất dữ liệu gia tăng CDC -- Change Data Capture)/ Incremental (nếu có)

> 3.3.1 Phần mềm phải có cơ chế hỗ trợ lấy dữ liệu gia tăng, bao gồm tối thiểu một trong các phương án: Trường "ngày/giờ cập nhật gần nhất" (Last Updated Date) cho từng bản ghi. Cờ "trạng thái thay đổi" hoặc "phiên bản" (Versioning). Hoặc khả năng cung cấp change log/ CDC từ CSDL (Transaction Log, Trigger,...) (nếu có). Với phần mềm SaaS: NCC cam kết cung cấp cơ chế Timestamp hoặc Versioning thông qua API để hỗ trợ tích lũy dữ liệu lịch sử.

Phần mềm (Vnresource) hỗ trợ cơ chế **truy xuất dữ liệu gia tăng (Incremental Data Extraction)** dựa trên các trường thời gian như **Created Date** và **Last Updated Date**, cho phép xác định các bản ghi phát sinh mới hoặc thay đổi trong từng khoảng thời gian phục vụ đồng bộ dữ liệu với các hệ thống tích hợp. Cơ chế này đáp ứng yêu cầu trích xuất dữ liệu delta theo mô hình **CDC (Change Data Capture)** ở mức ứng dụng thông qua API và các chức năng xuất dữ liệu theo tham số thời gian.

Bên cạnh đó, hệ thống cung cấp **nhật ký thay đổi dữ liệu (Audit Log)** và hỗ trợ truy xuất dữ liệu theo **Time Window (from/to)** thông qua API tích hợp, giúp thực hiện các tác vụ đồng bộ gia tăng, replay dữ liệu khi cần tái đồng bộ và xử lý các trường hợp dữ liệu cập nhật muộn trong quá trình tích hợp với các nền tảng dữ liệu.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu về cơ chế **CDC/Incremental Data Extraction**, đồng thời hỗ trợ hiệu quả cho việc tích hợp với các nền tảng như **Data Platform, ESB hoặc Data Warehouse**, phục vụ khai thác và đồng bộ dữ liệu trong kiến trúc CNTT tổng thể của đơn vị.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image52.jpg){width="6.873966535433071in" height="3.75in"}

3.3.2 Phần mềm phải hỗ trợ cơ chế backfill/replay theo khoảng thời gian (Time Window) để xử lý dữ liệu đến muộn (Late Arriving) và phục vụ tái đồng bộ khi có sự cố.

Phầm mềm (Vnresource) hỗ trợ cơ chế **truy xuất dữ liệu theo khoảng thời gian (Time Window)** dựa trên các trường thời gian như **Created Date** và **Last Updated Date**, cho phép thực hiện backfill dữ liệu lịch sử và replay dữ liệu trong các khoảng thời gian xác định nhằm phục vụ xử lý các trường hợp dữ liệu đến muộn (**Late Arriving Data**) hoặc khi cần tái đồng bộ dữ liệu sau sự cố tích hợp.

Bên cạnh đó, hệ thống cung cấp API tích hợp hỗ trợ truy xuất dữ liệu theo tham số **from/to** hoặc **updated_since**, giúp hệ thống tích hợp bên ngoài chủ động thực hiện đồng bộ lại dữ liệu bị thiếu, kiểm soát tính toàn vẹn dữ liệu và đảm bảo tính liên tục trong quá trình trao đổi dữ liệu với các nền tảng tích hợp trung gian.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu về cơ chế **backfill/replay theo Time Window**, đồng thời hỗ trợ hiệu quả cho việc tái đồng bộ dữ liệu với các nền tảng như **ESB, Data Platform hoặc MDM**, bảo đảm liên kết dữ liệu ổn định và xuyên suốt trong kiến trúc hệ thống.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image14.jpg){width="6.873966535433071in" height="3.75in"}

3.3.3 Phần mềm phải cho phép trích xuất delta bao gồm insert/update/delete theo mốc thời gian (Watermark) hoặc theo phiên bản (Version) để đồng bộ dữ liệu chính xác về Data Platform/ESB.

Phần mềm Vnresource cam kết cho phép trích xuất dữ liệu gia tăng (delta) bao gồm đầy đủ các thao tác Insert, Update, Delete theo mốc thời gian (Watermark/Timestamp) hoặc theo phiên bản (Version) nhằm phục vụ đồng bộ dữ liệu chính xác, không bỏ sót, không trùng lặp về Data Platform và hoặc ESB theo kiến trúc tích hợp của Chủ đầu tư.