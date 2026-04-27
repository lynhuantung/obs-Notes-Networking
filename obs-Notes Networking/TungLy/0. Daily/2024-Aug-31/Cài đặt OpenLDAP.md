---
aliases: 
date: 2024-08-01
tags:
  - "#new_note"
---
Cấu hình LDAP trên một máy chủ có thể được thực hiện với nhiều loại máy chủ LDAP khác nhau, nhưng một trong những máy chủ LDAP phổ biến nhất là OpenLDAP. Dưới đây là hướng dẫn chi tiết về cách cài đặt và cấu hình OpenLDAP trên một máy chủ chạy hệ điều hành Ubuntu.

### 1. **Cài đặt OpenLDAP**

Trước tiên, bạn cần cập nhật hệ thống và cài đặt các gói cần thiết:

bash

Copy code

`sudo apt update sudo apt install slapd ldap-utils`

Trong quá trình cài đặt, bạn sẽ được yêu cầu đặt mật khẩu cho admin LDAP. Hãy ghi nhớ mật khẩu này vì bạn sẽ cần dùng đến nó sau này.

### 2. **Cấu hình OpenLDAP**

Sau khi cài đặt, bạn cần cấu hình OpenLDAP. Chạy lệnh sau để cấu hình:

bash

Copy code

`sudo dpkg-reconfigure slapd`

Bạn sẽ được hỏi một loạt câu hỏi. Dưới đây là các câu hỏi và câu trả lời đề xuất:

1. **Omit OpenLDAP server configuration?**: No
2. **DNS domain name:**: Nhập tên miền của bạn (ví dụ: example.com)
3. **Organization name:**: Nhập tên tổ chức của bạn (ví dụ: Example Corp)
4. **Administrator password:**: Nhập mật khẩu admin mà bạn đã đặt trước đó
5. **Confirm password:**: Nhập lại mật khẩu admin
6. **Database backend to use:**: HDB
7. **Remove the database when slapd is purged?**: No
8. **Move old database?**: Yes

### 3. **Kiểm tra cài đặt**

Để kiểm tra xem OpenLDAP đã được cài đặt và chạy thành công hay chưa, sử dụng lệnh sau:

bash

Copy code

`sudo systemctl status slapd`

Bạn sẽ thấy trạng thái của dịch vụ `slapd` nếu nó đang chạy.

### 4. **Cấu hình cơ sở dữ liệu LDAP**

Tiếp theo, bạn cần thêm một số cấu hình cơ bản vào cơ sở dữ liệu LDAP. Tạo một tệp LDIF (LDAP Data Interchange Format) với nội dung như sau:

bash

Copy code

`sudo nano base.ldif`

Thêm nội dung sau vào tệp `base.ldif`:

ldif

Copy code

`dn: ou=users,dc=example,dc=com objectClass: organizationalUnit ou: users  dn: ou=groups,dc=example,dc=com objectClass: organizationalUnit ou: groups`

Lưu tệp và thoát khỏi trình chỉnh sửa. Sau đó, nhập tệp này vào LDAP bằng lệnh:

bash

Copy code

`sudo ldapadd -x -D cn=admin,dc=example,dc=com -W -f base.ldif`

Bạn sẽ được yêu cầu nhập mật khẩu admin.

### 5. **Thêm người dùng vào LDAP**

Tạo một tệp LDIF khác để thêm người dùng vào LDAP:

bash

Copy code

`sudo nano adduser.ldif`

Thêm nội dung sau vào tệp `adduser.ldif`:

ldif

Copy code

`dn: uid=johndoe,ou=users,dc=example,dc=com objectClass: inetOrgPerson uid: johndoe sn: Doe givenName: John cn: John Doe displayName: John Doe userPassword: password mail: johndoe@example.com`

Lưu tệp và thoát khỏi trình chỉnh sửa. Sau đó, nhập tệp này vào LDAP bằng lệnh:

bash

Copy code

`sudo ldapadd -x -D cn=admin,dc=example,dc=com -W -f adduser.ldif`

Bạn sẽ được yêu cầu nhập mật khẩu admin.

### 6. **Kiểm tra người dùng LDAP**

Để kiểm tra xem người dùng đã được thêm vào LDAP thành công hay chưa, sử dụng lệnh sau:

bash

Copy code

`ldapsearch -x -LLL -b dc=example,dc=com uid=johndoe`

Bạn sẽ thấy thông tin của người dùng `johndoe` nếu nó đã được thêm thành công.

### 7. **Cấu hình bảo mật (TLS/SSL)**

Để bảo mật kết nối LDAP, bạn cần cấu hình TLS/SSL. Dưới đây là các bước cơ bản:

1. **Tạo chứng chỉ SSL**:

bash

Copy code

`sudo openssl req -new -x509 -days 365 -nodes -out /etc/ssl/certs/ldap.pem -keyout /etc/ssl/private/ldap.key`

2. **Cấu hình OpenLDAP để sử dụng TLS/SSL**:

bash

Copy code

`sudo nano /etc/ldap/ldap.conf`

Thêm hoặc chỉnh sửa các dòng sau:

conf

Copy code

`BASE dc=example,dc=com URI ldaps://localhost  TLS_CACERT /etc/ssl/certs/ldap.pem TLS_REQCERT allow`

3. **Cấu hình slapd để sử dụng TLS/SSL**:

bash

Copy code

`sudo nano /etc/ldap/slapd.d/cn=config.ldif`

Thêm hoặc chỉnh sửa các dòng sau:

ldif

Copy code

`olcTLSCACertificateFile: /etc/ssl/certs/ldap.pem olcTLSCertificateFile: /etc/ssl/certs/ldap.pem olcTLSCertificateKeyFile: /etc/ssl/private/ldap.key`

4. **Khởi động lại dịch vụ slapd**:

bash

Copy code

`sudo systemctl restart slapd`

### 8. **Kết luận**

Bạn đã hoàn thành việc cài đặt và cấu hình cơ bản cho OpenLDAP trên máy chủ Ubuntu. Từ đây, bạn có thể thêm, sửa, xóa người dùng và nhóm trong cơ sở dữ liệu LDAP của mình, cũng như cấu hình các ứng dụng khác để xác thực người dùng thông qua LDAP.

Nếu bạn cần thêm chi tiết hoặc có bất kỳ câu hỏi nào khác, hãy cho tôi biết!