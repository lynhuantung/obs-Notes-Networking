---
aliases: 
date: 2024-10-24
tags:
  - daily
  - "#ETL"
  - datawarehouse
---
Hiện tại công ty tôi triển khai khách hàng lớn có dữ liệu rất lớn dẫn đến xuất báo cáo trực tiếp bị chậm performance. Nay tôi cần làm gì để xuất bc nhanh các hệ thống lớn như ERP thì họ làm như thế nào?
---

Để cải thiện hiệu suất khi xuất báo cáo với dữ liệu rất lớn, các hệ thống lớn như ERP thường áp dụng những biện pháp sau:

1. **Sử dụng Cơ Chế Caching**: Áp dụng caching để lưu trữ các kết quả báo cáo được truy xuất thường xuyên hoặc các phần dữ liệu không thay đổi thường xuyên. Điều này giúp giảm thiểu tải từ việc truy vấn dữ liệu trực tiếp từ cơ sở dữ liệu.
    
2. **ETL và Data Warehouse**: Tách quá trình xử lý dữ liệu và tổng hợp báo cáo bằng cách sử dụng ETL để đưa dữ liệu từ hệ thống chính vào một kho dữ liệu (Data Warehouse). Tại kho dữ liệu, dữ liệu có thể được tối ưu hóa và cấu trúc lại để phù hợp cho việc truy xuất và xuất báo cáo nhanh chóng.
    
3. **Tối Ưu Câu Truy Vấn SQL**: Kiểm tra và tối ưu các truy vấn SQL để đảm bảo chúng chạy hiệu quả với dữ liệu lớn. Việc sử dụng chỉ mục (indexes), phân vùng dữ liệu (partitioning), hoặc chia nhỏ các bảng lớn (sharding) là cách phổ biến để tăng tốc độ truy vấn.
    
4. **Chia Nhỏ Dữ Liệu và Xử Lý Song Song**: Đối với dữ liệu rất lớn, chia dữ liệu thành nhiều phần và xử lý song song có thể giúp giảm thời gian xuất báo cáo. Một số hệ thống sử dụng kỹ thuật phân vùng dữ liệu (data partitioning) để thực hiện việc này.
    
5. **Sử Dụng Các Công Cụ BI**: Các công cụ Business Intelligence (BI) như Power BI, Tableau, hoặc SSRS hỗ trợ việc tải trước dữ liệu và chỉ cần truy vấn các phần dữ liệu được tối ưu. Ngoài ra, BI cũng hỗ trợ tự động tạo các tập dữ liệu (datasets) để giảm tải trên hệ thống gốc.
    
6. **Batch Processing và Report Scheduler**: Thay vì xuất báo cáo trực tiếp từ hệ thống, bạn có thể sử dụng batch processing để tạo báo cáo định kỳ vào ban đêm hoặc khi hệ thống ít người dùng. Các báo cáo sau đó được lưu trữ và người dùng có thể truy cập chúng khi cần thiết, thay vì phải chờ hệ thống xử lý thời gian thực.
    
7. **Sử Dụng In-Memory Processing**: Một số giải pháp ERP hiện đại sử dụng kỹ thuật xử lý trong bộ nhớ (in-memory) để tăng tốc độ truy xuất và xử lý dữ liệu. Ví dụ như SAP HANA là một trong các giải pháp cho phép xử lý trực tiếp trong bộ nhớ thay vì phải truy xuất từ đĩa.
    
8. **Phân Tán Hệ Thống Cơ Sở Dữ Liệu**: Áp dụng các cơ sở dữ liệu phân tán (distributed databases) như Hadoop hoặc các hệ thống xử lý dữ liệu lớn (Big Data) để hỗ trợ truy xuất dữ liệu nhanh hơn với lượng dữ liệu cực lớn.
    

Bạn có thể bắt đầu bằng cách đánh giá hệ thống hiện tại để xác định đâu là “nút cổ chai” (bottleneck) và sau đó áp dụng các biện pháp trên phù hợp với môi trường của bạn.

