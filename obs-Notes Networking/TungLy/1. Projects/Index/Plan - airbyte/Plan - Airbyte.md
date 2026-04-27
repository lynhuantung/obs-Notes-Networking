---
aliases: 
date: 2024-11-15
permalink: 
tags:
  - "#plan"
  - "#kehoach"
  - "#airbyte"
Link kế hoạch: https://docs.google.com/spreadsheets/d/1LT--Iz4P0C1C-cGI7KYGmEW6HxSBmV_31J-kC4Sp7gg/edit
Related: "[[0.KeHoach]]"
---
## Kế hoạch Airbyte 
---
- Link kế hoạch : https://docs.google.com/spreadsheets/d/1LT--Iz4P0C1C-cGI7KYGmEW6HxSBmV_31J-kC4Sp7gg/edit
![[Pasted image 20241115092924.png]]

- Lưu trữ tài liệu: [Data WareHouse - ETL - Google Drive](https://drive.google.com/drive/folders/1Nw7_RxvCdYPas48tzoXiVL88vVRrkavI)
- Flow kiến trúc: [v1.0.1.ETL.Architecture.drawio - draw.io](https://app.diagrams.net/#G13YUDD9wdQ9pyXtHJW0X0namAlf1PTORV#%7B%22pageId%22%3A%22SydKPcMjsuP2SKxgac9M%22%7D)
- kịch  bản vận hành: 
![[Pasted image 20241115093022.png]]
 
# Tóm tắt kế hoạch
---
Dưới đây là tóm tắt kế hoạch xây dựng **Data Warehouse** :

### Các hạng mục công việc chính:
1. **Thiết lập công cụ ETL - Airbyte**:
   - Mục tiêu: Cấu hình Airbyte để thu thập dữ liệu từ các nguồn và đưa vào Data Warehouse.
   - Trạng thái: Đa số các công việc đang thực hiện hoặc đã hoàn thành. Tuy nhiên, vẫn còn một số phần đang thực hiện (Doing) cần theo dõi.

2. **Sử dụng công cụ BI - Redash**:
   - **Liên kết với Redash**: Đã hoàn thành việc thiết lập liên kết Redash, đảm bảo người dùng có thể truy cập báo cáo.
   - **Tìm hiểu chức năng Redash**: Nghiên cứu các tính năng của Redash để tối ưu hóa khả năng báo cáo và trực quan hóa dữ liệu.
   - **Kết nối Data Warehouse với BI**: Đảm bảo Redash có thể kết nối và truy vấn dữ liệu từ Data Warehouse, bao gồm các bảng dữ liệu quan trọng cho báo cáo.

3. **Xác định và tổ chức báo cáo**:
   - Các báo cáo bao gồm bảng phân tích năng suất, bảng theo dõi hiệu suất làm việc, báo cáo nhân viên.
   - Báo cáo từ các nguồn dữ liệu khác nhau sẽ được xử lý qua Airbyte và tích hợp vào Redash.
   - Trạng thái: Phần lớn các báo cáo đã được cấu hình xong, một số đang trong quá trình hiệu chỉnh và tối ưu.

4. **Thiết lập bộ dữ liệu cho Data Warehouse**:
   - Xác định và kiểm tra dữ liệu từ hệ thống HRM, đảm bảo dữ liệu chính xác và phù hợp với các yêu cầu báo cáo.
   - Đã hoàn tất việc thiết lập cấu hình các cột, dòng và yêu cầu tối ưu hóa dữ liệu.

5. **Tùy chỉnh và tự động hóa báo cáo**:
   - Công việc bao gồm tối ưu hóa và tự động hóa các quy trình báo cáo hàng ngày, hàng tuần.
   - Thiết lập các báo cáo tự động chạy theo chu kỳ (job hoặc manual).
   - Một số báo cáo cần điều chỉnh để đáp ứng yêu cầu người dùng.

6. **Tích hợp báo cáo vào hệ thống HRM**:
   - Sử dụng iframe hoặc tích hợp báo cáo Redash trực tiếp vào giao diện của HRM, giúp người dùng dễ dàng truy cập.
   - Theo dõi và tối ưu hóa hiệu suất hiển thị của các báo cáo trong HRM để đáp ứng yêu cầu của người dùng.

### Chi tiết:
- **Người phụ trách**: Các công việc được giao cho các thành viên như Tuan Vo, Hien Pham, và một số thành viên khác trong nhóm BI Tools.
- **Trạng thái**: Hầu hết công việc đã được hoàn thành (Done), tuy nhiên có một số phần đang tiến hành (Doing) cần được theo dõi sát sao.
- **Kết quả mong đợi**: Đảm bảo hệ thống Data Warehouse hoạt động ổn định, các báo cáo trực quan, chính xác và dễ truy cập thông qua HRM và các công cụ BI khác.

