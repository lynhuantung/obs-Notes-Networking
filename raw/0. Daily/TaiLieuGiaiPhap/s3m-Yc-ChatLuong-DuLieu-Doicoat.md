---
tags: [tailieu-giaiphap, ky-thuat-tich-hop, data-quality, reconciliation]
date: 2026-04-30
section: "§3.11 Chất lượng dữ liệu"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Chi tiết: [[07-KiemThu-VanHanh-SchemaChange]]
**Tiếp theo:** [[s3n-Yc-VanHanh-TichHop]]

## Yêu cầu chất lượng dữ liệu & đối soát nghiệm thu

> 3.11.1 Nhà cung cấp phải thống nhất và cung cấp bộ quy tắc Data Quality tối thiểu cho dữ liệu tích hợp (null/format/uniqueness/foreign key/code list...), kèm ngưỡng chấp nhận.

Nhà cung cấp cam kết phối hợp với PTSC và đơn vị Data Platform để thống nhất và cung cấp bộ quy tắc Data Quality áp dụng cho toàn bộ dữ liệu tích hợp giữa hệ thống VnResource và các nền tảng liên quan, bảo đảm chất lượng dữ liệu đầu vào/đầu ra đáp ứng yêu cầu vận hành thực tế.

Bộ quy tắc Data Quality tối thiểu được VnResource cam kết xây dựng và cung cấp bao gồm các nhóm kiểm soát chính như sau:

1\. Kiểm soát giá trị rỗng (Null Check)\
Xác định rõ danh sách các trường dữ liệu bắt buộc không được phép để trống trong từng luồng tích hợp. Ngưỡng chấp nhận được thống nhất theo từng đối tượng dữ liệu, thông thường ở mức 0% null đối với các trường định danh và trường nghiệp vụ quan trọng.

2\. Kiểm soát định dạng (Format Validation)\
Dữ liệu trao đổi qua các API/interface tích hợp phải tuân thủ định dạng được quy định, bao gồm: định dạng ngày tháng, số điện thoại, mã số, chuỗi ký tự, kiểu dữ liệu số, v.v. Ngưỡng chấp nhận: tỷ lệ sai định dạng không vượt quá ngưỡng được thống nhất (thông thường dưới 0,1% trên tổng bản ghi trong một chu kỳ đồng bộ).

3\. Kiểm soát tính duy nhất (Uniqueness)\
Các trường đóng vai trò định danh (ID, mã nhân viên, mã hợp đồng, v.v.) phải bảo đảm tính duy nhất trong phạm vi tập dữ liệu tích hợp. Ngưỡng chấp nhận: 0% trùng lặp đối với các khóa định danh chính.

4\. Kiểm soát khóa ngoại (Foreign Key Integrity)\
Dữ liệu tham chiếu đến các đối tượng liên quan (phòng ban, chức danh, dự án, v.v.) phải tồn tại và hợp lệ trong hệ thống đích. Ngưỡng chấp nhận: tỷ lệ vi phạm tham chiếu không vượt quá mức được thống nhất, thông thường ở mức 0% đối với các quan hệ nghiệp vụ bắt buộc.

5\. Kiểm soát danh mục mã (Code List / Reference Data)\
Các giá trị thuộc danh mục mã (loại hợp đồng, trạng thái, phân loại, v.v.) phải nằm trong tập giá trị hợp lệ được thống nhất giữa hai hệ thống. Ngưỡng chấp nhận: 0% giá trị ngoài danh mục đối với các trường có ràng buộc danh mục bắt buộc.

Bộ quy tắc Data Quality nêu trên sẽ được lập thành tài liệu chính thức, bao gồm mô tả quy tắc, phạm vi áp dụng, ngưỡng chấp nhận và cơ chế xử lý ngoại lệ, và được thống nhất với PTSC/đơn vị Data Platform trước khi đưa vào vận hành tích hợp. Trong quá trình vận hành, VnResource hỗ trợ cơ chế ghi nhận, báo cáo và cảnh báo khi dữ liệu vi phạm các quy tắc đã thống nhất, nhằm bảo đảm chất lượng dữ liệu được duy trì liên tục và có thể kiểm soát theo từng chu kỳ đồng bộ

3.11.2 Phải có cơ chế tách riêng bản ghi lỗi (quarantine/holding) và cung cấp danh sách lỗi để xử lý/đồng bộ lại.

Phần mềm (VnResource) cam kết cung cấp cơ chế tách riêng và quản lý bản ghi lỗi (quarantine/holding) trong quá trình tích hợp, nhằm bảo đảm dữ liệu lỗi được kiểm soát độc lập, không ảnh hưởng đến luồng xử lý chung và hỗ trợ PTSC/Data Platform xử lý, khắc phục và đồng bộ lại một cách chủ động.

Giải pháp được thiết kế với khả năng phân luồng dữ liệu lỗi ngay tại các điểm kiểm soát (validation, mapping, xử lý nghiệp vụ), theo đó các bản ghi không đạt yêu cầu sẽ được tự động chuyển vào vùng lưu trữ riêng biệt (quarantine/holding area) thay vì làm gián đoạn toàn bộ luồng tích hợp. Cơ chế này giúp bảo đảm các dữ liệu hợp lệ vẫn được xử lý bình thường, đồng thời cô lập và quản lý tập dữ liệu lỗi một cách rõ ràng, có kiểm soát.

Hệ thống cung cấp danh sách bản ghi lỗi chi tiết, cho phép tra cứu và theo dõi theo nhiều tiêu chí như: thời gian phát sinh, loại lỗi (data quality, format, nghiệp vụ, hệ thống), nguồn dữ liệu, interface/API liên quan hoặc correlation ID. Thông tin lỗi được ghi nhận đầy đủ, bao gồm mô tả lỗi, nguyên nhân, trạng thái xử lý và lịch sử thao tác, giúp đội vận hành nhanh chóng xác định và xử lý nguyên nhân gốc.

Bên cạnh đó, giải pháp hỗ trợ các chức năng phục hồi dữ liệu như:

- Xử lý lại (reprocess) có chọn lọc đối với từng bản ghi hoặc theo lô dữ liệu lỗi sau khi đã được hiệu chỉnh

- Retry tích hợp đối với các lỗi tạm thời mà không làm phát sinh trùng lặp dữ liệu

- Cập nhật trạng thái xử lý (pending, fixed, reprocessed, failed...) nhằm kiểm soát vòng đời của từng bản ghi lỗi

Toàn bộ cơ chế quarantine/holding và xử lý lỗi được triển khai phù hợp với các yêu cầu về phân quyền truy cập, bảo mật dữ liệu và kiểm soát vận hành, đồng thời được cấu hình linh hoạt để PTSC/Data Platform có thể chủ động khai thác, giám sát và điều chỉnh theo nhu cầu thực tế.

Với cách tiếp cận này, phần mềm VnResource bảo đảm tính ổn định của luồng tích hợp, khả năng kiểm soát dữ liệu lỗi và hỗ trợ xử lý/đồng bộ lại hiệu quả, góp phần nâng cao chất lượng dữ liệu và hiệu quả vận hành tổng thể của hệ thống

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image48.jpg){width="6.873966535433071in" height="3.75in"}