ETL và Data Warehouse: hướng dẫn tôi cách làm
---

Để thiết lập quy trình ETL (Extract, Transform, Load) và xây dựng Data Warehouse, bạn có thể thực hiện theo các bước sau:

### 1. **Hiểu Quy Trình ETL và Data Warehouse**

- **ETL** là quy trình gồm ba bước chính:
    
    - **Extract (Trích xuất dữ liệu)**: Lấy dữ liệu từ nhiều nguồn khác nhau (ERP, CRM, cơ sở dữ liệu giao dịch, file Excel, v.v.).
    - **Transform (Chuyển đổi dữ liệu)**: Làm sạch, biến đổi và chuẩn hóa dữ liệu để đáp ứng yêu cầu của kho dữ liệu.
    - **Load (Tải dữ liệu)**: Đưa dữ liệu đã xử lý vào kho dữ liệu (Data Warehouse).
- **Data Warehouse** là hệ thống dùng để lưu trữ dữ liệu từ nhiều nguồn khác nhau, được tổ chức và tối ưu hóa để phục vụ cho việc phân tích và báo cáo.    

### 2. **Lên Kế Hoạch Thiết Kế Data Warehouse**

- **Xác định mục tiêu**: Xác định rõ loại dữ liệu cần lưu trữ và mục đích sử dụng kho dữ liệu. Ví dụ: xuất báo cáo nhanh hơn, phân tích theo thời gian thực, v.v.
- **Xác định các nguồn dữ liệu**: Các nguồn dữ liệu có thể là hệ thống ERP, CRM, cơ sở dữ liệu giao dịch, hoặc thậm chí là các file CSV, Excel.
- **Thiết kế mô hình dữ liệu**: Quyết định các bảng dữ liệu, quan hệ giữa chúng, các chỉ số và các chiều (dimensions) để lưu trữ trong kho dữ liệu.
    - **Mô hình hình sao (Star Schema)** và **mô hình bông tuyết (Snowflake Schema)** là các mô hình phổ biến.
- **Xác định KPI và báo cáo**: Định nghĩa các chỉ số hiệu suất (KPI) và các loại báo cáo mà bạn cần từ Data Warehouse.

### 3. **Xây Dựng Data Warehouse**

- **Chọn công cụ Data Warehouse**:
    - Có thể dùng các hệ thống như **SQL Server**, **Amazon Redshift**, **Google BigQuery**, hoặc **Snowflake**.
- **Xây dựng các bảng sự kiện (Fact Tables)** và **bảng chiều (Dimension Tables)**:
    - **Fact Tables** lưu trữ dữ liệu số, thường là các chỉ số cần phân tích.
    - **Dimension Tables** lưu trữ thông tin bổ sung về các sự kiện, ví dụ như thông tin khách hàng, thời gian, sản phẩm.

### 4. **Triển Khai Quy Trình ETL**

- **Extract (Trích xuất dữ liệu)**:
    - Chọn công cụ ETL để trích xuất dữ liệu từ các nguồn khác nhau.
    - Các công cụ phổ biến: **Talend**, **Apache Nifi**, **Microsoft SSIS (SQL Server Integration Services)**, **Pentaho**, **Informatica**, **AWS Glue**.
- **Transform (Chuyển đổi dữ liệu)**:
    - Làm sạch dữ liệu: loại bỏ bản ghi trùng lặp, xử lý giá trị thiếu, chuẩn hóa định dạng.
    - Chuyển đổi: tính toán, tổng hợp, tạo trường mới theo yêu cầu báo cáo.
    - Ví dụ: nếu dữ liệu về đơn hàng có nhiều đơn vị tiền tệ, bạn có thể chuẩn hóa tất cả về cùng một đơn vị tiền tệ.
