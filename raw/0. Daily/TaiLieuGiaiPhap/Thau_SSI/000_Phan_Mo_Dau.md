---
tags: [tailieu-giaiphap, thau-ssi, bao-mat, hieu-nang, tich-hop, api, dong-bo, giao-dien, ui-ux, database, backup, nguoi-dung, phan-quyen, he-dieu-hanh, may-chu, cloud, nhan-su, hrm, cham-cong, tuyen-dung, danh-gia, kpi, logging, monitoring, cau-hinh, ho-tro, bao-cao, thong-ke, ngon-ngu, data, van-hanh, may-tram]
date: 2026-05-13
section: "**Nội dung** {#nội-dung .TOC-Heading}"
---
> TÀI LIỆU GIẢI PHÁP KỸ THUẬT HỆ THỐNG --
>
> PHẦN MỀM QUẢN TRỊ NHÂN SỰ
>
> VNRESOURCE HRM PRO
>
> Tên tài liệu viết tắt: (TLGP.HeThong)

# **Nội dung** {#nội-dung .TOC-Heading}

#  {#section .TOC-Heading}

[1. Cấu hình hệ thống [16](#cấu-hình-hệ-thống)](#cấu-hình-hệ-thống)

[1.1 Ngôn ngữ [16](#ngôn-ngữ)](#ngôn-ngữ)

[1.1.1 Hệ thống phải có khả năng hỗ trợ hoàn toàn ngôn ngữ tiếng Việt trên tất cả các phương diện bao gồm hiển thị dữ liệu, quản lý dữ liệu, trích xuất dữ liệu, in ấn và các hoạt động giao dịch. [16](#hệ-thống-phải-có-khả-năng-hỗ-trợ-hoàn-toàn-ngôn-ngữ-tiếng-việt-trên-tất-cả-các-phương-diện-bao-gồm-hiển-thị-dữ-liệu-quản-lý-dữ-liệu-trích-xuất-dữ-liệu-in-ấn-và-các-hoạt-động-giao-dịch.)](#hệ-thống-phải-có-khả-năng-hỗ-trợ-hoàn-toàn-ngôn-ngữ-tiếng-việt-trên-tất-cả-các-phương-diện-bao-gồm-hiển-thị-dữ-liệu-quản-lý-dữ-liệu-trích-xuất-dữ-liệu-in-ấn-và-các-hoạt-động-giao-dịch.)

[1.1.2 Hệ thống hỗ trợ cho phép người dùng chuyển sang giao diện Tiếng Anh theo nhu cầu sử dụng [16](#hệ-thống-hỗ-trợ-cho-phép-người-dùng-chuyển-sang-giao-diện-tiếng-anh-theo-nhu-cầu-sử-dụng)](#hệ-thống-hỗ-trợ-cho-phép-người-dùng-chuyển-sang-giao-diện-tiếng-anh-theo-nhu-cầu-sử-dụng)

[1.2 File tài liệu [17](#file-tài-liệu)](#file-tài-liệu)

[1.2.1 Hệ thống cho phép khai báo các định dạng, dung lượng file được lưu trữ và xử lý. [17](#hệ-thống-cho-phép-khai-báo-các-định-dạng-dung-lượng-file-được-lưu-trữ-và-xử-lý.)](#hệ-thống-cho-phép-khai-báo-các-định-dạng-dung-lượng-file-được-lưu-trữ-và-xử-lý.)

[1.3 Tính linh hoạt [18](#tính-linh-hoạt)](#tính-linh-hoạt)

[1.3.1 Hệ thống cần cho phép các tham số được cấu hình ở các cấp độ khác nhau, bao gồm nhưng không giới hạn: Tổ chức, Công ty con/chi nhánh, Phòng, Đại lý, Khách hàng, Tài khoản, Người sử dụng, vv. [18](#hệ-thống-cần-cho-phép-các-tham-số-được-cấu-hình-ở-các-cấp-độ-khác-nhau-bao-gồm-nhưng-không-giới-hạn-tổ-chức-công-ty-conchi-nhánh-phòng-đại-lý-khách-hàng-tài-khoản-người-sử-dụng-vv.)](#hệ-thống-cần-cho-phép-các-tham-số-được-cấu-hình-ở-các-cấp-độ-khác-nhau-bao-gồm-nhưng-không-giới-hạn-tổ-chức-công-ty-conchi-nhánh-phòng-đại-lý-khách-hàng-tài-khoản-người-sử-dụng-vv.)

[1.3.2 Hệ thống phải hỗ trợ để định nghĩa các loại tham số khác nhau, bao gồm nhưng không giới hạn: Các tham số chung của toàn bộ hệ thống và Từng tham số của mỗi phân hệ chức năng [19](#hệ-thống-phải-hỗ-trợ-để-định-nghĩa-các-loại-tham-số-khác-nhau-bao-gồm-nhưng-không-giới-hạn-các-tham-số-chung-của-toàn-bộ-hệ-thống-và-từng-tham-số-của-mỗi-phân-hệ-chức-năng)](#hệ-thống-phải-hỗ-trợ-để-định-nghĩa-các-loại-tham-số-khác-nhau-bao-gồm-nhưng-không-giới-hạn-các-tham-số-chung-của-toàn-bộ-hệ-thống-và-từng-tham-số-của-mỗi-phân-hệ-chức-năng)

[1.3.3 Hệ thống phải có cơ chế để quản lý và giám sát tập trung các tham số hệ thống được bổ sung mới hoặc bị thay đổi cũng như về khả năng vận hành và quản trị hệ thống. [21](#hệ-thống-phải-có-cơ-chế-để-quản-lý-và-giám-sát-tập-trung-các-tham-số-hệ-thống-được-bổ-sung-mới-hoặc-bị-thay-đổi-cũng-như-về-khả-năng-vận-hành-và-quản-trị-hệ-thống.)](#hệ-thống-phải-có-cơ-chế-để-quản-lý-và-giám-sát-tập-trung-các-tham-số-hệ-thống-được-bổ-sung-mới-hoặc-bị-thay-đổi-cũng-như-về-khả-năng-vận-hành-và-quản-trị-hệ-thống.)

[1.3.4 Hệ thống linh hoạt cho phép: Tạo/ sửa/ xóa các trường thông tin về thuộc tính của tài liệu (metadata).Tạo/ sửa trường thuộc tính bằng cách import file từ bên ngoài (excel, csv...) hoặc copy từ trường thông tin đã tồn tại.Thiết lập các nguyên tắc cập nhật giá trị cho trường thuộc tính.Thiết kế giao diện và phân nhóm các trường thuộc tính một cách linh hoạt [22](#hệ-thống-linh-hoạt-cho-phép-tạo-sửa-xóa-các-trường-thông-tin-về-thuộc-tính-của-tài-liệu-metadata.tạo-sửa-trường-thuộc-tính-bằng-cách-import-file-từ-bên-ngoài-excel-csv-hoặc-copy-từ-trường-thông-tin-đã-tồn-tại.thiết-lập-các-nguyên-tắc-cập-nhật-giá-trị-cho-trường-thuộc-tính.thiết-kế-giao-diện-và-phân-nhóm-các-trường-thuộc-tính-một-cách-linh-hoạt)](#hệ-thống-linh-hoạt-cho-phép-tạo-sửa-xóa-các-trường-thông-tin-về-thuộc-tính-của-tài-liệu-metadata.tạo-sửa-trường-thuộc-tính-bằng-cách-import-file-từ-bên-ngoài-excel-csv-hoặc-copy-từ-trường-thông-tin-đã-tồn-tại.thiết-lập-các-nguyên-tắc-cập-nhật-giá-trị-cho-trường-thuộc-tính.thiết-kế-giao-diện-và-phân-nhóm-các-trường-thuộc-tính-một-cách-linh-hoạt)

[1.3.5 Hệ thống cho phép linh hoạt phân quyền/ tạo các nhóm quyền đối với từng user/ nhóm user/ đơn vị trong việc xem, cập nhật, thay đổi cho các dữ liệu, cây thư mục, loại tài liệu, module chức năng trên hệ thống. [22](#hệ-thống-cho-phép-linh-hoạt-phân-quyền-tạo-các-nhóm-quyền-đối-với-từng-user-nhóm-user-đơn-vị-trong-việc-xem-cập-nhật-thay-đổi-cho-các-dữ-liệu-cây-thư-mục-loại-tài-liệu-module-chức-năng-trên-hệ-thống.)](#hệ-thống-cho-phép-linh-hoạt-phân-quyền-tạo-các-nhóm-quyền-đối-với-từng-user-nhóm-user-đơn-vị-trong-việc-xem-cập-nhật-thay-đổi-cho-các-dữ-liệu-cây-thư-mục-loại-tài-liệu-module-chức-năng-trên-hệ-thống.)

[1.3.6 Hệ thống có giao diện để quản lý, cập nhật các dữ liệu chủ (master data), dữ liệu dạng danh mục (được khai báo hoặc đồng bộ từ hệ thống của SSI). Việc cập nhật, thay đổi không làm ảnh hưởng tới việc khai thác của các dữ liệu đã lưu trữ, đang xử lý hoặc chuẩn bị xử lý. [23](#hệ-thống-có-giao-diện-để-quản-lý-cập-nhật-các-dữ-liệu-chủ-master-data-dữ-liệu-dạng-danh-mục-được-khai-báo-hoặc-đồng-bộ-từ-hệ-thống-của-ssi.-việc-cập-nhật-thay-đổi-không-làm-ảnh-hưởng-tới-việc-khai-thác-của-các-dữ-liệu-đã-lưu-trữ-đang-xử-lý-hoặc-chuẩn-bị-xử-lý.)](#hệ-thống-có-giao-diện-để-quản-lý-cập-nhật-các-dữ-liệu-chủ-master-data-dữ-liệu-dạng-danh-mục-được-khai-báo-hoặc-đồng-bộ-từ-hệ-thống-của-ssi.-việc-cập-nhật-thay-đổi-không-làm-ảnh-hưởng-tới-việc-khai-thác-của-các-dữ-liệu-đã-lưu-trữ-đang-xử-lý-hoặc-chuẩn-bị-xử-lý.)

[1.3.7 Hệ thống có cơ chế cho phép quản trị viên (admin hệ thống) có quyền cao nhất và được quyền can thiệp (tạo, sửa, thay thế, xóa) vào các dữ liệu, cây thư mục, tài liệu, module chức năng của hệ thống. [24](#hệ-thống-có-cơ-chế-cho-phép-quản-trị-viên-admin-hệ-thống-có-quyền-cao-nhất-và-được-quyền-can-thiệp-tạo-sửa-thay-thế-xóa-vào-các-dữ-liệu-cây-thư-mục-tài-liệu-module-chức-năng-của-hệ-thống.)](#hệ-thống-có-cơ-chế-cho-phép-quản-trị-viên-admin-hệ-thống-có-quyền-cao-nhất-và-được-quyền-can-thiệp-tạo-sửa-thay-thế-xóa-vào-các-dữ-liệu-cây-thư-mục-tài-liệu-module-chức-năng-của-hệ-thống.)

[1.3.8 Hệ thống hỗ trợ xử lý các báo cáo trên các công cụ báo cáo hiện đại cho phép khả năng tùy biến bổ sung các báo cáo theo yêu cầu của SSI. [26](#hệ-thống-hỗ-trợ-xử-lý-các-báo-cáo-trên-các-công-cụ-báo-cáo-hiện-đại-cho-phép-khả-năng-tùy-biến-bổ-sung-các-báo-cáo-theo-yêu-cầu-của-ssi.)](#hệ-thống-hỗ-trợ-xử-lý-các-báo-cáo-trên-các-công-cụ-báo-cáo-hiện-đại-cho-phép-khả-năng-tùy-biến-bổ-sung-các-báo-cáo-theo-yêu-cầu-của-ssi.)

[1.3.9 Nhà thầu cung cấp bằng chứng để chứng minh khả năng đáp ứng được các yêu cầu trên. [60](#nhà-thầu-cung-cấp-bằng-chứng-để-chứng-minh-khả-năng-đáp-ứng-được-các-yêu-cầu-trên.)](#nhà-thầu-cung-cấp-bằng-chứng-để-chứng-minh-khả-năng-đáp-ứng-được-các-yêu-cầu-trên.)

[2. Tính sẵn sàng hệ thống [61](#tính-sẵn-sàng-hệ-thống)](#tính-sẵn-sàng-hệ-thống)

[2.1 Hệ thống đề xuất phải có các giải pháp Độ sẵn sàng cao (High Availability - HA) cho tất cả các cấu phần sử dụng công nghệ cluster hoặc ánh xạ (mirroring). Nhà thầu phải mô tả chi tiết giải pháp HA được đề xuất để đảm bảo 99.99% hệ thống sẵn sàng. [61](#hệ-thống-đề-xuất-phải-có-các-giải-pháp-độ-sẵn-sàng-cao-high-availability---ha-cho-tất-cả-các-cấu-phần-sử-dụng-công-nghệ-cluster-hoặc-ánh-xạ-mirroring.-nhà-thầu-phải-mô-tả-chi-tiết-giải-pháp-ha-được-đề-xuất-để-đảm-bảo-99.99-hệ-thống-sẵn-sàng.)](#hệ-thống-đề-xuất-phải-có-các-giải-pháp-độ-sẵn-sàng-cao-high-availability---ha-cho-tất-cả-các-cấu-phần-sử-dụng-công-nghệ-cluster-hoặc-ánh-xạ-mirroring.-nhà-thầu-phải-mô-tả-chi-tiết-giải-pháp-ha-được-đề-xuất-để-đảm-bảo-99.99-hệ-thống-sẵn-sàng.)

[2.2 Hệ thống đảm bảo một trong các thành phần phần cứng bị lỗi không gây ra lỗi toàn bộ thệ thống. [64](#hệ-thống-đảm-bảo-một-trong-các-thành-phần-phần-cứng-bị-lỗi-không-gây-ra-lỗi-toàn-bộ-thệ-thống.)](#hệ-thống-đảm-bảo-một-trong-các-thành-phần-phần-cứng-bị-lỗi-không-gây-ra-lỗi-toàn-bộ-thệ-thống.)

[2.3 Hệ thống đề xuất có thể hỗ trợ các hoạt động 24/7. Đồng thời, hệ thống hỗ trợ đồng bộ hóa dữ liệu thời gian thực và/hoặc theo lô đến các hệ thống khác mà không ảnh hưởng đến hoạt động của hệ thống. [65](#hệ-thống-đề-xuất-có-thể-hỗ-trợ-các-hoạt-động-247.-đồng-thời-hệ-thống-hỗ-trợ-đồng-bộ-hóa-dữ-liệu-thời-gian-thực-vàhoặc-theo-lô-đến-các-hệ-thống-khác-mà-không-ảnh-hưởng-đến-hoạt-động-của-hệ-thống.)](#hệ-thống-đề-xuất-có-thể-hỗ-trợ-các-hoạt-động-247.-đồng-thời-hệ-thống-hỗ-trợ-đồng-bộ-hóa-dữ-liệu-thời-gian-thực-vàhoặc-theo-lô-đến-các-hệ-thống-khác-mà-không-ảnh-hưởng-đến-hoạt-động-của-hệ-thống.)

[2.4 Nhà thầu phải phân tích và nêu rõ các vấn đề có thể ảnh hưởng đến hoạt động liên tục của hệ thống, giải pháp hỗ trợ hoạt động 24/7 cho những vấn đề này. [66](#nhà-thầu-phải-phân-tích-và-nêu-rõ-các-vấn-đề-có-thể-ảnh-hưởng-đến-hoạt-động-liên-tục-của-hệ-thống-giải-pháp-hỗ-trợ-hoạt-động-247-cho-những-vấn-đề-này.)](#nhà-thầu-phải-phân-tích-và-nêu-rõ-các-vấn-đề-có-thể-ảnh-hưởng-đến-hoạt-động-liên-tục-của-hệ-thống-giải-pháp-hỗ-trợ-hoạt-động-247-cho-những-vấn-đề-này.)

[3. Yêu cầu về vận hành [68](#yêu-cầu-về-vận-hành)](#yêu-cầu-về-vận-hành)

[3.1 Với dự án/hệ thống on-cloud [68](#với-dự-ánhệ-thống-on-cloud)](#với-dự-ánhệ-thống-on-cloud)

[3.1.1 Thiết bị đầu cuối [68](#thiết-bị-đầu-cuối)](#thiết-bị-đầu-cuối)

[3.1.2 Các phần mềm/ công cụ cần cài đặt trên máy trạm [74](#các-phần-mềm-công-cụ-cần-cài-đặt-trên-máy-trạm)](#các-phần-mềm-công-cụ-cần-cài-đặt-trên-máy-trạm)

[3.1.3 Quản trị vận hành hệ thống : Không bắt buộc tại các mục từ 2.1.3.1.2 đến mục 2.1.3.2 trong trường hợp Vendor vận hành trực tiếp Dự Án / Hệ thống On-Cloud (IT SSI không tham gia vận hành) [83](#quản-trị-vận-hành-hệ-thống-không-bắt-buộc-tại-các-mục-từ-2.1.3.1.2-đến-mục-2.1.3.2-trong-trường-hợp-vendor-vận-hành-trực-tiếp-dự-án-hệ-thống-on-cloud-it-ssi-không-tham-gia-vận-hành)](#quản-trị-vận-hành-hệ-thống-không-bắt-buộc-tại-các-mục-từ-2.1.3.1.2-đến-mục-2.1.3.2-trong-trường-hợp-vendor-vận-hành-trực-tiếp-dự-án-hệ-thống-on-cloud-it-ssi-không-tham-gia-vận-hành)

[3.1.4 SLA Cam kết về Service Requests và Incident Requests : Bắt buộc trong trường hợp Vendor vận hành trực tiếp Dự Án / Hệ thống On-Cloud (IT SSI không tham gia vận hành) [87](#sla-cam-kết-về-service-requests-và-incident-requests-bắt-buộc-trong-trường-hợp-vendor-vận-hành-trực-tiếp-dự-án-hệ-thống-on-cloud-it-ssi-không-tham-gia-vận-hành)](#sla-cam-kết-về-service-requests-và-incident-requests-bắt-buộc-trong-trường-hợp-vendor-vận-hành-trực-tiếp-dự-án-hệ-thống-on-cloud-it-ssi-không-tham-gia-vận-hành)

[3.1.5 Tài liệu bàn giao : Không bắt buộc trong trường hợp Vendor vận hành trực tiếp Dự Án / Hệ thống On-Cloud (IT SSI không tham gia vận hành) [88](#tài-liệu-bàn-giao-không-bắt-buộc-trong-trường-hợp-vendor-vận-hành-trực-tiếp-dự-án-hệ-thống-on-cloud-it-ssi-không-tham-gia-vận-hành)](#tài-liệu-bàn-giao-không-bắt-buộc-trong-trường-hợp-vendor-vận-hành-trực-tiếp-dự-án-hệ-thống-on-cloud-it-ssi-không-tham-gia-vận-hành)

[3.2 Với dự án/hệ thống on-premise [89](#với-dự-ánhệ-thống-on-premise)](#với-dự-ánhệ-thống-on-premise)

[3.2.1 Máy trạm [89](#máy-trạm)](#máy-trạm)

[3.2.2 Các phần mềm/ công cụ cần cài đặt trên máy trạm [89](#các-phần-mềm-công-cụ-cần-cài-đặt-trên-máy-trạm-1)](#các-phần-mềm-công-cụ-cần-cài-đặt-trên-máy-trạm-1)

[3.2.3 Quản trị vận hành hệ thống [91](#quản-trị-vận-hành-hệ-thống)](#quản-trị-vận-hành-hệ-thống)

[3.2.4 Quản trị vận hành hệ thống [97](#quản-trị-vận-hành-hệ-thống-1)](#quản-trị-vận-hành-hệ-thống-1)

[3.2.5 Services / Incidents Request and SLA [97](#services-incidents-request-and-sla)](#services-incidents-request-and-sla)

[4. Hiệu năng hệ thống [98](#hiệu-năng-hệ-thống)](#hiệu-năng-hệ-thống)

[4.1 Nhà thầu phải cung cấp các phương pháp, công cụ để theo dõi và báo cáo thời gian thực và các bằng chứng để đánh giá hiệu năng và tải làm việc của các cấu phần hệ thống theo ứng dụng, module, cơ sở dữ liệu. [98](#nhà-thầu-phải-cung-cấp-các-phương-pháp-công-cụ-để-theo-dõi-và-báo-cáo-thời-gian-thực-và-các-bằng-chứng-để-đánh-giá-hiệu-năng-và-tải-làm-việc-của-các-cấu-phần-hệ-thống-theo-ứng-dụng-module-cơ-sở-dữ-liệu.)](#nhà-thầu-phải-cung-cấp-các-phương-pháp-công-cụ-để-theo-dõi-và-báo-cáo-thời-gian-thực-và-các-bằng-chứng-để-đánh-giá-hiệu-năng-và-tải-làm-việc-của-các-cấu-phần-hệ-thống-theo-ứng-dụng-module-cơ-sở-dữ-liệu.)

[4.2 Hệ thống có cơ chế để cho phép xử lý các vấn đề về hiệu năng, xác định các điểm nút cổ chai, cũng như khả năng để theo dõi và đo lường hiệu năng hệ thống ở mức giao diện và cấu phần của hệ thống [99](#hệ-thống-có-cơ-chế-để-cho-phép-xử-lý-các-vấn-đề-về-hiệu-năng-xác-định-các-điểm-nút-cổ-chai-cũng-như-khả-năng-để-theo-dõi-và-đo-lường-hiệu-năng-hệ-thống-ở-mức-giao-diện-và-cấu-phần-của-hệ-thống)](#hệ-thống-có-cơ-chế-để-cho-phép-xử-lý-các-vấn-đề-về-hiệu-năng-xác-định-các-điểm-nút-cổ-chai-cũng-như-khả-năng-để-theo-dõi-và-đo-lường-hiệu-năng-hệ-thống-ở-mức-giao-diện-và-cấu-phần-của-hệ-thống)

[4.3 Hệ thống cung cấp các báo cáo và phân tích thống kê liên quan đến hiệu năng, hiệu suất sử dụng, tải v.v... [101](#hệ-thống-cung-cấp-các-báo-cáo-và-phân-tích-thống-kê-liên-quan-đến-hiệu-năng-hiệu-suất-sử-dụng-tải-v.v)](#hệ-thống-cung-cấp-các-báo-cáo-và-phân-tích-thống-kê-liên-quan-đến-hiệu-năng-hiệu-suất-sử-dụng-tải-v.v)

[4.4 Hệ thống phải có khả năng đáp ứng về yêu cầu được mô tả tại phụ lục 01 Thông tin về Sizing, và phải online tại mọi thời điểm mà không offline hoặc chậm trễ trong việc nhập, xử lý, và hiển thị dữ liệu. [103](#hệ-thống-phải-có-khả-năng-đáp-ứng-về-yêu-cầu-được-mô-tả-tại-phụ-lục-01-thông-tin-về-sizing-và-phải-online-tại-mọi-thời-điểm-mà-không-offline-hoặc-chậm-trễ-trong-việc-nhập-xử-lý-và-hiển-thị-dữ-liệu.)](#hệ-thống-phải-có-khả-năng-đáp-ứng-về-yêu-cầu-được-mô-tả-tại-phụ-lục-01-thông-tin-về-sizing-và-phải-online-tại-mọi-thời-điểm-mà-không-offline-hoặc-chậm-trễ-trong-việc-nhập-xử-lý-và-hiển-thị-dữ-liệu.)

[4.5 Hệ thống phải có khả năng hoạt động liên tục trong ít nhất 6 tháng mà không cần khởi động lại hệ thống. [103](#hệ-thống-phải-có-khả-năng-hoạt-động-liên-tục-trong-ít-nhất-6-tháng-mà-không-cần-khởi-động-lại-hệ-thống.)](#hệ-thống-phải-có-khả-năng-hoạt-động-liên-tục-trong-ít-nhất-6-tháng-mà-không-cần-khởi-động-lại-hệ-thống.)

[4.6 Hệ thống cho phép cấu hình các ngưỡng hiệu năng và cảnh báo quản trị viên khi hiệu năng vượt quá ngưỡng được xác định trước. [103](#hệ-thống-cho-phép-cấu-hình-các-ngưỡng-hiệu-năng-và-cảnh-báo-quản-trị-viên-khi-hiệu-năng-vượt-quá-ngưỡng-được-xác-định-trước.)](#hệ-thống-cho-phép-cấu-hình-các-ngưỡng-hiệu-năng-và-cảnh-báo-quản-trị-viên-khi-hiệu-năng-vượt-quá-ngưỡng-được-xác-định-trước.)

[4.7 Hệ thống phải đề xuất mô hình scale up, scale out của toàn bộ hệ thống để bảo toàn hiệu năng định trước. [103](#hệ-thống-phải-đề-xuất-mô-hình-scale-up-scale-out-của-toàn-bộ-hệ-thống-để-bảo-toàn-hiệu-năng-định-trước.)](#hệ-thống-phải-đề-xuất-mô-hình-scale-up-scale-out-của-toàn-bộ-hệ-thống-để-bảo-toàn-hiệu-năng-định-trước.)

[5. Giao diện UI/UX [104](#giao-diện-uiux)](#giao-diện-uiux)

[5.1 Màu sắc, thiết kế của hệ thống được thiết kế phù hợp với văn hóa nội bộ của SSI. Thiết kế phải được phê duyệt bởi SSI trước khi thực hiện. [104](#màu-sắc-thiết-kế-của-hệ-thống-được-thiết-kế-phù-hợp-với-văn-hóa-nội-bộ-của-ssi.-thiết-kế-phải-được-phê-duyệt-bởi-ssi-trước-khi-thực-hiện.)](#màu-sắc-thiết-kế-của-hệ-thống-được-thiết-kế-phù-hợp-với-văn-hóa-nội-bộ-của-ssi.-thiết-kế-phải-được-phê-duyệt-bởi-ssi-trước-khi-thực-hiện.)

[5.2 Hệ thống cho phép trong việc tùy biến giao diện, layout, button, hình ảnh, màu sắc,...Giao diện được xây dựng theo định hướng thân thiện, dễ sử dụng với người dùng cuối. [104](#hệ-thống-cho-phép-trong-việc-tùy-biến-giao-diện-layout-button-hình-ảnh-màu-sắcgiao-diện-được-xây-dựng-theo-định-hướng-thân-thiện-dễ-sử-dụng-với-người-dùng-cuối.)](#hệ-thống-cho-phép-trong-việc-tùy-biến-giao-diện-layout-button-hình-ảnh-màu-sắcgiao-diện-được-xây-dựng-theo-định-hướng-thân-thiện-dễ-sử-dụng-với-người-dùng-cuối.)

[5.3 Hệ thống cho phép người dùng xem thông tin/ nội dung tài liệu trên một giao diện. [108](#hệ-thống-cho-phép-người-dùng-xem-thông-tin-nội-dung-tài-liệu-trên-một-giao-diện.)](#hệ-thống-cho-phép-người-dùng-xem-thông-tin-nội-dung-tài-liệu-trên-một-giao-diện.)

[5.4 Giao diện hệ thống hỗ trợ đường dẫn điều hướng (navigation) nhằm hỗ trợ NSD xác định giao diện đang tương tác. Đường dẫn cho phép NSD tương tác để về các trang cha (parent) trước đó.. [108](#giao-diện-hệ-thống-hỗ-trợ-đường-dẫn-điều-hướng-navigation-nhằm-hỗ-trợ-nsd-xác-định-giao-diện-đang-tương-tác.-đường-dẫn-cho-phép-nsd-tương-tác-để-về-các-trang-cha-parent-trước-đó..)](#giao-diện-hệ-thống-hỗ-trợ-đường-dẫn-điều-hướng-navigation-nhằm-hỗ-trợ-nsd-xác-định-giao-diện-đang-tương-tác.-đường-dẫn-cho-phép-nsd-tương-tác-để-về-các-trang-cha-parent-trước-đó..)

[6. API [109](#api)](#api)

[6.1 Yêu cầu chung [109](#yêu-cầu-chung)](#yêu-cầu-chung)

[6.1.1 Hệ thống cho phép quản lý API key để phân quyền truy cập APIs và theo dõi tích hợp (Generate key mới, sửa, xóa) [109](#hệ-thống-cho-phép-quản-lý-api-key-để-phân-quyền-truy-cập-apis-và-theo-dõi-tích-hợp-generate-key-mới-sửa-xóa)](#hệ-thống-cho-phép-quản-lý-api-key-để-phân-quyền-truy-cập-apis-và-theo-dõi-tích-hợp-generate-key-mới-sửa-xóa)

[6.1.2 API phải tuân thủ các tiêu chuẩn bảo mật, bao gồm mã hóa dữ liệu và xác thực. [109](#api-phải-tuân-thủ-các-tiêu-chuẩn-bảo-mật-bao-gồm-mã-hóa-dữ-liệu-và-xác-thực.)](#api-phải-tuân-thủ-các-tiêu-chuẩn-bảo-mật-bao-gồm-mã-hóa-dữ-liệu-và-xác-thực.)

[6.1.3 API phải đảm bảo hiệu suất cao, với thời gian phản hồi nhanh và khả năng xử lý tải lớn. Theo dõi sheet 1.Sizing [110](#api-phải-đảm-bảo-hiệu-suất-cao-với-thời-gian-phản-hồi-nhanh-và-khả-năng-xử-lý-tải-lớn.-theo-dõi-sheet-1.sizing)](#api-phải-đảm-bảo-hiệu-suất-cao-với-thời-gian-phản-hồi-nhanh-và-khả-năng-xử-lý-tải-lớn.-theo-dõi-sheet-1.sizing)

[6.1.4 Nhà thầu phải cung cấp tài liệu chi tiết về thiết kế, cách sử dụng và tích hợp API. [110](#nhà-thầu-phải-cung-cấp-tài-liệu-chi-tiết-về-thiết-kế-cách-sử-dụng-và-tích-hợp-api.)](#nhà-thầu-phải-cung-cấp-tài-liệu-chi-tiết-về-thiết-kế-cách-sử-dụng-và-tích-hợp-api.)

[6.2 Danh sách API tích hợp lấy thông tin từ HRM (GET) (tối thiểu và có thể phát sinh theo nhu cầu nghiệp vụ) [113](#danh-sách-api-tích-hợp-lấy-thông-tin-từ-hrm-get-tối-thiểu-và-có-thể-phát-sinh-theo-nhu-cầu-nghiệp-vụ)](#danh-sách-api-tích-hợp-lấy-thông-tin-từ-hrm-get-tối-thiểu-và-có-thể-phát-sinh-theo-nhu-cầu-nghiệp-vụ)

[6.2.1 Nhà thầu cung cấp API lấy thông tin cơ cấu tổ chức và người quản lý đơn vị theo phân cấp: phòng ban, công ty, chi nhánh, văn phòng giao dịch, danh sách và số lượng nhân viên theo từng cấu phần tổ chức. [114](#nhà-thầu-cung-cấp-api-lấy-thông-tin-cơ-cấu-tổ-chức-và-người-quản-lý-đơn-vị-theo-phân-cấp-phòng-ban-công-ty-chi-nhánh-văn-phòng-giao-dịch-danh-sách-và-số-lượng-nhân-viên-theo-từng-cấu-phần-tổ-chức.)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-cơ-cấu-tổ-chức-và-người-quản-lý-đơn-vị-theo-phân-cấp-phòng-ban-công-ty-chi-nhánh-văn-phòng-giao-dịch-danh-sách-và-số-lượng-nhân-viên-theo-từng-cấu-phần-tổ-chức.)

[6.2.2 Nhà thầu cung cấp API lấy thông tin nhân viên theo mã nhân viên, username hoặc toàn bộ nhân viên. Lấy ra dữ liệu thông tin công việc và tổ chức (chức danh, cấp bậc, phòng ban,..), thông tin cá nhân (địa chỉ, CCCD,\...), quá trình làm việc và một số thông tin khác có thể khai thác được trên hồ sơ nhân viên [115](#nhà-thầu-cung-cấp-api-lấy-thông-tin-nhân-viên-theo-mã-nhân-viên-username-hoặc-toàn-bộ-nhân-viên.-lấy-ra-dữ-liệu-thông-tin-công-việc-và-tổ-chức-chức-danh-cấp-bậc-phòng-ban..-thông-tin-cá-nhân-địa-chỉ-cccd...-quá-trình-làm-việc-và-một-số-thông-tin-khác-có-thể-khai-thác-được-trên-hồ-sơ-nhân-viên)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-nhân-viên-theo-mã-nhân-viên-username-hoặc-toàn-bộ-nhân-viên.-lấy-ra-dữ-liệu-thông-tin-công-việc-và-tổ-chức-chức-danh-cấp-bậc-phòng-ban..-thông-tin-cá-nhân-địa-chỉ-cccd...-quá-trình-làm-việc-và-một-số-thông-tin-khác-có-thể-khai-thác-được-trên-hồ-sơ-nhân-viên)

[6.2.3 Nhà thầu cung cấp API lấy thông tin ứng viên theo mã nhân viên, username hoặc toàn bộ ứng viên [116](#nhà-thầu-cung-cấp-api-lấy-thông-tin-ứng-viên-theo-mã-nhân-viên-username-hoặc-toàn-bộ-ứng-viên)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-ứng-viên-theo-mã-nhân-viên-username-hoặc-toàn-bộ-ứng-viên)

[6.2.4 Nhà thầu cung cấp API lấy thông tin danh sách chức danh/cấp bậc/vị trí [116](#nhà-thầu-cung-cấp-api-lấy-thông-tin-danh-sách-chức-danhcấp-bậcvị-trí)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-danh-sách-chức-danhcấp-bậcvị-trí)

[6.2.5 Nhà thầu cung cấp API lấy thông tin bảng công theo ngày (từ đến), mã nhân viên, username, phòng ban hoặc toàn bộ nhân viên. Lấy ra dữ liệu: ngày, công chuẩn, chấm công thực tế, công tính lương, ca làm việc [117](#nhà-thầu-cung-cấp-api-lấy-thông-tin-bảng-công-theo-ngày-từ-đến-mã-nhân-viên-username-phòng-ban-hoặc-toàn-bộ-nhân-viên.-lấy-ra-dữ-liệu-ngày-công-chuẩn-chấm-công-thực-tế-công-tính-lương-ca-làm-việc)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-bảng-công-theo-ngày-từ-đến-mã-nhân-viên-username-phòng-ban-hoặc-toàn-bộ-nhân-viên.-lấy-ra-dữ-liệu-ngày-công-chuẩn-chấm-công-thực-tế-công-tính-lương-ca-làm-việc)

[6.2.6 Nhà thầu cung cấp API lấy thông tin chi phí lương & các khoản trích (cấu phần) theo lương (BH, Thuế, phúc lợi) theo nhân viên [117](#nhà-thầu-cung-cấp-api-lấy-thông-tin-chi-phí-lương-các-khoản-trích-cấu-phần-theo-lương-bh-thuế-phúc-lợi-theo-nhân-viên)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-chi-phí-lương-các-khoản-trích-cấu-phần-theo-lương-bh-thuế-phúc-lợi-theo-nhân-viên)

[6.2.7 Nhà thầu cung cấp API lấy thông tin phiếu lương theo kỳ, mã nhân viên/username. Có mã hóa thông tin đầu cuối theo key được cung cấp. [118](#nhà-thầu-cung-cấp-api-lấy-thông-tin-phiếu-lương-theo-kỳ-mã-nhân-viênusername.-có-mã-hóa-thông-tin-đầu-cuối-theo-key-được-cung-cấp.)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-phiếu-lương-theo-kỳ-mã-nhân-viênusername.-có-mã-hóa-thông-tin-đầu-cuối-theo-key-được-cung-cấp.)

[6.2.8 Nhà thầu cung cấp API lấy thông tin cấu hình công, ca, holiday. [118](#nhà-thầu-cung-cấp-api-lấy-thông-tin-cấu-hình-công-ca-holiday.)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-cấu-hình-công-ca-holiday.)

[6.2.9 Nhà thầu cung cấp API lấy thông tin cấu hình danh sách loại nghỉ phép, nghỉ chế độ, công tác, OT, WFH,\... [119](#nhà-thầu-cung-cấp-api-lấy-thông-tin-cấu-hình-danh-sách-loại-nghỉ-phép-nghỉ-chế-độ-công-tác-ot-wfh...)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-cấu-hình-danh-sách-loại-nghỉ-phép-nghỉ-chế-độ-công-tác-ot-wfh...)

[6.2.10 Nhà thầu cung cấp API lấy thông tin danh sách nghỉ phép/công tác/OT theo công ty / đơn vị / nhân viên/ chức danh [120](#nhà-thầu-cung-cấp-api-lấy-thông-tin-danh-sách-nghỉ-phépcông-tácot-theo-công-ty-đơn-vị-nhân-viên-chức-danh)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-danh-sách-nghỉ-phépcông-tácot-theo-công-ty-đơn-vị-nhân-viên-chức-danh)

[6.2.11 Nhà thầu cung cấp API lấy thông tin quỹ phép còn lại cho trường hợp nghỉ phép, nghỉ chế độ, công tác, OT, WFH\... Theo ngày (từ đến), mã nhân viên, username, phòng ban hoặc toàn bộ nhân viên. Lấy ra dữ liệu: Nhân viên, loại phép, Số phép đã sử dụng, số phép còn hạn, số phép hết hạn, số phép chuyển năm, tổng cộng [121](#nhà-thầu-cung-cấp-api-lấy-thông-tin-quỹ-phép-còn-lại-cho-trường-hợp-nghỉ-phép-nghỉ-chế-độ-công-tác-ot-wfh...-theo-ngày-từ-đến-mã-nhân-viên-username-phòng-ban-hoặc-toàn-bộ-nhân-viên.-lấy-ra-dữ-liệu-nhân-viên-loại-phép-số-phép-đã-sử-dụng-số-phép-còn-hạn-số-phép-hết-hạn-số-phép-chuyển-năm-tổng-cộng)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-quỹ-phép-còn-lại-cho-trường-hợp-nghỉ-phép-nghỉ-chế-độ-công-tác-ot-wfh...-theo-ngày-từ-đến-mã-nhân-viên-username-phòng-ban-hoặc-toàn-bộ-nhân-viên.-lấy-ra-dữ-liệu-nhân-viên-loại-phép-số-phép-đã-sử-dụng-số-phép-còn-hạn-số-phép-hết-hạn-số-phép-chuyển-năm-tổng-cộng)

[6.2.12 Nhà thầu cung cấp API lấy thông tin quyết toán thôi việc: các chi phí chi trả cho nhân sự khi nghỉ việc [121](#nhà-thầu-cung-cấp-api-lấy-thông-tin-quyết-toán-thôi-việc-các-chi-phí-chi-trả-cho-nhân-sự-khi-nghỉ-việc)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-quyết-toán-thôi-việc-các-chi-phí-chi-trả-cho-nhân-sự-khi-nghỉ-việc)

[6.2.13 Nhà thầu cung cấp API lấy thông tin Esop của nhân sự khi thôi việc (QĐ, phiếu chuyển nhượng, bảng tính số tiền Esop được nhận \...) [121](#nhà-thầu-cung-cấp-api-lấy-thông-tin-esop-của-nhân-sự-khi-thôi-việc-qđ-phiếu-chuyển-nhượng-bảng-tính-số-tiền-esop-được-nhận-...)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-esop-của-nhân-sự-khi-thôi-việc-qđ-phiếu-chuyển-nhượng-bảng-tính-số-tiền-esop-được-nhận-...)

[6.2.14 Nhà thầu cung cấp API lấy thông tin hạn mức tuyển dụng còn lại theo công ty/phòng ban/vị trí [122](#nhà-thầu-cung-cấp-api-lấy-thông-tin-hạn-mức-tuyển-dụng-còn-lại-theo-công-typhòng-banvị-trí)](#nhà-thầu-cung-cấp-api-lấy-thông-tin-hạn-mức-tuyển-dụng-còn-lại-theo-công-typhòng-banvị-trí)

[6.3 Danh sách API tích hợp đồng bộ thông tin sang HRM (POST/PUT) (tối thiểu và có thể phát sinh theo nhu cầu nghiệp vụ) [122](#danh-sách-api-tích-hợp-đồng-bộ-thông-tin-sang-hrm-postput-tối-thiểu-và-có-thể-phát-sinh-theo-nhu-cầu-nghiệp-vụ)](#danh-sách-api-tích-hợp-đồng-bộ-thông-tin-sang-hrm-postput-tối-thiểu-và-có-thể-phát-sinh-theo-nhu-cầu-nghiệp-vụ)

[6.3.1 Nhà thầu cung cấp API cập nhật thông tin nghỉ phép cho nhân viên theo mã nhân viên / username, loại nghỉ phép, nghỉ chế độ, công tác, OT, WFH.. ngày request (từ-dến) [123](#nhà-thầu-cung-cấp-api-cập-nhật-thông-tin-nghỉ-phép-cho-nhân-viên-theo-mã-nhân-viên-username-loại-nghỉ-phép-nghỉ-chế-độ-công-tác-ot-wfh..-ngày-request-từ-dến)](#nhà-thầu-cung-cấp-api-cập-nhật-thông-tin-nghỉ-phép-cho-nhân-viên-theo-mã-nhân-viên-username-loại-nghỉ-phép-nghỉ-chế-độ-công-tác-ot-wfh..-ngày-request-từ-dến)

[6.3.2 Nhà thầu cung cấp API cập nhật thông tin cá nhân của nhân viên theo mã nhân viên/ username, thông tin được phép cập nhật bao gồm: thông tin cá nhân, liên hệ, học vấn, nhân thân, quá trình công tác tại đơn vị khác,\... [123](#nhà-thầu-cung-cấp-api-cập-nhật-thông-tin-cá-nhân-của-nhân-viên-theo-mã-nhân-viên-username-thông-tin-được-phép-cập-nhật-bao-gồm-thông-tin-cá-nhân-liên-hệ-học-vấn-nhân-thân-quá-trình-công-tác-tại-đơn-vị-khác...)](#nhà-thầu-cung-cấp-api-cập-nhật-thông-tin-cá-nhân-của-nhân-viên-theo-mã-nhân-viên-username-thông-tin-được-phép-cập-nhật-bao-gồm-thông-tin-cá-nhân-liên-hệ-học-vấn-nhân-thân-quá-trình-công-tác-tại-đơn-vị-khác...)

[6.3.3 Nhà thầu cung cấp API cập nhật các trường hợp nhân viên muốn ủy quyền quyết toán thuế cho công ty [124](#nhà-thầu-cung-cấp-api-cập-nhật-các-trường-hợp-nhân-viên-muốn-ủy-quyền-quyết-toán-thuế-cho-công-ty)](#nhà-thầu-cung-cấp-api-cập-nhật-các-trường-hợp-nhân-viên-muốn-ủy-quyền-quyết-toán-thuế-cho-công-ty)

[6.3.4 Nhà thầu cung cấp API cập nhật Kết quả đánh giá HQCV theo mã nhân viên/username hoặc phòng ban, theo kỳ đánh giá. [124](#nhà-thầu-cung-cấp-api-cập-nhật-kết-quả-đánh-giá-hqcv-theo-mã-nhân-viênusername-hoặc-phòng-ban-theo-kỳ-đánh-giá.)](#nhà-thầu-cung-cấp-api-cập-nhật-kết-quả-đánh-giá-hqcv-theo-mã-nhân-viênusername-hoặc-phòng-ban-theo-kỳ-đánh-giá.)

[6.3.5 Nhà thầu cung cấp API nhận thông tin Kết quả đánh giá HQCV theo mã nhân viên/username hoặc phòng ban, theo kỳ đánh giá. [124](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-đánh-giá-hqcv-theo-mã-nhân-viênusername-hoặc-phòng-ban-theo-kỳ-đánh-giá.)](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-đánh-giá-hqcv-theo-mã-nhân-viênusername-hoặc-phòng-ban-theo-kỳ-đánh-giá.)

[6.3.6 Nhà thầu cung cấp API nhận thông tin Kết quả học tập, giảng dạy: list khóa học hoàn thành theo nhân viên (nếu có quản lý) [125](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-học-tập-giảng-dạy-list-khóa-học-hoàn-thành-theo-nhân-viên-nếu-có-quản-lý)](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-học-tập-giảng-dạy-list-khóa-học-hoàn-thành-theo-nhân-viên-nếu-có-quản-lý)

[6.3.7 Nhà thầu cung cấp API nhận thông tin Kết quả các Đợt thi độc lập: Điểm tổng hợp kỳ thi phân bậc của nhân viên theo đợt / năm [125](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-các-đợt-thi-độc-lập-điểm-tổng-hợp-kỳ-thi-phân-bậc-của-nhân-viên-theo-đợt-năm)](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-các-đợt-thi-độc-lập-điểm-tổng-hợp-kỳ-thi-phân-bậc-của-nhân-viên-theo-đợt-năm)

[6.3.8 Nhà thầu cung cấp API nhận thông tin Kết quả hoàn thành KPI Đào tạo: số giờ học, giảng dạy đã hoàn thành theo năm của từng nhân viên [126](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-hoàn-thành-kpi-đào-tạo-số-giờ-học-giảng-dạy-đã-hoàn-thành-theo-năm-của-từng-nhân-viên)](#nhà-thầu-cung-cấp-api-nhận-thông-tin-kết-quả-hoàn-thành-kpi-đào-tạo-số-giờ-học-giảng-dạy-đã-hoàn-thành-theo-năm-của-từng-nhân-viên)

[6.3.9 Nhà thầu cung cấp API cập nhật thông tin đề xuất tuyển dụng sang HRM: vị trí tuyển dụng, số lượng, công ty, phòng ban bao gồm tạo mới, cập nhật, hủy đề xuất [126](#nhà-thầu-cung-cấp-api-cập-nhật-thông-tin-đề-xuất-tuyển-dụng-sang-hrm-vị-trí-tuyển-dụng-số-lượng-công-ty-phòng-ban-bao-gồm-tạo-mới-cập-nhật-hủy-đề-xuất)](#nhà-thầu-cung-cấp-api-cập-nhật-thông-tin-đề-xuất-tuyển-dụng-sang-hrm-vị-trí-tuyển-dụng-số-lượng-công-ty-phòng-ban-bao-gồm-tạo-mới-cập-nhật-hủy-đề-xuất)

[6.3.10 Nhà thầu sẵn sàng tích hợp với API có sẵn của hệ thống nội bộ SSI cho nghiệp vụ xuất chứng từ khấu trừ thuế của nhân viên [127](#nhà-thầu-sẵn-sàng-tích-hợp-với-api-có-sẵn-của-hệ-thống-nội-bộ-ssi-cho-nghiệp-vụ-xuất-chứng-từ-khấu-trừ-thuế-của-nhân-viên)](#nhà-thầu-sẵn-sàng-tích-hợp-với-api-có-sẵn-của-hệ-thống-nội-bộ-ssi-cho-nghiệp-vụ-xuất-chứng-từ-khấu-trừ-thuế-của-nhân-viên)

[7. SRE [128](#sre)](#sre)

[7.1 Architecture [128](#architecture)](#architecture)

[7.1.1 Hệ thống phải hỗ trợ containerization (Docker/Kubernetes hoặc tương đương) [128](#hệ-thống-phải-hỗ-trợ-containerization-dockerkubernetes-hoặc-tương-đương)](#hệ-thống-phải-hỗ-trợ-containerization-dockerkubernetes-hoặc-tương-đương)

[7.1.2 Nếu không dùng container, việc triển khai phải được tự động [129](#nếu-không-dùng-container-việc-triển-khai-phải-được-tự-động)](#nếu-không-dùng-container-việc-triển-khai-phải-được-tự-động)

[7.1.3 Nếu triển khai trên cloud, việc cấp phát hạ tầng phải được thực hiện bằng Terraform hoặc công cụ IaC tương đương [130](#nếu-triển-khai-trên-cloud-việc-cấp-phát-hạ-tầng-phải-được-thực-hiện-bằng-terraform-hoặc-công-cụ-iac-tương-đương)](#nếu-triển-khai-trên-cloud-việc-cấp-phát-hạ-tầng-phải-được-thực-hiện-bằng-terraform-hoặc-công-cụ-iac-tương-đương)

[7.1.4 Cung cấp sơ đồ Logical Architecture cho Production và HA/DR [131](#cung-cấp-sơ-đồ-logical-architecture-cho-production-và-hadr)](#cung-cấp-sơ-đồ-logical-architecture-cho-production-và-hadr)

[7.1.5 Cung cấp sơ đồ Physical Deployment cho Production và HA/DR [132](#cung-cấp-sơ-đồ-physical-deployment-cho-production-và-hadr)](#cung-cấp-sơ-đồ-physical-deployment-cho-production-và-hadr)

[7.1.6 Định nghĩa giả định về sizing tài nguyên hệ thống (số lượng user dự kiến, TPS, dung lượng dữ liệu) [133](#định-nghĩa-giả-định-về-sizing-tài-nguyên-hệ-thống-số-lượng-user-dự-kiến-tps-dung-lượng-dữ-liệu)](#định-nghĩa-giả-định-về-sizing-tài-nguyên-hệ-thống-số-lượng-user-dự-kiến-tps-dung-lượng-dữ-liệu)

[7.1.7 Architecture phải bao gồm LB, WAF, App/API, DB, Monitoring, Logging [134](#architecture-phải-bao-gồm-lb-waf-appapi-db-monitoring-logging)](#architecture-phải-bao-gồm-lb-waf-appapi-db-monitoring-logging)

[7.1.8 Cung cấp luồng request end-to-end (User → LB → App → DB → Observability) [135](#cung-cấp-luồng-request-end-to-end-user-lb-app-db-observability)](#cung-cấp-luồng-request-end-to-end-user-lb-app-db-observability)

[7.2 CI/CD [136](#cicd)](#cicd)

[7.2.1 Cung cấp sơ đồ CI/CD pipeline [136](#cung-cấp-sơ-đồ-cicd-pipeline)](#cung-cấp-sơ-đồ-cicd-pipeline)

[7.2.2 Pipeline phải bao gồm Build, Security Scan (SAST/Dependency), Test, Deploy [137](#pipeline-phải-bao-gồm-build-security-scan-sastdependency-test-deploy)](#pipeline-phải-bao-gồm-build-security-scan-sastdependency-test-deploy)

[7.2.3 Pipeline phải hỗ trợ các môi trường DEV, UAT, PROD [138](#pipeline-phải-hỗ-trợ-các-môi-trường-dev-uat-prod)](#pipeline-phải-hỗ-trợ-các-môi-trường-dev-uat-prod)

[7.2.4 Yêu cầu approval gate trước khi triển khai lên Production [139](#yêu-cầu-approval-gate-trước-khi-triển-khai-lên-production)](#yêu-cầu-approval-gate-trước-khi-triển-khai-lên-production)

[7.2.5 Cung cấp chiến lược triển khai (Rolling / Blue-Green / Canary) [139](#cung-cấp-chiến-lược-triển-khai-rolling-blue-green-canary)](#cung-cấp-chiến-lược-triển-khai-rolling-blue-green-canary)

[7.2.6 Hỗ trợ triển khai zero-downtime [141](#hỗ-trợ-triển-khai-zero-downtime)](#hỗ-trợ-triển-khai-zero-downtime)

[7.2.7 Định nghĩa điều kiện và quy trình rollback [141](#định-nghĩa-điều-kiện-và-quy-trình-rollback)](#định-nghĩa-điều-kiện-và-quy-trình-rollback)

[7.2.8 Hỗ trợ rollback cho cả application và database schema [142](#hỗ-trợ-rollback-cho-cả-application-và-database-schema)](#hỗ-trợ-rollback-cho-cả-application-và-database-schema)

[7.3 Backup & DR [143](#backup-dr)](#backup-dr)

[7.3.1 Định nghĩa RTO/RPO cho Application, Database, và File storage [143](#định-nghĩa-rtorpo-cho-application-database-và-file-storage)](#định-nghĩa-rtorpo-cho-application-database-và-file-storage)

[7.3.2 Hỗ trợ full backup và incremental backup với lịch trình xác định [143](#hỗ-trợ-full-backup-và-incremental-backup-với-lịch-trình-xác-định)](#hỗ-trợ-full-backup-và-incremental-backup-với-lịch-trình-xác-định)

[7.3.3 Backup phải được mã hóa at rest [144](#backup-phải-được-mã-hóa-at-rest)](#backup-phải-được-mã-hóa-at-rest)

[7.3.4 Thực hiện DR drill định kỳ và cung cấp bằng chứng [145](#thực-hiện-dr-drill-định-kỳ-và-cung-cấp-bằng-chứng)](#thực-hiện-dr-drill-định-kỳ-và-cung-cấp-bằng-chứng)

[7.4 Security & SRE [146](#security-sre)](#security-sre)

[7.4.1 Định nghĩa RTO/RPO cho Application, Database, và File storage [146](#định-nghĩa-rtorpo-cho-application-database-và-file-storage-1)](#định-nghĩa-rtorpo-cho-application-database-và-file-storage-1)

[7.4.2 Hỗ trợ full backup và incremental backup với lịch trình xác định [147](#hỗ-trợ-full-backup-và-incremental-backup-với-lịch-trình-xác-định-1)](#hỗ-trợ-full-backup-và-incremental-backup-với-lịch-trình-xác-định-1)

[7.4.3 Backup phải được mã hóa at rest [148](#backup-phải-được-mã-hóa-at-rest-1)](#backup-phải-được-mã-hóa-at-rest-1)

[7.4.4 Thực hiện DR drill định kỳ và cung cấp bằng chứng [149](#thực-hiện-dr-drill-định-kỳ-và-cung-cấp-bằng-chứng-1)](#thực-hiện-dr-drill-định-kỳ-và-cung-cấp-bằng-chứng-1)

[7.4.5 Định nghĩa SLO và error budget [150](#định-nghĩa-slo-và-error-budget)](#định-nghĩa-slo-và-error-budget)

[7.4.6 Cung cấp quy trình incident response và escalation [151](#cung-cấp-quy-trình-incident-response-và-escalation)](#cung-cấp-quy-trình-incident-response-và-escalation)

[7.4.7 Cung cấp quy trình postmortem (RCA) [152](#cung-cấp-quy-trình-postmortem-rca)](#cung-cấp-quy-trình-postmortem-rca)

[7.5 Observability [153](#observability)](#observability)

[7.5.1 Giám sát availability, latency (P95/P99), error rate, resource usage [153](#giám-sát-availability-latency-p95p99-error-rate-resource-usage)](#giám-sát-availability-latency-p95p99-error-rate-resource-usage)

[7.5.2 Cung cấp công cụ monitoring và khả năng tích hợp (Prometheus/Grafana/\...) [154](#cung-cấp-công-cụ-monitoring-và-khả-năng-tích-hợp-prometheusgrafana...)](#cung-cấp-công-cụ-monitoring-và-khả-năng-tích-hợp-prometheusgrafana...)

[7.5.3 Centralized logging với log levels chuẩn và correlation ID [155](#centralized-logging-với-log-levels-chuẩn-và-correlation-id)](#centralized-logging-với-log-levels-chuẩn-và-correlation-id)

[7.5.4 Định nghĩa chính sách lưu trữ log (online và archive) [156](#định-nghĩa-chính-sách-lưu-trữ-log-online-và-archive)](#định-nghĩa-chính-sách-lưu-trữ-log-online-và-archive)

[7.5.5 Cung cấp quyền truy cập log (read-only) và giao diện log explorer cho SSI IT [157](#cung-cấp-quyền-truy-cập-log-read-only-và-giao-diện-log-explorer-cho-ssi-it)](#cung-cấp-quyền-truy-cập-log-read-only-và-giao-diện-log-explorer-cho-ssi-it)

[7.5.6 Hỗ trợ distributed tracing (OpenTelemetry/Jaeger hoặc tương đương) [158](#hỗ-trợ-distributed-tracing-opentelemetryjaeger-hoặc-tương-đương)](#hỗ-trợ-distributed-tracing-opentelemetryjaeger-hoặc-tương-đương)

[Hệ thống hỗ trợ [158](#hệ-thống-hỗ-trợ-14)](#hệ-thống-hỗ-trợ-14)

[8. Tổng thể hệ thống (PHỤ LỤC 4.2: YÊU CẦU KỸ THUẬT) [159](#tổng-thể-hệ-thống-phụ-lục-4.2-yêu-cầu-kỹ-thuật)](#tổng-thể-hệ-thống-phụ-lục-4.2-yêu-cầu-kỹ-thuật)

[8.1 Yêu cầu chung [159](#yêu-cầu-chung-1)](#yêu-cầu-chung-1)

[8.1.1 \[Đáp ứng\] Nhà thầu mô tả tổng thể về giải pháp đề xuất và những ưu việt về mặt công nghệ so với các giải pháp khác trên thị trường, bao gồm nhưng không giới hạn các lĩnh vực sau đây: Kiến trúc giải pháp và nền tảng công nghệ; Tính thân thiện với người sử dụng; Sẵn sàng tích hợp với các hệ thống khác; Hỗ trợ kiến trúc hướng dịch vụ SOA; Dễ dàng trong công tác vận hành và quản trị hệ thống; Đảm bảo an toàn, bảo mật hệ thống; Tính ổn định; Tính linh hoạt trong việc đáp ứng các yêu cầu thay đổi trong tương lai; Khả năng mở rộng để đáp ứng các nhu cầu tăng trưởng của SSI; Đáp ứng hiệu năng của hệ thống và tăng trưởng dung lượng hàng năm; Khả năng làm chủ công nghệ của SSI; Lộ trình phát triển sản phẩm và các nâng cấp/ phát hành phiên bản mới trong tương lai. Khả năng ghi log lỗi rõ ràng, cấu hình các mức hiển thị lỗi khi cần để thực hiện trace lỗi [159](#đáp-ứng-nhà-thầu-mô-tả-tổng-thể-về-giải-pháp-đề-xuất-và-những-ưu-việt-về-mặt-công-nghệ-so-với-các-giải-pháp-khác-trên-thị-trường-bao-gồm-nhưng-không-giới-hạn-các-lĩnh-vực-sau-đây-kiến-trúc-giải-pháp-và-nền-tảng-công-nghệ-tính-thân-thiện-với-người-sử-dụng-sẵn-sàng-tích-hợp-với-các-hệ-thống-khác-hỗ-trợ-kiến-trúc-hướng-dịch-vụ-soa-dễ-dàng-trong-công-tác-vận-hành-và-quản-trị-hệ-thống-đảm-bảo-an-toàn-bảo-mật-hệ-thống-tính-ổn-định-tính-linh-hoạt-trong-việc-đáp-ứng-các-yêu-cầu-thay-đổi-trong-tương-lai-khả-năng-mở-rộng-để-đáp-ứng-các-nhu-cầu-tăng-trưởng-của-ssi-đáp-ứng-hiệu-năng-của-hệ-thống-và-tăng-trưởng-dung-lượng-hàng-năm-khả-năng-làm-chủ-công-nghệ-của-ssi-lộ-trình-phát-triển-sản-phẩm-và-các-nâng-cấp-phát-hành-phiên-bản-mới-trong-tương-lai.-khả-năng-ghi-log-lỗi-rõ-ràng-cấu-hình-các-mức-hiển-thị-lỗi-khi-cần-để-thực-hiện-trace-lỗi)](#đáp-ứng-nhà-thầu-mô-tả-tổng-thể-về-giải-pháp-đề-xuất-và-những-ưu-việt-về-mặt-công-nghệ-so-với-các-giải-pháp-khác-trên-thị-trường-bao-gồm-nhưng-không-giới-hạn-các-lĩnh-vực-sau-đây-kiến-trúc-giải-pháp-và-nền-tảng-công-nghệ-tính-thân-thiện-với-người-sử-dụng-sẵn-sàng-tích-hợp-với-các-hệ-thống-khác-hỗ-trợ-kiến-trúc-hướng-dịch-vụ-soa-dễ-dàng-trong-công-tác-vận-hành-và-quản-trị-hệ-thống-đảm-bảo-an-toàn-bảo-mật-hệ-thống-tính-ổn-định-tính-linh-hoạt-trong-việc-đáp-ứng-các-yêu-cầu-thay-đổi-trong-tương-lai-khả-năng-mở-rộng-để-đáp-ứng-các-nhu-cầu-tăng-trưởng-của-ssi-đáp-ứng-hiệu-năng-của-hệ-thống-và-tăng-trưởng-dung-lượng-hàng-năm-khả-năng-làm-chủ-công-nghệ-của-ssi-lộ-trình-phát-triển-sản-phẩm-và-các-nâng-cấp-phát-hành-phiên-bản-mới-trong-tương-lai.-khả-năng-ghi-log-lỗi-rõ-ràng-cấu-hình-các-mức-hiển-thị-lỗi-khi-cần-để-thực-hiện-trace-lỗi)

[8.2 Thiết kế và kiến trúc giải pháp [165](#thiết-kế-và-kiến-trúc-giải-pháp)](#thiết-kế-và-kiến-trúc-giải-pháp)

[8.2.1 \[Đáp ứng\] Nhà thầu đề xuất và mô tả chi tiết kiến trúc tổng thể của hệ thống đề xuất bao gồm: kiến trúc về ứng dụng, kiến trúc hệ thống, kiến trúc tích hợp và kiến trúc cơ sở dữ liệu. [165](#đáp-ứng-nhà-thầu-đề-xuất-và-mô-tả-chi-tiết-kiến-trúc-tổng-thể-của-hệ-thống-đề-xuất-bao-gồm-kiến-trúc-về-ứng-dụng-kiến-trúc-hệ-thống-kiến-trúc-tích-hợp-và-kiến-trúc-cơ-sở-dữ-liệu.)](#đáp-ứng-nhà-thầu-đề-xuất-và-mô-tả-chi-tiết-kiến-trúc-tổng-thể-của-hệ-thống-đề-xuất-bao-gồm-kiến-trúc-về-ứng-dụng-kiến-trúc-hệ-thống-kiến-trúc-tích-hợp-và-kiến-trúc-cơ-sở-dữ-liệu.)

[8.2.1 Hệ thống phải hỗ trợ mô hình kiến trúc đa tầng (multi-tier), bao gồm ít nhất 3 tầng sau: Tầng Giao diện: Giao diện người dùng; Tầng Ứng dụng: Yêu cầu đáp ứng đầy đủ các chức năng, quy trình xử lý nghiệp vụ. Hệ thống có thiết kế mở để dễ dàng tích hợp hoặc mở rộng trong tương lai. Tầng Cơ sở dữ liệu: Yêu cầu có sự phân vùng dữ liệu hợp lý để đảm bảo hiệu năng truy suất dữ liệu đạt tốc độ xử lý tối đa. Vui lòng mô tả chi tiết từng tầng của giải pháp được đề xuất. [172](#hệ-thống-phải-hỗ-trợ-mô-hình-kiến-trúc-đa-tầng-multi-tier-bao-gồm-ít-nhất-3-tầng-sau-tầng-giao-diện-giao-diện-người-dùng-tầng-ứng-dụng-yêu-cầu-đáp-ứng-đầy-đủ-các-chức-năng-quy-trình-xử-lý-nghiệp-vụ.-hệ-thống-có-thiết-kế-mở-để-dễ-dàng-tích-hợp-hoặc-mở-rộng-trong-tương-lai.-tầng-cơ-sở-dữ-liệu-yêu-cầu-có-sự-phân-vùng-dữ-liệu-hợp-lý-để-đảm-bảo-hiệu-năng-truy-suất-dữ-liệu-đạt-tốc-độ-xử-lý-tối-đa.-vui-lòng-mô-tả-chi-tiết-từng-tầng-của-giải-pháp-được-đề-xuất.)](#hệ-thống-phải-hỗ-trợ-mô-hình-kiến-trúc-đa-tầng-multi-tier-bao-gồm-ít-nhất-3-tầng-sau-tầng-giao-diện-giao-diện-người-dùng-tầng-ứng-dụng-yêu-cầu-đáp-ứng-đầy-đủ-các-chức-năng-quy-trình-xử-lý-nghiệp-vụ.-hệ-thống-có-thiết-kế-mở-để-dễ-dàng-tích-hợp-hoặc-mở-rộng-trong-tương-lai.-tầng-cơ-sở-dữ-liệu-yêu-cầu-có-sự-phân-vùng-dữ-liệu-hợp-lý-để-đảm-bảo-hiệu-năng-truy-suất-dữ-liệu-đạt-tốc-độ-xử-lý-tối-đa.-vui-lòng-mô-tả-chi-tiết-từng-tầng-của-giải-pháp-được-đề-xuất.)

[8.2.3 Kiến trúc cho hệ thống đề xuất phải hỗ trợ tiêu chuẩn kiến trúc tích hợp SOA, đã được thiết kế và xây dựng cho SOA. [174](#kiến-trúc-cho-hệ-thống-đề-xuất-phải-hỗ-trợ-tiêu-chuẩn-kiến-trúc-tích-hợp-soa-đã-được-thiết-kế-và-xây-dựng-cho-soa.)](#kiến-trúc-cho-hệ-thống-đề-xuất-phải-hỗ-trợ-tiêu-chuẩn-kiến-trúc-tích-hợp-soa-đã-được-thiết-kế-và-xây-dựng-cho-soa.)

[8.2.4 Hệ thống phải được xây dựng trên kiến trúc mô-đun, cho phép triển khai các mô-đun mới hoặc phát triển các chức năng mới của một module cụ thể đồng thời vẫn đảm bảo hệ thống nhất quán và ổn định. [176](#hệ-thống-phải-được-xây-dựng-trên-kiến-trúc-mô-đun-cho-phép-triển-khai-các-mô-đun-mới-hoặc-phát-triển-các-chức-năng-mới-của-một-module-cụ-thể-đồng-thời-vẫn-đảm-bảo-hệ-thống-nhất-quán-và-ổn-định.)](#hệ-thống-phải-được-xây-dựng-trên-kiến-trúc-mô-đun-cho-phép-triển-khai-các-mô-đun-mới-hoặc-phát-triển-các-chức-năng-mới-của-một-module-cụ-thể-đồng-thời-vẫn-đảm-bảo-hệ-thống-nhất-quán-và-ổn-định.)

[8.2.5 Hệ thống hỗ trợ cài đặt trên các nền tảng ảo hóa như Docker, Kubernetes [178](#hệ-thống-hỗ-trợ-cài-đặt-trên-các-nền-tảng-ảo-hóa-như-docker-kubernetes)](#hệ-thống-hỗ-trợ-cài-đặt-trên-các-nền-tảng-ảo-hóa-như-docker-kubernetes)

[8.2.6 Các cấu phần của hệ thống phải được xây dựng trên kiến trúc hệ thống mở và cho phép: Nâng cấp toàn bộ hoặc từng cấu phần của hệ thống nhằm đáp ứng yêu cầu phát triển mới của SSI. Thay đổi, phát triển các tính năng mới, luồng công việc mà không ảnh hưởng đến tính ổn định của chức năng đã có của hệ thống. Nhà thầu mô tả chi tiết về khả năng/ phạm vi tùy chỉnh của hệ thống. Dễ triển khai và tích hợp với các phân hệ mới trong tương lai. [179](#các-cấu-phần-của-hệ-thống-phải-được-xây-dựng-trên-kiến-trúc-hệ-thống-mở-và-cho-phép-nâng-cấp-toàn-bộ-hoặc-từng-cấu-phần-của-hệ-thống-nhằm-đáp-ứng-yêu-cầu-phát-triển-mới-của-ssi.-thay-đổi-phát-triển-các-tính-năng-mới-luồng-công-việc-mà-không-ảnh-hưởng-đến-tính-ổn-định-của-chức-năng-đã-có-của-hệ-thống.-nhà-thầu-mô-tả-chi-tiết-về-khả-năng-phạm-vi-tùy-chỉnh-của-hệ-thống.-dễ-triển-khai-và-tích-hợp-với-các-phân-hệ-mới-trong-tương-lai.)](#các-cấu-phần-của-hệ-thống-phải-được-xây-dựng-trên-kiến-trúc-hệ-thống-mở-và-cho-phép-nâng-cấp-toàn-bộ-hoặc-từng-cấu-phần-của-hệ-thống-nhằm-đáp-ứng-yêu-cầu-phát-triển-mới-của-ssi.-thay-đổi-phát-triển-các-tính-năng-mới-luồng-công-việc-mà-không-ảnh-hưởng-đến-tính-ổn-định-của-chức-năng-đã-có-của-hệ-thống.-nhà-thầu-mô-tả-chi-tiết-về-khả-năng-phạm-vi-tùy-chỉnh-của-hệ-thống.-dễ-triển-khai-và-tích-hợp-với-các-phân-hệ-mới-trong-tương-lai.)

[8.2.7 Hệ thống cho phép mở rộng theo chiều ngang: cho phép nâng cao tải của hệ thống bằng cách bổ sung thêm phần cứng [180](#hệ-thống-cho-phép-mở-rộng-theo-chiều-ngang-cho-phép-nâng-cao-tải-của-hệ-thống-bằng-cách-bổ-sung-thêm-phần-cứng)](#hệ-thống-cho-phép-mở-rộng-theo-chiều-ngang-cho-phép-nâng-cao-tải-của-hệ-thống-bằng-cách-bổ-sung-thêm-phần-cứng)

[8.2.8 Nhà thầu cung cấp các tài liệu: Danh mục ứng dụng: danh mục này liệt kê và mô tả tất cả các chức năng có sẵn trong hệ thống. Ma trận ứng dụng/ chức năng/ dữ liệu: Ma trận này xác định mối quan hệ giữa mỗi chức năng ứng dụng của hệ thống và mỗi chức năng nghiệp vụ và đối tượng dữ liệu sử dụng [181](#nhà-thầu-cung-cấp-các-tài-liệu-danh-mục-ứng-dụng-danh-mục-này-liệt-kê-và-mô-tả-tất-cả-các-chức-năng-có-sẵn-trong-hệ-thống.-ma-trận-ứng-dụng-chức-năng-dữ-liệu-ma-trận-này-xác-định-mối-quan-hệ-giữa-mỗi-chức-năng-ứng-dụng-của-hệ-thống-và-mỗi-chức-năng-nghiệp-vụ-và-đối-tượng-dữ-liệu-sử-dụng)](#nhà-thầu-cung-cấp-các-tài-liệu-danh-mục-ứng-dụng-danh-mục-này-liệt-kê-và-mô-tả-tất-cả-các-chức-năng-có-sẵn-trong-hệ-thống.-ma-trận-ứng-dụng-chức-năng-dữ-liệu-ma-trận-này-xác-định-mối-quan-hệ-giữa-mỗi-chức-năng-ứng-dụng-của-hệ-thống-và-mỗi-chức-năng-nghiệp-vụ-và-đối-tượng-dữ-liệu-sử-dụng)

[8.2.9 Kiến trúc hệ thống phải đảm bảo khả năng chuyển đổi DC-DR linh hoạt khi có thảm họa và lên kịch bản triển khai [188](#kiến-trúc-hệ-thống-phải-đảm-bảo-khả-năng-chuyển-đổi-dc-dr-linh-hoạt-khi-có-thảm-họa-và-lên-kịch-bản-triển-khai)](#kiến-trúc-hệ-thống-phải-đảm-bảo-khả-năng-chuyển-đổi-dc-dr-linh-hoạt-khi-có-thảm-họa-và-lên-kịch-bản-triển-khai)

[8.3 Tích hợp hệ thống [191](#tích-hợp-hệ-thống)](#tích-hợp-hệ-thống)

[8.3.1 Giải pháp phải hỗ trợ tích hợp Single Sign-On (SSO) với Identity Provider là Microsoft Azure Active Directory (Azure AD) và LDAP, bao gồm các giao thức OAuth 2.0, OpenID Connect, và SAML 2.0. Nhà thầu cần cung cấp tài liệu hướng dẫn chi tiết về quy trình tích hợp [191](#giải-pháp-phải-hỗ-trợ-tích-hợp-single-sign-on-sso-với-identity-provider-là-microsoft-azure-active-directory-azure-ad-và-ldap-bao-gồm-các-giao-thức-oauth-2.0-openid-connect-và-saml-2.0.-nhà-thầu-cần-cung-cấp-tài-liệu-hướng-dẫn-chi-tiết-về-quy-trình-tích-hợp)](#giải-pháp-phải-hỗ-trợ-tích-hợp-single-sign-on-sso-với-identity-provider-là-microsoft-azure-active-directory-azure-ad-và-ldap-bao-gồm-các-giao-thức-oauth-2.0-openid-connect-và-saml-2.0.-nhà-thầu-cần-cung-cấp-tài-liệu-hướng-dẫn-chi-tiết-về-quy-trình-tích-hợp)

[8.3.2 Nhà thầu đề xuất và mô tả giải pháp tích hợp toàn diện để tích hợp với các hệ thống hiện tại của SSI (Email, Office 365, ERP, CRM, eKYC, Core, ...). Giải pháp tích hợp được đề xuất phải được mô tả chi tiết về kỹ thuật. [193](#nhà-thầu-đề-xuất-và-mô-tả-giải-pháp-tích-hợp-toàn-diện-để-tích-hợp-với-các-hệ-thống-hiện-tại-của-ssi-email-office-365-erp-crm-ekyc-core-.-giải-pháp-tích-hợp-được-đề-xuất-phải-được-mô-tả-chi-tiết-về-kỹ-thuật.)](#nhà-thầu-đề-xuất-và-mô-tả-giải-pháp-tích-hợp-toàn-diện-để-tích-hợp-với-các-hệ-thống-hiện-tại-của-ssi-email-office-365-erp-crm-ekyc-core-.-giải-pháp-tích-hợp-được-đề-xuất-phải-được-mô-tả-chi-tiết-về-kỹ-thuật.)

[8.3.3 Hệ thống được đề xuất phải có khả năng hỗ trợ khai thác thông tin theo thời gian thực hoặc theo lô thông qua các tiêu chuẩn/ phương pháp tích hợp như sau: RESTFUL API; Webhoo; ETL; Streaming (socket) [197](#hệ-thống-được-đề-xuất-phải-có-khả-năng-hỗ-trợ-khai-thác-thông-tin-theo-thời-gian-thực-hoặc-theo-lô-thông-qua-các-tiêu-chuẩn-phương-pháp-tích-hợp-như-sau-restful-api-webhoo-etl-streaming-socket)](#hệ-thống-được-đề-xuất-phải-có-khả-năng-hỗ-trợ-khai-thác-thông-tin-theo-thời-gian-thực-hoặc-theo-lô-thông-qua-các-tiêu-chuẩn-phương-pháp-tích-hợp-như-sau-restful-api-webhoo-etl-streaming-socket)

[8.3.4 Hệ thống cho phép tích hợp file với hệ thống quản lý file tập trung (ECM) [197](#hệ-thống-cho-phép-tích-hợp-file-với-hệ-thống-quản-lý-file-tập-trung-ecm)](#hệ-thống-cho-phép-tích-hợp-file-với-hệ-thống-quản-lý-file-tập-trung-ecm)

[9. Bảo mật [198](#bảo-mật)](#bảo-mật)

[9.1 Xác thực đầu vào [198](#xác-thực-đầu-vào)](#xác-thực-đầu-vào)

[9.1.1 Tất cả các dữ liệu do người dùng cung cấp (bao gồm chuỗi truy vấn, cookie, nội dung tiêu đề HTTP, SOAP và các yêu cầu dịch vụ web khác, nội dung tự động post-back và nội dung được chuyển hướng) phải được mã hóa với một bộ ký tự chung (chuẩn hóa) và kiểm tra tính hợp lệ về phạm vi, độ dài, định dạng, kiểu dữ liệu trên hệ thống đáng tin cậy (phía máy chủ) trước khi xử lý. [198](#tất-cả-các-dữ-liệu-do-người-dùng-cung-cấp-bao-gồm-chuỗi-truy-vấn-cookie-nội-dung-tiêu-đề-http-soap-và-các-yêu-cầu-dịch-vụ-web-khác-nội-dung-tự-động-post-back-và-nội-dung-được-chuyển-hướng-phải-được-mã-hóa-với-một-bộ-ký-tự-chung-chuẩn-hóa-và-kiểm-tra-tính-hợp-lệ-về-phạm-vi-độ-dài-định-dạng-kiểu-dữ-liệu-trên-hệ-thống-đáng-tin-cậy-phía-máy-chủ-trước-khi-xử-lý.)](#tất-cả-các-dữ-liệu-do-người-dùng-cung-cấp-bao-gồm-chuỗi-truy-vấn-cookie-nội-dung-tiêu-đề-http-soap-và-các-yêu-cầu-dịch-vụ-web-khác-nội-dung-tự-động-post-back-và-nội-dung-được-chuyển-hướng-phải-được-mã-hóa-với-một-bộ-ký-tự-chung-chuẩn-hóa-và-kiểm-tra-tính-hợp-lệ-về-phạm-vi-độ-dài-định-dạng-kiểu-dữ-liệu-trên-hệ-thống-đáng-tin-cậy-phía-máy-chủ-trước-khi-xử-lý.)

[9.1.2 Tất cả dữ liệu đầu vào phải được kiểm tra dựa trên \"danh sách trắng\" các ký tự được phép (ví dụ: sử dụng biểu thức chính quy).Trong trường hợp bộ lọc \"danh sách trắng\" chưa được sử dụng, tất cả giá trị đầu vào phải được kiểm tra qua bộ lọc \"danh sách đen\" để chặn bất kỳ ký tự nguy hiểm tiềm ẩn. Các ký tự nguy hiểm phổ biến bao gồm: \< \> \" \' ( ) & + \\ \\\' \" \# %; Ký tự trống (%00); Ký tự dòng mới (%0d, %0a, \\r, \\n); Ký tự thay đổi đường dẫn (../ or ..\\) [200](#tất-cả-dữ-liệu-đầu-vào-phải-được-kiểm-tra-dựa-trên-danh-sách-trắng-các-ký-tự-được-phép-ví-dụ-sử-dụng-biểu-thức-chính-quy.trong-trường-hợp-bộ-lọc-danh-sách-trắng-chưa-được-sử-dụng-tất-cả-giá-trị-đầu-vào-phải-được-kiểm-tra-qua-bộ-lọc-danh-sách-đen-để-chặn-bất-kỳ-ký-tự-nguy-hiểm-tiềm-ẩn.-các-ký-tự-nguy-hiểm-phổ-biến-bao-gồm-ký-tự-trống-00-ký-tự-dòng-mới-0d-0a-r-n-ký-tự-thay-đổi-đường-dẫn-..-or-..)](#tất-cả-dữ-liệu-đầu-vào-phải-được-kiểm-tra-dựa-trên-danh-sách-trắng-các-ký-tự-được-phép-ví-dụ-sử-dụng-biểu-thức-chính-quy.trong-trường-hợp-bộ-lọc-danh-sách-trắng-chưa-được-sử-dụng-tất-cả-giá-trị-đầu-vào-phải-được-kiểm-tra-qua-bộ-lọc-danh-sách-đen-để-chặn-bất-kỳ-ký-tự-nguy-hiểm-tiềm-ẩn.-các-ký-tự-nguy-hiểm-phổ-biến-bao-gồm-ký-tự-trống-00-ký-tự-dòng-mới-0d-0a-r-n-ký-tự-thay-đổi-đường-dẫn-..-or-..)

[9.2 Xác thực đầu ra [201](#xác-thực-đầu-ra)](#xác-thực-đầu-ra)

[9.2.1 Tất cả các dữ liệu đầu ra không đáng tin cậy (ví dụ: đầu vào được cung cấp bởi người dùng trực tiếp hoặc gián tiếp thông qua một ứng dụng khác) phải được mã hoá (encode) trước khi trả lại cho khách hàng (ví dụ sử dụng .NET HtmlEncode, UrlEncode, Apache Jakarta Commons Lang Package). Có Content Security Policy (CSP) để hạn chế tài nguyên tải từ nguồn không tin cậy, tăng cường bảo vệ chống XSS. [201](#tất-cả-các-dữ-liệu-đầu-ra-không-đáng-tin-cậy-ví-dụ-đầu-vào-được-cung-cấp-bởi-người-dùng-trực-tiếp-hoặc-gián-tiếp-thông-qua-một-ứng-dụng-khác-phải-được-mã-hoá-encode-trước-khi-trả-lại-cho-khách-hàng-ví-dụ-sử-dụng-.net-htmlencode-urlencode-apache-jakarta-commons-lang-package.-có-content-security-policy-csp-để-hạn-chế-tài-nguyên-tải-từ-nguồn-không-tin-cậy-tăng-cường-bảo-vệ-chống-xss.)](#tất-cả-các-dữ-liệu-đầu-ra-không-đáng-tin-cậy-ví-dụ-đầu-vào-được-cung-cấp-bởi-người-dùng-trực-tiếp-hoặc-gián-tiếp-thông-qua-một-ứng-dụng-khác-phải-được-mã-hoá-encode-trước-khi-trả-lại-cho-khách-hàng-ví-dụ-sử-dụng-.net-htmlencode-urlencode-apache-jakarta-commons-lang-package.-có-content-security-policy-csp-để-hạn-chế-tài-nguyên-tải-từ-nguồn-không-tin-cậy-tăng-cường-bảo-vệ-chống-xss.)

[9.3 Xác thực và quản lý danh tính [202](#xác-thực-và-quản-lý-danh-tính)](#xác-thực-và-quản-lý-danh-tính)

[9.3.1 Xác thực phải được thực thi trên máy chủ và cho tất cả các trang và tài nguyên, ngoại trừ trang web công khai không có bất kỳ thông tin nhạy cảm nào. [202](#xác-thực-phải-được-thực-thi-trên-máy-chủ-và-cho-tất-cả-các-trang-và-tài-nguyên-ngoại-trừ-trang-web-công-khai-không-có-bất-kỳ-thông-tin-nhạy-cảm-nào.)](#xác-thực-phải-được-thực-thi-trên-máy-chủ-và-cho-tất-cả-các-trang-và-tài-nguyên-ngoại-trừ-trang-web-công-khai-không-có-bất-kỳ-thông-tin-nhạy-cảm-nào.)

[9.3.2 Mật khẩu đăng nhập, biểu mẫu đăng ký, biểu mẫu khi quên mật khẩu phải bao gồm CAPTCHA để ngăn chặn các cuộc tấn công bruteforce, có cơ chế rate limit. [203](#mật-khẩu-đăng-nhập-biểu-mẫu-đăng-ký-biểu-mẫu-khi-quên-mật-khẩu-phải-bao-gồm-captcha-để-ngăn-chặn-các-cuộc-tấn-công-bruteforce-có-cơ-chế-rate-limit.)](#mật-khẩu-đăng-nhập-biểu-mẫu-đăng-ký-biểu-mẫu-khi-quên-mật-khẩu-phải-bao-gồm-captcha-để-ngăn-chặn-các-cuộc-tấn-công-bruteforce-có-cơ-chế-rate-limit.)

[9.3.3 Độ dài mật khẩu và yêu cầu về độ phức tạp được thực thi đối với mật khẩu mới và mật khẩu được đặt lại theo quy định trong Tiêu chuẩn Mật khẩu hiện hành. [204](#độ-dài-mật-khẩu-và-yêu-cầu-về-độ-phức-tạp-được-thực-thi-đối-với-mật-khẩu-mới-và-mật-khẩu-được-đặt-lại-theo-quy-định-trong-tiêu-chuẩn-mật-khẩu-hiện-hành.)](#độ-dài-mật-khẩu-và-yêu-cầu-về-độ-phức-tạp-được-thực-thi-đối-với-mật-khẩu-mới-và-mật-khẩu-được-đặt-lại-theo-quy-định-trong-tiêu-chuẩn-mật-khẩu-hiện-hành.)

[9.3.4 Kiểm soát xác thực phải được thực thi trên một hệ thống đáng tin cậy (tức là phía máy chủ thay vì phía máy khách). [205](#kiểm-soát-xác-thực-phải-được-thực-thi-trên-một-hệ-thống-đáng-tin-cậy-tức-là-phía-máy-chủ-thay-vì-phía-máy-khách.)](#kiểm-soát-xác-thực-phải-được-thực-thi-trên-một-hệ-thống-đáng-tin-cậy-tức-là-phía-máy-chủ-thay-vì-phía-máy-khách.)

[9.3.5 Các yêu cầu thực hiện giao dịch trên ứng dụng phải được kiểm tra tính toàn vẹn để đảm bảo rằng dữ liệu chưa được sửa đổi bởi một bên trái phép. [206](#các-yêu-cầu-thực-hiện-giao-dịch-trên-ứng-dụng-phải-được-kiểm-tra-tính-toàn-vẹn-để-đảm-bảo-rằng-dữ-liệu-chưa-được-sửa-đổi-bởi-một-bên-trái-phép.)](#các-yêu-cầu-thực-hiện-giao-dịch-trên-ứng-dụng-phải-được-kiểm-tra-tính-toàn-vẹn-để-đảm-bảo-rằng-dữ-liệu-chưa-được-sửa-đổi-bởi-một-bên-trái-phép.)

[9.3.6 Mật khẩu được lưu trữ sử dụng hàm băm một chiều với thuật toán mạnh (bcrypt, scrypt, hoặc Argon2id) kèm salt ngẫu nhiên per-user. Lưu trữ mật khẩu và xác thực phải sử dụng cơ chế được cung cấp bởi framework thay vì sử dụng cơ chế tự phát triển. [208](#mật-khẩu-được-lưu-trữ-sử-dụng-hàm-băm-một-chiều-với-thuật-toán-mạnh-bcrypt-scrypt-hoặc-argon2id-kèm-salt-ngẫu-nhiên-per-user.-lưu-trữ-mật-khẩu-và-xác-thực-phải-sử-dụng-cơ-chế-được-cung-cấp-bởi-framework-thay-vì-sử-dụng-cơ-chế-tự-phát-triển.)](#mật-khẩu-được-lưu-trữ-sử-dụng-hàm-băm-một-chiều-với-thuật-toán-mạnh-bcrypt-scrypt-hoặc-argon2id-kèm-salt-ngẫu-nhiên-per-user.-lưu-trữ-mật-khẩu-và-xác-thực-phải-sử-dụng-cơ-chế-được-cung-cấp-bởi-framework-thay-vì-sử-dụng-cơ-chế-tự-phát-triển.)

[9.3.7 Mục nhập mật khẩu phải được che đi trên màn hình của người dùng. [209](#mục-nhập-mật-khẩu-phải-được-che-đi-trên-màn-hình-của-người-dùng.)](#mục-nhập-mật-khẩu-phải-được-che-đi-trên-màn-hình-của-người-dùng.)

[9.3.8 Xác thực đa yếu tố (MFA) bắt buộc cho tất cả tài khoản truy cập hệ thống HRM. [209](#xác-thực-đa-yếu-tố-mfa-bắt-buộc-cho-tất-cả-tài-khoản-truy-cập-hệ-thống-hrm.)](#xác-thực-đa-yếu-tố-mfa-bắt-buộc-cho-tất-cả-tài-khoản-truy-cập-hệ-thống-hrm.)

[9.3.9 Tất cả mật khẩu và mã thông báo xác thực được gửi qua kết nối được mã hóa (ví dụ như TLS). [211](#tất-cả-mật-khẩu-và-mã-thông-báo-xác-thực-được-gửi-qua-kết-nối-được-mã-hóa-ví-dụ-như-tls.)](#tất-cả-mật-khẩu-và-mã-thông-báo-xác-thực-được-gửi-qua-kết-nối-được-mã-hóa-ví-dụ-như-tls.)

[9.3.10 Nếu mật khẩu tạm thời (hoặc liên kết đến mật khẩu tạm thời) được sử dụng, những điều sau đây được áp dụng: Thời gian hết hạn ngắn. Thay đổi mật khẩu khi sử dụng lần đầu. [211](#nếu-mật-khẩu-tạm-thời-hoặc-liên-kết-đến-mật-khẩu-tạm-thời-được-sử-dụng-những-điều-sau-đây-được-áp-dụng-thời-gian-hết-hạn-ngắn.-thay-đổi-mật-khẩu-khi-sử-dụng-lần-đầu.)](#nếu-mật-khẩu-tạm-thời-hoặc-liên-kết-đến-mật-khẩu-tạm-thời-được-sử-dụng-những-điều-sau-đây-được-áp-dụng-thời-gian-hết-hạn-ngắn.-thay-đổi-mật-khẩu-khi-sử-dụng-lần-đầu.)

[9.4 Kiểm soát truy cập [212](#kiểm-soát-truy-cập)](#kiểm-soát-truy-cập)

[9.4.1 Ứng dụng hoạt động dựa trên nguyên tắc \"đặc quyền tối thiểu\" (tức là người dùng hoặc tài khoản dịch vụ được chỉ định mức truy cập tối thiểu để thực hiện nhiệm vụ). Kiểm soát truy cập dựa trên vai trò được thiết kế để đảm bảo mức truy cập nhất quán cho công việc hoặc vai trò được áp dụng cho quyền truy cập của người dùng. [212](#ứng-dụng-hoạt-động-dựa-trên-nguyên-tắc-đặc-quyền-tối-thiểu-tức-là-người-dùng-hoặc-tài-khoản-dịch-vụ-được-chỉ-định-mức-truy-cập-tối-thiểu-để-thực-hiện-nhiệm-vụ.-kiểm-soát-truy-cập-dựa-trên-vai-trò-được-thiết-kế-để-đảm-bảo-mức-truy-cập-nhất-quán-cho-công-việc-hoặc-vai-trò-được-áp-dụng-cho-quyền-truy-cập-của-người-dùng.)](#ứng-dụng-hoạt-động-dựa-trên-nguyên-tắc-đặc-quyền-tối-thiểu-tức-là-người-dùng-hoặc-tài-khoản-dịch-vụ-được-chỉ-định-mức-truy-cập-tối-thiểu-để-thực-hiện-nhiệm-vụ.-kiểm-soát-truy-cập-dựa-trên-vai-trò-được-thiết-kế-để-đảm-bảo-mức-truy-cập-nhất-quán-cho-công-việc-hoặc-vai-trò-được-áp-dụng-cho-quyền-truy-cập-của-người-dùng.)

[9.4.2 Hạn chế quyền truy cập vào tất cả các tài nguyên (bao gồm tệp, các URL được bảo vệ, các chức năng được bảo vệ, các dịch vụ và dữ liệu ứng dụng) cho người dùng được ủy quyền. [213](#hạn-chế-quyền-truy-cập-vào-tất-cả-các-tài-nguyên-bao-gồm-tệp-các-url-được-bảo-vệ-các-chức-năng-được-bảo-vệ-các-dịch-vụ-và-dữ-liệu-ứng-dụng-cho-người-dùng-được-ủy-quyền.)](#hạn-chế-quyền-truy-cập-vào-tất-cả-các-tài-nguyên-bao-gồm-tệp-các-url-được-bảo-vệ-các-chức-năng-được-bảo-vệ-các-dịch-vụ-và-dữ-liệu-ứng-dụng-cho-người-dùng-được-ủy-quyền.)

[9.4.3 Trong trường hợp các phiên xác thực dài hạn được cho phép, ủy quyền được xác thực lại định kỳ để đảm bảo rằng các đặc quyền không thay đổi và nếu có, buộc người dùng phải đăng xuất và xác thực lại. [213](#trong-trường-hợp-các-phiên-xác-thực-dài-hạn-được-cho-phép-ủy-quyền-được-xác-thực-lại-định-kỳ-để-đảm-bảo-rằng-các-đặc-quyền-không-thay-đổi-và-nếu-có-buộc-người-dùng-phải-đăng-xuất-và-xác-thực-lại.)](#trong-trường-hợp-các-phiên-xác-thực-dài-hạn-được-cho-phép-ủy-quyền-được-xác-thực-lại-định-kỳ-để-đảm-bảo-rằng-các-đặc-quyền-không-thay-đổi-và-nếu-có-buộc-người-dùng-phải-đăng-xuất-và-xác-thực-lại.)

[9.4.4 Trang quản trị ứng dụng web phải được tách ra khỏi trang dành cho khách/người dùng và nó chỉ có thể được truy cập nội bộ. [214](#trang-quản-trị-ứng-dụng-web-phải-được-tách-ra-khỏi-trang-dành-cho-kháchngười-dùng-và-nó-chỉ-có-thể-được-truy-cập-nội-bộ.)](#trang-quản-trị-ứng-dụng-web-phải-được-tách-ra-khỏi-trang-dành-cho-kháchngười-dùng-và-nó-chỉ-có-thể-được-truy-cập-nội-bộ.)

[9.4.5 Có audit logging để ghi lại các hành động quan trọng (ví dụ: thay đổi quyền, truy cập dữ liệu nhạy cảm, thao tác trên dữ liệu lương/nhân sự) nhằm theo dõi và kiểm tra sau này. [215](#có-audit-logging-để-ghi-lại-các-hành-động-quan-trọng-ví-dụ-thay-đổi-quyền-truy-cập-dữ-liệu-nhạy-cảm-thao-tác-trên-dữ-liệu-lươngnhân-sự-nhằm-theo-dõi-và-kiểm-tra-sau-này.)](#có-audit-logging-để-ghi-lại-các-hành-động-quan-trọng-ví-dụ-thay-đổi-quyền-truy-cập-dữ-liệu-nhạy-cảm-thao-tác-trên-dữ-liệu-lươngnhân-sự-nhằm-theo-dõi-và-kiểm-tra-sau-này.)

[9.4.6 Các thao tác nhạy cảm (thay đổi lương, thêm/xóa nhân viên, phê duyệt nghỉ việc) phải có cơ chế maker-checker/dual approval. Không cho phép tự phê duyệt thay đổi liên quan đến chính mình. Bulk export dữ liệu nhân sự (CSV/Excel) phải có phê duyệt và ghi audit log. [215](#các-thao-tác-nhạy-cảm-thay-đổi-lương-thêmxóa-nhân-viên-phê-duyệt-nghỉ-việc-phải-có-cơ-chế-maker-checkerdual-approval.-không-cho-phép-tự-phê-duyệt-thay-đổi-liên-quan-đến-chính-mình.-bulk-export-dữ-liệu-nhân-sự-csvexcel-phải-có-phê-duyệt-và-ghi-audit-log.)](#các-thao-tác-nhạy-cảm-thay-đổi-lương-thêmxóa-nhân-viên-phê-duyệt-nghỉ-việc-phải-có-cơ-chế-maker-checkerdual-approval.-không-cho-phép-tự-phê-duyệt-thay-đổi-liên-quan-đến-chính-mình.-bulk-export-dữ-liệu-nhân-sự-csvexcel-phải-có-phê-duyệt-và-ghi-audit-log.)

[![[image1.png]] [216](#section-26)](#section-26)

[9.5 Cookies và quản lý phiên [216](#cookies-và-quản-lý-phiên)](#cookies-và-quản-lý-phiên)

[9.5.1 Thời gian hiệu lực của một phiên không hoạt động phải được cấu hình, thời gian hiệu lực đủ ngắn dựa trên đánh giá rủi ro và yêu cầu nghiệp vụ. Không được phép cấp một phiên làm việc không có thời hạn. [216](#thời-gian-hiệu-lực-của-một-phiên-không-hoạt-động-phải-được-cấu-hình-thời-gian-hiệu-lực-đủ-ngắn-dựa-trên-đánh-giá-rủi-ro-và-yêu-cầu-nghiệp-vụ.-không-được-phép-cấp-một-phiên-làm-việc-không-có-thời-hạn.)](#thời-gian-hiệu-lực-của-một-phiên-không-hoạt-động-phải-được-cấu-hình-thời-gian-hiệu-lực-đủ-ngắn-dựa-trên-đánh-giá-rủi-ro-và-yêu-cầu-nghiệp-vụ.-không-được-phép-cấp-một-phiên-làm-việc-không-có-thời-hạn.)

[9.5.2 Tất cả dữ liệu được lưu trữ trong các biến của phiên thay vì lưu trữ trên cookie phía máy khách. Các thuộc tính \"Secure\" và \"HTTPOnly\" được cấu hình trên tất cả các cookie của phiên. Có token chống CSRF (Cross-Site Request Forgery) để bảo vệ các yêu cầu giao dịch quan trọng. [217](#tất-cả-dữ-liệu-được-lưu-trữ-trong-các-biến-của-phiên-thay-vì-lưu-trữ-trên-cookie-phía-máy-khách.-các-thuộc-tính-secure-và-httponly-được-cấu-hình-trên-tất-cả-các-cookie-của-phiên.-có-token-chống-csrf-cross-site-request-forgery-để-bảo-vệ-các-yêu-cầu-giao-dịch-quan-trọng.)](#tất-cả-dữ-liệu-được-lưu-trữ-trong-các-biến-của-phiên-thay-vì-lưu-trữ-trên-cookie-phía-máy-khách.-các-thuộc-tính-secure-và-httponly-được-cấu-hình-trên-tất-cả-các-cookie-của-phiên.-có-token-chống-csrf-cross-site-request-forgery-để-bảo-vệ-các-yêu-cầu-giao-dịch-quan-trọng.)

[9.5.3 Tất cả cookie và các mã định danh của phiên được gửi qua các kết nối được mã hóa. Chức năng đăng xuất phải chấm dứt hoàn toàn phiên hoặc kết nối liên quan. [217](#tất-cả-cookie-và-các-mã-định-danh-của-phiên-được-gửi-qua-các-kết-nối-được-mã-hóa.-chức-năng-đăng-xuất-phải-chấm-dứt-hoàn-toàn-phiên-hoặc-kết-nối-liên-quan.)](#tất-cả-cookie-và-các-mã-định-danh-của-phiên-được-gửi-qua-các-kết-nối-được-mã-hóa.-chức-năng-đăng-xuất-phải-chấm-dứt-hoàn-toàn-phiên-hoặc-kết-nối-liên-quan.)

[9.5.4 Không được hiển thị số nhận dạng phiên trong URL, thông báo lỗi hoặc nhật ký sự kiện. Mã định danh của phiên phải được đặt trong tiêu đề cookie HTTP. [217](#không-được-hiển-thị-số-nhận-dạng-phiên-trong-url-thông-báo-lỗi-hoặc-nhật-ký-sự-kiện.-mã-định-danh-của-phiên-phải-được-đặt-trong-tiêu-đề-cookie-http.)](#không-được-hiển-thị-số-nhận-dạng-phiên-trong-url-thông-báo-lỗi-hoặc-nhật-ký-sự-kiện.-mã-định-danh-của-phiên-phải-được-đặt-trong-tiêu-đề-cookie-http.)

[9.6 Quản lý tệp [218](#quản-lý-tệp)](#quản-lý-tệp)

[9.6.1 Tất cả mật khẩu trong mã nguồn phải được xóa. Dữ liệu liên quan đến bảo mật (ví dụ: mật khẩu, chuỗi kết nối) được lưu trữ phía máy chủ thay vì phía máy khách. [218](#tất-cả-mật-khẩu-trong-mã-nguồn-phải-được-xóa.-dữ-liệu-liên-quan-đến-bảo-mật-ví-dụ-mật-khẩu-chuỗi-kết-nối-được-lưu-trữ-phía-máy-chủ-thay-vì-phía-máy-khách.)](#tất-cả-mật-khẩu-trong-mã-nguồn-phải-được-xóa.-dữ-liệu-liên-quan-đến-bảo-mật-ví-dụ-mật-khẩu-chuỗi-kết-nối-được-lưu-trữ-phía-máy-chủ-thay-vì-phía-máy-khách.)

[9.6.2 Yêu cầu xác thực trước khi cho phép tải tệp lên. Có giới hạn kích thước tệp tải lên. Kiểm tra các tệp tin được tải lên có phải là loại được phép hay không bằng cách kiểm tra tiêu đề tệp, loại tệp và phần mở rộng. Ngăn tải lên tệp có thể được thông dịch bởi máy chủ Web. Quét tệp tin được tải lên từ người dùng để tìm kiếm virus và phần mềm độc hại. [218](#yêu-cầu-xác-thực-trước-khi-cho-phép-tải-tệp-lên.-có-giới-hạn-kích-thước-tệp-tải-lên.-kiểm-tra-các-tệp-tin-được-tải-lên-có-phải-là-loại-được-phép-hay-không-bằng-cách-kiểm-tra-tiêu-đề-tệp-loại-tệp-và-phần-mở-rộng.-ngăn-tải-lên-tệp-có-thể-được-thông-dịch-bởi-máy-chủ-web.-quét-tệp-tin-được-tải-lên-từ-người-dùng-để-tìm-kiếm-virus-và-phần-mềm-độc-hại.)](#yêu-cầu-xác-thực-trước-khi-cho-phép-tải-tệp-lên.-có-giới-hạn-kích-thước-tệp-tải-lên.-kiểm-tra-các-tệp-tin-được-tải-lên-có-phải-là-loại-được-phép-hay-không-bằng-cách-kiểm-tra-tiêu-đề-tệp-loại-tệp-và-phần-mở-rộng.-ngăn-tải-lên-tệp-có-thể-được-thông-dịch-bởi-máy-chủ-web.-quét-tệp-tin-được-tải-lên-từ-người-dùng-để-tìm-kiếm-virus-và-phần-mềm-độc-hại.)

[9.6.3 Không lưu tệp tin trong thư mục webroot. Các tệp phải được lưu trữ ở một thư mục ngoài thư mục webroot hoặc trong cơ sở dữ liệu. Tắt đặc quyền thực thi trên các thư mục được phép tải tệp lên. [219](#không-lưu-tệp-tin-trong-thư-mục-webroot.-các-tệp-phải-được-lưu-trữ-ở-một-thư-mục-ngoài-thư-mục-webroot-hoặc-trong-cơ-sở-dữ-liệu.-tắt-đặc-quyền-thực-thi-trên-các-thư-mục-được-phép-tải-tệp-lên.)](#không-lưu-tệp-tin-trong-thư-mục-webroot.-các-tệp-phải-được-lưu-trữ-ở-một-thư-mục-ngoài-thư-mục-webroot-hoặc-trong-cơ-sở-dữ-liệu.-tắt-đặc-quyền-thực-thi-trên-các-thư-mục-được-phép-tải-tệp-lên.)

[9.6.4 Các bản sao lưu trong bộ nhớ cache và các bản sao lưu tạm thời của dữ liệu nhạy cảm được lưu trữ trên máy chủ phải được bảo vệ khỏi các truy cập trái phép, và các tập tin như vậy phải được xoá ngay khi không còn cần thiết. Mã nguồn phía máy chủ được bảo vệ khỏi bị người dùng trái phép tải xuống. [219](#các-bản-sao-lưu-trong-bộ-nhớ-cache-và-các-bản-sao-lưu-tạm-thời-của-dữ-liệu-nhạy-cảm-được-lưu-trữ-trên-máy-chủ-phải-được-bảo-vệ-khỏi-các-truy-cập-trái-phép-và-các-tập-tin-như-vậy-phải-được-xoá-ngay-khi-không-còn-cần-thiết.-mã-nguồn-phía-máy-chủ-được-bảo-vệ-khỏi-bị-người-dùng-trái-phép-tải-xuống.)](#các-bản-sao-lưu-trong-bộ-nhớ-cache-và-các-bản-sao-lưu-tạm-thời-của-dữ-liệu-nhạy-cảm-được-lưu-trữ-trên-máy-chủ-phải-được-bảo-vệ-khỏi-các-truy-cập-trái-phép-và-các-tập-tin-như-vậy-phải-được-xoá-ngay-khi-không-còn-cần-thiết.-mã-nguồn-phía-máy-chủ-được-bảo-vệ-khỏi-bị-người-dùng-trái-phép-tải-xuống.)

[9.6.5 Bộ nhớ đệm phía máy khách bị vô hiệu hóa trên các trang chứa thông tin nhạy cảm (sử dụng \"Cache-Control: no-store\" và tiêu đề \"Pragma: no-cache\"). [220](#bộ-nhớ-đệm-phía-máy-khách-bị-vô-hiệu-hóa-trên-các-trang-chứa-thông-tin-nhạy-cảm-sử-dụng-cache-control-no-store-và-tiêu-đề-pragma-no-cache.)](#bộ-nhớ-đệm-phía-máy-khách-bị-vô-hiệu-hóa-trên-các-trang-chứa-thông-tin-nhạy-cảm-sử-dụng-cache-control-no-store-và-tiêu-đề-pragma-no-cache.)

[9.7 Xử lý lỗi và ghi nhật ký sự kiện [220](#xử-lý-lỗi-và-ghi-nhật-ký-sự-kiện)](#xử-lý-lỗi-và-ghi-nhật-ký-sự-kiện)

[9.7.1 Ứng dụng phải sử dụng lỗi tùy chỉnh và không hiển thị thông tin debug hoặc thông tin stack trace. Thông tin nhạy cảm bao gồm chi tiết hệ thống, số nhận dạng phiên và thông tin tài khoản được loại bỏ khỏi các trang thông báo lỗi. Sử dụng các trang báo lỗi chung để xử lý các trường hợp ngoại lệ. [220](#ứng-dụng-phải-sử-dụng-lỗi-tùy-chỉnh-và-không-hiển-thị-thông-tin-debug-hoặc-thông-tin-stack-trace.-thông-tin-nhạy-cảm-bao-gồm-chi-tiết-hệ-thống-số-nhận-dạng-phiên-và-thông-tin-tài-khoản-được-loại-bỏ-khỏi-các-trang-thông-báo-lỗi.-sử-dụng-các-trang-báo-lỗi-chung-để-xử-lý-các-trường-hợp-ngoại-lệ.)](#ứng-dụng-phải-sử-dụng-lỗi-tùy-chỉnh-và-không-hiển-thị-thông-tin-debug-hoặc-thông-tin-stack-trace.-thông-tin-nhạy-cảm-bao-gồm-chi-tiết-hệ-thống-số-nhận-dạng-phiên-và-thông-tin-tài-khoản-được-loại-bỏ-khỏi-các-trang-thông-báo-lỗi.-sử-dụng-các-trang-báo-lỗi-chung-để-xử-lý-các-trường-hợp-ngoại-lệ.)

[9.7.2 Thông tin nhật ký sự kiện được lưu trữ ở định dạng có thể dễ dàng truy xuất. Quyền truy cập vào nhật ký sự kiện chỉ giới hạn ở những cá nhân được ủy quyền. Không lưu trữ thông tin nhạy cảm trong nhật ký sự kiện, bao gồm nhưng không giới hạn: thông tin chi tiết hệ thống không cần thiết, số nhận dạng phiên, mật khẩu hoặc dữ liệu cá nhân. [221](#thông-tin-nhật-ký-sự-kiện-được-lưu-trữ-ở-định-dạng-có-thể-dễ-dàng-truy-xuất.-quyền-truy-cập-vào-nhật-ký-sự-kiện-chỉ-giới-hạn-ở-những-cá-nhân-được-ủy-quyền.-không-lưu-trữ-thông-tin-nhạy-cảm-trong-nhật-ký-sự-kiện-bao-gồm-nhưng-không-giới-hạn-thông-tin-chi-tiết-hệ-thống-không-cần-thiết-số-nhận-dạng-phiên-mật-khẩu-hoặc-dữ-liệu-cá-nhân.)](#thông-tin-nhật-ký-sự-kiện-được-lưu-trữ-ở-định-dạng-có-thể-dễ-dàng-truy-xuất.-quyền-truy-cập-vào-nhật-ký-sự-kiện-chỉ-giới-hạn-ở-những-cá-nhân-được-ủy-quyền.-không-lưu-trữ-thông-tin-nhạy-cảm-trong-nhật-ký-sự-kiện-bao-gồm-nhưng-không-giới-hạn-thông-tin-chi-tiết-hệ-thống-không-cần-thiết-số-nhận-dạng-phiên-mật-khẩu-hoặc-dữ-liệu-cá-nhân.)

[9.8 Bảo mật cơ sở dữ liệu [222](#bảo-mật-cơ-sở-dữ-liệu)](#bảo-mật-cơ-sở-dữ-liệu)

[9.8.1 Ứng dụng phải sử dụng mức đặc quyền tối thiểu có thể khi truy cập cơ sở dữ liệu. Sử dụng các tham số truy vấn mạnh (ví dụ PHP-bindParam(), Java-PrepareStatement(), .Net-SqlCommand(), Hibernate-createQuery()) thay vì các truy vấn SQL thô. [222](#ứng-dụng-phải-sử-dụng-mức-đặc-quyền-tối-thiểu-có-thể-khi-truy-cập-cơ-sở-dữ-liệu.-sử-dụng-các-tham-số-truy-vấn-mạnh-ví-dụ-php-bindparam-java-preparestatement-.net-sqlcommand-hibernate-createquery-thay-vì-các-truy-vấn-sql-thô.)](#ứng-dụng-phải-sử-dụng-mức-đặc-quyền-tối-thiểu-có-thể-khi-truy-cập-cơ-sở-dữ-liệu.-sử-dụng-các-tham-số-truy-vấn-mạnh-ví-dụ-php-bindparam-java-preparestatement-.net-sqlcommand-hibernate-createquery-thay-vì-các-truy-vấn-sql-thô.)

[9.8.2 Mã hóa dữ liệu nhạy cảm trong cơ sở dữ liệu (ví dụ: thông tin lương, số CMND/CCCD, thông tin sức khỏe, số tài khoản ngân hàng). Có chức năng backup định kỳ và khôi phục dữ liệu. Bản sao lưu (backup) phải được mã hóa. [223](#mã-hóa-dữ-liệu-nhạy-cảm-trong-cơ-sở-dữ-liệu-ví-dụ-thông-tin-lương-số-cmndcccd-thông-tin-sức-khỏe-số-tài-khoản-ngân-hàng.-có-chức-năng-backup-định-kỳ-và-khôi-phục-dữ-liệu.-bản-sao-lưu-backup-phải-được-mã-hóa.)](#mã-hóa-dữ-liệu-nhạy-cảm-trong-cơ-sở-dữ-liệu-ví-dụ-thông-tin-lương-số-cmndcccd-thông-tin-sức-khỏe-số-tài-khoản-ngân-hàng.-có-chức-năng-backup-định-kỳ-và-khôi-phục-dữ-liệu.-bản-sao-lưu-backup-phải-được-mã-hóa.)

[9.9 Bảo mật truyền tải [225](#bảo-mật-truyền-tải)](#bảo-mật-truyền-tải)

[9.9.1 Tiêu chuẩn TLS (TLS \>= 1.2) phải được sử dụng và cấu hình thích hợp. Kết nối TLS không thành công không được quay lại kết nối không an toàn. Triển khai HSTS (HTTP Strict Transport Security) để buộc sử dụng HTTPS. Chứng chỉ TLS phải hợp lệ và có tên miền chính xác, không hết hạn và được cài đặt chứng chỉ trung gian khi được yêu cầu. [225](#tiêu-chuẩn-tls-tls-1.2-phải-được-sử-dụng-và-cấu-hình-thích-hợp.-kết-nối-tls-không-thành-công-không-được-quay-lại-kết-nối-không-an-toàn.-triển-khai-hsts-http-strict-transport-security-để-buộc-sử-dụng-https.-chứng-chỉ-tls-phải-hợp-lệ-và-có-tên-miền-chính-xác-không-hết-hạn-và-được-cài-đặt-chứng-chỉ-trung-gian-khi-được-yêu-cầu.)](#tiêu-chuẩn-tls-tls-1.2-phải-được-sử-dụng-và-cấu-hình-thích-hợp.-kết-nối-tls-không-thành-công-không-được-quay-lại-kết-nối-không-an-toàn.-triển-khai-hsts-http-strict-transport-security-để-buộc-sử-dụng-https.-chứng-chỉ-tls-phải-hợp-lệ-và-có-tên-miền-chính-xác-không-hết-hạn-và-được-cài-đặt-chứng-chỉ-trung-gian-khi-được-yêu-cầu.)

[9.10 Hạ tầng Cloud/ Dịch vụ hosting tại đối tác [226](#hạ-tầng-cloud-dịch-vụ-hosting-tại-đối-tác)](#hạ-tầng-cloud-dịch-vụ-hosting-tại-đối-tác)

[9.10.1 Trường hợp triển khai trên hạ tầng cloud (hoặc hosting tại đối tác), nhà thầu mô tả phương án triển khai dịch vụ đáp ứng theo yêu cầu bảo mật được mô tả tại PL07. [226](#trường-hợp-triển-khai-trên-hạ-tầng-cloud-hoặc-hosting-tại-đối-tác-nhà-thầu-mô-tả-phương-án-triển-khai-dịch-vụ-đáp-ứng-theo-yêu-cầu-bảo-mật-được-mô-tả-tại-pl07.)](#trường-hợp-triển-khai-trên-hạ-tầng-cloud-hoặc-hosting-tại-đối-tác-nhà-thầu-mô-tả-phương-án-triển-khai-dịch-vụ-đáp-ứng-theo-yêu-cầu-bảo-mật-được-mô-tả-tại-pl07.)

[9.10.2 Có tiêu chuẩn bảo mật mà nhà cung cấp cần tuân thủ, ví dụ: ISO 27001, Luật ANM 2025, Luật BVDLCN 2025 [228](#có-tiêu-chuẩn-bảo-mật-mà-nhà-cung-cấp-cần-tuân-thủ-ví-dụ-iso-27001-luật-anm-2025-luật-bvdlcn-2025)](#có-tiêu-chuẩn-bảo-mật-mà-nhà-cung-cấp-cần-tuân-thủ-ví-dụ-iso-27001-luật-anm-2025-luật-bvdlcn-2025)

[9.11 Bảo mật tích hợp [228](#bảo-mật-tích-hợp-1)](#bảo-mật-tích-hợp-1)

[9.11.1 Nhà thầu phải cung cấp Integration Security Architecture Document, mô tả chi tiết cho từng điểm tích hợp: giao thức, phương thức xác thực, mã hóa, xử lý lỗi, và data flow diagram chỉ rõ dữ liệu nào được truyền qua từng kênh. [228](#nhà-thầu-phải-cung-cấp-integration-security-architecture-document-mô-tả-chi-tiết-cho-từng-điểm-tích-hợp-giao-thức-phương-thức-xác-thực-mã-hóa-xử-lý-lỗi-và-data-flow-diagram-chỉ-rõ-dữ-liệu-nào-được-truyền-qua-từng-kênh.)](#nhà-thầu-phải-cung-cấp-integration-security-architecture-document-mô-tả-chi-tiết-cho-từng-điểm-tích-hợp-giao-thức-phương-thức-xác-thực-mã-hóa-xử-lý-lỗi-và-data-flow-diagram-chỉ-rõ-dữ-liệu-nào-được-truyền-qua-từng-kênh.)

[3. Nguyên tắc bảo mật áp dụng cho tích hợp [230](#nguyên-tắc-bảo-mật-áp-dụng-cho-tích-hợp)](#nguyên-tắc-bảo-mật-áp-dụng-cho-tích-hợp)

[9.11.2 Tất cả API tích hợp phải sử dụng xác thực (OAuth 2.0 hoặc mTLS), rate limiting, và input validation tại điểm nhận. Webhook phải hỗ trợ signature verification (HMAC-SHA256). Credential tích hợp (API key, service account) phải lưu trong vault, rotation định kỳ, revoke khi phát hiện lộ. [231](#tất-cả-api-tích-hợp-phải-sử-dụng-xác-thực-oauth-2.0-hoặc-mtls-rate-limiting-và-input-validation-tại-điểm-nhận.-webhook-phải-hỗ-trợ-signature-verification-hmac-sha256.-credential-tích-hợp-api-key-service-account-phải-lưu-trong-vault-rotation-định-kỳ-revoke-khi-phát-hiện-lộ.)](#tất-cả-api-tích-hợp-phải-sử-dụng-xác-thực-oauth-2.0-hoặc-mtls-rate-limiting-và-input-validation-tại-điểm-nhận.-webhook-phải-hỗ-trợ-signature-verification-hmac-sha256.-credential-tích-hợp-api-key-service-account-phải-lưu-trong-vault-rotation-định-kỳ-revoke-khi-phát-hiện-lộ.)

[9.11.3 Khi tích hợp SSO với Azure AD, hệ thống phải đồng bộ trạng thái user (disable/delete) trong tối đa 15 phút. User bị disable trên AD phải bị terminate session trên HRM ngay tại lần kiểm tra tiếp theo. [233](#khi-tích-hợp-sso-với-azure-ad-hệ-thống-phải-đồng-bộ-trạng-thái-user-disabledelete-trong-tối-đa-15-phút.-user-bị-disable-trên-ad-phải-bị-terminate-session-trên-hrm-ngay-tại-lần-kiểm-tra-tiếp-theo.)](#khi-tích-hợp-sso-với-azure-ad-hệ-thống-phải-đồng-bộ-trạng-thái-user-disabledelete-trong-tối-đa-15-phút.-user-bị-disable-trên-ad-phải-bị-terminate-session-trên-hrm-ngay-tại-lần-kiểm-tra-tiếp-theo.)

[9.11.4 Data minimization: mỗi kênh tích hợp chỉ được truyền dữ liệu tối thiểu cần thiết. Nhà thầu phải cung cấp data mapping matrix cho từng điểm tích hợp. Tích hợp payroll/banking phải có integrity check (checksum hoặc digital signature) và maker-checker trước khi submit batch. [234](#data-minimization-mỗi-kênh-tích-hợp-chỉ-được-truyền-dữ-liệu-tối-thiểu-cần-thiết.-nhà-thầu-phải-cung-cấp-data-mapping-matrix-cho-từng-điểm-tích-hợp.-tích-hợp-payrollbanking-phải-có-integrity-check-checksum-hoặc-digital-signature-và-maker-checker-trước-khi-submit-batch.)](#data-minimization-mỗi-kênh-tích-hợp-chỉ-được-truyền-dữ-liệu-tối-thiểu-cần-thiết.-nhà-thầu-phải-cung-cấp-data-mapping-matrix-cho-từng-điểm-tích-hợp.-tích-hợp-payrollbanking-phải-có-integrity-check-checksum-hoặc-digital-signature-và-maker-checker-trước-khi-submit-batch.)

[9.11.5 Khi tích hợp fail, dữ liệu phải được queue an toàn, mã hóa at rest, retry tự động. Không lưu plaintext PII vào temp folder hoặc log. Audit log cho tất cả dữ liệu trao đổi qua kênh tích hợp. [236](#khi-tích-hợp-fail-dữ-liệu-phải-được-queue-an-toàn-mã-hóa-at-rest-retry-tự-động.-không-lưu-plaintext-pii-vào-temp-folder-hoặc-log.-audit-log-cho-tất-cả-dữ-liệu-trao-đổi-qua-kênh-tích-hợp.)](#khi-tích-hợp-fail-dữ-liệu-phải-được-queue-an-toàn-mã-hóa-at-rest-retry-tự-động.-không-lưu-plaintext-pii-vào-temp-folder-hoặc-log.-audit-log-cho-tất-cả-dữ-liệu-trao-đổi-qua-kênh-tích-hợp.)

[9.12 Bảo vệ dữ liệu cá nhâ [237](#bảo-vệ-dữ-liệu-cá-nhâ)](#bảo-vệ-dữ-liệu-cá-nhâ)

[9.12.1 Tuân thủ Nghị định 13/2023/NĐ-CP: có cơ sở pháp lý xử lý dữ liệu cá nhân, thông báo cho chủ thể dữ liệu, thực hiện đánh giá tác động (DPIA) cho hệ thống HRM. Dữ liệu nhân sự SSI phải được lưu trữ tại Việt Nam (data residency). [237](#tuân-thủ-nghị-định-132023nđ-cp-có-cơ-sở-pháp-lý-xử-lý-dữ-liệu-cá-nhân-thông-báo-cho-chủ-thể-dữ-liệu-thực-hiện-đánh-giá-tác-động-dpia-cho-hệ-thống-hrm.-dữ-liệu-nhân-sự-ssi-phải-được-lưu-trữ-tại-việt-nam-data-residency.)](#tuân-thủ-nghị-định-132023nđ-cp-có-cơ-sở-pháp-lý-xử-lý-dữ-liệu-cá-nhân-thông-báo-cho-chủ-thể-dữ-liệu-thực-hiện-đánh-giá-tác-động-dpia-cho-hệ-thống-hrm.-dữ-liệu-nhân-sự-ssi-phải-được-lưu-trữ-tại-việt-nam-data-residency.)

[9.12.2 Data masking/redaction: các trường nhạy cảm (CMND/CCCD, số tài khoản ngân hàng, mức lương) phải được che khi hiển thị (ví dụ: chỉ hiển thị 4 số cuối). Cấm sử dụng dữ liệu production trong môi trường test/staging; yêu cầu data anonymization/pseudonymization cho test data. [238](#data-maskingredaction-các-trường-nhạy-cảm-cmndcccd-số-tài-khoản-ngân-hàng-mức-lương-phải-được-che-khi-hiển-thị-ví-dụ-chỉ-hiển-thị-4-số-cuối.-cấm-sử-dụng-dữ-liệu-production-trong-môi-trường-teststaging-yêu-cầu-data-anonymizationpseudonymization-cho-test-data.)](#data-maskingredaction-các-trường-nhạy-cảm-cmndcccd-số-tài-khoản-ngân-hàng-mức-lương-phải-được-che-khi-hiển-thị-ví-dụ-chỉ-hiển-thị-4-số-cuối.-cấm-sử-dụng-dữ-liệu-production-trong-môi-trường-teststaging-yêu-cầu-data-anonymizationpseudonymization-cho-test-data.)

[9.12.3 Data retention policy: quy định thời gian lưu trữ và quy trình xóa/ẩn danh hóa dữ liệu nhân sự khi nhân viên nghỉ việc, phù hợp với quy định pháp luật lao động và Nghị định 13. [239](#data-retention-policy-quy-định-thời-gian-lưu-trữ-và-quy-trình-xóaẩn-danh-hóa-dữ-liệu-nhân-sự-khi-nhân-viên-nghỉ-việc-phù-hợp-với-quy-định-pháp-luật-lao-động-và-nghị-định-13.)](#data-retention-policy-quy-định-thời-gian-lưu-trữ-và-quy-trình-xóaẩn-danh-hóa-dữ-liệu-nhân-sự-khi-nhân-viên-nghỉ-việc-phù-hợp-với-quy-định-pháp-luật-lao-động-và-nghị-định-13.)

[9.13 Bảo mật API [240](#bảo-mật-api)](#bảo-mật-api)

[9.13.1 Tất cả API endpoints phải có xác thực (OAuth 2.0 hoặc API key) và phân quyền riêng biệt. Rate limiting per endpoint. Input validation riêng cho API, không phụ thuộc frontend validation. API key rotation định kỳ và cơ chế revoke ngay lập tức. [240](#tất-cả-api-endpoints-phải-có-xác-thực-oauth-2.0-hoặc-api-key-và-phân-quyền-riêng-biệt.-rate-limiting-per-endpoint.-input-validation-riêng-cho-api-không-phụ-thuộc-frontend-validation.-api-key-rotation-định-kỳ-và-cơ-chế-revoke-ngay-lập-tức.)](#tất-cả-api-endpoints-phải-có-xác-thực-oauth-2.0-hoặc-api-key-và-phân-quyền-riêng-biệt.-rate-limiting-per-endpoint.-input-validation-riêng-cho-api-không-phụ-thuộc-frontend-validation.-api-key-rotation-định-kỳ-và-cơ-chế-revoke-ngay-lập-tức.)

[9.14 Quy trình phát triển an toàn và quản lý lỗ hổng [241](#quy-trình-phát-triển-an-toàn-và-quản-lý-lỗ-hổng)](#quy-trình-phát-triển-an-toàn-và-quản-lý-lỗ-hổng)

[9.14.1 Nhà thầu phải có quy trình phát triển an toàn (SSDLC) và cung cấp tài liệu chứng minh. Pentest (kiểm thử xâm nhập) bắt buộc trước go-live và sau mỗi major release; báo cáo pentest phải được chia sẻ với bộ phận An ninh Thông tin SSI. [241](#nhà-thầu-phải-có-quy-trình-phát-triển-an-toàn-ssdlc-và-cung-cấp-tài-liệu-chứng-minh.-pentest-kiểm-thử-xâm-nhập-bắt-buộc-trước-go-live-và-sau-mỗi-major-release-báo-cáo-pentest-phải-được-chia-sẻ-với-bộ-phận-an-ninh-thông-tin-ssi.)](#nhà-thầu-phải-có-quy-trình-phát-triển-an-toàn-ssdlc-và-cung-cấp-tài-liệu-chứng-minh.-pentest-kiểm-thử-xâm-nhập-bắt-buộc-trước-go-live-và-sau-mỗi-major-release-báo-cáo-pentest-phải-được-chia-sẻ-với-bộ-phận-an-ninh-thông-tin-ssi.)

[9.14.1 Nhà thầu cam kết SLA patch lỗ hổng: Critical ≤ 72 giờ, High ≤ 7 ngày, Medium ≤ 30 ngày. Thông báo cho SSI (bộ phận ANTT) trong vòng 24 giờ khi phát hiện lỗ hổng bảo mật ảnh hưởng đến hệ thống HRM. [244](#nhà-thầu-cam-kết-sla-patch-lỗ-hổng-critical-72-giờ-high-7-ngày-medium-30-ngày.-thông-báo-cho-ssi-bộ-phận-antt-trong-vòng-24-giờ-khi-phát-hiện-lỗ-hổng-bảo-mật-ảnh-hưởng-đến-hệ-thống-hrm.)](#nhà-thầu-cam-kết-sla-patch-lỗ-hổng-critical-72-giờ-high-7-ngày-medium-30-ngày.-thông-báo-cho-ssi-bộ-phận-antt-trong-vòng-24-giờ-khi-phát-hiện-lỗ-hổng-bảo-mật-ảnh-hưởng-đến-hệ-thống-hrm.)

[10. Nền tảng và hạ tầng [245](#nền-tảng-và-hạ-tầng)](#nền-tảng-và-hạ-tầng)

[10.1 Yêu cầu chung [245](#yêu-cầu-chung-2)](#yêu-cầu-chung-2)

[10.1.1 Nhà thầu đề xuất và mô tả về cơ sở hạ tầng phần cứng cần thiết để triển khai giải pháp đề xuất bao gồm hệ thống máy chủ, các thiết bị sao lưu & lưu trữ, thiết bị mạng, thiết bị cân bằng tải, thiết bị an ninh và thiết bị liên quan khác đáp ứng được yêu cầu về hiệu năng hệ thống. [245](#nhà-thầu-đề-xuất-và-mô-tả-về-cơ-sở-hạ-tầng-phần-cứng-cần-thiết-để-triển-khai-giải-pháp-đề-xuất-bao-gồm-hệ-thống-máy-chủ-các-thiết-bị-sao-lưu-lưu-trữ-thiết-bị-mạng-thiết-bị-cân-bằng-tải-thiết-bị-an-ninh-và-thiết-bị-liên-quan-khác-đáp-ứng-được-yêu-cầu-về-hiệu-năng-hệ-thống.)](#nhà-thầu-đề-xuất-và-mô-tả-về-cơ-sở-hạ-tầng-phần-cứng-cần-thiết-để-triển-khai-giải-pháp-đề-xuất-bao-gồm-hệ-thống-máy-chủ-các-thiết-bị-sao-lưu-lưu-trữ-thiết-bị-mạng-thiết-bị-cân-bằng-tải-thiết-bị-an-ninh-và-thiết-bị-liên-quan-khác-đáp-ứng-được-yêu-cầu-về-hiệu-năng-hệ-thống.)

[10.1.2 Nhà thầu đề xuất và mô tả mô hình logic và vật lý triển khai hạ tầng phần cứng đề xuất. [250](#nhà-thầu-đề-xuất-và-mô-tả-mô-hình-logic-và-vật-lý-triển-khai-hạ-tầng-phần-cứng-đề-xuất.)](#nhà-thầu-đề-xuất-và-mô-tả-mô-hình-logic-và-vật-lý-triển-khai-hạ-tầng-phần-cứng-đề-xuất.)

[10.1.3 Hệ thống đề xuất phải hỗ trợ khả năng active-passive (active/active) clustering và cân bằng tải (Load Balancing) cho các thành phần. Nhà thầu đề xuất và mô tả chi tiết về mô hình triển khai. [252](#hệ-thống-đề-xuất-phải-hỗ-trợ-khả-năng-active-passive-activeactive-clustering-và-cân-bằng-tải-load-balancing-cho-các-thành-phần.-nhà-thầu-đề-xuất-và-mô-tả-chi-tiết-về-mô-hình-triển-khai.)](#hệ-thống-đề-xuất-phải-hỗ-trợ-khả-năng-active-passive-activeactive-clustering-và-cân-bằng-tải-load-balancing-cho-các-thành-phần.-nhà-thầu-đề-xuất-và-mô-tả-chi-tiết-về-mô-hình-triển-khai.)

[10.1.4 \[Đáp ứng\] Nhà thầu phải đảm bảo rằng hạ tầng phần cứng đề xuất phải có độ tin cậy cao, có khả năng chịu lỗi và có tính sẵn sàng cao. [256](#đáp-ứng-nhà-thầu-phải-đảm-bảo-rằng-hạ-tầng-phần-cứng-đề-xuất-phải-có-độ-tin-cậy-cao-có-khả-năng-chịu-lỗi-và-có-tính-sẵn-sàng-cao.)](#đáp-ứng-nhà-thầu-phải-đảm-bảo-rằng-hạ-tầng-phần-cứng-đề-xuất-phải-có-độ-tin-cậy-cao-có-khả-năng-chịu-lỗi-và-có-tính-sẵn-sàng-cao.)

[10.1.5 \[Đáp ứng\] Nhà thầu phải đảm bảo rằng nền tảng và cơ sở hạ tầng được đề xuất phải hoàn toàn tương thích với hệ thống đề xuất. [257](#đáp-ứng-nhà-thầu-phải-đảm-bảo-rằng-nền-tảng-và-cơ-sở-hạ-tầng-được-đề-xuất-phải-hoàn-toàn-tương-thích-với-hệ-thống-đề-xuất.)](#đáp-ứng-nhà-thầu-phải-đảm-bảo-rằng-nền-tảng-và-cơ-sở-hạ-tầng-được-đề-xuất-phải-hoàn-toàn-tương-thích-với-hệ-thống-đề-xuất.)

[10.1.6 \[Đáp ứng\] Nhà thầu phải đảm bảo rằng hệ thống có thể tương thích với phiên bản mới nhất của hệ thống bên thứ ba thuộc giải pháp đề xuất (cơ sở dữ liệu, phần mềm lớp giữa, hệ điều hành, các phần mềm và công cụ hỗ trợ ). [258](#đáp-ứng-nhà-thầu-phải-đảm-bảo-rằng-hệ-thống-có-thể-tương-thích-với-phiên-bản-mới-nhất-của-hệ-thống-bên-thứ-ba-thuộc-giải-pháp-đề-xuất-cơ-sở-dữ-liệu-phần-mềm-lớp-giữa-hệ-điều-hành-các-phần-mềm-và-công-cụ-hỗ-trợ-.)](#đáp-ứng-nhà-thầu-phải-đảm-bảo-rằng-hệ-thống-có-thể-tương-thích-với-phiên-bản-mới-nhất-của-hệ-thống-bên-thứ-ba-thuộc-giải-pháp-đề-xuất-cơ-sở-dữ-liệu-phần-mềm-lớp-giữa-hệ-điều-hành-các-phần-mềm-và-công-cụ-hỗ-trợ-.)

[10.1.7 \[Đáp ứng\] Trường hợp hệ thống có sử dụng nền tảng cloud thì phải công bố SLA tham chiếu theo yêu cầu về tính sẵn sàng và hiệu năng tương ứng với các yêu cầu về Hiệu năng và Tính sẵn sàng trong sheet Non-Fuctional Requirements [259](#đáp-ứng-trường-hợp-hệ-thống-có-sử-dụng-nền-tảng-cloud-thì-phải-công-bố-sla-tham-chiếu-theo-yêu-cầu-về-tính-sẵn-sàng-và-hiệu-năng-tương-ứng-với-các-yêu-cầu-về-hiệu-năng-và-tính-sẵn-sàng-trong-sheet-non-fuctional-requirements)](#đáp-ứng-trường-hợp-hệ-thống-có-sử-dụng-nền-tảng-cloud-thì-phải-công-bố-sla-tham-chiếu-theo-yêu-cầu-về-tính-sẵn-sàng-và-hiệu-năng-tương-ứng-với-các-yêu-cầu-về-hiệu-năng-và-tính-sẵn-sàng-trong-sheet-non-fuctional-requirements)

[10.2 Máy chủ [260](#máy-chủ)](#máy-chủ)

[10.2.1 \[Đáp ứng\] Nhà thầu phải đề xuất/ khuyến nghị cấu hình phần cứng máy chủ cho tất cả các môi trường bao gồm môi trường: Production, sẵn sàng cao (HA), phòng chống thảm họa (DR), phát triển, đáp ứng yêu cầu về hiệu năng của SSI. Nhà thầu không cần cung cấp phần cứng cho SSI. [260](#đáp-ứng-nhà-thầu-phải-đề-xuất-khuyến-nghị-cấu-hình-phần-cứng-máy-chủ-cho-tất-cả-các-môi-trường-bao-gồm-môi-trường-production-sẵn-sàng-cao-ha-phòng-chống-thảm-họa-dr-phát-triển-đáp-ứng-yêu-cầu-về-hiệu-năng-của-ssi.-nhà-thầu-không-cần-cung-cấp-phần-cứng-cho-ssi.)](#đáp-ứng-nhà-thầu-phải-đề-xuất-khuyến-nghị-cấu-hình-phần-cứng-máy-chủ-cho-tất-cả-các-môi-trường-bao-gồm-môi-trường-production-sẵn-sàng-cao-ha-phòng-chống-thảm-họa-dr-phát-triển-đáp-ứng-yêu-cầu-về-hiệu-năng-của-ssi.-nhà-thầu-không-cần-cung-cấp-phần-cứng-cho-ssi.)

[10.2.2 \[Đáp ứng\] Phần cứng máy chủ đề xuất phải hoàn toàn tương thích với phần ứng dụng đề xuất, hệ điều hành, phần mềm lớp giữa, cơ sở dữ liệu, các phần mềm và công cụ của bên thứ ba. [262](#đáp-ứng-phần-cứng-máy-chủ-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-ứng-dụng-đề-xuất-hệ-điều-hành-phần-mềm-lớp-giữa-cơ-sở-dữ-liệu-các-phần-mềm-và-công-cụ-của-bên-thứ-ba.)](#đáp-ứng-phần-cứng-máy-chủ-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-ứng-dụng-đề-xuất-hệ-điều-hành-phần-mềm-lớp-giữa-cơ-sở-dữ-liệu-các-phần-mềm-và-công-cụ-của-bên-thứ-ba.)

[10.2.3 \[Đáp ứng\] Nhà thầu vui lòng cung cấp cơ sở tính toán của việc đề xuất cấu hình phần cứng của hệ thống máy chủ. Đồng thời cung cấp tài liệu tham chiếu về khách hàng của họ đã sử dụng máy chủ tương tự bao gồm thông tin về các đặc tả kỹ thuật phần cứng máy chủ, sơ đồ triển khai, vv [263](#đáp-ứng-nhà-thầu-vui-lòng-cung-cấp-cơ-sở-tính-toán-của-việc-đề-xuất-cấu-hình-phần-cứng-của-hệ-thống-máy-chủ.-đồng-thời-cung-cấp-tài-liệu-tham-chiếu-về-khách-hàng-của-họ-đã-sử-dụng-máy-chủ-tương-tự-bao-gồm-thông-tin-về-các-đặc-tả-kỹ-thuật-phần-cứng-máy-chủ-sơ-đồ-triển-khai-vv)](#đáp-ứng-nhà-thầu-vui-lòng-cung-cấp-cơ-sở-tính-toán-của-việc-đề-xuất-cấu-hình-phần-cứng-của-hệ-thống-máy-chủ.-đồng-thời-cung-cấp-tài-liệu-tham-chiếu-về-khách-hàng-của-họ-đã-sử-dụng-máy-chủ-tương-tự-bao-gồm-thông-tin-về-các-đặc-tả-kỹ-thuật-phần-cứng-máy-chủ-sơ-đồ-triển-khai-vv)

[10.2.4 \[Đáp ứng\] Phần cứng máy chủ được đề xuất phải có khả năng nâng cấp và mở rộng về bộ xử lý, bộ nhớ và lưu trữ, vv [265](#đáp-ứng-phần-cứng-máy-chủ-được-đề-xuất-phải-có-khả-năng-nâng-cấp-và-mở-rộng-về-bộ-xử-lý-bộ-nhớ-và-lưu-trữ-vv)](#đáp-ứng-phần-cứng-máy-chủ-được-đề-xuất-phải-có-khả-năng-nâng-cấp-và-mở-rộng-về-bộ-xử-lý-bộ-nhớ-và-lưu-trữ-vv)

[10.3 Hệ điều hành [266](#hệ-điều-hành)](#hệ-điều-hành)

[10.3.1 \[Đáp ứng\] Nhà thầu phải đề xuất hệ điều hành sẽ được sử dụng cho hệ thống là các hệ điều hành được sử dụng phổ biến và đã được kiểm chứng như Linux, Windows, AIX. Phiên bản sử dụng phải là các phiên bản mới được phát hành và sử dụng rộng rãi trong thời gian 3 năm gần đây. (Ưu tiên hệ thống sử dụng nền tảng Redhat Linux và Windows trên CPU x86). [266](#đáp-ứng-nhà-thầu-phải-đề-xuất-hệ-điều-hành-sẽ-được-sử-dụng-cho-hệ-thống-là-các-hệ-điều-hành-được-sử-dụng-phổ-biến-và-đã-được-kiểm-chứng-như-linux-windows-aix.-phiên-bản-sử-dụng-phải-là-các-phiên-bản-mới-được-phát-hành-và-sử-dụng-rộng-rãi-trong-thời-gian-3-năm-gần-đây.-ưu-tiên-hệ-thống-sử-dụng-nền-tảng-redhat-linux-và-windows-trên-cpu-x86.)](#đáp-ứng-nhà-thầu-phải-đề-xuất-hệ-điều-hành-sẽ-được-sử-dụng-cho-hệ-thống-là-các-hệ-điều-hành-được-sử-dụng-phổ-biến-và-đã-được-kiểm-chứng-như-linux-windows-aix.-phiên-bản-sử-dụng-phải-là-các-phiên-bản-mới-được-phát-hành-và-sử-dụng-rộng-rãi-trong-thời-gian-3-năm-gần-đây.-ưu-tiên-hệ-thống-sử-dụng-nền-tảng-redhat-linux-và-windows-trên-cpu-x86.)

[10.3.2 \[Đáp ứng\] Hệ điều hành được đề xuất phải hoàn toàn tương thích với phần cứng, phần mềm ứng dụng, cơ sở dữ liệu, phần mềm lớp giữa, các phần mềm và công cụ của bên thứ ba đề xuất. [267](#đáp-ứng-hệ-điều-hành-được-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-cứng-phần-mềm-ứng-dụng-cơ-sở-dữ-liệu-phần-mềm-lớp-giữa-các-phần-mềm-và-công-cụ-của-bên-thứ-ba-đề-xuất.)](#đáp-ứng-hệ-điều-hành-được-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-cứng-phần-mềm-ứng-dụng-cơ-sở-dữ-liệu-phần-mềm-lớp-giữa-các-phần-mềm-và-công-cụ-của-bên-thứ-ba-đề-xuất.)

[10.3.3 \[Đáp ứng\] Nhà thầu phải hỗ trợ SSI trong việc cập nhật phiên bản hệ điều hành mới / bản vá lỗi bất cứ khi nào phiên bản đó được chính thức phát hành. Nhà thầu phải đảm bảo khả năng tương thích của hệ thống HRM với các phiên bản mới hệ điều hành/ bản vá lỗi đó. [268](#đáp-ứng-nhà-thầu-phải-hỗ-trợ-ssi-trong-việc-cập-nhật-phiên-bản-hệ-điều-hành-mới-bản-vá-lỗi-bất-cứ-khi-nào-phiên-bản-đó-được-chính-thức-phát-hành.-nhà-thầu-phải-đảm-bảo-khả-năng-tương-thích-của-hệ-thống-hrm-với-các-phiên-bản-mới-hệ-điều-hành-bản-vá-lỗi-đó.)](#đáp-ứng-nhà-thầu-phải-hỗ-trợ-ssi-trong-việc-cập-nhật-phiên-bản-hệ-điều-hành-mới-bản-vá-lỗi-bất-cứ-khi-nào-phiên-bản-đó-được-chính-thức-phát-hành.-nhà-thầu-phải-đảm-bảo-khả-năng-tương-thích-của-hệ-thống-hrm-với-các-phiên-bản-mới-hệ-điều-hành-bản-vá-lỗi-đó.)

[10.4 Network [269](#network)](#network)

[10.4.1 \[Đáp ứng\] Nhà thầu cung cấp mô hình mạng theo giải pháp đề xuất cho phép tích hợp với mô hình mạng hiện tại của SSI. [269](#đáp-ứng-nhà-thầu-cung-cấp-mô-hình-mạng-theo-giải-pháp-đề-xuất-cho-phép-tích-hợp-với-mô-hình-mạng-hiện-tại-của-ssi.)](#đáp-ứng-nhà-thầu-cung-cấp-mô-hình-mạng-theo-giải-pháp-đề-xuất-cho-phép-tích-hợp-với-mô-hình-mạng-hiện-tại-của-ssi.)

[10.4.2 \[Đáp ứng\] Mô hình đề xuất của nhà thầu phải tương thích với hệ thống hiện tại của SSI ở mức cao nhất. [270](#đáp-ứng-mô-hình-đề-xuất-của-nhà-thầu-phải-tương-thích-với-hệ-thống-hiện-tại-của-ssi-ở-mức-cao-nhất.)](#đáp-ứng-mô-hình-đề-xuất-của-nhà-thầu-phải-tương-thích-với-hệ-thống-hiện-tại-của-ssi-ở-mức-cao-nhất.)

[10.4.3 \[Đáp ứng\] Giải pháp phải có giao diện: Quản lý lưu lượng: tốc độ 1 Gbps. Sử dụng lưu lượng: tốc độ tối thiểu 10 Gbps, sử dụng giao diện quang. [271](#đáp-ứng-giải-pháp-phải-có-giao-diện-quản-lý-lưu-lượng-tốc-độ-1-gbps.-sử-dụng-lưu-lượng-tốc-độ-tối-thiểu-10-gbps-sử-dụng-giao-diện-quang.)](#đáp-ứng-giải-pháp-phải-có-giao-diện-quản-lý-lưu-lượng-tốc-độ-1-gbps.-sử-dụng-lưu-lượng-tốc-độ-tối-thiểu-10-gbps-sử-dụng-giao-diện-quang.)

[10.5 Lưu trữ & sao lưu dữ liệu [272](#lưu-trữ-sao-lưu-dữ-liệu)](#lưu-trữ-sao-lưu-dữ-liệu)

[10.5.1 \[Đáp ứng\] Nhà thầu phải đề xuất hệ thống các thiết bị lưu trữ và sao lưu đáp ứng các yêu cầu của hệ thống cũng như nhu cầu phát triển của SSI dựa trên việc khảo sát hệ thống lưu trữ và sao lưu hiện có của SSI. [273](#đáp-ứng-nhà-thầu-phải-đề-xuất-hệ-thống-các-thiết-bị-lưu-trữ-và-sao-lưu-đáp-ứng-các-yêu-cầu-của-hệ-thống-cũng-như-nhu-cầu-phát-triển-của-ssi-dựa-trên-việc-khảo-sát-hệ-thống-lưu-trữ-và-sao-lưu-hiện-có-của-ssi.)](#đáp-ứng-nhà-thầu-phải-đề-xuất-hệ-thống-các-thiết-bị-lưu-trữ-và-sao-lưu-đáp-ứng-các-yêu-cầu-của-hệ-thống-cũng-như-nhu-cầu-phát-triển-của-ssi-dựa-trên-việc-khảo-sát-hệ-thống-lưu-trữ-và-sao-lưu-hiện-có-của-ssi.)

[10.5.2 \[Đáp ứng\] Giải pháp sao lưu phải hỗ trợ backup khối lượng dữ liệu lớn và đảm bảo rằng nó không ảnh hưởng đến hiệu năng hệ thống. [274](#đáp-ứng-giải-pháp-sao-lưu-phải-hỗ-trợ-backup-khối-lượng-dữ-liệu-lớn-và-đảm-bảo-rằng-nó-không-ảnh-hưởng-đến-hiệu-năng-hệ-thống.)](#đáp-ứng-giải-pháp-sao-lưu-phải-hỗ-trợ-backup-khối-lượng-dữ-liệu-lớn-và-đảm-bảo-rằng-nó-không-ảnh-hưởng-đến-hiệu-năng-hệ-thống.)

[10.5.3 \[Đáp ứng\] Hệ thống lưu trữ và sao lưu dữ liệu được đề xuất phải có khả năng nâng cấp và mở rộng về khả năng xử lý, dung lượng lưu trữ. [276](#đáp-ứng-hệ-thống-lưu-trữ-và-sao-lưu-dữ-liệu-được-đề-xuất-phải-có-khả-năng-nâng-cấp-và-mở-rộng-về-khả-năng-xử-lý-dung-lượng-lưu-trữ.)](#đáp-ứng-hệ-thống-lưu-trữ-và-sao-lưu-dữ-liệu-được-đề-xuất-phải-có-khả-năng-nâng-cấp-và-mở-rộng-về-khả-năng-xử-lý-dung-lượng-lưu-trữ.)

[10.5.4 \[Đáp ứng\] Giải pháp sao lưu tích hợp, khai thác hiệu quả với hệ thống sao lưu của SSI [277](#đáp-ứng-giải-pháp-sao-lưu-tích-hợp-khai-thác-hiệu-quả-với-hệ-thống-sao-lưu-của-ssi)](#đáp-ứng-giải-pháp-sao-lưu-tích-hợp-khai-thác-hiệu-quả-với-hệ-thống-sao-lưu-của-ssi)

[10.5.5 Kết nối các máy chủ, các thiết bị lưu trữ và sao lưu dữ liệu phải là cáp quang và tốc độ tối thiểu là 16Gbps. [278](#kết-nối-các-máy-chủ-các-thiết-bị-lưu-trữ-và-sao-lưu-dữ-liệu-phải-là-cáp-quang-và-tốc-độ-tối-thiểu-là-16gbps.)](#kết-nối-các-máy-chủ-các-thiết-bị-lưu-trữ-và-sao-lưu-dữ-liệu-phải-là-cáp-quang-và-tốc-độ-tối-thiểu-là-16gbps.)

[10.5.6 Các thiết bị lưu trữ và sao lưu dữ liệu đề xuất phải hoàn toàn tương thích với phần cứng máy chủ đề xuất. [278](#các-thiết-bị-lưu-trữ-và-sao-lưu-dữ-liệu-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-cứng-máy-chủ-đề-xuất.)](#các-thiết-bị-lưu-trữ-và-sao-lưu-dữ-liệu-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-cứng-máy-chủ-đề-xuất.)

[10.6 Cơ sở dữ liệu [278](#cơ-sở-dữ-liệu)](#cơ-sở-dữ-liệu)

[10.6.1 Cơ sở dữ liệu đề xuất phải là các hệ CSDL phổ biến và sử dụng rộng rãi cho các hệ thống lớn và có cộng đồng sử dụng lớn (như Oracle, Microsoft SQL, MySQL,\...) và hoàn toàn tương thích với phần cứng, hệ điều hành, phần mềm ứng dụng, các phần mềm và công cụ của bên thứ ba đã đề xuất. [278](#cơ-sở-dữ-liệu-đề-xuất-phải-là-các-hệ-csdl-phổ-biến-và-sử-dụng-rộng-rãi-cho-các-hệ-thống-lớn-và-có-cộng-đồng-sử-dụng-lớn-như-oracle-microsoft-sql-mysql...-và-hoàn-toàn-tương-thích-với-phần-cứng-hệ-điều-hành-phần-mềm-ứng-dụng-các-phần-mềm-và-công-cụ-của-bên-thứ-ba-đã-đề-xuất.)](#cơ-sở-dữ-liệu-đề-xuất-phải-là-các-hệ-csdl-phổ-biến-và-sử-dụng-rộng-rãi-cho-các-hệ-thống-lớn-và-có-cộng-đồng-sử-dụng-lớn-như-oracle-microsoft-sql-mysql...-và-hoàn-toàn-tương-thích-với-phần-cứng-hệ-điều-hành-phần-mềm-ứng-dụng-các-phần-mềm-và-công-cụ-của-bên-thứ-ba-đã-đề-xuất.)

[10.6.2 Nhà thầu phải cung cấp tài liệu hướng dẫn cài đặt, vận hành, quản trị ,khôi phục khi gặp sự cố cũng như phương án xử lý các lỗi thường gặp của hệ thống cơ sở dữ liệu đề xuất. [280](#nhà-thầu-phải-cung-cấp-tài-liệu-hướng-dẫn-cài-đặt-vận-hành-quản-trị-khôi-phục-khi-gặp-sự-cố-cũng-như-phương-án-xử-lý-các-lỗi-thường-gặp-của-hệ-thống-cơ-sở-dữ-liệu-đề-xuất.)](#nhà-thầu-phải-cung-cấp-tài-liệu-hướng-dẫn-cài-đặt-vận-hành-quản-trị-khôi-phục-khi-gặp-sự-cố-cũng-như-phương-án-xử-lý-các-lỗi-thường-gặp-của-hệ-thống-cơ-sở-dữ-liệu-đề-xuất.)

[10.6.3 Mô hình triển khai cho hệ thống cơ sở dữ liệu cần sử dụng công nghệ đáp ứng được tính sẵn sàng cao - High Availability (như Oracle Real Application Cluster, SQL Server Always on Failover Cluster,...) [282](#mô-hình-triển-khai-cho-hệ-thống-cơ-sở-dữ-liệu-cần-sử-dụng-công-nghệ-đáp-ứng-được-tính-sẵn-sàng-cao---high-availability-như-oracle-real-application-cluster-sql-server-always-on-failover-cluster)](#mô-hình-triển-khai-cho-hệ-thống-cơ-sở-dữ-liệu-cần-sử-dụng-công-nghệ-đáp-ứng-được-tính-sẵn-sàng-cao---high-availability-như-oracle-real-application-cluster-sql-server-always-on-failover-cluster)

[10.6.4 Hệ thống cơ sở dữ liệu cần có giải pháp công nghệ để khôi phục và dự phòng thảm họa - Disaster Recovery( như Oracle Dataguard,...) [284](#hệ-thống-cơ-sở-dữ-liệu-cần-có-giải-pháp-công-nghệ-để-khôi-phục-và-dự-phòng-thảm-họa---disaster-recovery-như-oracle-dataguard)](#hệ-thống-cơ-sở-dữ-liệu-cần-có-giải-pháp-công-nghệ-để-khôi-phục-và-dự-phòng-thảm-họa---disaster-recovery-như-oracle-dataguard)

[10.7 Máy trạm [285](#máy-trạm-1)](#máy-trạm-1)

[10.7.1 Nhà thầu đưa ra mức độ sử dụng performance dự kiến (CPU, RAM,..), đối với các phần mềm cần cài đặt cho Dự Án trên máy trạm người dùng cuối. [285](#nhà-thầu-đưa-ra-mức-độ-sử-dụng-performance-dự-kiến-cpu-ram..-đối-với-các-phần-mềm-cần-cài-đặt-cho-dự-án-trên-máy-trạm-người-dùng-cuối.)](#nhà-thầu-đưa-ra-mức-độ-sử-dụng-performance-dự-kiến-cpu-ram..-đối-với-các-phần-mềm-cần-cài-đặt-cho-dự-án-trên-máy-trạm-người-dùng-cuối.)

[10.7.2 Hệ thống đề xuất phải hỗ trợ các máy trạm chạy hệ điều hành từ phiên bản MS Windows 7 trở lên. Phải hỗ trợ kiến trúc OS 64bit [286](#hệ-thống-đề-xuất-phải-hỗ-trợ-các-máy-trạm-chạy-hệ-điều-hành-từ-phiên-bản-ms-windows-7-trở-lên.-phải-hỗ-trợ-kiến-trúc-os-64bit)](#hệ-thống-đề-xuất-phải-hỗ-trợ-các-máy-trạm-chạy-hệ-điều-hành-từ-phiên-bản-ms-windows-7-trở-lên.-phải-hỗ-trợ-kiến-trúc-os-64bit)

[10.7.3 Hệ thống đề xuất phải hỗ trợ các máy trạm truy cập từ nhiều trình duyệt Internet bao gồm: Internet Explorer 10 hoặc cao hơn;Google Chrome 45.0 hoặc cao hơn; Firefox phiên bản 40.0 hoặc cao hơn;Microsoft Edge [288](#hệ-thống-đề-xuất-phải-hỗ-trợ-các-máy-trạm-truy-cập-từ-nhiều-trình-duyệt-internet-bao-gồm-internet-explorer-10-hoặc-cao-hơngoogle-chrome-45.0-hoặc-cao-hơn-firefox-phiên-bản-40.0-hoặc-cao-hơnmicrosoft-edge)](#hệ-thống-đề-xuất-phải-hỗ-trợ-các-máy-trạm-truy-cập-từ-nhiều-trình-duyệt-internet-bao-gồm-internet-explorer-10-hoặc-cao-hơngoogle-chrome-45.0-hoặc-cao-hơn-firefox-phiên-bản-40.0-hoặc-cao-hơnmicrosoft-edge)

[10.7.4 Nhà thầu đề xuất các phần mềm và công cụ cần thiết khác cần phải được cài đặt trên máy trạm nếu có. [288](#nhà-thầu-đề-xuất-các-phần-mềm-và-công-cụ-cần-thiết-khác-cần-phải-được-cài-đặt-trên-máy-trạm-nếu-có.)](#nhà-thầu-đề-xuất-các-phần-mềm-và-công-cụ-cần-thiết-khác-cần-phải-được-cài-đặt-trên-máy-trạm-nếu-có.)

[10.8 Các phần mềm/ công cụ của bên thứ 3 [288](#các-phần-mềm-công-cụ-của-bên-thứ-3)](#các-phần-mềm-công-cụ-của-bên-thứ-3)

[10.8.1 Nhà thầu phải đề xuất và mô tả chi tiết các phần mềm và các công cụ hỗ trợ của bên thứ 3 cần thiết cho việc triển khai giải pháp. [289](#nhà-thầu-phải-đề-xuất-và-mô-tả-chi-tiết-các-phần-mềm-và-các-công-cụ-hỗ-trợ-của-bên-thứ-3-cần-thiết-cho-việc-triển-khai-giải-pháp.-2)](#nhà-thầu-phải-đề-xuất-và-mô-tả-chi-tiết-các-phần-mềm-và-các-công-cụ-hỗ-trợ-của-bên-thứ-3-cần-thiết-cho-việc-triển-khai-giải-pháp.-2)

[10.8.2 Phần mềm và các công cụ hỗ trợ của bên thứ 3 được đề xuất phải hoàn toàn tương thích với phần cứng, hệ điều hành, cơ sở dữ liệu và giải pháp ứng dụng được đề xuất. [289](#phần-mềm-và-các-công-cụ-hỗ-trợ-của-bên-thứ-3-được-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-cứng-hệ-điều-hành-cơ-sở-dữ-liệu-và-giải-pháp-ứng-dụng-được-đề-xuất.-2)](#phần-mềm-và-các-công-cụ-hỗ-trợ-của-bên-thứ-3-được-đề-xuất-phải-hoàn-toàn-tương-thích-với-phần-cứng-hệ-điều-hành-cơ-sở-dữ-liệu-và-giải-pháp-ứng-dụng-được-đề-xuất.-2)

[10.8.3 Tất cả phần mềm và công cụ hỗ trợ của bên thứ 3 phải có bản quyền đầy đủ. [289](#tất-cả-phần-mềm-và-công-cụ-hỗ-trợ-của-bên-thứ-3-phải-có-bản-quyền-đầy-đủ.-2)](#tất-cả-phần-mềm-và-công-cụ-hỗ-trợ-của-bên-thứ-3-phải-có-bản-quyền-đầy-đủ.-2)

[10.8.4 Nhà thầu phải cung cấp tài liệu hướng dẫn vận hành và quản trị của phần mềm và các công cụ hỗ trợ của bên thứ 3. [289](#nhà-thầu-phải-cung-cấp-tài-liệu-hướng-dẫn-vận-hành-và-quản-trị-của-phần-mềm-và-các-công-cụ-hỗ-trợ-của-bên-thứ-3.-1)](#nhà-thầu-phải-cung-cấp-tài-liệu-hướng-dẫn-vận-hành-và-quản-trị-của-phần-mềm-và-các-công-cụ-hỗ-trợ-của-bên-thứ-3.-1)

[10.8.5 Trường hợp sử dụng nền Java, phần mềm và các công cụ hỗ trợ cài đặt trên máy trạm phải sử dụng Java có phiên bản phù hợp với SSI. [289](#trường-hợp-sử-dụng-nền-java-phần-mềm-và-các-công-cụ-hỗ-trợ-cài-đặt-trên-máy-trạm-phải-sử-dụng-java-có-phiên-bản-phù-hợp-với-ssi.)](#trường-hợp-sử-dụng-nền-java-phần-mềm-và-các-công-cụ-hỗ-trợ-cài-đặt-trên-máy-trạm-phải-sử-dụng-java-có-phiên-bản-phù-hợp-với-ssi.)

[10.8.6 Các phần mêm và công cụ hỗ trợ đảm bảo tuân thủ chính sách An Toàn Bảo Mật của SSI và phải được hỗ trợ qua kênh trực tiếp (không remote hỗ trợ qua các kênh như ultaview, teamview,...) [289](#các-phần-mêm-và-công-cụ-hỗ-trợ-đảm-bảo-tuân-thủ-chính-sách-an-toàn-bảo-mật-của-ssi-và-phải-được-hỗ-trợ-qua-kênh-trực-tiếp-không-remote-hỗ-trợ-qua-các-kênh-như-ultaview-teamview)](#các-phần-mêm-và-công-cụ-hỗ-trợ-đảm-bảo-tuân-thủ-chính-sách-an-toàn-bảo-mật-của-ssi-và-phải-được-hỗ-trợ-qua-kênh-trực-tiếp-không-remote-hỗ-trợ-qua-các-kênh-như-ultaview-teamview)

# 1. Cấu hình hệ thống 

##  1.1 Ngôn ngữ

