---
type: source
code: q1r2s
description: "SSI Ch.9 bảo mật detail: 47 items từ input validation, auth/MFA, session, file, DB, TLS đến integration security, BVDLCN, SSDLC patch SLA"
tags:
  - ssi
  - bao-mat
  - security
  - system
domain: system
created: 2026-05-13
updated: 2026-05-13
related:
  - "[[wiki/projects/SSI-Project]]"
  - "[[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]"
  - "[[wiki/sources/j5k9w-ssi-security-requirements]]"
---

# Source: SSI Ch.9 — Bảo mật (Chi tiết đầy đủ)

## Tóm tắt

Chương 9 mô tả toàn bộ yêu cầu bảo mật cho hệ thống HRM SSI, bao gồm 14 nhóm: Input Validation, Output Encoding, Authentication/Identity (10 items), Authorization (6 items), Session Management (4 items), File & Storage Security (5 items), Error Handling & Logging (2 items), Database Security (2 items), Transport Security (TLS), Third-party/Hosting Security (2 items), Integration Security (5 items), Data Privacy/BVDLCN (3 items), API Security, và SSDLC & Vulnerability Management (2 items). Mỗi item gồm yêu cầu gốc và đáp ứng chi tiết của nhà thầu.

---

## 9.1 — Input Validation

### 9.1.1 — Server-side validation

**Yêu cầu:**
> Tất cả các dữ liệu do người dùng cung cấp (bao gồm chuỗi truy vấn, cookie, nội dung tiêu đề HTTP, SOAP và các yêu cầu dịch vụ web khác, nội dung tự động post-back và nội dung được chuyển hướng) phải được mã hóa với một bộ ký tự chung (chuẩn hóa) và kiểm tra tính hợp lệ về phạm vi, độ dài, định dạng, kiểu dữ liệu trên hệ thống đáng tin cậy (phía máy chủ) trước khi xử lý.

**Đáp ứng:**
> Hệ thống được thiết kế và triển khai theo nguyên tắc "Server-side Validation First", đảm bảo toàn bộ dữ liệu đầu vào do người dùng cung cấp đều được chuẩn hóa, kiểm tra và xác thực tại phía máy chủ trước khi được xử lý hoặc ghi nhận vào hệ thống:

##### a) Chuẩn hóa (Encoding / Normalization)

> Toàn bộ dữ liệu đầu vào (bao gồm: Chuỗi truy vấn (Query String), Cookie, HTTP Headers, Nội dung SOAP / REST API, Dữ liệu post-back tự động, Dữ liệu redirect / callback) đều được chuẩn hóa về bộ ký tự thống nhất (UTF-8) trước khi xử lý.
>
> Loại bỏ hoặc escape các ký tự đặc biệt không hợp lệ nhằm phòng ngừa các rủi ro như: SQL Injection, Cross-site Scripting (XSS), Command Injection.

##### b) Kiểm tra tính hợp lệ tại phía máy chủ (Server-side Validation)

> Hệ thống thực hiện kiểm tra dữ liệu đầu vào trên hệ thống đáng tin cậy (backend/server), không phụ thuộc vào kiểm tra phía client, bao gồm:
>
> - Phạm vi giá trị (Range validation): số ngày phép, hệ số lương, thang điểm đánh giá...
> - Độ dài dữ liệu (Length validation): giới hạn độ dài cho từng trường theo thiết kế nghiệp vụ và CSDL
> - Định dạng dữ liệu (Format validation): Email, số điện thoại, mã nhân viên, ngày tháng (ISO 8601)
> - Kiểu dữ liệu (Data type validation): đảm bảo dữ liệu đúng kiểu (string, number, date, boolean, object...) trước khi xử lý logic nghiệp vụ

---

### 9.1.2 — Whitelist / Blacklist validation

**Yêu cầu:**
> Tất cả dữ liệu đầu vào phải được kiểm tra dựa trên "danh sách trắng" các ký tự được phép (ví dụ: sử dụng biểu thức chính quy). Trong trường hợp bộ lọc "danh sách trắng" chưa được sử dụng, tất cả giá trị đầu vào phải được kiểm tra qua bộ lọc "danh sách đen" để chặn bất kỳ ký tự nguy hiểm tiềm ẩn. Các ký tự nguy hiểm phổ biến bao gồm: \< \> \" \' ( ) & + \\ \' \" \# %; Ký tự trống (%00); Ký tự dòng mới (%0d, %0a, \r, \n); Ký tự thay đổi đường dẫn (../ or ..\)

**Đáp ứng:**

##### a) Kiểm tra dữ liệu đầu vào theo "Danh sách trắng" (Whitelist)

> Đối với các trường dữ liệu có cấu trúc xác định (mã nhân viên, email, số điện thoại, ngày tháng, mã phòng ban, thang điểm đánh giá...), hệ thống áp dụng:
>
> - Biểu thức chính quy (Regular Expressions) để xác định tập ký tự và định dạng hợp lệ
> - Chỉ cho phép các ký tự và mẫu dữ liệu đã được định nghĩa trước
> - Dữ liệu không phù hợp với "danh sách trắng" sẽ bị từ chối xử lý ngay tại phía máy chủ

##### b) Áp dụng "Danh sách đen" trong trường hợp đặc thù

> Trong các trường hợp dữ liệu dạng tự do (free-text) như: ghi chú đánh giá, nhận xét của quản lý, nội dung phản hồi nhân viên, hệ thống áp dụng thêm cơ chế Blacklist filtering.
>
> Danh sách ký tự và mẫu nguy hiểm được kiểm soát: \< \> \" \' ( ) & + \\ \' \" \# % ;, Null byte (%00), xuống dòng (%0d, %0a, \r, \n), path traversal (../, ..\), các chuỗi tấn công XSS/Injection/Path Traversal

##### c) Thực thi kiểm soát tại phía máy chủ

> Toàn bộ cơ chế whitelist/blacklist được thực thi tại hệ thống phía máy chủ. Các request vi phạm sẽ bị từ chối xử lý và ghi nhận log bảo mật phục vụ audit và truy vết.

---

## 9.2 — Output Encoding

### 9.2.1 — Output encoding & CSP

**Yêu cầu:**
> Tất cả các dữ liệu đầu ra không đáng tin cậy (ví dụ: đầu vào được cung cấp bởi người dùng trực tiếp hoặc gián tiếp thông qua một ứng dụng khác) phải được mã hoá (encode) trước khi trả lại cho khách hàng (ví dụ sử dụng .NET HtmlEncode, UrlEncode, Apache Jakarta Commons Lang Package). Có Content Security Policy (CSP) để hạn chế tài nguyên tải từ nguồn không tin cậy, tăng cường bảo vệ chống XSS.

**Đáp ứng:**

##### a) Mã hóa dữ liệu đầu ra (Output Encoding)

> Tất cả dữ liệu có nguồn gốc do người dùng nhập hoặc từ hệ thống khác đều được xem là dữ liệu không đáng tin cậy và được mã hóa trước khi hiển thị/trả về client:
>
> - HTML Encoding: dữ liệu hiển thị trên giao diện web (ví dụ: .NET HtmlEncode)
> - URL Encoding: dữ liệu trong đường dẫn, tham số URL (ví dụ: .NET UrlEncode)
> - JavaScript/JSON Encoding: dữ liệu nhúng trong script hoặc payload JSON
> - Header Encoding: dữ liệu phản hồi HTTP
>
> Việc mã hóa được thực hiện tại phía máy chủ trước khi gửi tới trình duyệt người dùng.

##### b) Chuẩn hóa việc hiển thị dữ liệu

> Áp dụng cơ chế hiển thị an toàn mặc định (safe-by-default) trên các component UI. Không cho phép render trực tiếp HTML hoặc script từ dữ liệu đầu vào của người dùng nếu không được kiểm soát rõ ràng. Các trường nội dung dạng tự do được escape phù hợp.

##### c) Triển khai Content Security Policy (CSP)

> Hệ thống triển khai CSP nhằm:
>
> - Hạn chế việc tải tài nguyên (script, style, image, iframe, font...) từ các nguồn không tin cậy
> - Ngăn chặn thực thi script inline hoặc script không được cấp phép
>
> CSP được cấu hình theo nguyên tắc "default-deny", chỉ cho phép nguồn nội bộ và các domain đã được định nghĩa rõ ràng trong whitelist.

