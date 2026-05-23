---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, api, esb]
date: 2026-04-30
section: "§3.1 Chuẩn giao tiếp"
aliases: [Chuẩn giao tiếp API ESB]
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[04-Chuan-GiaoTiep-API-ESB]]
**Liên quan:** [[s3a-LuongDuLieu-2Chieu-ESB]]

## Chuẩn giao tiếp và định dạng dữ liệu với nền tảng dữ liệu Phần mềm phải hỗ trợ tối thiểu các kênh giao tiếp sau để tích hợp với nền tảng dữ liệu (Data Platform) và trục tích hợp (ESB)

1.  RESTful API sử dụng JSON, có tài liệu Open API/Swagger đầy đủ

> Phần mềm HRM (VnResource) đáp ứng đầy đủ yêu cầu:
>
> Cung cấp hệ thống RESTful API tuân thủ chuẩn HTTP/HTTPS (GET, POST, PUT/PATCH, DELETE).
>
> Định dạng dữ liệu trao đổi sử dụng JSON.
>
> Tài liệu API được cung cấp đầy đủ theo chuẩn:

- OpenAPI 3.x (Swagger)

- Bao gồm: endpoint, request/response schema, authentication, error codes, ví dụ mẫu.

> Hỗ trợ: OAuth2 / API Key / JWT cho xác thực

1.  Kết nối JDBC/ODBC hoặc view/reporting database để trích xuất batch (áp dụng cho Phần mềm thiết kế riêng cho PTSC nếu có). Hoặc NCC cung cấp cơ chế bulk export/ API export tương đương đối với phần mềm SaaS.

> Phần mềm HRM (VnResource) đáp ứng yêu cầu cung cấp cơ chế Bulk Export / API Export tương đương đối với phần mềm SaaS.
>
> Cụ thể, hệ thống cung cấp các API cho phép trích xuất dữ liệu nhân sự theo từng đối tượng nghiệp vụ như hồ sơ nhân viên, hợp đồng lao động, chấm công, tiền lương, đào tạo,... với khả năng lọc theo thời gian và các tiêu chí liên quan. Các API hỗ trợ phân trang nhằm đảm bảo khả năng xử lý dữ liệu khối lượng lớn và tối ưu hiệu năng khi tích hợp với các hệ thống bên ngoài.
>
> Đối với nhu cầu trích xuất dữ liệu lớn, hệ thống hỗ trợ cơ chế xử lý bất đồng bộ, cho phép tạo tác vụ export dữ liệu nền, theo dõi trạng thái xử lý và tải dữ liệu sau khi hoàn tất. Cơ chế này giúp tránh timeout và đảm bảo tính ổn định trong quá trình tích hợp.
>
> Ngoài ra, hệ thống hỗ trợ export dữ liệu theo lô (bulk export) dưới dạng file với các định dạng chuẩn mở như CSV, JSON và có thể mở rộng sang các định dạng nếu có yêu cầu. Việc export có thể thực hiện theo yêu cầu hoặc cấu hình chạy định kỳ để phục vụ đồng bộ dữ liệu tự động.
>
> Các cơ chế trên đảm bảo khả năng trích xuất dữ liệu đầy đủ, hiệu năng cao, đáp ứng yêu cầu tích hợp trong việc cung cấp dữ liệu cho hệ sinh thái của khách hàng.

2.  Xuất/nhập file theo chuẩn mở (CSV, JSON; ưu tiên thêm Parquet/Avro nếu hỗ trợ).

> Cụ thể, hệ thống hỗ trợ xuất và nhập dữ liệu dưới các định dạng phổ biến như CSV và JSON, phục vụ cho các nhu cầu trao đổi dữ liệu, tích hợp hệ thống và xử lý batch. Các định dạng này đảm bảo tính phổ biến, dễ tích hợp với các hệ thống khác cũng như nền tảng dữ liệu.
>
> Bên cạnh đó, hệ thống có khả năng hỗ trợ bổ sung các định dạng dữ liệu nâng cao như Parquet và Avro khi có yêu cầu, nhằm phục vụ tích hợp với các nền tảng, đảm bảo tối ưu hiệu năng lưu trữ và xử lý dữ liệu lớn.
>
> Với các khả năng trên, hệ thống đảm bảo đáp ứng yêu cầu về chuẩn dữ liệu mở, đồng thời linh hoạt mở rộng theo nhu cầu tích hợp của khách hàng.
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image50.png){width="6.873966535433071in" height="4.583333333333333in"}
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image49.png){width="6.873966535433071in" height="4.583333333333333in"}

3.  Định dạng thời gian trong dữ liệu tích hợp phải thống nhất, quy ước timezone rõ ràng để tránh sai lệch khi đồng bộ đa hệ thống.

