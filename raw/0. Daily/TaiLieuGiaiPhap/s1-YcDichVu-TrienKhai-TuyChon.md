---
tags: [tailieu-giaiphap, trien-khai, tich-hop]
date: 2026-04-30
section: "§2.1 Phạm vi dịch vụ"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Parent: [[Dịch vụ triển khai tích hợp]]
**Tiếp theo:** [[Yêu cầu về tài liệu thiết kế tích hợp và phân hệ báo cáo trên Phần mềm]]

## Yêu cầu Dịch vụ triển khai tích hợp (Tuỳ chọn - Triển khai khi có yêu cầu)

> 2.1.1 Dịch vụ tích hợp, đồng bộ và thu thập dữ liệu dùng chung và dữ liệu phục vụ phân tích -- báo cáo trên Nền tảng dữ liệu (Data Platform): Số lượng tạm tính: 30 dataset/cấu trúc bảng dữ liệu/biểu mẫu dữ liệu phục vụ thu thập về Data Platform (báo cáo/BI/AI). Đơn giá cho 01 cấu trúc bảng dữ liệu hoặc biểu mẫu pdf phát sinh tăng/giảm (so với số lượng tạm tính 30 nêu trên).
>
> Nhà  cam kết cung cấp **dịch vụ tích hợp, đồng bộ và thu thập dữ liệu dùng chung và dữ liệu phục vụ phân tích -- báo cáo trên Nền tảng dữ liệu (Data Platform)** theo yêu cầu của Hồ sơ mời , với khối lượng tạm tính **30 dataset / cấu trúc bảng dữ liệu / biểu mẫu dữ liệu** phục vụ thu thập dữ liệu cho mục đích báo cáo, BI và AI.

Phạm vi triển khai cho mỗi dataset / cấu trúc bảng dữ liệu / biểu mẫu dữ liệu bao gồm:

1.  Khảo sát và phân tích nguồn dữ liệu từ các hệ thống nghiệp vụ liên quan

2.  Thiết kế mô hình dữ liệu tích hợp phù hợp với kiến trúc Data Platform

3.  Xây dựng mapping dữ liệu giữa hệ thống nguồn và Data Platform

4.  Xây dựng cơ chế tích hợp dữ liệu (API / ETL / batch / streaming tùy theo đặc thù nguồn dữ liệu)

5.  Chuẩn hóa dữ liệu theo mô hình dữ liệu dùng chung và quy định quản trị dữ liệu

6.  Thiết lập cơ chế kiểm tra chất lượng dữ liệu trước khi nạp vào Data Platform

7.  Kiểm thử kỹ thuật và kiểm thử tích hợp

8.  Hỗ trợ kiểm thử nghiệm thu với các hệ thống báo cáo/BI/AI liên quan

9.  Xây dựng tài liệu kỹ thuật phục vụ vận hành, khai thác và mở rộng

Dịch vụ tích hợp đảm bảo:

- Đồng bộ dữ liệu đầy đủ, chính xác, nhất quán giữa hệ thống nguồn và Data Platform

- Hỗ trợ nhiều phương thức tích hợp: realtime, near-realtime hoặc batch theo yêu cầu

- Đảm bảo khả năng mở rộng khi bổ sung dataset mới trong tương lai

- Tuân thủ các tiêu chuẩn quản trị dữ liệu, an toàn thông tin và phân quyền truy cập dữ liệu

- Đáp ứng yêu cầu phục vụ khai thác dữ liệu cho báo cáo quản trị, BI và các mô hình phân tích AI

Nhà  cam kết triển khai đầy đủ **30 dataset / cấu trúc bảng dữ liệu / biểu mẫu dữ liệu** theo yêu cầu của Chủ đầu tư trong phạm vi gói  và kế hoạch triển khai thống nhất giữa các bên.