---

## 9.3 — Authentication (10 items)

### 9.3.1 — Server-side authentication cho tất cả tài nguyên

**Yêu cầu:**
> Xác thực phải được thực thi trên máy chủ và cho tất cả các trang và tài nguyên, ngoại trừ trang web công khai không có bất kỳ thông tin nhạy cảm nào.

**Đáp ứng:**
> Hệ thống sử dụng service HRM Identity để xác thực các ứng dụng trước khi user được phép truy cập đến ứng dụng/tài nguyên của hệ thống.
>
> Khi đăng nhập (xác thực) thành công, hệ thống phát hành một token JWT cho người dùng, chứa thông tin mã hóa như ID, vai trò, thời hạn token.
>
> Token này được gửi kèm theo mỗi yêu cầu gọi API → giúp hệ thống xác thực và phân quyền nhanh chóng, không cần lưu session.
>
> Giúp tăng khả năng mở rộng hệ thống (stateless) và bảo vệ khỏi việc đánh cắp phiên đăng nhập (session hijacking).
>
> Token có thể bị thu hồi nếu phát hiện bất thường hoặc khi người dùng đăng xuất.

---

### 9.3.2 — CAPTCHA & Rate Limiting

**Yêu cầu:**
> Mật khẩu đăng nhập, biểu mẫu đăng ký, biểu mẫu khi quên mật khẩu phải bao gồm CAPTCHA để ngăn chặn các cuộc tấn công bruteforce, có cơ chế rate limit.

**Đáp ứng:**
> Hệ thống áp dụng:
>
> - CAPTCHA cho: Đăng nhập, Đăng ký tài khoản, Quên/đặt lại mật khẩu
> - Rate limiting theo IP/tài khoản để: Ngăn chặn brute-force, Tự động khóa tạm thời khi vượt ngưỡng cho phép

---

### 9.3.3 — Password complexity

**Yêu cầu:**
> Độ dài mật khẩu và yêu cầu về độ phức tạp được thực thi đối với mật khẩu mới và mật khẩu được đặt lại theo quy định trong Tiêu chuẩn Mật khẩu hiện hành.

**Đáp ứng:**
> Hệ thống đáp ứng đầy đủ theo tiêu chuẩn, cho phép cấu hình linh hoạt theo quy định nội bộ của doanh nghiệp.

---

### 9.3.4 — Authentication controls trên server

**Yêu cầu:**
> Kiểm soát xác thực phải được thực thi trên một hệ thống đáng tin cậy (tức là phía máy chủ thay vì phía máy khách).

**Đáp ứng:**
> Hệ thống đáp ứng hoàn toàn, toàn bộ logic xác thực và kiểm soát truy cập được xử lý tại phía máy chủ.

---

### 9.3.5 — Transaction integrity

**Yêu cầu:**
> Các yêu cầu thực hiện giao dịch trên ứng dụng phải được kiểm tra tính toàn vẹn để đảm bảo rằng dữ liệu chưa được sửa đổi bởi một bên trái phép.

**Đáp ứng:**
> Giải pháp đáp ứng đầy đủ yêu cầu kiểm tra tính hợp lệ của thông tin, dữ liệu đầu vào trước khi xử lý. Hệ thống được tích hợp các cơ chế kiểm tra (validation) ở nhiều lớp, bao gồm cả phía giao diện người dùng (client-side) và phía máy chủ (server-side), nhằm đảm bảo dữ liệu được kiểm soát chặt chẽ trước khi ghi nhận vào hệ thống.
>
> Các quy tắc kiểm tra bao gồm: kiểm tra định dạng dữ liệu, tính đầy đủ của thông tin, tính hợp lệ theo nghiệp vụ (business rules) và đối soát với các dữ liệu liên quan. Hệ thống cũng hỗ trợ cảnh báo, hướng dẫn người dùng điều chỉnh khi dữ liệu không hợp lệ.

---

### 9.3.6 — Password hashing (bcrypt/Argon2id)

**Yêu cầu:**
> Mật khẩu được lưu trữ sử dụng hàm băm một chiều với thuật toán mạnh (bcrypt, scrypt, hoặc Argon2id) kèm salt ngẫu nhiên per-user. Lưu trữ mật khẩu và xác thực phải sử dụng cơ chế được cung cấp bởi framework thay vì sử dụng cơ chế tự phát triển.

**Đáp ứng:**
> Mã Hóa Dữ Liệu Truyền Tải: Tất cả dữ liệu truyền tải giữa máy khách và máy chủ đều được mã hóa bằng giao thức HTTPS sử dụng TLS 1.2 để đảm bảo rằng dữ liệu không bị nghe lén hoặc thay đổi trong quá trình truyền tải.
>
> Mã Hóa Dữ Liệu Lưu Trữ: Dữ liệu nhạy cảm như mật khẩu được mã hóa bằng các thuật toán mã hóa mạnh mẽ như AES (Advanced Encryption Standard) trước khi lưu trữ trong cơ sở dữ liệu. Mật khẩu người dùng được băm (hashed) và kèm theo muối (salt) bằng các thuật toán như bcrypt để tăng cường bảo mật, đảm bảo rằng ngay cả khi cơ sở dữ liệu bị xâm nhập, mật khẩu vẫn an toàn.

---

### 9.3.7 — Password masking

**Yêu cầu:**
> Mục nhập mật khẩu phải được che đi trên màn hình của người dùng.

**Đáp ứng:**
> Tất cả các trường nhập mật khẩu trên giao diện người dùng đều được:
>
> - Che ký tự nhập (password masking)
> - Không hiển thị hoặc lưu trữ tạm thời dưới dạng dễ truy cập

---

### 9.3.8 — MFA bắt buộc

**Yêu cầu:**
> Xác thực đa yếu tố (MFA) bắt buộc cho tất cả tài khoản truy cập hệ thống HRM.

**Đáp ứng:**
> Hỗ trợ xác thực đa yếu tố (MFA) để tăng cường bảo mật tài khoản người dùng. Người dùng cần cung cấp một mã xác thực từ thiết bị di động của họ sau khi nhập mật khẩu để đăng nhập: OTP (Authenticator App), Email / SMS OTP (theo cấu hình).

---

### 9.3.9 — Mật khẩu & token qua kết nối mã hóa

**Yêu cầu:**
> Tất cả mật khẩu và mã thông báo xác thực được gửi qua kết nối được mã hóa (ví dụ như TLS).

**Đáp ứng:**
> Mã Hóa Dữ Liệu Truyền Tải: Tất cả dữ liệu truyền tải giữa máy khách và máy chủ đều được mã hóa bằng giao thức HTTPS sử dụng TLS 1.2 (Transport Layer Security) để đảm bảo rằng dữ liệu không bị nghe lén hoặc thay đổi trong quá trình truyền tải.

---

### 9.3.10 — Mật khẩu tạm thời

**Yêu cầu:**
> Nếu mật khẩu tạm thời (hoặc liên kết đến mật khẩu tạm thời) được sử dụng, những điều sau đây được áp dụng: Thời gian hết hạn ngắn. Thay đổi mật khẩu khi sử dụng lần đầu.

**Đáp ứng:**
> Trong trường hợp sử dụng mật khẩu tạm thời hoặc liên kết đặt lại mật khẩu:
>
> - Mật khẩu/liên kết có thời gian hết hạn ngắn
> - Người dùng bắt buộc thay đổi mật khẩu ngay trong lần đăng nhập đầu tiên
> - Liên kết/mật khẩu hết hạn sẽ không thể tái sử dụng

---

## 9.4 — Authorization (6 items)

### 9.4.1 — Least Privilege & RBAC

**Yêu cầu:**
> Ứng dụng hoạt động dựa trên nguyên tắc "đặc quyền tối thiểu" (tức là người dùng hoặc tài khoản dịch vụ được chỉ định mức truy cập tối thiểu để thực hiện nhiệm vụ). Kiểm soát truy cập dựa trên vai trò được thiết kế để đảm bảo mức truy cập nhất quán cho công việc hoặc vai trò được áp dụng cho quyền truy cập của người dùng.

