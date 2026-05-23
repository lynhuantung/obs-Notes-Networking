---
tags: [tailieu-giaiphap, trich-hop, thiet-ke]
date: 2026-04-30
section: "§2.2 Yêu cầu tài liệu"
---

← [[raw/0. Daily/TaiLieuGiaiPhap/00-Index]] | Parent: [[Tài liệu thiết kế tích hợp và phân hệ báo cáo trên Phần mềm]]
**Chi tiết:** [[02-TaiLieu-ThietKe-TichHop]]

## Yêu cầu về tài liệu thiết kế tích hợp và phân hệ báo cáo trên Phần mềm

> **2.2.1 Yêu cầu về tài liệu thiết kế tích hợp**
>
> 2.2.1.1 Sơ đồ số hoá quy trình (Business/ Process Blueprint)
>
> Sau giai đoạn Khảo sát -- Thiết kế, NCC cam kết lập Bộ Sơ đồ số hoá quy trình cho các quy trình có tích hợp trong quá trình triển khai dự án, làm cơ sở cho việc triển khai kỹ thuật, thể hiện:
>
> Đầy đủ luồng nghiệp vụ từ khởi tạo → kiểm tra → phê duyệt & ký số → cập nhật trạng thái → lưu trữ; các vai trò tham gia (đơn vị đề xuất, bộ phận kiểm tra, lãnh đạo phê duyệt, kế toán, nhân sự vận hành,...);
>
> Mapping từng bước với phần mềm thực hiện (nếu có) bao gồm: phần mềm ERP, eOffice, CMMS,...);
>
> Các điểm kiểm soát/ra quyết định (Yes/No, Pending, Approved, Rejected,...) và các luồng xử lý ngoại lệ (Exception Flow).

Phần mềm (VnResource) cam kết sau giai đoạn Khảo sát -- Thiết kế, sẽ lập đầy đủ Bộ Sơ đồ số hoá quy trình (Business/Process Blueprint) cho toàn bộ các quy trình có tích hợp trong phạm vi dự án, làm cơ sở chính thức cho việc triển khai kỹ thuật và bàn giao vận hành.

Bộ sơ đồ được xây dựng theo chuẩn mô tả quy trình nghiệp vụ, thể hiện đầy đủ các nội dung sau:

**1. Luồng nghiệp vụ đầy đủ (End-to-End Business Flow)**

Mỗi sơ đồ mô tả toàn bộ luồng xử lý từ bước khởi tạo đến lưu trữ, bao gồm tuần tự các bước: khởi tạo yêu cầu → kiểm tra hồ sơ/điều kiện → phê duyệt và ký số → cập nhật trạng thái → lưu trữ hồ sơ. Các bước được thể hiện rõ ràng theo trình tự logic, bảo đảm người đọc có thể nắm bắt toàn bộ quy trình mà không cần tài liệu bổ sung.

**2. Vai trò tham gia (Swimlane/Role Mapping)**

Sơ đồ thể hiện rõ từng bước do vai trò nào thực hiện, tối thiểu bao gồm: đơn vị đề xuất, bộ phận kiểm tra, lãnh đạo phê duyệt, kế toán/tài chính, nhân sự vận hành và các bộ phận chuyên môn liên quan (HSE, pháp chế, IT...) tuỳ theo đặc thù từng quy trình. Cách trình bày theo mô hình swimlane giúp phân định trách nhiệm rõ ràng giữa các bên tham gia.

**3. Mapping từng bước với phần mềm thực hiện**

Mỗi bước trong luồng nghiệp vụ được ánh xạ cụ thể với hệ thống phần mềm thực hiện, bao gồm: ERP (chứng từ, ngân sách, hạch toán), eOffice (luân chuyển, phê duyệt, ký số, lưu trữ), CMMS (lệnh bảo trì, nghiệm thu), HRM (nhân sự, đào tạo) hoặc các hệ thống khác trong hệ sinh thái PTSC. Các bước do hệ thống tự động xử lý qua ESB được phân biệt rõ với các bước do người dùng thao tác trực tiếp.

**4. Điểm kiểm soát và ra quyết định (Decision Points)**

