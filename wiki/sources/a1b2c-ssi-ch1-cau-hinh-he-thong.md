---
type: source
code: a1b2c
description: "SSI Ch.1: yêu cầu cấu hình hệ thống — ngôn ngữ, file, tham số đa cấp, metadata, phân quyền, master data, báo cáo; kèm đáp ứng VnResource"
tags:
  - ssi
  - cau-hinh
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
---

# Source: SSI Ch.1 — Cấu hình Hệ thống (Chi tiết)

## Tóm tắt
Chương 1 của hồ sơ thầu SSI đặt ra các yêu cầu cấu hình hệ thống HRM toàn diện, bao gồm: hỗ trợ tiếng Việt đầy đủ, kiểm soát định dạng/dung lượng file, cấu hình tham số đa cấp (toàn cục và từng phân hệ), quản lý metadata tài liệu linh hoạt, phân quyền theo nhóm user/đơn vị, quản trị master data, và báo cáo động hỗ trợ pivot/biểu đồ. VnResource HRM đáp ứng hoàn toàn các yêu cầu này thông qua kiến trúc cấu hình tập trung, audit trail, và công cụ báo cáo tự định nghĩa.

## Items chi tiết

---
### 1.1.1 — Hỗ trợ ngôn ngữ tiếng Việt hoàn toàn

**Yêu cầu:**
> Hệ thống phải có khả năng hỗ trợ hoàn toàn ngôn ngữ tiếng Việt trên tất cả các phương diện bao gồm hiển thị dữ liệu, quản lý dữ liệu, trích xuất dữ liệu, in ấn và các hoạt động giao dịch.

**Đáp ứng VnResource:**
> Hệ thống hỗ trợ hiển thị dữ liệu, trích xuất dữ liệu, in ấn ... theo ngôn ngữ người dùng đang sử dụng

---
### 1.2.1 — Khai báo định dạng và dung lượng file

**Yêu cầu:**
> Hệ thống cho phép khai báo các định dạng, dung lượng file được lưu trữ và xử lý.

**Đáp ứng VnResource:**
> Hệ thống đáp ứng yêu cầu về việc cho phép khai báo, cấu hình và kiểm soát các định dạng file cũng như dung lượng file được phép lưu trữ và xử lý trong hệ thống.
>
> **Khả năng khai báo và kiểm soát định dạng file**
>
> Hệ thống cung cấp cơ chế để quản trị viên cấu hình danh mục định dạng file được phép sử dụng theo từng nhóm nghiệp vụ hoặc từng chức năng, ví dụ:
>
> Tài liệu văn bản: PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX
>
> Hình ảnh: JPG, JPEG, PNG, GIF, BMP
>
> Tệp dữ liệu/trao đổi: CSV, XML, JSON, TXT
>
> Các định dạng chuyên biệt khác: cấu hình bổ sung theo nhu cầu thực tế của SSI
>
> Quản trị viên có thể:
>
> Khai báo mới định dạng file được phép
>
> Chỉnh sửa danh sách định dạng hỗ trợ
>
> Ngừng hiệu lực/không cho phép một số định dạng khi cần
>
> Áp dụng chính sách riêng theo từng phân hệ, loại hồ sơ hoặc nhóm người dùng
>
> **Khả năng khai báo và giới hạn dung lượng file**
>
> Hệ thống hỗ trợ thiết lập ngưỡng dung lượng tối đa cho file khi tải lên, lưu trữ hoặc xử lý, bảo đảm phù hợp với yêu cầu vận hành và chính sách an toàn hệ thống, bao gồm:
>
> Giới hạn dung lượng tối đa theo từng file
>
> Giới hạn theo từng loại file
>
> Giới hạn tổng dung lượng theo hồ sơ/giao dịch/tài khoản người dùng nếu cần
>
> Thiết lập khác nhau giữa môi trường vận hành, phân hệ nghiệp vụ hoặc nhóm người dùng
>
> Ví dụ: File văn bản tối đa 20MB; File hình ảnh tối đa 10MB; File dữ liệu tích hợp tối đa 50MB
>
> **Cơ chế kiểm soát khi lưu trữ và xử lý file**
>
> Kiểm tra định dạng file theo phần mở rộng và/hoặc MIME type
>
> Kiểm tra dung lượng file trước khi upload hoặc xử lý
>
> Từ chối file không hợp lệ và hiển thị thông báo rõ ràng cho người dùng
>
> Ghi log thao tác upload/xử lý file để phục vụ kiểm tra, truy vết
>
> Kết hợp kiểm tra an toàn bảo mật như quét mã độc hoặc chặn các định dạng tiềm ẩn rủi ro nếu được cấu hình
>
> **Khả năng mở rộng và tùy chỉnh**
>
> Có thể bổ sung định dạng file mới trong quá trình vận hành
>
> Có thể điều chỉnh ngưỡng dung lượng mà không ảnh hưởng tới dữ liệu đã lưu
>
> Có thể thiết lập chính sách riêng cho từng nghiệp vụ hoặc từng nhóm tài liệu