- **Load (Tải dữ liệu)**:
    - Đưa dữ liệu đã xử lý vào kho dữ liệu, có thể thực hiện theo kiểu **full load** (tải lại tất cả dữ liệu) hoặc **incremental load** (chỉ tải dữ liệu mới hoặc cập nhật).
    - Thiết lập các chu kỳ tải dữ liệu (ví dụ: hàng ngày, hàng giờ, hoặc thời gian thực).

### 5. **Công Cụ và Kỹ Thuật Hỗ Trợ**

- **Công cụ ETL**: Bạn có thể sử dụng các công cụ như:
    - **Talend**: Hỗ trợ mạnh mẽ cho ETL và miễn phí cho các tính năng cơ bản.
    - **Apache NiFi**: Một công cụ nguồn mở giúp quản lý luồng dữ liệu, trích xuất, và chuyển đổi.
    - **Microsoft SSIS**: Là một công cụ ETL thuộc bộ SQL Server, phù hợp nếu bạn sử dụng SQL Server cho kho dữ liệu.
- **Data Warehouse**:
    - **Amazon Redshift**: Kho dữ liệu đám mây mạnh mẽ, phù hợp cho dữ liệu lớn.
    - **Google BigQuery**: Công cụ của Google, cho phép phân tích dữ liệu rất lớn mà không cần quản lý máy chủ.
    - **Snowflake**: Là lựa chọn phổ biến cho kho dữ liệu đám mây, dễ dàng mở rộng.

### 6. **Lên Lịch và Tự Động Hóa Quy Trình ETL**

- **Lên lịch ETL** để đảm bảo dữ liệu trong Data Warehouse luôn được cập nhật. Các công cụ như **Apache Airflow** có thể được dùng để tự động hóa và lên lịch cho các luồng công việc ETL.
- **Incremental Load**: Giảm tải thời gian và tài nguyên bằng cách chỉ cập nhật những dữ liệu thay đổi, thay vì tải lại toàn bộ dữ liệu.

### 7. **Tích Hợp BI Để Báo Cáo**

- **Kết nối Data Warehouse với công cụ BI**: Các công cụ như **Power BI**, **Tableau**, hoặc **Looker** để trực quan hóa dữ liệu và tạo báo cáo.
- **Tạo Dashboard**: Tạo các dashboard trực quan cho phép người dùng dễ dàng truy cập thông tin.

### Ví Dụ Cụ Thể:

1. **Kế Hoạch ETL và Data Warehouse**:
    
    - Bạn có hệ thống ERP lưu trữ dữ liệu về đơn hàng, khách hàng, và sản phẩm.
    - Bạn sẽ trích xuất dữ liệu từ ERP, chuyển đổi và chuẩn hóa dữ liệu để phù hợp với yêu cầu báo cáo (ví dụ, chuẩn hóa đơn vị tiền tệ), sau đó tải vào kho dữ liệu.
2. **Xây Dựng Kho Dữ Liệu**:
    
    - Tạo bảng **Fact_Sales** để lưu dữ liệu bán hàng: ngày bán, số lượng, doanh thu.
    - Tạo bảng **Dim_Customer** để lưu thông tin khách hàng: mã khách hàng, tên, địa chỉ.
    - Tạo bảng **Dim_Product** để lưu thông tin sản phẩm: mã sản phẩm, tên sản phẩm, loại.
3. **Kết Quả**:
    
    - Từ kho dữ liệu, bạn có thể tạo ra báo cáo cho biết doanh thu hàng tháng, doanh thu theo khu vực, hoặc thông tin chi tiết về hành vi khách hàng.

Áp dụng quy trình ETL và Data Warehouse sẽ giúp bạn quản lý tốt dữ liệu lớn và cải thiện hiệu suất khi xuất báo cáo.

có opensource nào hỗ trợ dạng này không
---

Có nhiều giải pháp mã nguồn mở (open-source) hỗ trợ triển khai quy trình ETL và xây dựng Data Warehouse. Dưới đây là một số công cụ phổ biến và mạnh mẽ bạn có thể sử dụng:

### 1. **ETL (Extract, Transform, Load) Open-Source Tools**

- **Apache NiFi**:
    - Công cụ nguồn mở để tự động hóa luồng dữ liệu. Nó cho phép thiết kế, giám sát, và quản lý luồng dữ liệu với giao diện người dùng đơn giản, giúp bạn dễ dàng kết nối và xử lý dữ liệu từ nhiều nguồn khác nhau.
- <font color="#c0504d">Talend Open Studio for Data Integration:</font>
    - Talend có phiên bản mã nguồn mở miễn phí, phù hợp cho các dự án ETL và tích hợp dữ liệu. Nó cung cấp giao diện kéo thả dễ sử dụng để trích xuất, chuyển đổi, và tải dữ liệu.
- **Apache Hop**:
    - Trước đây là Kettle/Pentaho Data Integration (PDI), Hop cung cấp khả năng ETL với giao diện kéo thả, dễ sử dụng. Nó hỗ trợ nhiều nguồn dữ liệu và quy trình phức tạp.
- **Airbyte**:
    - Là một công cụ tích hợp dữ liệu nguồn mở mới nổi, hỗ trợ trích xuất dữ liệu từ hàng trăm nguồn khác nhau và nạp vào Data Warehouse. Airbyte tập trung vào việc dễ dàng mở rộng và tùy biến.
- **Apache Camel**:
    - Là một công cụ ETL mạnh mẽ dùng để kết nối và tích hợp các hệ thống khác nhau thông qua việc sử dụng các mô hình Enterprise Integration Patterns. Nó không có giao diện kéo thả nhưng phù hợp cho các nhà phát triển muốn tích hợp các ứng dụng với nhau thông qua mã nguồn.

### 2. **Data Warehouse Open-Source Tools**

- **ClickHouse**:
    - Một giải pháp kho dữ liệu mã nguồn mở tập trung vào hiệu năng cao, giúp xử lý các truy vấn phân tích dữ liệu lớn với tốc độ nhanh. ClickHouse thường được sử dụng trong các tình huống cần báo cáo trực tuyến và phân tích dữ liệu thời gian thực.
- **Apache Druid**:
    - Là một cơ sở dữ liệu phân tích thời gian thực, phù hợp cho việc lưu trữ và truy vấn dữ liệu lớn. Druid cung cấp khả năng xử lý dữ liệu nhanh chóng, hỗ trợ tốt cho các dashboard phân tích.
- **Apache Cassandra**:
    - Cơ sở dữ liệu NoSQL phân tán phù hợp cho các ứng dụng cần xử lý dữ liệu lớn và truy xuất nhanh. Cassandra cũng có thể được dùng như một phần của hệ thống Data Warehouse khi kết hợp với công cụ ETL.
- **PostgreSQL với Citus**:
    - **Citus** là một extension của PostgreSQL để tạo ra một cơ sở dữ liệu phân tán và phù hợp cho Data Warehouse. PostgreSQL cung cấp nền tảng ổn định và mở rộng tốt để làm kho dữ liệu.

### 3. **Data Integration and Orchestration Tools**

- **Apache Airflow**:
    - Là công cụ nguồn mở mạnh mẽ để quản lý và điều phối các luồng công việc ETL. Apache Airflow giúp bạn dễ dàng lên lịch và quản lý các quy trình ETL theo thời gian.
- **Luigi**:
    - Được phát triển bởi Spotify, Luigi là công cụ nguồn mở để quản lý luồng công việc và điều phối quy trình ETL. Nó tập trung vào việc đảm bảo các bước ETL được thực hiện đúng thứ tự và tái thực hiện khi có lỗi.
- **Dagster**:
    - Dagster là một công cụ mã nguồn mở để điều phối các quy trình ETL và tích hợp với các công cụ khác để quản lý dữ liệu. Nó hỗ trợ kiểm soát luồng công việc và đảm bảo tính toàn vẹn của quy trình ETL.