Sơ đồ thể hiện đầy đủ các điểm kiểm soát (Yes/No gate) và trạng thái xử lý tại từng bước, bao gồm tối thiểu: Pending (chờ xử lý), Approved (đã phê duyệt), Rejected (từ chối), Returned (trả về bổ sung), Completed (hoàn tất), Archived (đã lưu trữ). Các điểm ra quyết định được thể hiện bằng ký hiệu chuẩn (diamond/gateway) để dễ nhận diện trong quá trình triển khai và kiểm thử.

**5. Luồng xử lý ngoại lệ (Exception Flow)**

Ngoài luồng chính (happy path), sơ đồ mô tả đầy đủ các luồng ngoại lệ phổ biến, bao gồm: hồ sơ không hợp lệ (trả về bổ sung), từ chối phê duyệt, quá hạn SLA, lỗi hệ thống hoặc tích hợp, huỷ yêu cầu. Mỗi luồng ngoại lệ thể hiện rõ hành động tiếp theo, vai trò chịu trách nhiệm xử lý và trạng thái kết thúc tương ứng.

Bộ Sơ đồ số hoá quy trình được lập thành tài liệu chính thức, được review và xác nhận với PTSC trước khi bước vào giai đoạn triển khai kỹ thuật, và được cập nhật theo thực tế nếu có điều chỉnh trong quá trình triển khai. Đây là cơ sở để kiểm thử nghiệm thu (UAT), đào tạo người dùng và bàn giao vận hành sau dự án.

> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image71.png){width="6.873966535433071in" height="3.75in"}
>
> 2.2.1.2

Nhà cung cấp cam kết sau giai đoạn Khảo sát -- Thiết kế sẽ xây dựng đầy đủ Bộ Thiết kế Kỹ thuật Tích hợp (Integration Technical Design Package) cho toàn bộ các interface tích hợp giữa hệ thống HRM và các hệ thống liên quan thông qua trục tích hợp ESB. Bộ tài liệu bao gồm sơ đồ luồng tích hợp (Integration Flow), sơ đồ dòng dữ liệu (Data Flow Diagram), danh mục và đặc tả chi tiết các API/dịch vụ tích hợp (tên dịch vụ, mục đích, phương thức, URL, payload, giao thức), tài liệu data contract và data mapping giữa các hệ thống, cơ chế cập nhật trạng thái dữ liệu liên hệ thống (Pending, Approved, Rejected, Completed,...), quy tắc xử lý lỗi và cơ chế retry. Đồng thời tài liệu phân tách rõ các bước xử lý do người dùng thao tác và các bước đồng bộ tự động thông qua ESB, làm cơ sở cho triển khai kỹ thuật, kiểm thử tích hợp, vận hành và mở rộng hệ thống trong tương lai.

Sau giai đoạn Khảo sát -- Thiết kế, Nhà cung cấp (NCC) cam kết xây dựng và bàn giao Bộ Thiết kế Kỹ thuật Tích hợp trong quá trình triển khai dự án, đảm bảo đầy đủ cơ sở kỹ thuật cho việc phát triển, kiểm thử, triển khai và vận hành tích hợp. Bộ tài liệu bao gồm tối thiểu các nội dung sau:

**1. Sơ đồ luồng tích hợp và sơ đồ dòng dữ liệu**

NCC sẽ xây dựng các sơ đồ thể hiện tổng quan và chi tiết tích hợp giữa các hệ thống, bao gồm:

Sơ đồ luồng tích hợp (Integration Flow): mô tả các điểm tích hợp và chuỗi bước xử lý giữa phần mềm nguồn/đích, ESB/middleware (nếu có), và các thành phần liên quan.

Sơ đồ dòng dữ liệu (Data Flow Diagram - DFD): mô tả dữ liệu trao đổi đi/về, định tuyến dữ liệu, kiểm soát dữ liệu qua các tầng.

Các sơ đồ sẽ thể hiện rõ:

Hệ thống nguồn/đích và vai trò từng hệ thống.

Luồng dữ liệu đi-về đối với từng nghiệp vụ: ví dụ document, invoice, work order, training request, ...