> 2.1.2 Dịch vụ tích hợp Phần mềm với các phần mềm khác (Trong trường hợp Phần mềm cần gửi/nhận dữ liệu từ các phần mềm khác): Số lượng tạm tính: 30 interface tích hợp (API/ESB flow/file/queue) giữa Phần mềm và 01 phần mềm khác. Đơn giá cho 01 cấu trúc bảng dữ liệu hoặc biểu mẫu pdf phát sinh tăng/giảm (so với số lượng tạm tính 30 nêu trên).
>
> Nhà cung cấp cam kết triển khai tối thiểu 30 interface tích hợp giữa Phần mềm và các hệ thống liên quan của PTSC thông qua các cơ chế tích hợp chuẩn như REST API, ESB integration flow, message queue và file-based integration theo kiến trúc tích hợp tổng thể của PTSC. Mỗi interface bao gồm thiết kế mapping dữ liệu, phát triển luồng tích hợp, kiểm thử SIT/UAT và bàn giao tài liệu đặc tả kỹ thuật interface. Trong trường hợp phát sinh tăng/giảm số lượng interface so với phạm vi tạm tính, đơn giá cho mỗi interface bổ sung được áp dụng theo nguyên tắc tính theo 01 cấu trúc bảng dữ liệu tích hợp hoặc 01 biểu mẫu PDF structured dataset tương ứng với mức độ thay đổi mapping dữ liệu và logic tích hợp, theo quy trình quản lý thay đổi được thống nhất giữa hai bên trong quá trình triển khai dự án.
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image61.png){width="6.873966535433071in" height="3.75in"}
>
> 2.1.3 Yêu Cầu Quản Trị Master Data Nhân Sự Và Đồng Bộ RBAC
>
> Nhà cung cấp cam kết thiết kế HRM là hệ thống quản trị dữ liệu nhân sự tập trung (Master Data) và bảo đảm: Mọi thay đổi về chức danh, vị trí, đơn vị, nhân sự mới, nghỉ việc, tạm ngừng được phát sinh sự kiện và đồng bộ thông qua trục tích hợp ESB. Tự động cập nhật thông tin về hệ thống SSO phục vụ cơ chế phân quyền RBAC trên toàn bộ hệ sinh thái phần mềm của PTSC. Không yêu cầu chỉnh sửa cơ sở dữ liệu hoặc mã nguồn của các hệ thống hiện hữu. Có cơ chế ghi nhận và truy vết toàn bộ lịch sử thay đổi dữ liệu (Audit Trail). Bảo đảm tính toàn vẹn, đồng nhất và kiểm soát dữ liệu nhân sự trên toàn hệ thống.
>
> Hệ thống HRM được thiết kế theo mô hình HR Master Data Hub tích hợp ESB và SSO theo kiến trúc event-driven và loosely-coupled integration architecture, cho phép PTSC triển khai cơ chế RBAC tập trung trên toàn hệ sinh thái ứng dụng mà không cần thay đổi các hệ thống hiện hữu, đồng thời bảo đảm khả năng mở rộng tích hợp trong tương lai.
>
> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image62.png){width="6.873966535433071in" height="3.75in"}

2.1.4 Yêu Cầu Tích Hợp Master Data Management Trên Data Platform

Nhà cung cấp cam kết phối hợp với PTSC thiết kế cơ chế quản trị và đồng bộ mã định danh nhân sự trên Nền tảng dữ liệu (Data Platform), bảo đảm: Mapping mã ID nhân sự giữa HRM, ERP, E-learning và các phần mềm đơn vị. Duy trì một mã định danh chuẩn dùng chung xuyên suốt hệ sinh thái. Không thay đổi cấu trúc cơ sở dữ liệu của các hệ thống hiện hữu. Có cơ chế xử lý xung đột, trùng lặp và sai lệch dữ liệu. Đồng bộ hai chiều có kiểm soát thông qua ESB và kiến trúc Hybrid Data Platform của PTSC.