---
### 1.3.1 — Cấu hình tham số đa cấp độ

**Yêu cầu:**
> Hệ thống cần cho phép các tham số được cấu hình ở các cấp độ khác nhau, bao gồm nhưng không giới hạn: Tổ chức, Công ty con/chi nhánh, Phòng, Đại lý, Khách hàng, Tài khoản, Người sử dụng, vv.

**Đáp ứng VnResource:**
> Hệ thống đảm bảo hỗ trợ cấu hình tham số theo nhiều cấp độ, có kế thừa, ghi đè, phân quyền và truy vết.
>
> Đảm bảo phù hợp mô hình vận hành đa đơn vị, đa chi nhánh và đa nhóm người dùng trong thực tế triển khai.

---
### 1.3.2 — Định nghĩa các loại tham số: toàn cục và từng phân hệ

**Yêu cầu:**
> Hệ thống phải hỗ trợ để định nghĩa các loại tham số khác nhau, bao gồm nhưng không giới hạn: Các tham số chung của toàn bộ hệ thống và Từng tham số của mỗi phân hệ chức năng

**Đáp ứng VnResource:**
> Hệ thống đáp ứng hoàn toàn yêu cầu về việc định nghĩa và phân loại các nhóm tham số, đảm bảo tính nhất quán toàn cục và tính tùy biến chuyên sâu cho từng nghiệp vụ. Hệ thống cung cấp cơ chế quản lý tham số được chia làm 02 cấp độ chính:
>
> **Nhóm tham số cấu hình hệ thống (Global Parameters)**
>
> Đây là các tham số có tính chất chung, áp dụng cho toàn bộ hệ thống và tất cả các phân hệ.
>
> Mục đích: Định nghĩa các quy tắc nền tảng, thiết lập môi trường vận hành và các chuẩn mực chung.
>
> Ví dụ: Cấu hình định dạng ngày tháng, ngôn ngữ hiển thị; Cấu hình đơn vị tiền tệ mặc định của hệ thống.
>
> **Nhóm tham số chuyên biệt phân hệ (Module-specific Parameters)**
>
> Đây là các tham số được định nghĩa riêng biệt cho từng phân hệ chức năng (ví dụ: Phân hệ Tuyển dụng, Phân hệ Tính lương, Phân hệ Quản lý tài sản...).
>
> Mục đích: Cho phép tùy chỉnh các quy tắc nghiệp vụ đặc thù mà không làm ảnh hưởng đến các phần khác của hệ thống, đảm bảo tính độc lập và tối ưu cho từng quy trình.
>
> Ví dụ:
> - Phân hệ Lương: Định nghĩa các công thức tính phụ cấp, tỷ lệ đóng bảo hiểm theo từng loại hợp đồng.
> - Phân hệ Tuyển dụng: Định nghĩa các trạng thái của quy trình phỏng vấn, các tiêu chí đánh giá ứng viên.
> - Phân hệ Nghỉ phép: Định nghĩa số ngày phép năm, quy định về việc nghỉ bù.

---
### 1.3.3 — Quản lý và giám sát tập trung tham số hệ thống

**Yêu cầu:**
> Hệ thống phải có cơ chế để quản lý và giám sát tập trung các tham số hệ thống được bổ sung mới hoặc bị thay đổi cũng như về khả năng vận hành và quản trị hệ thống.