Điểm phát sinh dữ liệu, điểm tiếp nhận và các bước xử lý trung gian (validate, transform, enrich, persist, notify...).

Cơ chế đồng bộ: real-time / near real-time / batch (nếu có).

Luồng phản hồi kết quả: ack/nack, trả trạng thái, trả lỗi.

**2. Danh mục và đặc tả chi tiết API/Dịch vụ, data contract và mapping**

NCC sẽ lập Danh mục tích hợp (Integration Catalogue) và đặc tả kỹ thuật chi tiết cho toàn bộ API/dịch vụ liên quan, gồm tối thiểu:

2.1 Danh mục & đặc tả API/Dịch vụ

Mỗi API/dịch vụ sẽ được mô tả rõ:

Tên API/Dịch vụ

Mục đích

Phương thức (GET/POST/PUT/PATCH/DELETE...)

URL/Endpoint

Payload (request/response), ví dụ JSON/XML

Protocol: REST/SOAP/gRPC/SFTP/Message Queue...

Authentication/Authorization: API key, OAuth2, JWT, mTLS, IP whitelist... (theo yêu cầu dự án)

Yêu cầu header, mã hóa, chữ ký (nếu có)

Mã lỗi và thông điệp lỗi chuẩn hóa (error code, error message)

2.2 Data contract

NCC sẽ xây dựng hợp đồng dữ liệu (data contract) thống nhất giữa hệ thống nguồn/đích, gồm:

Định nghĩa schema của dữ liệu trao đổi: kiểu dữ liệu, độ dài, format ngày giờ, ràng buộc bắt buộc/không bắt buộc.

Quy ước chuẩn hóa: encoding UTF-8, timezone, định dạng số tiền, mã đơn vị, mã trạng thái...

2.3 Data mapping

NCC sẽ xây dựng bảng mapping dữ liệu cho từng nghiệp vụ, thể hiện:

Trường dữ liệu nguồn → đích

Quy tắc transform: format, lookup, convert đơn vị, default value, validate rule

Quy tắc xử lý trường hợp thiếu dữ liệu hoặc dữ liệu không hợp lệ

2.4 Cơ chế cập nhật trạng thái dữ liệu

NCC sẽ thiết kế cơ chế cập nhật trạng thái (status tracking) cho từng đối tượng dữ liệu (document/invoice/work order...), tối thiểu gồm:

Trạng thái chuẩn: Pending, Approved, Rejected, Completed (và các trạng thái kỹ thuật nếu cần như Sent, Received, Failed, Retrying...)

Nguồn cập nhật trạng thái: do hệ thống nguồn, hệ thống đích, hay ESB cập nhật

Cơ chế đồng bộ trạng thái: callback/webhook/polling/queue

Log/audit trail phục vụ đối soát, truy vết

**3. Quy tắc xử lý lỗi, retry và phân tách thao tác người dùng vs tự động qua ESB**

NCC sẽ xây dựng quy tắc xử lý lỗi và vận hành tích hợp, đảm bảo tính ổn định và khả năng phục hồi:

3.1 Quy tắc xử lý lỗi

Phân loại lỗi:

Lỗi nghiệp vụ (validate fail, thiếu dữ liệu, sai trạng thái...)

Lỗi kỹ thuật (timeout, network, auth fail, 5xx, queue down...)

Quy chuẩn phản hồi lỗi: mã lỗi, thông điệp, trace id/correlation id.

Cơ chế lưu lỗi phục vụ đối soát: log tập trung, lưu payload lỗi (theo chính sách bảo mật dữ liệu).

3.2 Quy tắc retry

Áp dụng retry cho lỗi kỹ thuật có khả năng phục hồi.

Quy định số lần retry, backoff (linear/exponential), và ngưỡng timeout.

Cơ chế chống gửi trùng: idempotency key, message deduplication, kiểm soát version.

Cơ chế chuyển trạng thái khi retry thất bại: Failed, Manual Review, Dead Letter Queue (nếu dùng queue).

3.3 Phân tách rõ bước thao tác người dùng và bước tự động

NCC sẽ mô tả rõ trong từng luồng:

Bước do người dùng thao tác: tạo yêu cầu, phê duyệt, chỉnh sửa, hủy, xác nhận...

Bước hệ thống tự động đồng bộ qua ESB: đẩy dữ liệu, nhận phản hồi, cập nhật trạng thái, đồng bộ danh mục, đối soát...

Điểm kiểm soát: điều kiện cho phép đồng bộ (ví dụ chỉ đồng bộ khi Approved), điều kiện dừng, điều kiện cần can thiệp thủ công.

> **2.2.2 Yêu cầu chung về khảo sát và thiết kế phân hệ báo cáo trên Phần mềm**
>
> 2.2.2.1 Khả năng tuỳ chỉnh báo cáo/trường dữ liệu/chỉ tiêu đã thiết lập trên Phần mềm:

Phần mềm cho phép PTSC tùy chỉnh cấu trúc báo cáo, trường dữ liệu, công thức/chỉ tiêu và mở rộng nhu cầu báo cáo trong tương lai thông qua cấu hình (không yêu cầu can thiệp mã nguồn theo từng thay đổi nhỏ), đảm bảo vận hành ổn định.

> Phần mềm cho phép PTSC chủ động tùy chỉnh cấu trúc báo cáo, bổ sung trường dữ liệu, thiết lập công thức tính toán và các chỉ tiêu quản trị thông qua cơ chế cấu hình linh hoạt (configuration-driven) mà không yêu cầu can thiệp mã nguồn đối với các thay đổi nghiệp vụ thông thường. Hệ thống hỗ trợ thiết kế báo cáo động (ad-hoc reporting), mở rộng trường dữ liệu nghiệp vụ, thiết lập dashboard và KPI theo nhu cầu quản trị, đồng thời bảo đảm các thay đổi cấu hình không ảnh hưởng đến hệ thống lõi, các chức năng tích hợp và khả năng nâng cấp trong tương lai. Các trường dữ liệu và báo cáo mở rộng có thể đồng bộ sang Nền tảng dữ liệu (Data Platform) phục vụ nhu cầu phân tích BI/AI theo kiến trúc tích hợp thông qua ESB của PTSC, bảo đảm hệ thống vận hành ổn định, an toàn và đáp ứng nhu cầu mở rộng lâu dài.

- **[Cấu hình báo cáo]{.mark}**

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image20.png){width="6.873966535433071in" height="5.152777777777778in"}

- **Cấu hình trường dữ liệu**

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image39.png){width="6.873966535433071in" height="3.1805555555555554in"}

- **Chỉ tiêu**

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image13.png){width="6.873966535433071in" height="3.2916666666666665in"}

> 2.2.2.2 Tài liệu thống nhất yêu cầu báo cáo và quản trị dữ liệu: Trong giai đoạn Khảo sát -- Thiết kế: NCC cam kết tư vấn và phối hợp với PTSC để thống nhất danh mục báo cáo/chỉ tiêu, cấu trúc dimension, mapping & nguồn dữ liệu và đặc tả kỹ thuật cung cấp dữ liệu/tích hợp trong giai đoạn khảo sát -- thiết kế làm cơ sở triển khai và nghiệm thu. Tài liệu bao gồm tối thiểu: danh mục báo cáo/chỉ tiêu/dimension, mapping nguồn dữ liệu, đặc tả export/API/tích hợp (nếu có).
>
> Trong giai đoạn Khảo sát -- Thiết kế, Nhà cung cấp cam kết phối hợp với PTSC xây dựng Tài liệu thống nhất yêu cầu báo cáo và quản trị dữ liệu làm cơ sở triển khai cấu hình báo cáo, thiết kế dataset phục vụ Nền tảng dữ liệu (Data Platform) và nghiệm thu hệ thống. Tài liệu bao gồm tối thiểu danh mục báo cáo và chỉ tiêu quản trị (KPI catalog), cấu trúc dimension phục vụ phân tích dữ liệu, mapping nguồn dữ liệu giữa các hệ thống HRM, ERP, E-learning và các hệ thống liên quan, cùng với đặc tả kỹ thuật cung cấp dữ liệu thông qua cơ chế export/API/ESB integration. Các nội dung thiết kế bảo đảm tuân thủ kiến trúc Hybrid Data Platform của PTSC, hỗ trợ mở rộng nhu cầu báo cáo BI/AI trong tương lai và không yêu cầu thay đổi cấu trúc cơ sở dữ liệu của các hệ thống hiện hữu.