### 4. **Business Intelligence (BI) Open-Source Tools**

- **Metabase**:
    - Metabase là một công cụ BI mã nguồn mở cho phép người dùng không cần kỹ thuật cũng có thể truy vấn và trực quan hóa dữ liệu từ Data Warehouse một cách dễ dàng.
- **Apache Superset**:
    - Superset là một nền tảng BI mã nguồn mở mạnh mẽ, có khả năng tạo báo cáo, dashboard, và phân tích dữ liệu từ các kho dữ liệu lớn.
- **Redash**:
    - Redash là công cụ mã nguồn mở giúp bạn dễ dàng kết nối, truy vấn, và trực quan hóa dữ liệu từ kho dữ liệu hoặc các nguồn khác nhau.

### Kết Luận

Để xây dựng một giải pháp ETL và Data Warehouse hoàn chỉnh, bạn có thể kết hợp các công cụ sau:

- **Apache NiFi** hoặc **Talend Open Studio** cho quá trình ETL.
- **ClickHouse** hoặc **Apache Druid** làm Data Warehouse để lưu trữ và truy vấn dữ liệu lớn.
- **Apache Airflow** để điều phối và tự động hóa các quy trình ETL.
- **Metabase** hoặc **Apache Superset** cho việc tạo báo cáo và dashboard phân tích dữ liệu.

Bằng cách kết hợp các công cụ mã nguồn mở này, bạn có thể thiết lập một hệ thống ETL và Data Warehouse hiệu quả với chi phí thấp, đáp ứng nhu cầu phân tích và báo cáo của tổ chức.

Tôi cần trích xuất dữ liệu từ db hrm pro để làm Warehouse hãy đề xuất cho tôi giải pháp phù hợp nhất
---

Để trích xuất dữ liệu từ cơ sở dữ liệu HRM Pro sang Data Warehouse, bạn có thể áp dụng giải pháp sau đây nhằm đảm bảo dữ liệu được trích xuất, chuyển đổi và lưu trữ một cách hiệu quả:

### 1. **Chọn Công Cụ ETL Phù Hợp**

- **Apache NiFi**: Là một công cụ mã nguồn mở dễ sử dụng để tự động hóa việc trích xuất và chuyển đổi dữ liệu. NiFi hỗ trợ kết nối trực tiếp với nhiều cơ sở dữ liệu, bao gồm SQL Server, Oracle, MySQL, v.v., nên sẽ rất phù hợp để trích xuất dữ liệu từ hệ thống HRM Pro.
- **Talend Open Studio**: Talend cung cấp giao diện kéo thả dễ sử dụng, phù hợp cho các dự án ETL. Bạn có thể sử dụng Talend để kết nối với DB của HRM Pro, chuyển đổi và tải dữ liệu vào Data Warehouse.
- **Airbyte**: Một lựa chọn mới và mã nguồn mở, Airbyte có thể trích xuất dữ liệu từ nhiều nguồn và tải vào kho dữ liệu, phù hợp cho nhu cầu tích hợp và trích xuất từ cơ sở dữ liệu.

### 2. **Thiết Kế Quy Trình ETL**

- **Extract (Trích xuất dữ liệu)**: Kết nối đến cơ sở dữ liệu của HRM Pro để trích xuất dữ liệu liên quan đến nhân viên, lương, phúc lợi, chấm công, v.v.
    
    - **Kết nối trực tiếp tới cơ sở dữ liệu**: Bạn có thể sử dụng JDBC hoặc ODBC connector để kết nối với SQL Server (nếu HRM Pro dùng SQL Server) và trích xuất dữ liệu.
    - **Lên lịch trích xuất**: Lên lịch trích xuất dữ liệu định kỳ, có thể là hàng ngày hoặc hàng giờ, tùy vào nhu cầu cập nhật dữ liệu.