**Đáp ứng:**
> Ứng dụng được thiết kế và vận hành theo nguyên tắc "Đặc quyền tối thiểu (Least Privilege)", trong đó:
>
> - Người dùng/tài khoản dịch vụ chỉ được cấp mức quyền tối thiểu cần thiết để thực hiện nhiệm vụ được giao
> - Áp dụng kiểm soát truy cập dựa trên vai trò (RBAC), đảm bảo quyền truy cập nhất quán theo từng vai trò công việc, dễ dàng quản trị và kiểm soát khi mở rộng quy mô tổ chức
> - Hỗ trợ cấu hình vai trò theo mô hình tập đoàn (Tập đoàn → Công ty thành viên → Đơn vị)

---

### 9.4.2 — Hạn chế truy cập tài nguyên

**Yêu cầu:**
> Hạn chế quyền truy cập vào tất cả các tài nguyên (bao gồm tệp, các URL được bảo vệ, các chức năng được bảo vệ, các dịch vụ và dữ liệu ứng dụng) cho người dùng được ủy quyền.

**Đáp ứng:**
> Hệ thống thực thi kiểm soát truy cập chặt chẽ đối với toàn bộ tài nguyên, bao gồm: tệp và tài liệu, URL được bảo vệ, chức năng nghiệp vụ, dịch vụ hệ thống (API), dữ liệu ứng dụng (nhân sự, lương, đánh giá...).
>
> Chỉ người dùng đã được xác thực và ủy quyền hợp lệ mới có quyền truy cập tương ứng; mọi truy cập trái phép đều bị từ chối và ghi nhận log.

---

### 9.4.3 — Re-authentication cho phiên dài hạn

**Yêu cầu:**
> Trong trường hợp các phiên xác thực dài hạn được cho phép, ủy quyền được xác thực lại định kỳ để đảm bảo rằng các đặc quyền không thay đổi và nếu có, buộc người dùng phải đăng xuất và xác thực lại.

**Đáp ứng:**
> Đối với các phiên xác thực dài hạn:
>
> - Hệ thống thực hiện kiểm tra lại quyền truy cập định kỳ
> - Khi phát hiện thay đổi quyền (ví dụ: thay đổi vai trò, thu hồi quyền): phiên làm việc hiện tại sẽ bị vô hiệu hóa, người dùng bị buộc đăng xuất và xác thực lại
> - Cơ chế này đảm bảo quyền truy cập luôn phản ánh đúng trạng thái phân quyền hiện hành

---

### 9.4.4 — Tách biệt trang quản trị

**Yêu cầu:**
> Trang quản trị ứng dụng web phải được tách ra khỏi trang dành cho khách/người dùng và nó chỉ có thể được truy cập nội bộ.

**Đáp ứng:**
> Hệ thống đáp ứng trang quản trị hệ thống có thể được tách thành service riêng:
>
> - Được tách biệt hoàn toàn với giao diện dành cho người dùng/khách thông thường
> - Chỉ cho phép truy cập từ: Mạng nội bộ hoặc các địa chỉ IP/điều kiện truy cập được kiểm soát
> - Yêu cầu xác thực mạnh và phân quyền quản trị rõ ràng

---

### 9.4.5 — Audit logging hành động quan trọng

**Yêu cầu:**
> Có audit logging để ghi lại các hành động quan trọng (ví dụ: thay đổi quyền, truy cập dữ liệu nhạy cảm, thao tác trên dữ liệu lương/nhân sự) nhằm theo dõi và kiểm tra sau này.

**Đáp ứng:**
> Hệ thống triển khai Audit Logging để ghi nhận và theo dõi các hành động quan trọng, bao gồm (nhưng không giới hạn):
>
> - Thay đổi quyền và vai trò người dùng
> - Truy cập và thao tác trên dữ liệu nhạy cảm
> - Thao tác liên quan đến lương, hợp đồng, hồ sơ nhân sự
>
> Log được lưu trữ tập trung, phục vụ: kiểm tra sau này (audit), điều tra sự cố, tuân thủ yêu cầu kiểm soát nội bộ.

---

### 9.4.6 — Maker-Checker cho thao tác nhạy cảm

**Yêu cầu:**
> Các thao tác nhạy cảm (thay đổi lương, thêm/xóa nhân viên, phê duyệt nghỉ việc) phải có cơ chế maker-checker/dual approval. Không cho phép tự phê duyệt thay đổi liên quan đến chính mình. Bulk export dữ liệu nhân sự (CSV/Excel) phải có phê duyệt và ghi audit log.

**Đáp ứng:**
> Các thao tác nhạy cảm trên hệ thống HRM được áp dụng cơ chế Maker-Checker (Dual Approval), bao gồm:
>
> - Thay đổi lương, phụ cấp
> - Thêm/xóa/chấm dứt nhân sự
> - Phê duyệt nghỉ việc, điều chuyển
>
> Các nguyên tắc kiểm soát:
>
> - Không cho phép người dùng tự phê duyệt các thay đổi liên quan đến chính mình
> - Các thao tác bulk export dữ liệu nhân sự (CSV/Excel): Bắt buộc có phê duyệt; ghi nhận đầy đủ audit log (ai yêu cầu, ai phê duyệt, thời điểm, phạm vi dữ liệu)

---

## 9.5 — Session Management (4 items)

### 9.5.1 — Session timeout

**Yêu cầu:**
> Thời gian hiệu lực của một phiên không hoạt động phải được cấu hình, thời gian hiệu lực đủ ngắn dựa trên đánh giá rủi ro và yêu cầu nghiệp vụ. Không được phép cấp một phiên làm việc không có thời hạn.

**Đáp ứng:**
> Hệ thống đáp ứng, triển khai cơ chế quản lý phiên (session management) với:
>
> - Thời gian hiệu lực của phiên không hoạt động (session idle timeout) được cấu hình theo chính sách bảo mật của doanh nghiệp
> - Thời gian phiên được thiết lập ngắn hợp lý dựa trên đánh giá rủi ro và yêu cầu nghiệp vụ
> - Không hỗ trợ phiên làm việc không có thời hạn (no session without expiry)
> - Phiên sẽ tự động hết hạn khi không có hoạt động trong khoảng thời gian quy định

---

### 9.5.2 — Session data server-side + CSRF

**Yêu cầu:**
> Tất cả dữ liệu được lưu trữ trong các biến của phiên thay vì lưu trữ trên cookie phía máy khách. Các thuộc tính "Secure" và "HTTPOnly" được cấu hình trên tất cả các cookie của phiên. Có token chống CSRF (Cross-Site Request Forgery) để bảo vệ các yêu cầu giao dịch quan trọng.

**Đáp ứng:**
> Hệ thống áp dụng các nguyên tắc bảo mật phiên như sau:
>
> - Dữ liệu phiên được lưu trữ tại server-side, không lưu thông tin nhạy cảm trên cookie phía client
> - Cookie phiên được cấu hình: Secure flag (chỉ truyền qua HTTPS), HTTPOnly flag (ngăn truy cập từ JavaScript phía client)
> - Cơ chế CSRF Token được áp dụng cho các yêu cầu giao dịch quan trọng nhằm ngăn chặn tấn công Cross-Site Request Forgery; Token CSRF được validate tại server trước khi xử lý yêu cầu

---

### 9.5.3 — Cookie qua kết nối mã hóa & logout

**Yêu cầu:**
> Tất cả cookie và các mã định danh của phiên được gửi qua các kết nối được mã hóa. Chức năng đăng xuất phải chấm dứt hoàn toàn phiên hoặc kết nối liên quan.

**Đáp ứng:**
> Hệ thống đáp ứng: tất cả cookie và mã định danh phiên đều được truyền qua kết nối mã hóa TLS (HTTPS).
>
> Chức năng đăng xuất được thiết kế để:
>
> - Vô hiệu hóa hoàn toàn session tại server
> - Hủy token xác thực liên quan
> - Ngăn chặn tái sử dụng phiên sau khi logout

---

### 9.5.4 — Không hiển thị session ID trong URL/log

**Yêu cầu:**
> Không được hiển thị số nhận dạng phiên trong URL, thông báo lỗi hoặc nhật ký sự kiện. Mã định danh của phiên phải được đặt trong tiêu đề cookie HTTP.