1\. Cam kết xây dựng tài liệu thống nhất yêu cầu báo cáo và quản trị dữ liệu

Nhà cung cấp cam kết trong giai đoạn Khảo sát -- Thiết kế (Survey & Solution Design Phase) sẽ phối hợp chặt chẽ với PTSC để xây dựng Tài liệu thống nhất yêu cầu báo cáo và quản trị dữ liệu (Reporting & Data Governance Requirement Specification) làm cơ sở cho:

triển khai cấu hình báo cáo

xây dựng dataset phục vụ BI/AI

thiết kế tích hợp Data Platform

kiểm thử nghiệm thu hệ thống

mở rộng báo cáo trong tương lai

Tài liệu được xây dựng theo phương pháp:

Business-driven reporting design

Canonical data mapping via ESB

Dimension-based analytics modeling

Metadata-driven dataset definition

2\. Danh mục báo cáo / chỉ tiêu quản trị (Reporting & KPI Catalog)

Nhà cung cấp phối hợp với PTSC xây dựng danh mục chuẩn:

Bao gồm:

báo cáo vận hành nhân sự

báo cáo chi phí nhân sự

báo cáo đào tạo

báo cáo KPI nhân sự

báo cáo năng lực

báo cáo biến động nhân sự

báo cáo tuyển dụng

báo cáo ngân sách nhân sự

báo cáo phục vụ Data Platform / BI / AI

Mỗi báo cáo được đặc tả:

Thuộc tính Nội dung

Report Name Tên báo cáo

Business Purpose Mục đích

Data Source Nguồn dữ liệu

Update Frequency Chu kỳ cập nhật

Owner Đơn vị phụ trách

Access Role Vai trò truy cập

3\. Danh mục chỉ tiêu quản trị (KPI Definition Catalog)

Bao gồm:

Ví dụ:

Headcount

Turnover Rate

Training Completion Rate

Labor Cost Ratio

Budget Utilization Rate

Project Resource Allocation Ratio

Certificate Validity Compliance Rate

Mỗi KPI được đặc tả:

  -----------------------------------------------------------------------
  Thuộc tính                          Nội dung
  ----------------------------------- -----------------------------------
  KPI Name                            Tên chỉ tiêu

  Business Definition                 Định nghĩa nghiệp vụ

  Calculation Formula                 Công thức tính

  Source Dataset                      Dataset nguồn

  Update Frequency                    Chu kỳ cập nhật
  -----------------------------------------------------------------------

4\. Thiết kế cấu trúc Dimension phục vụ Data Platform

Nhà cung cấp phối hợp PTSC xây dựng mô hình dimension analytics phục vụ báo cáo BI/AI.

Ví dụ các dimension chuẩn:

Employee Dimension

Organization Dimension

Position Dimension

Cost Center Dimension

Project Dimension

Training Dimension

Time Dimension

Contract Dimension

Certificate Dimension

Dimension được thiết kế theo chuẩn:

Star schema ready

Data warehouse compatible

BI tool compatible

AI analytics ready

5\. Mapping nguồn dữ liệu giữa các hệ thống

Nhà cung cấp xây dựng Data Mapping Matrix giữa:

HRM

ERP

E-learning

SSO

CMMS

Data Platform

Ví dụ mapping:

Dataset Source System

Employee Master HRM

Organization Structure HRM

Payroll Cost ERP

Training Result E-learning

Certificate Status LMS / HRM

Access Role SSO

Mapping bao gồm:

source table

source field

target dataset

target attribute

transformation rule

validation rule

Đảm bảo:

canonical data alignment qua ESB

không thay đổi cấu trúc DB hệ thống hiện hữu

6\. Đặc tả dataset phục vụ Data Platform