- **Transform (Chuyển đổi dữ liệu)**: Làm sạch và chuẩn hóa dữ liệu trích xuất từ HRM Pro.
    
    - **Làm sạch dữ liệu**: Loại bỏ giá trị trùng lặp, xử lý dữ liệu bị thiếu.
    - **Chuẩn hóa dữ liệu**: Đảm bảo định dạng nhất quán cho các trường (ví dụ: định dạng ngày/tháng/năm, chuẩn hóa mã nhân viên).
    - **Biến đổi**: Chuyển đổi các trường dữ liệu thành các chỉ số, tính toán tổng hợp cần thiết cho báo cáo.
- **Load (Tải dữ liệu)**: Đưa dữ liệu vào Data Warehouse.
    
    - **Incremental Load**: Để tối ưu hiệu suất, chỉ tải dữ liệu mới hoặc cập nhật từ HRM Pro.
    - **Full Load**: Nếu muốn kiểm tra toàn bộ dữ liệu hoặc định kỳ tải lại toàn bộ, bạn có thể thiết lập full load nhưng sẽ cần đảm bảo hiệu suất và tài nguyên.

### 3. **Xây Dựng Data Warehouse**

- **Lựa Chọn Công Nghệ Data Warehouse**:
    - **Amazon Redshift** hoặc **Google BigQuery** nếu bạn muốn lưu trữ dữ liệu trên đám mây với khả năng mở rộng lớn.
    - **ClickHouse** hoặc **Apache Druid** cho giải pháp mã nguồn mở với khả năng xử lý truy vấn phân tích nhanh chóng.
    - **Microsoft SQL Server Data Warehouse**: Nếu bạn muốn giữ mọi thứ trên cùng một nền tảng và tích hợp tốt với hệ sinh thái của Microsoft.
- **Thiết Kế Mô Hình Dữ Liệu**:
    - **Star Schema** hoặc **Snowflake Schema** để tổ chức dữ liệu trong Data Warehouse cho hiệu quả truy vấn tối ưu.
    - Xác định các bảng sự kiện (Fact Tables) như **Fact_Salary**, **Fact_Attendance** và các bảng chiều (Dimension Tables) như **Dim_Employee**, **Dim_Department**.

### 4. **Điều Phối Quy Trình ETL**

- **Apache Airflow**: Là công cụ mã nguồn mở mạnh mẽ để điều phối và tự động hóa các quy trình ETL. Bạn có thể dùng Airflow để thiết lập luồng công việc từ trích xuất dữ liệu từ HRM Pro, chuyển đổi dữ liệu, và tải vào Data Warehouse.
- **Luigi**: Một lựa chọn khác từ Spotify, giúp bạn quản lý luồng công việc và tự động hóa quy trình ETL một cách dễ dàng.

### 5. **Công Cụ Trực Quan Hóa và Báo Cáo**

- **Metabase**: Là một công cụ mã nguồn mở dễ sử dụng để kết nối tới Data Warehouse và tạo các báo cáo trực quan.
- **Apache Superset** hoặc **Redash**: Đây là những công cụ BI mã nguồn mở phù hợp cho việc tạo dashboard và phân tích dữ liệu trực tiếp từ Data Warehouse.

### **Kết Luận**

- **Công cụ ETL**: Dùng **Apache NiFi** hoặc **Talend Open Studio** để trích xuất, chuyển đổi, và tải dữ liệu từ HRM Pro.
- **Kho dữ liệu**: Dùng **Amazon Redshift**, **Google BigQuery**, hoặc **ClickHouse** làm Data Warehouse.
- **Quản lý luồng công việc ETL**: Dùng **Apache Airflow** để tự động hóa quy trình.
- **Công cụ báo cáo**: Dùng **Metabase** hoặc **Apache Superset** để tạo các báo cáo và dashboard.

Giải pháp này sẽ giúp bạn có được một hệ thống lưu trữ và phân tích dữ liệu hiệu quả, phục vụ cho nhu cầu báo cáo và phân tích trong dài hạn.

