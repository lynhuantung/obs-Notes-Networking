---
title: Báo cáo lỗ hổng bảo mật dự án AVN — 2025
date: 2025-09-17
domain: security
module: AVN, UHelp (SSF)
tags:
  - security
  - vulnerability
  - cwe
  - avn
  - sonar
  - hardcoded-secret
  - tls
  - csp
  - aes
verified: yes
---

# Báo cáo lỗ hổng bảo mật dự án AVN — 2025

## Tóm tắt

Dự án AVN trải qua 2 đợt phát hiện lỗ hổng bảo mật do công cụ quét tự động **SonarQube**:
- **Đợt 1** (17/09/2025): Phát hiện 8 lỗ hổng trên hệ thống AVN chính.
- **Đợt 2** (29/10/2025): Phát hiện 1 lỗ hổng trên module UHelp (SSF).

Tổng cộng **9 lỗ hổng** được ghi nhận — tất cả đều đã được đóng hoặc chấp nhận bỏ qua có chủ đích.

---

## ĐỢT 1 — 17/09/2025 | Phát hiện bởi: Sonar | Tác động: Hệ thống

---

### 1. Make sure this database password gets changed and removed from the code

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-798 |
| **Mức độ** | 🔴🔴 Critical |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Mật khẩu cơ sở dữ liệu được lưu trực tiếp trong mã nguồn có thể bị rò rỉ, cho phép kẻ tấn công truy cập trái phép vào hệ thống hoặc dữ liệu nhạy cảm.

**Cách khắc phục (nguyên văn):**
> Làm rối mã làm cho không thể nhìn pass trực tiếp

**Phạm vi ảnh hưởng (nguyên văn):**
> Không ảnh hưởng

**Notes:** _(trống)_

---

### 2. Make sure this Azure Storage Account Key gets revoked, changed, and removed from the code

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-798 |
| **Mức độ** | 🔴🔴 Critical |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Việc lưu trữ khóa tài khoản Azure trong mã nguồn có thể bị khai thác nếu mã bị rò rỉ, dẫn đến mất quyền kiểm soát tài nguyên trên đám mây.

**Cách khắc phục (nguyên văn):**
> Trong code có comment key của Azure -> xóa comment

**Phạm vi ảnh hưởng (nguyên văn):**
> Không ảnh hưởng

**Notes:** _(trống)_

---

### 3. Make sure this service account key gets revoked, changed, and removed from the code

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-798 |
| **Mức độ** | 🔴🔴 Critical |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Khóa tài khoản dịch vụ trong mã nguồn có thể bị lạm dụng để truy cập API hoặc dữ liệu nhạy cảm, gây nguy cơ chiếm quyền điều khiển dịch vụ.

**Cách khắc phục (nguyên văn):**
> Xoá khoá tài khoản dịch vụ khỏi mã nguồn, cấp phát qua Secret Manager

**Phạm vi ảnh hưởng (nguyên văn):**
> Không ảnh hưởng

**Notes:** _(trống)_

---

### 4. Change this code to use a stronger protocol

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-327 |
| **Mức độ** | 🟠 High |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Sử dụng thuật toán hoặc giao thức mã hóa yếu (như MD5, SHA1, TLS 1.0/1.1) làm giảm an toàn, có thể bị tấn công giải mã hoặc trung gian.

**Cách khắc phục (nguyên văn):**
> Chỉ sử dụng TLS 1.2 trở lên; loại bỏ TLS 1.1/SSLv3

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến tất cả kết nối khi chỉ hổ trợ TLS 1.2 trở xuống

**Notes:** _(trống)_

---

### 5. Enable server certificate validation on this SSL/TLS connection

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-295 |
| **Mức độ** | 🟠 High |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Không xác thực chứng chỉ máy chủ khiến ứng dụng dễ bị tấn công "man-in-the-middle", cho phép kẻ tấn công đánh cắp hoặc thay đổi dữ liệu truyền.

**Cách khắc phục (nguyên văn):**
> Không chấp nhận chứng chỉ tự ký/hết hạn.

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến kết nối không có https, hoặc https có SSL/TLS không hợp lệ

**Notes:** _(trống)_

---

### 6. Use at least 100,000 iterations and a state-of-the-art digest algorithm here

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-916 |
| **Mức độ** | 🟠 High |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Sử dụng thuật toán băm mật khẩu yếu hoặc số vòng lặp ít khiến mật khẩu dễ bị dò tìm bằng tấn công brute-force.

**Cách khắc phục (nguyên văn):**
> Bỏ qua

**Phạm vi ảnh hưởng (nguyên văn):**
> Không ảnh hưởng

**Notes:**
> Chấp nhận ngoại lệ do ràng buộc tương thích giải mã (decrypt compatibility).
> - Giữ nguyên cơ chế KDF cũ để tương thích dữ liệu.
> - Đã đánh giá tác động hiệu năng nếu tăng iterations lên 100k là đáng kể.

---