Nhà cung cấp xây dựng danh mục dataset chuẩn cung cấp cho:

BI dashboard

management reporting

predictive analytics

AI workforce planning

executive cockpit

Ví dụ:

Dataset Description

Employee Snapshot trạng thái nhân sự

Workforce Movement biến động nhân sự

Payroll Cost Dataset chi phí nhân sự

Training Dataset dữ liệu đào tạo

Certificate Dataset dữ liệu chứng chỉ

Mỗi dataset gồm:

dataset structure

data refresh rule

data owner

data quality rule

security classification

7\. Đặc tả kỹ thuật export / API / tích hợp dữ liệu

Nhà cung cấp xây dựng tài liệu đặc tả kỹ thuật cung cấp dữ liệu cho Data Platform.

Bao gồm:

7.1 Export specification

Ví dụ:

CSV

JSON

XML

Parquet

Cấu hình:

schedule export

event-trigger export

on-demand export

7.2 API specification

Bao gồm:

API name

endpoint URL

method (GET/POST)

payload definition

authentication method

response structure

versioning strategy

Ví dụ:

GET /api/v1/hrm/employees

POST /api/v1/hrm/training-results

7.3 ESB integration specification

Bao gồm:

message schema

routing rule

transformation rule

retry policy

monitoring rule

correlation ID tracking

Đảm bảo:

event-driven synchronization

loose coupling architecture

hybrid data platform compatibility

8\. Chuẩn hóa metadata phục vụ quản trị dữ liệu

Nhà cung cấp phối hợp PTSC xây dựng metadata catalog:

Bao gồm:

dataset definition

field definition

business glossary

data lineage

data ownership

data classification

Phục vụ:

data governance

data traceability

data transparency

data quality control

2.2.2.3 Tài liệu ánh xạ (mapping) dữ liệu từ Phần mềm với Master Data dùng chung của PTSC: Trong giai đoạn triển khai kỹ thuật, NCC cam kết xây dựng cơ chế mapping/ đồng bộ giữa các bộ ID nội bộ do Phần mềm tạo ra (ví dụ: OrganizationID, UserID, ProjectID, DocumentID, RiskID, CourseID,...) với Master Data dùng chung của PTSC (nhận/đồng bộ qua ESB và/hoặc Data Platform theo kiến trúc PTSC), đảm bảo dữ liệu phát sinh từ Phần mềm liên kết được với cấu trúc dữ liệu tổng thể, phục vụ tích hợp và phân tích quản trị. Tài liệu bao gồm tối thiểu: Bảng mapping ID (Crosswalk) + quy tắc đồng bộ; đặc tả kỹ thuật đồng bộ ID; kết quả kiểm thử đối soát.

[Nhà  cam kết trong giai đoạn triển khai kỹ thuật, sẽ xây dựng đầy đủ cơ chế mapping/đồng bộ giữa các bộ ID nội bộ do Phần mềm tạo ra với Master Data dùng chung của PTSC (thông qua ESB và/hoặc Data Platform), đảm bảo mọi dữ liệu phát sinh liên kết chặt chẽ với cấu trúc dữ liệu tổng thể, phục vụ tích hợp và phân tích quản trị.]{.mark}

1.  **Phạm vi Ánh xạ ID**

1.1 **Danh mục các bộ ID nội bộ cần mapping**

1.2 **Nguyên tắc chung**

- Mỗi bản ghi trong Phần mềm bắt buộc có liên kết với Master Data PTSC

- Hỗ trợ mapping 1:1 và N:1 tùy theo nghiệp vụ

- Đảm bảo tính duy nhất (Uniqueness) của mỗi cặp mapping

2.  **Bảng Mapping ID (Crosswalk Table) và Quy tắc Đồng bộ**

2.1 **Cấu trúc Bảng Crosswalk**

2.2 **Quy tắc Đồng bộ**

a\) Quy tắc khởi tạo (Initialization):

- Khi Phần mềm tạo bản ghi mới → gọi ESB API để nhận/tạo Master ID tương ứng

- Nếu Master ID đã tồn tại → liên kết trực tiếp

- Nếu Master ID chưa tồn tại → đặt trạng thái PENDING, chờ PTSC phê duyệt

