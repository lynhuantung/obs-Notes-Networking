---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, primary-key, mdm]
date: 2026-04-30
section: "§3.4 Ổn định khóa chính"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[05-CDC-KhoaChinh-BaoMat-IAM]]
**Liên quan:** [[s3g-BaoMat-TichHop-IAM]]

## Ổn định khóa chính và quy ước định danh

> 3.4.1 Phần mềm phải đảm bảo Khóa chính cho các thực thể lõi như tổ chức/đơn vị, tài sản, người dùng/nhân sự, hồ sơ/văn bản, quy trình, rủi ro, khóa học,... (tùy đặc thù nghiệp vụ theo từng phần mềm) là ổn định, không thay đổi theo thời gian.

Phầm mềm (Vnresource) đảm bảo sử dụng **khóa chính định danh duy nhất (Primary Key)** cho các thực thể dữ liệu lõi như tổ chức/đơn vị, người dùng/nhân sự, hồ sơ nhân sự, quy trình, khóa học đào tạo và các danh mục dùng chung trong hệ thống. Các khóa định danh này được sinh tự động bởi hệ thống và được thiết kế **ổn định, không thay đổi theo thời gian**, đảm bảo tính nhất quán trong suốt vòng đời dữ liệu.

Bên cạnh đó, hệ thống áp dụng nguyên tắc tách biệt giữa **khóa định danh kỹ thuật của hệ thống** và **mã nghiệp vụ sử dụng trong vận hành**, nhờ đó vẫn đảm bảo khả năng quản lý linh hoạt theo yêu cầu nghiệp vụ mà không ảnh hưởng đến tính ổn định của khóa chính phục vụ tích hợp dữ liệu.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu về **khóa chính ổn định cho các thực thể lõi**, đồng thời hỗ trợ hiệu quả cho việc đồng bộ dữ liệu với các nền tảng tích hợp như Data Platform, ESB hoặc hệ thống quản trị dữ liệu tập trung trong kiến trúc CNTT tổng thể của đơn vị.

3.4.2 Phần mềm phải đảm bảo có quy tắc chuẩn, duy nhất, để đồng bộ ID giữa Phần mềm và nền tảng MDM/Data Platform.

Phầm mềm (Vnresource) đảm bảo áp dụng cơ chế **định danh duy nhất (Unique Identifier)** cho các thực thể dữ liệu lõi như tổ chức/đơn vị, người dùng/nhân sự, hồ sơ nhân sự, quy trình và các danh mục dùng chung. Các định danh này được sinh tự động theo quy tắc chuẩn của hệ thống và được duy trì **ổn định, nhất quán trong suốt vòng đời dữ liệu**, phục vụ làm khóa tham chiếu trong quá trình tích hợp với các nền tảng **MDM/Data Platform**.

Bên cạnh đó, hệ thống áp dụng nguyên tắc **tách biệt giữa định danh kỹ thuật của hệ thống (System ID)** và **mã nghiệp vụ vận hành (Business Code)**, giúp đảm bảo khả năng thay đổi linh hoạt theo yêu cầu quản trị mà không ảnh hưởng đến tính nhất quán của ID dùng cho tích hợp dữ liệu liên hệ thống.

Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu về **quy tắc chuẩn và duy nhất để đồng bộ ID giữa phần mềm và nền tảng MDM/Data Platform**, đồng thời hỗ trợ hiệu quả cho việc đồng bộ, đối soát và quản trị dữ liệu tập trung trong kiến trúc CNTT tổng thể của đơn vị.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image3.jpg){width="6.873966535433071in" height="3.8333333333333335in"}

3.4.3 NCC cam kết hỗ trợ mapping/đồng bộ ID nội bộ của Phần mềm với Master Data dùng chung của PTSC (qua ESB và/hoặc Data Platform/MDM), bảo đảm liên kết dữ liệu end-to-end.

Phần mềm (Vnresource) hỗ trợ cơ chế **mapping và đồng bộ ID nội bộ của phần mềm** với **Master Data dùng chung** thông qua các kênh tích hợp như **ESB và/hoặc Data Platform/MDM**, nhằm đảm bảo khả năng liên kết dữ liệu xuyên suốt giữa hệ thống HRM và các hệ thống trong kiến trúc CNTT tổng thể của đơn vị. Các định danh nội bộ được thiết kế ổn định, duy nhất và được cung cấp đầy đủ qua API tích hợp phục vụ tham chiếu và đồng bộ dữ liệu liên hệ thống.

Bên cạnh đó, hệ thống hỗ trợ cấu hình ánh xạ giữa **ID nội bộ của phần mềm** và **ID Master Data dùng chung**, cho phép thực hiện đồng bộ hai chiều theo quy trình tích hợp thống nhất, đảm bảo tính nhất quán dữ liệu trong quá trình trao đổi thông tin giữa các hệ thống nghiệp vụ.

Với các khả năng trên, nhà cung cấp cam kết hỗ trợ **mapping/đồng bộ ID nội bộ của phần mềm với Master Data dùng chung của PTSC thông qua ESB và/hoặc Data Platform/MDM**, bảo đảm liên kết dữ liệu **end-to-end**, phục vụ hiệu quả cho quản trị dữ liệu tập trung và tích hợp liên thông trong kiến trúc CNTT tổng thể của PTSC.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image7.jpg){width="6.873966535433071in" height="3.75in"}