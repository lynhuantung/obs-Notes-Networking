---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, idempotent, correlation-id]
date: 2026-04-30
section: "§3.8 Idempotent API"
---

← [[s3i-HieuNang-KenhTichHop-PTSC]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Sub-topics:** [[s3j1-Retry-Backoff-GioiHan]] | [[s3j2-Idempotent-Deduplicate]] | [[s3j3-PhanLoai-Loi-Retry]]

## Thiết kế API/messaging idempotent, có cơ chế theo dõi giao dịch

> 3.8.1 Các API và message inbound vào Phần mềm phải thiết kế idempotent (gửi lại nhiều lần với cùng request ID không gây trùng dữ liệu).

Phần mềm (Vnresource) hỗ trợ cơ chế thiết kế **API và message inbound theo nguyên tắc idempotent**, cho phép xử lý các yêu cầu gửi lại nhiều lần với cùng **request ID** mà không gây phát sinh trùng lặp dữ liệu trong hệ thống. Cơ chế này giúp đảm bảo tính toàn vẹn và nhất quán dữ liệu trong quá trình tích hợp với các hệ thống như **ESB, Data Platform hoặc các nền tảng tích hợp trung gian**.

Bên cạnh đó, hệ thống hỗ trợ kiểm soát trùng lặp thông qua các cơ chế như **định danh request (request ID), khóa định danh dữ liệu (unique identifier) và kiểm tra trạng thái xử lý giao dịch**, giúp đảm bảo mỗi yêu cầu chỉ được ghi nhận một lần ngay cả trong trường hợp xảy ra retry do lỗi mạng hoặc gián đoạn tích hợp.

Với các khả năng trên, nhà cung cấp cam kết các **API và message inbound được thiết kế theo nguyên tắc idempotent**, hỗ trợ gửi lại yêu cầu nhiều lần mà không gây trùng dữ liệu, đảm bảo an toàn và ổn định trong quá trình tích hợp dữ liệu theo kiến trúc CNTT tổng thể của đơn vị.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image70.jpg){width="6.873966535433071in" height="3.75in"}

3.8.2 Các API và message inbound vào Phần mềm phải hỗ trợ correlationId/ traceId để theo dõi end-to-end qua ESB, Data Platform và Phần mềm.

[Nhà cung cấp cam kết các **API và message inbound** hỗ trợ **correlationId / traceId** để theo dõi giao dịch end-to-end giữa ESB, Data Platform và Phần mềm; đồng thời ghi nhận các mã này trong log xử lý nhằm phục vụ giám sát, đối soát và truy vết lỗi.]{.mark}

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image21.jpg){width="6.873966535433071in" height="3.75in"}

> 3.8.3 Các API/Message phục vụ đồng bộ dữ liệu phải hỗ trợ upsert semantics (insert nếu chưa có, update nếu đã tồn tại) theo khóa định danh thống nhất; cơ chế xử lý xung đột (conflict) phải được mô tả rõ (ưu tiên theo updated_at hoặc version).

Phần mềm (Vnresource) hỗ trợ cơ chế **upsert semantics** đối với các **API và message phục vụ đồng bộ dữ liệu**, cho phép thực hiện **insert khi bản ghi chưa tồn tại và update khi bản ghi đã tồn tại** dựa trên **khóa định danh thống nhất (unique identifier)** của từng thực thể dữ liệu, đảm bảo tính nhất quán trong quá trình trao đổi dữ liệu giữa phần mềm và các hệ thống như **ESB, Data Platform hoặc MDM**.

Bên cạnh đó, hệ thống hỗ trợ cơ chế **xử lý xung đột dữ liệu (conflict handling)** theo các nguyên tắc rõ ràng như **ưu tiên theo thời điểm cập nhật gần nhất (updated_at)** hoặc theo **phiên bản dữ liệu (version)** tùy theo từng kịch bản tích hợp và phạm vi dữ liệu được thống nhất giữa các hệ thống liên quan, giúp đảm bảo tính toàn vẹn và nhất quán dữ liệu trong quá trình đồng bộ.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image6.jpg){width="6.873966535433071in" height="3.75in"}

> 3.8.4 Khi có lỗi tích hợp, phải có cơ chế retry có kiểm soát (backoff), tránh tạo trùng dữ liệu; mô tả rõ các mã lỗi có thể retry/không retry.

Nhà  cam kết giải pháp tích hợp giữa Phần mềm (Vnresource) với ESB, Data Platform, MDM có cơ chế retry có kiểm soát (controlled retry) theo backoff và không tạo trùng dữ liệu, đồng thời mô tả rõ nhóm mã lỗi retry được hoặc không retry để đảm bảo vận hành ổn định, an toàn dữ liệu và dễ giám sát.