Nhà cung cấp đề xuất mô hình quản trị định danh nhân sự theo kiến trúc Master Data Management trên Data Platform, trong đó HRM đóng vai trò System of Record, Data Platform duy trì Golden Employee ID dùng chung toàn hệ sinh thái. Việc mapping mã định danh giữa HRM, ERP, E-learning và các hệ thống khác được thực hiện thông qua lớp Identity Mapping Service tích hợp qua ESB theo mô hình event-driven. Giải pháp bảo đảm không thay đổi cấu trúc cơ sở dữ liệu các hệ thống hiện hữu, hỗ trợ cơ chế phát hiện trùng lặp, xử lý xung đột dữ liệu, đồng bộ hai chiều có kiểm soát và phù hợp kiến trúc Hybrid Data Platform của PTSC.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image56.png){width="6.873966535433071in" height="4.583333333333333in"}

2.1.5 Yêu Cầu Tích Hợp HRM Với E-learning

Nhà cung cấp cam kết thiết kế và triển khai tích hợp hai chiều giữa HRM và hệ thống E-learning thông qua trục tích hợp ESB, bảo đảm: Đồng bộ danh sách nhân sự, đơn vị, chức danh từ HRM sang E-learning. Đồng bộ kế hoạch đào tạo bắt buộc theo vị trí. Đồng bộ kết quả hoàn thành khóa học, điểm đánh giá và số giờ đào tạo từ E-learning về HRM. Cập nhật trạng thái và thời hạn hiệu lực chứng chỉ. Kiến trúc tích hợp bảo đảm khả năng thay thế hệ thống E-learning trong tương lai mà không phải tái thiết kế HRM.

[Nhà cung cấp cam kết phối hợp cùng PTSC thiết kế và triển khai tích hợp hai chiều (bi-directional integration) giữa HRM và hệ thống E-learning thông qua trục tích hợp ESB, bảo đảm đồng bộ dữ liệu đầy đủ, an toàn, có kiểm soát, phục vụ quản trị nhân sự và quản lý đào tạo tập trung.]{.mark}

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image46.png){width="6.873966535433071in" height="3.75in"}

[2.1.6 Yêu Cầu Tích Hợp HRM Với ERP (Chi Phí Nhân Sự Và Ngân Sách)]{.mark}

[Nhà cung cấp cam kết thiết kế và triển khai tích hợp giữa HRM và ERP thông qua trục tích hợp ESB, bảo đảm: Đồng bộ dữ liệu chi phí nhân sự từ HRM sang ERP. Đồng bộ quỹ lương, phụ cấp và chi phí đào tạo. Phân bổ chi phí nhân sự theo dự án/hợp đồng. Đồng bộ trạng thái phê duyệt ngân sách. Không thực hiện kết nối trực tiếp với SAP/ERP mà bắt buộc thông qua ESB.]{.mark}

[Nhà cung cấp cam kết thiết kế và triển khai tích hợp giữa HRM và ERP thông qua trục tích hợp ESB, bảo đảm việc đồng bộ dữ liệu chi phí nhân sự và ngân sách được thực hiện tập trung, an toàn, có kiểm soát và không kết nối trực tiếp với hệ thống ERP/SAP.]{.mark}

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image18.png){width="6.873966535433071in" height="3.75in"}

2.1.7 Yêu Cầu Tích Hợp Với Các Phần Mềm Khác Thông Qua ESB

Nhà cung cấp cam kết có khả năng tích hợp HRM với bất kỳ phần mềm nào khác trong hệ sinh thái CNTT của PTSC khi được yêu cầu, thông qua trục tích hợp ESB, bảo đảm: Tuân thủ chuẩn giao thức và định dạng dữ liệu do PTSC quy định. Không kết nối trực tiếp giữa các hệ thống. Có cơ chế logging, monitoring và xử lý lỗi tập trung. Bảo đảm an toàn thông tin và phân quyền truy cập. Sẵn sàng mở rộng tích hợp trong tương lai theo nhu cầu phát triển của PTSC.