**Đáp ứng:**
> Hệ thống đáp ứng:
>
> - Không hiển thị session ID trong URL trong bất kỳ trường hợp nào
> - Session ID không được ghi vào: thông báo lỗi, log ứng dụng, log hệ thống không an toàn
> - Session identifier được lưu và truyền duy nhất qua HTTP Cookie
> - Cơ chế này giúp giảm thiểu rủi ro lộ thông tin phiên làm việc (session hijacking)

---

## 9.6 — File & Storage Security (5 items)

### 9.6.1 — Không lưu mật khẩu trong source code

**Yêu cầu:**
> Tất cả mật khẩu trong mã nguồn phải được xóa. Dữ liệu liên quan đến bảo mật (ví dụ: mật khẩu, chuỗi kết nối) được lưu trữ phía máy chủ thay vì phía máy khách.

**Đáp ứng:**
> Hệ thống HRM được thiết kế tuân thủ nguyên tắc bảo mật mã nguồn:
>
> - Không lưu trữ mật khẩu, chuỗi kết nối hoặc thông tin nhạy cảm trong mã nguồn
> - Tất cả thông tin bảo mật được quản lý tập trung tại server-side configuration / secret management
> - Dữ liệu nhạy cảm không được lưu phía client, đảm bảo giảm thiểu rủi ro lộ lọt thông tin trong quá trình vận hành và triển khai

---

### 9.6.2 — Kiểm soát file upload

**Yêu cầu:**
> Yêu cầu xác thực trước khi cho phép tải tệp lên. Có giới hạn kích thước tệp tải lên. Kiểm tra các tệp tin được tải lên có phải là loại được phép hay không bằng cách kiểm tra tiêu đề tệp, loại tệp và phần mở rộng. Ngăn tải lên tệp có thể được thông dịch bởi máy chủ Web. Quét tệp tin được tải lên từ người dùng để tìm kiếm virus và phần mềm độc hại.

**Đáp ứng:**
> Hệ thống đáp ứng, áp dụng cơ chế kiểm soát tải tệp chặt chẽ bao gồm:
>
> - Yêu cầu xác thực người dùng trước khi cho phép upload
> - Giới hạn: kích thước tệp tải lên, số lượng tệp theo từng phiên hoặc người dùng
> - Kiểm tra tệp tải lên dựa trên: Header file (magic number), MIME type, Phần mở rộng file
> - Chặn các loại file có khả năng bị thực thi bởi web server (ví dụ: script, executable)
> - Tích hợp cơ chế quét virus/malware đối với tất cả tệp tải lên trước khi lưu trữ và sử dụng

---

### 9.6.3 — File không lưu trong webroot

**Yêu cầu:**
> Không lưu tệp tin trong thư mục webroot. Các tệp phải được lưu trữ ở một thư mục ngoài thư mục webroot hoặc trong cơ sở dữ liệu. Tắt đặc quyền thực thi trên các thư mục được phép tải tệp lên.

**Đáp ứng:**
> Hệ thống đáp ứng:
>
> - Tất cả tệp tải lên được lưu trữ tại File Server, hỗ trợ Network File System (được cấu hình) hoặc MinIO
> - Thư mục lưu trữ file được cấu hình: không cho phép truy cập trực tiếp từ web, tắt quyền thực thi (execute permission) trên toàn bộ thư mục upload
> - Việc truy xuất file được kiểm soát thông qua API có xác thực và phân quyền

---

### 9.6.4 — Bảo vệ file cache & temp

**Yêu cầu:**
> Các bản sao lưu trong bộ nhớ cache và các bản sao lưu tạm thời của dữ liệu nhạy cảm được lưu trữ trên máy chủ phải được bảo vệ khỏi các truy cập trái phép, và các tập tin như vậy phải được xoá ngay khi không còn cần thiết. Mã nguồn phía máy chủ được bảo vệ khỏi bị người dùng trái phép tải xuống.

**Đáp ứng:**
> Hệ thống đáp ứng đầy đủ:
>
> - Các file tạm, cache hoặc bản sao dữ liệu nhạy cảm được: lưu trữ trong vùng bảo vệ truy cập (restricted access), tự động xóa khi không còn sử dụng, không lưu trữ dữ liệu nhạy cảm lâu dài trong cache hệ thống
> - Mã nguồn phía server được bảo vệ bằng: kiểm soát truy cập chặt chẽ, không cho phép tải xuống trái phép, cấu hình bảo mật ở tầng hạ tầng và ứng dụng

---

### 9.6.5 — Client-side cache disable

**Yêu cầu:**
> Bộ nhớ đệm phía máy khách bị vô hiệu hóa trên các trang chứa thông tin nhạy cảm (sử dụng "Cache-Control: no-store" và tiêu đề "Pragma: no-cache").

**Đáp ứng:**
> Hệ thống đáp ứng đầy đủ:
>
> - Hệ thống cấu hình header HTTP: Cache-Control: no-store, Pragma: no-cache
> - Đảm bảo trình duyệt: không lưu cache nội dung nhạy cảm, không hiển thị lại dữ liệu sau khi logout hoặc quay lại trang bằng back button

---

## 9.7 — Error Handling & Logging (2 items)

### 9.7.1 — Custom error, không lộ stack trace

**Yêu cầu:**
> Ứng dụng phải sử dụng lỗi tùy chỉnh và không hiển thị thông tin debug hoặc thông tin stack trace. Thông tin nhạy cảm bao gồm chi tiết hệ thống, số nhận dạng phiên và thông tin tài khoản được loại bỏ khỏi các trang thông báo lỗi. Sử dụng các trang báo lỗi chung để xử lý các trường hợp ngoại lệ.

**Đáp ứng:**
> Hệ thống đáp ứng, được thiết kế theo nguyên tắc "Secure Error Handling", trong đó:
>
> - Ứng dụng sử dụng cơ chế xử lý lỗi tùy chỉnh (custom error handling), không hiển thị: Stack trace, Thông tin debug hệ thống, Cấu trúc cơ sở dữ liệu hoặc chi tiết kỹ thuật nội bộ
> - Các thông tin nhạy cảm như: thông tin tài khoản, mã phiên (session ID), chi tiết hệ thống nội bộ đều được loại bỏ khỏi thông báo lỗi hiển thị ra người dùng
> - Tất cả lỗi hệ thống được chuyển hướng về trang thông báo lỗi chung (generic error page) với nội dung hiển thị được chuẩn hóa, không tiết lộ thông tin kỹ thuật

---

### 9.7.2 — Log lưu trữ có cấu trúc, kiểm soát quyền

**Yêu cầu:**
> Thông tin nhật ký sự kiện được lưu trữ ở định dạng có thể dễ dàng truy xuất. Quyền truy cập vào nhật ký sự kiện chỉ giới hạn ở những cá nhân được ủy quyền. Không lưu trữ thông tin nhạy cảm trong nhật ký sự kiện, bao gồm nhưng không giới hạn: thông tin chi tiết hệ thống không cần thiết, số nhận dạng phiên, mật khẩu hoặc dữ liệu cá nhân.

**Đáp ứng:**
> Hệ thống triển khai cơ chế ghi nhật ký sự kiện (audit & application logging) với các đặc điểm:
>
> - Nhật ký sự kiện được lưu trữ theo định dạng có cấu trúc (structured logging), hỗ trợ: truy vấn nhanh, lọc theo thời gian/người dùng/hành động/module, tích hợp hệ thống giám sát/SIEM nếu cần
> - Quyền truy cập log được kiểm soát chặt chẽ: chỉ các cá nhân/tài khoản được ủy quyền mới có quyền truy cập, áp dụng phân quyền theo vai trò (RBAC)
> - Không ghi nhận thông tin nhạy cảm trong log: mật khẩu hoặc dữ liệu xác thực, Session ID hoặc token bảo mật, dữ liệu cá nhân không cần thiết (PII), thông tin hệ thống nội bộ không phục vụ giám sát
> - Log được sử dụng phục vụ: giám sát hệ thống, phân tích sự cố, kiểm toán (audit trail), tuân thủ yêu cầu an ninh thông tin

---

## 9.8 — Database Security (2 items)

### 9.8.1 — Least Privilege DB + Parameterized Queries