> Phần mềm HRM đáp ứng yêu cầu chuẩn hóa định dạng thời gian trong dữ liệu tích hợp. Hệ thống sử dụng thống nhất chuẩn ISO 8601 cho toàn bộ dữ liệu trao đổi, các giá trị thời gian luôn kèm thông tin timezone rõ ràng. Dữ liệu được lưu trữ mặc định theo UTC và có thể chuyển đổi sang múi giờ địa phương khi hiển thị hoặc tích hợp. Quy ước này được áp dụng xuyên suốt trong API và dữ liệu xuất/nhập, đảm bảo tính nhất quán và tránh sai lệch khi đồng bộ giữa các hệ thống.
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image24.jpg){width="6.873966535433071in" height="4.611111111111111in"}

4.  Các API phục vụ trích xuất/đồng bộ dữ liệu phải hỗ trợ tối thiểu hoặc tương đương: Pagination (limit/offset hoặc cursor); Filter theo thời gian (ví dụ: updated_since, from/to); Quy định rõ giới hạn kỹ thuật (max page size/max payload/rate limit) và cơ chế trả lỗi chuẩn.

Phần mềm đáp ứng đầy đủ các yêu cầu đối với API phục vụ trích xuất và đồng bộ dữ liệu. Cụ thể, hệ thống hỗ trợ phân trang theo cả hai phương thức limit/offset và cursor, cho phép xử lý hiệu quả dữ liệu khối lượng lớn. API hỗ trợ lọc dữ liệu theo thời gian thông qua các tham số như updated_since, from/to, phù hợp cho các kịch bản đồng bộ dữ liệu tăng dần. Ngoài ra, hệ thống quy định rõ các giới hạn kỹ thuật như số lượng bản ghi tối đa mỗi trang, kích thước dữ liệu tối đa mỗi request và tần suất gọi API. Cơ chế trả lỗi tuân thủ chuẩn HTTP status code và trả về thông tin lỗi dạng JSON rõ ràng, giúp hệ thống tích hợp dễ dàng xử lý và kiểm soát lỗi.

5.  Tiêu chuẩn thiết kế tích hợp, Nhà cung cấp cam kết phối hợp khảo sát, thiết kế và lập các sơ đồ thiết kế liên quan đến Phần mềm, gồm tối thiểu các nội dung sau:

3.1.6.1 Sơ đồ thiết kế số hoá quy trình liên phòng ban. Sơ đồ số hoá quy trình phải mô tả đầy đủ luồng nghiệp vụ, vai trò các bộ phận/nhân sự tham gia và xác định rõ mỗi bước được thực hiện trên phần mềm nào trong hệ sinh thái. Nội dung sơ đồ tối thiểu phải bao gồm: Các vai trò tham gia: đơn vị đề xuất, bộ phận kiểm tra, lãnh đạo phê duyệt, kế toán, nhân sự vận hành,.... Các bước xử lý nghiệp vụ: thể hiện tuần tự logic từ khởi tạo → kiểm tra → phê duyệt & ký số → cập nhật trạng thái → lưu trữ. Mapping với hệ thống phần mềm: chỉ rõ mỗi bước được thực hiện trên hệ thống nào (ERP, eOffice, CMMS,...). Điểm kiểm soát: thể hiện bước quyết định (Yes/No) hoặc trạng thái xử lý (Pending, Approved, Rejected....)

Dưới đây là mẫu sơ đồ số hoá quy trình liên phòng ban theo yêu cầu: mô tả đầy đủ luồng nghiệp vụ, vai trò tham gia, mapping từng bước với phần mềm trong hệ sinh thái (ERP, eOffice, CMMS, Data Platform...), đồng thời thể hiện rõ điểm kiểm soát (Yes/No) và trạng thái xử lý.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image65.png){width="6.873966535433071in" height="4.583333333333333in"}

- **Phạm vi và nguyên tắc mô tả**

Quy trình mẫu: "Đề xuất và phê duyệt yêu cầu" (có thể áp dụng cho: mua sắm, sửa chữa, cấp phát, thanh toán, điều động nhân sự...).

Hệ sinh thái phần mềm tham chiếu (có thể thay theo thực tế):

eOffice/DMS: khởi tạo, luân chuyển, ký số, lưu trữ hồ sơ

ERP: kiểm tra ngân sách, tạo chứng từ, ghi nhận chi phí, thanh toán

CMMS (nếu là yêu cầu bảo trì/sửa chữa): tạo và xử lý Work Order

Data Platform: đồng bộ master data, kiểm soát chất lượng dữ liệu, dashboard theo dõi

- **Vai trò tham gia (tối thiểu)**

Đơn vị đề xuất (người lập đề xuất)

Bộ phận kiểm tra (nghiệp vụ/kiểm soát nội bộ/QA tuỳ quy trình)

Lãnh đạo phê duyệt (cấp quản lý, cấp có thẩm quyền)

Kế toán/Tài chính (kiểm tra ngân sách, hạch toán, thanh toán)

Nhân sự vận hành (thực hiện triển khai, cập nhật kết quả, nghiệm thu)

(Tuỳ chọn) IT/HSE/Pháp chế (tham gia kiểm tra điều kiện chuyên môn)