### 7. Use secure mode and padding scheme

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-329 |
| **Mức độ** | 🟠 High |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Sử dụng chế độ mã hóa hoặc lược đồ padding không an toàn (ví dụ ECB, PKCS#5 sai) có thể làm lộ mẫu dữ liệu hoặc tạo điều kiện cho tấn công giải mã.

**Cách khắc phục (nguyên văn):**
> Thay AesManaged() bằng Aes.Create().

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến gởi email

**Notes:** _(trống)_

---

### 8. Content Security Policies should be restrictive to mitigate the risk of content injection attacks

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 17/09/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | Hệ thống |
| **Mã lỗ hổng** | CWE-1021 |
| **Mức độ** | 🔴🔴 Critical |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> CSP cấu hình không chặt chẽ có thể cho phép chèn mã độc (XSS), khiến người dùng bị đánh cắp thông tin hoặc chiếm quyền phiên đăng nhập.

**Cách khắc phục (nguyên văn):**
> Bổ sung chính sách: script-src 'self' 'nonce-{nonce}' 'strict-dynamic'.
> - Ràng buộc chỉ chấp nhận khi không có lỗi xác thực chứng chỉ (ServerCertificateCustomValidationCallback)

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến các link thư viện js trong source phải là nguồn tin cậy, và các kết nối không phải https

**Notes:** _(trống)_

---

## ĐỢT 2 — 29/10/2025 | Phát hiện bởi: Sonar | Tác động: UHelp (SSF)

---

### 9. Enable server certificate validation on this SSL/TLS connection

| Thuộc tính | Chi tiết |
|---|---|
| **Đợt phát hiện** | 29/10/2025 |
| **Phát hiện bởi** | Sonar |
| **Tác động** | UHelp (SSF) |
| **Mã lỗ hổng** | CWE-295 |
| **Mức độ** | 🟠 High |
| **Trạng thái** | ✅ Đã đóng / Bỏ qua |

**Mô tả (nguyên văn):**
> Không xác thực chứng chỉ máy chủ khiến ứng dụng dễ bị tấn công "man-in-the-middle", cho phép kẻ tấn công đánh cắp hoặc thay đổi dữ liệu truyền.

**Cách khắc phục (nguyên văn):**
> Không chấp nhận chứng chỉ tự ký/hết hạn.

**Phạm vi ảnh hưởng (nguyên văn):**
> Ảnh hưởng đến kết nối không có https, hoặc https có SSL/TLS không hợp lệ

**Notes:** _(trống)_

---

## Tổng hợp

| # | Tiêu đề | Mã lỗ hổng | Mức độ | Tác động | Trạng thái |
|---|---|---|---|---|---|
| 1 | Make sure this database password gets changed and removed from the code | CWE-798 | 🔴🔴 Critical | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 2 | Make sure this Azure Storage Account Key gets revoked, changed, and removed from the code | CWE-798 | 🔴🔴 Critical | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 3 | Make sure this service account key gets revoked, changed, and removed from the code | CWE-798 | 🔴🔴 Critical | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 4 | Change this code to use a stronger protocol | CWE-327 | 🟠 High | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 5 | Enable server certificate validation on this SSL/TLS connection (Đợt 1) | CWE-295 | 🟠 High | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 6 | Use at least 100,000 iterations and a state-of-the-art digest algorithm here | CWE-916 | 🟠 High | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 7 | Use secure mode and padding scheme | CWE-329 | 🟠 High | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 8 | Content Security Policies should be restrictive to mitigate the risk of content injection attacks | CWE-1021 | 🔴🔴 Critical | Hệ thống | ✅ Đã đóng / Bỏ qua |
| 9 | Enable server certificate validation on this SSL/TLS connection (Đợt 2) | CWE-295 | 🟠 High | UHelp (SSF) | ✅ Đã đóng / Bỏ qua |

---

## Bài học / Lưu ý

- **Hardcoded secrets (CWE-798)**: Tuyệt đối không lưu password DB, Azure key, service account key trực tiếp trong mã nguồn — kể cả trong comment. Cần sử dụng Secret Manager hoặc biến môi trường được mã hóa.
- **TLS/SSL (CWE-327, CWE-295)**: Chỉ dùng TLS 1.2 trở lên; bật xác thực chứng chỉ máy chủ; không bỏ qua lỗi SSL. Lỗ hổng này xuất hiện ở cả 2 đợt (Hệ thống và UHelp SSF).
- **KDF / Hashing (CWE-916)**: Đã chấp nhận ngoại lệ do ràng buộc tương thích — cần ghi rõ lý do accept risk và đánh giá lại khi refactor.
- **AES Padding (CWE-329)**: Tránh dùng `AesManaged()` — thay bằng `Aes.Create()` để đảm bảo chế độ mã hóa và padding scheme an toàn theo chuẩn hiện hành.
- **CSP (CWE-1021)**: Cấu hình CSP chặt chẽ, dùng nonce/hash thay vì `unsafe-inline`; kiểm tra kỹ các nguồn thư viện JS bên ngoài.
- **Tái xuất hiện**: CWE-295 xuất hiện ở cả 2 đợt trên 2 module khác nhau → cần có checklist bảo mật chuẩn áp dụng toàn dự án, không chỉ fix từng module riêng lẻ.