**Yêu cầu:**
> Ứng dụng phải sử dụng mức đặc quyền tối thiểu có thể khi truy cập cơ sở dữ liệu. Sử dụng các tham số truy vấn mạnh (ví dụ PHP-bindParam(), Java-PrepareStatement(), .Net-SqlCommand(), Hibernate-createQuery()) thay vì các truy vấn SQL thô.

**Đáp ứng:**
> Hệ thống được thiết kế và triển khai theo nguyên tắc "Least Privilege Access" trong truy cập cơ sở dữ liệu, kết hợp với việc sử dụng các cơ chế truy vấn tham số hóa (parameterized queries / prepared statements).

##### 1. Áp dụng nguyên tắc đặc quyền tối thiểu với cơ sở dữ liệu

> - Tài khoản kết nối tới cơ sở dữ liệu được cấu hình theo nguyên tắc: chỉ cấp đúng quyền cần thiết cho chức năng ứng dụng, không sử dụng tài khoản có quyền quản trị cao (DBA/Admin) cho ứng dụng vận hành
> - Phân tách quyền truy cập theo môi trường và dịch vụ: Read-only cho các tác vụ truy vấn báo cáo (nếu áp dụng), Read/Write có kiểm soát cho các dịch vụ nghiệp vụ
> - Hạn chế quyền trực tiếp trên schema, chỉ cấp quyền trên các bảng hoặc stored procedures cần thiết

##### 2. Sử dụng truy vấn tham số hóa (Parameterized Queries)

> - Hệ thống không sử dụng SQL động (raw SQL concatenation) trong xử lý dữ liệu đầu vào từ người dùng
> - Áp dụng các cơ chế truy vấn an toàn theo nền tảng: .NET (SqlCommand với parameter binding), Java (PreparedStatement), Hibernate (createQuery / parameter binding), PHP nếu áp dụng (bindParam() / PDO prepared statements)

---

### 9.8.2 — Mã hóa CSDL + Backup mã hóa

**Yêu cầu:**
> Mã hóa dữ liệu nhạy cảm trong cơ sở dữ liệu (ví dụ: thông tin lương, số CMND/CCCD, thông tin sức khỏe, số tài khoản ngân hàng). Có chức năng backup định kỳ và khôi phục dữ liệu. Bản sao lưu (backup) phải được mã hóa.

**Đáp ứng:**
> Hệ thống HRM được thiết kế với cơ chế bảo vệ dữ liệu nhạy cảm theo cả hai lớp mã hóa dữ liệu tại cơ sở dữ liệu (encryption at rest) và mã hóa dữ liệu sao lưu (backup encryption).

##### 1. Mã hóa dữ liệu nhạy cảm trong cơ sở dữ liệu

> Các loại dữ liệu nhạy cảm: thông tin lương/thu nhập/phụ cấp, số CMND/CCCD hoặc định danh cá nhân, thông tin sức khỏe (nếu có), số tài khoản ngân hàng và thông tin tài chính liên quan.
>
> Áp dụng cơ chế: mã hóa dữ liệu khi lưu trữ (encryption at rest) tại tầng CSDL hoặc tầng ứng dụng tùy kiến trúc triển khai; chỉ giải mã trong phạm vi xử lý nghiệp vụ khi có yêu cầu hợp lệ; kiểm soát chặt chẽ quyền truy cập dữ liệu theo vai trò (RBAC).

##### 2. Cơ chế sao lưu dữ liệu (Backup)

> - Sao lưu toàn bộ hoặc gia tăng (full/incremental backup) theo lịch cấu hình
> - Hỗ trợ chính sách lưu trữ backup theo vòng đời dữ liệu (retention policy)
> - Có thể triển khai theo mô hình: On-premise backup storage hoặc cloud backup

##### 3. Mã hóa bản sao lưu (Backup Encryption)

> - Tất cả các file backup của hệ thống đều được mã hóa trước khi lưu trữ
> - Không thể đọc được nếu không có khóa giải mã hợp lệ; ngăn chặn truy cập trái phép trong trường hợp bị lộ file backup
> - Quản lý khóa mã hóa (encryption key) được kiểm soát tập trung và phân quyền chặt chẽ

##### 4. Cơ chế khôi phục dữ liệu (Restore)

> - Khôi phục toàn bộ hệ thống (full restore)
> - Khôi phục theo thời điểm (point-in-time recovery nếu cấu hình)
> - Quy trình khôi phục được kiểm soát và có phân quyền rõ ràng nhằm tránh thao tác trái phép

---

## 9.9 — Transport Security

### 9.9.1 — TLS >= 1.2, HSTS, không fallback

**Yêu cầu:**
> Tiêu chuẩn TLS (TLS >= 1.2) phải được sử dụng và cấu hình thích hợp. Kết nối TLS không thành công không được quay lại kết nối không an toàn. Triển khai HSTS (HTTP Strict Transport Security) để buộc sử dụng HTTPS. Chứng chỉ TLS phải hợp lệ và có tên miền chính xác, không hết hạn và được cài đặt chứng chỉ trung gian khi được yêu cầu.

**Đáp ứng:**

##### 1. Sử dụng tiêu chuẩn TLS (≥ 1.2)

> - Hệ thống bắt buộc sử dụng giao thức TLS phiên bản 1.2 trở lên (TLS 1.2 / TLS 1.3) cho toàn bộ các kết nối HTTP (HTTPS)
> - Các giao thức mã hóa yếu (SSL, TLS 1.0, TLS 1.1) được vô hiệu hóa hoàn toàn
> - Cấu hình cipher suite: ưu tiên thuật toán mã hóa mạnh (AES-256, ECDHE, SHA-2), loại bỏ các thuật toán không an toàn hoặc đã lỗi thời

##### 2. Không cho phép fallback về kết nối không an toàn

> Trong trường hợp kết nối TLS không thành công, hệ thống không cho phép chuyển sang HTTP không mã hóa. Toàn bộ request bắt buộc phải sử dụng HTTPS.

##### 3. Triển khai HTTP Strict Transport Security (HSTS)

> Hệ thống triển khai cơ chế HSTS nhằm:
>
> - Buộc trình duyệt chỉ truy cập hệ thống qua HTTPS
> - Ngăn chặn downgrade attack (ép sử dụng HTTP)
> - Giảm nguy cơ tấn công man-in-the-middle
>
> Chính sách HSTS được cấu hình với thời gian hiệu lực phù hợp (max-age) và áp dụng cho toàn bộ subdomain (nếu được cấu hình).

---

## 9.10 — Third-party / Hosting Security

### 9.10.1 — Cloud/hosting deployment security

**Yêu cầu:**
> Trường hợp triển khai trên hạ tầng cloud (hoặc hosting tại đối tác), nhà thầu mô tả phương án triển khai dịch vụ đáp ứng theo yêu cầu bảo mật được mô tả tại PL07.

**Đáp ứng:**
> Trong trường hợp hệ thống được triển khai trên hạ tầng Cloud hoặc dịch vụ hosting tại đối tác, nhà thầu cung cấp phương án triển khai theo mô hình Cloud Security Architecture tuân thủ yêu cầu bảo mật tại PL07.

##### a) Kiến trúc triển khai an toàn trên Cloud

> Hệ thống được triển khai theo mô hình phân lớp: Presentation layer (UI), Application layer (API / services), Data layer (database, storage).
>
> Tách biệt môi trường: Development / Testing / Production độc lập; không công khai trực tiếp database ra Internet.

##### b) Kiểm soát truy cập và bảo mật hạ tầng

> - IAM (Identity & Access Management) phân quyền theo vai trò
> - Principle of Least Privilege cho tài nguyên cloud
> - Kiểm soát truy cập hạ tầng qua VPN / Bastion host / Private subnet
> - Hạn chế truy cập trực tiếp từ Internet vào tài nguyên nội bộ

##### c) Bảo vệ dữ liệu và truyền thông

> - Dữ liệu được mã hóa khi truyền (TLS 1.2+) và mã hóa khi lưu trữ (Encryption at Rest)
> - Phân tách khóa mã hóa (Key Management Service -- KMS nếu áp dụng)
> - Sao lưu dữ liệu định kỳ và mã hóa backup theo chính sách bảo mật

##### d) Giám sát và an ninh vận hành