- **Sơ đồ luồng nghiệp vụ + mapping hệ thống + điểm kiểm soát**

Bạn có thể copy nguyên khối dưới đây vào tài liệu  (dạng sơ đồ chữ). Nếu bạn muốn tôi dựng thành sơ đồ BPMN/flowchart đẹp để dán vào slide/Gamma, nói tôi dùng định dạng nào: BPMN 2.0, swimlane, hay flowchart.

**Sơ đồ (dạng swimlane mô tả)**

- **Điểm kiểm soát bắt buộc thể hiện trong sơ đồ**

Yes/No Gate:

Hồ sơ hợp lệ? (đủ trường, đúng biểu mẫu, đủ file đính kèm)

Ngân sách/định mức hợp lệ?

Phê duyệt đúng thẩm quyền? (tuỳ cấu hình)

Trạng thái chuẩn hoá (khuyến nghị dùng thống nhất toàn hệ):

Draft

Pending Review

Pending Approval

Approved

Rejected

Returned (trả về bổ sung)

In Progress

Completed

Archived

Giải pháp cam kết cung cấp sơ đồ số hoá quy trình liên phòng ban mô tả đầy đủ luồng nghiệp vụ end-to-end, thể hiện rõ vai trò tham gia, trình tự xử lý từ khởi tạo, kiểm tra, phê duyệt và ký số, cập nhật trạng thái đến lưu trữ, đồng thời mapping cụ thể từng bước với hệ thống phần mềm trong hệ sinh thái (ERP, eOffice, CMMS, Data Platform hoặc hệ thống liên quan). Sơ đồ thể hiện rõ các điểm kiểm soát quyết định (Yes/No) và trạng thái xử lý (Pending, Approved, Rejected, ...) nhằm bảo đảm tính minh bạch, dễ vận hành, dễ kiểm soát và sẵn sàng mở rộng.

3.1.6.2 Sơ đồ thiết kế kỹ thuật tích hợp. Sơ đồ kỹ thuật tích hợp phải thể hiện rõ kiến trúc liên thông giữa các phần mềm (ERP, HRM, CMMS, eOffice,...) thông qua ESB, đồng thời mô tả chi tiết dữ liệu, API, và trạng thái trao đổi trong từng kịch bản nghiệp vụ. Nội dung tối thiểu phải bao gồm: Các thành phần tham gia: ERP, eOffice, HRM, CMMS, ESB (hoặc hệ thống khác liên quan trong kịch bản quy trình tích hợp bên dưới). Luồng dữ liệu trao đổi: Thể hiện dữ liệu đi và dữ liệu trả về (document, invoice, work order, training request,...). Các API được sử dụng. UpdateDocument/UpdateInvoice -- API cập nhật trạng thái chứng từ về hệ thống nguồn (ERP/HRM/eOffice/CMMS). Các API đặc thù khác (nếu có), phải ghi rõ tên và chức năng. Cập nhật trạng thái dữ liệu: Cần thể hiện rõ trạng thái chuyển đổi trước và sau phê duyệt (Pending, Approved, Rejected, Completed,...). Vai trò xử lý: Làm rõ bước nào do người dùng thực hiện trên hệ thống, bước nào do hệ thống tự động đồng bộ qua ESB.

Dưới đây là mẫu sơ đồ số hoá quy trình liên phòng ban theo yêu cầu: mô tả đầy đủ luồng nghiệp vụ, vai trò tham gia, mapping từng bước với phần mềm trong hệ sinh thái (ERP, eOffice, CMMS, Data Platform...)

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image66.jpg){width="6.873966535433071in" height="3.75in"}

1 . **Kiến trúc tổng thể tích hợp**

2\. **Kịch bản 1: Phê duyệt chứng từ (Document/Invoice)**

3\. **Kịch bản 2: Work Order bảo trì**

4\. **Kịch bản 3: Yêu cầu đào tạo (Training Request)**

5\. **Danh sách API tích hợp chính**

6\. **Trạng thái chuyển đổi**

**7. Nguyên tắc tích hợp bắt buộc**

Nhà cung cấp cam kết cung cấp sơ đồ kỹ thuật tích hợp chi tiết thể hiện đầy đủ:

- Kiến trúc liên thông giữa ERP, eOffice, HRM, CMMS thông qua ESB

- Luồng dữ liệu hai chiều (dữ liệu đi và dữ liệu về) cho từng kịch bản

- Danh sách API chuẩn bao gồm UpdateDocument/UpdateInvoice và các API đặc thù

- Trạng thái chuyển đổi rõ ràng (Pending → Approved/Rejected → Completed)

- Phân định vai trò: bước User thao tác và bước System tự động qua ESB

Sơ đồ được thiết kế theo chuẩn RESTful API, hỗ trợ retry/reprocess, correlation ID, và versioning, đảm bảo tính minh bạch, kiểm soát và khả năng mở rộng cho hệ sinh thái tích hợp của PTS