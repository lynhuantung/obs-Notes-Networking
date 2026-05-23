---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, van-hanh, monitoring, runbook]
date: 2026-04-30
section: "§3.12 Vận hành tích hợp"
---

← [[s3m-Yc-ChatLuong-DuLieu-Doicoat]] | [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]]
**Tiếp theo:** [[s3o-QuanLy-ThayDoi-Interface-Schema]]

## Yêu cầu vận hành tích hợp

> 3.12.1 Tích hợp phải có cơ chế giám sát trạng thái và cảnh báo tối thiểu: số lượng giao dịch, tỷ lệ lỗi, số lần retry, độ trễ đồng bộ (lag/latency).

Phần mềm (VnResource) cam kết cung cấp cơ chế giám sát trạng thái và cảnh báo tích hợp đầy đủ, nhằm bảo đảm PTSC và đơn vị Data Platform có thể theo dõi liên tục, phát hiện sớm và xử lý kịp thời các vấn đề phát sinh trong quá trình vận hành hệ thống.

Giải pháp tích hợp được thiết kế với khả năng giám sát tập trung (centralized monitoring), cho phép thu thập, tổng hợp và hiển thị các chỉ số vận hành quan trọng theo thời gian thực hoặc gần thời gian thực, thông qua các công cụ dashboard và hệ thống cảnh báo phù hợp với kiến trúc triển khai.

Cụ thể, hệ thống hỗ trợ theo dõi tối thiểu các chỉ số sau:

- Số lượng giao dịch (Transaction Volume): ghi nhận và thống kê số lượng giao dịch theo từng luồng tích hợp, từng API/interface hoặc theo khoảng thời gian, giúp đánh giá tải hệ thống và xu hướng sử dụng.

- Tỷ lệ lỗi (Error Rate): theo dõi tỷ lệ giao dịch thất bại trên tổng số giao dịch, phân loại theo nhóm lỗi (kết nối, dữ liệu, nghiệp vụ, hệ thống) để hỗ trợ phân tích nguyên nhân.

- Số lần retry (Retry Count): giám sát số lần thực hiện retry đối với các giao dịch lỗi, bao gồm retry tự động và thủ công, giúp phát hiện các vấn đề lặp lại hoặc bất ổn trong hệ thống downstream.

- Độ trễ đồng bộ (Lag/Latency): đo lường thời gian từ khi phát sinh dữ liệu tại hệ thống nguồn đến khi được xử lý thành công tại hệ thống đích, bảo đảm đáp ứng các yêu cầu về SLA và tính kịp thời của dữ liệu.

Bên cạnh đó, hệ thống hỗ trợ thiết lập ngưỡng cảnh báo (threshold) cho từng chỉ số, phù hợp với đặc thù vận hành và SLA đã thống nhất. Khi vượt ngưỡng, cơ chế cảnh báo sẽ được kích hoạt thông qua các kênh như email, dashboard, webhook hoặc các công cụ giám sát tập trung, giúp đội vận hành phản ứng nhanh và chủ động xử lý sự cố.

Các chỉ số giám sát và cảnh báo được cấu hình linh hoạt theo từng luồng tích hợp, đồng thời bảo đảm tuân thủ các yêu cầu về phân quyền truy cập, bảo mật thông tin và kiểm soát vận hành. Toàn bộ cấu hình liên quan đến monitoring và alerting được cung cấp minh bạch, cho phép PTSC hoặc đơn vị Data Platform chủ động điều chỉnh và mở rộng theo nhu cầu thực tế.

Với các khả năng trên, phần mềm VnResource đáp ứng yêu cầu về giám sát trạng thái và cảnh báo tích hợp, đồng thời bảo đảm tính minh bạch, khả năng kiểm soát và hiệu quả vận hành hệ thống trong dài hạn.

3.12.2 Phải cung cấp hướng dẫn vận hành (runbook) cho các tình huống: retry, reprocess, truy vết theo correlation id.

Phần mềm (**VnResource**) cung cấp **tài liệu hướng dẫn vận hành (runbook)** phục vụ đội kỹ thuật của đơn vị trong quá trình giám sát, xử lý sự cố và vận hành tích hợp dữ liệu với các hệ thống như **Data Platform, ESB hoặc các nền tảng tích hợp trung gian**. Tài liệu runbook được xây dựng theo các kịch bản vận hành thực tế, giúp đội kỹ thuật có thể chủ động thực hiện các thao tác xử lý lỗi và tái đồng bộ dữ liệu mà không phụ thuộc vào Nhà cung cấp trong quá trình khai thác hệ thống.

Cụ thể, runbook bao gồm hướng dẫn chi tiết cho các tình huống **retry dữ liệu**, cho phép thực hiện tái gửi lại các giao dịch tích hợp bị lỗi theo từng bản ghi hoặc theo từng phiên đồng bộ; hướng dẫn **reprocess dữ liệu**, cho phép thực hiện tái xử lý dữ liệu theo khoảng thời gian, theo batch/job hoặc theo request id/correlation id khi xảy ra gián đoạn tích hợp; đồng thời cung cấp hướng dẫn **truy vết giao dịch theo correlation id** nhằm xác định nhanh nguyên nhân lỗi, trạng thái xử lý và lịch sử trao đổi dữ liệu giữa các hệ thống liên quan.

Bên cạnh đó, runbook cũng mô tả quy trình kiểm tra trạng thái interface tích hợp, kiểm tra log xử lý, xác định điểm lỗi trong chuỗi tích hợp và thực hiện các bước khắc phục tương ứng theo từng kịch bản vận hành. Tài liệu được bàn giao trong bộ tài liệu triển khai tích hợp, hỗ trợ đội kỹ thuật của đơn vị chủ động giám sát, vận hành và xử lý sự cố trong môi trường tích hợp dữ liệu thực tế