**Đáp ứng VnResource:**
> Hệ thống cung cấp một cơ chế quản trị tập trung mạnh mẽ, đảm bảo mọi sự thay đổi đối với các tham số cấu hình và mọi biến động về trạng thái vận hành đều được ghi nhận, giám sát và kiểm soát một cách toàn diện.
>
> **1. Cơ chế Quản lý và Giám sát thay đổi tham số (Audit Trail & Change Management)**
>
> Để đảm bảo tính an toàn và tránh các sai sót do cấu hình sai, hệ thống triển khai cơ chế Audit Log (Nhật ký kiểm soát) chi tiết cho mọi tham số:
>
> Ghi vết thay đổi (Full Tracking): Mọi thao tác bổ sung tham số mới hoặc thay đổi giá trị tham số hiện hữu đều được ghi lại đầy đủ các thông tin: Ai thay đổi (User ID/Account), Thay đổi cái gì (Old Value vs New Value), Thời điểm nào (Timestamp), Tại đâu (thuộc phân hệ nào hoặc cấp độ quản lý nào).
>
> Phê duyệt cấu hình (Workflow Approval): Áp dụng cơ chế phê duyệt trước khi thay đổi các tham số quan trọng (Critical Parameters), ngăn chặn việc thay đổi tùy tiện từ các tài khoản có quyền hạn thấp.
>
> **2. Cơ chế Giám sát khả năng vận hành và quản trị (System Monitoring & Health Check)**
>
> Hệ thống cung cấp bộ công cụ giám sát tập trung giúp quản trị viên (Admin) nắm bắt tình trạng "sức khỏe" của hệ thống theo thời gian thực:
>
> Giám sát hiệu năng (Performance Monitoring): Theo dõi các chỉ số quan trọng như mức độ chiếm dụng tài nguyên (CPU, RAM, Disk), tốc độ phản hồi của các phân hệ nghiệp vụ.
>
> Giám sát trạng thái dịch vụ (Service Availability): Cảnh báo ngay lập tức nếu có sự cố gián đoạn kết nối với cơ sở dữ liệu, các dịch vụ nền (background services) hoặc các tác vụ lập lịch (scheduled jobs) bị lỗi.
>
> Hệ thống cảnh báo (Alerting System): Tự động gửi thông báo (qua Email, Dashboard hoặc Notification trong ứng dụng) khi các ngưỡng giới hạn (thresholds) bị vượt qua hoặc khi phát hiện các hành vi cấu hình bất thường.

---
### 1.3.4 — Metadata tài liệu linh hoạt

**Yêu cầu:**
> Hệ thống linh hoạt cho phép: Tạo/sửa/xóa các trường thông tin về thuộc tính của tài liệu (metadata). Tạo/sửa trường thuộc tính bằng cách import file từ bên ngoài (excel, csv...) hoặc copy từ trường thông tin đã tồn tại. Thiết lập các nguyên tắc cập nhật giá trị cho trường thuộc tính. Thiết kế giao diện và phân nhóm các trường thuộc tính một cách linh hoạt.

**Đáp ứng VnResource:**
> Hệ thống đáp ứng đầy đủ yêu cầu về tạo/sửa/xóa metadata, import từ Excel/CSV, sao chép cấu hình trường đã có, thiết lập quy tắc cập nhật giá trị, và thiết kế giao diện, phân nhóm trường thuộc tính linh hoạt. Giải pháp bảo đảm khả năng mở rộng, tùy biến cao và quản trị tập trung, phù hợp cho môi trường quản lý tài liệu có yêu cầu thay đổi nghiệp vụ thường xuyên.

---
### 1.3.5 — Phân quyền linh hoạt theo user/nhóm/đơn vị

**Yêu cầu:**
> Hệ thống cho phép linh hoạt phân quyền/tạo các nhóm quyền đối với từng user/nhóm user/đơn vị trong việc xem, cập nhật, thay đổi cho các dữ liệu, cây thư mục, loại tài liệu, module chức năng trên hệ thống.

**Đáp ứng VnResource:**
> Hệ thống đáp ứng đầy đủ yêu cầu về phân quyền linh hoạt và tạo nhóm quyền cho từng user/nhóm user/đơn vị, đồng thời cho phép kiểm soát chi tiết quyền xem, cập nhật, thay đổi trên dữ liệu, cây thư mục, loại tài liệu và module chức năng. Giải pháp bảo đảm tính an toàn, linh hoạt, dễ quản trị và phù hợp với mô hình tổ chức nhiều cấp.