b\) Quy tắc cập nhật (Update):

- Master Data là nguồn chính thức (Source of Truth) cho các trường danh mục dùng chung

- Khi Master Data thay đổi → Phần mềm tự động cập nhật qua ESB event

- Khi Phần mềm thay đổi dữ liệu nghiệp vụ riêng → đẩy thông tin cập nhật lên Data Platform

c\) Quy tắc xử lý xung đột (Conflict Resolution):

d\) Quy tắc vô hiệu hóa (Deactivation):

- Không xóa vật lý bản ghi mapping (Soft Delete)

- Đánh dấu trạng thái INACTIVE và lưu lý do

- Dữ liệu lịch sử được archive theo chính sách lưu trữ PTSC

3.  **Đặc tả Kỹ thuật Đồng bộ ID**

3.1 **Kiến trúc tổng thể**

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image31.png){width="6.873966535433071in" height="4.583333333333333in"}

3.2 **Giao thức và Phương thức kết nối**

**3.3 API Đồng bộ chính**

a\) Tra cứu Master ID:

**POST /esb/api/v1/master-data/lookup**

**Content-Type: application/json**

**Authorization: Bearer {access_token}**

**Request:**

**{**

**\"entity_type\": \"User\",**

**\"internal_id\": \"USR_001234\",**

**\"match_attributes\": {**

**\"email\": \"nguyenvana@ptsc.com.vn\",**

**\"employee_code\": \"NV2024001\"**

**}**

**}**

**Response (200 OK):**

**{**

**\"status\": \"MATCHED\",**

**\"master_id\": \"PTSC_EMP_2024_1001\",**

**\"confidence\": 1.0,**

**\"last_updated\": \"2026-04-01T08:00:00Z\"**

**}**

**Sao chép**

b\) Đăng ký Mapping mới:

**POST /esb/api/v1/crosswalk/register**

**Content-Type: application/json**

**Request:**

**{**

**\"entity_type\": \"Project\",**

**\"internal_id\": \"PRJ_005678\",**

**\"master_id\": \"PTSC_PRJ_2026_Q1_01\",**

**\"sync_direction\": \"BIDIRECTIONAL\",**

**\"metadata\": {**

**\"project_name\": \"Dự án ABC\",**

**\"department\": \"Kỹ thuật\"**

**}**

**}**

**Response (201 Created):**

**{**

**\"crosswalk_id\": 98765,**

**\"status\": \"ACTIVE\",**

**\"created_date\": \"2026-04-02T09:00:00Z\"**

**}**

**Sao chép**

c\) Đồng bộ Batch:

**POST /esb/api/v1/crosswalk/batch-sync**

**Content-Type: application/json**

**Request:**

**{**

**\"sync_mode\": \"INCREMENTAL\",**

**\"entity_types\": \[\"User\", \"Project\", \"Document\"\],**

**\"from_timestamp\": \"2026-04-01T00:00:00Z\",**

**\"max_records\": 10000**

**}**

**Response (202 Accepted):**

**{**

**\"job_id\": \"SYNC_20260402_001\",**

**\"estimated_duration\": \"300s\",**

**\"callback_url\": \"/esb/api/v1/sync-jobs/SYNC_20260402_001/status\"**

**}**

**3. 4** Cơ chế xử lý lỗi và Retry

#### 

4.  **Kết quả kiểm thử chi tiết**

> 4.1 Phạm vi kiểm thử

> 4.2 Kết quả chi tiết kiểm thử

a\) Kiểm thử chức năng (Functional Test):

b\) Kiểm thử hiệu năng (Performance Test):

c\) Kiểm thử đối soát dữ liệu (Data Reconciliation):

d\) Kiểm thử xử lý lỗi và phục hồi (Failure & Recovery):

**2.3.1 Yêu cầu tích hợp và lưu trữ báo cáo trên nền tảng dữ liệu**

