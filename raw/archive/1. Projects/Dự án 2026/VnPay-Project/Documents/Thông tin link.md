---
Mã:
aliases:
date: 2026-01-30
tags:
  - daily
Project: "[[TungLy/1. Projects/Dự án 2026/VnPay-Project/BrainStorming/Links/VnPay|VnPay]]"
---
# Link PE

\------------ Thông tin Link \-------------  
user đăng nhập superadmin : vnr / Qc@@123  
user đăng nhập thường: support / Qc@@123

main: 2111  
[https://pehn02.vnresource.net:2111](https://pehn02.vnresource.net:2111)

portal: 2112  
[https://pehn02.vnresource.net:2112](https://pehn02.vnresource.net:2112)

identity: 2116  
[https://pehn02.vnresource.net:2116](https://pehn02.vnresource.net:2116)

hr: 2113  
[https://pehn02.vnresource.net:2113](https://pehn02.vnresource.net:2113)

sys: 2114  
[https://pehn02.vnresource.net:2114](https://pehn02.vnresource.net:2114)

apiCore: 2115  
[https://pehn02.vnresource.net:2115/swagger/welcome](https://pehn02.vnresource.net:2115/swagger/welcome)/

window service: 2118  
[https://pehn02.vnresource.net:2118/hangfire](https://pehn02.vnresource.net:2118/hangfire)

HRM.Integration.Service.ApiCore: 2121  
[https://pehn02.vnresource.net:2121/swagger/welcome](https://pehn02.vnresource.net:2121/swagger/welcome)

VNPAY\_SurveyApi\_2123: 2123  
[https://pehn02.vnresource.net:2123/swagger/index.html](https://pehn02.vnresource.net:2123/swagger/index.html)

\------ Thông tin db \-------  
202.143.111.16,2268  
sa / jk\#2$JH&@dS  
Db: VNPAY

\------ Thông tin remote  \-------  
\-- Remote Desktop : 103.127.207.231:15973 \--  
vnr1 / ksgZHwCYgzFw-}RF  
vnr2 / %S=Dn8w8G6\#deCN=  
vnr3 / ZnmB$N4b8D64\!Vr\!

đường dẫn vnpay: D:\\TUANPHAM\\SOURCE\\VNPAY\\VnPay-NetCore\\

**—-- chuổi kết nối SQL server PE 202.143.111.16,2268 —---**  
Data Source=202.143.111.16,2268;Initial Catalog=VNPAY;Persist Security Info=True;User ID=sa;Password=PagEce4k07KaMz/jjT6CmXEZ56Z/Mg/CK/Y6ru+aCWA=;MultipleActiveResultSets=True;App=EntityFramework;TrustServerCertificate=True;

# PE \- Mô Tả Ý Nghĩa Các Sites

Remote server docker local vnpay  
172.21.55.11   
dev070126/\!x7$wYg%%9XRe\!7^

| Mô Tả Ý Nghĩa Các Sites của Link PE |  |  |  |  |  |
| ----- | :---- | :---- | :---- | :---- | :---- |
| **STT** | **Service / Module** | **Domain UAT** | **Mục đích / Chức năng** | **Người dùng chính** | **Ghi chú** |
| 1 | Portal | [https://vnpay-empportal.vnresource.net](https://vnpay-empportal.vnresource.net) | Cổng thông tin dành cho nhân viên, cho phép xem hồ sơ, bảng công, lương, nghỉ phép, phúc lợi… | Nhân viên | Giao diện dành cho cá nhân. \-\> Client to Server |
| 2 | Main | [https://vnpay-main.vnresource.net](https://vnpay-main.vnresource.net%20)  | Trang quản trị nội bộ HRM, quản lý hồ sơ, tuyển dụng, đào tạo và các báo cáo nhân sự. | HR, Quản lý nhân sự | Web quản lý chính. \-\> Client to Server |
| 3 | HR API | [https://vnpay-hr.vnresource.net](https://vnpay-hr.vnresource.net) | Xử lý các nghiệp vụ nhân sự như hồ sơ, công, và lương. | Portal, Main | Đây là API nghiệp vụ. \-\> Client to Server |
| 4 | SYS API | [https://vnpay-sys.vnresource.net](https://vnpay-sys.vnresource.net) | Quản lý bảo mật, phân quyền, tài khoản và cấu hình hệ thống. | Nội bộ hệ thống | Liên quan đến bảo mật (security). \-\> Client to Server |
| 5 | API Core (Internal) | [https://vnpay-apiv3.vnresource.net](https://vnpay-apiv3.vnresource.net) | API lõi nội bộ, chủ yếu phục vụ cho Portal. | Portal | API này không mở cho bên thứ 3\. \-\> Client to Server |
| 6 | Integration API | [https://vnpay-itgapi.vnresource.net](https://vnpay-itgapi.vnresource.net) | API dành cho các bên thứ ba tích hợp (TS24, MISA, Viettel,VnPay…) với hệ thống HRM. | Đối tác ngoài | Trao đổi dữ liệu. \-\> Server to Server |
| 7 | Identity | [https://vnpay-ids4.vnresource.net](https://vnpay-ids4.vnresource.net) | Dịch vụ xác thực (SSO, OAuth2, OpenID Connect), cấp token và phân quyền người dùng. | Tất cả người dùng hệ thống | Identity server. \-\> Client to Server |
| 8 | News | [https://vnpay-news.vnresource.net](https://vnpay-news.vnresource.net) | Trang tin tức nội bộ (WordPress) tích hợp với HRM qua SSO. | Nhân viên, HR | Đăng nhập một lần (Single Sign-On). \-\> Client to Server |
| 9 | Survey API | [https://vnpay-apiSurvey.vnresource.net](https://vnpay-apiSurvey.vnresource.net) | Hệ thống khảo sát nội bộ, có cơ sở dữ liệu riêng biệt và tích hợp với HRM. | Nhân viên, HR, Quản lý | Source độc lập. Database độc lập. \-\> Client to Server |
| 10 | Chat API | [https://vnpay-chat.vnresource.net](https://vnpay-chat.vnresource.net) | Dịch vụ chat. | Nhân viên | Chạy trên portal \-\> Client to Server |
| 11 | Chat FE | [https://vnpay-chatfe.vnresource.net](https://vnpay-chatfe.vnresource.net) | Giao diện chat nhúng trên portal | Nhân viên | Chạy trên portal \-\> Client to Server |
| 12 | Windows Service Core | [https://vnpay-ws.vnresource.net](https://vnpay-ws.vnresource.net) | Chạy ngầm các tác vụ định kỳ (theo phút, giờ, ngày, tháng) như đồng bộ dữ liệu, gửi email, xử lý công và lương. | Hệ thống chạy nền | Service nền. |
| 13 | dashboad traefik | [https://vnpay-traefik.vnresource.net](https://vnpay-traefik.vnresource.net)  | cho phép xem router, service, middleware của các microservice. Hỗ trợ giám sát reverse proxy, load balancing, TLS | IT | Xem trên UI  |

# Link QC

 \------------ Thông tin Link server QC \-------------  
user đăng nhập : vnr / Qc@@123

main: 2801  
[https://vnpay.dev.local:2801](https://vnpay.dev.local:2801)

portal: 2802  
[https://vnpay.dev.local:2802](https://vnpay.dev.local:2802)

identity: 2800  
[https://vnpay.dev.local:2800](https://vnpay.dev.local:2800)

hr: 2803  
[https://vnpay.dev.local:2803](https://vnpay.dev.local:2803)

sys: 2804  
[https://vnpay.dev.local:2804](https://vnpay.dev.local:2804)

apiCore: 2805  
[https://vnpay.dev.local:2805/swagger/welcome](https://vnpay.dev.local:2805/swagger/welcome)

windowService: 2806  
[https://vnpay.dev.local:2806/hangfire](https://vnpay.dev.local:2806/hangfire)

IntegratgeapiCore: 2807  
[https://vnpay.dev.local:2807/swagger/welcome](https://vnpay.dev.local:2807/swagger/welcome)

—-- Thông tin db: —-----  
server: 172.21.55.3,1968  
user/pass: se / Xq3EPN4w2aAiAkp  
db: HRMPRO12\_VNPAY

\------ Thông tin ultra server qc  \-------  
ID của bạn: 39597282  
Mật khẩu: asd@1234

đường dẫn vnpay qc:  D:\\TestDuAn\\VnPay

**—-- chuổi kết nối SQL server QC** 172.21.55.3,1968 **—---**  
Data Source=172.21.55.3,1968;Initial Catalog=HRMPRO12\_VNPAY;Persist Security Info=True;User ID=sa;Password=X/QpC0ui1vDvMRla+64xIWTMY2K3bbHeOttA5uB91SgoGacqz5xAaWc6H4r50BCV;MultipleActiveResultSets=True;App=EntityFramework;TrustServerCertificate=True;

Hoặc

Data Source=172.21.55.3,1968;Initial Catalog=HRMPRO12\_VNPAY;Persist Security Info=True;User ID=se;Password=EcklmqsVxEDLfGbgtkhcaLZAYKxOZVnt/XC31Cx+NA0=;MultipleActiveResultSets=True;App=EntityFramework;TrustServerCertificate=True;

# k8s \- Link UAT Khách Hàng

\------------ Thông tin Link UAT (k8s) \-------------  
user đăng nhập superadmin : vnr / Qc@@123456  
user đăng nhập thường: support / Qc@@123

main:   
[https://hrm-main.backendofficetest.vn/](https://hrm-main.backendofficetest.vn/)

portal:   
[https://hrm-portal.backendofficetest.vn/](https://hrm-portal.backendofficetest.vn/)

identity:   
[https://hrm-identity.backendofficetest.vn/](https://hrm-identity.backendofficetest.vn/)

hr:   
 [https://hrm-hr.vnpayapitest.vn](%20https://hrm-hr.vnpayapitest.vn)

sys:   
[https://hrm-sysapi.vnpayapitest.vn](https://hrm-sysapi.vnpayapitest.vn)

apiCore:   
 [https://hrm-api.vnpayapitest.vn](%20https://hrm-api.vnpayapitest.vn)

News-wordpress:

window service: 

Survey api: 

\------ Thông tin db \-------  
10.122.121.31  
sa / eTs8J=7ntTeY  
Db: HRM\_DEMOVNPAY

—- VPN —---

- Để chạy được thì cần cài OpenVPN

# k8s \- Link  Golive khách hàng

\------------ Thông tin Link khách hàng golive (k8s) \-------------  
user đăng nhập superadmin : vnr / Qc@@123  
user đăng nhập thường: support / Qc@@123

main:   
[https://hr-main.vnpay.vn/](https://hr-main.vnpay.vn/)

portal:   
[https://hrm.vnpay.vn/](https://hrm.vnpay.vn/)

identity:   
[https://hrm-identity.vnpay.vn/](https://hrm-identity.vnpay.vn/)

hr:   
[https://hrm-hr.vnpay.vn](https://hrm-hr.vnpay.vn)

sys:   
[https://hrm-sysapi.vnpay.vn](https://hrm-sysapi.vnpay.vn)

apiCore:   
 [https://hrm-api.vnpay.vn](%20https://hrm-api.vnpay.vn)

News-wordpress:  
[https://hrm-news.vnpay.vn/](https://hrm-news.vnpay.vn/)

window service: 

Survey api: 

Grafana:  
[Grafana-HRM](https://cos-mon.backendoffice.vn/d/application-log-query/official-application-log?orgId=2&from=now-30m&to=now&timezone=browser&var-prom=ddpb8roltqby8f&var-project=vntaxi%7Cqtud-vntaxi%7Cvnp-tuyendung%7Cecos-hotel%7Cconfig-mgn%7Cvnboat%7Ceco-carticket%7Cekyc-fss%7Cself-driving-car%7Cvn-film&var-namespace=hrm-vnr-pilot&var-service=$__all&var-pod=$__all&var-kwsearch=&var-avsearch=&var-cluster=gds-prod-ocp02)

—- VPN —---

- Để chạy được thì cần cài global protext  
- Grafana: login SSO VnPay với tài khoản **vnrs.minh.nguyendat**

# Thông Tin S3

# —- Thông tin server S3 —-

Link hướng dẫn dùng S3: [Hướng dẫn dùng S3](https://drive.google.com/file/d/1-E3zrxBIpkbxWb2QtHym_EXwVxsVynGE/view?usp=sharing)

| Thông Tin Server S3 |  |  |
| ----- | :---- | :---- |
| **Tên** | **Giá trị** | **Mô tả** |
| Bucket | vnr-pmns-build-version | Tên vùng lưu trữ trên S3, nơi bạn sẽ upload file. |
| Endpoint | https://s3-hni.sds.vnpaycloud.vn | Địa chỉ API dùng để truy cập dịch vụ S3  |
| Accesskey | 00e81cc437ac04a4f593 | Nhập access key bạn đã được cấp |
| Secretkey | PjE/0RstV87SWvWYFMRJtKXPc3DD+K/VsBIcuzlE | Nhập secret key tương ứng |
| Password zip | Af9tojpm\]e%)e-j) | Mật khẩu bảo vệ file `.zip`, chỉ cần khi giải nén – không ảnh hưởng tới việc upload. |

# — Giới thiệu S3 —

**Amazon S3 (Simple Storage Service)** là dịch vụ lưu trữ đám mây của AWS, cho phép bạn lưu trữ và truy xuất **bất kỳ lượng dữ liệu nào** từ mọi nơi.

**Đặc điểm chính:**

* **Linh hoạt:** Lưu trữ gần như không giới hạn.  
* **An toàn:** Độ bền dữ liệu cực cao (99.999999999%).  
* **Tiết kiệm:** Chỉ trả tiền cho dung lượng sử dụng, có nhiều gói giá.  
* **Bảo mật:** Mã hóa và quản lý quyền truy cập chặt chẽ.

**Công dụng phổ biến:**

* Lưu trữ file cho web/ứng dụng (ảnh, video).  
* Sao lưu (backup) dữ liệu.  
* Lưu trữ dữ liệu lớn (Big Data) và kho lưu trữ dài hạn (archive).  
* Hosting website tĩnh.

# Modules triển khai

Danh sách các hạng mục bạn cung cấp, dự án VNPAY \- HR có thể được chia thành các module chính sau đây, với mục tiêu hoàn thành trước Dealine:

Mục tiêu hoàn thành dự án VNPAY \- HR

Dự án nhằm mục tiêu xây dựng và triển khai hệ thống Quản lý Nguồn Nhân lực (HRM) toàn diện cho VNPAY, bao gồm các phân hệ chính từ quản lý thông tin nhân viên đến chấm công, bảo hiểm, tuyển dụng, đào tạo và tin tức nội bộ, đồng thời cung cấp các kênh tương tác qua Portal và Mobile App cho nhân viên và quản lý.

Các Module Chính của Hệ thống VNPAY \- HR:

1. Quản lý Hồ sơ và Thông tin Nhân sự (HRE)

   * Sơ đồ tổ chức  
   * Định biên Nhân sự (V2)  
   * Danh sách (DS) Đơn vị  
   * DS Ngạch lương, DS Cấp bậc, DS Chức danh, DS Chức vụ  
   * DS Nơi làm việc  
   * Quản lý thông tin nhân viên: Chờ nhận việc, DS Nhân viên nghỉ việc, DS Thay đổi/Bổ sung thông tin cá nhân  
   * Quản lý thông tin cá nhân mở rộng: DS Người thân, DS Người phụ thuộc, DS Trình độ học vấn, Thông tin tài khoản, DS Kinh nghiệm làm việc của NV, DS Giấy phép lao động  
   * Xác nhận thông tin cá nhân: Danh sách xác nhận người thân, Danh sách xác nhận người phụ thuộc, Danh sách xác nhận trình độ chuyên môn, Danh sách xác nhận kinh nghiệm làm việc  
   * Quản lý Hợp đồng: DS Loại hợp đồng, DS Hợp đồng, DS Hợp đồng đến hạn, DS Nhân viên chưa có hợp đồng, DS Phụ lục HĐ, Lịch sử hợp đồng  
   * Quá trình công tác: DS Quá trình điều động/bổ nhiệm, DS Quá trình kiêm nhiệm  
   * Khen thưởng & Kỷ luật: DS Khen thưởng, DS Kỷ luật  
   * Nghỉ việc: DS Đăng ký nghỉ việc, Duyệt nghỉ việc  
   * Nhóm nhân viên  
2. Quản lý Chấm Công (ATTP / ATT)

   * Thiết lập chung: DS Kỳ công/Kỳ lương, DS Ngày nghỉ lễ, Chế độ công, DS Loại ca làm việc, DS Ca làm việc, Thiết lập điều kiện dữ liệu công, DS nhóm ca làm việc  
   * Phân lịch làm việc  
   * Quản lý ngày nghỉ phép: DS Loại ngày nghỉ, DS Ngày nghỉ, DS Phép năm đầu kỳ, Phân tích chi tiết phép năm  
   * Quản lý tăng ca: DS Loại tăng ca, DS Kế hoạch tăng ca, Phê duyệt kế hoạch tăng ca  
   * Dữ liệu chấm công: DS tọa độ chấm công trên GPS, DS chấm công trên App, DS Dữ liệu check in/check out, Dữ liệu chấm công hàng ngày  
   * Tính công & Báo cáo: Tính công, Tổng hợp ngày công, BC Công hàng tháng  
   * DS Nhân viên chưa có chế độ công  
   * Đăng ký/Duyệt chế độ: DS Đăng ký hưởng chế độ, Duyệt Đăng ký hưởng chế độ  
3. Quản lý Bảo hiểm & Phúc lợi (INS)

   * Phân tích bảo hiểm (xã hội, tự nguyện)  
   * Mẫu ibhxh, Mẫu c70 tổng hợp  
   * Nộp hồ sơ đóng BH  
   * Cấu hình sinh dữ liệu tự động  
   * Chế độ bảo hiểm, Chế độ bảo hiểm nhân viên  
   * Chế độ thuế  
   * Điều chỉnh bảo hiểm  
   * Lương BHXH  
   * Quản lý nghỉ hưởng BHXH: Chờ CT nghỉ BHXH, Chứng từ BHXH  
   * DS Phúc lợi  
4. Quản lý Tuyển Dụng (REC)

   * DS Yêu cầu tuyển  
   * DS Công việc (Main), DS Công việc cân thực hiện (Portal)  
   * DS Hồ sơ yêu cầu, DS Hồ sơ yêu cầu của nhân viên  
5. Quản lý Đào Tạo (TRA)

   * Thiết lập chung: Chi phí đào tạo, DS Loại đào tạo, DS Loại khóa học, DS Khóa học, DS Loại chứng chỉ, DS Chứng chỉ, DS Quy định cam kết đào tạo, DS Đối tác đào tạo, DS Giảng viên  
   * Kế hoạch đào tạo  
   * Quản lý lớp học: DS Lớp học, DS Điểm danh lớp học, DS Học viên, DS Học viên đạt  
   * DS Cam kết đào tạo  
   * Bảng khảo sát (liên quan đào tạo)  
6. Quản lý Tin Tức (NEWS)

   * Danh mục tin tức  
   * Quản lý tin tức  
7. Cổng thông tin Nhân viên (POR \- Employee Portal)

   * Các chức năng tự phục vụ cho nhân viên/quản lý (truy cập và tương tác với dữ liệu từ các module HRE, Chấm Công, NEWS, TRA):  
     * Quản lý hồ sơ cá nhân (Thông tin nhân viên, liên hệ, người thân, người phụ thuộc, trình độ học vấn, thông tin tài khoản, kinh nghiệm làm việc, giấy phép lao động, lịch sử hợp đồng, quá trình công tác, kiêm nhiệm)  
     * Xem lịch làm việc (V3)  
     * Xem/Đăng ký/Duyệt ngày nghỉ (V3)  
     * Xem/Đăng ký/Duyệt kế hoạch tăng ca (V3)  
     * Xem dữ liệu chấm công (V3)  
     * Xem/Đăng ký/Duyệt dữ liệu check in/check out (V3)  
     * Xem phép năm  
     * Xem/Đăng ký/Duyệt đăng ký hưởng chế độ (V3)  
     * Tham gia Bảng khảo sát  
     * Xem Danh sách tin tức  
8. Ứng dụng Di động (APP \- Mobile Application)

   * Các chức năng cho nhân viên/quản lý trên thiết bị di động (truy cập và tương tác với dữ liệu từ các module Chấm Công, NEWS, và chức năng chấm công di động):  
     * Chấm công (Chấm công PGS \- có thể là GPS/Photo/Selfie)  
     * Xem/Đăng ký/Duyệt ngày nghỉ (V3)  
     * Xem/Đăng ký/Duyệt kế hoạch tăng ca (V3)  
     * Xem dữ liệu check in/check out (V3)  
     * Xem/Đăng ký/Duyệt đăng ký hưởng chế độ (V3)  
     * Xem Danh sách tin tức

# Mô tả ý nghĩa các sites

| Mô Tả Ý Nghĩa Các Sites |  |  |  |  |  |
| ----- | :---- | :---- | :---- | :---- | :---- |
| **STT** | **Service / Module** | **Domain UAT** | **Mục đích / Chức năng** | **Người dùng chính** | **Ghi chú** |
| 1 | Portal | [hrm-portal-uat.backendofficetest.vn](http://hrm-portal-uat.backendofficetest.vn) | Cổng thông tin dành cho nhân viên, cho phép xem hồ sơ, bảng công, lương, nghỉ phép, phúc lợi… | Nhân viên | Giao diện dành cho cá nhân. |
| 2 | Main | [hrm-vnr-uat.backendofficetest.vn](http://hrm-vnr-uat.backendofficetest.vn) | Trang quản trị nội bộ HRM, quản lý hồ sơ, tuyển dụng, đào tạo và các báo cáo nhân sự. | HR, Quản lý nhân sự | Web quản lý chính. |
| 3 | HR API | [hrm-vnr-uat-hr.backendofficetest.vn](http://hrm-vnr-uat-hr.backendofficetest.vn) | Xử lý các nghiệp vụ nhân sự như hồ sơ, công, và lương. | Portal, Main | Đây là API nghiệp vụ. |
| 4 | SYS API | [hrm-vnr-uat-sys.backendofficetest.vn](http://hrm-vnr-uat-sys.backendofficetest.vn) | Quản lý bảo mật, phân quyền, tài khoản và cấu hình hệ thống. | Nội bộ hệ thống | Liên quan đến bảo mật (security). |
| 5 | API Core (Internal) | [hrm-vnr-uat-api.backendofficetest.vn](http://hrm-vnr-uat-api.backendofficetest.vn) | API lõi nội bộ, chủ yếu phục vụ cho Portal. | Portal | API này không mở cho bên thứ 3\. |
| 6 | Integration API | (mapping qua integration-service-apicore) | API dành cho các bên thứ ba tích hợp (TS24, MISA, Viettel…) với hệ thống HRM. | Đối tác ngoài | Trao đổi dữ liệu. |
| 7 | Identity | [hrm-identity-uat.backendofficetest.vn](http://hrm-identity-uat.backendofficetest.vn) | Dịch vụ xác thực (SSO, OAuth2, OpenID Connect), cấp token và phân quyền người dùng. | Tất cả người dùng hệ thống | Identity server. |
| 8 | News | hrm-vnr-uat-news.backendofficetest.vn | Trang tin tức nội bộ (WordPress) tích hợp với HRM qua SSO. | Nhân viên, HR | Đăng nhập một lần (Single Sign-On). |
| 9 | Survey API | [hrm-vnr-uat-apiSurvey.backendofficetest.vn](http://hrm-vnr-uat-apiSurvey.backendofficetest.vn) | Hệ thống khảo sát nội bộ, có cơ sở dữ liệu riêng biệt và tích hợp với HRM. | Nhân viên, HR, Quản lý | Source độc lập. Database độc lập. |
| 10 | Chat API | [http://hrm-vnr-uat-apichat.backendofficetest.vn/](http://hrm-vnr-uat-apichat.backendofficetest.vn/) | Dịch vụ chat. | Nhân viên | Chạy trên portal |
| 11 | Chat FE | [http://hrm-vnr-uat-chatfe.backendofficetest.vn](http://hrm-vnr-uat-chatfe.backendofficetest.vn) | Giao diện chat nhúng trên portal | Nhân viên | Chạy trên portal |
| 12 | Windows Service Core | (nội bộ, không public domain) | Chạy ngầm các tác vụ định kỳ (theo phút, giờ, ngày, tháng) như đồng bộ dữ liệu, gửi email, xử lý công và lương. | Hệ thống chạy nền | Service nền. |

# NotebookLM VnPay

# **Thông Tin Tài Liệu** 

Nguồn : [NotebookLM VnPay](https://notebooklm.google.com/notebook/74f48a8c-201b-487a-9427-b2eea5c1a0b5)

1. **Tài liệu "0 \- Cài đặt môi trường Net8"**:

   * **Mục đích** của tài liệu này là hướng dẫn lập trình viên **cài đặt và thiết lập môi trường phát triển ứng dụng sử dụng .NET 8**, bao gồm Web MVC và Web API, nhằm giúp chuẩn bị môi trường nhanh chóng, thống nhất quy trình và làm nền tảng phát triển \[1, 1.1, 1.2\].  
   * **Hướng dẫn chi tiết** bao gồm các bước:  
     * **Cài đặt .NET SDK 8**: Tải SDK, hosting bundle từ trang web của Microsoft và cài đặt \[2, 2.1.1\].  
     * **Kiểm tra phiên bản**: Sử dụng lệnh `dotnet --version` trong Command Prompt, kết quả mong muốn là 8.x.x \[2, 2.1.2\].  
     * **Cài đặt Visual Studio 2022** (khuyên dùng) với workload "**ASP.NET and web development**" \[2, 2.1.3\].  
   * **Lấy source từ git**: Tài liệu cung cấp link git cho source Net8 (`HRM12-Git - source net8`) và link cấu hình \[3, 2.2.1\].  
   * Tài liệu được lập vào ngày 25/04/2025 bởi PIC TungLy. Tài liệu liên quan được đề cập là docker.  
2. **Tài liệu "1 \- Tối ưu DbContext bằng Compiled Model" và chủ đề Hiệu năng Nâng cao trong EF Core**:

   * **Tài liệu "1 \- Tối ưu DbContext bằng Compiled Model"** hướng dẫn cách sử dụng tính năng **Compiled Models** trong Entity Framework Core (EF Core) để **tăng tốc khởi động ứng dụng và giảm tải hệ thống**. Quá trình khởi tạo DbContext mặc định thường phải xây dựng lại mô hình dữ liệu, ảnh hưởng đến hiệu năng, đặc biệt với các mô hình phức tạp hoặc trong kiến trúc microservices.  
   * **Compiled Models** là tính năng có từ EF Core 7+ cho phép **biên dịch trước mô hình**.  
   * **Lợi ích** của Compiled Models bao gồm: Tăng tốc khởi động, tiết kiệm tài nguyên, tối ưu cho microservices và hiệu quả trong môi trường cloud/container.  
   * **Các bước thực hiện** tối ưu hóa DbContext bằng Compiled Models bao gồm:  
     * Chuẩn bị: Cài đặt công cụ dòng lệnh `dotnet-ef`.  
     * Chạy lệnh `dotnet ef dbcontext optimize` trong thư mục DataTier (`HRM.Data.Entity`) để tạo model đã biên dịch sẵn. Lưu ý cần build solution thành công trước khi chạy lệnh này.  
     * Chỉnh sửa file `VnrHrmDataContextModelBuilder.cs` đã được tạo ra: Xóa hoặc comment dòng `AddRuntimeAnnotation("Relational:RelationalModel", CreateRelationalModel());` và xóa toàn bộ method `CreateRelationalModel()`.  
     * Cấu hình sử dụng Compiled Model trong file `Program.cs` (chỉ làm 1 lần ở lần đầu tiên) bằng cách gọi `options.UseModel(...)`. Tài liệu cũng đề cập các cấu hình hiệu năng khác như tắt lazy loading và giảm cảnh báo.  
     * Sửa hàm khởi tạo trong file `UserDataObject.cs` (chỉ làm 1 lần ở lần đầu tiên) để sử dụng Compiled Model.  
   * Tài liệu này được lập ngày 03/05/2025 bởi PIC Lý Nhuận Tùng. Tài liệu liên quan là Cài đặt môi trường net8 và Compiled queries.  
   * **Nguồn "Advanced Performance Topics \- EF Core | Microsoft Learn"** đi sâu hơn vào các chủ đề hiệu năng trong EF Core. Các điểm chính bao gồm:  
     * **DbContext pooling**: Tái sử dụng các thể hiện (instance) của DbContext để giảm chi phí thiết lập ban đầu, hữu ích cho các kịch bản hiệu năng cao, độ trễ thấp. Được kích hoạt bằng `AddDbContextPool` khi sử dụng Dependency Injection. Kích thước pool (`poolSize`) có thể được cấu hình. Cần quản lý cẩn thận các trạng thái theo phạm vi (scoped state), ví dụ như ID của tenant trong ứng dụng multi-tenant.  
     * **Connection Pooling**: Được quản lý bởi trình điều khiển cơ sở dữ liệu (ví dụ: ADO.NET driver) để tái sử dụng các kết nối database, khác với DbContext pooling.  
     * **Compiled queries**: Biên dịch rõ ràng các truy vấn LINQ thành .NET delegate để bỏ qua bước tìm kiếm cache truy vấn, cung cấp cách thực thi truy vấn tối ưu nhất. Hữu ích cho các truy vấn "hot" hoặc phức tạp.  
     * **Query caching and parameterization**: EF Core lưu cache các truy vấn dựa trên cấu trúc cây biểu thức của chúng. **Tham số hóa truy vấn** (sử dụng biến thay vì hằng số trực tiếp) giúp EF và database tái sử dụng cache hiệu quả hơn, tránh việc biên dịch lại hoặc tạo plan truy vấn mới cho mỗi lần thực thi với giá trị khác nhau.  
     * **Dynamically-constructed queries**: Các truy vấn được xây dựng động có thể gây ra vấn đề hiệu năng nếu không được tham số hóa đúng cách, dẫn đến việc EF cache truy vấn kém hiệu quả.  
     * **Compiled models (chi tiết bổ sung)**: Cải thiện thời gian khởi động EF Core cho các mô hình **lớn** (hàng trăm/nghìn loại thực thể). Tạo bằng lệnh `dotnet ef dbcontext optimize`. Có thể tạo nhiều compiled model cho các cấu hình runtime khác nhau. **Hạn chế** quan trọng bao gồm không hỗ trợ global query filters, lazy loading, change-tracking proxies và yêu cầu tạo lại thủ công khi mô hình thay đổi. Chỉ nên sử dụng nếu thời gian khởi động EF Core quá chậm.  
     * **Giảm thiểu overhead runtime**: Bên cạnh pooling và compiled queries, có thể cân nhắc tắt kiểm tra an toàn luồng (`EnableThreadSafetyChecks(false)`) nhưng cần kiểm tra kỹ lưỡng lỗi đồng thời trước khi làm vậy.  
3. **Tài liệu "2 \- Build Entity Code First trong NET 8"**:

   * **Mục đích** của tài liệu là hướng dẫn sử dụng phương pháp Entity Framework Core **Code First** để tạo database từ mô hình đối tượng trong .NET 8, bao gồm các bước khi **thêm bảng mới** và **thêm field mới**.  
   * **Code First** là một cách tiếp cận phổ biến giúp nhà phát triển linh hoạt quản lý cấu trúc cơ sở dữ liệu.  
   * **Trường hợp 1: Thêm Bảng Mới**:  
     * **Bước 1**: Thêm một class mới (đại diện cho bảng) vào thư mục `HRM.Data.Entity/Models` với các thuộc tính và Data Annotations hoặc Fluent API để định nghĩa cấu trúc. Ví dụ lớp `Cat_Department`.  
     * **Bước 2**: Cập nhật `VnrHrmDataContext` bằng cách thêm dòng `DbSet` cho class mới.  
     * **Bước 3**: Cập nhật file `VnrHrmDataContextModelBuilder` trong thư mục CompiledModels bằng cách thêm xử lý tạo entity cho bảng mới.  
     * **Bước 4**: Thêm script SQL để cập nhật database (cho việc chạy store script tự động).  
   * **Trường hợp 2: Thêm Field Mới**:  
     * **Bước 1**: Cập nhật class hiện có trong thư mục `HRM.Data.Entity/Models` bằng cách thêm thuộc tính mới (đại diện cho field). Ví dụ thêm field `IsNotNeedCheckOut` vào lớp `Cat_GradeAttendance`.  
     * **Bước 2**: Thêm script SQL để cập nhật database.  
   * **Compile Model**: Sau khi thay đổi Code First, cần **compile model** bằng lệnh `dotnet ef dbcontext optimize`. Việc này giúp tăng hiệu suất khởi động ứng dụng. Cần kiểm tra thư mục `Models/CompiledModels` để đảm bảo model đã được compile thành công.  
   * **Kết luận**: Sử dụng Code First kết hợp với compile model giúp quản lý cấu trúc DB linh hoạt và tối ưu hiệu suất khởi động.  
   * Tài liệu được lập ngày 15/05/2025 bởi PIC Lý Nhuận Tùng. Tài liệu liên quan là Compiled models.  
4. **Tài liệu "S3 \- HƯỚNG DẪN SỬ DỤNG S3 ĐỂ UPLOAD FILE.pdf"**:

   * **Mục đích** là hướng dẫn sử dụng S3 để upload file.  
   * **Thông tin cần thiết** để sử dụng S3 bao gồm: Tên Bucket (vùng lưu trữ), Endpoint URL (địa chỉ kết nối), Access Key (mã truy cập), Secret Key (mã bí mật), Region name (vị trí địa lý bucket), và File cần upload.  
   * **Các bước thực hiện**:  
     * **Cài đặt AWS CLI**: Tải và cài đặt như phần mềm thông thường.  
     * **Cấu hình AWS CLI**: Chạy lệnh `aws configure` và nhập các thông tin cần thiết (Access Key ID, Secret Access Key, Default region name, Default output format).  
     * **Upload file**: Sử dụng lệnh `aws s3 cp <đường_dẫn_file_local> s3://<tên_bucket>/ --endpoint-url <endpoint_url>`. Cung cấp các ví dụ cụ thể cho file cùng thư mục hoặc ở đường dẫn đầy đủ.  
     * **Kiểm tra file sau khi upload**: Đối với public bucket có thể truy cập trực tiếp qua URL. Đối với private bucket, cần cấp quyền hoặc dùng presigned URL, hoặc kiểm tra bằng lệnh `aws s3 ls s3://<tên_bucket>/ --endpoint-url <endpoint_url>`.  
   * **Các lệnh thường dùng** được tóm tắt là `aws s3 cp` (upload) và `aws s3 ls` (kiểm tra/liệt kê file).  
5. **Tài liệu "Thông Tin Link VnPay"**:

   * Tài liệu này cung cấp các **thông tin kết nối và tài khoản** cho các môi trường và dịch vụ khác nhau của dự án VNPAY.  
   * Bao gồm thông tin chi tiết về:  
     * **Link PE**: URL và port cho các dịch vụ (main, portal, identity, hr, sys, apiCore, window service) trên `pehn02.vnresource.net`, cùng với thông tin database server và tài khoản.  
     * **Link QC**: URL và port cho các dịch vụ trên `vnpay.dev.local`, cùng với thông tin database server và tài khoản.  
     * **Thông tin server test Unbuntu**: Địa chỉ IP, tài khoản đăng nhập SSH.  
     * **Thông tin FTP Docker image**: Thông tin server FTP, tài khoản, và đường dẫn file rar.  
     * **Thông tin S3**: Lặp lại thông tin chi tiết về Bucket, Endpoint, Accesskey, Secretkey và Password zip cho dịch vụ S3.  
   * Tài liệu cũng giới thiệu **mục tiêu và các module chính** của dự án VNPAY \- HR. Dự án nhằm xây dựng hệ thống HRM toàn diện cho VNPAY, bao gồm các module như Quản lý Hồ sơ (HRE), Chấm Công (ATTP/ATT), Bảo hiểm (INS), Tuyển Dụng (REC), Đào Tạo (TRA), Tin Tức (NEWS), Cổng thông tin Nhân viên (POR), và Ứng dụng Di động (APP). Mỗi module chính lại có danh sách chi tiết các phân hệ/chức năng con.

Trước đó, tôi cũng đã tóm tắt riêng về tài liệu "**Nhật Ký Vấn Đề**", trong đó nêu rõ mục đích của tài liệu này là giúp nhân viên kỹ thuật ghi lại các vấn đề gặp phải để giảm thiểu và phòng ngừa vấn đề trong tương lai, sử dụng biểu mẫu có áp dụng phương pháp 5 tại sao để tìm nguyên nhân gốc rễ và đưa ra cách phòng tránh tái phát/phòng ngừa từ mầm mống.