---
### 1.3.6 — Quản lý master data / danh mục

**Yêu cầu:**
> Hệ thống có giao diện để quản lý, cập nhật các dữ liệu chủ (master data), dữ liệu dạng danh mục (được khai báo hoặc đồng bộ từ hệ thống của SSI). Việc cập nhật, thay đổi không làm ảnh hưởng tới việc khai thác của các dữ liệu đã lưu trữ, đang xử lý hoặc chuẩn bị xử lý.

**Đáp ứng VnResource:**
> Hệ thống có cung cấp giao diện quản trị để quản lý, cập nhật dữ liệu chủ (Master Data) và dữ liệu danh mục (Danh mục khai báo thủ công hoặc đồng bộ từ hệ thống SSI), bao gồm: thêm mới, chỉnh sửa, ngừng hiệu lực, phân loại, import/export, và theo dõi lịch sử thay đổi.
>
> **Cập nhật không ảnh hưởng dữ liệu đang khai thác**
>
> Việc cập nhật hoặc thay đổi Master Data/Danh mục được thiết kế theo cơ chế quản lý phiên bản và hiệu lực (versioning + effective dating), đảm bảo:
>
> Không làm thay đổi dữ liệu lịch sử đã lưu trữ.
>
> Không ảnh hưởng các giao dịch/đối tượng đang xử lý (in-process) tại thời điểm cập nhật.
>
> Không ảnh hưởng các giao dịch/đối tượng chuẩn bị xử lý đã được ghi nhận theo snapshot dữ liệu tại thời điểm khởi tạo.
>
> Các dữ liệu mới phát sinh sau cập nhật sẽ tự động áp dụng theo phiên bản/hiệu lực mới.
>
> **Cơ chế đảm bảo an toàn khai thác dữ liệu**
>
> Quản lý hiệu lực theo thời gian: danh mục có trường Từ ngày/Đến ngày, hoặc Trạng thái hiệu lực.
>
> Lưu lịch sử thay đổi (Audit log): ghi nhận ai, thay đổi gì, thời điểm nào, phục vụ kiểm toán và truy vết.
>
> Cơ chế khóa nghiệp vụ và kiểm soát xung đột khi có nhiều người cùng cập nhật.
>
> Phân quyền theo vai trò (Role-based access control): chỉ người được cấp quyền mới được cập nhật danh mục.
>
> **Đồng bộ từ hệ thống SSI**
>
> Hệ thống hỗ trợ đồng bộ dữ liệu danh mục từ SSI theo các phương thức phù hợp (tùy theo SSI cung cấp):
>
> API real-time hoặc batch theo lịch (scheduled sync).
>
> Mapping trường dữ liệu và quy tắc kiểm tra hợp lệ trước khi ghi nhận.
>
> Cơ chế đối soát và cảnh báo lỗi đồng bộ (log, retry, thông báo).

---
### 1.3.7 — Quyền Super Admin can thiệp toàn hệ thống

**Yêu cầu:**
> Hệ thống có cơ chế cho phép quản trị viên (admin hệ thống) có quyền cao nhất và được quyền can thiệp (tạo, sửa, thay thế, xóa) vào các dữ liệu, cây thư mục, tài liệu, module chức năng của hệ thống.

**Đáp ứng VnResource:**
> Hệ thống đáp ứng yêu cầu về việc cho phép quản trị viên hệ thống (super admin) có quyền cao nhất để tạo, sửa, thay thế, xóa đối với dữ liệu, cây thư mục, tài liệu và module chức năng, đồng thời vẫn bảo đảm kiểm soát an toàn, bảo mật và truy vết đầy đủ.

---
### 1.3.8 — Báo cáo động, pivot table, biểu đồ

**Yêu cầu:**
> Hệ thống hỗ trợ xử lý các báo cáo trên các công cụ báo cáo hiện đại cho phép khả năng tùy biến bổ sung các báo cáo theo yêu cầu của SSI.

**Đáp ứng VnResource:**