> - Triển khai hệ thống Monitoring & Logging tập trung
> - Cảnh báo an ninh theo thời gian thực
> - Theo dõi: truy cập bất thường, hiệu năng hệ thống, sự kiện bảo mật (security events)

##### e) Tuân thủ yêu cầu bảo mật PL07

> Phương án triển khai tuân thủ đầy đủ các yêu cầu bảo mật tại PL07, bao gồm: kiểm soát truy cập, mã hóa dữ liệu, ghi log và audit, quản lý lỗ hổng và cập nhật bảo mật, đảm bảo tính sẵn sàng và liên tục dịch vụ (High Availability).

---

### 9.10.2 — Tiêu chuẩn bảo mật nhà cung cấp

**Yêu cầu:**
> Có tiêu chuẩn bảo mật mà nhà cung cấp cần tuân thủ, ví dụ: ISO 27001, Luật ANM 2025, Luật BVDLCN 2025.

**Đáp ứng:**
> Nhà thầu cam kết hạ tầng Cloud / dịch vụ hosting được lựa chọn và vận hành phải tuân thủ các tiêu chuẩn và quy định bảo mật hiện hành, bao gồm:

##### a) Tiêu chuẩn quốc tế và thực hành tốt

> - ISO/IEC 27001 -- Hệ thống quản lý an toàn thông tin (ISMS)
> - Các best practices về Cloud Security (OWASP Cloud Security, CIS Benchmarks nếu áp dụng)

##### b) Tuân thủ quy định pháp lý Việt Nam

> - Luật An ninh mạng 2025 (Luật ANM 2025)
> - Luật Bảo vệ Dữ liệu Cá nhân 2025 (Luật BVDLCN 2025)
>
> Trong đó đảm bảo: bảo vệ dữ liệu cá nhân theo nguyên tắc hợp pháp, minh bạch và giới hạn mục đích sử dụng; kiểm soát lưu trữ và xử lý dữ liệu trong phạm vi cho phép; đảm bảo an toàn dữ liệu trong suốt vòng đời hệ thống.

---

## 9.11 — Integration Security (5 items)

### 9.11.1 — Integration Security Architecture Document

**Yêu cầu:**
> Nhà thầu phải cung cấp Integration Security Architecture Document, mô tả chi tiết cho từng điểm tích hợp: giao thức, phương thức xác thực, mã hóa, xử lý lỗi, và data flow diagram chỉ rõ dữ liệu nào được truyền qua từng kênh.

**Đáp ứng:**
> Chúng tôi cam kết cung cấp tài liệu Integration Security Architecture Document cho hệ thống HRM, mô tả đầy đủ và chi tiết kiến trúc bảo mật cho toàn bộ các điểm tích hợp.

##### 1. Phạm vi tài liệu

> Tài liệu bao gồm mô tả chi tiết cho từng điểm tích hợp: Hệ thống nội bộ (ERP, DMS, AMIS, SSO, BI...), Hệ thống bên thứ ba (API external services), Các dịch vụ tích hợp real-time hoặc batch.

##### 2. Nội dung mô tả cho từng điểm tích hợp

**a) Giao thức tích hợp (Protocol)**
> RESTful API (HTTPS), SOAP Web Services (nếu có hệ thống legacy), Message Queue (Kafka/RabbitMQ hoặc tương đương), Batch integration (ETL/CSV secure transfer). Tất cả giao tiếp bắt buộc sử dụng TLS 1.2+.

**b) Phương thức xác thực (Authentication)**
> OAuth 2.0 / OpenID Connect (cho hệ thống hiện đại), API Key có ký số (signed request), JWT token (stateless authentication), Mutual TLS (mTLS) cho tích hợp mức độ bảo mật cao, Service account có phân quyền riêng biệt (least privilege).

**c) Mã hóa dữ liệu (Encryption)**
> Dữ liệu truyền tải bắt buộc mã hóa bằng TLS 1.2+; dữ liệu nhạy cảm trong payload có thể mã hóa bổ sung ở tầng application (field-level encryption); dữ liệu lưu trữ trung gian (nếu có) được mã hóa theo chuẩn AES-256 hoặc tương đương.

**d) Xử lý lỗi (Error Handling)**
> Không trả về stack trace hoặc thông tin hệ thống nội bộ; sử dụng mã lỗi chuẩn (HTTP status codes + error code nội bộ); log lỗi tích hợp ghi nhận đầy đủ để phục vụ truy vết, không ghi dữ liệu nhạy cảm; cơ chế retry / timeout / circuit breaker để đảm bảo ổn định tích hợp.

**e) Kiểm soát luồng dữ liệu (Data Flow Control)**
> Nhà thầu cung cấp Data Flow Diagram (DFD) chi tiết: xác định rõ hệ thống nguồn/đích, kênh truyền dữ liệu (API/MQ/Batch), phân loại dữ liệu theo mức độ nhạy cảm (dữ liệu nhân sự, lương, PII), mô tả điểm mã hóa/giải mã, điểm kiểm tra xác thực/phân quyền, luồng xử lý lỗi và retry.

##### 3. Nguyên tắc bảo mật áp dụng cho tích hợp

> - Principle of Least Privilege cho service account
> - Zero Trust trong giao tiếp hệ thống
> - Validate & sanitize toàn bộ dữ liệu đầu vào từ hệ thống tích hợp
> - Audit logging cho toàn bộ giao dịch tích hợp
> - Kiểm soát truy cập API theo IP whitelist / policy nếu cần

---

### 9.11.2 — API auth, rate limiting, webhook HMAC, credential vault

**Yêu cầu:**
> Tất cả API tích hợp phải sử dụng xác thực (OAuth 2.0 hoặc mTLS), rate limiting, và input validation tại điểm nhận. Webhook phải hỗ trợ signature verification (HMAC-SHA256). Credential tích hợp (API key, service account) phải lưu trong vault, rotation định kỳ, revoke khi phát hiện lộ.

**Đáp ứng:**

##### 1. Xác thực API tích hợp

> Tất cả API tích hợp giữa HRM và hệ thống bên ngoài đều bắt buộc sử dụng một trong các cơ chế xác thực an toàn: OAuth 2.0 (khuyến nghị cho hệ thống tích hợp hiện đại), Mutual TLS (mTLS) cho các kết nối yêu cầu mức độ bảo mật cao, Service account có phân quyền rõ ràng theo nguyên tắc least privilege. Không cho phép truy cập API không xác thực hoặc xác thực yếu.

##### 2. Rate Limiting và kiểm soát truy cập API

> Hệ thống áp dụng cơ chế rate limiting theo: User / client ID, IP address, API endpoint. Mục tiêu: ngăn chặn tấn công brute force, ngăn chặn lạm dụng API hoặc DDoS ở tầng ứng dụng. Có cơ chế giới hạn số lượng request theo thời gian và tạm khóa khi vượt ngưỡng bất thường.

##### 3. Input Validation tại điểm nhận

> Tất cả API đều thực hiện kiểm tra và xác thực dữ liệu đầu vào tại server-side: kiểm tra định dạng dữ liệu (schema validation), kiểm tra kiểu dữ liệu và phạm vi giá trị, loại bỏ ký tự hoặc payload không hợp lệ. Áp dụng cơ chế reject-first security model: dữ liệu không hợp lệ bị từ chối ngay tại điểm tiếp nhận.

##### 4. Bảo mật Webhook (Webhook Security)

> Đối với các cơ chế webhook tích hợp: hỗ trợ signature verification sử dụng HMAC-SHA256. Quy trình: payload được ký bằng secret key, hệ thống nhận sẽ kiểm tra chữ ký (signature) trước khi xử lý dữ liệu. Ngăn chặn: giả mạo request (spoofing), replay attack, unauthorized callback.

##### 5. Quản lý credential tích hợp (API Key / Service Account)

> Toàn bộ thông tin xác thực (API key, client secret, service account credentials) được:
>
> - Lưu trữ trong secure vault / secret management system
> - Không lưu trực tiếp trong mã nguồn hoặc cấu hình plain text
> - Credential rotation định kỳ theo chính sách bảo mật
> - Revoke/disable ngay lập tức khi phát hiện nghi ngờ rò rỉ hoặc vi phạm
> - Giới hạn quyền truy cập theo từng integration scope

##### 6. Kiểm soát và giám sát tích hợp