Phần mềm (VnResource HRM) cam kết có đầy đủ năng lực tích hợp HRM với các phần mềm khác trong hệ sinh thái CNTT của PTSC khi có yêu cầu, thông qua trục tích hợp ESB, bảo đảm mô hình liên thông tập trung, an toàn, có kiểm soát và dễ mở rộng.

- **Kiến trúc tích hợp bắt buộc qua ESB (không kết nối trực tiếp)**

VnResource cam kết triển khai theo nguyên tắc:

Tất cả kết nối giữa HRM và các hệ thống khác đều đi theo mô hình HRM ↔ ESB ↔ Hệ thống đích.

Không triển khai kết nối trực tiếp point-to-point giữa các hệ thống nhằm tránh phụ thuộc chặt, khó quản trị và khó mở rộng.

ESB đảm nhiệm vai trò điều phối (orchestration), định tuyến (routing), chuyển đổi dữ liệu (mapping/transform), kiểm soát giao dịch và quản trị tích hợp tập trung.

- **Tuân thủ chuẩn giao thức và định dạng dữ liệu do PTSC quy định**

VnResource cam kết tuân thủ đầy đủ các chuẩn tích hợp do PTSC ban hành, bao gồm tối thiểu:

Giao thức kết nối: REST/HTTPS, SOAP (nếu hệ thống đích yêu cầu), messaging (Kafka/RabbitMQ hoặc tương đương), file-based (SFTP/FTPS) theo quy định PTSC.

Định dạng dữ liệu: JSON, XML, CSV, hoặc schema chuẩn/canonical model do PTSC thống nhất.

- **Logging, Monitoring và xử lý lỗi tập trung trên lớp ESB**

Giải pháp cam kết cung cấp cơ chế vận hành tập trung phục vụ giám sát và xử lý sự cố tích hợp, bao gồm:

Logging tập trung theo từng giao dịch, có gắn correlation id để truy vết end-to-end.

Monitoring và cảnh báo theo ngưỡng thống nhất, tối thiểu gồm:

Số lượng giao dịch

Tỷ lệ lỗi

Số lần retry

Độ trễ đồng bộ (lag/latency)

Xử lý lỗi tập trung:

Retry theo chính sách (cấu hình được)

Reprocess có kiểm soát

Tách bản ghi lỗi vào vùng quarantine/holding và cung cấp danh sách lỗi để xử lý đồng bộ lại

- **An toàn thông tin và phân quyền truy cập**

VnResource cam kết bảo đảm yêu cầu an toàn thông tin và kiểm soát truy cập trong toàn bộ hoạt động tích hợp, bao gồm:

Xác thực và phân quyền theo chuẩn PTSC (SSO/LDAP/RBAC trong phạm vi được cấp).

Mã hóa đường truyền (TLS/HTTPS) và cơ chế bảo mật API (OAuth2/OIDC, API Key, mTLS hoặc theo tiêu chuẩn PTSC).

Phân tách quyền theo vai trò (RBAC), giới hạn quyền theo hệ thống, theo API/flow và theo môi trường (DEV/UAT/PROD).

Audit trail đối với các thao tác quản trị tích hợp và các thay đổi cấu hình liên quan.

- **Sẵn sàng mở rộng tích hợp trong tương lai**

Giải pháp được thiết kế theo hướng mở, linh hoạt và dễ mở rộng, bảo đảm khi PTSC phát sinh nhu cầu tích hợp thêm hệ thống mới:

Chỉ cần phát triển/bổ sung adapter/connector tại ESB và cấu hình mapping tương ứng.

Hạn chế tối đa việc thay đổi lõi HRM, giảm rủi ro ảnh hưởng vận hành.

Cho phép mở rộng số lượng interface/flow theo từng giai đoạn, phù hợp kiến trúc và năng lực hạ tầng thực tế của PTSC.