> **1.3.8.1 Báo cáo động**
>
> - Người dùng đã có nguồn dữ liệu trước (Thủ tục SQL hoặc oracle...)
> - PE sẽ được chủ động hơn trong việc tạo mới một báo cáo thông qua việc viết store.
> - Tốc độ lấy dữ liệu báo cáo sẽ nhanh hơn (Performance).
>
> Giải pháp thực hiện:
>
> - Tạo ra 1 bảng tạm để tổng hợp tất cả dữ liệu nhân viên (Đặt lịch tổng hợp dữ liệu) => Thay vì như trước kia nếu muốn xuất báo cáo từ nhiều nguồn, phải left join qua nhiều bảng rất lâu thì bây giờ chỉ cần vào bảng tạm lấy (Dwh_HreInfomation) hoặc từ Store PE tự viết.
> - Cho phép tùy chọn cấu hình báo cáo một cách linh động tại màn hình "Cấu Hình Báo Cáo Động"
>
> Các bước thực hiện: (1) Viết Store lấy dữ liệu cho báo cáo từ bảng tạm đã tổng hợp → (2) Cấu hình chạy store gọi dữ liệu báo cáo → (3) Thêm key để phân quyền hiển thị báo cáo → (4) Phân quyền để thấy báo cáo → (5) Chạy chức năng hiển thị thông tin bảng lương → (6) Cấu hình template xuất phiếu lương → (7) Xuất báo cáo bảng lương → (8) Xuất ra excel.

> **1.3.8.2 Người dùng tự định nghĩa nguồn dữ liệu**
>
> Mục đích:
> - Nhằm giúp người sử dụng có thể tạo ra những câu truy vấn đơn giản, phục vụ cho việc tạo ra nhiều báo cáo phục vụ nhu cầu của mỗi công ty
> - Đơn giản hóa việc viết câu truy vấn, không tốn nhiều thời gian để tìm các liên kết
> - Giao diện trực quan, dễ dàng thao tác
>
> Hỗ trợ kéo thả bảng/cột, cấu hình điều kiện trực tiếp hoặc dạng control, điều chỉnh liên kết khóa ngoại, lưu trữ dữ liệu nguồn báo cáo.

> **1.3.8.3 Hỗ trợ pivot table và biểu đồ**
>
> Mục đích: PE sẽ chủ động hơn trong việc giúp người dùng thao tác với các dữ liệu đã tạo từ báo cáo động mà không cần chờ bản build.
>
> Giải pháp thực hiện: Sử dụng nguồn dữ liệu sau khi đã kết xuất ra lưới, tạo ra bảng dữ liệu Pivot theo nguồn dữ liệu đã có, không phải gọi về server để lấy dữ liệu.
>
> Quy trình: (1) Kết xuất dữ liệu/Grid Data → (2) Pivot dữ liệu/Pivot table (kéo thả phần tử) → (3) Hiển thị biểu đồ/Pivot chart → (4) Cài đặt thông báo → (5) Cài đặt cấu hình hiển thị biểu đồ → Xuất dữ liệu lưới Pivot hoặc lưu thành báo cáo mới.

> **1.3.8.4 Hiển thị tổng hợp tất cả các biểu đồ báo cáo động trên một trang**
>
> Mục đích: Giúp cho User không cần phải thực hiện từng bước như cấu hình Pivot để xem lại biểu đồ được vẽ. Thực hiện thao tác hiển thị tất cả các loại biểu đồ đã được cài đặt xong. Đưa những biểu đồ đã được cài đặt ra một trang riêng, người dùng có thể xem lại những gì đã được cấu hình.
>
> Giải pháp: Sau khi cài đặt thành công, chuyển đến trang hiển thị cấu hình. Người dùng kéo thả khung hiển thị và các báo cáo vào các vùng tương ứng, lưu lại cài đặt, sau đó chuyển sang trang xem hiển thị để xem các biểu đồ đã lưu.

---
### 1.3.9 — Bằng chứng đáp ứng yêu cầu cấu hình

**Yêu cầu:**
> Nhà thầu cung cấp bằng chứng để chứng minh khả năng đáp ứng được các yêu cầu trên.

**Đáp ứng VnResource:**
> *(Phần này nằm trong mục 1.3.9 của hồ sơ thầu, bao gồm các screenshot minh họa giao diện hệ thống và mô hình HA. Tham khảo thêm mục 2.1 về Tính sẵn sàng hệ thống với giải pháp HA 99.99% sử dụng Load Balancer cứng, cluster active-active, database replication, backup server.)*

## Liên kết
- [[wiki/projects/SSI-Project]]
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]
