#### 0. 2024-31 Tổng hợp

---
title: 0. 2024-31 Tổng hợp
permalink: 
feed: show
format: list
date: 2024-08-12
tags:
  - "#weekly_summary"
---
 
### 5 Ý Chính (tuần-31):

1. **Cài đặt OpenLDAP:**
   - Cập nhật hệ thống và cài đặt `slapd`, `ldap-utils`.
   - Đặt mật khẩu quản trị viên LDAP.

2. **Cấu hình OpenLDAP:**
   - Sử dụng lệnh `dpkg-reconfigure slapd` để cấu hình.
   - Nhập thông số cấu hình như tên miền, tên tổ chức và mật khẩu quản trị viên.

3. **Kiểm tra cài đặt:**
   - Sử dụng lệnh `systemctl status slapd` để kiểm tra trạng thái dịch vụ.

4. **Thêm người dùng vào LDAP:**
   - Tạo tệp LDIF với nội dung định nghĩa người dùng.
   - Nhập tệp LDIF vào LDAP bằng lệnh `ldapadd`.

5. **Cấu hình bảo mật (TLS/SSL):**
   - Tạo chứng chỉ SSL.
   - Cấu hình OpenLDAP và slapd để sử dụng TLS/SSL.


### Link to this page

[[Cài đặt OpenLDAP]]
[[Cong-Viec-2024-08-02]]
[[Daily-Tasks-2024-08-03]]
[[HoTroPE-NghiepVuLTG-HopLeader]]
[[Kiêm Nhiệm LTG]]


#### 0. 2024-32 Tổng hợp


---
title: 0. 2024-32 Tổng hợp
permalink: 
feed: show
format: list
date: 2024-08-12
tags:
  - "#weekly_summary"
---
 
### Tóm tắt 5 ý chính (tuần-32)

1. **Vấn đề cache quyền danh mục:** Hệ thống không đồng bộ cache và áp dụng cache không thống nhất, gây ra vấn đề khi xóa hoặc phân quyền.
2. **Tính công dùng task.run:** Không lấy được header `UserID` khi sử dụng task.run, dẫn đến vấn đề lấy dữ liệu quyền danh mục và xóa cache không hiệu quả.
3. **Phân quyền rồi nhưng api v3 không nhận:** Xóa cache quyền không hiệu quả trên api v3 do không truyền được header khi sử dụng task.run.
4. **Giải pháp:** Thêm header vào task.run để khắc phục các vấn đề liên quan đến cache quyền danh mục và xóa cache.
5. **Phân quyền định biên:** Thảo luận về cách tổ chức và phân quyền các nghiệp vụ khác nhau trong hệ thống quản lý nhân sự, bao gồm phân quyền nhân viên, ứng viên, kiêm nhiệm, định biên và hợp đồng.

### Link to this page
 [[Cache-Phan-Quyen-Danh-Muc-Loi]]
 [[DailyTasks_20240805]]
 [[Debug-Flowchart-OPA-Phan-Quyen]]
 [[Delete-Constraint-RBAC-20240807]]
[[OPA-Phan-Quyen-Cache-LDAP]]
[[Phân quyền định biên]]
[[Phan-Quyen-Nghiep-Vu-Du-Lieu]]
[[portal-v3- xóa-file-menuTemplate]]
[[xóa file File group memory optimized]]
[[Giải trình lỗi cache phân quyền]]



#### 0. 2024-34 Tổng hợp


---
title: 0. 2024-27 Tổng hợp
permalink: 
feed: show
format: list
date: 2024-07-08
tags:
  - "#weekly_summary"
---
**5 Ý Chính:**

1. **Cache Issues Creating Template:** Xử lý sự cố cache khi tạo mẫu.
2. **Daily Task Report:** Hoàn thành nhiều tác vụ hàng ngày, bao gồm tư vấn và hỗ trợ dự án.
3. **Migration-Redis-Setup-Task:** Cài đặt và cấu hình Redis để tối ưu hóa bộ nhớ cache.
4. **Redis-Cache-Memory-Optimization:** Quản lý bộ nhớ cache Redis để cải thiện hiệu suất.
5. **Xu-ly-quyen-danh-muc-OPA-FIT:** Xử lý quyền danh mục trong các dự án OPA và FIT.

## Link
[[Cache_Issues_Creating_Template]]
[[Daily_Task_Report]]
[[Migration-Redis-Setup-Task]]
[[Redis-Cache-Memory-Optimization]]
[[Support-Check-Link-Unis-Sotran]]
[[Xu-ly-quyen-danh-muc-OPA-FIT]]

#### 0. 2024-AUG Tổng hợp


---
title: 0. 2024-AUG Tổng hợp
permalink: 
feed: show
format: list
date: 2024-09-19
tags:
  - "#monthly_summary"
