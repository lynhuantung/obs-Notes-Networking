---
aliases: 
date: 2024-07-30
tags:
  - daily
  - ADFS
Project:
  - FIT
---
### Bố Cục Chuẩn Bị Trước Cuộc Họp Về SSO ADFS

#### 1. Mô Tả Vấn Đề:

- **Mô tả vấn đề cần giải quyết trong cuộc họp**:
    - Hiện tại, hệ thống của chúng ta chưa tích hợp SSO (Single Sign-On) sử dụng ADFS (Active Directory Federation Services).
    - Các vấn đề liên quan đến bảo mật và quản lý danh tính người dùng cần được giải quyết.
    - Yêu cầu khả năng tích hợp SSO để người dùng có thể đăng nhập một lần và truy cập tất cả các dịch vụ cần thiết mà không cần phải đăng nhập lại.

#### 2. Mục Tiêu Cuộc Họp:

- **Xác định mục tiêu cụ thể của cuộc họp**:
    - Đưa ra giải pháp khả thi cho việc tích hợp SSO ADFS.
    - Xác định các bước cần thiết để triển khai giải pháp này.
    - Đảm bảo tất cả các bên liên quan hiểu rõ yêu cầu và kế hoạch triển khai.
    - Lên kế hoạch cho các bước tiếp theo và phân chia trách nhiệm.

#### 3. Câu Hỏi Socrates:

- **Chuẩn bị danh sách các câu hỏi để thảo luận**:
    - Những lợi ích cụ thể nào mà SSO ADFS sẽ mang lại cho hệ thống của chúng ta?
    - Những thách thức nào có thể gặp phải khi tích hợp SSO ADFS?
    - Có cần phải điều chỉnh hệ thống hiện tại để hỗ trợ SSO ADFS không?
    - Những biện pháp bảo mật nào cần được thực hiện khi triển khai SSO ADFS?
    - Ai sẽ là người chịu trách nhiệm chính cho từng giai đoạn của dự án?

#### 4. Chuẩn Bị Nội Dung Cuộc Họp (Agenda):

- **Soạn và lập trình tự nội dung cuộc họp**:
    - **Giới thiệu và mô tả vấn đề** (10 phút).
    - **Trình bày các giải pháp khả thi** (15 phút).
    - **Thảo luận về lợi ích và thách thức của SSO ADFS** (20 phút).
    - **Lập kế hoạch triển khai chi tiết** (20 phút).
    - **Phân chia trách nhiệm và nhiệm vụ** (15 phút).
    - **Q&A và tổng kết** (10 phút).

#### 5. Quyết Định Những Ai Phải Tham Gia Cuộc Họp:

- **Xác định những người cần tham gia cuộc họp**:
    - Quản lý dự án.
    - Các thành viên trong nhóm kỹ thuật.
    - Bộ phận bảo mật thông tin.
    - Đại diện từ các bộ phận liên quan khác (nếu cần).

#### 6. Quyết Định Hình Thức, Thời Gian Và Địa Điểm Cụ Thể Cho Cuộc Họp:

- **Chọn thời gian phù hợp với tất cả những người tham dự**:
    - Ngày: [Ngày cụ thể]
    - Giờ: [Giờ cụ thể]
    - Địa điểm: Phòng họp trực tuyến hoặc tại văn phòng.

#### 7. Mời Người Tham Dự:

- **Gửi lời mời đến những người tham gia cuộc họp**:
    - Soạn thảo email hoặc thư mời.
    - Gửi lời mời và yêu cầu xác nhận tham gia.

-----
### Giải Thích Tài Liệu SSO - ADFS Trong Cuộc Họp

#### 1. Mục Tiêu:

- **Cho phép đăng nhập vào web main và web portal VnR mà không cần biết password của VnR**:
    - Mục tiêu chính của việc triển khai SSO ADFS là giúp người dùng có thể truy cập vào các trang web chính và cổng thông tin mà chỉ cần đăng nhập một lần duy nhất. Điều này tăng cường trải nghiệm người dùng và giảm thiểu rủi ro bảo mật liên quan đến việc phải nhớ nhiều mật khẩu.

#### 2. Giao Diện Web Main và Portal:

- **Trang login web main**:
    
    - Đây là giao diện mà người dùng sẽ thấy khi họ truy cập vào trang chính của hệ thống. Việc đăng nhập sẽ được thực hiện thông qua ADFS, và sau khi xác thực thành công, người dùng sẽ được chuyển hướng đến trang chính.
- **Trang login web portal**:
    
    - Tương tự như trang chính, đây là giao diện đăng nhập cho cổng thông tin. Cổng thông tin cũng sẽ sử dụng ADFS để xác thực người dùng và cho phép truy cập sau khi đăng nhập thành công.

#### 3. Cấu Hình Relying Party Trusts Trên Server:

- **Cấu hình Relying Party Trusts**:
    - Đây là bước thiết lập mối quan hệ tin cậy giữa ADFS và các ứng dụng web. Cần phải thêm các thông tin cần thiết vào ADFS để nó biết ứng dụng web nào sẽ tin cậy ADFS để xác thực người dùng.

#### 4. Cấu Hình Web Main và Portal:

- **Web main**:
    
    - **Chỉnh sửa auth.config**:
        - **UseExternalLogin**: true (kích hoạt đăng nhập bên ngoài)
        - **BaseUrl**: URL của trang chính
        - **ProviderConfiguration**: Cấu hình chi tiết cho ADFS, bao gồm tên hiển thị và địa chỉ metadata
- **Web portal**:
    
    - **Chỉnh sửa auth.config**:
        - **UseExternalLogin**: true (kích hoạt đăng nhập bên ngoài)
        - **BaseUrl**: URL của cổng thông tin
        - **ProviderConfiguration**: Cấu hình chi tiết cho ADFS, bao gồm tên hiển thị và địa chỉ metadata
    - Nếu sử dụng key **"UsingADFS_Azure": true** trong webSettings.json thì trên trang đăng nhập portal sẽ ẩn đi userName và Password, chỉ sử dụng ADFS để xác thực.

### Đề Xuất Các Câu Hỏi Thảo Luận:

- Làm thế nào để đảm bảo quá trình tích hợp SSO ADFS diễn ra suôn sẻ?
- Những bước cụ thể nào cần thực hiện để cấu hình Relying Party Trusts trên ADFS?
- Cần lưu ý điều gì khi chỉnh sửa các file cấu hình auth.config và WebSettings.json?
- Các biện pháp bảo mật nào sẽ được thực hiện để bảo vệ thông tin người dùng trong quá trình xác thực?

### Kế Hoạch Hành Động:

1. **Xác định rõ mục tiêu và lợi ích của SSO ADFS**.
2. **Chuẩn bị các tài liệu cấu hình cần thiết và phân công nhiệm vụ cụ thể**.
3. **Thảo luận chi tiết các bước triển khai và giải đáp thắc mắc của các bên liên quan**.
4. **Thống nhất về thời gian và kế hoạch triển khai**.

---
**Giải Thích Tài Liệu SSO - ADFS Trong Cuộc Họp**

**1. Mục Tiêu:**

- **Cho phép đăng nhập vào web main và web portal VnR mà không cần biết password của VnR**:

- Mục tiêu chính của việc triển khai SSO ADFS là giúp người dùng có thể truy cập vào các trang web chính và cổng thông tin mà chỉ cần đăng nhập một lần duy nhất. Điều này tăng cường trải nghiệm người dùng và giảm thiểu rủi ro bảo mật liên quan đến việc phải nhớ nhiều mật khẩu.

**2. Giao Diện Web Main và Portal:**

- **Trang login web main**:

- Đây là giao diện mà người dùng sẽ thấy khi họ truy cập vào trang chính của hệ thống. Việc đăng nhập sẽ được thực hiện thông qua ADFS, và sau khi xác thực thành công, người dùng sẽ được chuyển hướng đến trang chính.

- **Trang login web portal**:

- Tương tự như trang chính, đây là giao diện đăng nhập cho cổng thông tin. Cổng thông tin cũng sẽ sử dụng ADFS để xác thực người dùng và cho phép truy cập sau khi đăng nhập thành công.

**3. Cấu Hình Relying Party Trusts Trên Server:**

- **Cấu hình Relying Party Trusts**:

- Đây là bước thiết lập mối quan hệ tin cậy giữa ADFS và các ứng dụng web. Cần phải thêm các thông tin cần thiết vào ADFS để nó biết ứng dụng web nào sẽ tin cậy ADFS để xác thực người dùng.

**4. Cấu Hình Web Main và Portal:**

- **Web main**:

	- **Chỉnh sửa auth.config**:	
		- **UseExternalLogin**: true (kích hoạt đăng nhập bên ngoài)
		- **BaseUrl**: URL của trang chính
		- **ProviderConfiguration**: Cấu hình chi tiết cho ADFS, bao gồm tên hiển thị và địa chỉ metadata

- **Web portal**:

- **Chỉnh sửa auth.config**:
	- **UseExternalLogin**: true (kích hoạt đăng nhập bên ngoài)
	- **BaseUrl**: URL của cổng thông tin
	- **ProviderConfiguration**: Cấu hình chi tiết cho ADFS, bao gồm tên hiển thị và địa chỉ metadata

- Nếu sử dụng key **"UsingADFS_Azure": true** trong webSettings.json thì trên trang đăng nhập portal sẽ ẩn đi userName và Password, chỉ sử dụng ADFS để xác thực.