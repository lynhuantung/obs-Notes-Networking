---
Mã: 25093713-01
aliases:
date: 2025-09-13
time: 11:05
Week: "37"
tags:
  - daily
Liên kết:
  - "[[7-bao-cao-ket-qua]]"
---
## 🔐 Phân tích các lỗi bảo mật 
---

### 1. **Change this code to use a stronger protocol.**

- **Giải thích:**  
    Phần mềm/hệ thống đang sử dụng **giao thức bảo mật yếu** (ví dụ: SSLv3, TLS 1.0, HTTP...), dẫn đến nguy cơ bị tấn công hoặc nghe lén.
- **Cách khắc phục:**
    - Chuyển đổi sang **giao thức mạnh hơn** như **TLS 1.2 hoặc TLS 1.3**.
    - Vô hiệu hóa hoàn toàn các giao thức cũ trong phần cấu hình hệ thống/server.

---

### 2. **Content Security Policies should be restrictive to mitigate the risk of content injection attacks.**

- **Giải thích:**  
    **Content Security Policy (CSP)** không đủ chặt, gây nguy cơ bị **content injection (chèn mã độc/XSS)**.
- **Cách khắc phục:**
    - Thiết lập CSP chỉ cho phép tài nguyên (script/style/image...) từ nguồn tin cậy.
    - Không cho phép `inline script` và nguồn động nếu không thực sự cần thiết.
    - Luôn kiểm thử lại CSP sau thay đổi.

---

### 3. **Enable server certificate validation on this SSL/TLS connection.**

    (Lỗi này lặp lại 2 lần trong danh sách)

- **Giải thích:**  
    Kết nối SSL/TLS nhưng **không xác thực chứng chỉ máy chủ**, có thể bị tấn công Man-in-the-Middle (MITM).
- **Cách khắc phục:**
    - **Bắt buộc bật kiểm tra chứng chỉ SSL/TLS** ở cả client và application.
    - Từ chối kết nối nếu chứng chỉ không hợp lệ hoặc tự ký không tin cậy.

---

### 4. **Make sure this Azure Storage Account Key gets revoked, changed, and removed from the code.**

- **Giải thích:**  
    **Azure Storage Account Key** bị lộ trong mã nguồn, dễ bị lợi dụng đánh cắp dữ liệu hoặc chiếm quyền kiểm soát tài nguyên.
- **Cách khắc phục:**
    - Thu hồi (revoke) và thay mới key.
    - Xóa mọi key nhạy cảm khỏi mã và dùng **environment variables hoặc secrets manager** cho lưu trữ bảo mật.
    - Thiết lập quy trình quay vòng/đổi key định kỳ.

---

### 5. **Make sure this database password gets changed and removed from the code.**

- **Giải thích:**  
    **Database password** bị hard-code trong mã, có nguy cơ bị lộ khi chia sẻ code hoặc bị khai thác.
- **Cách khắc phục:**
    - Đổi mật khẩu ngay lập tức và không để mật khẩu trong code.
    - Lưu trữ mật khẩu qua môi trường bảo mật (**environment variable**, **vault/secrets manager**).

---

### 6. **Make sure this service account key gets revoked, changed, and removed from the code.**

- **Giải thích:**  
    **Service account key** xuất hiện trực tiếp trong code, rủi ro bị lộ hoặc mất kiểm soát tài nguyên dịch vụ.
- **Cách khắc phục:**
    - Thu hồi key đang bị lộ, tạo key mới.
    - Áp dụng **principle of least privilege** cho service account.
    - Lưu trữ key qua vault hoặc biến môi trường, không để trong code.

---

### 7. **Use at least 100,000 iterations and a state-of-the-art digest algorithm here.**

- **Giải thích:**  
    **Thuật toán băm/mã hóa mật khẩu** quá yếu, số vòng lặp nhỏ → dễ bị brute force.
- **Cách khắc phục:**
    - Sử dụng thuật toán **hiện đại và mạnh**: PBKDF2, bcrypt, Argon2.
    - Thiết lập số vòng lặp tối thiểu **100,000 iterations** (theo chuẩn đề xuất hiện nay).

---

### 8. **Use secure mode and padding scheme.**

- **Giải thích:**  
    Sử dụng **chế độ mã hóa** hoặc **padding không an toàn** có thể gây rò rỉ dữ liệu.
- **Cách khắc phục:**
    - Cấu hình chế độ mã hóa hiện đại (**AES-GCM, AES-CBC + IV ngẫu nhiên**).
    - Sử dụng padding scheme tiêu chuẩn (theo thư viện hoặc khuyến nghị bảo mật).

---

## 📋 Tóm tắt bảng

|Lỗi (Tiếng Anh)|Giải thích ngắn|Cách khắc phục chính|
|---|---|---|
|Change this code to use a stronger protocol.|Giao thức yếu|Dùng TLS mới nhất, tắt giao thức cũ|
|Content Security Policies should be restrictive...|CSP lỏng lẻo|Cấu hình CSP chặt chẽ|
|Enable server certificate validation...|Không xác thực SSL/TLS|Luôn bật xác thực chứng chỉ|
|Make sure ... Account Key gets revoked, changed, and removed from the code.|Lộ khóa/secret trong code|Thu hồi, đổi, lưu trữ vault|
|Make sure this database password...|Lộ database password|Đổi mật khẩu, xóa khỏi code, dùng vault|
|Make sure this service account key...|Lộ service account key|Thu hồi, đổi key, dùng vault|
|Use at least 100,000 iterations...|Hash yếu/vòng lặp thấp|Hash mạnh, số vòng lặp >= 100,000|
|Use secure mode and padding scheme.|Mode/padding không an toàn|Mode/padding hiện đại, IV ngẫu nhiên|