**2.3.1.1 Nhà cung cấp cam kết phối hợp với PTSC để thiết kế kiến trúc báo cáo theo hướng:Tự động trích xuất dữ liệu báo cáo HRM lên Data Platform qua ESB (WSO2). Lưu trữ tập trung tại Data Lake/Data Warehouse. Sẵn sàng khai thác cho BI/AI (dự báo nghỉ việc, thiếu hụt năng lực,...). Bảo đảm phân quyền RBAC và Audit Trail. Tuân thủ kiến trúc Hybrid Data Platform của PTSC.**

Nhà cung cấp cam kết phối hợp chặt chẽ với PTSC để xây dựng kiến trúc báo cáo phù hợp với định hướng phát triển dữ liệu và quản trị hệ thống của PTSC, cụ thể như sau:

- Thực hiện tự động trích xuất dữ liệu báo cáo từ hệ thống HRM lên Data Platform thông qua nền tảng ESB WSO2.

- Dữ liệu được lưu trữ tập trung trên Data Lake/Data Warehouse, tạo nền tảng cho quản trị dữ liệu thống nhất.

- Kiến trúc được thiết kế sẵn sàng cho nhu cầu khai thác BI/AI, hỗ trợ các bài toán phân tích, dự báo như nghỉ việc, thiếu hụt năng lực và các chỉ số quản trị nhân sự khác.

- Bảo đảm an toàn và kiểm soát dữ liệu thông qua cơ chế phân quyền RBAC và Audit Trail.

- Giải pháp được xây dựng trên nguyên tắc tuân thủ kiến trúc Hybrid Data Platform của PTSC, bảo đảm tính tương thích, mở rộng và tích hợp lâu dài.

> ![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image37.png){width="6.875in" height="9.28715223097113in"}

**2.3.2 Yêu cầu đồng bộ báo cáo với e-learning**

**2.3.2.1 Nhà cung cấp phải cam kết phối hợp với PTSC bảo đảm tích hợp hai chiều với hệ thống E-Learning: Đồng bộ danh sách nhân sự, đơn vị, chức danh từ HRM sang E-Learning. Đồng bộ kế hoạch đào tạo bắt buộc theo vị trí. Nhận dữ liệu hoàn thành khóa học, điểm đánh giá, số giờ học từ E-Learning về HRM. Cập nhật trạng thái chứng chỉ và hiệu lực. Bảo đảm khả năng thay thế hệ E-Learning trong tương lai mà không phải thiết kế lại toàn bộ HRM.**

Nhà cung cấp cam kết phối hợp chặt chẽ với PTSC để bảo đảm tích hợp hai chiều giữa hệ thống HRM và hệ thống E-Learning, đáp ứng các yêu cầu nghiệp vụ và định hướng kiến trúc mở, cụ thể:

- Đồng bộ dữ liệu danh mục nhân sự từ HRM sang E-Learning, bao gồm danh sách nhân sự, đơn vị, chức danh/vị trí và các thông tin liên quan phục vụ phân quyền học tập và quản trị đào tạo.

- Đồng bộ kế hoạch đào tạo bắt buộc theo vị trí/chức danh, bảo đảm E-Learning tự động gán đúng lộ trình học bắt buộc tương ứng với vai trò và thay đổi tổ chức.

- Tiếp nhận dữ liệu kết quả đào tạo từ E-Learning về HRM, bao gồm trạng thái hoàn thành khóa học, điểm đánh giá, số giờ học và các chỉ số đào tạo khác, phục vụ đánh giá năng lực và báo cáo quản trị.

- Cập nhật trạng thái chứng chỉ và hiệu lực chứng chỉ về HRM, bảo đảm thông tin chứng chỉ được quản trị tập trung, hỗ trợ kiểm soát tuân thủ và cảnh báo hết hạn.

- Thiết kế tích hợp theo nguyên tắc loosely-coupled (tách lớp tích hợp), bảo đảm khả năng thay thế hệ thống E-Learning trong tương lai mà không cần thiết kế lại toàn bộ HRM, chỉ cần điều chỉnh tại lớp tích hợp/adapter theo chuẩn giao tiếp thống nhất.

![](C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base\src\tlgp/media/image19.png){width="4.848958880139983in" height="8.583333333333334in"}

3.  **KỸ THUẬT TÍCH HỢP**