Redash có trả phí ko
---

**Redash** là một công cụ BI mã nguồn mở ban đầu được phát triển bởi cộng đồng, do đó bạn có thể sử dụng phiên bản mã nguồn mở mà không phải trả phí. Tuy nhiên, cần lưu ý các điểm sau:

1. **Phiên bản Mã Nguồn Mở**:
    
    - Bạn có thể tải về và triển khai **Redash** trên máy chủ của mình miễn phí. Đây là phiên bản mã nguồn mở và bạn sẽ có toàn quyền kiểm soát hệ thống của mình, nhưng bạn cần phải có đội ngũ quản lý và duy trì máy chủ, cập nhật, và bảo mật.
2. **Dịch vụ Cloud và Trả Phí**:
    
    - **Redash** từng cung cấp dịch vụ Cloud trả phí để lưu trữ và duy trì Redash cho người dùng, nhưng từ khi được **Acquired by Databricks** vào năm 2020, dịch vụ Cloud này đã bị ngừng cung cấp.
    - Nếu bạn muốn sử dụng Redash như một dịch vụ không cần quản lý cơ sở hạ tầng, hiện tại bạn sẽ cần tự triển khai hoặc tìm đến các giải pháp thay thế trả phí khác như **Databricks** hoặc các dịch vụ BI tương tự.

### Tóm lại:

- Bạn có thể sử dụng **Redash** bản mã nguồn mở mà không mất phí. Tuy nhiên, việc triển khai và bảo trì sẽ cần có kiến thức kỹ thuật hoặc đội ngũ IT.
- Không còn dịch vụ lưu trữ Redash trên Cloud từ nhà phát triển chính thức, nhưng bạn có thể tìm các nhà cung cấp dịch vụ khác để được hỗ trợ triển khai với một khoản phí.

Nếu bạn cần một giải pháp dễ dàng quản lý và không muốn lo về hạ tầng, có thể cân nhắc các công cụ BI khác như **Metabase** (cũng có phiên bản miễn phí và cloud), hoặc các dịch vụ BI thương mại như **Tableau**, **Looker**, hoặc **Power BI**.



----


--- 
**5 Ý Chính:**

1. **Tối ưu Hiệu Suất Xuất Báo Cáo** bằng cách áp dụng các biện pháp như sử dụng **caching**, **ETL và Data Warehouse**, **tối ưu câu truy vấn SQL**, **chia nhỏ dữ liệu và xử lý song song**, **sử dụng các công cụ BI**, **batch processing và report scheduler**, **xử lý trong bộ nhớ** và **phân tán hệ thống cơ sở dữ liệu**.
2. **Thiết lập Quy Trình ETL và Data Warehouse** bao gồm việc hiểu quy trình, lên kế hoạch thiết kế Data Warehouse, xây dựng Data Warehouse, triển khai quy trình ETL, sử dụng các công cụ và kỹ thuật hỗ trợ, lên lịch và tự động hóa quy trình ETL, và tích hợp BI để báo cáo.
3. **Giải Pháp Mã Nguồn Mở ETL và Data Warehouse** gồm các công cụ phổ biến cho ETL (Apache NiFi, Talend Open Studio, Apache Hop, Airbyte, Apache Camel) và Data Warehouse (ClickHouse, Apache Druid, Apache Cassandra, PostgreSQL với Citus).
4. **Trích Xuất Dữ Liệu từ HRM Pro** bằng cách sử dụng công cụ ETL, thiết kế quy trình ETL, xây dựng Data Warehouse, điều phối quy trình ETL, và sử dụng các công cụ trực quan hóa và báo cáo.
5. **Redash miễn phí để sử dụng** phiên bản mã nguồn mở, tuy nhiên để có đầy đủ tính năng và dịch vụ lưu trữ, bạn cần sử dụng các dịch vụ trả phí.

 --- 