> Ghi log đầy đủ các hoạt động API (request/response metadata không chứa dữ liệu nhạy cảm, trạng thái xác thực và lỗi). Theo dõi bất thường: tăng đột biến request, truy cập từ nguồn không hợp lệ. Hỗ trợ audit và điều tra sự cố bảo mật.

---

### 9.11.3 — SSO Azure AD sync trạng thái user ≤ 15 phút

**Yêu cầu:**
> Khi tích hợp SSO với Azure AD, hệ thống phải đồng bộ trạng thái user (disable/delete) trong tối đa 15 phút. User bị disable trên AD phải bị terminate session trên HRM ngay tại lần kiểm tra tiếp theo.

**Đáp ứng:**
> Hệ thống hỗ trợ tích hợp Single Sign-On (SSO) với Azure Active Directory (Azure AD) và đảm bảo cơ chế đồng bộ trạng thái người dùng theo thời gian gần thực.

##### 1. Đồng bộ trạng thái người dùng từ Azure AD

> Hệ thống triển khai cơ chế directory synchronization với Azure AD thông qua Microsoft Graph API (hoặc cơ chế đồng bộ tương đương). Các trạng thái người dùng được đồng bộ: Active/Inactive, Disabled user, Deleted user. Chu kỳ đồng bộ tối đa không vượt quá 15 phút.

##### 2. Xử lý người dùng bị disable hoặc xóa trên Azure AD

> Khi người dùng bị disable hoặc delete trên Azure AD, hệ thống HRM sẽ: ghi nhận trạng thái thay đổi trong lần đồng bộ tiếp theo, cập nhật trạng thái người dùng tương ứng trong hệ thống HRM, vô hiệu hóa quyền truy cập của người dùng ngay sau khi đồng bộ hoàn tất.

##### 3. Chấm dứt phiên làm việc (Session Termination)

> Đối với người dùng đã bị disable trên Azure AD: hệ thống HRM đảm bảo terminate toàn bộ session đang hoạt động, việc chấm dứt session được thực hiện ngay tại lần kiểm tra/đồng bộ trạng thái tiếp theo. Người dùng không thể tiếp tục truy cập sau khi bị thu hồi quyền trên AD.

---

### 9.11.4 — Data minimization + Data Mapping Matrix + Payroll integrity

**Yêu cầu:**
> Data minimization: mỗi kênh tích hợp chỉ được truyền dữ liệu tối thiểu cần thiết. Nhà thầu phải cung cấp data mapping matrix cho từng điểm tích hợp. Tích hợp payroll/banking phải có integrity check (checksum hoặc digital signature) và maker-checker trước khi submit batch.

**Đáp ứng:**
> Hệ thống được thiết kế theo nguyên tắc Data Minimization by Design.

##### 1. Nguyên tắc Data Minimization trong tích hợp

> Mỗi điểm tích hợp chỉ được phép truyền dữ liệu tối thiểu cần thiết (least data principle). Không truyền các trường dữ liệu không liên quan đến chức năng tích hợp nhằm: giảm thiểu rủi ro rò rỉ dữ liệu cá nhân (PII), hạn chế phạm vi xử lý dữ liệu không cần thiết, tuân thủ nguyên tắc bảo vệ dữ liệu cá nhân.

##### 2. Data Mapping Matrix cho từng điểm tích hợp

> Nhà thầu cung cấp Data Mapping Matrix (DMM) chi tiết: danh sách hệ thống nguồn và hệ thống đích, mapping trường dữ liệu nguồn ↔ trường dữ liệu đích, xác định rõ dữ liệu được truyền qua từng kênh tích hợp (API/batch/MQ), mức độ nhạy cảm của từng trường dữ liệu, quy tắc biến đổi (transformation rules) nếu có.

##### 3. Tích hợp Payroll / Banking — Kiểm soát toàn vẹn dữ liệu

**a) Integrity Check**
> Áp dụng Checksum (hash-based validation) hoặc Digital Signature nhằm đảm bảo dữ liệu không bị thay đổi trong quá trình truyền tải và phát hiện mọi hành vi chỉnh sửa trái phép dữ liệu batch.

**b) Cơ chế Maker-Checker (Dual Approval)**
> Tất cả batch dữ liệu liên quan đến chi trả lương, chuyển khoản ngân hàng bắt buộc phải có: Người tạo (Maker) + Người phê duyệt (Checker). Hệ thống không cho phép tự phê duyệt. Chỉ sau khi checker phê duyệt thì batch mới được phép submit sang hệ thống bên ngoài.

##### 4. Kiểm soát trước khi gửi batch

> Trước khi gửi dữ liệu sang hệ thống ngân hàng/payroll: thực hiện validation dữ liệu, kiểm tra checksum/signature, kiểm tra trạng thái phê duyệt maker-checker. Chỉ các batch hợp lệ mới được phép thực thi.

---

### 9.11.5 — Resilient integration: queue, retry, no PII in log

**Yêu cầu:**
> Khi tích hợp fail, dữ liệu phải được queue an toàn, mã hóa at rest, retry tự động. Không lưu plaintext PII vào temp folder hoặc log. Audit log cho tất cả dữ liệu trao đổi qua kênh tích hợp.

**Đáp ứng:**
> Hệ thống được thiết kế với cơ chế resilient integration architecture (kiến trúc tích hợp chịu lỗi).

##### 1. Cơ chế xử lý khi tích hợp thất bại

> Khi xảy ra lỗi trong quá trình tích hợp (API/MQ/batch), hệ thống sẽ: tự động chuyển dữ liệu vào hàng đợi an toàn (secure queue), đảm bảo dữ liệu không bị mất hoặc xử lý dở dang. Queue được thiết kế theo nguyên tắc: bền vững (durable queue), chống mất dữ liệu khi hệ thống gặp sự cố.

##### 2. Bảo vệ dữ liệu trong hàng đợi (Queue Security)

> Dữ liệu trong queue được mã hóa khi lưu trữ (encryption at rest) và chỉ giải mã khi cần xử lý bởi service được ủy quyền. Áp dụng cơ chế kiểm soát truy cập: chỉ các service tích hợp hợp lệ mới có quyền đọc/ghi queue, tuân thủ nguyên tắc least privilege.

##### 3. Cơ chế retry tự động

> Hệ thống hỗ trợ: retry tự động theo chiến lược cấu hình (exponential backoff hoặc fixed interval), giới hạn số lần retry để tránh vòng lặp vô hạn. Nếu retry thất bại vượt ngưỡng: dữ liệu được chuyển sang dead-letter queue để xử lý thủ công.

##### 4. Kiểm soát dữ liệu tạm và log (No PII Exposure)

> Hệ thống tuyệt đối không: lưu PII dạng plaintext trong thư mục tạm (temp folder), ghi dữ liệu nhạy cảm vào log hệ thống hoặc log ứng dụng. Các cơ chế kiểm soát: masking/redaction dữ liệu nhạy cảm trước khi ghi log, loại bỏ các trường PII không cần thiết trong trace/debug, kiểm soát nghiêm ngặt quyền truy cập log.

##### 5. Audit log cho tích hợp dữ liệu

> Toàn bộ giao dịch qua kênh tích hợp đều được ghi nhận trong audit log tập trung, bao gồm: thời gian giao dịch, hệ thống nguồn và đích, trạng thái xử lý (success/fail/retry), metadata liên quan đến request/response (không chứa PII nhạy cảm). Audit log phục vụ: truy vết giao dịch, kiểm toán an ninh (security audit), phân tích sự cố tích hợp.

---

## 9.12 — Data Privacy / BVDLCN (3 items)

### 9.12.1 — Tuân thủ Nghị định 13/2023/NĐ-CP & data residency

**Yêu cầu:**
> Tuân thủ Nghị định 13/2023/NĐ-CP: có cơ sở pháp lý xử lý dữ liệu cá nhân, thông báo cho chủ thể dữ liệu, thực hiện đánh giá tác động (DPIA) cho hệ thống HRM. Dữ liệu nhân sự SSI phải được lưu trữ tại Việt Nam (data residency).

