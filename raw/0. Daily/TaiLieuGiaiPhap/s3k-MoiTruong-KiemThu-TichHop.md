---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, uat, sandbox, reprocess]
date: 2026-04-30
section: "§3.9 Kiểm thử & triển khai"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[07-KiemThu-VanHanh-SchemaChange]]
**Sub-topics:** [[s3k1-Reprocess-TimeWindow]] | [[s3k2-Redrive-Batch-Job]] | [[s3k3-Redrive-CorrelationId]] | [[s3k4-KiemSoat-TaiXuLy]]

## Môi trường kiểm thử tích hợp & hỗ trợ triển khai

> 3.9.1 Nhà cung cấp Phần mềm phải cung cấp môi trường DEV/UAT với đầy đủ API, cấu hình tích hợp giống production. Phần mềm phát triển riêng cho PTSC: cung cấp DEV/UAT tương đương. Phần mềm SaaS: cung cấp sandbox/UAT tenant (hoặc môi trường test) có API tương đương production.

Phần mềm (Vnresource) hỗ trợ cung cấp **môi trường sandbox/UAT tenant (môi trường kiểm thử)** với **đầy đủ API và cấu hình tích hợp tương đương môi trường production**, nhằm phục vụ kiểm thử tích hợp, kiểm thử luồng dữ liệu và xác nhận các kịch bản trao đổi dữ liệu trước khi triển khai chính thức.

Môi trường sandbox/UAT hỗ trợ:

- truy cập bộ **API tích hợp đầy đủ theo phạm vi triển khai**

- kiểm thử kết nối với **ESB, Data Platform, IAM/SSO**

- kiểm thử cơ chế **OAuth2.0/OpenID Connect hoặc cơ chế xác thực tương đương**

- kiểm thử mapping dữ liệu và kiểm thử hiệu năng tích hợp trước khi go-live

Bên cạnh đó, cấu hình tích hợp trên môi trường sandbox/UAT được thiết kế **tương đương production về schema dữ liệu, API interface và cơ chế bảo mật tích hợp**, đảm bảo tính nhất quán trong quá trình kiểm thử và triển khai chính thức. 🔄

Với các khả năng trên, nhà cung cấp cam kết cung cấp **sandbox/UAT tenant có API và cấu hình tích hợp tương đương production**, đáp ứng yêu cầu kiểm thử tích hợp của PTSC

> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image2.png){width="6.873966535433071in" height="2.875in"}
>
> 3.9.2 Nhà cung cấp Phần mềm phải cung cấp bộ dữ liệu mẫu, kịch bản test chuẩn để Data Platform & khách hàng test tích hợp 02 chiều.
>
> [Nhà cung cấp cam kết cung cấp bộ testcase\... trong quá trình làm dự án]{.mark}
>
> [Vd: bộ test case mẫu]{.mark}
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image9.png){width="6.873966535433071in" height="2.0555555555555554in"}
>
> 3.9.3 Nhà cung cấp phải hỗ trợ cơ chế reprocess/re-drive (theo khoảng thời gian, theo batch/job hoặc theo request/correlation id) để xử lý lỗi và tái đồng bộ dữ liệu.
>
> Phần mềm (**VnResource**) hỗ trợ cơ chế **reprocess/re-drive dữ liệu** nhằm xử lý lỗi và tái đồng bộ dữ liệu trong quá trình tích hợp với các hệ thống bên ngoài như **Data Platform, ESB, Middleware hoặc các nền tảng dữ liệu tập trung**. Hệ thống cho phép thực hiện tái xử lý dữ liệu linh hoạt theo nhiều tiêu chí khác nhau như theo **khoảng thời gian phát sinh dữ liệu**, theo **batch/job đồng bộ** hoặc theo **request id/correlation id** của từng giao dịch tích hợp, đảm bảo khả năng khôi phục dữ liệu nhanh chóng và chính xác khi xảy ra sự cố trong quá trình tích hợp dữ liệu.
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image54.jpg){width="6.873966535433071in" height="3.75in"}
>
> 3.9.4 Nhà cung cấp phải hỗ trợ cơ chế reprocess/re-drive (theo khoảng thời gian, theo batch/job hoặc theo request/correlation id) để xử lý lỗi và tái đồng bộ dữ liệu

Nhà  cam kết giải pháp tích hợp của Phần mềm (VnResource) hỗ trợ đầy đủ cơ chế reprocess / re-drive nhằm xử lý giao dịch lỗi và tái đồng bộ dữ liệu với các hệ thống liên thông như ESB, Data Platform, MDM, Middleware. Cơ chế này cho phép tái xử lý có kiểm soát theo khoảng thời gian (time window), theo batch/job, hoặc theo request id / correlation id, đảm bảo khôi phục dữ liệu nhanh, đúng, không trùng lặp, phục vụ vận hành liên tục và đối soát dễ dàng.