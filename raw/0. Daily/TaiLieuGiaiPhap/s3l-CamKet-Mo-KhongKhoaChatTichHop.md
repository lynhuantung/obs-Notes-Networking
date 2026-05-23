---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, open-integration, vendor-lock]
date: 2026-04-30
section: "§3.10 Cam kết mở"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[07-KiemThu-VanHanh-SchemaChange]]
**Tiếp theo:** [[s3m-Yc-ChatLuong-DuLieu-Doicoat]]

## Cam kết mở/không khóa chặt tích hợp

> 3.10.1 Nhà cung cấp Phần mềm phải cam kết: không giới hạn số interface/ kênh tích hợp ở mức "không hợp lý về mặt kỹ thuật".

Phần mềm (VnResource) cam kết hỗ trợ triển khai các interface/kênh tích hợp theo nhu cầu kết nối thực tế của dự án và không áp dụng các giới hạn không hợp lý về mặt kỹ thuật đối với số lượng interface/kênh tích hợp trong phạm vi khai thác, vận hành và mở rộng hệ thống. Việc thiết kế khả năng tích hợp của hệ thống được thực hiện theo hướng mở, linh hoạt và có khả năng mở rộng, nhằm đáp ứng yêu cầu kết nối với các nền tảng như Data Platform, ESB, API Gateway hoặc các hệ thống nghiệp vụ liên quan.

Bên cạnh đó, hệ thống cho phép tổ chức và vận hành nhiều luồng tích hợp, giao diện kết nối, API endpoint hoặc kênh trao đổi dữ liệu trên cơ sở phù hợp với kiến trúc triển khai, năng lực hạ tầng và yêu cầu thực tế của đơn vị sử dụng. Các giới hạn nếu có sẽ chỉ xuất phát từ những yếu tố hợp lý về mặt kỹ thuật như năng lực tài nguyên, cấu hình hạ tầng, yêu cầu bảo mật, hiệu năng xử lý hoặc đặc tính của môi trường triển khai, và sẽ được trao đổi, thống nhất minh bạch trong quá trình triển khai dự án.

Đồng thời, giải pháp hỗ trợ khả năng mở rộng quy mô tích hợp theo từng giai đoạn phát triển hệ thống, bảo đảm khi phát sinh thêm nhu cầu kết nối mới, việc bổ sung interface/kênh tích hợp có thể được thực hiện thuận lợi mà không bị ràng buộc bởi các giới hạn mang tính bất hợp lý hoặc cản trở vận hành thực tế.

Với các khả năng trên, phần mềm VnResource đáp ứng yêu cầu về việc không giới hạn số interface/kênh tích hợp ở mức không hợp lý về mặt kỹ thuật, đồng thời bảo đảm tính linh hoạt, khả năng mở rộng và hiệu quả khai thác

3.10.2 Nhà cung cấp Phần mềm phải cam kết: Với phần mềm thiết kế riêng cho PTSC: mọi cấu hình/API tích hợp với Data Platform đều có thể truy cập, cấu hình bởi đội kỹ thuật khách hàng/Data Platform theo quyền được cấp, không phụ thuộc độc quyền vào vendor. Với phần mềm SaaS: PTSC có quyền truy cập admin console/API management trong phạm vi được cấp; có tài khoản service và tài liệu cấu hình để PTSC/đơn vị Data Platform tự vận hành tích hợp.

Phần mềm (**VnResource**) cam kết đảm bảo khả năng **truy cập, cấu hình và vận hành tích hợp dữ liệu một cách chủ động bởi đội kỹ thuật của PTSC hoặc đơn vị Data Platform theo phạm vi phân quyền được cấp**, không phụ thuộc độc quyền vào Nhà cung cấp trong quá trình khai thác và vận hành tích hợp hệ thống.

Đối với **mô hình triển khai phần mềm thiết kế riêng (On-premise hoặc Dedicated)** cho PTSC, hệ thống cho phép đội kỹ thuật của PTSC hoặc đơn vị Data Platform được cấp quyền truy cập vào các cấu hình tích hợp như cấu hình API endpoint, tham số kết nối, cơ chế xác thực, lịch đồng bộ dữ liệu, mapping dữ liệu và các interface trao đổi dữ liệu với Data Platform. Việc quản trị các cấu hình tích hợp này được thực hiện thông qua các công cụ quản trị hệ thống hoặc tài liệu cấu hình do Nhà cung cấp bàn giao, đảm bảo khả năng chủ động vận hành và mở rộng tích hợp mà không phụ thuộc vào vendor.

Đối với **mô hình triển khai phần mềm SaaS**, hệ thống cung cấp quyền truy cập vào **admin console và API management** trong phạm vi được phân quyền phù hợp, đồng thời cung cấp **service account phục vụ tích hợp hệ thống**, tài liệu kỹ thuật API và hướng dẫn cấu hình cần thiết để đội kỹ thuật PTSC hoặc đơn vị Data Platform có thể chủ động triển khai, vận hành và giám sát các kênh tích hợp dữ liệu theo kiến trúc CNTT tổng thể của đơn vị.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu về **quyền chủ động truy cập, cấu hình và vận hành các interface/API tích hợp với Data Platform**, đồng thời hạn chế phụ thuộc vào Nhà cung cấp trong quá trình khai thác tích hợp, phù hợp với yêu cầu quản trị hệ thống và kiến trúc dữ liệu tập trung của PTSC