**Đáp ứng:**
> Hệ thống được thiết kế và vận hành tuân thủ đầy đủ Nghị định 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân, đảm bảo cơ sở pháp lý, minh bạch và kiểm soát chặt chẽ trong toàn bộ vòng đời xử lý dữ liệu.
>
> - Cơ sở pháp lý xử lý dữ liệu cá nhân: hệ thống chỉ xử lý dữ liệu cá nhân dựa trên mục đích nghiệp vụ hợp pháp; có cơ chế ghi nhận và quản lý căn cứ xử lý dữ liệu (consent/legal basis)
> - Thông báo cho chủ thể dữ liệu: người dùng/nhân sự được thông báo rõ ràng về mục đích xử lý dữ liệu, phạm vi dữ liệu thu thập, quyền của chủ thể dữ liệu
> - Đánh giá tác động xử lý dữ liệu (DPIA): thực hiện DPIA cho hệ thống HRM theo yêu cầu quản trị rủi ro dữ liệu cá nhân; DPIA được cập nhật khi có thay đổi lớn về hệ thống hoặc luồng dữ liệu
> - Data residency (lưu trữ dữ liệu tại Việt Nam): dữ liệu nhân sự của SSI được đảm bảo lưu trữ trong lãnh thổ Việt Nam, tuân thủ yêu cầu về chủ quyền dữ liệu và quy định pháp luật hiện hành

---

### 9.12.2 — Data masking & cấm production data trong test

**Yêu cầu:**
> Data masking/redaction: các trường nhạy cảm (CMND/CCCD, số tài khoản ngân hàng, mức lương) phải được che khi hiển thị (ví dụ: chỉ hiển thị 4 số cuối). Cấm sử dụng dữ liệu production trong môi trường test/staging; yêu cầu data anonymization/pseudonymization cho test data.

**Đáp ứng:**
> Hệ thống áp dụng cơ chế data masking, redaction và kiểm soát dữ liệu môi trường phi sản xuất nhằm bảo vệ thông tin cá nhân và giảm thiểu rủi ro lộ lọt dữ liệu.
>
> Che giấu dữ liệu nhạy cảm (Data Masking/Redaction):
>
> - CMND/CCCD: chỉ hiển thị một phần (ví dụ: \*\*\* \*\*\* 1234)
> - Số tài khoản ngân hàng: chỉ hiển thị 3--4 số cuối
> - Mức lương: hiển thị theo phân quyền hoặc dạng ẩn một phần
> - Áp dụng theo vai trò người dùng (role-based masking)
>
> Kiểm soát dữ liệu production: cấm sử dụng dữ liệu production trong môi trường test/staging; áp dụng cơ chế kiểm soát truy cập dữ liệu giữa các môi trường.
>
> An toàn dữ liệu test: dữ liệu test được ẩn danh hóa (data anonymization) hoặc giả danh hóa (pseudonymization), đảm bảo không thể truy ngược về cá nhân thực tế.

---

### 9.12.3 — Data retention policy

**Yêu cầu:**
> Data retention policy: quy định thời gian lưu trữ và quy trình xóa/ẩn danh hóa dữ liệu nhân sự khi nhân viên nghỉ việc, phù hợp với quy định pháp luật lao động và Nghị định 13.

**Đáp ứng:**
> Hệ thống xây dựng và áp dụng chính sách vòng đời dữ liệu (Data Retention Policy) rõ ràng, phù hợp với pháp luật lao động và Nghị định 13/2023/NĐ-CP.
>
> - Quy định thời gian lưu trữ dữ liệu: dữ liệu nhân sự được lưu trữ theo từng loại nghiệp vụ và yêu cầu pháp lý; có phân loại dữ liệu (đang hoạt động, lưu trữ lịch sử, đã nghỉ việc)
> - Xử lý dữ liệu nhân sự nghỉ việc: khi nhân sự nghỉ việc, dữ liệu được chuyển sang trạng thái lưu trữ (archived), hạn chế truy cập theo phân quyền chặt chẽ
> - Xóa/ẩn danh hóa dữ liệu: sau thời gian lưu trữ theo quy định, thực hiện xóa dữ liệu hoặc ẩn danh hóa (anonymization) để phục vụ thống kê/báo cáo; đảm bảo tuân thủ quy định pháp luật lao động và Nghị định 13/2023/NĐ-CP

---

## 9.13 — API Security

### 9.13.1 — API endpoint auth, rate limit, input validation, key rotation

**Yêu cầu:**
> Tất cả API endpoints phải có xác thực (OAuth 2.0 hoặc API key) và phân quyền riêng biệt. Rate limiting per endpoint. Input validation riêng cho API, không phụ thuộc frontend validation. API key rotation định kỳ và cơ chế revoke ngay lập tức.

**Đáp ứng:**
> Hệ thống đáp ứng, tất cả API đều được cấu hình:
>
> - Xác thực API (OAuth2, JWT, API Key)
> - Mã hóa dữ liệu (HTTPS/TLS)
> - IP Whitelist / Rate Limit
> - Audit log khi tích hợp

---

## 9.14 — SSDLC & Vulnerability Management

### 9.14.1 — SSDLC & Pentest trước go-live

**Yêu cầu:**
> Nhà thầu phải có quy trình phát triển an toàn (SSDLC) và cung cấp tài liệu chứng minh. Pentest (kiểm thử xâm nhập) bắt buộc trước go-live và sau mỗi major release; báo cáo pentest phải được chia sẻ với bộ phận An ninh Thông tin SSI.

**Đáp ứng:**
> Nhà thầu áp dụng Quy trình phát triển phần mềm an toàn (Secure Software Development Life Cycle -- SSDLC) xuyên suốt toàn bộ vòng đời sản phẩm HRM, bao gồm các hoạt động kiểm soát bảo mật tại từng giai đoạn: thiết kế, phát triển, kiểm thử, triển khai và vận hành.
>
> - SSDLC được tích hợp các hoạt động bảo mật như: Threat modeling trong giai đoạn thiết kế, Secure coding guidelines trong giai đoạn phát triển, Static/Dynamic Application Security Testing (SAST/DAST) trong kiểm thử, Review bảo mật trước khi phát hành (security gate)
> - Kiểm thử xâm nhập (Pentest) là yêu cầu bắt buộc: thực hiện trước khi go-live, thực hiện lại sau mỗi major release
> - Pentest được thực hiện bởi đội ngũ độc lập hoặc bên thứ ba có chuyên môn bảo mật
> - Báo cáo pentest sẽ được: tổng hợp đầy đủ phát hiện (vulnerabilities), mức độ rủi ro và khuyến nghị khắc phục; chia sẻ với bộ phận An ninh Thông tin (SSI) theo đúng quy trình phối hợp bảo mật của dự án

---

### 9.14.2 — SLA Patch lỗ hổng

**Yêu cầu:**
> Nhà thầu cam kết SLA patch lỗ hổng: Critical ≤ 72 giờ, High ≤ 7 ngày, Medium ≤ 30 ngày. Thông báo cho SSI (bộ phận ANTT) trong vòng 24 giờ khi phát hiện lỗ hổng bảo mật ảnh hưởng đến hệ thống HRM.

**Đáp ứng:**
> Nhà thầu cam kết quy trình quản lý lỗ hổng và vá lỗi bảo mật theo SLA như sau:

| Mức độ | SLA khắc phục |
|--------|--------------|
| Critical | ≤ 72 giờ |
| High | ≤ 7 ngày |
| Medium | ≤ 30 ngày |

> - Thông báo lỗ hổng: khi phát hiện hoặc được cảnh báo về lỗ hổng bảo mật ảnh hưởng đến hệ thống HRM, nhà thầu cam kết thông báo cho bộ phận An ninh Thông tin (SSI) trong vòng 24 giờ
>
> Quy trình xử lý bao gồm:
>
> - Tiếp nhận và xác minh lỗ hổng
> - Đánh giá mức độ ảnh hưởng
> - Lập kế hoạch khắc phục và triển khai bản vá
> - Kiểm tra lại (verification) trước khi đóng lỗ hổng
>
> Toàn bộ quá trình được theo dõi và ghi nhận nhằm đảm bảo: truy vết đầy đủ, minh bạch trong xử lý, tuân thủ SLA đã cam kết.

---

## Liên kết

- [[wiki/projects/SSI-Project]]
- [[wiki/sources/x2p7k-thau-ssi-ho-so-tong-the]]
- [[wiki/sources/j5k9w-ssi-security-requirements]]