---
## Tổng hợp ghi chú tháng 07/2024
--- 
**5 Ý Chính**

1. **Cài đặt OpenLDAP:** Cài đặt và cấu hình OpenLDAP để phục vụ mục đích xác thực.
2. **Thêm người dùng vào LDAP:** Tạo người dùng mới trong LDAP theo định dạng tệp LDIF và nhập vào kho lưu trữ LDAP.
3. **Cấu hình bảo mật TLS/SSL:** Tạo chứng chỉ TLS/SSL và cấu hình OpenLDAP để sử dụng giao thức bảo mật.
4. **Giải quyết vấn đề về cache quyền danh mục:** Thực hiện các biện pháp để đồng bộ hóa cache quyền danh mục và khắc phục sự cố không nhất quán.
5. **Phân quyền định biên:** Thảo luận về việc tổ chức và phân quyền các nghiệp vụ khác nhau trong hệ thống quản lý nhân sự, bao gồm quản lý nhân viên, ứng viên, kiêm nhiệm, định biên và hợp đồng.

**Liên kết**
[[0. 2024-31 Tổng hợp]]
[[0. 2024-32 Tổng hợp]]
[[0. 2024-33 Tổng hợp]]
[[0. 2024-34 Tổng hợp]]
[[0. 2024-35 Tổng hợp]]



#### 0.2024-33 Tổng hợp




--- 
**5 Ý chính**

1. **Báo cáo tháng 07/2024:** Tóm tắt các hoạt động và thành tích trong tháng 07/2024. [07/2024_MonthlyReport - Google Slides](https://docs.google.com/presentation/d/1T3FRRkUeeFIkK1wfLwtq8JYI5uEelCMytHT41ya82Yc/edit#slide=id.g28bc3d6ac16_0_34)
2. **Cải thiện hiệu suất Get_MasterDataForUser:** Tối ưu hóa câu lệnh SQL để giảm thời gian xử lý và tải I/O. [SQL_Query_Performance_Improved](https://docs.vnresource.net/vi/general/SQL_Query_Performance_Improved)
3. **Tài liệu Confluence:** Chuẩn bị cấu trúc và nội dung cho tài liệu Confluence mới. [tailieu_chuan_confluence](https://docs.vnresource.net/vi/general/tailieu_chuan_confluence)
4. **Jira-Confluence-SSO-TaskRun:** Thực hiện các cải tiến và sửa lỗi liên quan đến Jira, Confluence, SSO và TaskRun. [Jira-Confluence-SSO-TaskRun](https://docs.vnresource.net/vi/general/Jira-Confluence-SSO-TaskRun)
5. **Lỗi VDSC-Confluence-LDAP-Lỗi INS-FIT:** Giải quyết lỗi trong thành phần INS_14DAYS_LEAVEDAYTYPE_COUNT và kiểm tra LDAP cho FIT. [VDSC-Confluence-LDAP-Lỗi INS-FIT](https://docs.vnresource.net/vi/general/VDSC-Confluence-LDAP-Lỗi INS-FIT)

## Link
--- 
[[07_2024_Monthly_Report]]
[[Cải thiện performance Get_MasterDataForUser]]
[[daily-wiki-to-confluence-8h]]
[[Jira-Confluence-SSO-TaskRun]]
[[Seminar va troi luc confluence]]
[[SQL_Query_Performance_Improved]]
[[tailieu_chuan_confluence]]
[[VDSC-Confluence-LDAP-Lỗi INS-FIT]]



#### 0.2024-35 Tổng hợp


Tổng hợp ghi chú tháng 08/2024
--- 
**5 ý chính:**

1. **Cơ chế lấy token:** Sử dụng thông tin đăng nhập hoặc refresh token để lấy access token và refresh token.
2. **Quy trình lấy token và quản lý phiên làm việc:** Sử dụng access token để gọi API, khi hết hạn thì lấy access token mới bằng refresh token.
3. **Bảo vệ chống Hotlinking:** Ngăn chặn người khác sử dụng tài nguyên của bạn mà không được phép.
4. **Kiểm tra kết nối LDAP:** Xác minh nguyên nhân của việc không kết nối được LDAP.
5. **Kỹ năng Lãnh đạo Nhóm:** Các kỹ năng cần thiết cho một Leader, bao gồm quản lý thời gian, giao tiếp và giải quyết vấn đề.

 

### Link 
---
[[Cơ chế API]]
[[daily-performance-support]]
[[Fix-bao-mat-chrome-du-an]]
[[Hotlinking-Protection-Measures]]
[[Kiểm tra kết nối LDAP]]
[[Kỹ-năng-Lãnh-đạo-Nhóm]]
[[PE-FIT-Confirm-task]]



hãy giúp tôi tổng hợp theo từng tuần
